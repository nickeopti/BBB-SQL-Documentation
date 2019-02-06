SELECT
    id AS zone
FROM mtc 
WHERE
    ST_Contains(geom, ST_SetSRID(ST_MakePoint($1, $2), 4326));
