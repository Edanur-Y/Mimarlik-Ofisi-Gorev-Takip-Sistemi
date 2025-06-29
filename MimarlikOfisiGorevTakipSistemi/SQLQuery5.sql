USE MimarlikOfisiGorevTakipSistemi

CREATE VIEW vw_Gorevler
AS
SELECT GorevID, GorevAdı
FROM Gorevler
WHERE Ucret > 140000;

CREATE PROCEDURE sp_BolumEkle
@Bolum NVARCHAR(30)
AS
BEGIN
INSERT INTO Bolumler (Bolumler)
VALUES (@Bolum);
END;
EXEC sp_BolumEkle @Bolum = '5+1';
