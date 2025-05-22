## Netflix Content Analysis with SQL
### Project Overview
This project focuses on analyzing the Netflix content catalog using SQL. The goal is to derive meaningful insights from the dataset such as content distribution, genre popularity, actor/director appearances, content ratings, and trends over time.

### Tools & Technologies
•	SQL (PostgreSQL)

•	Dataset: Netflix content dataset (netflix_titles.csv)

•	SQL IDE or PostgreSQL client (e.g., pgAdmin)

________________________________________
## Key Analyses Performed
1.	Content Type Distribution
Count of Movies vs TV Shows

2.	Common Ratings by Type
Most frequent content ratings (e.g., TV-MA, PG)

3.	Released Movies in a Specific Year
Example: Movies released in 2020

4.	Top Countries by Content Volume
Unnest and aggregate content counts by country

5.	Longest Movie Identification
Ordered by duration length

6.	Recently Added Content
Filtered by the last 5 years

7.	Content by Specific Director
Example: 'Rajiv Chilaka'

8.	TV Shows with More Than 5 Seasons

9.	Genre-wise Content Distribution
Count of items per genre

10.	Top Years for Indian Content
Based on average contribution per year

11.	List of Documentary Movies

12.	Content Without Directors

13.	Movies Featuring 'Salman Khan' (Last 10 Years)

14.	Top 10 Most Frequent Actors in Indian Movies

15.	Content Categorization Based on Descriptions Labeling content as "Good" or "Bad" based on keywords like 'kill' and 'violence'
________________________________________
##  How to Use
1.	Import the dataset into a PostgreSQL database (convert netflix_titles.csv if needed).
2.	Create the netflix table using the provided schema.
3.	Run each SQL query in sequence to explore the data and extract insights.
4.	Modify filters (like director name or year) to perform custom analysis.
________________________________________
## Key Learnings
•	Efficient use of GROUP BY, WINDOW FUNCTIONS, and STRING operations

•	Data wrangling using UNNEST, SPLIT_PART, and filtering logic

•	Application of CTEs and conditional logic for categorization
________________________________________
## Conclusion
This project demonstrates how SQL can be used to uncover trends and insights in entertainment data. It’s a solid example of leveraging relational databases for analytical storytelling.
________________________________________
## Files Included
•	SQL_Query.pdf – Contains all SQL queries used in this project

•	netflix_titles.csv – Source dataset
________________________________________
## Contact
If you have feedback, questions, or collaboration ideas, feel free to connect with me on https://www.linkedin.com/in/nikhil-kumar-3982a9348/.



💬 Always happy to connect with fellow data enthusiasts and professionals!

