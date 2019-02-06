CREATE TABLE mtc_gender(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    gender int REFERENCES gender(id),
    fraction numeric
);

CREATE INDEX ON mtc_gender (zone, day, hour);
