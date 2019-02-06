-- Create gender table
CREATE TABLE gender(
    id serial PRIMARY KEY,
    description varchar(6)
);

-- Insert static data into gender table
INSERT INTO gender(id, description) VALUES(1, 'Male');
INSERT INTO gender(id, description) VALUES(2, 'Female');
