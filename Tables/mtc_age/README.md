The `mtc_age` table contains data regarding the distribution of people's age in each zone, every hour of the week.

### Table Structure
```
  id   | zone | day | hour | age |  fraction   
-------+------+-----+------+-----+-------------
 24205 |  102 |   2 |    1 |   1 | 0.195496921
 24206 |  102 |   2 |    2 |   1 | 0.206071267
 24207 |  102 |   2 |    3 |   1 | 0.198749083
 24208 |  102 |   2 |    4 |   1 | 0.191371801
 24209 |  102 |   2 |    5 |   1 | 0.194156498
 24210 |  102 |   2 |    6 |   1 |  0.18353073
 24211 |  102 |   2 |    7 |   1 | 0.192953967
 24212 |  102 |   2 |    8 |   1 | 0.182537562
 24213 |  102 |   2 |    9 |   1 |  0.16912314
 24214 |  102 |   2 |   10 |   1 | 0.174165026
```
`zone` references `mtc.id`. `age` references `age.id`
