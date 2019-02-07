SELECT
    ST_X(point) AS lon,
    ST_Y(point) AS lat
FROM (
    SELECT
        (ST_Dump(ST_RemoveRepeatedPoints(ST_Points(geom)))).geom AS point
    FROM mtc
    WHERE id = $1
) s;


-- Alternative without zone id

SELECT
    ST_X(point) AS lon,
    ST_Y(point) AS lat
FROM (
    SELECT
        (ST_Dump(ST_RemoveRepeatedPoints(ST_Points(geom)))).geom AS point
    FROM mtc
    WHERE
        ST_Contains(geom, ST_SetSRID(ST_MakePoint($1, $2), 4326))
) s;
