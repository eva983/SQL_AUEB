/*shows listings neighbourhood and id which have 3 minimun nights and manimun nights>10 .They are ordered from the less nights that you
can stay to the most nights that you can stay
rows:1063  */

SELECT listings.neighbourhood,listings.id,listings.minimum_nights,listings.maximum_nights
FROM listings 
WHERE listings.minimum_nights=3 AND listings.maximum_nights>10
ORDER BY listings.maximum_nights;


/*shows id from calendar and listings where the date is from 06-06-2020 to 18-07-2020.There are orderd in descending order based on date
rows:496263*/
SELECT c.listing_id,c.date
FROM calendar AS c
INNER JOIN listings AS l ON c.listing_id=l.id
WHERE c.date between '2020-06-06' AND '2020-07-18'
ORDER BY c.date DESC;

/*shows reviews which contain the word nice in comments ordered by the reviewer name
rows:70554*/
SELECT r.reviewer_name,r.comments
FROM reviews AS r
INNER JOIN  listings AS l ON r.listing_id=l.id
WHERE  comments LIKE '%nice%'
ORDER BY reviewer_name;


/*shows max and  in price
rows 1*/
SELECT MAX(l.price) ,MIN(l.price) 
FROM listings AS l
LEFT OUTER JOIN listings_summary AS ls ON l.id= ls.id;

/*shows the neighbourhoods which contains the word "ΑΜΠΕΛΟΚ"
row:1*/
SELECT  ne.neighbourhood
FROM geolocation AS ge
INNER JOIN neighbourhoods AS ne  ON ge.properties_neighbourhood=ne.neighbourhood
WHERE ge.properties_neighbourhood LIKE '%ΑΜΠΕΛΟΚ%';


/*shows only 40  reviewer names and the descriptions
rows:40 */
SELECT r.reviewer_name,l.description
FROM reviews AS r
INNER JOIN listings AS l
ON l.id = r.listing_id
LIMIT 40;
