SELECT
    day.id AS day,
    day.description,
    act.hour,
    act.people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
WHERE
    zone = 145 AND
    day = 1 AND
    (
        people = (
            SELECT
                MAX(people)
            FROM mtc_activity
            WHERE
                zone = 145 AND
                day = 1
        ) OR
        people = (
            SELECT
                MIN(people)
            FROM mtc_activity
            WHERE
                zone = 145 AND
                day = 1
        )
    )
ORDER BY people DESC;
