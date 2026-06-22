-- create database sales;
use sales;
-- 1.Show all companies in the dataset.
select * from german_fintechcompanies;

-- 2.Display only the Name and City of companies.
select Name , City from german_fintechcompanies;

-- 3.Find all companies located in Germany.
select * from german_fintechcompanies 
where country = "Germany";

-- 4.Show companies founded after 2015.
select * from german_fintechcompanies
where Founding_year < 2015;

-- 5.Find companies whose status is Active.
select * from german_fintechcompanies
where Status = "Active";

-- 6.Display companies from Berlin.
select * from german_fintechcompanies
where city = "Berlin";

-- 7.Show companies whose Segment is Payments.
select name,segment from german_fintechcompanies
where segment = "Payments";

-- 8.List companies with Bank Cooperation = Yes.
select * from german_fintechcompanies 
where Bank_Cooperation = "Yes";

-- 9.Show companies that have a Former name.
select * from german_fintechcompanies
where `Former name` IS NOT NULL;

-- 10.Display companies with missing Founder information.
select * from german_fintechcompanies
where 'Founder information' IS NULL;

-- 11 Find companies founded before 2010.
SELECT * FROM german_fintechCompanies
where Founding_year < 2010;

-- 12 Show companies located in Munich.
SELECT * FROM german_fintechCompanies
where City = 'Munich';

-- 13 Display companies whose Name starts with 'A'.
SELECT * from german_fintechCompanies
where Name LIKE 'A%';

-- 14 Find companies whose Name contains 'Pay'.
SELECT * FROM german_fintechCompanies
where Name LIKE '%Pay%';

-- 15 Show companies with Postal code starting with 1.
SELECT * FROM german_fintechCompanies
WHERE Postal_code LIKE '1%';

-- 16 Show all companies sorted by Name.
Select * from german_fintechcompanies
ORDER BY Name;

-- 17 Show companies sorted by Founding_year (newest first).
Select * from german_fintechcompanies
ORDER BY Founding_year DESC;

-- 18 Display companies sorted by City.
Select Name, City from german_fintechcompanies
ORDER BY City;

-- 19 Show companies sorted by Postal_code.
Select * from german_fintechcompanies
ORDER BY Postal_code;

-- 20 List companies sorted by Segment.
Select Name, Segment from german_fintechcompanies
ORDER BY Segment;

-- 21 Show first 5 companies.
Select * from german_fintechcompanies
LIMIT 5;

-- 22 Show first 10 companies.
Select * from german_fintechcompanies
LIMIT 10;

-- 23 Show top 3 newest companies.
Select * from german_fintechcompanies
ORDER BY Founding_year DESC
LIMIT 3;

-- 24 Show 5 oldest companies.
SELECT * FROM german_fintechcompanies
ORDER BY Founding_year
LIMIT 5;

-- 25 Show first 7 companies from Berlin.
Select * from german_fintechcompanies
WHERE City = 'Berlin'
LIMIT 7;

-- 26 Count total companies.
Select COUNT(*) from german_fintechcompanies;

-- 27 Count companies in Berlin.
Select COUNT(*) from german_fintechcompanies
where City = 'Berlin';

-- 28 Find earliest founding year.
select MIN(Founding_year) from german_fintechcompanies;

-- 29 Find latest founding year.
Select MAX(Founding_year) from german_fintechcompanies;

-- 30 Find average founding year.
Select AVG(Founding_year) from german_fintechcompanies;

-- 31 Show unique cities.
Select DISTINCT City From german_fintechcompanies;

-- 32 Show unique segments.
Select DISTINCT Segment From german_fintechcompanies;

-- 33 Show unique countries.
Select DISTINCT Country From german_fintechcompanies;

-- 34 Count distinct cities.
Select COUNT(DISTINCT City) From german_fintechcompanies;

-- 35 Count distinct segments.
Select COUNT(DISTINCT Segment) from german_fintechcompanies;

-- 36 Count companies in each city.
Select City, COUNT(*) from german_fintechcompanies
GROUP BY City;

-- 37 Count companies in each segment.
Select Segment, COUNT(*) from german_fintechcompanies
GROUP BY Segment;

