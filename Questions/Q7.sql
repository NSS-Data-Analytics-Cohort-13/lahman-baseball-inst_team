-- 7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
-- Answer:  Seattle Mariners, 2001, 116 wins

-- WITH losers_cte AS
-- (
-- SELECT *
-- FROM teams
-- WHERE yearid BETWEEN 1970 AND 2016
-- AND wswin = 'N'
-- )
-- SELECT 
-- 	name,
-- 	yearid,
-- 	w
-- FROM losers_cte
-- WHERE w = 
-- 	(
-- 	SELECT MAX(w)
-- 	FROM losers_cte
-- 	)



-- What is the smallest number of wins for a team that did win the world series? 
-- Answer:  Los Angeles Dodges, 1981, 63 wins  There was a player strike.  Number of games varied from 102 - 111.


-- WITH winners_cte AS
-- (
-- SELECT *
-- FROM teams
-- WHERE yearid BETWEEN 1970 AND 2016
-- AND wswin = 'Y'
-- )
-- SELECT 
-- 	name,
-- 	yearid,
-- 	w
-- FROM winners_cte
-- WHERE w = 
-- 	(
-- 	SELECT MIN(w)
-- 	FROM winners_cte
-- 	)



-- Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year.  
-- Answer:  St. Louis Cardinals, 2006, 83 wins

-- WITH winners_cte AS
-- (
-- SELECT *
-- FROM teams
-- WHERE yearid BETWEEN 1970 AND 2016
-- AND wswin = 'Y'
-- AND yearid <> 1981
-- )
-- SELECT 
-- 	name,
-- 	yearid,
-- 	w
-- FROM winners_cte
-- WHERE w = 
-- 	(
-- 	SELECT MIN(w)
-- 	FROM winners_cte
-- 	)


-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series?
-- What percentage of the time?

-- Answer:  12 times out of 46.  26.09% of the time.



-- WITH year_wins_cte AS 
-- (
-- SELECT 
-- 	yearid,
-- 	MAX(w) year_most_wins
-- FROM teams
-- WHERE yearid BETWEEN 1970 AND 2016
-- GROUP BY 1
-- )
-- SELECT 
-- (SELECT COUNT(*)
-- FROM year_wins_cte y
-- JOIN teams t
-- ON y.yearid = t.yearid
-- WHERE year_most_wins = w
-- AND wswin = 'Y')::numeric
-- /
-- (SELECT COUNT(*)
-- FROM year_wins_cte y
-- JOIN teams t
-- ON y.yearid = t.yearid
-- WHERE wswin = 'Y')::numeric * 100 AS pct_most_wins_and_wswin



-- WITH year_wins_cte AS 
-- (
-- SELECT 
-- 	yearid,
-- 	MAX(w) year_most_wins
-- FROM teams
-- WHERE yearid BETWEEN 1970 AND 2016
-- GROUP BY 1
-- ),
-- teams_cte AS 
-- (
-- SELECT *,
-- 	CASE
-- 		WHEN w = year_most_wins
-- 		THEN 'Y'
-- 		ELSE 'N'
-- 		END AS most_wins
-- FROM year_wins_cte y
-- JOIN teams t
-- ON y.yearid = t.yearid
-- )
-- SELECT *
-- FROM teams_cte
-- WHERE wswin = 'Y'
-- AND most_wins = 'Y'