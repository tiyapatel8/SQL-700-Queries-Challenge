use ftn;
-- 1.Display all records from the songs table.
    Select * from songs;

-- 2.Show only artist_name and title.
	Select artist_name , title 
	from songs;

-- 3.Display title and year of all songs.
	Select title , year 
	from songs;

-- 4.Show unique artist names.
	Select distinct artist_name 
	from songs;

-- 5.Display all songs released after 2010.
	Select song_id
	 from songs 
	where year<2010;

-- 6.Show songs where year = 0.
	Select * from songs
    where year = 0;

-- 7.Display songs with duration greater than 300 seconds.
	Select * from songs 
    where duration >300;

-- 8.Show songs with duration less than 100 seconds.
	Select * from songs 
	where duration < 100;

-- 9.Display all artists from "New York, NY".
	select artist_name from songs 
	where artist_location = "New York, NY";

-- 10.Show songs where artist_location is NULL.
	select * from songs 
	where artist_location = "";

-- 11.Display songs where artist_latitude is NOT NULL.
	select * from songs 
	where artist_latitude != "";

-- 12.Show all songs ordered by year ascending.
	select * from songs
	 order by year asc;

-- 13.Show songs ordered by duration descending.
	select * from songs
	 order by duration desc;

-- 14.Display first 10 records.
	select * from songs
	 limit 10;

-- 15.Count total number of songs.
	select count(Song_id)
	 from songs;

-- 16.Show songs released between 2000 and 2010.
	select * from songs 
	where year between 2000 and 2010;

-- 17.Display songs where duration between 200 and 250 seconds.
	select * from songs
	 where duration between 200 and 250;

-- 18.Show songs where artist_name starts with 'A'.
	select * from songs
	 where artist_name like "A%";

-- 19.Show songs where title ends with 'Love'.
	select * from songs
	 where title like "%Love";

-- 20.Display songs where title contains 'Girl'.
	select * from songs 
	where title like "%Girl%"

-- 21.Show songs where artist_name is either 'Gwen Stefani' or 'Marc Shaiman'.
	select * from songs 
	where artist_name ="Gwen Stefani" or artist_name="Marc Shaiman";

-- 22.Display songs where year is not 0.
	select * from songs 
	where year != 0;

-- 23.Show songs where artist_location contains 'CA'.
	select * from songs
	 where artist_location like "%CA%";

-- 24.Display songs where duration > 250 AND year > 2005.
	select * from songs 
	where duration > 250 AND year > 2005;

-- 25.Show songs where duration < 200 OR year = 0.
	select * from songs
	 where duration < 200 OR year = 0;

-- 26.Display songs where artist_latitude > 0.
	select * from songs 
	where artist_latitude > 0;

-- 27.Show songs where artist_longitude < 0.
	select * from songs
	 where artist_latitude < 0;

-- 28.Display songs where artist_name is not null.
	select * from songs 
	where artist_name is not null;

-- 29.Show songs released before 1990.
	select * from songs
	 where year < 1990;

-- 30.Display songs with num_songs = 1.
	select * from songs 
	where num_songs = 1;

-- 31.Find total number of artists.
	select count(artist_id)
	 from songs;

-- 32.Find average duration of songs.
	select avg(duration)
	 from songs;

-- 33.Find maximum duration.
	select max(duration)
	 from songs;

-- 34.Find minimum duration.
	select min(duration) 
	from songs;

-- 35.Find total duration of all songs.
	select sum(duration)from songs;

-- 36.Count songs released after 2015.
	select count(*) from songs
	 where year > 2015;

-- 37.Find average duration for songs released after 2010.
	select avg(duration) from songs
	 where year > 2010;

-- 38.Find number of songs per year.
	select year, count(*) from songs
	 group by year;

-- 39.Find total songs where year = 0.
	select count(*) from songs 
	where year="0";

-- 40.Find maximum year available.
	select max(year) from songs;

-- 41.Find minimum year available (excluding 0).
	select min(year) from songs 
	where year != 0;

-- 42.Count number of unique locations.
	select count(distinct artist_location) from songs;

-- 43.Find average duration grouped by artist_name.
	select artist_name, avg(duration) from songs 
	group by artist_name;

-- 44.Count songs per artist.
	select artist_name,  count(*) from songs
	 group by artist_name;

