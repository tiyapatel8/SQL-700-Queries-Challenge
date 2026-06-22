create database first;
use first;

-- Basic Data Exploration (1–10)

-- 1. How many total users are in the dataset?
select count(*) from users_data;

-- 2. How many total cards have been issued?
select sum(num_cards_issued) from cards_data;

-- 3. How many unique clients exist in the cards dataset?
select distinct(count(client_id)) as unique_client from cards_data;

-- 4. What are the distinct card brands available?
select distinct(card_brand) as All_Brands from cards_data;

-- 5. What are the different card types available?
select distinct(card_type) as card_type from cards_data;

-- 6. What is the average credit score of users?
select avg(credit_score) as average_creditscore from users_data;

-- 7. What is the average yearly income of users?
select round(avg(yearly_income),2) as avg_yearlyincome from users_data;

-- 8. What is the maximum credit limit issued on a card?
select max(credit_limit) as max_creditlimit from cards_data;

-- 9. What is the minimum credit limit issued on a card?
select min(credit_limit) as max_creditlimit from cards_data;

-- 10. What is the total number of cards with chips enabled?
select sum(num_cards_issued) as cardwithchip from cards_data 
where has_chip = "YES";

-- Filtering Analysis (11–20)

-- 11. Retrieve users whose credit score is greater than 700.
select * from users_data
where credit_score > 700;

-- 12. Find users whose yearly income is above 100000.
select * from users_data  
where yearly_income  > 100000;

-- 13. Find cards with credit limits above 20000.
select * from cards_data
where credit_limit > 20000;

-- 14. Retrieve cards that appear on the dark web.
select * from cards_data
where card_on_dark_web = "YES";

-- 15. Find users whose total debt is greater than their yearly income.
select * from users_data 
where total_debt > yearly_income;

-- 16. Find cards where the chip is not enabled.
select * from cards_data 
where has_chip = "NO";

-- 17. Retrieve users older than 60 years.
select * from users_data 
where current_age > 60;

-- 18. Find users who own more than 3 credit cards.
select * from users_data 
where num_credit_cards  > 3;

-- 19. Retrieve cards that expire within the next 2 years.
SELECT * FROM cards_data
WHERE RIGHT(expires,2) BETWEEN '26' AND '28';

-- 20. Find users with both high income and high credit score.
select * from users_data
where yearly_income > 100000 
AND credit_score > 700;

-- Aggregation & GROUP BY (21–35)

-- 21. Count number of users by gender.
select gender,count(*) from users_data
group by gender;

-- 22. Count number of cards by card brand.
select card_brand,count(*) from cards_data
group by card_brand;

-- 23. Count number of cards by card type.
select card_type,count(*) from cards_data
group by card_type;

-- 24. Calculate the average credit limit by card brand.
select card_brand,avg(credit_limit) from cards_data
group by card_brand;

-- 25. Calculate the average credit limit by card type.
select card_type,avg(credit_limit) from cards_data
group by card_type;

-- 26. Find the number of cards issued per client.
select client_id , sum(num_cards_issued) from cards_data
group by client_id;

-- 27. Calculate average yearly income by gender.
select gender , avg(yearly_income) from users_data
group by gender;

-- 28. Calculate total debt by gender.
select gender,sum(total_debt) from users_data 
group by gender;

-- 29. Find the maximum credit limit per card brand.
select card_brand , max(credit_limit) from cards_data
group by card_brand;

-- 30. Find the minimum credit limit per card brand.
select card_brand , min(credit_limit) from cards_data
group by card_brand;

-- 31. Count cards with chip enabled by brand.
select card_brand , count(*) as cards from cards_data
 WHERE has_Chip = "YES"
 group by card_brand;

-- 32. Count risky cards (dark web) by brand.
select card_brand , count(*) as cards from cards_data
 WHERE  card_on_dark_web = "YES"
 group by card_brand;

-- 33. Find total cards issued by each user.
select client_id , sum(num_cards_issued) from cards_data 
group by client_id;

