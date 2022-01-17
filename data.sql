/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
  (1, 'Agumon', '2020-02-03', 0, true, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, true, 8),
  (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (5, 'Charmander', '2020-02-8', 0, false, 11),
  (6, 'Plantmon', '2022-11-15', 2, true, 5.7),
  (7, 'Squirtle', '1993-04-02', 3, false, 12.13),
  (8, 'Angemon', '2005-06-12', 1, true, 45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17);

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

INSERT INTO owners (full_name, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Wittaker', 38);

INSERT INTO species (name) 
VALUES 
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Gabumon' AND name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' or name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id)
VALUES
((select id from species where name = 'Pokemon'), (select id from vets where name = 'William Tatcher')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));

INSERT INTO visits (animals_id, vets_id, visit_date)
VALUES
((select id from animals where name = 'Agumon'), (select id from vets where name = 'William Tatcher'), '2020-05-24'),
((select id from animals where name = 'Agumon'), (select id from vets where name = 'Stephanie Mendez'), '2020-07-22'),
((select id from animals where name = 'Gabumon'), (select id from vets where name = 'Jack Harkness'), '2021-02-02'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-01-05'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-03-08'),
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-05-14'),
((select id from animals where name = 'Devimon'), (select id from vets where name = 'Stephanie Mendez'), '2021-05-04'),
((select id from animals where name = 'Charmander'), (select id from vets where name = 'Jack Harkness'), '2021-02-24'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2019-12-21'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'William Tatcher'), '2020-08-10'),
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2021-04-07'),
((select id from animals where name = 'Squirtle'), (select id from vets where name = 'Stephanie Mendez'), '2019-09-29'),
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2020-10-03'),
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2021-11-04'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2019-01-24'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-05-15'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-02-27'),
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-08-03'),
((select id from animals where name = 'Blossom'), (select id from vets where name = 'Stephanie Mendez'), '2020-05-24'),
((select id from animals where name = 'Blossom'), (select id from vets where name = 'William Tatcher'), '2020-01-11');

INSERT INTO visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';