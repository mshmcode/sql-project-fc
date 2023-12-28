-- 1. Stwórz Bazę „Sklep odzieżowy”
-- 2. Utwórz tabelę „Producenci” z kolumnami:
-- id producenta
-- nazwa producenta
-- adres producenta
-- nip producenta
-- data podpisania umowy z producentem
-- Do każdej kolumny ustaw odpowiedni „constraint”


CREATE DATABASE SklepOdziezowy;
USE SklepOdziezowy;

CREATE TABLE Producenci (
    id_producenta INT PRIMARY KEY AUTO_INCREMENT,
    nazwa_producenta VARCHAR(255) NOT NULL,
    adres_producenta VARCHAR(255) NOT NULL,
    nip_producenta VARCHAR(15) NOT NULL,
    data_podpisania_umowy DATE NOT NULL,
    CONSTRAINT unikatowy_nip UNIQUE (nip_producenta)
);

-- 3. Utwórz tabelę „Produkty” z kolumnami:
-- id produktu
-- id producenta
-- nazwa produktu
-- opis produktu
-- cena netto zakupu
-- cena brutto zakupu
-- cena netto sprzedaży
-- cena brutto sprzedaży
-- procent VAT sprzedaży
-- Do każdej kolumny ustaw odpowiedni „constraint”

CREATE TABLE Produkty (
    id_produktu INT PRIMARY KEY AUTO_INCREMENT,
    id_producenta INT,
    nazwa_produktu VARCHAR(255) NOT NULL,
    opis_produktu TEXT,
    cena_netto_zakupu DECIMAL(10, 2) NOT NULL,
    cena_brutto_zakupu DECIMAL(10, 2) NOT NULL,
    cena_netto_sprzedazy DECIMAL(10, 2) NOT NULL,
    cena_brutto_sprzedazy DECIMAL(10, 2) NOT NULL,
    procent_vat_sprzedazy INT CHECK (procent_vat_sprzedazy >= 0 AND procent_vat_sprzedazy <= 100),
    CONSTRAINT fk_producent FOREIGN KEY (id_producenta) REFERENCES Producenci(id_producenta)
);

-- 5. Utwórz tabelę „Klienci” z kolumnami:
-- id klienta
-- imię
-- nazwisko
-- adres
-- Do każdej kolumny ustaw odpowiedni „constraint”

CREATE TABLE Klienci (
    id_klienta INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL,
    adres TEXT NOT NULL
);

-- 4. Utwórz tabelę „Zamówienia” z kolumnami:
-- id zamówienia
-- id klienta
-- id produktu
-- Data zamówienia
-- Do każdej kolumny ustaw odpowiedni „constraint”

CREATE TABLE Zamowienia (
    id_zamowienia INT PRIMARY KEY AUTO_INCREMENT,
    id_klienta INT,
    id_produktu INT,
    data_zamowienia DATE NOT NULL,
    CONSTRAINT fk_klient FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
    CONSTRAINT fk_produkt FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
);

-- 6. Połącz tabele ze sobą za pomocą kluczy obcych:
-- Produkty – Producenci
-- Zamówienia – Produkty
-- Zamówienia - Klienci

ALTER TABLE Produkty
ADD CONSTRAINT fk_producent_produkt
FOREIGN KEY (id_producenta)
REFERENCES Producenci(id_producenta);

ALTER TABLE Zamowienia
ADD CONSTRAINT fk_produkt_zamowienie
FOREIGN KEY (id_produktu)
REFERENCES Produkty(id_produktu);

ALTER TABLE Zamowienia
ADD CONSTRAINT fk_klient_zamowienie
FOREIGN KEY (id_klienta)
REFERENCES Klienci(id_klienta);

-- 7. Każdą tabelę uzupełnij danymi wg:
-- Tabela „Producenci” – 4 pozycje
-- Tabela „Produkty” – 20 pozycji
-- Tabela „Zamówienia” – 10 pozycji
-- Tabela „Klienci” – 10 pozycji

INSERT INTO Producenci (nazwa_producenta, adres_producenta, nip_producenta, data_podpisania_umowy)
VALUES
    ('Adidas', 'ul. Sportowa 1, Warszawa', '1234567890', '2023-01-01'),
    ('Nike', 'ul. Rugbyowa 5, Kraków', '0987654321', '2023-02-15'),
    ('Puma', 'ul. Kontaktowa 10, Gdańsk', '1112233445', '2023-03-20'),
    ('Reebok', 'ul. Biegowa 3, Poznań', '9988776655', '2023-04-10');
    
