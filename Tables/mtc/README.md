The `mtc` table contains the geometries of every zone as well as its approximate area.

### Table Structure
```
  id  | groesse | area | geom
------+---------+------+------
 5222 |       2 |    4 | geom
 5223 |       2 |    4 | geom
 5224 |       2 |    4 | geom
 5225 |       2 |    4 | geom
 5226 |       2 |    4 | geom
 5227 |       2 |    4 | geom
 5228 |       2 |    4 | geom
 5229 |       2 |    4 | geom
 5230 |       2 |    4 | geom
 5231 |       2 |    4 | geom
```
`groesse` is German for 'size', and refers to the width of the zone in km, except for the smallest zones, that are denoted 500, which is in metre. `area` is calculated from `groesse`, and is intended for simpler usage.
