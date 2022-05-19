CREATE TABLE Amenity AS
(SELECT distinct unnest(amenities::text[]) as amenity_name from room );

ALTER  TABLE Amenity
ADD COLUMN id SERIAL PRIMARY KEY;

CREATE TABLE RoomAmenityConnection AS
(SELECT  amenity.id as amenity_id from amenity,
   (SELECT room.id as room_id, unnest(amenities::text[]) as amenity_name from room ) AS temp
  where temp.amenity_name = amenity.amenity_name);



 ALTER TABLE RoomAmenityConnection
 add foreign key(amenity_id) REFERENCES Amenity(id);
 add foreign key(room_id) REFERENCES Room(id);

 ALTER TABLE Room
DROP COLUMN amenities;
