# Haftalık 3D fetüs modelleri

`gen.js` 5–40. haftaların stilize modellerini (`hafta_NN.glb`) üretir; 1–4. haftalar elle hazırlanmış modellerdir.

```
node gen.js raw              # tüm haftalar (veya: node gen.js raw 12 20 40)
npx @gltf-transform/cli@4.1.1 simplify raw/hafta_20.glb t.glb --ratio 0.18 --error 0.001
npx @gltf-transform/cli@4.1.1 quantize t.glb ../../assets/3d/models/hafta_20.glb --quantize-normal 8 --quantize-position 12
```