-- 45.Find total songs per location.
	select artist_location, count(*) from songs 
	group by artist_location;

-- 46.Count songs grouped by year.
	select year,count(*) from songs 
	group by year;

-- 47.Count songs grouped by artist_name.
	select artist_name,count(*) from songs
	 group by artist_name;

-- 48.Find average duration per year.
	select year, avg(duration) from songs 
	group by year;

-- 49.Find maximum duration per artist.
	select artist_name, max(duration) from songs 
	group by artist_name;

-- 50.Find artists having more than 5 songs.
	select artist_name, count(*) 
	from songs 
	group by artist_name 
	having count(*) > 5;

-- 51.Find years having more than 10 songs.
	select year,count(*) 
	from songs 
	group by year
	having count(*)>10;

-- 52.Find locations having more than 3 artists.
	select artist_location,count(distinct artist_name) as artist
	from songs 
	group by artist_location
	having count(distinct artist_name) > 3;

-- 53.Find artists whose average duration > 250 seconds.
	select artist_name , avg(duration) from songs 
	group by artist_name 
	having avg(duration) > 250;

-- 54.Count songs per location where year > 2000.
	select artist_location, count(*) from songs
	where year > 2000
	group by artist_location ;

-- 55.Find total duration per artist.
	select distinct artist_name , sum(duration) from songs
	group by artist_name;

-- 56.Show artists having songs released after 2015.
	select artist_name from songs 
	where year>2015;

-- 57.Show years where average duration > 300.
	select year , avg(duration) from songs
	group by year 
	having avg(duration) > 300;

-- 58.Count songs grouped by year excluding year = 0.
	select year , count(*) from songs 
	group by year
	having year!=0;

-- 59.Show artists having more than 1 song.
	select artist_name , count(*) from songs 
	group by artist_name 
	having count(*) > 1;

-- 60.Find locations with NULL latitude grouped count.
	select artist_location, count(*) from songs
	where artist_latitude IS NULL
	group by artist_location;

-- 61.Find songs with duration greater than average duration.
	select * from songs 
	where duration > (SELECT AVG(duration) from songs);

-- 62.Find songs released in the latest year.
	select * from songs 
	where year = (SELECT MAX(year) from songs);

-- 63.Find artist(s) with maximum duration song.
	select artist_name from songs
	where duration = (SELECT MAX(duration) from songs);

-- 64.Find songs with minimum duration.
	select * from songs 
	where duration = (SELECT MIN(duration) from songs);

-- 65.Find artists who have songs released in 2010.
	select distinct artist_name from songs 
	where year  = 2010;

-- 66. Display songs from 2005 ordered by duration.
	select * from songs where year = 2005
	order by duration desc;

-- 67. Find top 5 artists with the most songs.
	select artist_name, count(*) as total_songs from songs
	group by artist_name 
	order by total_songs desc
	limit 5;

-- 68. Find the number of songs released in each year.
	select year, count(*) as total_songs from songs
	group by year order by year;

-- 69. Find the average duration of songs for each artist.
	select artist_name, avg(duration) as avg_duration from songs
	group by artist_name;

-- 70. Find years where more than 10 songs were released.
	select year, count(*) as total_songs from songs
	group by year
	 having count(*) > 10;

-- 71.Find second highest duration song.
	select * from songs 
	order by duration DESC 
	limit 1
	offset 1;

-- 72.Find songs where duration equals maximum duration.
	select * from songs 
	where duration = (select max(duration) from songs);

-- 73. Find artist with earliest song release.
	select artist_name, year from songs
	order by year asc
	limit 1;

-- 74. Find the top 10 longest songs
	select * from songs
	order by duration desc
	limit 10;

-- 75. Find the number of songs from each duration.
	select duration, count(*) as total_songs from songs
	group by duration
	order by total_songs desc;

-- 76.Update year to NULL where year = 0.
	update songs SET year = null 
	where year = 0;

-- 77.Increase duration by 10 seconds for songs before 2000.
	update songs SET duration = duration + 10
	where year  < 2000;

-- 78.Update artist_location to 'Unknown' where NULL.
	update songs SET artist_location = "UNKNOWN" 
	where artist_location = NULL;

-- 79.Change artist_name from 'Marc Shaiman' to 'M. Shaiman'.
	update songs SET artist_name = "M. Shaiman"
	where artist_name = "Marc Shaiman";
	select * from songs where artist_name = "M. Shaiman";

