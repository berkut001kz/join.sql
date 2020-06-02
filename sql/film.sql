-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 02 2020 г., 20:33
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `film`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `users_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cart_movies`
--

CREATE TABLE `cart_movies` (
  `cart_id` int(11) DEFAULT NULL,
  `movies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart_movies`
--

INSERT INTO `cart_movies` (`cart_id`, `movies_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`id`, `name`, `description`) VALUES
(1, 'cars_1', 'К?л?ктер 1 ?те ?ызы?ты мультфильм'),
(2, 'cars_2', 'К?л?ктер 2 ?те ?ызы?ты мультфильм'),
(3, 'cars_3', 'К?л?ктер 3 ?те ?ызы?ты мультфильм');

-- --------------------------------------------------------

--
-- Структура таблицы `movies_photo`
--

CREATE TABLE `movies_photo` (
  `id` int(11) NOT NULL,
  `url` text CHARACTER SET utf8 NOT NULL,
  `movies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movies_photo`
--

INSERT INTO `movies_photo` (`id`, `url`, `movies_id`) VALUES
(1, 'cars_1.png', 1),
(2, 'cars_1_1.png', 1),
(3, 'cars_3.png', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `movies_video`
--

CREATE TABLE `movies_video` (
  `id` int(11) NOT NULL,
  `url_360` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_480` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_720` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_1080` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `movies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movies_video`
--

INSERT INTO `movies_video` (`id`, `url_360`, `url_480`, `url_720`, `url_1080`, `movies_id`) VALUES
(1, 'cars_1_1_360.mp4', 'cars_1_1_480.mp4', 'cars_1_1_720.mp4', 'cars_1_1_1080.mp4', 1),
(2, 'cars_3_360.mp4', 'cars_3_480.mp4', 'cars_2_720.mp4', 'cars_3_1080.mp4', 3),
(3, 'cars_1_360.mp4', 'cars_1_480.mp4', 'cars_1_720.mp4', 'cars_1_1080.mp4', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `login`, `password`, `surname`, `name`) VALUES
(1, 'Izhan@gmail.com', 'izhan001', '123', 'Елдос?ызы', 'Айжан'),
(2, 'bekzat@gmail.com', 'bekzat', '456', 'Бекзатов', 'Бекзат');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies_photo`
--
ALTER TABLE `movies_photo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies_video`
--
ALTER TABLE `movies_video`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `movies_photo`
--
ALTER TABLE `movies_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `movies_video`
--
ALTER TABLE `movies_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
