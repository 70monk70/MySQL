use sample;

-- task 1
-- На мой взгляд, корректировать нечего.

-- task 2
SELECT count(*) AS count_of_messages, to_user_id, from_user_id 
FROM messages
WHERE to_user_id = 34
GROUP BY from_user_id
ORDER BY count_of_messages DESC LIMIT 1;

-- task 3
-- Удалось выполнить только в таком формате, объединить запросы, чтобы это работало корректно, не удалось.
-- Буду рад, если направите на правильный путь))
SELECT COUNT(*) as number_of_likes, user_id
	from likes
	group by user_id
    order by number_of_likes desc limit 10;
   
SELECT user_id,
	TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
	from profiles
	order by age limit 10;

-- task 4
-- Не смог корректно объединить запросы в один. В итоге по первому он считает количество мужчин 
-- и женщин, по второму - количество лайков каждым пользователем.
-- Общего в этих таблицах - только user_id, но как на основании этого посчитать сначала количество лайков
-- каждого пользователя, которые находятся в таблице likes, а потом объединить с данными таблицы profiles
-- и посчитать количество лайков мужчинами и женщинами - я не понял. Буду рад, если направите на правильный ход мыслей. 
SELECT
	COUNT(user_id) as total_profiles, 
    CASE (gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender
  FROM profiles
 group by gender;


SELECT COUNT(*) as number_of_likes, user_id
	from likes
	group by user_id
    order by number_of_likes desc;

-- task 5
-- Если за активность в использовании соцсетей брать количество лайков, то получается запрос, приведенный
-- ниже. Но таких пользователей с одним лайком в БД больше 10, поэтому каждый раз данные будут меняться.
SELECT COUNT(*) as number_of_likes, user_id
	from likes
	group by user_id
    order by number_of_likes limit 10;
   
   