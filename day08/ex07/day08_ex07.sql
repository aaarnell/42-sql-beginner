--Сессия №1
--Начнем транзакцию 
BEGIN;

--Сессия №2
--Начнем транзакцию 
BEGIN;

--Сессия №1
--Зададим новый возраст клиенту id = 1
UPDATE person SET age = 16 WHERE id = 1

--Сессия №2
--Зададим новый возраст клиенту id = 2
UPDATE person SET age = 26 WHERE id = 2

--Сессия №1
--Зададим новый возраст клиенту id = 2
UPDATE person SET age = 18 WHERE id = 2

--Сессия №2
--Зададим новый возраст клиенту id = 1
UPDATE person SET age = 20 WHERE id = 1

--Сессия №1
--Опубликуем изменения
COMMIT;

--Сессия №2
--Опубликуем изменения
COMMIT;