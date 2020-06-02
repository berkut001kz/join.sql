/* Практика жасап көреміз
** Тапсырма 
** Деректер қорын жасау | орындалды
** Кесте құру | орындалды
** Кестелерді бір-біріне байлау | орындалды
** Кестелерге ақпарат еңгізу | орындалды
** Екі кестені біріктіріп ақпарат шығару | орындалды
** Себетке кино түсіру
*/ 

-- ** Деректер қорын жасау орындалды
CREATE DATABASE film;


-- ** Кесте құру орындалды
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255),
	login VARCHAR(20),
	password VARCHAR(100),
	surname VARCHAR(20),
	name VARCHAR(15));

CREATE TABLE movies(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(15),
	description VARCHAR(255)
	);

-- ** Кестелерді бір-біріне байлау орындалды
CREATE TABLE movies_photo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	url TEXT,
	movies_id INT REFERENCES movies(id)
	);

CREATE TABLE movies_video(
	id INT PRIMARY KEY AUTO_INCREMENT,
	url_360 TEXT,
	url_480 TEXT,
	url_720 TEXT,
	url_1080 TEXT,
	movies_id INT REFERENCES movies(id)
	);

CREATE TABLE cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
	users_id INT REFERENCES users(id)
	);

CREATE TABLE cart_movies(
	cart_id INT REFERENCES cart(id),
	movies_id INT REFERENCES movies(id)
);


-- ** Кестелерге ақпарат еңгізу

DESC users;

INSERT INTO users(email,login,password,surname,name)
VALUES('bekzat@gmail.com','bekzat','456','Бекзатов','Бекзат');

SELECT * FROM users;

DESC movies;

INSERT INTO movies(name,description) VALUES('cars_1','Көліктер 1 өте қызықты мультфильм');
INSERT INTO movies(name,description) VALUES('cars_2','Көліктер 2 өте қызықты мультфильм');
INSERT INTO movies(name,description) VALUES('cars_3','Көліктер 3 өте қызықты мультфильм');

SELECT * FROM movies;

DESC movies_photo;

INSERT INTO movies_photo(url,movies_id) VALUES('cars_1.png', 1);
INSERT INTO movies_photo(url,movies_id) VALUES('cars_1_1.png', 1);
INSERT INTO movies_photo(url,movies_id) VALUES('cars_3.png', 3);

SELECT * FROM movies_photo;

DESC movies_video;

INSERT INTO movies_video(url_360,url_480,url_720,url_1080,movies_id) VALUES('cars_1_360.mp4','cars_1_480.mp4','cars_1_720.mp4','cars_1_1080.mp4', 1);
INSERT INTO movies_video(url_360,url_480,url_720,url_1080,movies_id) VALUES('cars_1_1_360.mp4','cars_1_1_480.mp4','cars_1_1_720.mp4','cars_1_1_1080.mp4', 1);
INSERT INTO movies_video(url_360,url_480,url_720,url_1080,movies_id) VALUES('cars_3_360.mp4','cars_3_480.mp4','cars_2_720.mp4','cars_3_1080.mp4', 3);

SELECT * FROM movies_video;

-- ************ join *******************

-- ** Екі кестені біріктіріп ақпарат шығару

SELECT * FROM movies_photo mp;
SELECT mp.* FROM movies_photo mp;
SELECT mp.*, m.name FROM movies_photo mp left join movies m on m.id=mp.movies_id; 
/* Ура 
	+----+--------------+-----------+--------+
	| id | url          | movies_id | name   |
	+----+--------------+-----------+--------+
	|  1 | cars_1.png   |         1 | cars_1 |
	|  2 | cars_1_1.png |         1 | cars_1 |
	|  3 | cars_3.png   |         3 | cars_3 |
	+----+--------------+-----------+--------+
*/

-- ** 3 кестені біріктіріп ақпарат шығару

SELECT m.*, mp.url,mv.url_1080 FROM movies m left join  movies_photo mp on mp.movies_id=m.id left join movies_video mv on mv.movies_id=m.id; 

/*	Ура	+----+--------+-----------------------------------+--------------+-------------------+
			| id | name   | description                       | url          | url_1080          |
			+----+--------+-----------------------------------+--------------+-------------------+
			|  1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1.png   | cars_1_1_1080.mp4 |
			|  1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1_1.png | cars_1_1_1080.mp4 |
			|  3 | cars_3 | К?л?ктер 3 ?те ?ызы?ты мультфильм | cars_3.png   | cars_3_1080.mp4   |
			|  1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1.png   | cars_1_1080.mp4   |
			|  1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1_1.png | cars_1_1080.mp4   |
			|  2 | cars_2 | К?л?ктер 2 ?те ?ызы?ты мультфильм | NULL         | NULL              |
			+----+--------+-----------------------------------+--------------+-------------------+
*/

SELECT m.*, mp.url,mv.url_1080 FROM movies m right join  movies_photo mp on mp.movies_id=m.id right join movies_video mv on mv.movies_id=m.id; 


/*			+------+--------+-----------------------------------+--------------+-------------------+
			| id   | name   | description                       | url          | url_1080          |
			+------+--------+-----------------------------------+--------------+-------------------+
			|    1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1.png   | cars_1_1_1080.mp4 |
			|    1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1_1.png | cars_1_1_1080.mp4 |
			|    3 | cars_3 | К?л?ктер 3 ?те ?ызы?ты мультфильм | cars_3.png   | cars_3_1080.mp4   |
			|    1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1.png   | cars_1_1080.mp4   |
			|    1 | cars_1 | К?л?ктер 1 ?те ?ызы?ты мультфильм | cars_1_1.png | cars_1_1080.mp4   |
			+------+--------+-----------------------------------+--------------+-------------------+
*/


-- Енді Айжанның себетіне тауар түсірейік

DESC cart;

INSERT INTO cart(users_id) VALUES(1);
INSERT INTO cart(users_id) VALUES(2);

DESC cart_movies;
INSERT INTO cart_movies(cart_id, movies_id)VALUES(2,2),(2,1);


SELECT * FROM cart_movies;

SELECT u.name FROM users u;

SELECT u.name FROM users u left join cart on cart.users_id=u.id;


SELECT u.name, cart.id FROM users u left join cart on cart.users_id=u.id;

SELECT u.name, cart.id as cart_id FROM users u left join cart on cart.users_id=u.id;

SELECT u.name, cart.id as cart_id FROM users u left join cart on cart.users_id=u.id left join cart_movies cm on cm.cart_id=cart.id;

SELECT u.name, cart.id as cart_id, cm.movies_id FROM users u left join cart on cart.users_id=u.id left join cart_movies cm on cm.cart_id=cart.id;


-- Этот команд

SELECT u.name as user_name, m.name as movies_name, mp.url, mv.url_1080 as url_HD FROM users u left join cart on cart.users_id=u.id left join cart_movies cm on cm.cart_id=cart.id left join movies m on m.id=cm.movies_id left join movies_video mv on mv.movies_id=m.id left join movies_photo mp on mp.movies_id=m.id;