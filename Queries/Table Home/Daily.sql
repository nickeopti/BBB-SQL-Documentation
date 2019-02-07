SELECT
    day.id AS day,
    day.description,
    act.hour,
    act.people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
WHERE
    zone = $1 AND
    day = $2 AND
    (
        people = (
            SELECT
                MAX(people)
            FROM mtc_activity
            WHERE
                zone = $1 AND
                day = $2
        ) OR
        people = (
            SELECT
                MIN(people)
            FROM mtc_activity
            WHERE
                zone = $1 AND
                day = $2
        )
    )
ORDER BY people DESC;


-- Alternative without zone id

SELECT
    day.id AS day,
    day.description,
    act.hour,
    act.people
FROM mtc_activity AS act
INNER JOIN day
    ON act.day = day.id
INNER JOIN mtc AS zone
    ON act.zone = zone.id
WHERE
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
    day = $3 AND
    (
        people = (
            SELECT
                MAX(act.people)
            FROM mtc_activity AS act
            INNER JOIN mtc AS zone
                ON act.zone = zone.id
            WHERE
                ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
                act.day = $3
        ) OR
        people = (
            SELECT
                MIN(act.people)
            FROM mtc_activity AS act
            INNER JOIN mtc AS zone
                ON act.zone = zone.id
            WHERE
                ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
                act.day = $3
        )
    )
ORDER BY people DESC;