-- 38 Count companies by status.
Select Status, COUNT(*) from german_fintechcompanies
GROUP BY Status;

-- 39 Count companies by country.
Select Country, COUNT(*) from german_fintechcompanies
GROUP BY Country;

-- 40 Count companies by Bank Cooperation.
Select Bank_Cooperation, COUNT(*) from german_fintechcompanies
GROUP BY Bank_Cooperation;

-- 41 Cities having more than 2 companies.
Select City, COUNT(*) from german_fintechcompanies
GROUP BY City HAVING COUNT(*) > 2;

-- 42 Segments having more than 3 companies.
Select Segment, COUNT(*) from german_fintechcompanies
GROUP BY Segment HAVING COUNT(*) > 3;

-- 43 Countries having more than 5 companies.
Select Country, COUNT(*) from german_fintechcompanies
GROUP BY Country HAVING COUNT(*) > 5;

-- 44 Status groups having more than 2 companies.
Select Status, COUNT(*) From german_fintechcompanies
GROUP BY Status HAVING COUNT(*) > 2;

-- 45 Cities with more than 1 active company.
Select City, COUNT(*) from german_fintechcompanies
where Status = 'Active' GROUP BY City
HAVING COUNT(*) > 1;

-- 46 Companies ending with 'Pay'.
Select* from german_fintechcompanies
where Name LIKE '%Pay';

-- 47 Companies containing 'Fin'.
Select * from german_fintechcompanies
where Name LIKE '%Fin%';

-- 48 Companies starting with 'B'.
Select * from german_fintechcompanies
Where Name LIKE 'B%';

-- 49 Cities starting with 'H'.
Select * from german_fintechcompanies
Where City LIKE 'H%';

-- 50 Companies whose names contain 'Tech'.
Select * from german_fintechcompanies
where Name LIKE '%Tech%';

-- 51 Companies founded between 2010 and 2015.
Select * from german_fintechcompanies
where Founding_year BETWEEN 2010 AND 2015;

-- 52 Companies founded between 2015 and 2020.
Select * from german_fintechcompanies
where Founding_year BETWEEN 2015 AND 2020;

-- 53 Companies with postal codes between 10000 and 20000.
Select * from german_fintechcompanies
where Postal_code BETWEEN 10000 AND 20000;

-- 54 Companies founded between 2000 and 2010.
Select * from german_fintechcompanies
where Founding_year BETWEEN 2000 AND 2010;

-- 55 Companies founded between 1990 and 2000.
Select * from german_fintechcompanies
where Founding_year BETWEEN 1990 AND 2000;

-- 56 Companies founded after average founding year.
Select * from german_fintechcompanies
where Founding_year > (select AVG(Founding_year) from german_fintechcompanies);

-- 57 Companies founded before average founding year.
Select * from german_fintechcompanies 
where Founding_year < (Select AVG(Founding_year) from german_fintechcompanies);

-- 58 Companies in city with most companies.
Select * from german_fintechcompanies
where City = (select City from german_fintechcompanies
GROUP BY City ORDER BY COUNT(*) DESC
LIMIT 1);

-- 59 Companies in most common segment.
Select * from german_fintechcompanies
where Segment = (Select Segment from german_fintechcompanies
GROUP BY Segment ORDER BY COUNT(*) DESC
limit 1);

-- 60 Companies with founding year equal to minimum year.
Select * from german_fintechcompanies 
where Founding_year = (select MIN(Founding_year) from german_fintechcompanies);

-- 61 Categorize companies by age.
Select Name, CASE
when founding_year >= 2020 then 'New'
when Founding_year >= 2015 then 'Medium'
else 'Old'
end as Company_Age from  german_fintechcompanies;

-- 62 Show status label.
select Name, CASE
when Status = 'Active' then 'Running'
else 'Not Running'
end as Company_Status from german_fintechcompanies;

-- 63 Categorize bank cooperation.
select Name, CASE
when Bank_Cooperation = 'Yes' then 'Partnered'
else 'No Partner'
end as  Bank_Status from  german_fintechcompanies;

-- 64 Show top 5 cities with most companies.
Select City, COUNT(*) from german_fintechcompanies
GROUP BY City ORDER BY COUNT(*) DESC
LIMIT 5;

