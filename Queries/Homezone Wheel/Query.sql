SELECT
    hz.fraction AS fraction,
    ST_Distance(ST_Centroid(z1.geom)::geography, ST_Centroid(z2.geom)::geography) AS distance,
    SUM(act.people) * hz.fraction AS people
FROM mtc_homezone AS hz
INNER JOIN mtc AS z1
    ON z1.id = hz.zone
INNER JOIN mtc AS z2
    ON z2.id = hz.homezone
INNER JOIN mtc_activity AS act
    ON act.zone = hz.zone
    AND act.day = hz.day
WHERE
    hz.zone = $1 AND
    hz.day = $2
GROUP BY hz.id, z1.geom, z2.geom
ORDER BY distance ASC;
