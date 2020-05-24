-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 24 2020 г., 18:04
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `.NET_PROJECTDUB3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CartProducts`
--

CREATE TABLE `CartProducts` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `cartid` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `productid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CartProducts`
--

INSERT INTO `CartProducts` (`id`, `cart_id`, `cartid`, `product_id`, `productid`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 2),
(3, 2, 2, 1, 1),
(4, 2, 2, 2, 2),
(5, 2, 2, 2, 2),
(6, 2, 2, 1, 1),
(7, 2, 2, 1, 1),
(8, 2, 2, 1, 1),
(9, 2, 2, 1, 1),
(12, 3, 3, 1, 1),
(14, 3, 3, 2, 2),
(15, 5, 5, 1, 1),
(16, 6, 6, 2, 2),
(17, 6, 6, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Carts`
--

CREATE TABLE `Carts` (
  `id` bigint(20) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `grandTotal` double NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Carts`
--

INSERT INTO `Carts` (`id`, `userId`, `grandTotal`, `user_id`) VALUES
(1, 1, 0, 1),
(2, 2, 0, 2),
(3, 3, 24, 3),
(5, 4, 12, -1),
(6, 4, 24, -1);

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE `Categories` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id`, `name`) VALUES
(1, 'Lap top'),
(2, 'Watch');

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `cart_id` bigint(20) NOT NULL,
  `cartid` bigint(20) DEFAULT NULL,
  `completed` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Orders`
--

INSERT INTO `Orders` (`id`, `user_id`, `userId`, `cart_id`, `cartid`, `completed`) VALUES
(1, 4, 4, 5, 5, b'0'),
(2, 4, 4, 6, 6, b'0');

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `content` longtext NOT NULL,
  `fullContent` longtext,
  `price` double NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `categoryid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` (`id`, `name`, `content`, `fullContent`, `price`, `category_id`, `categoryid`) VALUES
(1, 'Notebook', 'Notebook', ' Notebook Notebook  Notebook Notebook Notebook Notebook Notebook Notebook', 12, 1, 1),
(2, 'Apple Watch', 'Apple Watch Apple Watch ', 'Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch Apple Watch ', 12, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Roles`
--

CREATE TABLE `Roles` (
  `Id` int(11) NOT NULL,
  `Name` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Roles`
--

INSERT INTO `Roles` (`Id`, `Name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `Id` int(11) NOT NULL,
  `Email` longtext,
  `Password` longtext,
  `RoleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`Id`, `Email`, `Password`, `RoleId`) VALUES
(1, 'gg', 'gg', 1),
(2, 'ss', 'ss', 2),
(3, 'ee', 'ee', 2),
(4, 'ww', 'ww', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20200524082742_cart3', '2.1.14-servicing-32113'),
('20200524140320_order', '2.1.14-servicing-32113');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CartProducts`
--
ALTER TABLE `CartProducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_CartProducts_cartid` (`cartid`),
  ADD KEY `IX_CartProducts_productid` (`productid`);

--
-- Индексы таблицы `Carts`
--
ALTER TABLE `Carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_Carts_userId` (`userId`);

--
-- Индексы таблицы `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_Orders_cartid` (`cartid`),
  ADD KEY `IX_Orders_userId` (`userId`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_Products_categoryid` (`categoryid`);

--
-- Индексы таблицы `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Users_RoleId` (`RoleId`);

--
-- Индексы таблицы `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `CartProducts`
--
ALTER TABLE `CartProducts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `Carts`
--
ALTER TABLE `Carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Roles`
--
ALTER TABLE `Roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CartProducts`
--
ALTER TABLE `CartProducts`
  ADD CONSTRAINT `FK_CartProducts_Carts_cartid` FOREIGN KEY (`cartid`) REFERENCES `Carts` (`id`),
  ADD CONSTRAINT `FK_CartProducts_Products_productid` FOREIGN KEY (`productid`) REFERENCES `Products` (`id`);

--
-- Ограничения внешнего ключа таблицы `Carts`
--
ALTER TABLE `Carts`
  ADD CONSTRAINT `FK_Carts_Users_userId` FOREIGN KEY (`userId`) REFERENCES `Users` (`Id`);

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FK_Orders_Carts_cartid` FOREIGN KEY (`cartid`) REFERENCES `Carts` (`id`),
  ADD CONSTRAINT `FK_Orders_Users_userId` FOREIGN KEY (`userId`) REFERENCES `Users` (`Id`);

--
-- Ограничения внешнего ключа таблицы `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `FK_Products_Categories_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `Categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `FK_Users_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