-- 34. Calculate average credit score per income group.
SELECT 
CASE
WHEN yearly_income < 50000 THEN 'Low Income'
WHEN yearly_income BETWEEN 50000 AND 100000 THEN 'Middle Income'
ELSE 'High Income'
END AS income_group,
AVG(credit_score) AS avg_credit_score
FROM users_data
GROUP BY income_group;

-- 35. Find total credit limit issued per client.
select client_id, sum(credit_limit) from cards_data
group by client_id ; 

-- HAVING Clause (36–45)

-- 36. Find card brands with more than 50 issued cards.
select card_brand , count(num_cards_issued) as card_more_50 from cards_data 
group by card_brand 
having count(num_cards_issued) > 50;

-- 37. Find users who have more than 2 cards.
select client_id, count(num_cards_issued) as user_card from cards_data
group by client_id 
having count(num_cards_issued) > 2;

-- 38. Find card types whose average credit limit is greater than 15000.
select card_type , avg(credit_limit) as avgcredit_limit from cards_data
group by card_type 
having avg(credit_limit) > 15000;

-- 39. Find clients whose total credit limit exceeds 50000.
select client_id , sum(credit_limit) as totalcredit_limit from cards_data
group by client_id
having avg(credit_limit) > 50000;

-- 40. Find card brands with more than 100 users.
select card_brand , count(client_id) from cards_data 
group by card_brand 
having count(client_id) > 100;

-- 41. Find users whose total number of cards is greater than the average.
SELECT client_id, SUM(num_cards_issued) AS total_cards FROM cards_data
GROUP BY client_id
HAVING SUM(num_cards_issued) > ( SELECT AVG(total_cards) FROM (
SELECT SUM(num_cards_issued) AS total_cards FROM cards_data
GROUP BY client_id) t );

-- 42. Find brands with the highest average credit limit.
select card_brand , avg(credit_limit) as highest_avglimit from cards_data
group by card_brand 
having avg(credit_limit) 
order by avg(credit_limit) DESC;

-- 43. Find clients who own cards from multiple brands.
select client_id , count(card_brand)as multiplecard  from cards_data 
group by client_id having count(card_brand) > 1; 

-- 44. Find users whose debt is higher than average debt.
select * from users_data 
where total_debt > (select avg(total_debt) from users_data);

-- 45. Find card brands with the highest number of risky cards.
SELECT card_brand, COUNT(*) AS risky_cards FROM cards_data
WHERE card_on_dark_web = 'YES'
GROUP BY card_brand
ORDER BY risky_cards DESC;

-- JOIN Analysis (46–60)

-- 46. Retrieve users with their card details.
select * from users_data u 
join cards_data c
on u.id = c.client_id;

-- 47. Show users along with their card brand.
select u.id , c.card_brand from users_data u 
join cards_data c 
on u.id = c.client_id;

-- 48. Display users with their card type.
select u.id , c.card_type from users_data u 
join cards_data c
on u.id = c.client_id;

-- 49. Retrieve users with their credit limit.
select u.id , c.credit_limit from users_data u 
join cards_data c
on u.id = c.client_id;

-- 50. Find users who have cards on the dark web.
SELECT u.* FROM users_data u
JOIN cards_data c ON u.id=c.client_id
WHERE card_on_dark_web='Yes';

-- 51. Show users with chip-enabled cards.
select u.* from users_data u  
join cards_data c on u.id=c.client_id
where has_chip = "YES";

-- 52. Retrieve users with both debit and credit cards.
SELECT u.id FROM users_data u
JOIN cards_data c ON u.id=c.client_id
GROUP BY u.id
HAVING COUNT(DISTINCT card_type) > 1;

-- 53. Find users who have no cards.
SELECT u.id FROM users_data u
LEFT JOIN cards_data c ON u.id = c.client_id
WHERE c.client_id IS NULL;

-- 54. Find cards belonging to users with high credit score.
select * from cards_data c join users_data u
on c.client_id = u.id 
where u.credit_score > 700;

