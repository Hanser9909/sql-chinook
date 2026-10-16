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
