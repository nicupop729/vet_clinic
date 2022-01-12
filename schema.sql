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

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners (
    id SERIAL,
    full_name TEXT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);
