# 3D haftalık görsel paketi – ChatGPT için istek

## 1) 40 adet haftalık görsel (şimdi gerekli)

ChatGPT'ye aşağıdaki metni verin. Her seferinde 4–5 hafta isteyin, ilk görselin stilini
"aynı stil, aynı kadın, aynı kamera açısı" diye sonrakilere hatırlatın.

```
Bir hamilelik uygulaması için 40 haftalık bir görsel serisi hazırlıyoruz.
Her hafta için 1 kare (1:1, 1080x1080) görsel üret.

Stil: yumuşak 3D render (Pixar / clay tarzı), pastel pembe-krem arka plan,
yumuşak stüdyo ışığı. Tıbbi ama sevimli, korkutucu değil, kan veya organ detayı yok.

Kompozisyon (her karede aynı):
- Solda, yandan görünen hamile bir kadın silüeti (aynı kadın, aynı kıyafet, aynı poz).
  Karnı haftaya uygun büyüklükte.
- Karnın içinde yarı saydam bir pencereden görünen bebek (rahim içinde, amniyon kesesi).
  Bebeğin boyu ve gelişimi o haftaya bilimsel olarak uygun.
- Sağda, bebeğin o haftaki gerçek boyuyla karşılaştırma için tek bir meyve/sebze
  (ör. 12. hafta erik, 20. hafta muz, 40. hafta karpuz).
- Görselin üzerinde HİÇBİR yazı, rakam veya logo olmasın (uygulama yazıyı kendisi ekler).

Şimdi 1–5. haftaları üret.
```

Dosya adları: `w01.png`, `w02.png` … `w40.png` (iki haneli).
Hepsini bir klasöre koyup bana klasör yolunu söyleyin; boyutlandırıp sıkıştırıp
`assets/3d/` içine ben eklerim. Uygulama, görseli olmayan haftalarda eski fotoğrafı gösterir;
yani paket parça parça da gelebilir.

Kontrol listesi:
- [ ] 40 görselin hepsinde aynı kadın, aynı açı, aynı arka plan
- [ ] Hiçbir görselde yazı yok
- [ ] Bebek boyu haftalar ilerledikçe düzenli büyüyor
- [ ] 1–3. haftalarda bebek yok / çok küçük hücre (gerçekçi)

## 2) Döndürülebilir 3D model (sonra)

ChatGPT gerçek bir 3D model dosyası (.glb) üretemez. Seçenekler:
- **Sketchfab / CGTrader**'dan "pregnancy" veya "fetus development" modeli satın almak
  (ticari kullanım lisansı olmalı).
- Bir 3D tasarımcıya (Fiverr vb.) yaptırmak.

Modelden istenenler:
- Format: **.glb**, toplam boyut en fazla ~10 MB
- Tek model: hamile kadın + karnın içinde bebek (karın yarı saydam)
- Bir animasyon: 0. saniye = 1. hafta, 40. saniye = 40. hafta
  (karın ve bebek bu animasyonda büyür). Uygulama haftaya göre animasyonun o saniyesini gösterir.
  Bu yapılamıyorsa: hafta başına ayrı küçük .glb'ler de olur.

Model gelince uygulamaya "Döndür" butonunu ve 3D görüntüleyiciyi ekleyeceğim.
