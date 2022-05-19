CREATE FUNCTION update_host_listings_count() RETURNS trigger AS
$update_host_listings_count$

BEGIN
IF (TG_OP='INSERT') THEN
 UPDATE Host 
 SET total_listings_count=total_listings_count+1
 WHERE (new.host_id=Host.id);
 RETURN new;
 
ELSIF (TG_OP='DELETE') THEN
UPDATE listing 
 SET host_listings_count=host_listings_count-1
 WHERE (old.host_id=Host.id);
RETURN old;
END IF;
 END;
 $update_host_listings_count$ LANGUAGE plpgsql;

CREATE TRIGGER update_host_listings_count
AFTER INSERT OR DELETE
ON Listing
FOR EACH ROW 
execute procedure update_host_listings_count();



/*----------------------------*/
CREATE FUNCTION update_last_review() RETURNS trigger AS
$update_last_review$
BEGIN
IF (TG_OP='INSERT') THEN
 UPDATE listing 
 SET last_review=new.date
 FROM review
 WHERE (listing.id=new.listing_id);
 RETURN new;
END IF;
END;
$update_last_review$ LANGUAGE plpgsql;

CREATE TRIGGER update_last_review
AFTER INSERT 
ON review
FOR EACH ROW 
execute procedure update_last_review();
/* This trigger updates the date of column last_review in table listings with 
the new date When a new review is added at the table 'review' */
