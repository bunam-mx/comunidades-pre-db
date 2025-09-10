-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 10, 2025 at 11:53 AM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `medicina`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesos`
--

CREATE TABLE IF NOT EXISTS `accesos` (
`id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `acceso` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11359 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actividades`
--

CREATE TABLE IF NOT EXISTS `actividades` (
`idactividades` int(11) NOT NULL,
  `codigo_asignatura` varchar(255) DEFAULT NULL,
  `codigo_actividad` varchar(255) DEFAULT NULL,
  `reactivos` longtext,
  `tipo_actividad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
`idcomentarios` int(11) NOT NULL,
  `clave_materia` varchar(45) DEFAULT NULL,
  `comentario` longtext,
  `id` int(11) NOT NULL,
  `status` int(2) DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  `creacion` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2413 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cuestionarios`
--

CREATE TABLE IF NOT EXISTS `cuestionarios` (
`idcuestionarios` int(11) NOT NULL,
  `materia` varchar(255) DEFAULT NULL,
  `clave_materia` varchar(45) DEFAULT NULL,
  `numero_actividades` varchar(45) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
`id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `nivel` int(2) NOT NULL,
  `creacion` int(11) NOT NULL,
  `caducidad` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5368 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_user`
--

CREATE TABLE IF NOT EXISTS `log_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recoveries`
--

CREATE TABLE IF NOT EXISTS `recoveries` (
`id` int(11) NOT NULL,
  `hash` varchar(500) NOT NULL,
  `email` varchar(150) NOT NULL,
  `create_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registros`
--

CREATE TABLE IF NOT EXISTS `registros` (
`id` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `pass` varchar(80) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais_residencia` varchar(255) DEFAULT NULL,
  `escuela` varchar(255) DEFAULT NULL,
  `promedio_escuela` varchar(45) DEFAULT NULL,
  `escuela_ingreso` varchar(255) DEFAULT NULL,
  `licenciatura_cursar` varchar(255) DEFAULT NULL,
  `unam` tinyint(1) DEFAULT NULL,
  `no_cuenta` varchar(10) DEFAULT NULL,
  `creacion_registro` int(11) NOT NULL,
  `ultimo_accseso` int(11) DEFAULT NULL,
  `ultima_url` varchar(255) DEFAULT NULL,
  `asignaturas` longtext,
  `promedio` varchar(45) DEFAULT NULL,
  `tipo_usuario` int(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `securityQ_1` varchar(255) NOT NULL DEFAULT '',
  `respuestaSQ_1` varchar(255) NOT NULL DEFAULT '',
  `securityQ_2` varchar(255) NOT NULL DEFAULT '',
  `respuestaSQ_2` varchar(255) NOT NULL DEFAULT '',
  `securityQ_3` varchar(255) NOT NULL DEFAULT '',
  `respuestaSQ_3` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3878 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idusers` int(11) NOT NULL,
  `mail` varchar(80) DEFAULT NULL,
  `pass` varchar(80) DEFAULT NULL,
  `creacion` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesos`
--
ALTER TABLE `accesos`
 ADD PRIMARY KEY (`id`), ADD KEY `userid` (`userid`);

--
-- Indexes for table `actividades`
--
ALTER TABLE `actividades`
 ADD PRIMARY KEY (`idactividades`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
 ADD PRIMARY KEY (`idcomentarios`), ADD KEY `fk_comentarios_users_idx` (`id`);

--
-- Indexes for table `cuestionarios`
--
ALTER TABLE `cuestionarios`
 ADD PRIMARY KEY (`idcuestionarios`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recoveries`
--
ALTER TABLE `recoveries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registros`
--
ALTER TABLE `registros`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesos`
--
ALTER TABLE `accesos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11359;
--
-- AUTO_INCREMENT for table `actividades`
--
ALTER TABLE `actividades`
MODIFY `idactividades` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1312;
--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
MODIFY `idcomentarios` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2413;
--
-- AUTO_INCREMENT for table `cuestionarios`
--
ALTER TABLE `cuestionarios`
MODIFY `idcuestionarios` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5368;
--
-- AUTO_INCREMENT for table `recoveries`
--
ALTER TABLE `recoveries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registros`
--
ALTER TABLE `registros`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3878;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesos`
--
ALTER TABLE `accesos`
ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `registros` (`id`);

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
ADD CONSTRAINT `fk_comentarios_users` FOREIGN KEY (`id`) REFERENCES `registros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
