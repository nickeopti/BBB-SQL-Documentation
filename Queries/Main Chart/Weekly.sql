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
