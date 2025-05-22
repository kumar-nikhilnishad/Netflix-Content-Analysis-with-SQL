-- SCHEMAS of Netflix

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);


SELECT * FROM netflix;

--Q1.Count the number of Movies vs TV Shows

SELECT
      type,
	  COUNT(*) AS total_count
FROM netflix
GROUP BY 1;
------------------------------------------------------------------------------------------------------------

--Q2.Find the most common rating for movies and TV shows

SELECT
      type,
	  rating,
	  COUNT(*) AS rating_count
FROM
(
SELECT
      type,
	  rating,
	  COUNT(*) AS rating_count,
	  RANK () OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS rn
FROM netflix
GROUP BY 1,2
) AS t1
WHERE rn=1
GROUP BY 1,2;
----------------------------------------------------------------------------------------------------------------

--Q3.List all movies released in a specific year (e.g., 2020)

SELECT * FROM netflix
WHERE release_year = '2020' AND type = 'Movie';
---------------------------------------------------------------------------------------------------------------

--Q4.Find the top 5 countries with the most content on Netflix

SELECT * FROM
(
SELECT
      UNNEST(STRING_TO_ARRAY(country,',')) AS country,
	  COUNT(*) AS total_content
FROM netflix
GROUP BY 1
) AS t1
WHERE country IS NOT NULL AND country <> 'unknown'
ORDER BY 2 DESC
LIMIT 5;
---------------------------------------------------------------------------------------------------------------

--Q5.Identify the longest movie

SELECT * FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration,' ', 1)::INT DESC;
--------------------------------------------------------------------------------------------------------------

--Q6.Find content added in the last 5 years

SELECT * FROM netflix
WHERE date_added >= CURRENT_DATE - INTERVAL '5 years';
--------------------------------------------------------------------------------------------------------------

--Q7.Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT *
FROM
(
SELECT
      type,
	  UNNEST(STRING_TO_ARRAY(director, ',')) AS director_name
FROM netflix
) AS t1
WHERE 
director_name = 'Rajiv Chilaka';
--------------------------------------------------------------------------------------------------------------

--Q8.List all TV shows with more than 5 seasons

SELECT * FROM netflix
WHERE
     type = 'TV Show'
	 AND
	 SPLIT_PART(duration, ' ', 1)::INT > 5;
--------------------------------------------------------------------------------------------------------------

--Q9.Count the number of content items in each genre

SELECT
      UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	  COUNT(*) AS total_content
FROM netflix
GROUP BY 1;
------------------------------------------------------------------------------------------------------------

--Q10.Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !

SELECT
      country,
	  EXTRACT(YEAR FROM date_added) AS year,
	  COUNT(*) AS total_content,
	  ROUND(COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric*100,2) AS avg_content
FROM netflix
WHERE country = 'India'
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 5;
------------------------------------------------------------------------------------------------------------

--Q11.List all movies that are documentaries

SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries%'
AND type = 'Movie';
-------OR-------

SELECT * FROM netflix
WHERE listed_in ILIKE '%documentaries%'
AND type = 'Movie';
------------------------------------------------------------------------------------------------------------

--Q12.Find all content without a director

SELECT * FROM netflix
WHERE director IS NULL;
-----------------------------------------------------------------------------------------------------------

--Q13.Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE casts LIKE '%Salman Khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
-----------------------------------------------------------------------------------------------------------

--Q14.Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT
      UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
	  COUNT(*) AS movie_count
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
-----------------------------------------------------------------------------------------------------------

--Q15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.

WITH CTE AS
(
SELECT 
	  CASE
	      WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
		  ELSE 'Good'
	  END AS category
FROM netflix
)
SELECT 
      category,
	  COUNT(*) AS content_count
FROM CTE
GROUP BY 1;
------------------------------------------------------------------------------------------------------------










































