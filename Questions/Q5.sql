-- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

-- Answer:  More strikeout and more homeruns as time progresses.

SELECT 
	ROUND(AVG(SO::numeric / G::numeric), 2) avg_strikeouts_per_game,
	ROUND(AVG(HR::numeric / G::numeric), 2) avg_hr_per_game,
	FLOOR(CAST(yearid AS numeric) / 10) * 10 AS decade
FROM teams
WHERE FLOOR(CAST(yearid AS numeric) / 10) * 10 >= 1920
GROUP BY 3
ORDER BY decade