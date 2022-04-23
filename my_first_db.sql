--------------------------------- SYNTAX ----------------------------------------


-- SELECT name FROM tracks;

-- SELECT Composer, name FROM tracks;

-- SELECT * FROM tracks;

-- SELECT Composer FROM tracks;

-- SELECT DISTINCT Composer FROM tracks;

-- SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;

-- SELECT name FROM tracks WHERE Composer = 'Jimi Hendrix';


-- SELECT *
-- FROM invoices
-- WHERE total > 10;

-- SELECT InvoiceId, InvoiceDate, total
-- FROM invoices
-- WHERE total > 10
-- LIMIT 4;

-- SELECT *
-- FROM invoices
-- WHERE total>10
-- ORDER BY total ASC;

-- SELECT *
-- FROM invoices
-- WHERE total>10
-- ORDER BY InvoiceDate DESC
-- LIMIT 10;

-- SELECT *
-- FROM invoices
-- WHERE NOT BillingCountry = 'USA'
-- ORDER BY total DESC;

-- SELECT *
-- FROM invoices
-- WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
-- ORDER BY InvoiceId;

-- SELECT *
-- FROM invoices
-- WHERE InvoiceDate >= '2012-01-01' AND InvoiceDate <= '2013-01-02'
-- WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02'; 

-- SELECT InvoiceDate
-- FROM Invoices
-- WHERE InvoiceDate BETWEEN '2008-12-12' AND '2012-01-01'
-- ORDER BY InvoiceDate DESC
-- LIMIT 1;

-- SELECT FirstName, LastName
-- FROM customers
-- WHERE country IN ('Belgium', 'Norway', 'Canada', 'USA');

-- SELECT name
-- FROM tracks
-- WHERE Composer LIKE '%Bach';

-- SELECT *
-- FROM albums
-- WHERE Title LIKE '%Greatest%';

-- SELECT *
-- FROM invoices
-- WHERE InvoiceDate BETWEEN '2009-12-30' AND "2019-12-30" 
-- AND InvoiceDate LIKE '%-02-%';

-- SELECT FirstName, LastName, City
-- FROM customers
-- WHERE FirstName LIKE '___';

-- SELECT FirstName, LastName, City
-- FROM customers
-- WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';



--------------------------------  AGGREGATE FUNCTIONS --------------------------------------------

-- SELECT count(LastName)
-- FROM students
-- WHERE LastName IS NULL;

-- SELECT COUNT(InvoiceId) AS num_of_invoices
-- FROM invoices;

-- SELECT COUNT(DISTINCT Composer) AS besteci_sayısı
-- OM tracks;

-- SELECT count(DISTINCT strftime('%Y', InvoiceDate)) AS farkli_yil_sayisi
-- FROM invoices;

-- SELECT MIN(Milliseconds), TrackId, name as duratiın
-- ROM tracks;

-- SELECT MIN(Grade), MAX(Grade)
-- FROM students;

-- SELECT FirstName, LastName, Grade
-- FROM students
-- WHERE Grade = (SELECT MIN(Grade) FROM students) OR Grade = (SELECT MAX(Grade) FROM students)
-- ORDER BY Grade ASC;

-- SELECT SUM(Quantity*UnitPrice)
-- FROM invoice_items;

-- SELECT SUM(total)
-- FROM invoices;

-- SELECT *
-- FROM tracks
-- WHERE Milliseconds >= (SELECT AVG(Milliseconds) FROM tracks)
-- ORDER BY Milliseconds ASC;

-- SELECT AVG(total) as total_income
-- FROM invoices;

-- SELECT round(avg(total),4) as average_income
-- FROM invoices;

-- SELECT Composer, COUNT(name)
-- FROM tracks
-- WHERE Composer IS NOT NULL
-- GROUP BY Composer;

-- SELECT country, COUNT(CustomerId)
-- FROM customers
-- GROUP BY country 
-- ORDER BY COUNT(CustomerId) DESC;

-- SELECT country, City, COUNT(City)
-- FROM customers
-- GROUP BY City
-- ORDER BY country, City;

-- SELECT BillingCountry, ROUND(AVG(total),2)
-- FROM invoices
-- WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-12'
-- GROUP BY BillingCountry;

-- SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
-- FROM markalar
-- INNER JOIN siparisler ON markalar.marka_id = siparisler.marka_id;

-- SELECT tracks.Name, genres.GenreId, genres.Name
-- FROM tracks
-- INNER JOIN genres ON tracks.GenreId = genres.GenreId;
 
-- SELECT customers.FirstName, customers.LastName, invoices.InvoiceDate, invoices.Total
-- FROM invoices
-- LEFT JOIN customers ON customers.CustomerId = invoices.CustomerId;

-- SELECT al.ArtistId, ar.Name, al.AlbumId, al.Title
-- FROM artists ar
-- LEFT JOIN albums al
-- ON al.ArtistId = ar.ArtistId
-- ORDER BY al.ArtistId;



--------------------------------  AGGREGATE FUNCTIONS --------------------------------------------


-- SELECT AlbumId, TrackId, name
-- FROM tracks
-- WHERE AlbumId = (
-- 	SELECT AlbumId
-- 	FROM albums
-- 	WHERE title = 'Faceless'
-- 	);

