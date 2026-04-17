
-- MOVIE STREAMING PLATFORM DATABASE (NETFLIX-LIKE)

CREATE TABLE watch_history (
    record_id INT PRIMARY KEY,
    user_id VARCHAR(10),
    user_name VARCHAR(50),
    region VARCHAR(50),
    subscription_type VARCHAR(20),
    movie_id VARCHAR(10),
    title VARCHAR(100),
    genre VARCHAR(50),
    type VARCHAR(20),
    watch_time_minutes INT,
    duration_minutes INT,
    watch_date DATE,
    rating INT,
    device VARCHAR(30),
    status VARCHAR(20)
);

-- =========================================================
-- INSERT DATA
-- =========================================================
-- Import the CSV file 'movie_streaming_watch_history_10001_11470.csv'
-- using MySQL Workbench or any SQL import tool.

--  TOP 10 MOST WATCHED MOVIES/SHOWS

SELECT title, COUNT(*) AS total_views
FROM watch_history
GROUP BY title
ORDER BY total_views DESC
LIMIT 10;

--  MOST WATCHED GENRES

SELECT genre, COUNT(*) AS total_views
FROM watch_history
GROUP BY genre
ORDER BY total_views DESC;

--  AVERAGE WATCH TIME PER USER

SELECT user_id, user_name, 
       ROUND(AVG(watch_time_minutes), 2) AS avg_watch_time
FROM watch_history
GROUP BY user_id, user_name
ORDER BY avg_watch_time DESC;

--  AVERAGE COMPLETION RATE PER TITLE

SELECT title,
       ROUND(AVG((watch_time_minutes * 100.0) / duration_minutes), 2) AS avg_completion_rate
FROM watch_history
GROUP BY title
ORDER BY avg_completion_rate DESC;

--  TOP 10 TRENDING SHOWS BY REGION

SELECT region, title, COUNT(*) AS total_views
FROM watch_history
GROUP BY region, title
ORDER BY region, total_views DESC;

--  INACTIVE USERS (NO ACTIVITY IN LAST 30 DAYS)

SELECT user_id, user_name, MAX(watch_date) AS last_watch_date
FROM watch_history
GROUP BY user_id, user_name
HAVING DATEDIFF(CURDATE(), MAX(watch_date)) > 30;

--  AVERAGE RATING PER GENRE

SELECT genre, ROUND(AVG(rating), 2) AS avg_rating
FROM watch_history
GROUP BY genre
ORDER BY avg_rating DESC;

--  DEVICE USAGE ANALYSIS

SELECT device, COUNT(*) AS total_views
FROM watch_history
GROUP BY device
ORDER BY total_views DESC;

--  SUBSCRIPTION TYPE VS AVERAGE WATCH TIME

SELECT subscription_type,
       ROUND(AVG(watch_time_minutes), 2) AS avg_watch_time
FROM watch_history
GROUP BY subscription_type
ORDER BY avg_watch_time DESC;

--  MOST ACTIVE REGIONS (BY TOTAL WATCH TIME)

SELECT region, SUM(watch_time_minutes) AS total_watch_time
FROM watch_history
GROUP BY region
ORDER BY total_watch_time DESC;

--  TOP USERS BY TOTAL WATCH TIME

SELECT user_id, user_name,
       SUM(watch_time_minutes) AS total_watch_time
FROM watch_history
GROUP BY user_id, user_name
ORDER BY total_watch_time DESC
LIMIT 10;

--  DAILY WATCH TRENDS

SELECT watch_date, COUNT(*) AS total_views
FROM watch_history
GROUP BY watch_date
ORDER BY watch_date;

--  TITLES WITH LOWEST COMPLETION RATES

SELECT title,
       ROUND(AVG((watch_time_minutes * 100.0) / duration_minutes), 2) AS avg_completion_rate
FROM watch_history
GROUP BY title
ORDER BY avg_completion_rate ASC
LIMIT 10;

--  AVERAGE RATING BY SUBSCRIPTION TYPE

SELECT subscription_type, ROUND(AVG(rating), 2) AS avg_rating
FROM watch_history
GROUP BY subscription_type
ORDER BY avg_rating DESC;

--  GENRE POPULARITY BY REGION

SELECT region, genre, COUNT(*) AS total_views
FROM watch_history
GROUP BY region, genre
ORDER BY region, total_views DESC;


-- ✅ Identify top-performing genres & regions
-- ✅ Detect inactive users for re-engagement campaigns
-- ✅ Understand device usage trends
-- ✅ Measure engagement via completion rates
-- ✅ Compare user engagement across subscription plans
-- ✅ Improve recommendations using trending content data

