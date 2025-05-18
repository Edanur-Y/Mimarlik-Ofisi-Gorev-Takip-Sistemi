-- 1
CREATE DATABASE MimarlikOfisiGorevTakipSistemi

-- 2
USE MimarlikOfisiGorevTakipSistemi

-- 3 Kiþi Adresleri Tablosu
CREATE TABLE KisiAdresleri (
    KisiAdresiID INT PRIMARY KEY IDENTITY(1, 1),
    Il NVARCHAR(50) NOT NULL,
    Ilce NVARCHAR(50) NOT NULL,
    Koy NVARCHAR(50),
    Mahalle NVARCHAR(50) NOT NULL,
	Cadde NVARCHAR(50),
    Sokak NVARCHAR(50),
    BinaNo INT,
	KatNo INT,
    DaireNo INT
);

-- 4 Arsa Adresleri Tablosu
CREATE TABLE ArsaAdresleri (
    ArsaAdresiID INT PRIMARY KEY IDENTITY(1, 1),
    Il NVARCHAR(50) NOT NULL,
    Ilce NVARCHAR(50) NOT NULL,
    Koy NVARCHAR(50),
    Mahalle NVARCHAR(50) NOT NULL,
	AdaParselNo NVARCHAR(50),
);

-- 5 Müþteriler/Müteahhitler Tablosu
CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY IDENTITY(1, 1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    KisiAdresiID INT NOT NULL,
    Telefon NVARCHAR(30) NOT NULL,

    CONSTRAINT FK_Musteriler_MusteriKisiAdresleri FOREIGN KEY (KisiAdresiID)
        REFERENCES KisiAdresleri(KisiAdresiID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);   

-- 6 Haritacýlar Tablosu
CREATE TABLE Haritacilar (
	HaritaciID INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30),
);

-- 7 Zemin Etütçüler Tablosu
CREATE TABLE ZeminEtutculer (
	ZeminEtutcuID INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30),
);

-- 8 Ýnþaatçýlar Tablosu
CREATE TABLE Insaatcilar (
	InsaatciID INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30),
);

-- 9 Elektrik-Elektronikçiler Tablosu
CREATE TABLE Elektrikciler (
	ElektrikciID INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30),
);

-- 10 Makineciler Tablosu
CREATE TABLE Makineciler (
	MakineciID INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30),
);

-- 11 Ekipler Tablosu
CREATE TABLE Ekipler (
    EkipID INT PRIMARY KEY IDENTITY(1, 1),
	HaritaciID INT,
	HaritaciFiyat DECIMAL(10, 2),
	ZeminEtutcuID INT,
	ZeminEtutcuFiyat DECIMAL(10, 2),
	InsaatciID INT,
	InsaatciFiyat DECIMAL(10, 2),
	ElektrikciID INT,
	ElekrtikciFiyat DECIMAL(10, 2),
	MakineciID INT,
	MakineciFiyat DECIMAL(10, 2)

	CONSTRAINT FK_Ekipler_EkiplerHaritacilar FOREIGN KEY (HaritaciID)
        REFERENCES Haritacilar(HaritaciID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Ekipler_EkiplerZeminEtutculer FOREIGN KEY (ZeminEtutcuID)
        REFERENCES ZeminEtutculer(ZeminEtutcuID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Ekipler_EkiplerInsaatcilar FOREIGN KEY (InsaatciID)
        REFERENCES Insaatcilar(InsaatciID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Ekipler_EkiplerElektrikciler FOREIGN KEY (ElektrikciID)
        REFERENCES Elektrikciler(ElektrikciID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Ekipler_EkiplerMakineciler FOREIGN KEY (MakineciID)
        REFERENCES Makineciler(MakineciID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 12 Alanlar Tablosu
CREATE TABLE Alanlar (
    AlanID INT PRIMARY KEY IDENTITY(1, 1),
    Taban FLOAT NOT NULL,
	Toplam FLOAT NOT NULL
);

-- 13 Bina Türleri Tablosu
CREATE TABLE BinaTurleri (
    BinaTuruID INT PRIMARY KEY IDENTITY(1, 1),
    BinaTuru NVARCHAR(30)
);

-- 14 Bina Bölümleri Tablosu
CREATE TABLE Bolumler (
    BolumlerID INT PRIMARY KEY IDENTITY(1, 1),
    Bolumler NVARCHAR(30)
);

-- 15 Detaylar Tablosu
CREATE TABLE Detaylar (
    DetayID INT PRIMARY KEY IDENTITY(1, 1),
	BelgelerYolu NVARCHAR(100),
    BinaTuruID INT,
	KatSayisi INT,
	BolumSayisi INT,
	BolumlerID INT,

	CONSTRAINT CK_Detaylar_KatSayisi CHECK(KatSayisi > 0),
	CONSTRAINT CK_Detaylar_BolumSayisi CHECK(BolumSayisi > 0),

	CONSTRAINT FK_Detaylar_DetayBinaTurleri FOREIGN KEY (BinaTuruID)
		REFERENCES BinaTurleri(BinaTuruID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Detaylar_DetayBolum FOREIGN KEY (BolumlerID)
        REFERENCES Bolumler(BolumlerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 16 Birimler Tablosu
CREATE TABLE Birimler (
    BirimID INT PRIMARY KEY IDENTITY(1, 1),
    Birim NVARCHAR(30) NOT NULL
);

-- 17 Gorevler Tablosu
CREATE TABLE Gorevler (
    GorevID INT PRIMARY KEY IDENTITY(1, 1),
    BirimID INT NOT NULL,
	GorevAdý NVARCHAR(50),
	MusteriID INT NOT NULL,
	ArsaAdresiID INT NOT NULL,
	AlanID INT NOT NULL,
	EkipID INT,
	DetayID INT,
	Ucret DECIMAL(10, 2),
	FaturaBiti BIT NOT NULL,
	PlanResimYolu NVARCHAR(100),
	dwgYolu NVARCHAR(100),
	BaslangicTarihi DATE NOT NULL,
    TeslimTarihi DATE,

	CONSTRAINT CK_Gorevler_Ucret CHECK(Ucret > 0),

	CONSTRAINT FK_Gorevler_GorevlerBirimler FOREIGN KEY (BirimID)
		REFERENCES Birimler(BirimID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Gorevler_GorevlerMusteriler FOREIGN KEY (MusteriID)
        REFERENCES Musteriler(MusteriID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Gorevler_GorevlerAdresler FOREIGN KEY (ArsaAdresiID)
        REFERENCES ArsaAdresleri(ArsaAdresiID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Gorevler_GorevlerEkipler FOREIGN KEY (EkipID)
        REFERENCES Ekipler(EkipID)
		ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Gorevler_GorevlerAlanlar FOREIGN KEY (AlanID)
        REFERENCES Alanlar(AlanID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

	CONSTRAINT FK_Gorevler_GorevlerDetaylar FOREIGN KEY (DetayID)
        REFERENCES Detaylar(DetayID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT CK_Gorevler_BaslangicTarihi CHECK (BaslangicTarihi <= GETDATE()),
    CONSTRAINT CK_Gorevler_TeslimTarihi CHECK (TeslimTarihi <= GETDATE()),
    CONSTRAINT CK_Gorevler_BaslangicTarihi_TeslimTarihi CHECK (BaslangicTarihi <= TeslimTarihi)
);
