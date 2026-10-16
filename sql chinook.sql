-- ============================================
-- SQL CHINOOK PROJECT
-- Practice project: SQL fundamentals
-- Database: Chinook
-- ============================================

-- LEVEL 1: BASIC QUERIES

-- 1. Show the first and last names of all customers.
SELECT first_name, last_name
FROM customers;

-- 2. Show all customers from Brazil.
SELECT *
FROM customers
WHERE country = 'Brazil';

-- 3. Show tracks longer than five minutes.
SELECT *
FROM tracks
WHERE milliseconds > 300000;

-- ============================================
-- LEVEL 2: SORTING, DISTINCT AND JOINS
-- ============================================

-- 4. Show all tracks ordered from longest to shortest.
SELECT *
FROM tracks
ORDER BY milliseconds DESC;

-- 5. Show all distinct countries where customers live.
SELECT DISTINCT country
FROM customers;

-- 6. Show track names and their album titles.
SELECT
    tracks.name AS track_name,
    albums.title AS album_title
FROM tracks
INNER JOIN albums
    ON tracks.album_id = albums.album_id;

-- 7. Show track names and their artist names.
SELECT
    tracks.name AS track_name,
    artists.name AS artist_name
FROM tracks
INNER JOIN albums
    ON tracks.album_id = albums.album_id
INNER JOIN artists
    ON albums.artist_id = artists.artist_id;

-- 8. Show each customer's full name and city.
SELECT
    first_name || ' ' || last_name AS full_name,
    city
FROM customers;

-- 9. Show invoice information together with the customer's full name.
SELECT
    customers.first_name || ' ' || customers.last_name AS full_name,
    invoices.invoice_id,
    invoices.invoice_date,
    invoices.total
FROM invoices
INNER JOIN customers
    ON invoices.customer_id = customers.customer_id;

-- 10. Show all tracks belonging to the Rock genre.
SELECT
    tracks.name AS track_name
FROM tracks
INNER JOIN genres
    ON tracks.genre_id = genres.genre_id
WHERE genres.name = 'Rock';

-- ============================================
-- LEVEL 3: AGGREGATIONS AND GROUPING
-- ============================================

-- 11. Count the customers in each country.
SELECT
    country,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY country;

-- 12. Count the tracks belonging to each genre.
SELECT
    genres.name AS genre_name,
    COUNT(tracks.track_id) AS total_tracks
FROM genres
INNER JOIN tracks
    ON genres.genre_id = tracks.genre_id
GROUP BY genres.name;

-- 13. Count the tracks belonging to each artist.
SELECT
    artists.name AS artist_name,
    COUNT(tracks.track_id) AS total_tracks
FROM artists
INNER JOIN albums
    ON artists.artist_id = albums.artist_id
INNER JOIN tracks
    ON albums.album_id = tracks.album_id
GROUP BY artists.name;

-- 14. Calculate the average price of all tracks.
SELECT
    AVG(unit_price) AS average_price
FROM tracks;

-- 15. Calculate the total amount spent by each customer.
SELECT
    customers.first_name || ' ' || customers.last_name AS full_name,
    SUM(invoices.total) AS total_spent
FROM customers
INNER JOIN invoices
    ON customers.customer_id = invoices.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name;
