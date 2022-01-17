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

SELECT animals.name AS animal_name, vets.name AS vet, visit_date FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;
SELECT COUNT(*) FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name = 'Stephanie Mendez';
SELECT vets.name AS vet, species.name AS specie FROM vets LEFT JOIN specializatiONs ON specializations.vets_id = vets.id LEFT JOIN species ON specializations.species_id = species.id;
SELECT animals.name AS animal_name, visits.visit_date AS visit_date FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT COUNT(*) AS visits_count, animals.name AS animal_name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals_id = animals.id GROUP BY animals.name ORDER BY visits_count DESC LIMIT 1;
SELECT animals.name AS animal, visit_date FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animals_id = animals.id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date LIMIT 1;
SELECT animals.name AS animal_name, animals.date_of_birth AS animal_date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, species.name AS specie, owners.full_name AS animals_owner, vets.name AS vet_name, vets.age AS vet_age, visit_date FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animals_id = animals.id JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id ORDER BY visit_date DESC LIMIT 1;
SELECT COUNT(*) AS visits_count FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animals_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.id NOT IN (SELECT specializations.vets_id FROM specializations JOIN species ON specializations.species_id = species.id);
SELECT species.name AS most_requested_specie FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animals_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.id NOT IN (SELECT specializations.vets_id FROM specializations JOIN species ON specializations.species_id = species.id) GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;

CREATE INDEX animals_id_asc on visits (animals_id asc);
CREATE INDEX visits_asc ON visits (vets_id ASC, id, animals_id, visit_date);
CREATE INDEX email_asc ON owners (email ASC, id, full_name, age);

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
