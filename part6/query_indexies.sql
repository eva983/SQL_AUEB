CREATE INDEX listing_id_index_for_host ON host(id);
DROP INDEX listing_id_index_for_host;

CREATE INDEX guests_included_index ON price(guests_included, price);
DROP INDEX guests_included_index;

CREATE INDEX price_index ON price(weekly_price, id, cleaning_fee);
DROP INDEX price_index;

CREATE INDEX host_index ON host( id, location);
DROP INDEX host_index;

CREATE INDEX room_index ON room( id,beds,bedrooms,weekly_price);
DROP INDEX room_index;

CREATE INDEX geolocation_index ON geolocation(properties_neighbourhood);
DROP INDEX geolocation_index;

CREATE INDEX listing_index ON listing( listing_url);
DROP INDEX listing_index;