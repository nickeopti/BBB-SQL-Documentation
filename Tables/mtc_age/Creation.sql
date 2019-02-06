CREATE TABLE mtc_age(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    age int REFERENCES age(id),
    fraction numeric
);

CREATE INDEX ON mtc_age (zone, day, hour);