-- 55. Find cards belonging to users with low income.
select * from cards_data c join users_data u
on c.client_id = u.id 
where u.yearly_income <50000;

-- 56. Show users along with number of cards issued.
select u.id , count(*) from users_data u 
join cards_data c on u.id = c.client_id
group by u.id;

-- 57. Retrieve card details along with user gender.
select u.gender , c.card_brand  from users_data u
join cards_data c on u.id = c.client_id;

-- 58. Find users with highest total credit limit across all cards.
select  u.id , sum(credit_limit) as total_creditlimit from users_data u
join cards_data c on u.id = c.client_id
group by u.id
order by total_creditlimit desc;

-- 59. Retrieve users who have multiple card brands.
select u.id , count(card_brand) from users_data u 
join cards_data c 
on u.id = c.client_id 
group by u.id having count(card_brand) > 1;

-- 60. Show users with cards and their transaction count.
select u.id , count(t.id) from users_data u 
left join transactions_data t 
on u.id = t.client_id 
group by u.id; 

-- Subqueries (61–70)

-- 61. Find users whose income is greater than the average income.
select * from users_data 
where yearly_income > (SELECT avg(yearly_income) from users_data);

-- 62. Find cards whose credit limit is greater than average credit limit.
select * from cards_data 
where credit_limit  > (SELECT AVG(credit_limit) from cards_data);

-- 63. Find users whose credit score equals the highest score.
select * from users_data 
where credit_score = (SELECT max(credit_score) from users_data);

-- 64. Find cards belonging to the highest income user.
select * from cards_data 
where  client_id = (SELECT id  from users_data order by yearly_income desc limit 1 );

-- 65. Find users whose debt is lower than average debt.
SELECT * FROM users_data
WHERE total_debt < (SELECT AVG(total_debt) FROM users_data);

-- 66. Find cards whose credit limit is highest in their brand.
select * from cards_data c
where credit_limit = (select max(credit_limit) from cards_data where card_brand = c.card_brand);

-- 67. Find users older than the average age.
SELECT * FROM users_data
WHERE current_age > (SELECT AVG(current_age) FROM users_data);

-- 68. Find cards belonging to clients with more cards than average.
SELECT * FROM cards_data
WHERE client_id in (SELECT client_id FROM cards_data group by  client_id having count(*) >
(select avg(cnt) from (select count(*) cnt from cards_data group by client_id)t));

-- 69. Find users who have the highest income.
SELECT * FROM users_data
WHERE yearly_income = ( SELECT MAX(yearly_income) FROM users_data);

-- 70. Find users with the lowest income.
select * from users_data 
where yearly_income = (SELECT Min(yearly_income) from users_data);

-- CASE Statement Analysis (71–80)

-- 71. Categorize users as High, Medium, or Low income.
select case when yearly_income > 100000 then "HIGH"
when yearly_income > 50000 then "MIDIUM"
else "LOW" 
end income_category from users_data;

-- 72. Classify credit scores into Good, Average, and Poor.
select case when credit_score > 700 then "Good"
when credit_score > 500 then "Average"
else "LOW" 
end creditscore_category from users_data;

-- 73. Categorize cards into High limit or Low limit.
select case when credit_limit > 20000 then "High"
else "Low" 
end creditlimit_category from cards_data;

-- 74. Mark cards as Secure if chip is enabled.
select case when has_chip = "YES" then "Enable"
else "NOT Enable"
end chip_category from cards_data;

-- 75. Mark cards as Risky if they appear on the dark web.
select case when card_on_dark_web = "YES" then "Risky"
else "Not"
end risky_category from cards_data;

-- 76. Categorize users based on number of cards owned.
select id, case when num_credit_cards > 5 then "Many cards"
else "Few cards"
end user_category from users_data;

-- 77. Identify users nearing retirement age.
select id, current_age ,case when current_age >= 50 then "near retirement"
else "not"
end user_retirement_category from users_data;

