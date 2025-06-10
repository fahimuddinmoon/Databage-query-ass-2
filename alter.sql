-- Active: 1748242847269@@127.0.0.1@5432@postgres

CREATE TABLE ranger (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    region VARCHAR(25) NOT NULL
);


CREATE TABLE species (
    species_id INT PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings (
    sighting_id INT PRIMARY KEY,
    species_id INT,
    ranger_id INT,
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (species_id) REFERENCES species(species_id),
    FOREIGN KEY (ranger_id) REFERENCES ranger(ranger_id)
);

INSERT INTO ranger ( name, region)
VALUES
( 'Alice Green', 'Northern Hills'),
( 'Bob White', 'River Delta'),
( 'Carol King', 'Mountain Range');

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status)
VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings 
VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


--problem 1
INSERT INTO ranger (name, region) 
VALUES('Derek Fox ','Coastal Plains');

--problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species
FROM sightings;

--problem 3
SELECT *
FROM sightings
WHERE location LIKE '%Pass';

--problem 4
SELECT ranger.name, COUNT(sighting.sighting_id) AS all_sighting
FROM ranger ranger
RIGHT JOIN sightings sighting ON ranger.ranger_id = sighting.ranger_id
GROUP BY ranger.name;

--problem 5
SELECT common_name
FROM species
WHERE species_id NOT IN (
SELECT DISTINCT species_id FROM sightings
);

--problem 6
SELECT species.common_name, sighting.sighting_time, ranger.name
from sightings sighting
JOIN species ON sighting.species_id = species.species_id
JOIN ranger ON sighting.ranger_id = ranger.ranger_id
ORDER BY sighting.sighting_time DESC
LIMIT 2;

--problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--problem 8
SELECT sighting_id,
CASE
WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day
FROM sightings;

--problem 9
DELETE FROM ranger
WHERE ranger_id NOT IN (
SELECT DISTINCT ranger_id FROM sightings
);