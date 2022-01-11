/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOL NOT NULL,
    weight_kg decimal NOT NULL,
    PRIMARY KEY (id)
);

/* Add column species to the table */

ALTER TABLE animals ADD COLUMN species TEXT;