INSERT INTO Produkty (id_producenta, nazwa_produktu, opis_produktu, cena_netto_zakupu, cena_brutto_zakupu, cena_netto_sprzedazy, cena_brutto_sprzedazy, procent_vat_sprzedazy)
VALUES
    (1, 'Koszulka sportowa', 'Damska, rozmiar M', 30.00, 36.90, 60.00, 73.80, 23),
    (2, 'Buty do biegania', 'Męskie, rozmiar 42', 80.00, 98.40, 150.00, 184.50, 23),
    (3, 'Spodenki fitness', 'Uniseks, rozmiar S', 25.00, 30.75, 50.00, 61.50, 23),
    (1, 'Kurtka narciarska', 'Damska, rozmiar L', 120.00, 147.60, 250.00, 307.50, 23),
    (2, 'Getry do rugby', 'Męskie, rozmiar XL', 15.00, 18.45, 35.00, 43.05, 23),
    (3, 'Kapelusz plażowy', 'Damski, one size', 10.00, 12.30, 20.00, 24.60, 23),
    (1, 'Rower górski', 'Model XC-200', 500.00, 615.00, 800.00, 984.00, 23),
    (2, 'Hulajnoga elektryczna', 'Model E-Scooter Pro', 300.00, 369.00, 500.00, 615.00, 23),
    (3, 'Torba podróżna', 'Duża, na kółkach', 40.00, 49.20, 80.00, 98.40, 23),
    (1, 'Skakanka', 'Profesjonalna, regulowana', 15.00, 18.45, 30.00, 36.90, 23),
    (4, 'Koszulka termoaktywna', 'Męska, rozmiar S', 35.00, 43.05, 70.00, 86.10, 23),
    (4, 'Kurtka outdoorowa', 'Uniseks, rozmiar M', 90.00, 110.70, 180.00, 221.40, 23),
    (4, 'Spodnie trekkingowe', 'Damskie, rozmiar XS', 50.00, 61.50, 100.00, 123.00, 23),
    (1, 'Piłka do rugby', 'Rozmiar 5', 25.00, 30.75, 50.00, 61.50, 23),
    (2, 'Nakolanniki sportowe', 'Uniseks, rozmiar L', 12.00, 14.76, 25.00, 30.75, 23),
    (3, 'Kijki do nordic walking', 'Teleskopowe', 40.00, 49.20, 80.00, 98.40, 23),
    (2, 'Koszulka termoaktywna', 'Damska, rozmiar M', 30.00, 36.90, 60.00, 73.80, 23),
    (3, 'Rękawiczki do biegania', 'Męskie, rozmiar S', 15.00, 18.45, 30.00, 36.90, 23),
    (1, 'Koszulka polo', 'Dziecięca, rozmiar 10', 20.00, 24.60, 40.00, 49.20, 23),
    (4, 'Kurtka termoaktywna', 'Uniseks, rozmiar L', 70.00, 86.10, 140.00, 172.20, 23),
    (3, 'Saszetka na biodro', 'Uniwersalna', 8.00, 9.84, 16.00, 19.68, 23);
    
INSERT INTO Klienci (imie, nazwisko, adres)
VALUES
    ('Adam', 'Nowak', 'ul. Kwiatowa 1, Warszawa'),
    ('Ewa', 'Kowalska', 'ul. Leśna 5, Kraków'),
    ('Piotr', 'Kowalczyk', 'ul. Słoneczna 10, Gdańsk'),
    ('Anna', 'Lis', 'ul. Ogrodowa 3, Poznań'),
    ('Krzysztof', 'Wójcik', 'ul. Polna 8, Wrocław'),
    ('Marta', 'Kaczmarek', 'ul. Morska 15, Łódź'),
    ('Tomasz', 'Zając', 'ul. Zielona 7, Szczecin'),
    ('Magdalena', 'Król', 'ul. Plażowa 20, Lublin'),
    ('Łukasz', 'Pawlak', 'ul. Różana 12, Białystok'),
    ('Karolina', 'Michalak', 'ul. Górska 18, Katowice');
    
INSERT INTO Zamowienia (id_klienta, id_produktu, data_zamowienia)
VALUES
    (1, 1, '2023-01-10'),
    (2, 2, '2023-02-15'),
    (3, 4, '2023-03-20'),
    (1, 4, '2023-04-05'),
    (2, 5, '2023-05-12'),
    (3, 6, '2023-06-18'),
    (4, 7, '2023-07-01'),
    (1, 8, '2023-08-10'),
    (2, 9, '2023-09-15'),
    (3, 10, '2023-10-20');
    
-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci”

