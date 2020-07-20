-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2020 a las 02:18:01
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

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `idUser`, `cartNumber`, `total`, `deletedAt`, `createdAt`, `updatedAt`) VALUES


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
  `idCart` int(10) UNSIGNED DEFAULT NULL,
  `idSeller` int(10) UNSIGNED NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `idProduct` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cartitem`
--

INSERT INTO `cartitem` (`id`, `idUser`, `price`, `quantity`, `status`, `subtotal`, `idCart`, `idSeller`, `deletedAt`, `createdAt`, `updatedAt`, `idProduct`, `name`) VALUES

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
(4, 'Cena', NULL, '2020-06-25 23:28:22', NULL);

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
-- Estructura de tabla para la tabla `productcart`
--

CREATE TABLE `productcart` (
  `id` int(10) UNSIGNED NOT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `idCartItem` int(10) UNSIGNED NOT NULL
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
(50, 'Ensalada', 'Lechugas frescas del himalaya con tomates en conserva ', '125', 'undefined-1594413377673.jpg', 4, 2, NULL, '2020-06-28 18:55:36', '2020-07-10 20:36:17'),
(51, 'Tarta de pollo', 'Tarta hojaldrada de pollo condimentado con chorizo colorado y azafrán', '250', 'undefined-1594345965798.png', 4, 4, NULL, '2020-06-28 21:36:00', '2020-07-10 01:54:00'),
(52, 'Hamburguesas caseras', 'Hamburguesa de rost beef de 150g con queso chedar, panceta, cebolla morada, salsa mil islas y pepinos frescos', '300', 'undefined-1594413419572.jpeg', 4, 2, NULL, '2020-06-28 21:37:40', '2020-07-10 21:53:33'),
(53, 'Torta de Chocolate', 'Torta de mouse de chocolate', '1000', 'undefined-1594413440107.jpg', 4, 3, NULL, '2020-06-28 21:39:07', '2020-07-10 20:37:20'),
(54, 'Chipa', 'Chipas correntinos con mucho queso', '500', 'undefined-1594413465270.jpg', 4, 1, NULL, '2020-06-28 21:41:12', '2020-07-11 03:32:53'),
(55, 'Vino tinto', 'Malbec, bodega mendoza 2010', '2500', 'img-1593384608307.png', 2, 2, '2020-07-10 02:07:01', '2020-06-28 22:50:08', '2020-07-10 02:07:01'),
(56, 'Pancakes', 'Pancakes de chocolate bien riki', '250', 'img-1593386806941.png', 10, 3, '2020-07-10 02:08:03', '2020-06-28 23:26:46', '2020-07-10 02:08:03'),
(57, 'Empanada Gallega', 'Rica tarta de pollo con azafran y chorizo coloreta', '1500', 'img-1593387989821.png', 11, 4, '2020-07-10 02:06:05', '2020-06-28 23:46:29', '2020-07-10 02:06:05'),
(58, 'a', '123456', '1200', 'img-1593724276276.png', 2, 2, '2020-07-10 02:07:04', '2020-06-28 23:52:43', '2020-07-10 02:07:04'),
(62, 'Tostados ', 'Tostado de Jamon y queso con pan artesano', '120', 'undefined-1594413483345.jpg', 4, 1, NULL, '2020-07-10 01:58:35', '2020-07-10 20:38:03'),
(63, 'Budín de banana', 'Budin de 300g', '250', 'undefined-1594348643605.jpg', 4, 3, NULL, '2020-07-10 02:37:23', '2020-07-10 02:37:23'),
(65, 'Leandro', 'rico', '100000', 'undefined-1595118316966.jpeg', 1, 2, NULL, '2020-07-19 00:25:17', '2020-07-19 00:25:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usercart`
--

CREATE TABLE `usercart` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idCartItem` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `name` varchar(255) NOT NULL,
  `img` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `rol`, `deletedAt`, `createdAt`, `updatedAt`, `name`, `img`) VALUES
(1, 'jere@gmail.com', '$2a$10$GUKtoj6a8YpuYAD6k5ba5uM3r6pTRIw0zAJs.BuV0FCZ7BF6DIts.', 0, NULL, '2020-06-24 00:59:06', '2020-06-24 00:59:06', 'Jeremias', ''),
(2, 'lmarelli17@gmail.com', '$2a$10$RqfKPq9GC4Untf37LFgPRuUg114WZL07njQjht0MQETzbkPrcySDK', 0, NULL, '2020-06-24 17:40:15', '2020-06-24 17:40:15', 'Leandro', ''),
(4, 'lma@gmail.com', '$2a$10$1JJ72i.ybyjuo6fgcW2eE.iorfeU8akDgXkIUxSylRA2CMFFdc2sm', 0, NULL, '2020-06-25 02:58:29', '2020-06-25 02:58:29', 'Leandro', ''),


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
  ADD KEY `idUser` (`idUser`),
  ADD KEY `cartitem_ibfk_1` (`idProduct`);

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
-- Indices de la tabla `productcart`
--
ALTER TABLE `productcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idCartItem` (`idCartItem`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`),
  ADD KEY `idUser` (`idSeller`);

--
-- Indices de la tabla `usercart`
--
ALTER TABLE `usercart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idCartItem` (`idCartItem`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5064;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  ADD CONSTRAINT `cartItem_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `productcart`
--
ALTER TABLE `productcart`
  ADD CONSTRAINT `productcart_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productcart_ibfk_2` FOREIGN KEY (`idCartItem`) REFERENCES `cartitem` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `usercart`
--
ALTER TABLE `usercart`
  ADD CONSTRAINT `usercart_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `usercart_ibfk_2` FOREIGN KEY (`idCartItem`) REFERENCES `cartitem` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
