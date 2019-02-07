SELECT
    SUM(ST_Area(zone.geom::geography))/1000000 AS area
FROM mtc_homezone AS hz
INNER JOIN mtc AS zone
    ON zone.id = hz.homezone
WHERE
    hz.zone = $1 AND
    hz.day = $2;


-- Alternative without zone id

SELECT
    SUM(ST_Area(homezone.geom::geography))/1000000 AS area
FROM mtc_homezone AS hz
INNER JOIN mtc AS homezone
    ON homezone.id = hz.homezone
INNER JOIN mtc AS zone
    ON zone.id = hz.zone
WHERE
    ST_Contains(zone.geom, ST_SetSRID(ST_MakePoint($1, $2), 4326)) AND
    hz.day = $3;
