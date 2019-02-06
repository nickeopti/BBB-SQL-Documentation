SELECT
    SUM(AREA)/1000000 AS area
FROM (
    SELECT DISTINCT ON (homezone)
        ST_Area(zone.geom::geography) as AREA
    FROM mtc_homezone AS hz
    INNER JOIN mtc AS zone
        ON zone.id = hz.homezone
    WHERE hz.zone = $1
) s;
