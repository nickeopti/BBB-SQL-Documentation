CREATE TABLE mtc_homezone(
    id serial PRIMARY KEY,
    zone bigint REFERENCES mtc(id),
    homezone bigint REFERENCES mtc(id),
    day int REFERENCES day(id),
    fraction numeric
);

CREATE INDEX ON mtc_homezone (zone, day);
