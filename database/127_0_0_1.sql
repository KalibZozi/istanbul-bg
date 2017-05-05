-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2017. Máj 05. 15:34
-- Kiszolgáló verziója: 5.7.9
-- PHP verzió: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `istanbul_obg`
--
CREATE DATABASE IF NOT EXISTS `istanbul_obg` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `istanbul_obg`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cake_d_c_users_phinxlog`
--

DROP TABLE IF EXISTS `cake_d_c_users_phinxlog`;
CREATE TABLE IF NOT EXISTS `cake_d_c_users_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `cake_d_c_users_phinxlog`
--

INSERT INTO `cake_d_c_users_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20150513201111, 'Initial', '2017-05-05 09:39:50', '2017-05-05 09:39:50', 0),
(20161031101316, 'AddSecretToUsers', '2017-05-05 09:39:50', '2017-05-05 09:39:50', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE IF NOT EXISTS `social_accounts` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text,
  `link` varchar(255) NOT NULL,
  `token` varchar(500) NOT NULL,
  `token_secret` varchar(500) DEFAULT NULL,
  `token_expires` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `data` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_expires` datetime DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `activation_date` datetime DEFAULT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `secret_verified` tinyint(1) DEFAULT NULL,
  `tos_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) DEFAULT 'user',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `token`, `token_expires`, `api_token`, `activation_date`, `secret`, `secret_verified`, `tos_date`, `active`, `is_superuser`, `role`, `created`, `modified`) VALUES
('483c22b7-698d-469a-bb0d-512467769da4', 'Zoli', 'beenable@freemail.hu', '$2y$10$gxd4FvI6PSdY2DeyAHclI./rNBI2ysNydmoWAMKSZ.URz14x5Ue7G', 'Zoli', 'B', '3583d8d21c8e449d9aecee8dd00c9435', '2017-05-05 14:55:57', NULL, '2017-05-05 14:00:00', NULL, NULL, '2017-05-05 13:55:57', 1, 0, 'user', '2017-05-05 13:55:57', '2017-05-05 13:55:57');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
