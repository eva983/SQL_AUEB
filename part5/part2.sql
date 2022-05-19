/*inner join for every listing show its price weekly price, price id and price cleaning fee where weekly price is 1000 or less
rows:526s*/
SELECT price.weekly_price, price.id, price.cleaning_fee
FROM price 
INNER JOIN listing 
ON listing.id=price.id
WHERE price.weekly_price<=1000;


/*outer join for every listing show its host id and its location where the location is Athens
rows:3362*/
SELECT  host.id, host.location
from host
FULL OUTER JOIN listing
ON listing.id = host.id
WHERE host.location  LIKE 'Athens%'
GROUP BY(host.id);


/*inner join for every listing show its room id, room beds, room bedrooms and room weekly price where beds are 3 or more
rows:3387*/
SELECT room.id,room.beds,room.bedrooms,room.weekly_price
FROM room 
INNER JOIN listing
ON listing.id=room.id
GROUP BY room.id,room.beds,room.bedrooms,room.weekly_price
HAVING  max(room.beds)>=3;



SELECT  geolocation.properties_neighbouhood
from geolocation
FULL OUTER JOIN location
ON geolocation.properties_neighbouhood = location.neighbourhood_cleansed;

select listing_url, max(price.weekly_price) as max_price, review_scores_rating
from listing
inner join price
on price.id=listing.id
where review_scores_rating>'90' and property_type='Apartment'
group by review_scores_rating, listing_url
having max( weekly_price)<1000;

