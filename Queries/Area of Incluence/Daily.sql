SELECT
    SUM(ST_Area(zone.geom::geography))/1000000 AS area
FROM mtc_homezone AS hz
INNER JOIN mtc AS zone
    ON zone.id = hz.homezone
WHERE
    hz.zone = $1 AND
    hz.day = $2;
