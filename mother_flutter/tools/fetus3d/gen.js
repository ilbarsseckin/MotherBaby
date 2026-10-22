// Haftalık stilize 3D fetüs/embriyo modelleri (GLB) – SDF + surface nets.
// Kullanım: node gen.js <çıktı_klasörü> [hafta ...]
'use strict';
const fs = require('fs');
const path = require('path');

// ---------- vektör yardımcıları ----------
const add = (a, b) => [a[0] + b[0], a[1] + b[1], a[2] + b[2]];
const sub = (a, b) => [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
const mul = (a, s) => [a[0] * s, a[1] * s, a[2] * s];
const dot = (a, b) => a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
const cross = (a, b) => [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]];
const len = (a) => Math.hypot(a[0], a[1], a[2]);
const norm = (a) => { const l = len(a) || 1; return [a[0] / l, a[1] / l, a[2] / l]; };
const lerp = (a, b, t) => a + (b - a) * t;
const lerp3 = (a, b, t) => [lerp(a[0], b[0], t), lerp(a[1], b[1], t), lerp(a[2], b[2], t)];
const clamp = (x, a, b) => Math.max(a, Math.min(b, x));
const sstep = (a, b, x) => { const t = clamp((x - a) / (b - a), 0, 1); return t * t * (3 - 2 * t); };
const deg = Math.PI / 180;

// ---------- SDF ilkelleri ----------
function sphere(c, r) {
  return { f: (p) => len(sub(p, c)) - r, min: sub(c, [r, r, r]), max: add(c, [r, r, r]) };
}
function basis(dir, upHint = [0, 1, 0]) {
  const a = norm(dir);
  let b = cross(upHint, a);
  if (len(b) < 1e-4) b = cross([0, 0, 1], a);
  b = norm(b);
  const c = norm(cross(a, b));
  return [a, c, b]; // a: ana eksen, c: "yukarı", b: yan
}
// Döndürülmüş elipsoit; axes: 3 dik birim vektör, rad: o eksenlerdeki yarıçaplar.
function ellipsoid(c, rad, axes = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]) {
  const m = Math.max(...rad);
  return {
    f: (p) => {
      const d = sub(p, c);
      const q = [dot(d, axes[0]) / rad[0], dot(d, axes[1]) / rad[1], dot(d, axes[2]) / rad[2]];
      const k0 = len(q);
      const k1 = Math.hypot(q[0] / rad[0], q[1] / rad[1], q[2] / rad[2]);
      return k1 === 0 ? -Math.min(...rad) : (k0 * (k0 - 1)) / k1;
    },
    min: sub(c, [m, m, m]), max: add(c, [m, m, m]),
  };
}
function capsule(a, b, ra, rb = ra) {
  const ba = sub(b, a), bb = dot(ba, ba) || 1e-9, m = Math.max(ra, rb);
  return {
    f: (p) => {
      const pa = sub(p, a);
      const h = clamp(dot(pa, ba) / bb, 0, 1);
      return len(sub(pa, mul(ba, h))) - lerp(ra, rb, h);
    },
    min: [Math.min(a[0], b[0]) - m, Math.min(a[1], b[1]) - m, Math.min(a[2], b[2]) - m],
    max: [Math.max(a[0], b[0]) + m, Math.max(a[1], b[1]) + m, Math.max(a[2], b[2]) + m],
  };
}
const smin = (a, b, k) => { const h = clamp(0.5 + (0.5 * (b - a)) / k, 0, 1); return lerp(b, a, h) - k * h * (1 - h); };
const smax = (a, b, k) => -smin(-a, -b, k);
function boxDist(p, mn, mx) {
  const dx = Math.max(mn[0] - p[0], 0, p[0] - mx[0]);
  const dy = Math.max(mn[1] - p[1], 0, p[1] - mx[1]);
  const dz = Math.max(mn[2] - p[2], 0, p[2] - mx[2]);
  return Math.hypot(dx, dy, dz);
}

