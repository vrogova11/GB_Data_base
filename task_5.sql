-- ���������� � ���������� ���� = ���������� �������������� ������ * 0.3 + ���������� ������������ ������ * 0.1 +
-- ���������� ��������� * 0.2 + ���������� ����������� * 0.15 + ���������� ������ * 0.25
SELECT first_name, last_name, (SELECT COUNT(*) FROM friendship
				WHERE (friend_id = us.id or user_id = us.id)
				AND status_id = (SELECT id FROM friendship_statuses WHERE name = 'Confirmed')) * 0.3
				+
			(SELECT COUNT(*) FROM likes
				WHERE user_id = us.id) * 0.1
				+
			(SELECT COUNT(*) FROM communities_users
				WHERE user_id = us.id) * 0.2
				+
			(SELECT COUNT(*) FROM media
				WHERE user_id = us.id) * 0.15
				+
			(SELECT COUNT(*) FROM posts
				WHERE user_id = us.id) * 0.25 AS final_activity
FROM users us
ORDER BY final_activity LIMIT 10;
