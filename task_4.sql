-- Кол-во лайков, которые получили 10 самых молодых пользователей, как пользователи
SELECT count(*) FROM likes
WHERE target_type_id = 2 
AND target_id IN 
(SELECT user_id FROM (SELECT user_id, DATEDIFF(NOW(), birthday) age 
		FROM profiles
		ORDER BY age LIMIT 10) AGE);
	
-- Кол-во лайков, которые получили 10 самых молодых пользователей, как владельцы сущностей
SELECT count(*) FROM likes
-- messages
WHERE (target_type_id = 1 
AND target_id IN 
(SELECT id 	FROM messages 
	WHERE from_user_id IN 
(SELECT user_id FROM (SELECT user_id, DATEDIFF(NOW(), birthday) age 
		FROM profiles
		ORDER BY age LIMIT 10) AGE)))
	OR 
-- users
(target_type_id = 2 
AND target_id IN 
(SELECT user_id FROM (SELECT user_id, DATEDIFF(NOW(), birthday) age 
		FROM profiles
		ORDER BY age LIMIT 10) AGE))
	OR 
-- media
(target_type_id = 3 
AND target_id IN 
(SELECT id 	FROM media 
	WHERE user_id IN 
(SELECT user_id FROM (SELECT user_id, DATEDIFF(NOW(), birthday) age 
		FROM profiles
		ORDER BY age LIMIT 10) AGE)))
	OR 
-- posts
(target_type_id = 4 
AND target_id IN 
(SELECT id FROM posts 
	WHERE user_id IN 
(SELECT user_id FROM (SELECT user_id, DATEDIFF(NOW(), birthday) age 
		FROM profiles
		ORDER BY age LIMIT 10) AGE)));



		
	

		
