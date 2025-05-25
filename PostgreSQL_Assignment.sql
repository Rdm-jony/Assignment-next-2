-- Active: 1747497800549@@localhost@5432@conservation_db
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(255)
)


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(255),
    scientific_name VARCHAR(255),
    discovery_date DATE,
    conservation_status VARCHAR(255)
)

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(255),
    notes TEXT
)

INSERT INTO rangers(name,region) VALUES
('Alice Green','Northern Hills'),
('Bob White','River Delta'),
('Carol King','Mountain Range')

INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES 
(1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);

SELECT * FROM rangers

SELECT * FROM species

SELECT * FROM sightings

-- Problem 1
INSERT INTO rangers(name,region) VALUES
('Derek Fox','Coastal Plains')

-- Problem 2
SELECT count(DISTINCT species_id) as unique_species_count  FROM species
INNER JOIN sightings USING (species_id)

-- Problem 3
SELECT * FROM sightings
WHERE location LIKE '%Pass'

-- Problem 4
SELECT name,count(*) as total_sightings  FROM rangers
INNER JOIN sightings USING (ranger_id)
GROUP BY name

-- Problem 5
CREATE VIEW seen_species
AS
SELECT DISTINCT common_name FROM species
INNER JOIN sightings USING(species_id)

SELECT common_name FROM species
WHERE common_name NOT IN (SELECT * FROM seen_species)


-- Problem 6
SELECT common_name,sighting_time,name FROM rangers
INNER JOIN sightings USING(ranger_id)
INNER JOIN species USING (species_id)
ORDER BY sighting_time DESC
LIMIT 2

-- Problem 7
UPDATE species
SET conservation_status='Historic'
WHERE extract(YEAR FROM discovery_date)<1800

-- Problem 8
SELECT
sighting_id,
CASE
WHEN sighting_time::time BETWEEN '01:00:00' AND '11:59:00' THEN 'Morning'
WHEN sighting_time::time BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
WHEN sighting_time::time BETWEEN '17:01:00' AND '23:59:00' THEN 'Evening'
END as time_of_day
FROM sightings

-- Problem 9
CREATE VIEW seen_ranger
AS
SELECT DISTINCT ranger_id FROM rangers
INNER JOIN sightings USING (ranger_id)

DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT * FROM seen_ranger)
