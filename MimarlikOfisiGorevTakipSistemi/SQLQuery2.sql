USE MimarlikOfisiGorevTakipSistemi

INSERT INTO KisiAdresleri
(Il, Ilce, Mahalle, Sokak, BinaNo, KatNo, DaireNo)
VALUES 
('Çorum','Kargý', 'Fatih Mah.', 'Sarý Sok.', 10, 2, 4),
('Ankara','Altýndað', 'Kara Mah.', 'Sedef Sok.', 23, 3, 12);
INSERT INTO KisiAdresleri
(Il, Ilce, Mahalle, Cadde, Sokak, BinaNo, KatNo, DaireNo)
VALUES 
('Çorum','Kargý', 'Buðday Mah.', 'Atatürk Cad.','Ýpek Sok.', 5, 1, 1);

INSERT INTO ArsaAdresleri
(Il, Ilce, Mahalle, AdaParselNo)
VALUES 
('Çorum','Kargý', 'Yeni Mah.', '255/2'),
('Çorum','Kargý', 'Bahçelievler Mah.', '179/5'),
('Çorum','Kargý', 'Bayýr Mah.', '142/6'),
('Çorum','Kargý', 'Yeni Mah.', '238/7');

INSERT INTO Musteriler
VALUES 
('Mahmut', 'Tan', 1, '05492103587'),
('Nurhan', 'Pekin', 2, '05574105980'),
('Gizem', 'Demir', 3, '05387398635');

INSERT INTO Haritacilar
(Ad, Soyad, Telefon)
VALUES 
('Utku', 'Yýlmaz', '05263104612'),
('Hasan', 'Pek', '05412038974');

INSERT INTO ZeminEtutculer
(Ad, Soyad, Telefon)
VALUES 
('Zeki', 'Ekinci', '05612309546'),
('Melis', 'Saka', '05498521367'),
('Alp', 'Kara', '05648912375');

INSERT INTO Insaatcilar
(Ad, Soyad, Telefon)
VALUES 
('Hasan', 'Özbey', '05416502970'),
('Emin', 'Kaya', '05524681237');

INSERT INTO Elektrikciler
(Ad, Soyad, Telefon)
VALUES 
('Faruk', 'Yýlmaz', '05435201679'),
('Melda', 'Zorlu', '05364398753'),
('Sinem', 'Kara', '05338749887');

INSERT INTO Makineciler
(Ad, Soyad, Telefon)
VALUES 
('Semih', 'Orta', '05486213085'),
('Cemre', 'Saký', '05523109561');

INSERT INTO Ekipler
VALUES 
(1, 20000, 1, 50000, 1, 20000, 1, 10000, 1, 10000),
(2, 40000, 1, 20000, 2, 10000, 1, 15000, 2, 15000),
(1, 25000, 2, 35000, 2, 15000, 2, 20000, 1, 20000),
(1, 30000, 3, 40000, 1, 20000, 3, 10000, 2, 20000);

INSERT INTO Alanlar
VALUES 
(150, 450),
(200, 400),
(200, 800),
(100, 300);

INSERT INTO BinaTurleri
VALUES 
('Baðýmsýz Bölümlü'),
('Müstakil');

INSERT INTO Bolumler
VALUES 
('1+1'),
('2+1'),
('3+1'),
('4+1'),
('Dükkan,1+1');

INSERT INTO Detaylar
VALUES 
('https://drive.google.com/drive/folders/1ZbFIhZ3lqeqb6JM59YJk6_yr_aV7oCFw?usp=drive_link', 1, 3, 5, 5),
('https://drive.google.com/drive/folders/1W0qxX6Fuyv5lcuVK8tmtRKtgf46ehcJ_?usp=drive_link', 2, 2, 1, 4),
('link1', 1, 4, 8, 2),
('link2', 1, 3, 3, 2);

INSERT INTO Birimler
VALUES 
('Mimari Proje'),
('Þantiye Þefliði');

INSERT INTO Gorevler
VALUES 
(2, 'Belediye Þantiyesi', 1, 1, 1, 1, 1, 150000, 0, 'https://drive.google.com/file/d/1WEuY6mf4qZQiy27xTNY_1UtMT-3PHe5H/view?usp=drive_link',
'https://drive.google.com/file/d/1wSpRFP32rolCi4XLUZ0zAKJ3CjYeI9Bm/view?usp=drive_link', '2024-12-30', Null),
(1, 'Köþe Projesi', 2, 2, 2, 2, 2, 140000, 1, 'https://drive.google.com/file/d/1XYk7cV2w_znzyOTIP0b9963AvbD_Y9NY/view?usp=drive_link',
'https://drive.google.com/file/d/1q8LifIj0DuGBA2gMb7SjKavjfbXw3MgG/view?usp=drive_link', '2025-01-15', '2025-02-15'),
(1, 'Pazar Yaný Proje', 1, 3, 3, 3, 3,  160000, 0, 'link3', 'link4', '2025-02-03', Null),
(2, 'Tepe Þantiyesi', 3, 4, 4, 4, 4, 170000, 1, 'link5', 'link6', '2025-02-10', '2025-04-30') 

