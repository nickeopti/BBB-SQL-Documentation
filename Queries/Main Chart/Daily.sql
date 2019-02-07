SELECT
    day.id,
    day.description,
    act.hour,
    act.people,
    act.density
FROM mtc_activity AS act
INNER JOIN day AS day
    ON act.day = day.id
WHERE
    act.zone = $1 AND
    act.day = $2
ORDER BY act.hour ASC;


-- Alternative without zone id

SELECT
    day.id,
    day.description,
    act.hour,
    act.people,
    act.density
FROM mtc_activity AS act
INNER JOIN day AS day
    ON act.day = day.id
INNER JOIN mtc AS zone
    ON act.zone = zone.id
WHERE
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
    act.day = $3
ORDER BY act.hour ASC;
