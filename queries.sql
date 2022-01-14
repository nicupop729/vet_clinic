/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT * FROM animals WHERE neutered = true;
SELECT COUNT(*) FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE neutered = false;
SELECT COUNT(*) FROM animals WHERE neutered = false;
SELECT MAX(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MAX(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-01-01';

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name AS Pokemons FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name AS owners, animals.name AS animals FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name AS specie_names, COUNT(*) AS animals_count FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = (SELECT id FROM species WHERE species.name = 'Digimon');
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name AS owners, COUNT(animals) AS animals_count FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name;

select animals.name as animal_name, vets.name as vet, visit_date from visits join vets on visits.vets_id = vets.id join animals on animals_id = animals.id where vets.name = 'William Tatcher' order by visit_date desc limit 1;
select count(*) from visits join vets on visits.vets_id = vets.id join animals on animals_id = animals.id where vets.name = 'Stephanie Mendez';
select vets.name as vet, species.name as specie from vets left join specializations on specializations.vets_id = vets.id left join species on specializations.species_id = species.id;
select animals.name as animal_name, visits.visit_date as visit_date from visits join vets on visits.vets_id = vets.id join animals on animals_id = animals.id where vets.name = 'Stephanie Mendez' and visits.visit_date between '2020-04-01' and '2020-08-30';
select count(*) as visits_count, animals.name as animal_name from visits join vets on visits.vets_id = vets.id join animals on animals_id = animals.id group by animals.name order by visits_count desc limit 1;
select animals.name as animal, visit_date from visits join vets on visits.vets_id = vets.id join animals on visits.animals_id = animals.id where vets.name = 'Maisy Smith' order by visit_date limit 1;
select animals.name as animal_name, animals.date_of_birth as animal_date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, species.name as specie, owners.full_name as animals_owner, vets.name as vet_name, vets.age as vet_age, visit_date from visits join vets on visits.vets_id = vets.id join animals on visits.animals_id = animals.id join species on animals.species_id = species.id join owners on animals.owner_id = owners.id order by visit_date desc limit 1;
select count(*) as visits_count from visits join vets on visits.vets_id = vets.id join animals on visits.animals_id = animals.id join species on animals.species_id = species.id where vets.id not in (select specializations.vets_id from specializations join species on specializations.species_id = species.id);
select species.name as most_requested_specie from visits join vets on visits.vets_id = vets.id join animals on visits.animals_id = animals.id join species on animals.species_id = species.id where vets.id not in (select specializations.vets_id from specializations join species on specializations.species_id = species.id) group by species.name order by count(*) desc limit 1;

