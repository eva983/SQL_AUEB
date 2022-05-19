CREATE TABLE Location
AS(SELECT DISTINCT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact FROM listings);

ALTER TABLE Location
ADD FOREIGN KEY(id) REFERENCES listings(id);

ALTER TABLE Listings DROP FOREIGN KEY (listings_neighbourhood_cleansed_fkey1);

ALTER TABLE Location
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);

ALTER TABLE listings 
  DROP COLUMN street,
  DROP COLUMN neighbourhood,
 DROP COLUMN neighbourhood_cleansed,
  DROP COLUMN city,
 DROP COLUMN state,
  DROP COLUMN zipcode,
  DROP COLUMN market,
  DROP COLUMN smart_location,
  DROP COLUMN country_code,
  DROP COLUMN country,
  DROP COLUMN latitude,
  DROP COLUMN longitude,
 DROP COLUMN is_location_exact;