-- 78. Categorize cards based on expiration status.
Select card_number, case when expires<'2025' THEN 'Expired Soon' 
ELSE 'Active' END FROM cards_data;

-- 79. Label users based on debt level.
Select id,CASE WHEN total_debt > yearly_income THEN 'High Debt'
ELSE 'Low Debt' END FROM users_data;

-- 80. Identify high risk customers (low credit score + high debt).
SELECT * from users_data where credit_score < 600 and total_debt > yearly_income;

--81 Find the top 5 users with highest yearly income.
select * from users_data 
order by yearly_income DESC 
limit 5;

--82 Find the card with the highest credit limit.
select * from cards_data
order by credit_limit DESC 
limit 1;

--83 Find the second highest credit limit
 select * from cards_data
 order by credit_limit DESC 
 limit 1
 offset 1;

--84 Find users who own the most cards
Select client_id, COUNT(*) AS total_cards
from cards_data group by client_id
ORDER BY total_cards DESC;

--85 Find the most popular card brand
Select card_brand, COUNT(*) AS total_cards from cards_data
group by card_brand order by total_cards DESC
LIMIT 1;

--86 Find users with the highest total credit limit
Select client_id, SUM(credit_limit) AS total_limit from cards_data
group by client_id order by total_limit DESC;

--87 Find users who have cards from more than one brand
Select client_id from cards_data
group by  client_id having count(distinct card_brand) > 1;

--88 Find users with both debit and credit cards
Select client_id from cards_data
where  card_type in("Debit","Credit")
group by client_id;

--89 Find the average credit limit of risky cards
SELECT AVG(credit_limit) AS avg_risky_limit from cards_data
where card_on_dark_web = 'Yes';

--90 Find brands that have risky cards
SELECT card_brand, COUNT(*) as risky_cards from cards_data
where card_on_dark_web = 'Yes' group by card_brand;

-- 91 Identify customer who have income less than 50000
Select  * from users_data
Where  yearly_income < 50000;

--92 Find the most common card type
Select  card_type, COUNT(*) AS total_cards from cards_data
group by card_type order by total_cards DESC
LIMIT 1;

--93 Find card brands used by high-income users
Select card_brand, COUNT(*) AS total_cards from cards_data c
join users_data u ON u.id = c.client_id
where u.yearly_income > 50000 group by  card_brand;

--94 Find cards with the highest credit limit.
Select * from cards_data
Where credit_limit = ( select max(credit_limit) from cards_data);

-- 95 Find users whose cards appear on the dark web
Select client_id from cards_data
where card_on_dark_web = 'Yes';

-- 96 Find total credit limit per card brand
Select card_brand, SUM(credit_limit) from cards_data
group by card_brand;

-- 97 Find number of cards per card type
Select card_type, COUNT(*) from cards_data
group by card_type;

-- 98 Find users with no cards
Select id from users_data
where id NOT IN( Select client_id from cards_data );

-- 99 Find clients with highest number of transactions
Select client_id, COUNT(*) from transactions_data
group by client_id
order by COUNT(*) DESC;

-- 100 Find average income of users who own cards.
Select AVG(yearly_income) from users_data
where id IN (SELECT client_id from cards_data);

-- 101. Count male and female users using CASE
SELECT 
SUM(CASE WHEN gender='Male' THEN 1 ELSE 0 END) AS male_users,
SUM(CASE WHEN gender='Female' THEN 1 ELSE 0 END) AS female_users
FROM users_data;

-- 102. Find percentage of high income users (>100000)
SELECT 
(COUNT(CASE WHEN yearly_income > 100000 THEN 1 END) * 100.0 / COUNT(*)) AS high_income_pct
FROM users_data;

-- 103. Find percentage of chip-enabled cards
SELECT 
(COUNT(CASE WHEN has_chip='YES' THEN 1 END) * 100.0 / COUNT(*)) AS chip_pct
FROM cards_data;

-- 104. Find average number of cards per user
SELECT AVG(card_count) 
FROM (SELECT COUNT(*) AS card_count FROM cards_data GROUP BY client_id) t;

