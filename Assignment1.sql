-- 1: What is the primary Key in the table of Artists? Are there any foreign keys -- 
-- The Primary Key for the table of Artists is ArtistID. There is no foreign key for the table of Artists --

-- 2: Show all columns from the Tracks table and order contents of Tracks by Name in alphabetical order (Z to A) -- 

SELECT TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice
FROM tracks
ORDER BY NAME DESC;

-- 3: Select all columns from the Tracks table without writing out the column names --

SELECT *
FROM tracks;
 
-- 4: Show only the distinct composers from the table Tracks -- 

SELECT 
DISTINCT (Composer) AS DistinctComposers
FROM tracks;


-- 5: How many distinct countries are our customers from? -- 

SELECT 
DISTINCT(Country) AS DistinctCountries
FROM customers
ORDER BY Country ASC;

-- 24 distinct countries

-- 6: Show the first name, last name, and phone number of all customers. Sort it by alphabetical order, first names, and then last name. --

SELECT FirstName, LastName, Phone
FROM customers
ORDER BY FirstName ASC, LastName;

-- 7: List all employees. Sort the records by hire date in descending order and by the birth date in ascending order. --

SELECT *
FROM employees
ORDER BY HireDate DESC, BirthDate ASC;

-- 8: Sort the total in the Invoice table in ascending order. What is the minimum total? 

SELECT Total
FROM invoices
ORDER BY Total ASC;

-- The minimum total is 0.99