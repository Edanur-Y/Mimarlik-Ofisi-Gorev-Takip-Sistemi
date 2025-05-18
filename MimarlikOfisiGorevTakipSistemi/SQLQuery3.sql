USE MimarlikOfisiGorevTakipSistemi

--1
SELECT Ad, Soyad, InsaatciFiyat
FROM Insaatcilar I
JOIN Ekipler E ON E.InsaatciID = I. InsaatciID
JOIN Gorevler G ON G.EkipID = E.EkipID
JOIN Alanlar A ON A.AlanID = G.AlanID
JOIN Detaylar D ON D.DetayID = G. DetayID
WHERE Taban > 100 AND KatSayisi < 3

--2
SELECT BinaTuru, KatSayisi, BolumSayisi, Bolumler
FROM Detaylar D
JOIN BinaTurleri BT ON BT.BinaTuruID = D.BinaTuruID
JOIN Bolumler B ON B.BolumlerID = D.BolumlerID
JOIN Gorevler G ON G.DetayID = D.DetayID
WHERE GorevAdý = 'Belediye Þantiyesi'

--3
SELECT Ad, Soyad, ZeminEtutcuFiyat
FROM ZeminEtutculer Z
JOIN Ekipler E ON E.ZeminEtutcuID = Z. ZeminEtutcuID
JOIN Gorevler G ON G.EkipID = E.EkipID
JOIN ArsaAdresleri A ON G.ArsaAdresiID = A.ArsaAdresiID
WHERE Mahalle = 'Yeni Mah.'

--4
SELECT YEAR(BaslangicTarihi) AS Yillar, SUM(Ucret) AS YillikToplamUcret
FROM Gorevler G
GROUP BY YEAR(BaslangicTarihi)

--5
SELECT GorevAdý, (Ucret - (HaritaciFiyat + ZeminEtutcuFiyat + InsaatciFiyat + ElekrtikciFiyat + MakineciFiyat)) AS GorevKazanci
FROM Ekipler E
JOIN Gorevler G ON G.EkipID = E.EkipID
ORDER BY GorevKazanci DESC

--6
SELECT Ad, Soyad, COUNT(E.HaritaciID) AS GorevAdedi
FROM Haritacilar H
JOIN Ekipler E ON E.HaritaciID = H.HaritaciID
GROUP BY Ad, Soyad
HAVING COUNT(E.HaritaciID) > 0

--7
SELECT GorevAdý, DATEDIFF(day, BaslangicTarihi, TeslimTarihi) AS GorevSuresi_gün
FROM Gorevler

--8
SELECT GorevAdý, Ad, Soyad
FROM Musteriler M
JOIN Gorevler G ON G.MusteriID = M. MusteriID
WHERE FaturaBiti = 0

--9
SELECT Ad, Soyad
FROM Makineciler M
JOIN Ekipler E ON E.MakineciID = M.MakineciID
JOIN Gorevler G ON G.EkipID = E.EkipID
JOIN Birimler B ON B.BirimID = G.BirimID
WHERE B.Birim = 'Mimari Proje'

--10
SELECT MONTH(BaslangicTarihi) AS Ay, YEAR(BaslangicTarihi) AS Yýl, ElekrtikciFiyat
FROM Ekipler E
JOIN Gorevler G ON G.EkipID = E.EkipID
WHERE ElekrtikciFiyat > 10000
