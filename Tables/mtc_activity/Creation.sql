CREATE TABLE mtc_activity(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    hour int,
    people int,
    density numeric
);

CREATE INDEX ON mtc_activity (zone, day, hour);