-- 80.Update num_songs to 1 where it is NULL.
	update songs SET num_songs = 1
	where num_songs IS NULL;

-- 81.Delete songs where year = 0.
	delete from songs where year =  0;

-- 82.Delete songs with duration less than 50 seconds.
	delete from songs where duration < 50;

-- 83.Delete records where artist_name is NULL.
	delete from songs where artist_name IS NULL;

-- 84.Delete songs released before 1980.
	delete from songs where year < 1980;

-- 85.Delete songs where location is NULL.
	delete fromm songs where artist_location IS NULL;

-- 86.Add new column genre VARCHAR(50).
	alter table songs add genre varchar(50);

-- 87.Modify duration column to DECIMAL(10,2).
	alter table songs modify duration decimal(10,2);

-- 88.Rename column title to song_title.
	alter table songs Rename column title to song_title;

-- 89.Drop column artist_longitude.
	alter table songs drop column artist_longitude;

-- 90. Display all songs sorted by artist name
	select *from songs
	order by artist_name;

-- 91. Select songs released after 2010.
	select * from songs	where year > 2010;

-- 92. Display artist_name and total songs group by artist_name.
	select artist_name, count(*) as total_songs
	from songs group by artist_name;

-- 93. Find the total number of songs.
	select count(*) as total_songs from songs;

-- 94. Display all unique artist names.
	select distinct (artist_name) from songs;

-- 95. Find songs released in the year 2015.
	select * from songs where year = 2015;

-- 96. Display songs ordered by year (latest first).
	select * from songs order by year desc;

-- 97. Find the longest song duration.
	select max(duration) as longest_song from songs;

-- 98. Find the shortest song duration.
	select min(duration) as shortest_song from songs;

-- 99. Find the average song duration.
	select avg(duration) as average_duration from songs;

-- 100. Display songs with duration greater than 5 minutes.
	select * from songs where duration > 5;

-- 101. Find songs where artist_name contains 'John'
SELECT * FROM songs
WHERE artist_name LIKE '%John%';

-- 102. Show songs where title length > 10
SELECT * FROM songs
WHERE LENGTH(title) > 10;

-- 103. Count songs where duration is exactly 200
SELECT COUNT(*) FROM songs
WHERE duration = 200;

-- 104. Find songs with duration not between 100 and 200
SELECT * FROM songs
WHERE duration NOT BETWEEN 100 AND 200;

-- 105. Show songs where artist_location starts with 'Los'
SELECT * FROM songs
WHERE artist_location LIKE 'Los%';

-- 106. Display songs where year is even
SELECT * FROM songs
WHERE year % 2 = 0;

-- 107. Display songs where year is odd
SELECT * FROM songs
WHERE year % 2 != 0;

-- 108. Count songs with NULL artist_location
SELECT COUNT(*) FROM songs
WHERE artist_location IS NULL;

-- 109. Find songs where duration is divisible by 5
SELECT * FROM songs
WHERE duration % 5 = 0;

-- 110. Show songs with artist_name length < 5
SELECT * FROM songs
WHERE LENGTH(artist_name) < 5;

-- 111. Display songs where title is uppercase
SELECT * FROM songs
WHERE title = UPPER(title);

-- 112. Convert all artist names to lowercase
SELECT LOWER(artist_name) FROM songs;

-- 113. Concatenate artist_name and title
SELECT CONCAT(artist_name, ' - ', title) AS song_info
FROM songs;

-- 114. Find songs where duration rounded > 200
SELECT * FROM songs
WHERE ROUND(duration) > 200;

-- 115. Find songs released in the last 10 years
SELECT * FROM songs
WHERE year >= YEAR(CURDATE()) - 10;

-- 116. Find songs where duration is greater than average of same year
SELECT * FROM songs s1
WHERE duration > (
    SELECT AVG(duration)
    FROM songs s2
    WHERE s1.year = s2.year
);

-- 117. Rank songs by duration
SELECT title, duration,
RANK() OVER (ORDER BY duration DESC) AS rank_no
FROM songs;

-- 118. Dense rank songs by duration
SELECT title, duration,
DENSE_RANK() OVER (ORDER BY duration DESC) AS rank_no
FROM songs;

-- 119. Row number for songs
SELECT title,
ROW_NUMBER() OVER () AS row_num
FROM songs;

