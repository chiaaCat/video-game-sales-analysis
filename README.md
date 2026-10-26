## Video Game Sales Analysis
Uses SQL to explore historical video game sales across gaming platforms, genres, and regions.

**Goal:** To understand differences in regional gaming preferences, how much platforms rely on their best-selling games, and how regional sales patterns vary by release year.

---
### Dataset

The dataset used in this project was obtained from Kaggle:
[Video Game Sales Dataset](https://www.kaggle.com/datasets/anandshaw2001/video-game-sales)

This dataset contains 16,598 video game records, including:

- Game title, platform, genre, and publisher
- Release year
- Sales in North America, Europe, Japan, and other regions - measured in millions
- Global sales

### Technologies Used
- SQLite
- SQL
- Pycharm

---
### Analysis and Findings

#### 1. Regional Genre Preferences

Compared the percentage of video game sales for each genre in North America and Japan.

**Findings:** Role-Playing games had the largest positive difference, with Japan having 19.84% 
              more market share compared to North America. Shooter games had the largest negative 
              difference, with North America having 10.3% more market share compared to Japan.

**SQL techniques:** CTEs, `CROSS JOIN`, `GROUP BY`, `SUM()`, percentage calculations.

#### 2. Platform Game Reliance

Calculated what percentage of each platform's total sales came from its three best-selling game entries. Platforms with fewer than 50 recorded games were excluded from this comparison.

**Findings:** NES had the highest top-three-share percentage at 34.19% of its sales coming 
              from three best-selling games.

**SQL techniques:** CTEs, `ROW_NUMBER()`, `PARTITION BY`, joins.

#### 3. Yearly Regional Sales Trends

Compared North American, European, and Japanese sales totals for games grouped by release year.

**Findings:** North America and Japan alternated as leading sales regions from 1980 to 1995, 
              where North America then led the sales from 1996 to 2015. Europe only led in 2016.

**SQL techniques:** CTEs, `CASE WHEN`, `SUM()`, `GROUP BY`.


