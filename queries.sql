/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals where date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals where neutered = TRUE AND escape_attempts<3;
SELECT date_of_birth FROM animals where name='Agumon' OR name ='Pikachu';
SELECT name, escape_attempts  FROM animals WHERE weight_kg >10.5 ;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg <= 17.3;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0 ;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(*) as escape_attempts,neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg)  FROM animals GROUP BY neutered;
SELECT AVG(escape_attempts) FROM animals WHERE  date_of_birth BETWEEN '1900-01-01' AND '2021-12-31' GROUP BY neutered;

