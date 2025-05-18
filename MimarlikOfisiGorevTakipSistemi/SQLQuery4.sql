USE MimarlikOfisiGorevTakipSistemi

DECLARE @YeniBinaTuru TABLE (BinaTuruID INT);
DECLARE @YeniBolumler TABLE (BolumlerID INT);

-- Bina T�r� Ekleme
INSERT INTO BinaTurleri(BinaTuru)
OUTPUT INSERTED.BinaTuruID INTO @YeniBinaTuru
VALUES ('Okul');

-- B�l�m Ekleme
INSERT INTO Bolumler(Bolumler)
OUTPUT INSERTED.BolumlerID INTO @YeniBolumler
VALUES ('S�n�f');

UPDATE Musteriler
SET Telefon='05576123049'
WHERE Ad='Mahmut' AND Soyad='Tan';

INSERT INTO KisiAdresleri
(Il, Ilce, Mahalle, Cadde, BinaNo, KatNo, DaireNo)
VALUES 
('Kocaeli','Dar�ca', 'Zincirlikuyu Mah.', 'Kaplan Cad.', 'Aral�k Sok.', 28, 4, 3),
('Eski�ehir','�n�n�', '�n�n� Mah.', '�stiklal Cad.', '�zg�l Sok.', 26, 2, 1);

DELETE FROM ZeminEtutculer WHERE Ad='Alp';

UPDATE Alanlar
SET Taban=250, Toplam=500
WHERE Taban=200 AND Toplam=400;

------------------------------------------------------
BEGIN TRANSACTION; 
UPDATE Gorevler SET Ucret = Ucret - 5000 WHERE GorevAd� = 'Tepe �antiyesi';
UPDATE Gorevler SET Ucret = Ucret + 5000 WHERE GorevAd� = 'Belediye �antiyesi';
COMMIT; 
