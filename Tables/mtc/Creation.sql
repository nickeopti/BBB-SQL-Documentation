CREATE TABLE mtc(
    id bigint PRIMARY KEY,
    groesse int,
    geom geometry
);

CREATE INDEX zones1_geom_gpx ON mtc USING GIST (geom);
CREATE INDEX zones2_geom_gpx ON mtc USING GIST (geography(geom));
CREATE INDEX ON mtc (id);
