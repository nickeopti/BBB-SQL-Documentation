The `mtc_activity` table contains data regarding the number of people in each zone, every hour of the week.

### Table Structure
```
  id  | zone | day | hour | people | density 
------+------+-----+------+--------+---------
 4177 |  102 |   2 |    1 |   1934 |    7736
 4178 |  102 |   2 |    2 |   1767 |    7068
 4179 |  102 |   2 |    3 |   1781 |    7124
 4180 |  102 |   2 |    4 |   1909 |    7636
 4181 |  102 |   2 |    5 |   2083 |    8332
 4182 |  102 |   2 |    6 |   2051 |    8204
 4183 |  102 |   2 |    7 |   1852 |    7408
 4184 |  102 |   2 |    8 |   1530 |    6120
 4185 |  102 |   2 |    9 |   1347 |    5388
 4186 |  102 |   2 |   10 |   1284 |    5136
```
`zone` references `mtc.id`. `density` is calculated from `people` and `mtc.area`, and is in units of people per square kilometres.