-- 65 Show top segments with most companies.
select Segment, COUNT(*) from german_fintechcompanies
GROUP BY Segment ORDER BY COUNT(*) DESC;

-- 66 Show companies founded in the latest year.
select * from german_fintechcompanies where Founding_year =
(select MAX(Founding_year) From german_fintechcompanies);

-- 67 Show companies founded in the oldest year.
Select * from german_fintechcompanies where Founding_year =
(select MIN(Founding_year) from german_fintechcompanies);

-- 68 Count companies founded after 2015.
select COUNT(*) from german_fintechcompanies
where Founding_year > 2015;

-- 69 Count companies founded before 2010.
select COUNT(*)  from german_fintechcompanies
where Founding_year < 2010;

-- 70 Show active companies founded after 2015.
select * from german_fintechcompanies
where Status = 'Active' and Founding_year > 2015;

-- 71 Count companies per postal code.
Select Postal_code, COUNT(*) from german_fintechcompanies
GROUP BY Postal_code;

-- 72 Show companies without former name.
Select * from german_fintechcompanies
WHERE Former_name IS NULL;

-- 73 Count companies with former name.
select COUNT(*) from german_fintechcompanies
Where Former_name IS NOT NULL;

-- 74 Companies with founder info available.
Select * From german_fintechcompanies
Where Founder IS NOT NULL;

-- 75 Count companies with founder info missing.
select COUNT(*) from german_fintechcompanies
where Founder  IS NULL;

-- 76 Show companies in Berlin or Munich.
Select * from german_fintechcompanies
where City IN ('Berlin','Munich');

-- 77 Show companies not in Berlin.
Select  * from german_fintechcompanies
where City != 'Berlin';

-- 78 Count companies in each founding year.
Select Founding_year, COUNT(*) from german_fintechcompanies
GROUP BY Founding_year;

-- 79 Show founding years with more than 2 companies.
select Founding_year, COUNT(*) from german_fintechcompanies
GROUP BY Founding_year
HAVING COUNT(*) > 2;

-- 80 Show companies whose segment is Lending.
select * from german_fintechcompanies
where Segment = 'Lending';

-- 81 Companies whose name length > 10
select * from  german_fintechcompanies
where LENGTH(Name) > 10;

-- 82 Companies whose city name length < 6
select * from german_fintechcompanies
where LENGTH(City) < 6;

-- 83 Uppercase company names.
select UPPER(Name) from german_fintechcompanies;

-- 84 Lowercase city names
Select  LOWER(City) from german_fintechcompanies;

-- 85 Concatenate name and city
Select  CONCAT(Name,' - ',City) from  german_fintechcompanies;

-- 86 Show companies founded in last 10 years
Select * from german_fintechcompanies
where Founding_year >= YEAR(CURDATE()) - 10;

-- 87 Show companies founded in last 5 years
Select * from german_fintechcompanies
where Founding_year >= YEAR(CURDATE()) - 5;

-- 88 Count companies per segment sorted
select Segment, COUNT(*) from german_fintechcompanies
GROUP BY Segment
ORDER BY COUNT(*) DESC;

-- 89 Count companies per city sorted
select City, COUNT(*) from german_fintechcompanies
GROUP BY City
ORDER BY COUNT(*) DESC;

-- 90 Show top 10 cities with most companies
select City, COUNT(*) from german_fintechcompanies
GROUP BY City
ORDER BY COUNT(*) DESC
LIMIT 10;

-- 91 Show active companies in Berlin
select * from german_fintechcompanies
WHERE City = 'Berlin'
AND Status = 'Active';

-- 92 Show companies in Hamburg
select* from german_fintechcompanies
WHERE City = 'Hamburg';

-- 93 Companies founded after 2018
SELECT * from german_fintechcompanies
WHERE Founding_year > 2018;

-- 94 Count companies with bank cooperation
Select COUNT(*) from german_fintechcompanies
WHERE Bank_Cooperation = 'Yes';

-- 95 Count companies without bank cooperation
Select  COUNT(*) from german_fintechcompanies
WHERE Bank_Cooperation = 'No';

-- 96 Show companies with both founder info and former name
Select  * from german_fintechcompanies
WHERE Former_name IS NOT NULL
AND Founder  IS NOT NULL;