-- SELECT AlbumId, TrackId, name
-- FROM tracks
-- WHERE AlbumId IN (
-- 	SELECT AlbumId
-- 	FROM albums
-- 	WHERE title = 'Faceless' OR title = 'Let There Be Rock'
-- 	);




--------------------------------  SUBQUERIES & DLL COMMANDS --------------------------------------------

-- CREATE TABLE IF NOT EXISTS personel (
-- 	first_name VARCHAR(20),
-- 	last_name TEXT,
-- 	age INT,
-- 	hire_date DATE
-- );
 
-- CREATE TABLE IF NOT EXISTS vacation_plan (
-- 	place_id VARCHAR(20),
-- 	country TEXT,
-- 	hotel_name TEXT,
-- 	employee_id INT,
-- 	vacation_length INT,
-- 	budget REAL
-- );

-- DROP TABLE IF EXISTS personel; /* remove the table completely */
		
-- INSERT INTO vacation_plan VALUES(06,'FRANCE','CAPPADOCIA HOTEL', 1, 7, 350.35); /* add values to all columns in the table */
-- INSERT INTO vacation_plan VALUES(06,'GERMANY','PAMUKKALE HOTEL', 2, 10, 850.65);
-- INSERT INTO vacation_plan VALUES(06,'NETHERLANDS','EPHESUS HOTEL', 3, 5, 650.55);

-- INSERT INTO vacation_plan(personel_id, country, hotel_name) VALUES(06,'FRANCE','CAPPADOCIA HOTEL');  /* add values only into the stated columns in the table */

-- CREATE TABLE IF NOT EXISTS workers (
-- 	id INT PRIMARY KEY,  						/* NOT NULL + UNIQUE */
-- 	tc_number VARCHAR(11) UNIQUE NOT NULL,		/* NOT NULL & UNIQUE */
-- 	name TEXT DEFAULT 'NONAME',					/* if value not added assign the stated default value */
-- 	salary INT NOT NULL							/* add values only into the stated columns in the table */
-- );
-- 
-- INSERT INTO workers VALUES(01,'12345678910','ALİ', 6000);					/* add values to all columns in the table */
-- NSERT INTO workers VALUES(02,'12345678910','VELİ', 7000);					/* ERROR(UNIQUE) */
-- NSERT INTO workers(id, tc_number, salary) VALUES(03,'12345678944', 8000);	/* add values to all columns in the table */
-- INSERT INTO workers VALUES(04,'12345678910','HACI', NULL);					/* ERROR(NOT NULL) */

-- ALTER TABLE vacation_plan
-- RENAME COLUMN personel_id TO place_id;   /* change the name of the column */

-- CREATE TABLE vacation_plan2 (
-- 	id INT,
-- 	place_id INT,
-- 	country TEXT,
-- 	hotel_name TEXT,
-- 	employee_id INT,
-- 	vacation_length INT,
-- 	budget REAL,
-- 	PRIMARY KEY(id),
-- 	FOREIGN KEY(employee_id) REFERENCES employees(EmployeeId) 		/* FOREIGN KEY connects the column to another column of the table */
-- );

-- ALTER TABLE employees
-- DROP COLUMN EmployeeId;			/* ERROR!!! remove the column completely BUT here since EmployeeId COLUMN is PRIMARY KEY it cannot be deleted */

-- INSERT INTO vacation_plan2 VALUES(01, 42, 'TR', 'PAMUKKALE HOTEL', 1, 5, 7000);			/* EmployeeId si "1" olan kişiye tatil planı */
-- INSERT INTO vacation_plan2 VALUES(02, 34, 'TR', 'AYSOFYA HOTEL', 9, 6, 5000);			/* HATA!!! EmployeeId si OLMAYAN bir kişi için yeni bir id ile(9) tatil planı */
-- INSERT INTO vacation_plan2 VALUES(02, 34, 'TR', 'AYASOFYA HOTEL', 1, 5, 7000);			/* EmployeeId si "1" olan kişi için tekrar tatil kaydı planı girilebilir */
-- INSERT INTO vacation_plan2 VALUES(03, 25, 'GER', 'COLOGNE', 2, 4, 3000);					/* EmployeeId si "1" olan kişi için tekrar tatil kaydı planı girilebilir */

-- SELECT e.FirstName, e.LastName, v.hotel_name, v.vacation_length
-- FROM employees e
-- INNER JOIN vacation_plan2 v
-- ON EmployeeId = employee_id AND EmployeeId = 1;

-- ALTER TABLE vacation_plan2				/* add new COLUMN to vacation_plan2 table called "name" */
-- ADD name TEXT DEFAULT 'NONAME';

-- ALTER TABLE vacation_plan2				/* delete COLUMN called "name" from vacation_plan2 table */
-- DROP column name;

-- ALTER TABLE workers						/*alter the name of table "workers" to "pepople" */
-- RENAME TO people;

-- UPDATE vacation_plan2					/* change hotel name in vacation_plan2 for all people having employee_id '1' */
-- SET hotel_name = 'zeus-hotel'
-- WHERE employee_id = 1;

-- UPDATE people
-- SET salary = salary *1.1					/* update the salary (increase 10%) for people who has salary higher than 5000 */
-- WHERE salary > 5000;
	
