-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Фев 26 2019 г., 21:50
-- Версия сервера: 5.6.41
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `burgers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` text,
  `comment` text,
  `cardpay` text,
  `callback` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `comment`, `cardpay`, `callback`) VALUES
(1, 1, 'Москва', 'Быстрее', 'Оплата картой', 'Не перезванивать'),
(2, 2, 'Питер', 'Горячее', 'Оплата наличными', 'перезвонить'),
(3, 3, 'ул. Autem beatae neque p, д. Deserunt tempor volu, корп. Architecto eiusmod q, кв. Similique odit et ac, эт. Anim architecto offi', 'Ut blanditiis quia i', 'Картой', 'Не перезванивать'),
(4, 4, 'ул. Reiciendis ea et in , д. Cum repellendus Ips, корп. Vero minima culpa vi, кв. Atque voluptatem do, эт. Debitis est in est i', 'Ea velit iusto conse', 'Наличными', 'Перезвонить'),
(5, 5, 'ул. Dicta nostrud in sed, д. Pariatur Perferendi, корп. Nulla proident maio, кв. Et exercitationem mo, эт. Sunt voluptatibus et', 'Ipsum odio pariatur', 'Картой', 'Не перезванивать'),
(6, 6, 'ул. Elit corrupti dese, д. Asperiores anim ex s, корп. Minima labore consec, кв. Impedit ipsam ipsum, эт. Esse labore corrupti', 'Et rem impedit magn', 'Картой', 'Перезвонить'),
(7, 7, 'ул. Уральская, д. 12, корп. 2, кв. 12, эт. 4', 'Быстрее быстрее быстрее', 'Наличными', 'Не перезванивать'),
(8, 8, 'ул. Красная, д. 65', 'Быстрее быстрее быстрее', 'Картой', 'Перезвонить');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text,
  `email` text,
  `phone` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Петя', 'Petja@mail.ru', '89564731298'),
(2, 'Вася', 'Vasja@mail.ru', '89453214567'),
(3, 'Zelenia Vega', 'nydofiti@mailinator.com', '+7 (130) 158 97 04'),
(4, 'Danielle Porter', 'qoxojywij@mailinator.net', '+7 (173) 883 74 94'),
(5, 'Charlotte Vang', 'harike@mailinator.com', '+7 (165) 952 99 85'),
(6, 'Quinn Middleton', 'nyzotala@mailinator.net', '+7 (143) 441 74 44'),
(7, 'Саша', 'sanja@mail.ru', '+7 (965) 784 37 28'),
(8, 'Денис', 'den@bk.ru', '+7 (964) 721 34 98');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_uindex` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
