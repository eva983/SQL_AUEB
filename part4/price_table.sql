CREATE TABLE Price
AS(SELECT DISTINCT id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm FROM listings);

UPDATE Price SET price=replace(price,'$','');
UPDATE Price SET weekly_price=replace(weekly_price,'$','');
UPDATE Price SET monthly_price=replace(monthly_price,'$','');
UPDATE Price SET security_deposit=replace(security_deposit,'$','');
UPDATE Price SET cleaning_fee=replace(cleaning_fee,'$','');
UPDATE Price SET extra_people=replace(extra_people,'$','');

UPDATE Price SET price=replace(price,',','');
UPDATE Price SET weekly_price=replace(weekly_price,',','');
UPDATE Price SET monthly_price=replace(monthly_price,',','');
UPDATE Price SET security_deposit=replace(security_deposit,',','');
UPDATE Price SET cleaning_fee=replace(cleaning_fee,',','');
UPDATE Price SET extra_people=replace(extra_people,',','');

ALTER TABLE Price ALTER COLUMN price TYPE numeric USING price::numeric;
ALTER TABLE Price ALTER COLUMN weekly_price TYPE numeric USING weekly_price::numeric;
ALTER TABLE Price ALTER COLUMN monthly_price  TYPE numeric USING monthly_price::numeric;
ALTER TABLE Price ALTER COLUMN security_deposit  TYPE numeric USING security_deposit::numeric;
ALTER TABLE Price ALTER COLUMN cleaning_fee TYPE numeric USING cleaning_fee::numeric;
ALTER TABLE Price ALTER COLUMN extra_people TYPE numeric USING extra_people::numeric;

ALTER TABLE Price
ADD FOREIGN KEY(id) REFERENCES listings(id);


ALTER TABLE listings
DROP COLUMN  weekly_price,
DROP COLUMN  monthly_price,
DROP COLUMN security_deposit,
DROP COLUMN cleaning_fee,
DROP COLUMN guests_included,
DROP COLUMN  extra_people,
DROP COLUMN  minimum_nights,
DROP COLUMN  maximum_nights,
DROP COLUMN  minimum_minimum_nights,
DROP COLUMN  maximum_minimum_nights,
DROP COLUMN  minimum_maximum_nights,
DROP COLUMN  maximum_maximum_nights, 
DROP COLUMN  minimum_nights_avg_ntm,
DROP COLUMN   maximum_nights_avg_ntm ;