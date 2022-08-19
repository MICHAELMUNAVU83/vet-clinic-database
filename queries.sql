/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon'
SELECT name FROM animals where date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals where neutered='true' AND escape_attempts<3;
SELECT name AND escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name !='Gabumon';
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg<=17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;

SELECT * from animals;

BEGIN;
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * FROM animals

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts =0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(*) as escape_attempts,neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

SELECT * FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals 
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT * FROM animals 
FULL OUTER JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(*), species.name FROM animals 
INNER JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT * FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT COUNT(*) as most_animals, owners.full_name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY most_animals DESC
LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT(DISTINCT animals.name) as visits, animals.name, vets.name
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name, vets.name;

SELECT vets.name, species.name
FROM vets
FULL OUTER JOIN specializations ON vets.id = specializations.vet_id
FULL OUTER JOIN species ON species.id = specializations.species_id;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.date_of_visit) as visits
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY visits DESC
LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

SELECT *
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT visits.date_of_visit, vets.name, animals.name as animal, animals.species_id as animal_species, specializations.species_id as vet_species
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON visits.animal_id = animals.id
FULL OUTER JOIN specializations ON vets.id = specializations.vet_id
WHERE animals.species_id != specializations.species_id;

SELECT animals.name as animal, vets.name as vet, COUNT(visits.date_of_visit) as total_visits, species.name as specie
FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name, vets.name, species.name
ORDER BY total_visits DESC
LIMIT 1;
