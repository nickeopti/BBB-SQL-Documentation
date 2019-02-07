SELECT
    day.id AS day,
    day.description,
    SUM(act.people) AS people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
WHERE
    zone = 145
GROUP BY day.id
HAVING
    SUM(people) >= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity
        WHERE
            zone = 145
        GROUP BY day
    ) OR
    SUM(people) <= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity
        WHERE
            zone = 145
        GROUP BY day
    )
ORDER BY people DESC;
