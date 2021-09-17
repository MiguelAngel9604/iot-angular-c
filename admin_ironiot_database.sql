-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-09-2021 a las 23:59:12
-- Versión del servidor: 5.7.35-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admin_ironiot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cards`
--

CREATE TABLE `cards` (
  `cards_id` int(7) NOT NULL,
  `cards_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cards_number` varchar(50) NOT NULL,
  `cards_assigned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cards_habs`
--

CREATE TABLE `cards_habs` (
  `cards_id` int(7) NOT NULL,
  `cards_number` varchar(50) NOT NULL,
  `cards_assigned` tinyint(1) NOT NULL,
  `hab_id` int(7) NOT NULL,
  `hab_name` varchar(50) NOT NULL,
  `hab_device_id` int(7) NOT NULL,
  `devices_alias` varchar(50) NOT NULL,
  `devices_serie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data`
--

CREATE TABLE `data` (
  `data_id` int(11) NOT NULL,
  `dada_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_temp1` float(7,1) NOT NULL,
  `data_temp2` float(7,1) NOT NULL,
  `data_volts` float(7,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devices`
--

CREATE TABLE `devices` (
  `devices_id` int(7) NOT NULL,
  `devices_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `devices_alias` varchar(50) NOT NULL,
  `devices_serie` varchar(50) NOT NULL,
  `devices_user_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `devices`
--

INSERT INTO `devices` (`devices_id`, `devices_date`, `devices_alias`, `devices_serie`, `devices_user_id`) VALUES
(11, '2021-07-20 03:15:13', 'iron card', '123123', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitants`
--

CREATE TABLE `habitants` (
  `hab_id` int(7) NOT NULL,
  `hab_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hab_name` varchar(50) NOT NULL,
  `hab_card_id` int(7) NOT NULL,
  `hab_device_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mqtt_user`
--

CREATE TABLE `mqtt_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(35) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mqtt_user`
--

INSERT INTO `mqtt_user` (`id`, `username`, `password`, `salt`, `is_superuser`, `created`) VALUES
(1, 'web_client', '121212', '', 0, '2021-08-29 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temps`
--

CREATE TABLE `temps` (
  `temps_id` int(7) NOT NULL,
  `temps_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `temps_temp` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traffic`
--

CREATE TABLE `traffic` (
  `traffic_id` int(7) NOT NULL,
  `traffic_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `traffic_hab_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traffic_devices`
--

CREATE TABLE `traffic_devices` (
  `traffic_id` int(7) NOT NULL,
  `traffic_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `traffic_hab_id` int(7) NOT NULL,
  `hab_name` varchar(50) NOT NULL,
  `hab_device_id` int(7) NOT NULL,
  `devices_alias` varchar(50) NOT NULL,
  `devices_serie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `users_id` int(7) NOT NULL,
  `users_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `users_email` varchar(60) NOT NULL,
  `users_password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`users_id`, `users_date`, `users_email`, `users_password`) VALUES
(2, '2021-07-20 02:56:32', 'mlopezmejia81@gmail.com', 'e5bf9cc301cde129f4c03c95358d1853dc1c01a8');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`cards_id`);

--
-- Indices de la tabla `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indices de la tabla `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`devices_id`);

--
-- Indices de la tabla `habitants`
--
ALTER TABLE `habitants`
  ADD PRIMARY KEY (`hab_id`);

--
-- Indices de la tabla `mqtt_user`
--
ALTER TABLE `mqtt_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temps`
--
ALTER TABLE `temps`
  ADD PRIMARY KEY (`temps_id`);

--
-- Indices de la tabla `traffic`
--
ALTER TABLE `traffic`
  ADD PRIMARY KEY (`traffic_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cards`
--
ALTER TABLE `cards`
  MODIFY `cards_id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `data`
--
ALTER TABLE `data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `devices`
--
ALTER TABLE `devices`
  MODIFY `devices_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `habitants`
--
ALTER TABLE `habitants`
  MODIFY `hab_id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mqtt_user`
--
ALTER TABLE `mqtt_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `temps`
--
ALTER TABLE `temps`
  MODIFY `temps_id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `traffic`
--
ALTER TABLE `traffic`
  MODIFY `traffic_id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
