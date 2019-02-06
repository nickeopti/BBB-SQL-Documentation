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
