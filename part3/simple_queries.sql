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
FULL OUTER JOIN listings_summary AS ls ON l.id= ls.id;

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


/* Find the first 100 listings that are available 
output: 100 rows*/
SELECT listings.id, listings.listing_url,listings.neighbourhood_Cleansed
FROM calendar
INNER JOIN listings
ON listings.id=calendar.listing_id
WHERE calendar.available=true 
LIMIT 100 ;

/*show listings in KERAMEIKOS with 2 beds and 1 or more bathrooms in ascending order by price
OUTPUT: 28 rows*/
SELECT neighbourhoods.neighbourhood,listings.price,listings.listing_url,listings.bathrooms
FROM listings
INNER JOIN neighbourhoods
ON listings.neighbourhood_cleansed=neighbourhoods.neighbourhood
WHERE beds=2
AND neighbourhoods.neighbourhood LIKE '%ΚΕΡΑΜΕΙΚΟΣ%'
AND bathrooms>'1.0'
ORDER BY listings.price ASC;


/*show listings available on NYE 2020 and short by price
outout:6841 rows*/
SELECT  listings.neighbourhood_cleansed, calendar.listing_id, listings.listing_url, calendar.price
FROM listings
INNER JOIN calendar
ON listings.id=calendar.listing_id
WHERE calendar.available=true 
AND date='2020-12-31'
Order by price ASC;


/* AVG() */ 
SELECT AVG(bedrooms)
FROM listings;

/*For a certain range of days which buildings were available in a specified neighbourhood and their price was
 no more than 500$.
137 rows */
SELECT Listings.id, Listings.listing_url, Listings.price, listings.neighbourhood_cleansed
FROM Listings
INNER JOIN (SELECT DISTINCT Calendar.listing_id
	FROM Calendar
	WHERE Calendar.available = 't' AND Calendar.date between '2020-08-01' AND '2020-08-10') AS NewTable 
ON Listings.id = NewTable.listing_id
WHERE Listings.price<='$300.00'
AND  listings.neighbourhood_cleansed LIKE '%ΚΥΨΕΛΗ%';

/*show Calendar and Listings tables and  sorts them with by date and price. */
SELECT Calendar.*, Listings.bedrooms,  Listings.listing_url, Listings.bathrooms
FROM Calendar
LEFT OUTER JOIN Listings ON Listings.id = Calendar.listing_id
WHERE (Calendar.price is  NOT null)
ORDER BY Calendar.date asc, Listings.price desc;
