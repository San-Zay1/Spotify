# Spotify Advanced SQL Project
Project Category: Advanced
[Click Here to get Dataset](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)
 ![Image Alt](https://github.com/San-Zay1/Spotify/blob/5e45474e58f7ad02742615123d1b7a62aa8397fc/spotify_logo.jpg)

## Overview
This project involves working with a Spotify dataset that contains information about songs, albums, and artists. The main tasks include organizing the dataset into a structured format, writing SQL queries (easy, medium, and advanced), and analyzing the data to find useful insights. The goal is to improve SQL skills and understand trends in the music industry.

```sql
-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
```
## Project Steps

### 1. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:
- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

### 4. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions, and joins.
  
#### Advanced Queries
- Nested subqueries, window functions, CTEs, and performance optimization.
  
---

## 15 Practice Questions

### Easy Level
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where `licensed = TRUE`.
4. Find all tracks that belong to the album type `single`.
5. Count the total number of tracks by each artist.

### Medium Level
1. Calculate the average danceability of tracks in each album.
2. Find the top 5 tracks with the highest energy values.
3. List all tracks along with their views and likes where `official_video = TRUE`.
4. For each album, calculate the total views of all associated tracks.
5. Retrieve the track names that have been streamed on Spotify more than YouTube.

### Advanced Level
1. Find the top 3 most-viewed tracks for each artist using window functions.
2. Write a query to find tracks where the liveness score is above the average.
3. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**
```sql
With energydifference as (
select 
album,
max(energy) as 'Highest_energy',
min(energy) as 'Lowest_energy'
from spotify
group by album
)
select album,
Highest_energy-Lowest_energy as 'Energy_differences' 
from energydifference 
order by Highest_energy desc;
```
   
5. Find tracks where the energy-to-liveness ratio is greater than 1.2.
6. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.



## Technology Stack
- **Database**: Mysql
- **SQL Queries**: DDL, DML, Aggregations, Joins, Subqueries, Window Functions, CTE
- **Tools**: MysqlWorkbench

## How to Run the Project
1. Install MySQL and MySQLWorkbench.
2. Set up the database schema and tables using the provided normalization structure.
3. Import the .csv file into the table.
4. Execute SQL queries to solve the listed problems.

---

