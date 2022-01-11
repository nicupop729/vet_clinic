/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* How many animals are there? */

SELECT COUNT(*) FROM animals;

/* Answer: 9; */

/* How many animals have never tried to escape? */

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/* Answer: 2; */

/* What is the average weight of animals? */

SELECT AVG(weight_kg) FROM animals;

/* Answer: 16.6444444444444444; */

/* Who escapes the most, neutered or not neutered animals? */

/* Who escapes the most */

SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

/* Answer: Boarman; */

/* neutered */

SELECT * FROM animals WHERE neutered = true;

/* Answer: 
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon | 2017-05-12    |               5 | t        |        11 | digimon
  8 | Angemon | 2005-06-12    |               1 | t        |        45 | digimon
  9 | Boarmon | 2005-06-07    |               7 | t        |      20.4 | digimon
 10 | Blossom | 1998-10-13    |               3 | t        |        17 | pokemon */

SELECT COUNT(*) FROM animals WHERE neutered = true;

/* Answer: 6; */

/* not neutered */

SELECT * FROM animals WHERE neutered = false;

/* Answer: 
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon */

SELECT COUNT(*) FROM animals WHERE neutered = false;

/* Answer: 3; */

/* What is the minimum and maximum weight of each type of animal? */

/* digimon - maximum weight */

SELECT MAX(weight_kg) FROM animals WHERE species = 'digimon';

/* Answer: 45; */

/* digimon - minimum weight */

SELECT MIN(weight_kg) FROM animals WHERE species = 'digimon';

/* Answer: 8; */

/* pokemon - maximum weight */

SELECT MAX(weight_kg) FROM animals WHERE species = 'pokemon';

/* Answer: 17; */

/* pokemon - minimum weight */

SELECT MIN(weight_kg) FROM animals WHERE species = 'pokemon';

/* Answer: 11; */

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-01-01';

/* Answer: 3.0000000000000000; */
