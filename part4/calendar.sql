UPDATE calendar SET price=replace(price,'$','');
UPDATE calendar SET price=replace(price,',','');
UPDATE calendar SET adjusted_price=replace(price,'$','');
UPDATE calendar SET adjusted_price=replace(price,',','');



ALTER TABLE calendar ALTER COLUMN price TYPE numeric USING price::numeric;
ALTER TABLE calendar ALTER COLUMN adjusted_price TYPE numeric USING price::numeric;

