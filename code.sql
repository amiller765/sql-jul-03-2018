-- 2.1 Quiz Funnel
-- Question 1: Select all columns from the first 10 rows. What columns does the table have? 

SELECT *
FROM survey
LIMIT 10;

-- 2.1 Quiz Funnel
-- Question 2: Creat a quiz funnel using the GROUP BY command. 

SELECT question , 
	COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

-- 2.1 Quiz Funnel
-- Question 3 A & B done using a spreadsheet program

-- Begin 2.2 Home Try-On Funnel

-- 2.2 Home Try-On Funnel
-- Question 4: Examine the first five rows of each table

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;


-- 2.2 Home Try-On Funnel
-- Question 5: Create new table using LEFT JOIN

SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
LIMIT 10;

-- 3 Home Try-On Funnel - A/B Testing
-- Question 6 - How many distinct users?

-- How many distinct users?
SELECT COUNT(DISTINCT q.user_id),
   h.user_id IS NOT NULL AS 'is_home_try_on',
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
LEFT JOIN purchase AS p
   ON p.user_id = q.user_id;
   
-- How many purchases resultd from 3-pair-home-try-on?
SELECT h.number_of_pairs,
   SUM(p.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
   WHERE h.number_of_pairs LIKE '%3%';
   
-- How many purchases resultd from 5-pair-home-try-on?
SELECT h.number_of_pairs,
   SUM(p.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
   WHERE h.number_of_pairs LIKE '%5%';

-- Total Purchases to double-check
SELECT
   SUM(p.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
LEFT JOIN purchase AS p
   ON p.user_id = q.user_id;

-- 4 Double-checking our data
-- Double-checking how many users (quiz table)
SELECT COUNT(user_id)
FROM quiz;

-- Compare to distinct users (quiz table)
SELECT COUNT(DISTINCT user_id)
FROM quiz;

-- Double-checking how many users (home_try_on table)
SELECT COUNT(user_id)
FROM home_try_on;

-- Compare to distinct users (home_try_on table)
SELECT COUNT(DISTINCT user_id)
FROM home_try_on;

-- Double-checking how many users (purchase table)
SELECT COUNT(user_id)
FROM purchase;

-- Compare to distinct users (purchase table)
SELECT COUNT(DISTINCT user_id)
FROM purchase;

-- 5 Results
-- Compares results from previous slides and questions

-- 6.1 Other important information
-- Common results of the style quiz
-- Which is more popular, Men's or Woman's?

SELECT style,
	COUNT(style) AS 'total'
FROM quiz
GROUP BY 1;

-- 6.2 Other important information
-- Which fit is the most popular?

-- Finding Woman's Preferences
SELECT fit,
	COUNT(fit) AS 'w_fit_q_total'
FROM quiz
WHERE style = "Women's Styles"
GROUP BY 1;

-- Finding Men's Preferences
SELECT fit,
	COUNT(fit) AS 'm_fit_q_total'
FROM quiz
WHERE style = "Men's Styles"
GROUP BY 1;

-- 6.3 Other important information
-- Which shape is the most popular?

-- Finding Woman's Preferences
SELECT shape,
	COUNT(shape) AS 'w_shape_q_total'
FROM quiz
WHERE style = "Women's Styles"
GROUP BY 1;

-- Finding Men's Preferences
SELECT shape,
	COUNT(shape) AS 'm_shape_q_total'
FROM quiz
WHERE style = "Men's Styles"
GROUP BY 1;

-- 6.4 Other important information
-- Which color is the most popular?

-- Finding Woman's Preferences
SELECT color,
	COUNT(color) AS 'w_color_q_total'
FROM quiz
WHERE style = "Women's Styles"
GROUP BY 1;

-- Finding Men's Preferences
SELECT color,
	COUNT(color) AS 'm_color_q_total'
FROM quiz
WHERE style = "Men's Styles"
GROUP BY 1;