// Sıralı birleştirme / çıkarma işlemlerinden oluşan şekil.
class Shape {
  constructor() { this.ops = []; }
  u(prim, k) { this.ops.push({ t: 'u', prim, k }); return this; }
  s(prim, k) { this.ops.push({ t: 's', prim, k }); return this; }
  sdf(p) {
    let d = 1e9;
    for (const o of this.ops) {
      const bd = boxDist(p, o.prim.min, o.prim.max);
      if (o.t === 'u') {
        if (bd >= d + o.k) continue;
        d = d === 1e9 ? o.prim.f(p) : smin(d, o.prim.f(p), o.k);
      } else {
        if (bd >= -d + o.k) continue;
        d = smax(d, -o.prim.f(p), o.k);
      }
    }
    return d;
  }
  bounds(pad) {
    const mn = [1e9, 1e9, 1e9], mx = [-1e9, -1e9, -1e9];
    for (const o of this.ops) if (o.t === 'u') for (let i = 0; i < 3; i++) {
      mn[i] = Math.min(mn[i], o.prim.min[i] - o.k); mx[i] = Math.max(mx[i], o.prim.max[i] + o.k);
    }
    return [sub(mn, [pad, pad, pad]), add(mx, [pad, pad, pad])];
  }
}

// ---------- surface nets ----------
function polygonize(shape, h) {
  const [mn, mx] = shape.bounds(2 * h);
  const nx = Math.ceil((mx[0] - mn[0]) / h) + 1, ny = Math.ceil((mx[1] - mn[1]) / h) + 1, nz = Math.ceil((mx[2] - mn[2]) / h) + 1;
  const V = new Float32Array(nx * ny * nz);
  const id = (i, j, k) => i + nx * (j + ny * k);
  for (let k = 0; k < nz; k++) for (let j = 0; j < ny; j++) for (let i = 0; i < nx; i++)
    V[id(i, j, k)] = shape.sdf([mn[0] + i * h, mn[1] + j * h, mn[2] + k * h]);
  const cx = nx - 1, cy = ny - 1;
  const cid = (i, j, k) => i + cx * (j + cy * k);
  const cellV = new Int32Array(cx * cy * (nz - 1)).fill(-1);
  const corners = [[0, 0, 0], [1, 0, 0], [0, 1, 0], [1, 1, 0], [0, 0, 1], [1, 0, 1], [0, 1, 1], [1, 1, 1]];
  const edges = [[0, 1], [2, 3], [4, 5], [6, 7], [0, 2], [1, 3], [4, 6], [5, 7], [0, 4], [1, 5], [2, 6], [3, 7]];
  const pos = [];
  for (let k = 0; k < nz - 1; k++) for (let j = 0; j < ny - 1; j++) for (let i = 0; i < nx - 1; i++) {
    const v = corners.map((c) => V[id(i + c[0], j + c[1], k + c[2])]);
    let neg = 0; for (const x of v) if (x < 0) neg++;
    if (neg === 0 || neg === 8) continue;
    let s = [0, 0, 0], n = 0;
    for (const [a, b] of edges) {
      if ((v[a] < 0) === (v[b] < 0)) continue;
      const t = v[a] / (v[a] - v[b]);
      s = add(s, lerp3(corners[a], corners[b], t)); n++;
    }
    s = mul(s, 1 / n);
    cellV[cid(i, j, k)] = pos.length;
    pos.push([mn[0] + (i + s[0]) * h, mn[1] + (j + s[1]) * h, mn[2] + (k + s[2]) * h]);
  }
  const grad = (p) => {
    const e = h * 0.5;
    return norm([
      shape.sdf([p[0] + e, p[1], p[2]]) - shape.sdf([p[0] - e, p[1], p[2]]),
      shape.sdf([p[0], p[1] + e, p[2]]) - shape.sdf([p[0], p[1] - e, p[2]]),
      shape.sdf([p[0], p[1], p[2] + e]) - shape.sdf([p[0], p[1], p[2] - e]),
    ]);
  };
  // Yüzeye yaklaştır.
  for (let it = 0; it < 2; it++) for (let v = 0; v < pos.length; v++) {
    const d = shape.sdf(pos[v]);
    if (Math.abs(d) > h) continue;
    pos[v] = sub(pos[v], mul(grad(pos[v]), d));
  }
  const nrm = pos.map(grad);
  const tris = [];
  const dims = [nx, ny, nz];
  for (let k = 0; k < nz; k++) for (let j = 0; j < ny; j++) for (let i = 0; i < nx; i++) {
    const p = [i, j, k];
    for (let a = 0; a < 3; a++) {
      const b = (a + 1) % 3, c = (a + 2) % 3;
      if (p[a] >= dims[a] - 1 || p[b] < 1 || p[c] < 1 || p[b] >= dims[b] - 1 || p[c] >= dims[c] - 1) continue;
      const q = p.slice(); q[a]++;
      const v0 = V[id(...p)], v1 = V[id(...q)];
      if ((v0 < 0) === (v1 < 0)) continue;
      const quad = [[-1, -1], [0, -1], [0, 0], [-1, 0]].map(([db, dc]) => {
        const cc = p.slice(); cc[b] += db; cc[c] += dc;
        return cellV[cid(...cc)];
      });
      if (quad.some((x) => x < 0)) continue;
      let [q0, q1, q2, q3] = quad;
      const fn = cross(sub(pos[q1], pos[q0]), sub(pos[q2], pos[q0]));
      const avg = add(add(nrm[q0], nrm[q1]), add(nrm[q2], nrm[q3]));
      if (dot(fn, avg) < 0) { [q1, q3] = [q3, q1]; }
      tris.push(q0, q1, q2, q0, q2, q3);
    }
  }
  return { pos, nrm, tris };
}

