DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS grouprooms;


CREATE TABLE groups
	(
	group_id SERIAL PRIMARY KEY,
	group_name VARCHAR(20)
	);

INSERT INTO groups VALUES (10, 'I.T.');
INSERT INTO groups VALUES (11, 'Sales');
INSERT INTO groups VALUES (12, 'Administration');
INSERT INTO groups VALUES (13, 'Operations');


CREATE TABLE users
	(
	users_id SERIAL PRIMARY KEY,
	users_name VARCHAR (20),
	group_id INT REFERENCES groups(group_id),
	key_card BOOLEAN
	);

INSERT INTO users VALUES (20, 'Modesto', 10, TRUE);
INSERT INTO users VALUES (21, 'Ayine', 10, TRUE);
INSERT INTO users VALUES (22, 'Christopher', 11, TRUE);
INSERT INTO users VALUES (23, 'Cheong Woo', 11, TRUE);
INSERT INTO users VALUES (24, 'Saulat', 12, FALSE);
INSERT INTO users VALUES (25, 'Heidy', NULL, FALSE);


CREATE TABLE rooms
	(
	room_id SERIAL PRIMARY KEY,
	room_name VARCHAR (20)
	);

INSERT INTO rooms VALUES (30, '101');
INSERT INTO rooms VALUES (31, '102');
INSERT INTO rooms VALUES (32, 'Auditorium A');
INSERT INTO rooms VALUES (33, 'Auditorium B');

# 3rd table for many to many relationship
CREATE TABLE grouprooms
	(
	id SERIAL PRIMARY KEY,
	group_id INT REFERENCES groups(group_id),
	room_id INT REFERENCES rooms(room_id)
	);
INSERT INTO grouprooms VALUES (40, 10, 30);
INSERT INTO grouprooms VALUES (41, 10, 31);
INSERT INTO grouprooms VALUES (42, 11, 31);
INSERT INTO grouprooms VALUES (43, 11, 32);

#test
SELECT * FROM groups;
SELECT * FROM users;
SELECT * FROM rooms;
SELECT * FROM grouprooms;

#All groups and the users in each group
SELECT *
FROM groups g
LEFT JOIN users u
on g.group_id=u.group_id;

#All rooms and the group assigned to each room
SELECT r.*,g.group_name
FROM rooms r
LEFT JOIN grouprooms gr
ON r.room_id=gr.room_id
LEFT JOIN groups g
ON gr.group_id=g.group_id;

#A list of users, the groups that they belong to, and the rooms to which they are assigned to
SELECT u.*,g.group_name,r.room_name
FROM users u
LEFT JOIN groups g
ON u.group_id=g.group_id
LEFT JOIN grouprooms gr
ON g.group_id=gr.group_id
LEFT JOIN rooms r
ON gr.room_id=r.room_id
ORDER BY u.users_name, g.group_name,r.room_name;


