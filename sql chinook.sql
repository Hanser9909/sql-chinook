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
