
/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (id integer ,name varchar , date_of_birth date , escape_attempts integer , neutered boolean , weight_kg decimal );
ALTER TABLE animals
ALTER COLUMN name TYPE varchar(200);
ALTER TABLE animals  ADD PRIMARY KEY (id);
ALTER TABLE animals  ALTER COLUMN id  SET NOT NULL;
