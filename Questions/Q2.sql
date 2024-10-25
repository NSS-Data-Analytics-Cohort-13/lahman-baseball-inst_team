-- 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

-- Answer:  Eddie Gaedel.  1 game.  St. Louis Browns

SELECT 
	height,
	namefirst,
	namelast,
	namegiven,
	debut,
	finalgame,
	a.g_all,
	a.teamID,
	t.name
	
FROM people p
JOIN appearances a
ON p.playerid = a.playerid
JOIN teams t
ON t.teamid = a.teamid
AND t.yearid = a.yearid
WHERE p.height = 
	(
		SELECT min(height)
		FROM people
	)
