/* Calculate how much of each platform's sales
   comes from its three best-selling games.
 */
WITH ranked_games AS (
    SELECT
        Platform,
        Global_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Platform
            ORDER BY Global_Sales DESC
        ) AS sales_rank
    FROM video_game_sales
),
platform_sales AS (
    SELECT
        Platform,
        COUNT(*) AS total_games,
        SUM(Global_Sales) AS total_sales
    FROM video_game_sales
    GROUP BY Platform
),
top_three_sales AS (
    SELECT
        Platform,
        SUM(Global_Sales) AS top_three_total
    FROM ranked_games
    WHERE sales_rank <= 3
    GROUP BY Platform
)
SELECT
    p.Platform,
    p.total_games,
    ROUND(p.total_sales, 2) AS total_sales,
    ROUND(t.top_three_total, 2) AS top_three_sales,
    ROUND(t.top_three_total * 100.0 / p.total_sales, 2)
        AS top_three_share
FROM platform_sales p
JOIN top_three_sales t
    ON p.Platform = t.Platform
WHERE p.total_games >= 50
ORDER BY top_three_share DESC;

/* Findings: Among platforms with at least 50 games,
   NES has the highest top-three-share percentage at
   34.19% of its sales coming from three best-selling
   games.
 */