-- 105. Find users with no debt
SELECT * FROM users_data WHERE total_debt = 0;

-- 106. Find users with debt greater than 50000
SELECT * FROM users_data WHERE total_debt > 50000;

-- 107. Find cards expiring this year
SELECT * FROM cards_data 
WHERE RIGHT(expires,2) = RIGHT(YEAR(CURDATE()),2);

-- 108. Find total cards issued per brand and type together
SELECT card_brand, card_type, COUNT(*) 
FROM cards_data 
GROUP BY card_brand, card_type;

-- 109. Find users whose income is between average and max income
SELECT * FROM users_data
WHERE yearly_income BETWEEN 
(SELECT AVG(yearly_income) FROM users_data)
AND (SELECT MAX(yearly_income) FROM users_data);

-- 110. Find users with credit score in top 10%
SELECT * FROM users_data
WHERE credit_score >= (
SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY credit_score) FROM users_data
);

-- 111. Find median credit score (approx using avg of middle values)
SELECT AVG(credit_score) FROM (
SELECT credit_score FROM users_data
ORDER BY credit_score
LIMIT 2 OFFSET (SELECT COUNT(*)/2 FROM users_data)
) t;

-- 112. Find cards where credit limit is double of average
SELECT * FROM cards_data
WHERE credit_limit > 2 * (SELECT AVG(credit_limit) FROM cards_data);

-- 113. Find users whose name starts with 'S'
SELECT * FROM users_data
WHERE name LIKE 'S%';

-- 114. Find cards where card number ends with '1234'
SELECT * FROM cards_data
WHERE card_number LIKE '%1234';

-- 115. Find users grouped by age range
SELECT 
CASE 
WHEN current_age < 25 THEN 'Young'
WHEN current_age BETWEEN 25 AND 50 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
COUNT(*)
FROM users_data
GROUP BY age_group;

-- 116. Find users with highest debt per gender
SELECT * FROM users_data u
WHERE total_debt = (
SELECT MAX(total_debt) FROM users_data 
WHERE gender = u.gender
);

-- 117. Find cards with credit limit above brand average
SELECT * FROM cards_data c
WHERE credit_limit > (
SELECT AVG(credit_limit) FROM cards_data 
WHERE card_brand = c.card_brand
);

-- 118. Find users with same income as another user
SELECT * FROM users_data u1
WHERE EXISTS (
SELECT 1 FROM users_data u2
WHERE u1.yearly_income = u2.yearly_income
AND u1.id != u2.id
);

-- 119. Find users with duplicate credit scores
SELECT credit_score, COUNT(*) 
FROM users_data
GROUP BY credit_score
HAVING COUNT(*) > 1;

-- 120. Find cards with duplicate credit limits
SELECT credit_limit, COUNT(*) 
FROM cards_data
GROUP BY credit_limit
HAVING COUNT(*) > 1;

-- 121. Find difference between highest and lowest income
SELECT MAX(yearly_income) - MIN(yearly_income) AS income_gap
FROM users_data;

-- 122. Find users whose age is prime number (simple logic)
SELECT * FROM users_data
WHERE current_age IN (2,3,5,7,11,13,17,19,23,29,31);

-- 123. Find cards sorted by last 4 digits
SELECT * FROM cards_data
ORDER BY RIGHT(card_number,4);

-- 124. Find users who joined most recently (highest id)
SELECT * FROM users_data
ORDER BY id DESC LIMIT 1;

-- 125. Find users with lowest credit score per income group
SELECT * FROM users_data u
WHERE credit_score = (
SELECT MIN(credit_score) FROM users_data
WHERE yearly_income BETWEEN u.yearly_income-10000 AND u.yearly_income+10000
);

-- 126. Create a view for high income users
CREATE VIEW high_income_users AS
SELECT * FROM users_data WHERE yearly_income > 100000;

-- 127. Select from view
SELECT * FROM high_income_users;