-- 97 Show companies with missing postal code
Select * from german_fintechcompanies
WHERE Postal_code IS NULL;

-- 98 Count companies with missing postal code
Select COUNT(*) from german_fintechcompanies
WHERE Postal_code IS NULL;

-- 99 Show all segments alphabetically
select DISTINCT Segment from german_fintechcompanies
ORDER BY Segment;

-- 100 Show all cities alphabetically
Select DISTINCT City from german_fintechcompanies
ORDER BY City;

-- 101. Count companies whose name contains numbers
SELECT COUNT(*) FROM german_fintechcompanies
WHERE Name REGEXP '[0-9]';

-- 102. Show companies whose city ends with 'burg'
SELECT * FROM german_fintechcompanies
WHERE City LIKE '%burg';

-- 103. Find companies where name length = city length
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Name) = LENGTH(City);

-- 104. Find companies with longest name
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Name) = (SELECT MAX(LENGTH(Name)) FROM german_fintechcompanies);

-- 105. Find companies with shortest name
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Name) = (SELECT MIN(LENGTH(Name)) FROM german_fintechcompanies);

-- 106. Count companies whose segment starts with 'P'
SELECT COUNT(*) FROM german_fintechcompanies
WHERE Segment LIKE 'P%';

-- 107. Show companies with city name in uppercase
SELECT * FROM german_fintechcompanies
WHERE City = UPPER(City);

-- 108. Find companies where name is palindrome (basic)
SELECT * FROM german_fintechcompanies
WHERE Name = REVERSE(Name);

-- 109. Find companies where founding year is even
SELECT * FROM german_fintechcompanies
WHERE Founding_year % 2 = 0;

-- 110. Find companies where founding year is odd
SELECT * FROM german_fintechcompanies
WHERE Founding_year % 2 != 0;

-- 111. Count companies founded in each decade
SELECT FLOOR(Founding_year/10)*10 AS decade, COUNT(*)
FROM german_fintechcompanies
GROUP BY decade;

-- 112. Find companies founded in same year as another company
SELECT * FROM german_fintechcompanies g1
WHERE EXISTS (
SELECT 1 FROM german_fintechcompanies g2
WHERE g1.Founding_year = g2.Founding_year
AND g1.Name != g2.Name
);

-- 113. Find duplicate company names
SELECT Name, COUNT(*) 
FROM german_fintechcompanies
GROUP BY Name
HAVING COUNT(*) > 1;

-- 114. Find cities having same number of companies
SELECT City, COUNT(*) 
FROM german_fintechcompanies
GROUP BY City
HAVING COUNT(*) IN (
SELECT COUNT(*) FROM german_fintechcompanies GROUP BY City
);

-- 115. Find difference between max and min founding year
SELECT MAX(Founding_year) - MIN(Founding_year) AS year_gap
FROM german_fintechcompanies;

-- 116. Find companies where segment length > 8
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Segment) > 8;

-- 117. Show first letter of each company name
SELECT LEFT(Name,1) FROM german_fintechcompanies;

-- 118. Count companies by first letter of name
SELECT LEFT(Name,1), COUNT(*)
FROM german_fintechcompanies
GROUP BY LEFT(Name,1);

-- 119. Find companies where name contains vowel
SELECT * FROM german_fintechcompanies
WHERE Name REGEXP '[AEIOUaeiou]';

-- 120. Find companies where name has no vowels
SELECT * FROM german_fintechcompanies
WHERE Name NOT REGEXP '[AEIOUaeiou]';

-- 121. Find companies with second highest founding year
SELECT * FROM german_fintechcompanies
ORDER BY Founding_year DESC
LIMIT 1 OFFSET 1;

-- 122. Find companies with third highest founding year
SELECT * FROM german_fintechcompanies
ORDER BY Founding_year DESC
LIMIT 1 OFFSET 2;

-- 123. Find companies whose postal code is even
SELECT * FROM german_fintechcompanies
WHERE Postal_code % 2 = 0;

-- 124. Find companies whose postal code is odd
SELECT * FROM german_fintechcompanies
WHERE Postal_code % 2 != 0;