-- 120. Partition songs by artist and rank duration
SELECT artist_name, title, duration,
RANK() OVER (PARTITION BY artist_name ORDER BY duration DESC)
FROM songs;

-- 121. Running total of duration
SELECT duration,
SUM(duration) OVER () AS total_running
FROM songs;

-- 122. Find songs with same duration as another song
SELECT * FROM songs s1
WHERE EXISTS (
    SELECT 1 FROM songs s2
    WHERE s1.duration = s2.duration
    AND s1.song_id != s2.song_id
);

-- 123. Find duplicate titles
SELECT title, COUNT(*) FROM songs
GROUP BY title
HAVING COUNT(*) > 1;

-- 124. Show songs with NULL year replaced
SELECT IFNULL(year, 0) FROM songs;

-- 125. Find songs with title starting with vowel
SELECT * FROM songs
WHERE title REGEXP '^[AEIOUaeiou]';

-- 126. Find total songs per artist ordered desc
SELECT artist_name, COUNT(*) AS total
FROM songs
GROUP BY artist_name
ORDER BY total DESC;

-- 127. Find artists with exactly 2 songs
SELECT artist_name, COUNT(*)
FROM songs
GROUP BY artist_name
HAVING COUNT(*) = 2;

-- 128. Find songs with title length between 5 and 15
SELECT * FROM songs
WHERE LENGTH(title) BETWEEN 5 AND 15;

-- 129. Find songs with artist_location not NULL
SELECT * FROM songs
WHERE artist_location IS NOT NULL;

-- 130. Find difference between max and min duration
SELECT MAX(duration) - MIN(duration) AS duration_diff
FROM songs;

-- 131. Show songs sorted by artist_name and year
SELECT * FROM songs
ORDER BY artist_name, year;

-- 132. Find total duration per year ordered desc
SELECT year, SUM(duration)
FROM songs
GROUP BY year
ORDER BY SUM(duration) DESC;

-- 133. Find average duration per location
SELECT artist_location, AVG(duration)
FROM songs
GROUP BY artist_location;

-- 134. Find songs with duration equal to second highest
SELECT * FROM songs
WHERE duration = (
    SELECT DISTINCT duration
    FROM songs
    ORDER BY duration DESC
    LIMIT 1 OFFSET 1
);

-- 135. Find songs where title has exactly 5 characters
SELECT * FROM songs
WHERE LENGTH(title) = 5;

-- 136. Count songs where artist_name ends with 'n'
SELECT COUNT(*) FROM songs
WHERE artist_name LIKE '%n';

-- 137. Show songs where duration is multiple of 10
SELECT * FROM songs
WHERE duration % 10 = 0;

-- 138. Find songs with maximum duration per year
SELECT year, MAX(duration)
FROM songs
GROUP BY year;

-- 139. Find artists with minimum duration song
SELECT artist_name
FROM songs
WHERE duration = (SELECT MIN(duration) FROM songs);

-- 140. Create view for long songs
CREATE VIEW long_songs AS
SELECT * FROM songs
WHERE duration > 300;

-- 141. Select from view
SELECT * FROM long_songs;

-- 142. Create temporary table for short songs
CREATE TEMPORARY TABLE short_songs AS
SELECT * FROM songs WHERE duration < 150;

-- 143. Select from temp table
SELECT * FROM short_songs;

-- 144. Find songs where duration squared > 10000
SELECT * FROM songs
WHERE duration * duration > 10000;

-- 145. Find songs with duration greater than all songs of year 2000
SELECT * FROM songs
WHERE duration > ALL (
    SELECT duration FROM songs WHERE year = 2000
);

-- 146. Find songs with duration less than any song of year 2010
SELECT * FROM songs
WHERE duration < ANY (
    SELECT duration FROM songs WHERE year = 2010
);

-- 147. Show artists with no location
SELECT artist_name FROM songs
WHERE artist_location IS NULL;

-- 148. Count songs grouped by first letter of artist_name
SELECT LEFT(artist_name,1), COUNT(*)
FROM songs
GROUP BY LEFT(artist_name,1);

-- 149. Find songs where artist location is null
SELECT * FROM songs
WHERE  artist_location IS NULL;

-- 150. Show songs where duration > 3 minutes (180 sec)
SELECT * FROM songs
WHERE duration > 180;