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
    act.zone = $1
ORDER BY act.day, act.hour ASC;


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
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326))
ORDER BY act.day, act.hour ASC;