SELECT Produkty.id_produktu, Produkty.nazwa_produktu, Produkty.opis_produktu, Produkty.cena_netto_zakupu, Produkty.cena_brutto_zakupu, Produkty.cena_netto_sprzedazy, Produkty.cena_brutto_sprzedazy, Produkty.procent_vat_sprzedazy, Producenci.nazwa_producenta, Producenci.adres_producenta, Producenci.nip_producenta, Producenci.data_podpisania_umowy
FROM Produkty
JOIN Producenci ON Produkty.id_producenta = Producenci.id_producenta
WHERE Producenci.id_producenta = 1;

-- 9. Posortuj te produkty alfabetycznie po nazwie

SELECT Produkty.id_produktu, Produkty.nazwa_produktu, Produkty.opis_produktu, Produkty.cena_netto_zakupu, Produkty.cena_brutto_zakupu, Produkty.cena_netto_sprzedazy, Produkty.cena_brutto_sprzedazy, Produkty.procent_vat_sprzedazy, Producenci.nazwa_producenta, Producenci.adres_producenta, Producenci.nip_producenta, Producenci.data_podpisania_umowy
FROM Produkty
JOIN Producenci ON Produkty.id_producenta = Producenci.id_producenta
WHERE Producenci.id_producenta = 1
ORDER BY Produkty.nazwa_produktu ASC;

-- 10. Wylicz średnią cenę za produktu od producenta z pozycji 1

SELECT Producenci.id_producenta, Producenci.nazwa_producenta, AVG(Produkty.cena_brutto_sprzedazy) AS srednia_cena
FROM Produkty
JOIN Producenci ON Produkty.id_producenta = Producenci.id_producenta
WHERE Producenci.id_producenta = 1;

-- 11. Wyświetl dwie grupy produktów tego producenta:
-- Połowa najtańszych to grupa: „Tanie”
-- Pozostałe to grupa: „Drogie”

WITH mediana_1 AS (
    SELECT p.*, COUNT(*) OVER () AS liczebnosc_cala_tablica, ROW_NUMBER() OVER (ORDER BY cena_netto_sprzedazy) AS id_po_cenie
    FROM Produkty p
),
mediana_2 AS (
    SELECT *,
        CASE
            WHEN id_po_cenie <= liczebnosc_cala_tablica / 2 THEN 'Tanie'
            ELSE 'Drogie'
        END AS grupa_cenowa
    FROM mediana_1
)
SELECT * FROM mediana_2;

-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę

SELECT Zamowienia.id_zamowienia, Produkty.nazwa_produktu
FROM Zamowienia
JOIN Produkty ON Zamowienia.id_produktu = Produkty.id_produktu;

-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji

SELECT Zamowienia.id_zamowienia, Produkty.nazwa_produktu
FROM Zamowienia
JOIN Produkty ON Zamowienia.id_produktu = Produkty.id_produktu
LIMIT 5;

-- 14. Policz łączną wartość wszystkich zamówień

SELECT SUM(Produkty.cena_brutto_sprzedazy) AS laczna_wartosc_zamowien
FROM Zamowienia
JOIN Produkty ON Zamowienia.id_produktu = Produkty.id_produktu;

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego

SELECT Zamowienia.id_zamowienia, Produkty.nazwa_produktu, Zamowienia.data_zamowienia
FROM Zamowienia
JOIN Produkty ON Zamowienia.id_produktu = Produkty.id_produktu
ORDER BY Zamowienia.data_zamowienia ASC;

-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych

SELECT *
FROM Produkty
WHERE id_producenta IS NULL
   OR nazwa_produktu IS NULL
   OR cena_netto_zakupu IS NULL
   OR cena_brutto_zakupu IS NULL
   OR cena_netto_sprzedazy IS NULL
   OR cena_brutto_sprzedazy IS NULL
   OR procent_vat_sprzedazy IS NULL;

-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną

SELECT Produkty.nazwa_produktu, COUNT(Zamowienia.id_produktu) AS ilosc_sprzedanych, MAX(Produkty.cena_brutto_sprzedazy) AS cena_produktu
FROM Zamowienia
JOIN Produkty ON Zamowienia.id_produktu = Produkty.id_produktu
GROUP BY Produkty.nazwa_produktu
ORDER BY ilosc_sprzedanych DESC
LIMIT 1;

-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień

SELECT data_zamowienia, COUNT(id_zamowienia) AS ilosc_zamowien
FROM Zamowienia
GROUP BY data_zamowienia
ORDER BY ilosc_zamowien DESC
LIMIT 1;