-- 128. Create CTE for top income users
WITH top_users AS (
SELECT * FROM users_data ORDER BY yearly_income DESC LIMIT 10
)
SELECT * FROM top_users;

-- 129. Find users who have same gender and same income
SELECT * FROM users_data u1
WHERE EXISTS (
SELECT 1 FROM users_data u2
WHERE u1.gender=u2.gender 
AND u1.yearly_income=u2.yearly_income
AND u1.id!=u2.id
);

-- 130. Find cards with odd credit limit
SELECT * FROM cards_data
WHERE credit_limit % 2 != 0;

-- 131. Find cards with even credit limit
SELECT * FROM cards_data
WHERE credit_limit % 2 = 0;

-- 132. Find users sorted by income and credit score
SELECT * FROM users_data
ORDER BY yearly_income DESC, credit_score DESC;

-- 133. Find total number of risky vs safe cards
SELECT 
SUM(CASE WHEN card_on_dark_web='YES' THEN 1 ELSE 0 END) AS risky,
SUM(CASE WHEN card_on_dark_web='NO' THEN 1 ELSE 0 END) AS safe
FROM cards_data;

-- 134. Find users with income greater than all female users
SELECT * FROM users_data
WHERE yearly_income > ALL (
SELECT yearly_income FROM users_data WHERE gender='Female'
);

-- 135. Find users with income less than any male user
SELECT * FROM users_data
WHERE yearly_income < ANY (
SELECT yearly_income FROM users_data WHERE gender='Male'
);

-- 136. Find users whose income is multiple of 10000
SELECT * FROM users_data
WHERE yearly_income % 10000 = 0;

-- 137. Find cards with longest expiry year
SELECT * FROM cards_data
ORDER BY expires DESC LIMIT 1;

-- 138. Find users who have cards but no chip
SELECT DISTINCT client_id FROM cards_data
WHERE has_chip='NO';

-- 139. Find users with both risky and safe cards
SELECT client_id FROM cards_data
GROUP BY client_id
HAVING COUNT(DISTINCT card_on_dark_web) > 1;

-- 140. Find users with same age group
SELECT current_age, COUNT(*)
FROM users_data
GROUP BY current_age
HAVING COUNT(*) > 1;

-- 141. Find top 5 lowest income users
SELECT * FROM users_data
ORDER BY yearly_income ASC
LIMIT 5;

-- 142. Find cards with credit limit less than brand minimum + 1000
SELECT * FROM cards_data c
WHERE credit_limit < (
SELECT MIN(credit_limit)+1000 FROM cards_data
WHERE card_brand=c.card_brand
);

-- 143. Find users with income exactly equal to average
SELECT * FROM users_data
WHERE yearly_income = (SELECT AVG(yearly_income) FROM users_data);

-- 144. Find cards where expiry year is odd
SELECT * FROM cards_data
WHERE CAST(RIGHT(expires,2) AS UNSIGNED) % 2 != 0;

-- 145. Find cards where expiry year is even
SELECT * FROM cards_data
WHERE CAST(RIGHT(expires,2) AS UNSIGNED) % 2 = 0;

-- 146. Find users with max credit score difference from avg
SELECT *, ABS(credit_score - (SELECT AVG(credit_score) FROM users_data)) AS diff
FROM users_data
ORDER BY diff DESC;

-- 147. Find total number of clients with more than 1 card
SELECT COUNT(*) FROM (
SELECT client_id FROM cards_data
GROUP BY client_id
HAVING COUNT(*) > 1
) t;

-- 148. Find users with income in top 5 values
SELECT * FROM users_data
ORDER BY yearly_income DESC
LIMIT 5;

-- 149. Find cards issued to users older than average age
SELECT * FROM cards_data c
JOIN users_data u ON c.client_id=u.id
WHERE u.current_age > (SELECT AVG(current_age) FROM users_data);

-- 150. Find users whose debt is within 10% of income
SELECT * FROM users_data
WHERE total_debt BETWEEN yearly_income*0.9 AND yearly_income*1.1;