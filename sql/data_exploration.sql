-- Find all unique gaming platforms
SELECT DISTINCT Platform
FROM video_game_sales
ORDER BY Platform;

-- Order platforms by amount of game entries
SELECT
    Platform,
    COUNT(*) AS total_games
FROM video_game_sales
GROUP BY Platform
ORDER BY total_games DESC;

-- Order platforms by total global game sales
SELECT
    Platform,
    SUM(Global_Sales) AS total_sales
FROM video_game_sales
GROUP BY Platform
ORDER BY total_sales DESC;

-- Order game genres by total global game sales
SELECT
    Genre,
    SUM(Global_Sales) AS total_sales
FROM video_game_sales
GROUP BY Genre
ORDER BY total_sales DESC;
