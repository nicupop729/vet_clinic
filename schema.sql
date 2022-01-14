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

BEGIN;
ALTER TABLE animals DROP id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
COMMIT;

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT r_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD CONSTRAINT r_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
    id SERIAL,
    name text NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL,
    PRIMARY KEY (id)
);
