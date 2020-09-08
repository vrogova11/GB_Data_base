DESC friendship;
ALTER TABLE friendship DROP COLUMN created_at;

DESC messages;
ALTER TABLE messages ADD COLUMN is_modified BOOLEAN AFTER is_delivered;

DESC communities_users;

DESC profiles;
ALTER TABLE profiles DROP COLUMN created_at;

DESC media_types;

DESC friendship;

SELECT * FROM users LIMIT 10;

UPDATE users SET updated_at = CURRENT_TIMESTAMP() WHERE created_at > updated_at;

SHOW TABLES;

SELECT * FROM profiles LIMIT 10;

SELECT * from messages; 
UPDATE messages SET is_modified = FLOOR(0.5 + RAND());

SELECT * FROM media_types FOR UPDATE;

UPDATE media_types SET updated_at = CURRENT_TIMESTAMP() WHERE created_at > updated_at;

SELECT * FROM media;

UPDATE media SET media_type_id =  FLOOR(1 + RAND() * 5);

CREATE TEMPORARY TABLE extantions (name VARCHAR(10));
INSERT INTO extantions VALUES
('jpeg'),
('mp3'),
('mp4'),
('avi'),
('doc'),
('png');

UPDATE media SET filename = CONCAT('https://dropbox/vk/', filename, '.', (SELECT name FROM extantions ORDER BY RAND() LIMIT 1));

UPDATE media SET metadata = CONCAT('{"owner":"', (SELECT CONCAT(last_name, ' ', first_name) FROM users WHERE id = user_id), '"}');

DESC media;

ALTER TABLE media MODIFY COLUMN metadata JSON;

SELECT * FROM friendship;

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name) VALUES
('Requested'),
('Confirmed'),
('Rejected');

UPDATE friendship SET status_id =  FLOOR(1 + RAND() * 3);

SELECT * FROM communities;

DELETE FROM communities WHERE ID > 20;

SELECT * FROM communities_users;

DESC communities_users;

UPDATE communities_users SET community_id =  FLOOR(1 + RAND() * 20) WHERE community_id > 20;
