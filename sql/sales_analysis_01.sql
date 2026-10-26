/* Calculate genres that represent a larger percentage of Japanese Sales
   compared to North American sales.
*/
WITH regional_totals AS (
    SELECT
        SUM(NA_Sales) AS total_na,
        SUM(JP_Sales) AS total_jp
    FROM video_game_sales
), genre_totals AS (
    SELECT
        Genre,
        SUM(NA_Sales) AS na_sales,
        SUM(JP_Sales) AS jp_sales
    FROM video_game_sales
    GROUP BY Genre
)
SELECT
    Genre,
    ROUND(NA_sales * 100.0 / total_na, 2) AS na_market_share,
    ROUND(JP_sales * 100.0 / total_jp, 2) AS jp_market_share,
    ROUND(
    (JP_sales * 100.0 / total_jp) -
    (NA_sales * 100.0 / total_na),
    2
    ) AS share_difference
FROM genre_totals
CROSS JOIN regional_totals
ORDER BY share_difference DESC;

/* Findings: Role-Playing games have the largest positive difference,
   with Japan's market share exceeding North America's by 19.84%. Shooter
   games have the largest negative difference, with North America's market
   share exceeding Japan's by 10.3%.
 */
