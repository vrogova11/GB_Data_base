SELECT p.gender, COUNT(*) total  FROM likes l 
JOIN profiles p 
ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY total DESC 
LIMIT 1;


