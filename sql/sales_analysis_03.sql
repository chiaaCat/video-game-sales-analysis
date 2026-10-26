/* Identify which region had the highest recorded
   sales for games released in the same year.
 */
WITH yearly_sales AS (
    SELECT
        Year,
        SUM(NA_Sales) AS na_sales,
        SUM(EU_Sales) AS eu_sales,
        SUM(JP_Sales) AS jp_sales
    FROM video_game_sales
    WHERE Year IS NOT NULL
        AND Year != 'N/A'
    GROUP BY Year
)
SELECT
    Year,
    ROUND(na_sales, 2) AS na_sales,
    ROUND(eu_sales, 2) AS eu_sales,
    ROUND(jp_sales, 2) AS jp_sales,
    CASE
        WHEN na_sales >= eu_sales AND na_sales >= jp_sales
            THEN 'North America'
        WHEN eu_sales >= na_sales AND eu_sales >= jp_sales
            THEN 'Europe'
        ELSE 'Japan'
    END AS leading_region
FROM yearly_sales
ORDER BY Year;

/* Findings: North America and Japan alternated as leading
   sales regions from 1980 to 1995, where North America
   then led the sales from 1996 to 2015. Europe only led
   in 2016.
 */