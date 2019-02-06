SELECT b.gid,b.id,a.zone_act,a.days_act,c.name_day, a.hours_act, a.count_act, b.geom
FROM mtc_activity a 
INNER JOIN mtc b ON a.zone_act = b.gid
INNER JOIN days c ON a.days_act = c.id_day
WHERE count_act = (SELECT MAX(count_act) FROM mtc_activity AS f 
				   WHERE f.zone_act= a.zone_act AND f.days_act = a.days_act)
AND ST_Contains(b.geom, ST_GeomFromText('POINT(11.56330 48.18674)', 4326))=true
AND a.days_act=1
UNION
SELECT b.gid,b.id,a.zone_act,a.days_act, c.name_day, a.hours_act, a.count_act, b.geom
FROM mtc_activity a 
INNER JOIN mtc b ON a.zone_act = b.gid
INNER JOIN days c ON a.days_act = c.id_day
WHERE count_act = (SELECT MIN(count_act) FROM mtc_activity AS f 
				   WHERE f.zone_act= a.zone_act AND f.days_act = a.days_act)
AND ST_Contains(b.geom, ST_GeomFromText('POINT(11.56330 48.18674)', 4326))=true
AND a.days_act=1 ORDER BY count_act DESC;
