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