// ---------- basit ağlar ----------
function uvSphere(c, rad, axes, seg = 48, ring = 32) {
  const pos = [], nrm = [], tris = [];
  for (let r = 0; r <= ring; r++) {
    const th = (r / ring) * Math.PI;
    for (let s = 0; s <= seg; s++) {
      const ph = (s / seg) * 2 * Math.PI;
      const u = [Math.sin(th) * Math.cos(ph), Math.cos(th), Math.sin(th) * Math.sin(ph)];
      const off = add(add(mul(axes[0], u[0] * rad[0]), mul(axes[1], u[1] * rad[1])), mul(axes[2], u[2] * rad[2]));
      pos.push(add(c, off));
      nrm.push(norm(add(add(mul(axes[0], u[0] / rad[0]), mul(axes[1], u[1] / rad[1])), mul(axes[2], u[2] / rad[2]))));
    }
  }
  for (let r = 0; r < ring; r++) for (let s = 0; s < seg; s++) {
    const a = r * (seg + 1) + s, b = a + seg + 1;
    tris.push(a, a + 1, b, a + 1, b + 1, b);
  }
  return { pos, nrm, tris };
}
function tube(curve, radius, segs = 64, sides = 14) {
  const pos = [], nrm = [], tris = [], us = [];
  let prevB = null;
  for (let i = 0; i <= segs; i++) {
    const t = i / segs, p = curve(t);
    const tan = norm(sub(curve(Math.min(1, t + 0.01)), curve(Math.max(0, t - 0.01))));
    let b = prevB ? norm(sub(prevB, mul(tan, dot(prevB, tan)))) : basis(tan)[2];
    prevB = b;
    const n = cross(tan, b);
    for (let s = 0; s <= sides; s++) {
      const a = (s / sides) * 2 * Math.PI;
      const d = add(mul(b, Math.cos(a)), mul(n, Math.sin(a)));
      pos.push(add(p, mul(d, radius(t)))); nrm.push(d); us.push([t, a]);
    }
  }
  for (let i = 0; i < segs; i++) for (let s = 0; s < sides; s++) {
    const a = i * (sides + 1) + s, b = a + sides + 1;
    tris.push(a, b, a + 1, a + 1, b, b + 1);
  }
  return { pos, nrm, tris, us };
}
const bez = (P) => (t) => {
  const u = 1 - t;
  return add(add(mul(P[0], u * u * u), mul(P[1], 3 * u * u * t)), add(mul(P[2], 3 * u * t * t), mul(P[3], t * t * t)));
};
function hash3(p) { // basit gürültü
  const s = Math.sin(p[0] * 127.1 + p[1] * 311.7 + p[2] * 74.7) * 43758.5453;
  return s - Math.floor(s);
}
function vnoise(p, f) {
  const q = mul(p, f), i = q.map(Math.floor), fr = sub(q, i);
  const w = fr.map((x) => x * x * (3 - 2 * x));
  let r = 0;
  for (let dz = 0; dz < 2; dz++) for (let dy = 0; dy < 2; dy++) for (let dx = 0; dx < 2; dx++) {
    const v = hash3([i[0] + dx, i[1] + dy, i[2] + dz]);
    r += v * (dx ? w[0] : 1 - w[0]) * (dy ? w[1] : 1 - w[1]) * (dz ? w[2] : 1 - w[2]);
  }
  return r;
}

