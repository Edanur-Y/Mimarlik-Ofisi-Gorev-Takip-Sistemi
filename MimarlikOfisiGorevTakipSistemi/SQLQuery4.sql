USE MimarlikOfisiGorevTakipSistemi

DECLARE @YeniBinaTuru TABLE (BinaTuruID INT);
DECLARE @YeniBolumler TABLE (BolumlerID INT);

-- Bina Türü Ekleme
INSERT INTO BinaTurleri(BinaTuru)
OUTPUT INSERTED.BinaTuruID INTO @YeniBinaTuru
VALUES ('Okul');

-- Bölüm Ekleme
INSERT INTO Bolumler(Bolumler)
OUTPUT INSERTED.BolumlerID INTO @YeniBolumler
VALUES ('Sınıf');

UPDATE Musteriler
SET Telefon='05576123049'
WHERE Ad='Mahmut' AND Soyad='Tan';

INSERT INTO KisiAdresleri
(Il, Ilce, Mahalle, Cadde, BinaNo, KatNo, DaireNo)
VALUES 
('Kocaeli','Darıca', 'Zincirlikuyu Mah.', 'Kaplan Cad.', 'Aralık Sok.', 28, 4, 3),
('Eskiþehir','İnönü', 'İnönü Mah.', 'İstiklal Cad.', 'Özgül Sok.', 26, 2, 1);

DELETE FROM ZeminEtutculer WHERE Ad='Alp';

UPDATE Alanlar
SET Taban=250, Toplam=500
WHERE Taban=200 AND Toplam=400;

------------------------------------------------------
BEGIN TRANSACTION; 
UPDATE Gorevler SET Ucret = Ucret - 5000 WHERE GorevAdý = 'Tepe Şantiyesi';
UPDATE Gorevler SET Ucret = Ucret + 5000 WHERE GorevAdý = 'Belediye Şantiyesi';
COMMIT; 
