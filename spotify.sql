                         -- Easy Level
-- Retrieve the names of all tracks that have more than 1 billion streams.
Select 
track 
from spotify 
where stream>1000000;

-- List all albums along with their respective artists.
select 
distinct artist,
album 
from spotify;

-- Get the total number of comments for tracks where licensed = TRUE.
select 
sum(comments) as 'Total_number_of_comments' 
from spotify 
where licensed='True';

-- Find all tracks that belong to the album type single.
select 
distinct track 
from spotify 
where album_type='single';

-- Count the total number of tracks by each artist.
select 
artist,
count(*) as 'Total_number_of_tracks' 
from spotify 
group by artist;

                       -- Medium Level
                       
-- Calculate the average danceability of tracks in each album.
Select 
album,
avg(danceability) as 'Average_danceability' 
from spotify 
group by album;

-- Find the top 5 tracks with the highest energy values.
select 
track,
max(energy) 
from spotify 
group by track 
limit 5;

-- List all tracks along with their views and likes where official_video = TRUE.
select 
track,
sum(views) as 'total_views',
sum(likes) as 'total_likes' 
from spotify 
where official_video='true' 
group by track;

-- For each album, calculate the total views of all associated tracks.
select 
distinct album,
sum(views) as 'total_views' 
from spotify 
group by album;

-- Retrieve the track names that have been streamed on Spotify more than YouTube.

With streamed as (
select track,
coalesce(sum(case when most_playedon='spotify' then stream end),0) as 'Total_spotify_streamed',
coalesce(sum(case when most_playedon='youtube' then stream end),0) as 'Total_youtube_streamed'
from spotify
group by track
)
select track,
Total_spotify_streamed,
Total_youtube_streamed 
from streamed 
where Total_spotify_streamed>Total_youtube_streamed 
and Total_youtube_streamed<>0;


                      -- Advanced Level
-- Find the top 3 most-viewed tracks for each artist using window functions.

With mostviewdtracks as (
select artist,
track,
views,
dense_rank() over(partition by artist order by views desc) as 'Most_viewed_tracks' 
from spotify
)
select * 
from mostviewdtracks 
where Most_viewed_tracks<=3;

-- Write a query to find tracks where the liveness score is above the average.

select 
distinct track 
from spotify 
where liveness>
(select avg(liveness) from spotify);

-- Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

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