// ---------- fetüs (9–40. hafta) ----------
function fetus(w) {
  const t = clamp((w - 9) / 31, 0, 1);
  const chub = sstep(22, 38, w);
  const headR = lerp(0.29, 0.205, Math.pow(t, 0.8));
  const limb = lerp(0.72, 1.0, sstep(9, 26, w));
  const torsoR = lerp(0.14, 0.235, chub) + 0.01 * t;
  const ra = lerp(0.036, 0.07, chub) + 0.004 * t;
  const rl = lerp(0.048, 0.097, chub) + 0.004 * t;
  const S = new Shape();
  const marks = {}; // renklendirme için noktalar

  // Baş
  const headC = [0.03, 0.5 - headR * 1.02, 0];
  const fd = norm([1, -0.32, 0]), hu = norm([0.32, 1, 0]), sd = [0, 0, 1];
  const H = (a, b, c) => add(add(add(headC, mul(fd, a * headR)), mul(hu, b * headR)), mul(sd, c * headR));
  const hax = [fd, hu, sd];
  S.u(ellipsoid(H(-0.05, 0.05, 0), [headR, headR, headR * 0.88], hax), 0.01);
  S.u(sphere(H(-0.35, 0.1, 0), headR * 0.75), headR * 0.2);
  S.u(sphere(H(0.42, 0.33, 0), headR * 0.6), headR * 0.25);
  S.u(ellipsoid(H(0.45, -0.38, 0), [headR * 0.55, headR * 0.52, headR * 0.6], hax), headR * 0.25);
  S.u(capsule(H(0.86, 0.02, 0), H(0.97, -0.24, 0), headR * 0.06, headR * 0.09), headR * 0.08);
  S.u(ellipsoid(H(0.98, -0.3, 0), [headR * 0.11, headR * 0.11, headR * 0.14], hax), headR * 0.07);
  for (const z of [-1, 1]) {
    S.u(sphere(H(0.95, -0.33, z * 0.09), headR * 0.06), headR * 0.05); // burun kanatları
    S.u(sphere(H(0.7, -0.44, z * 0.38), headR * lerp(0.24, 0.37, chub)), headR * 0.14); // yanak
  }
  S.u(sphere(H(0.76, -0.8, 0), headR * 0.2), headR * 0.12); // çene
  S.u(ellipsoid(H(0.96, -0.56, 0), [headR * 0.08, headR * 0.06, headR * 0.17], hax), headR * 0.05); // üst dudak
  S.u(ellipsoid(H(0.91, -0.67, 0), [headR * 0.07, headR * 0.055, headR * 0.14], hax), headR * 0.05); // alt dudak
  S.s(capsule(H(1.0, -0.615, -0.15), H(1.0, -0.615, 0.15), headR * 0.018), headR * 0.025); // ağız çizgisi
  for (const z of [-1, 1]) {
    S.s(sphere(H(0.82, -0.02, z * 0.34), headR * 0.17), headR * 0.07); // göz çukuru
    S.u(ellipsoid(H(0.8, -0.04, z * 0.34), [headR * 0.1, headR * 0.115, headR * 0.15], hax), headR * 0.035); // kapalı göz kapağı
    S.u(capsule(H(0.84, 0.17, z * 0.22), H(0.78, 0.15, z * 0.48), headR * 0.05), headR * 0.06); // kaş kemeri
    if (w >= 10) {
      const es = lerp(0.7, 1.0, sstep(10, 24, w));
      const ea = [hu, fd, mul(sd, z)];
      S.u(ellipsoid(H(-0.12, -0.2, z * 0.86), [headR * 0.3 * es, headR * 0.2 * es, headR * 0.09], ea), headR * 0.05);
      S.s(sphere(H(-0.08, -0.24, z * 0.99), headR * 0.1 * es), headR * 0.03);
    }
  }
  marks.eyes = [-1, 1].map((z) => H(0.88, -0.04, z * 0.34));
  marks.cheeks = [-1, 1].map((z) => H(0.82, -0.47, z * 0.38));
  marks.lips = H(0.97, -0.61, 0);
  marks.headR = headR;

  // Gövde (C şeklinde omurga)
  const yTop = headC[1] - headR * 0.82;
  const L = yTop + 0.5;
  const spine = (s) => [-0.13 * Math.sin(Math.PI * s) - 0.01, yTop - s * L, 0];
  S.u(capsule(H(-0.1, -0.8, 0), spine(0.02), torsoR * 0.62, torsoR * 0.8), torsoR * 0.35);
  for (let i = 0; i <= 10; i++) {
    const s = i / 10, r = torsoR * (0.9 + 0.2 * Math.sin(Math.PI * Math.min(1, s * 1.1)));
    S.u(ellipsoid(add(spine(s), [0.04 * Math.sin(Math.PI * s), 0, 0]), [r, r * 0.9, r * 0.92]), torsoR * 0.45);
  }
  S.u(sphere(add(spine(0.62), [torsoR * 0.55, 0, 0]), torsoR * 0.78), torsoR * 0.4); // karın
  for (const z of [-1, 1]) S.u(sphere(add(spine(0.95), [-0.03, 0.01, z * torsoR * 0.45]), torsoR * 0.66), torsoR * 0.3); // kalça

  // Kollar
  const hands = [];
  for (const z of [1, -1]) {
    const Sh = add(spine(0.1), [0.02, -0.02, z * torsoR * 0.92]);
    const E = add(Sh, mul(z > 0 ? [0.1, -0.17, 0.06] : [0.06, -0.19, -0.05], limb));
    const W = add(E, mul(z > 0 ? [0.14, 0.18, -0.03] : [0.15, 0.07, 0.04], limb));
    S.u(capsule(Sh, E, ra * 1.08, ra * 0.88), ra * 0.6);
    S.u(capsule(E, W, ra * 0.88, ra * 0.72), ra * 0.5);
    const hd = norm(sub(W, E));
    const [a, up, side] = basis(hd, [0, 0, z]);
    const Hc = add(W, mul(hd, ra * 1.1));
    S.u(ellipsoid(Hc, [ra * 1.2, ra * 0.55, ra * 1.0], [a, up, side]), ra * 0.35);
    const fr = Math.max(ra * 0.27, 0.0125);
    if (w >= 10) {
      for (let f = 0; f < 4; f++) {
        const base = add(add(Hc, mul(a, ra * 0.9)), mul(side, (f - 1.5) * ra * 0.42));
        const mid = add(add(base, mul(a, ra * 0.6)), mul(up, -ra * 0.15));
        const tip = add(add(mid, mul(a, ra * 0.25)), mul(up, -ra * 0.45));
        S.u(capsule(base, mid, fr), fr * 0.6).u(capsule(mid, tip, fr, fr * 0.9), fr * 0.5);
      }
      const tb = add(add(Hc, mul(side, -ra * 0.85)), mul(a, ra * 0.1));
      S.u(capsule(tb, add(add(tb, mul(a, ra * 0.8)), mul(side, -ra * 0.25)), fr * 1.1, fr), fr * 0.6);
    }
    hands.push(Hc);
  }
  marks.hands = hands;

  // Bacaklar
  for (const z of [1, -1]) {
    const Hp = add(spine(0.86), [0.04, 0, z * torsoR * 0.68]);
    const K = add(Hp, mul([0.3, z > 0 ? 0.13 : 0.09, z * 0.05], limb));
    const A = add(K, mul([-0.04, -0.28, -z * 0.01], limb));
    S.u(capsule(Hp, K, rl * 1.12, rl * 0.84), rl * 0.6);
    S.u(capsule(K, A, rl * 0.84, rl * 0.58), rl * 0.4);
    const fdir = norm([1, -0.12, -z * 0.12]);
    const [a, up, side] = basis(fdir, [0, 1, 0]);
    const Fc = add(add(A, mul(fdir, rl * 0.85)), [0, -rl * 0.25, 0]);
    S.u(ellipsoid(Fc, [rl * 1.2, rl * 0.42, rl * 0.6], [a, up, side]), rl * 0.35);
    S.u(sphere(add(A, [-rl * 0.25, -rl * 0.3, 0]), rl * 0.48), rl * 0.3); // topuk
    if (w >= 12) for (let i = 0; i < 5; i++) {
      const tr = Math.max(rl * (i === 0 ? 0.2 : 0.15), 0.012);
      S.u(sphere(add(add(Fc, mul(a, rl * 1.15 - i * rl * 0.04)), mul(side, (i - 2) * rl * 0.24)), tr), tr * 0.6);
    }
  }

  const skin = polygonize(S, 0.0105);
  const base = lerp3([0.94, 0.6, 0.58], [0.97, 0.7, 0.6], sstep(16, 34, w));
  const blush = [0.93, 0.52, 0.52];
  skin.col = skin.pos.map((p) => {
    let c = base.slice();
    const n = vnoise(p, 18) - 0.5;
    c = c.map((x) => x + n * 0.03);
    for (const e of marks.eyes) {
      const d = sub(p, e);
      if (len(d) < headR * 0.16 && Math.abs(dot(d, hu)) < headR * 0.022) c = lerp3(c, [0.45, 0.28, 0.3], 0.75);
    }
    for (const q of marks.cheeks) c = lerp3(c, blush, 0.45 * (1 - sstep(0, headR * 0.3, len(sub(p, q)))));
    c = lerp3(c, [0.86, 0.45, 0.47], 0.7 * (1 - sstep(headR * 0.06, headR * 0.16, len(sub(p, marks.lips)))));
    for (const q of marks.hands) c = lerp3(c, blush, 0.18 * (1 - sstep(0, 0.06, len(sub(p, q)))));
    return c;
  });
  return { skin, S, belly: add(spine(0.66), [torsoR * 1.2, 0, 0]), cordR: lerp(0.018, 0.03, t), w };
}

