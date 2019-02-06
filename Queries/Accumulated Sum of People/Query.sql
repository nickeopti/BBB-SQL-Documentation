SELECT
    SUM(people) AS people
FROM mtc_activity
WHERE
    zone = $1 AND
    day = $2
GROUP BY zone;
