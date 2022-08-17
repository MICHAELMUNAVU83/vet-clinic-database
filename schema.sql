
/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (id integer ,name varchar , date_of_birth date , escape_attempts integer , neutered boolean , weight_kg decimal );
ALTER TABLE animals
ALTER COLUMN name TYPE varchar(200);
ALTER TABLE animals  ADD PRIMARY KEY (id);
ALTER TABLE animals  ALTER COLUMN id  SET NOT NULL;

ALTER TABLE animals
ADD COLUMN species varchar(200);
CREATE TABLE owners ( id  serial primary key ,full_name varchar(200), age INTEGER);
CREATE TABLE species ( id  serial primary key ,name varchar(200));
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD id serial primary key;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INTEGER;
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INTEGER;
ALTER TABLE animals
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);