// ---------- embriyo (5–8. hafta) ----------
function embryo(w) {
  const e = clamp((w - 5) / 3, 0, 1);
  const S = new Shape();
  const R = 0.3;
  const arc = (th) => [R * Math.cos(th * deg), R * Math.sin(th * deg), 0];
  const th0 = 55, th1 = lerp(330, 285, e);
  const rAt = (u) => lerp(0.17, 0.035, Math.pow(u, 1.3));
  for (let th = th0; th <= th1; th += 6) {
    const u = (th - th0) / (th1 - th0);
    S.u(sphere(arc(th), rAt(u) * lerp(1, 1.1, e)), 0.05);
  }
  const rh = lerp(0.22, 0.27, e);
  const headC = add(arc(60), [0.02, 0.04, 0]);
  S.u(sphere(headC, rh), 0.06);
  S.u(sphere(add(headC, [0.1, -0.12, 0]), rh * 0.72), 0.06); // ön beyin / yüz
  if (w <= 7) for (let i = 0; i < 3; i++) S.u(ellipsoid(add(headC, [0.12 - i * 0.02, -0.24 - i * 0.05, 0]), [0.05, 0.03, 0.11]), 0.02);
  const heart = [0.13, -0.05, 0];
  S.u(sphere(heart, lerp(0.15, 0.12, e)), 0.06);
  if (w <= 6.5) for (let th = 120; th < 290; th += 14) S.u(sphere(mul(arc(th), 1.32), 0.028), 0.02); // somitler
  if (w >= 6) for (const z of [-1, 1]) {
    const len_ = lerp(0.04, 0.16, sstep(6, 8, w));
    const a0 = add(arc(150), [0.06, 0, z * 0.12]);
    S.u(capsule(a0, add(a0, [len_, -len_ * 0.4, z * 0.03]), 0.045, 0.04), 0.03);
    if (w >= 7.5) S.u(ellipsoid(add(a0, [len_ + 0.03, -len_ * 0.45, z * 0.03]), [0.05, 0.035, 0.02]), 0.02);
  }
  if (w >= 7) for (const z of [-1, 1]) {
    const len_ = lerp(0.04, 0.12, sstep(7, 8.5, w));
    const l0 = add(arc(245), [0.04, 0.02, z * 0.1]);
    S.u(capsule(l0, add(l0, [len_, 0.02, z * 0.03]), 0.05, 0.04), 0.03);
  }
  const skin = polygonize(S, 0.0095);
  const eyes = [-1, 1].map((z) => add(headC, [0.13, -0.06, z * rh * 0.72]));
  skin.col = skin.pos.map((p) => {
    let c = [0.97, 0.72, 0.7].map((x) => x + (vnoise(p, 14) - 0.5) * 0.04);
    c = lerp3(c, [0.85, 0.32, 0.36], 0.75 * (1 - sstep(0.05, 0.16, len(sub(p, heart)))));
    for (const q of eyes) c = lerp3(c, [0.25, 0.14, 0.18], 1 - sstep(0.025, 0.045, len(sub(p, q))));
    return c;
  });
  return { skin, S, belly: add(arc(200), [0.2, 0, 0]), cordR: 0.022, w, yolk: lerp(0.15, 0.1, e) };
}

