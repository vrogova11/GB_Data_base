-- Активность в социальной сети = Количество подтвержденных друзей * 0.3 + Количество поставленных лайков * 0.1 +
-- Количество сообществ * 0.2 + Количество медиафайлов * 0.15 + Количество постов * 0.25
SELECT u.first_name, u.last_name, COUNT(fs.id) * 0.3 + COUNT(DISTINCT l.id) * 0.1 + COUNT(DISTINCT cu.community_id) * 0.2 
+ COUNT(DISTINCT m.id) * 0.15 + COUNT(DISTINCT p.id) * 0.25 AS finaly_activity FROM users u 
LEFT JOIN friendship f 
ON (u.id = f.friend_id OR u.id = f.user_id)
LEFT JOIN friendship_statuses fs 
ON f.status_id = fs.id AND fs.name = 'Confirmed'
LEFT JOIN likes l 
ON u.id = l.user_id
LEFT JOIN communities_users cu 
ON u.id = cu.user_id 
LEFT JOIN media m 
ON u.id = m.user_id 
LEFT JOIN posts p 
ON u.id = p.user_id
GROUP BY u.id
ORDER BY finaly_activity LIMIT 10;



