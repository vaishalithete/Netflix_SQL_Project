-- Netflix Project

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix 
(
	show_id	VARCHAR(6),
	type	VARCHAR(10),
	title	VARCHAR(160),
	director VARCHAR(220),	
	casts     VARCHAR(1000),	
	country	 VARCHAR(160),
	date_added	VARCHAR(60),
	release_year  INT,
	rating	   VARCHAR(15),
	duration   VARCHAR(25), 
	listed_in	VARCHAR(100),
	description  VARCHAR(270)
);

SELECT * FROM netflix;








