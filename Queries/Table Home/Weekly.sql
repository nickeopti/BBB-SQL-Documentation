SELECT
	b.gid,
	b.id,
	a.zone_act,
	a.days_act,
	c.name_day,
	SUM(a.count_act) AS people,
	b.geom
FROM mtc_activity a 
INNER JOIN mtc b
	ON a.zone_act = b.id
INNER JOIN days c
	ON a.days_act = c.id_day
WHERE a.zone_act = 145
GROUP BY b.gid, b.id, a.zone_act, a.days_act, c.name_day, b.geom
HAVING SUM(a.count_act) >= all (SELECT SUM(a.count_act) AS people 
     FROM mtc_activity a INNER JOIN mtc b ON a.zone_act = b.id 
	 WHERE a.zone_act = 145
     GROUP BY a.zone_act,a.days_act)
UNION
SELECT
   b.gid,
   b.id,
   a.zone_act,
   a.days_act,
   c.name_day,
   SUM(a.count_act) AS people,
   b.geom
FROM mtc_activity a 
INNER JOIN mtc b
	ON a.zone_act = b.id
INNER JOIN days c
   ON a.days_act = c.id_day
WHERE a.zone_act = 145
GROUP BY b.gid, b.id, a.zone_act, a.days_act, c.name_day, b.geom
HAVING SUM(a.count_act) <= all (SELECT SUM(a.count_act) AS people 
     FROM mtc_activity a INNER JOIN mtc b ON a.zone_act = b.id 
	 WHERE a.zone_act = 145
     GROUP BY a.zone_act,a.days_act)
ORDER BY people DESC;
