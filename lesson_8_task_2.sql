-- Кол-во лайков, которые получили 10 самых молодых пользователей, как пользователи
SELECT COUNT(*) total FROM (SELECT * FROM profiles 
ORDER BY birthday DESC LIMIT 10) AS p
JOIN
likes AS l 
ON p.user_id = l.target_id 
WHERE l.target_type_id = 2;
	
-- Кол-во лайков, которые получили 10 самых молодых пользователей, как владельцы сущностей
SELECT users.user_id, users.birthday, COUNT(l.id) total FROM likes l
LEFT JOIN messages m 
ON l.target_id = m.id AND l.target_type_id = 1
LEFT JOIN profiles p 
ON l.target_id = p.user_id AND l.target_type_id = 2
LEFT JOIN media m2 
ON l.target_id = m2.id AND l.target_type_id = 3
LEFT JOIN posts p2 
ON l.target_id = p2.id AND l.target_type_id = 4
RIGHT JOIN 
(SELECT user_id, birthday FROM profiles 
ORDER BY birthday DESC LIMIT 10) AS users
ON users.user_id  = m.from_user_id OR users.user_id = p.user_id OR users.user_id = m2.user_id OR users.user_id = p2.user_id
GROUP BY user_id
ORDER BY birthday DESC;



  




		
	

		
