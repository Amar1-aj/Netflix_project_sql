 DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix(
show_id VARCHAR(5),
type VARCHAR(10),
title VARCHAR(250),
director VARCHAR(550),
casts VARCHAR(1050),
country VARCHAR(550),
date_added VARCHAR(55),
release_year INT,
rating VARCHAR(55),
duration VARCHAR(15),
listed_in VARCHAR(250),
description VARCHAR(550)
);

SELECT * FROM netflix;

-- 15 Business Problem and Solution

-- Q1. Count the Number of Movies vs TV Shows

   SELECT 
       type,
	   count(*)
	   FROM netflix
	   GROUP BY 1;
	   
-- Objective: Determine the distribution of content types on Netflix

--Q2. Find the Most Common Rating for Movies and TV Shows

	SELECT 
		type,
		rating
	FROM
	(
	 SELECT 
			type,
			rating,
			COUNT(*),
			RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
			FROM netflix
			GROUP BY 1,2
	) AS t1
	WHERE 
		ranking = 1

--Q3. List all movies released in a specific year (e.g., 2020)		

-- Filter 2020
-- movies

SELECT * FROM netflix
WHERE
	type ='Movie'
	AND
	release_year = 2020

-- Q4. Find the top 5 countries with the most content on Netflix

 SELECT 
 		country,
		COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1




SELECT
		UNNEST(STRING_TO_array(country, ',')) AS new_country
FROM netflix




 SELECT 
 		UNNEST(STRING_TO_array(country, ',')) AS new_country,
		COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


-- Q5. Identify the longest movie?

SELECT * FROM netflix
WHERE 
	type = 'Movie'
	AND
	duration = (SELECT MAX(duration)FROM netflix)

-- Q.6 Find content added in the last 5 years

SELECT 
 	*
	 FROM netflix
WHERE
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'



SELECT CURRENT_	DATE - INTERVAL '5 years'


--Q.7 Find all the movie/TV show by director 'Rajiv Chilaka'?

SELECT * FROM netflix
WHERE director = 'Rajiv Chilaka'


SELECT * FROM netflix
WHERE director LIKE '%Rajiv Chilaka%'

SELECT * FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'     --ILIKE  Function is used to read all letter either it is start from upper or lower case


--Q.8 List all TV shows with more than 5 seasons

SELECT 
      * 
FROM netflix
WHERE 
 	type = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::numeric > 5

	
SELECT 
SPLIT_PART('Apple Banana Cherry', ' ', 1)


--Q.9 Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ' ')) As genre,
	COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1

/*
--Q.10 Find each year and the average numbers if content release by India on netflix.
return top 5 year with height avg content release! */

total content 333/972

SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_content,
	ROUND(
	COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100 ,2) AS avg_content_per_year
	FROM netflix
	WHERE country = 'India'
	GROUP BY 1
	
	
--Q.11 List all movies that are documentaries

SELECT * FROM netflix
WHERE 
	listed_in ILIKE '%documentaries%'

--Q.12 Find all content without a director

SELECT * FROM netflix
WHERE
	director IS NULL

--Q.13 Find how many year actor 'Salman Khan' appeared in last 10 years!

 SELECT * FROM netflix
 WHERE 
 	casts ILIKE '%Salman Khan%'
	 AND
	 release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

--Q.14 Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT 
UNNEST(STRING_TO_ARRAY(casts, ',')) AS actors,
COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%india%'
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10

/*
Q.15 Categorize the content based on the presence of the keybords 'kill' and 'violence' in
the description field, Label content containing these keywords as 'Bad' and all other
content as 'Good'. Count how many itmes fall into each category. 
*/

WITH new_table
AS
(
SELECT
*,
	CASE
	WHEN
		description ILIKE '%kill%%' OR
		description ILIKE '%violence%' THEN 'BAD_Content'
		ELSE 'Good Content'
	END category
FROM netflix
)
SELECT 
	category,
	COUNT(*) AS total_content
FROM new_table
GROUP BY 1





SELECT * FROM netflix
WHERE 
		description	ILIKE '%Kill%'
		OR 
		description ILIKE '%violence%'
		
	
	








 

