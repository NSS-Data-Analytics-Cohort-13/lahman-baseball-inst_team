-- 1. What range of years for baseball games played does the provided database cover? 

SELECT MIN(yearid) year_min, MAX(yearid) year_max
FROM teams