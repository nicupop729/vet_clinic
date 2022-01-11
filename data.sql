/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
  (1, 'Agumon', '2020-02-03', 0, true, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, true, 8),
  (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (4, 'Devimon', '2017-05-12', 5, true, 11);

/* Add new animals to the 'animal' table */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (5, 'Charmander', '2020-02-8', 0, false, 11),
  (6, 'Plantmon', '2022-11-15', 2, true, 5.7),
  (7, 'Squirtle', '1993-04-02', 3, false, 12.13),
  (8, 'Angemon', '2005-06-12', 1, true, 45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17);

/* Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before transaction. */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Inside a transaction: */

BEGIN;

/*
Update the animals table by setting the species column to digimon for all animals that have a name ending in mon. */ 

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';

/* Update the animals table by setting the species column to pokemon for all animals that don't have species already set */

UPDATE animals SET species = 'pokemon' WHERE species = '';

/* Commit the transaction */

COMMIT;

/* Inside a transaction delete all records in the animals table, then roll back the transaction */

BEGIN;
DELETE FROM animals;
ROLLBACK;

/* After the roll back verify if all records in the animals table still exist.  */

SELECT * FROM animals;
