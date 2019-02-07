SELECT
    day.id AS day,
    day.description,
    SUM(act.people) AS people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
WHERE
    zone = $1
GROUP BY day.id
HAVING
    SUM(people) >= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity
        WHERE
            zone = $1
        GROUP BY day
    ) OR
    SUM(people) <= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity
        WHERE
            zone = $1
        GROUP BY day
    )
ORDER BY people DESC;


-- Alternative without zone id

SELECT
    day.id AS day,
    day.description,
    SUM(act.people) AS people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
INNER JOIN mtc AS zone
    ON act.zone = zone.id
WHERE
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326))
GROUP BY day.id
HAVING
    SUM(people) >= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity AS act
        INNER JOIN mtc AS zone
            ON act.zone = zone.id
        WHERE
            ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326))
        GROUP BY day
    ) OR
    SUM(people) <= ALL (
        SELECT
            SUM(people)
        FROM mtc_activity AS act
        INNER JOIN mtc AS zone
            ON act.zone = zone.id
        WHERE
            ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326))
        GROUP BY day
    )
ORDER BY people DESC;
