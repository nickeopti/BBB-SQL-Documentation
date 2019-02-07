The `mtc_gender` table contains data regarding the distribution of people's gender in each zone, every hour of the week.

### Table Structure
```
  id  | zone | day | hour | gender |  fraction   
------+------+-----+------+--------+-------------
 8345 |  102 |   2 |    1 |      1 | 0.478854346
 8346 |  102 |   2 |    2 |      1 | 0.489383196
 8347 |  102 |   2 |    3 |      1 | 0.495189687
 8348 |  102 |   2 |    4 |      1 | 0.490552102
 8349 |  102 |   2 |    5 |      1 | 0.489308389
 8350 |  102 |   2 |    6 |      1 | 0.473528171
 8351 |  102 |   2 |    7 |      1 | 0.439245458
 8352 |  102 |   2 |    8 |      1 | 0.433666989
 8353 |  102 |   2 |    9 |      1 | 0.426847879
 8354 |  102 |   2 |   10 |      1 | 0.406820574
```
`zone` references `mtc.id`. `gender` references `gender.id`