// ---------- sahne ----------
function scene(model) {
  const { skin, S } = model;
  const mn = [1e9, 1e9, 1e9], mx = [-1e9, -1e9, -1e9];
  for (const p of skin.pos) for (let i = 0; i < 3; i++) { mn[i] = Math.min(mn[i], p[i]); mx[i] = Math.max(mx[i], p[i]); }
  const C = mul(add(mn, mx), 0.5);
  let sacR = 0;
  for (const p of skin.pos) sacR = Math.max(sacR, len(sub(p, C)));
  sacR *= 1.16;
  const meshes = [];
  meshes.push({ ...skin, mat: { name: 'Deri', color: [1, 1, 1, 1], rough: 0.5 } });

  // Plasenta
  const pd = norm([-1, 0.45, -0.55]);
  const Pc = add(C, mul(pd, sacR * 0.93));
  const [pa, pu, ps] = basis(pd, [0, 1, 0]);
  const pl = uvSphere(Pc, [sacR * 0.07, sacR * 0.42, sacR * 0.38], [pa, pu, ps], 40, 24);
  pl.col = pl.pos.map((p) => { const n = vnoise(p, 22); return lerp3([0.5, 0.1, 0.14], [0.78, 0.27, 0.3], n); });
  meshes.push({ ...pl, mat: { name: 'Plasenta', color: [1, 1, 1, 1], rough: 0.4 } });

  // Göbek kordonu
  const P0 = model.belly, P3 = add(Pc, mul(pd, -sacR * 0.06));
  const curve = bez([P0, add(P0, [0.22, -0.18, 0.28]), add(P3, [0.15, -0.3, 0.25]), P3]);
  const cord = tube(curve, () => model.cordR, 80, 14);
  cord.col = cord.us.map(([u, a]) => lerp3([0.78, 0.82, 0.92], [0.93, 0.72, 0.76], 0.5 + 0.5 * Math.sin(a * 3 + u * 60)));
  meshes.push({ ...cord, mat: { name: 'Gobek_kordonu', color: [1, 1, 1, 1], rough: 0.35 } });

  // Sarı kese (embriyo)
  if (model.yolk) {
    const yc = add(C, mul(norm([0.75, -0.55, 0.35]), sacR * 0.72));
    const ys = uvSphere(yc, [model.yolk, model.yolk, model.yolk], [[1, 0, 0], [0, 1, 0], [0, 0, 1]], 32, 20);
    ys.col = ys.pos.map(() => [0.98, 0.84, 0.45]);
    meshes.push({ ...ys, mat: { name: 'Sari_kese', color: [1, 1, 1, 1], rough: 0.45 } });
    const st = tube(bez([model.belly, add(model.belly, [0.12, -0.12, 0.1]), add(yc, [-0.1, 0.05, -0.05]), yc]), () => 0.018, 30, 10);
    st.col = st.us.map(() => [0.95, 0.78, 0.6]);
    meshes.push({ ...st, mat: { name: 'Sari_kese_sapi', color: [1, 1, 1, 1], rough: 0.45 } });
  }

  // Amniyon kesesi (yarı saydam)
  const sac = uvSphere(C, [sacR, sacR, sacR], [[1, 0, 0], [0, 1, 0], [0, 0, 1]], 64, 40);
  meshes.push({ ...sac, mat: { name: 'Amniyon_kesesi', color: [1.0, 0.86, 0.9, 0.14], rough: 0.08, blend: true } });
  return meshes;
}

