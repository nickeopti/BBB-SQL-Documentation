The `mtc_homezone` table contains data regarding the origin of people in each zone each day.

### Table Structure
```
 id | zone | homezone | day |  fraction   
----+------+----------+-----+-------------
  5 |    6 |        6 |   2 | 0.461010922
 10 |    6 |        8 |   2 | 0.091567183
 15 |    6 |      227 |   2 | 0.066421133
 20 |    6 |      229 |   2 | 0.014478029
 25 |    6 |      442 |   2 | 0.006477013
 30 |    6 |    15746 |   2 | 0.035814072
 35 |    6 |    15747 |   2 | 0.102997206
 38 |    6 |    15757 |   2 |  0.00520701
 43 |    6 |    15758 |   2 | 0.197993396
 48 |    6 |    15767 |   2 | 0.007493015
```
`zone` references `mtc.id` and is the zone that people come _to_. `homezone` also references `mtc.id` but it is the zone that people come _from_.
