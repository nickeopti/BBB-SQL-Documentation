-- Check the newer version below this query

SELECT
    b.id,
    a.zone,
    a.day,
    c.description,
    a.hour,
    a.people,
    b.geom
FROM mtc_activity a 
INNER JOIN mtc b
    ON a.zone = b.id
INNER JOIN day c
    ON a.day = c.id
WHERE
    people = (
        SELECT
            MAX(people)
        FROM mtc_activity AS f 
        WHERE
            f.zone = a.zone AND
            f.day = a.day
    ) AND
	a.zone = 145 AND
    --ST_Contains(b.geom, ST_GeomFromText('POINT(11.56330 48.18674)', 4326))=true AND
    a.day = 1

UNION

SELECT
    b.id,
    a.zone,
    a.day,
    c.description,
    a.hour,
    a.people,
    b.geom
FROM mtc_activity a 
INNER JOIN mtc b
    ON a.zone = b.id
INNER JOIN day c
    ON a.day = c.id
WHERE
    people = (
        SELECT
            MIN(people)
        FROM mtc_activity AS f 
        WHERE
            f.zone = a.zone AND
            f.day = a.day
    ) AND
	a.zone = 145 AND
    --ST_Contains(b.geom, ST_GeomFromText('POINT(11.56330 48.18674)', 4326))=true AND
    a.day = 1
ORDER BY people DESC;


-- New alternative that needs verification

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