-- 125. Find companies with most common postal code
SELECT * FROM german_fintechcompanies
WHERE Postal_code = (
SELECT Postal_code FROM german_fintechcompanies
GROUP BY Postal_code
ORDER BY COUNT(*) DESC
LIMIT 1
);

-- 126. Find companies where name starts and ends with same letter
SELECT * FROM german_fintechcompanies
WHERE LEFT(Name,1) = RIGHT(Name,1);

-- 127. Find companies with multiple words in name
SELECT * FROM german_fintechcompanies
WHERE Name LIKE '% %';

-- 128. Find companies with exactly one word name
SELECT * FROM german_fintechcompanies
WHERE Name NOT LIKE '% %';

-- 129. Find companies with numeric postal code length = 5
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Postal_code) = 5;

-- 130. Find companies where city and segment are same text
SELECT * FROM german_fintechcompanies
WHERE City = Segment;

-- 131. Find companies with same city and country
SELECT * FROM german_fintechcompanies
WHERE City = Country;

-- 132. Find companies with longest city name
SELECT * FROM german_fintechcompanies
WHERE LENGTH(City) = (SELECT MAX(LENGTH(City)) FROM german_fintechcompanies);

-- 133. Find companies with shortest city name
SELECT * FROM german_fintechcompanies
WHERE LENGTH(City) = (SELECT MIN(LENGTH(City)) FROM german_fintechcompanies);

-- 134. Find companies where name contains special characters
SELECT * FROM german_fintechcompanies
WHERE Name REGEXP '[^a-zA-Z0-9 ]';

-- 135. Find total number of companies with NULL values
SELECT COUNT(*) FROM german_fintechcompanies
WHERE Name IS NULL OR City IS NULL OR Segment IS NULL;

-- 136. Replace NULL city with 'Unknown' (view only)
SELECT IFNULL(City,'Unknown') FROM german_fintechcompanies;

-- 137. Find companies where founding year > average + 5
SELECT * FROM german_fintechcompanies
WHERE Founding_year > (SELECT AVG(Founding_year)+5 FROM german_fintechcompanies);

-- 138. Find companies where founding year < average - 5
SELECT * FROM german_fintechcompanies
WHERE Founding_year < (SELECT AVG(Founding_year)-5 FROM german_fintechcompanies);

-- 139. Find companies sorted by name length
SELECT * FROM german_fintechcompanies
ORDER BY LENGTH(Name) DESC;

-- 140. Find companies sorted by city length
SELECT * FROM german_fintechcompanies
ORDER BY LENGTH(City);

-- 141. Find companies with repeating characters in name
SELECT * FROM german_fintechcompanies
WHERE Name REGEXP '(.)\\1';

-- 142. Count companies where segment has more than 1 word
SELECT COUNT(*) FROM german_fintechcompanies
WHERE Segment LIKE '% %';

-- 143. Find companies where segment starts and ends with same letter
SELECT * FROM german_fintechcompanies
WHERE LEFT(Segment,1) = RIGHT(Segment,1);

-- 144. Find companies with maximum postal code
SELECT * FROM german_fintechcompanies
WHERE Postal_code = (SELECT MAX(Postal_code) FROM german_fintechcompanies);

-- 145. Find companies with minimum postal code
SELECT * FROM german_fintechcompanies
WHERE Postal_code = (SELECT MIN(Postal_code) FROM german_fintechcompanies);

-- 146. Count companies per founding decade sorted desc
SELECT FLOOR(Founding_year/10)*10 AS decade, COUNT(*)
FROM german_fintechcompanies
GROUP BY decade
ORDER BY COUNT(*) DESC;

-- 147. Find companies where name contains 'AI'
SELECT * FROM german_fintechcompanies
WHERE Name LIKE '%AI%';

-- 148. Find companies where city contains space
SELECT * FROM german_fintechcompanies
WHERE City LIKE '% %';

-- 149. Find companies where segment contains 'Tech'
SELECT * FROM german_fintechcompanies
WHERE Segment LIKE '%Tech%';

-- 150. Find companies where name length is between 5 and 15
SELECT * FROM german_fintechcompanies
WHERE LENGTH(Name) BETWEEN 5 AND 15;