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
