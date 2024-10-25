-- 6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.

-- Answer:  Chris Owings

SELECT 
	b.playerid,
	p.namefirst,
	p.namelast,
	SUM(sb) stolen_base,
	SUM(cs) caught_stealing,
	SUM(sb) + SUM(cs) attempted_steals,
	SUM(sb::numeric) / (SUM(sb::numeric) + SUM(cs::numeric)) AS stolen_base_pct
FROM batting b
JOIN people p
ON b.playerid = p.playerid
AND yearid = 2016
GROUP BY 1, 2, 3
HAVING SUM(sb) + SUM(cs) >= 20
ORDER BY stolen_base_pct DESC