SELECT
    SUM(people) AS people
FROM mtc_activity
WHERE
    zone = $1 AND
    day = $2
GROUP BY zone;


-- Alternative without zone id

SELECT
    SUM(act.people) AS people
FROM mtc_activity AS act
INNER JOIN mtc AS zone
    ON act.zone = zone.id
WHERE
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
    day = $3
GROUP BY zone;
