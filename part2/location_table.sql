CREATE TABLE Location
AS(SELECT DISTINCT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact FROM listings);

ALTER TABLE Location
ADD FOREIGN KEY(id) REFERENCES listings(id);

ALTER TABLE Listings DROP FOREIGN KEY (listings_neighbourhood_cleansed_fkey1);

ALTER TABLE Location
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);