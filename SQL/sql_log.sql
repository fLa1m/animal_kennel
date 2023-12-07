-- В подключенном MySQL репозитории создать базу данных “Друзья человека”

CREATE DATABASE human_friends;
USE human_friends;

-- Создать таблицы с иерархией из диаграммы в БД

CREATE TABLE animals
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(20)
);

INSERT INTO animals (animal_name)
VALUES
	('домашние'),
    ('вьючные');

CREATE TABLE pack_animals
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    genus_name VARCHAR(20),
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pack_animals (genus_name, animal_id)
VALUES
	('Лошадь', 2),
    ('Верблюд', 2),
    ('Осел', 2);

CREATE TABLE pets
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    genus_name VARCHAR(20),
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pets (genus_name, animal_id)
VALUES
	('Собака', 1),
    ('Кошка', 1),
    ('Хомяк', 1);

CREATE TABLE dogs 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    genus_id INT,
    FOREIGN KEY (genus_id) REFERENCES pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cats LIKE dogs;

CREATE TABLE hamsters LIKE dogs;

CREATE TABLE horses
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    genus_id INT,
    FOREIGN KEY (genus_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE camels LIKE horses;

CREATE TABLE donkeys LIKE horses;

-- Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

INSERT INTO dogs (name, birthday, commands, Genus_id)
VALUES 
	('Fido', '2020-01-01', 'Sit, Stay, Fetch', 1),
	('Buddy', '2018-12-10', 'Sit, Paw, Bark', 1),  
	('Bella', '2019-11-11', 'Sit, Stay, Roll', 1);

INSERT INTO cats (name, birthday, commands, Genus_id)
VALUES 
	('Whiskers', '2019-05-15', 'Sit, Pounce', 2),
	('Smudge', '2020-02-20', 'Sit, Pounce, Scratch', 2),  
	('Oliver', '2020-06-30', 'Meow, Scratch, Jump', 2);

INSERT INTO hamsters (name, birthday, commands, Genus_id)
VALUES 
	('Hammy', '2021-03-10', 'Roll, Hide', 3),
	('Peanut', '2021-08-01', 'Roll, Spin', 3);

INSERT INTO horses (name, birthday, commands, Genus_id)
VALUES 
	('Thunder', '2015-07-21', 'Trot, Canter, Gallop', 1),
	('Storm', '2014-05-05', 'Trot, Canter', 1),
    ('Blaze', '2016-02-29', 'Trot, Jump, Gallop', 1);

INSERT INTO camels (name, birthday, commands, Genus_id)
VALUES 
	('Sandy', '2016-11-03', 'Walk, Carry Load', 2),
	('Dune', '2018-12-12', 'Walk, Sit', 2),
    ('Sahara', '2015-08-14', 'Walk, Run', 2);

INSERT INTO donkeys (name, birthday, commands, Genus_id)
VALUES 
	('Eeyore', '2017-09-18', 'Walk, Carry Load, Bray', 3),
	('Burro', '2019-01-23', 'Walk, Bray, Kick', 3);

-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку, объединить таблицы лошади, и ослы в одну таблицу.

DELETE FROM camels;

INSERT INTO horses (name, birthday, commands, genus_id)
SELECT name, birthday, commands, genus_id FROM donkeys;

RENAME TABLE horses TO horses_and_donkeys;

-- Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице.

CREATE TABLE young_animal
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    genus_id INT,
    age TEXT
);

DELIMITER $$
CREATE FUNCTION age_animal(date_birthday DATE)
RETURNS TEXT
DETERMINISTIC
BEGIN
	DECLARE age TEXT DEFAULT '';
	SET age = CONCAT(
		TIMESTAMPDIFF(YEAR, date_birthday, CURDATE()), ' years ', 
		TIMESTAMPDIFF(MONTH, date_birthday, CURDATE())%12, ' month '
		);
	RETURN age;
END $$
DELIMITER ;

INSERT INTO young_animal (name, birthday, commands, genus_id, age)
	SELECT name, birthday, commands, genus_id, age_animal(birthday) 
	FROM cats
	WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 and 3
    UNION ALL
    SELECT name, birthday, commands, genus_id, age_animal(birthday) 
	FROM dogs
	WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 and 3
    UNION ALL
    SELECT name, birthday, commands, genus_id, age_animal(birthday) 
	FROM hamsters
	WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 and 3
    UNION ALL
    SELECT name, birthday, commands, genus_id, age_animal(birthday) 
	FROM horses_and_donkeys
	WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 and 3;

-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

CREATE TABLE all_animals 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    genus_id INT,
    age TEXT,
    old_tabel ENUM('cats', 'dogs', 'hamsters', 'horses_and_donkeys', 'young_animal') NOT NULL
);

INSERT INTO all_animals (name, birthday, commands, genus_id, age, old_tabel)
	SELECT name, birthday, commands, genus_id, age_animal(birthday), 'cats'
    FROM cats;
    
INSERT INTO all_animals (name, birthday, commands, genus_id, age, old_tabel)
	SELECT name, birthday, commands, genus_id, age_animal(birthday), 'dogs'
    FROM dogs;
    
INSERT INTO all_animals (name, birthday, commands, genus_id, age, old_tabel)
	SELECT name, birthday, commands, genus_id, age_animal(birthday), 'hamsters'
    FROM hamsters;
    
INSERT INTO all_animals (name, birthday, commands, genus_id, age, old_tabel)
	SELECT name, birthday, commands, genus_id, age_animal(birthday), 'horses_and_donkeys'
    FROM horses_and_donkeys;
    
INSERT INTO all_animals (name, birthday, commands, genus_id, age, old_tabel)
	SELECT name, birthday, commands, genus_id, age_animal(birthday), 'young_animal'
    FROM young_animal;

