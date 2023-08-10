-- ranks country origins of bands, ordered by number of non-unique fans 
-- Query to get no. of fans based on country
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
