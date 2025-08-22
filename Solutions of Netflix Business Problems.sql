-- NETFLIX PROJECT
-- Netflix Data Analysis using SQL

-- Solutions of 15 Business Problems


-- 1. Count the number of Movies vs TV Shows

SELECT type, COUNT(*) as total_content FROM netflix GROUP BY type;

-- 2. Find the most common rating for movies and TV shows

SELECT type, rating, COUNT(*) as total_content FROM netflix GROUP BY type, rating ORDER BY 1, 3 DESC;
SELECT type, rating, COUNT(*), RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking FROM netflix GROUP BY type, rating;

SELECT type, rating FROM 
(
SELECT type, rating, COUNT(*), 
RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
FROM netflix GROUP BY type, rating
) as t1
WHERE ranking = 1;

-- 3. List all movies released in a specific year (e.g. 2020)

SELECT * FROM netflix WHERE type = 'Movie' AND release_year = 2020;

-- 4. Find the top 5 countries with the most content on netflix

SELECT UNNEST(STRING_TO_ARRAY(country, ',')) as new_country FROM netflix;
SELECT UNNEST(STRING_TO_ARRAY(country, ',')) , COUNT(*) AS counting FROM netflix GROUP BY 1 ORDER BY 2 DESC LIMIT 5;

-- 5. Identify the longest movie

SELECT * FROM netflix WHERE type = 'Movie' AND duration = (SELECT MAX(duration) FROM netflix);

-- 6. Find content added in the last 5 years

SELECT CURRENT_DATE - INTERVAL '5 years';
SELECT * FROM netflix WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT * FROM netflix WHERE director ILIKE '%Rajiv Chilaka%';

-- 8. List all TV shows with more than 5 seasons

SELECT * FROM netflix WHERE type = 'TV Show' AND SPLIT_PART(duration, ' ', 1)::numeric > 5;

























