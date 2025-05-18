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
VALUES ('Sýnýf');

UPDATE Musteriler
SET Telefon='05576123049'
WHERE Ad='Mahmut' AND Soyad='Tan';

INSERT INTO KisiAdresleri
(Il, Ilce, Mahalle, Cadde, BinaNo, KatNo, DaireNo)
VALUES 
('Kocaeli','Darýca', 'Zincirlikuyu Mah.', 'Kaplan Cad.', 'Aralýk Sok.', 28, 4, 3),
('Eskiþehir','Ýnönü', 'Ýnönü Mah.', 'Ýstiklal Cad.', 'Özgül Sok.', 26, 2, 1);

DELETE FROM ZeminEtutculer WHERE Ad='Alp';

UPDATE Alanlar
SET Taban=250, Toplam=500
WHERE Taban=200 AND Toplam=400;

------------------------------------------------------
BEGIN TRANSACTION; 
UPDATE Gorevler SET Ucret = Ucret - 5000 WHERE GorevAdý = 'Tepe Þantiyesi';
UPDATE Gorevler SET Ucret = Ucret + 5000 WHERE GorevAdý = 'Belediye Þantiyesi';
COMMIT; 
