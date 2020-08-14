SELECT 
	(SELECT gender FROM profiles WHERE user_id = lk.user_id) gender,
	COUNT(*) total
FROM likes lk
GROUP BY gender;



