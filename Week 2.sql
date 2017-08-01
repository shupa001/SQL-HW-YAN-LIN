#RESET
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviewers;

#CREATE TABLE VIDEOS
CREATE TABLE videos (
	video_id integer PRIMARY KEY NOT NULL,
	title varchar(100) NOT NULL,
	url	varchar(150) NOT NULL,
	length numeric
  );
  
#INSERT THE RECORDS TO TABLE VIDEOS
INSERT INTO videos (video_id, title, url, length)
values (1,'Databases - Episode 6 - Joining Tables', 'https://www.youtube.com/watch?v=79EBoVPUzkE',339);

INSERT INTO videos (video_id, title, url, length)
values (2,'Databases - Episode 7 - Missing Data', 'https://www.youtube.com/watch?v=KLugfNdGNFw',303);

INSERT INTO videos (video_id, title, url, length)
values (3,'Databases - Episode 8 - Nested Queries', 'https://www.youtube.com/watch?v=oy0CojdyKTo',410);

#POPULATE TABLE VIDEOS
Select *
from videos;

#CREATE TABLE REVIEWERS
CREATE TABLE reviewers
(
  reviewer_id int PRIMARY KEY,
  username varchar(30) NOT NULL,
  rating int NOT NULL,
  textreview varchar(60) NOT NULL,
  video_id int NULL REFERENCES videos
 );
 
#INSERT RECORDS TO TABLE REVIEWERS
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (1, 'Ana', 3, 'It is funny!', 1); 
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (2, 'Bob', 5, 'Great! Thanks!', 1); 
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (3, 'David', 1, 'It seems fine.', 2); 
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (4, 'Eric', 2, 'Could have done better.', 2); 
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (5, 'Frank', 3, 'It was good and then became boring.', 3); 
INSERT INTO reviewers (reviewer_id, username, rating, textreview, video_id) 
	VALUES (6, 'Caree', 3, 'Not bad.', 3); 

#POPULATE TABLE REVIEWERS
SELECT * FROM reviewers;

#SHOW INFORMATION FROM BOTH TABLES
SELECT v.title, v.length, r.username, r.rating, r.textreview FROM videos v
   INNER JOIN reviewers r ON v.video_id = r.video_id
ORDER BY v.title;
