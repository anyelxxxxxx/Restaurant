-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2024 a las 22:02:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(5) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `tipo_productoid_tipo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `tipo_productoid_tipo`) VALUES
(1, 'Bebida no alcohol', 1),
(2, 'Cervezas ', 1),
(3, 'Ensaladas', 2),
(4, 'Entradas', 2),
(5, 'Pastas', 2),
(6, 'Pizzas ', 2),
(7, 'Platos fuertes', 2),
(8, 'Postres ', 2),
(9, 'Tacos', 2),
(10, 'Vinos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(5) NOT NULL,
  `tipo_cliente` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_cliente`) VALUES
(1, 'cliente nuevo'),
(2, 'cliente repetido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_orden` int(5) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora_cobro` time(5) DEFAULT NULL,
  `mesa` int(5) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `meseroid_mesero` int(5) NOT NULL,
  `clienteid_cliente` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura _producto`
--

CREATE TABLE `factura _producto` (
  `orden id_orden` int(5) NOT NULL,
  `productoid_producto` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesero`
--

CREATE TABLE `mesero` (
  `id_mesero` int(5) NOT NULL,
  `nombre_mesero` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesero`
--

INSERT INTO `mesero` (`id_mesero`, `nombre_mesero`) VALUES
(1, 'Alejandro'),
(2, 'Joel'),
(3, 'Omar'),
(4, 'Ernesto'),
(5, 'Valentina'),
(6, 'Mariana'),
(7, 'Rodolfo'),
(8, 'Saul'),
(9, 'Mauricio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(5) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `categoriaid_categoria` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `costo`, `categoriaid_categoria`) VALUES
(1, 'Arrachera del Chef', 95.85, 7),
(2, 'Atún Encostrado', 145.96, 7),
(3, 'Brochetas Hawaiianas', 56.98, 4),
(4, 'Café americano', 12.6, 1),
(5, 'Camarones al Coco', 68.88, 3),
(6, 'Camarones Momia', 58.59, 4),
(7, 'Capuccino', 21.6, 1),
(8, 'Cítricos', 56.58, 3),
(9, 'Corona', 24.9, 2),
(10, 'Del Cheff', 112.05, 6),
(11, 'Del Huerto', 54.6, 3),
(12, 'Ensalada Prímula', 68, 3),
(13, 'Esfera del Cheff', 39, 8),
(14, 'Espárragos Envueltos', 63.18, 4),
(15, 'Espresso', 14.6, 1),
(16, 'Frutos del Bosque', 69.72, 3),
(17, 'Indio', 21.25, 2),
(18, 'Italiana', 88.56, 6),
(19, 'Lasagna Ratatouille', 54.75, 5),
(20, 'Limonada', 20, 1),
(21, 'Margarita', 73.5, 6),
(22, 'Margret de Pato', 150.48, 7),
(23, 'Mejillones Horneados', 56.25, 4),
(24, 'Mexicana', 95.45, 6),
(25, 'Minerva', 32.4, 2),
(26, 'Modelo', 23.7, 2),
(27, 'Naranjada', 18.25, 1),
(28, 'Pacifico', 21.9, 2),
(29, 'Pan de Elote', 29.6, 8),
(30, 'Panela a la Leña', 42.4, 4),
(31, 'Pannacotta Vainilla y Café', 32.4, 8),
(32, 'Pasta 4 Quesos', 53.13, 5),
(33, 'Pasta Alfredo', 55.61, 5),
(34, 'Pasta de Tomate Deshidratado', 54.6, 5),
(35, 'Pay de Temporada', 33.6, 8),
(36, 'Pera Rostizada', 75.65, 8),
(37, 'Pesto & Camarón', 105, 6),
(38, 'Pizza Prímula', 81.9, 6),
(39, 'Pollo al Pastor', 94.3, 6),
(40, 'Pollo Silvestre', 90, 7),
(41, 'Portobello Confitado', 53.76, 4),
(42, 'Prímula Espresso', 17.75, 1),
(43, 'Quesadillas Gobernador', 60.06, 9),
(44, 'Refresco', 16, 1),
(45, 'Rollos Prímula', 52.56, 4),
(46, 'Salmón', 63, 3),
(47, 'Salmón Ahumado', 105.3, 6),
(48, 'Salmón al Pesto', 121.8, 7),
(49, 'Strudel de Manzana', 31.5, 8),
(50, 'Tacos Arrachera', 66.36, 9),
(51, 'Tacos Capeados', 60.75, 9),
(52, 'Tártara de atún/salmón Frescto', 63.2, 4),
(53, 'Te helado', 18.5, 1),
(54, 'Tecate', 18, 2),
(55, 'Tiramisú', 31.5, 8),
(56, 'Tisana', 18, 1),
(57, 'Tropical', 91.25, 6),
(58, 'Vacío', 132.84, 7),
(59, 'Victoria', 21.3, 2),
(60, 'Vino 1', 422.64, 10),
(61, 'Vino 10', 431.88, 10),
(62, 'Vino 2', 397.85, 10),
(63, 'Vino 3', 415.4, 10),
(64, 'Vino 4', 270.6, 10),
(65, 'Vino 5', 553.34, 10),
(66, 'Vino 6', 536.25, 10),
(67, 'Vino 7', 501.16, 10),
(68, 'Vino 8', 256.61, 10),
(69, 'Vino 9 ', 478.78, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo` int(5) NOT NULL,
  `tipo_producto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo`, `tipo_producto`) VALUES
(1, 'Bebida'),
(2, 'Comida');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `FKcategoria608271` (`tipo_productoid_tipo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `FKfactura30396` (`meseroid_mesero`),
  ADD KEY `FKfactura837003` (`clienteid_cliente`);

--
-- Indices de la tabla `factura _producto`
--
ALTER TABLE `factura _producto`
  ADD PRIMARY KEY (`orden id_orden`,`productoid_producto`),
  ADD KEY `FKfactura _p629824` (`productoid_producto`);

--
-- Indices de la tabla `mesero`
--
ALTER TABLE `mesero`
  ADD PRIMARY KEY (`id_mesero`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FKproducto675605` (`categoriaid_categoria`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_orden` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesero`
--
ALTER TABLE `mesero`
  MODIFY `id_mesero` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FKcategoria608271` FOREIGN KEY (`tipo_productoid_tipo`) REFERENCES `tipo_producto` (`id_tipo`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FKfactura30396` FOREIGN KEY (`meseroid_mesero`) REFERENCES `mesero` (`id_mesero`),
  ADD CONSTRAINT `FKfactura837003` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `factura _producto`
--
ALTER TABLE `factura _producto`
  ADD CONSTRAINT `FKfactura _p629824` FOREIGN KEY (`productoid_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FKfactura _p851298` FOREIGN KEY (`orden id_orden`) REFERENCES `factura` (`id_orden`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FKproducto675605` FOREIGN KEY (`categoriaid_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
