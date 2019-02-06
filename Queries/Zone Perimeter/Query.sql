SELECT
    ST_X(point) AS lon,
    ST_Y(point) AS lat
FROM (
    SELECT
        (ST_Dump(ST_RemoveRepeatedPoints(ST_Points(geom)))).geom AS point
    FROM mtc
    WHERE id = $1
) s;
