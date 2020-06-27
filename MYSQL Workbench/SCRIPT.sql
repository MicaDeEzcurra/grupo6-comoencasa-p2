-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2020 a las 01:39:43
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comoencasa`
--
CREATE DATABASE IF NOT EXISTS `comoencasa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `comoencasa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `cartNumber` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartitem`
--

CREATE TABLE `cartitem` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `idCart` int(10) UNSIGNED NOT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `deletedAt`, `createdAt`, `updatedAt`) VALUES
(1, 'Desayuno', NULL, '2020-06-25 23:25:04', NULL),
(2, 'Almuerzo', NULL, '2020-06-25 23:28:07', NULL),
(3, 'Merienda', NULL, '2020-06-25 23:28:22', NULL),
(4, 'Cena', NULL, '2020-06-25 23:28:22', NULL),
(5, 'snack', NULL, '2020-06-26 19:03:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `img` varchar(255) NOT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `idCategory` int(10) UNSIGNED NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `img`, `idSeller`, `idCategory`, `deletedAt`, `createdAt`, `updatedAt`) VALUES
(1, 'Floyd', '5 Kings Lane', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 4, NULL, '2020-06-26 16:25:34', NULL),
(2, 'Rozele', '6 American Lane', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 4, NULL, '2020-06-26 16:25:34', NULL),
(3, 'Herbert', '5 Morning Center', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 1, NULL, '2020-06-26 16:25:34', NULL),
(4, 'Tina', '2 Eastlawn Way', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 3, NULL, '2020-06-26 16:25:34', NULL),
(5, 'Marchelle', '9 Ludington Lane', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 3, NULL, '2020-06-26 16:25:34', NULL),
(6, 'Demetris', '52 Mifflin Avenue', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 2, NULL, '2020-06-26 16:25:34', NULL),
(7, 'Thorndike', '06 Mayfield Hill', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 3, NULL, '2020-06-26 16:25:34', NULL),
(8, 'Elyssa', '3230 Armistice Avenue', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 4, NULL, '2020-06-26 16:25:34', NULL),
(9, 'Rica', '4590 Killdeer Center', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 2, NULL, '2020-06-26 16:25:34', NULL),
(10, 'Salome', '248 Carpenter Court', '0', 'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png', 1, 2, NULL, '2020-06-26 16:25:34', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` tinyint(4) DEFAULT 0,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `rol`, `deletedAt`, `createdAt`, `updatedAt`, `name`) VALUES
(1, 'jere@gmail.com', '$2a$10$GUKtoj6a8YpuYAD6k5ba5uM3r6pTRIw0zAJs.BuV0FCZ7BF6DIts.', 0, NULL, '2020-06-24 00:59:06', '2020-06-24 00:59:06', 'Jeremias'),
(2, 'lmarelli17@gmail.com', '$2a$10$RqfKPq9GC4Untf37LFgPRuUg114WZL07njQjht0MQETzbkPrcySDK', 0, NULL, '2020-06-24 17:40:15', '2020-06-24 17:40:15', 'Leandro'),
(3, 'mili@gmail.com', '$2a$10$os5qw02Z09yzaHE4EW.MPu7vYokoLw5dDchnGS77e6ZatH4HIwQ9C', 0, NULL, '2020-06-24 19:59:22', '2020-06-24 19:59:22', 'Milagros'),
(4, 'lma@gmail.com', '$2a$10$1JJ72i.ybyjuo6fgcW2eE.iorfeU8akDgXkIUxSylRA2CMFFdc2sm', 0, NULL, '2020-06-25 02:58:29', '2020-06-25 02:58:29', 'Leandro'),
(5, 'lmaasdf@gmail.com', '$2a$10$aRKOfJRH/4DvvowExc/R3uJ16yhr2KvDgo9Fvy6HmWo8AObhNidGu', 0, NULL, '2020-06-25 04:22:27', '2020-06-25 04:22:27', 'Leandro'),
(6, 'juli@gmail.com', '$2a$10$3wlHV3Rvw7jPDhHAm4i70Olvhl4dxa9lRhBzj7tCueZoFQsMb49cC', 0, NULL, '2020-06-26 02:20:31', '2020-06-26 02:20:31', 'Julian'),
(8, 'micho@gmail.com', '$2a$10$CR2Za.WHD7KbYYWwTWZmHuuBlhE.N906CAVKFxK//VZKGWYkCaAo2', 0, NULL, '2020-06-26 22:55:56', '2020-06-26 22:55:56', 'Leandro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSeller` (`idSeller`),
  ADD KEY `idCart` (`idCart`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idSeller` (`idSeller`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`),
  ADD KEY `idUser` (`idSeller`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cartItem_ibfk_3` FOREIGN KEY (`idCart`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cartItem_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
