```SQL
--CREATE DATABASE bbb; -- Uncomment if not already created externally
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;


-- Create age table
CREATE TABLE age(
    id serial PRIMARY KEY,
    description varchar(5)
);

-- Insert static data into age table
INSERT INTO age(id, description) VALUES(1, '20-29');
INSERT INTO age(id, description) VALUES(2, '30-39');
INSERT INTO age(id, description) VALUES(3, '40-49');
INSERT INTO age(id, description) VALUES(4, '50-69');
INSERT INTO age(id, description) VALUES(5, '60-69');
INSERT INTO age(id, description) VALUES(6, '70+');


-- Create days table
CREATE TABLE day(
    id serial PRIMARY KEY,
    description varchar(3)
);

-- Insert static data into days table
INSERT INTO day(id, description) VALUES(1, 'MON');
INSERT INTO day(id, description) VALUES(2, 'TUE');
INSERT INTO day(id, description) VALUES(3, 'WED');
INSERT INTO day(id, description) VALUES(4, 'THU');
INSERT INTO day(id, description) VALUES(5, 'FRI');
INSERT INTO day(id, description) VALUES(6, 'SAT');
INSERT INTO day(id, description) VALUES(7, 'SUN');


-- Create gender table
CREATE TABLE gender(
    id serial PRIMARY KEY,
    description varchar(6)
);

-- Insert static data into gender table
INSERT INTO gender(id, description) VALUES(1, 'Male');
INSERT INTO gender(id, description) VALUES(2, 'Female');


CREATE TABLE mtc(
    id bigint PRIMARY KEY,
    groesse int,
    geom geometry
);

CREATE TABLE mtc_activity(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    people int,
    density numeric
);

CREATE TABLE mtc_age(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    age int REFERENCES age(id),
    fraction numeric
);

CREATE TABLE mtc_gender(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    gender int REFERENCES gender(id),
    fraction numeric
);

CREATE TABLE mtc_homezone(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    homezone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    fraction numeric
);

-- Create indexes on tables
CREATE INDEX zones1_geom_gpx ON mtc USING GIST (geom);
CREATE INDEX zones2_geom_gpx ON mtc USING GIST (geography(geom));
CREATE INDEX ON mtc (id);
CREATE INDEX ON mtc_activity (zone, day, hour);
CREATE INDEX ON mtc_age (zone, day, hour);
CREATE INDEX ON mtc_gender (zone, day, hour);
CREATE INDEX ON mtc_homezone (zone, day);
```