// ---------- GLB yazıcı ----------
const toLin = (c) => (c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4));
function writeGLB(file, meshes) {
  const chunks = [], bufferViews = [], accessors = [], materials = [], gltfMeshes = [], nodes = [];
  let off = 0;
  const pushView = (typed, target) => {
    const buf = Buffer.from(typed.buffer, typed.byteOffset, typed.byteLength);
    chunks.push(buf);
    const pad = (4 - (buf.length % 4)) % 4;
    if (pad) chunks.push(Buffer.alloc(pad));
    bufferViews.push({ buffer: 0, byteOffset: off, byteLength: buf.length, target });
    off += buf.length + pad;
    return bufferViews.length - 1;
  };
  for (const m of meshes) {
    const n = m.pos.length;
    const P = new Float32Array(n * 3), N = new Float32Array(n * 3);
    const mn = [1e9, 1e9, 1e9], mx = [-1e9, -1e9, -1e9];
    m.pos.forEach((p, i) => { for (let k = 0; k < 3; k++) { P[i * 3 + k] = p[k]; mn[k] = Math.min(mn[k], p[k]); mx[k] = Math.max(mx[k], p[k]); } });
    m.nrm.forEach((p, i) => { for (let k = 0; k < 3; k++) N[i * 3 + k] = p[k]; });
    const attrs = {};
    accessors.push({ bufferView: pushView(P, 34962), componentType: 5126, count: n, type: 'VEC3', min: mn, max: mx });
    attrs.POSITION = accessors.length - 1;
    accessors.push({ bufferView: pushView(N, 34962), componentType: 5126, count: n, type: 'VEC3' });
    attrs.NORMAL = accessors.length - 1;
    if (m.col) {
      const Cc = new Float32Array(n * 3);
      m.col.forEach((c, i) => { for (let k = 0; k < 3; k++) Cc[i * 3 + k] = toLin(clamp(c[k], 0, 1)); });
      accessors.push({ bufferView: pushView(Cc, 34962), componentType: 5126, count: n, type: 'VEC3' });
      attrs.COLOR_0 = accessors.length - 1;
    }
    const I = n > 65535 ? new Uint32Array(m.tris) : new Uint16Array(m.tris);
    accessors.push({ bufferView: pushView(I, 34963), componentType: n > 65535 ? 5125 : 5123, count: m.tris.length, type: 'SCALAR' });
    const mat = {
      name: m.mat.name,
      pbrMetallicRoughness: { baseColorFactor: m.mat.color, metallicFactor: 0, roughnessFactor: m.mat.rough },
    };
    if (m.mat.blend) mat.alphaMode = 'BLEND';
    materials.push(mat);
    gltfMeshes.push({ name: m.mat.name, primitives: [{ attributes: attrs, indices: accessors.length - 1, material: materials.length - 1 }] });
    nodes.push({ name: m.mat.name, mesh: gltfMeshes.length - 1 });
  }
  const bin = Buffer.concat(chunks);
  const json = {
    asset: { version: '2.0', generator: 'bebegim-fetus3d' },
    scene: 0, scenes: [{ nodes: nodes.map((_, i) => i) }],
    nodes, meshes: gltfMeshes, materials, accessors, bufferViews, buffers: [{ byteLength: bin.length }],
  };
  let js = Buffer.from(JSON.stringify(json));
  js = Buffer.concat([js, Buffer.alloc((4 - (js.length % 4)) % 4, 0x20)]);
  const header = Buffer.alloc(12);
  header.writeUInt32LE(0x46546c67, 0); header.writeUInt32LE(2, 4);
  header.writeUInt32LE(12 + 8 + js.length + 8 + bin.length, 8);
  const jh = Buffer.alloc(8); jh.writeUInt32LE(js.length, 0); jh.writeUInt32LE(0x4e4f534a, 4);
  const bh = Buffer.alloc(8); bh.writeUInt32LE(bin.length, 0); bh.writeUInt32LE(0x004e4942, 4);
  fs.writeFileSync(file, Buffer.concat([header, jh, js, bh, bin]));
}

// ---------- ana ----------
const out = process.argv[2] || 'out';
fs.mkdirSync(out, { recursive: true });
const weeks = process.argv.slice(3).map(Number);
for (const w of weeks.length ? weeks : Array.from({ length: 36 }, (_, i) => i + 5)) {
  const t0 = Date.now();
  const model = w < 9 ? embryo(w) : fetus(w);
  const file = path.join(out, `hafta_${String(w).padStart(2, '0')}.glb`);
  writeGLB(file, scene(model));
  console.log(file, model.skin.pos.length, 'köşe', ((Date.now() - t0) / 1000).toFixed(1) + 's', (fs.statSync(file).size / 1024).toFixed(0) + 'KB');
}
