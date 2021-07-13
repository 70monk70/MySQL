-- Задания по теме "Операторы, фильтрация, сортировка и ограничение"
-- task 1
UPDATE users SET created_at = NOW();
UPDATE users SET updated_at = NOW();
-- task 2
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
UPDATE users SET created_at  = '20.10.2017 8:10' where created_at = '2021-06-25 11:38:17';
-- если преобразовывать из VARCHAR в DATETIME с неверными значениями типа
-- "20.10.2017 8:10", то операция выдает ошибку, т.к. тип данных для DATETIME
-- не подходит. Как здесь можно решить вопрос?

-- task 3
USE shop;
SELECT * from storehouses_products ORDER BY CASE WHEN value = 0 THEN 2147483647 ELSE value END

-- task 4, т.к. в моей БД дата рождения хранится в таблице profiles
SELECT * from profiles WHERE DATE_FORMAT(birthday, '%m') = 05
OR  DATE_FORMAT(birthday, '%m') = 08;

-- task 5
SELECT * FROM catalogs
WHERE id IN (3, 1, 2)
ORDER BY CASE 
WHEN id = 3 THEN 0
WHEN id = 1 THEN 1
WHEN id = 2 THEN 2
END;

-- Задания по теме "Агрегация данных"
-- task 1
USE sample;
SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25), 0)
AS avg_age from profiles;

-- task 2
SELECT
DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday, 6, 10))) AS day_of_the_week,
COUNT(DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday, 6, 10)))) AS amount_of_birthday 
FROM profiles GROUP BY day_of_the_week;

-- task 3
DROP TABLE integers;
CREATE TABLE IF NOT EXISTS integers(
	value BIGINT);
INSERT INTO integers VALUES (1),
(2),
(3),
(4),
(5);
SELECT ROUND(exp(sum(ln(value)))) AS composition FROM integers;