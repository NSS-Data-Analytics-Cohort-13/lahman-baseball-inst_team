-- 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?

-- Answer: David Price 81851296

WITH vandy_cte AS
(
SELECT DISTINCT playerid, schoolid
FROM collegeplaying
WHERE schoolid = 'vandy'
)
SELECT 
	p.namefirst, 
	p.namelast, 
	SUM(s.salary::INT::MONEY) salary_sum
FROM vandy_cte
JOIN people p
ON vandy_cte.playerid = p.playerid
JOIN salaries s
ON s.playerid = vandy_cte.playerid
GROUP BY 1, 2
ORDER BY salary_sum DESC