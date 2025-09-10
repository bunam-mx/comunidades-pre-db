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
-- Database: `arquitectura`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
`idalumno` int(11) NOT NULL,
  `cuenta` int(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `ap_paterno` varchar(45) NOT NULL,
  `ap_materno` varchar(45) NOT NULL,
  `nacimiento` date NOT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `procedencia` varchar(45) NOT NULL,
  `carrera` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `certificado` tinyint(1) NOT NULL,
  `calificacion` decimal(3,2) NOT NULL,
  `intentos` tinyint(3) NOT NULL,
  `tipo` tinyint(4) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Datos del alumno',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9890 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `alumnosCursoCalificaciones`
--
CREATE TABLE IF NOT EXISTS `alumnosCursoCalificaciones` (
`count(calificacion.idalumno)` bigint(21)
,`idcurso` int(11)
,`curso` varchar(45)
,`calificacion` decimal(3,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `alumno_resume`
--
CREATE TABLE IF NOT EXISTS `alumno_resume` (
`cuenta` int(10)
,`nombre` varchar(100)
,`ap_paterno` varchar(45)
,`ap_materno` varchar(45)
,`email` varchar(100)
,`procedencia` varchar(45)
,`carrera` varchar(45)
,`tipo` tinyint(4)
,`dx` decimal(3,2)
,`intentos` tinyint(3)
,`create_date` timestamp
,`final` decimal(3,2)
,`update_date` timestamp
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `alumno_tipo`
--
CREATE TABLE IF NOT EXISTS `alumno_tipo` (
`tipo` tinyint(4)
,`total` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `calificacion`
--

CREATE TABLE IF NOT EXISTS `calificacion` (
`idcalificacion` int(11) NOT NULL COMMENT 'Calificaciones de los exámenes hechos por el alumno de acuerdo al último realizado',
  `idalumno` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `calificacion` decimal(3,2) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4669 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cantidad_categoria`
--

CREATE TABLE IF NOT EXISTS `cantidad_categoria` (
`idcantidad_categoria` int(11) NOT NULL COMMENT 'Cantidad de preguntas por categoría',
  `idtipo_exmn` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `cantidad_preguntas` tinyint(2) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
`idcategoria` int(11) NOT NULL COMMENT 'Categorías para el examen',
  `categoria` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
`id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=34973 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
`idcurso` int(11) NOT NULL,
  `curso` varchar(45) NOT NULL,
  `cant_pag` tinyint(3) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `cursoAlumnos`
--
CREATE TABLE IF NOT EXISTS `cursoAlumnos` (
`count(calificacion.idalumno)` bigint(21)
,`idcurso` int(11)
,`curso` varchar(45)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `diagnostico_vs_examen`
--
CREATE TABLE IF NOT EXISTS `diagnostico_vs_examen` (
`idalumno` int(11)
,`cuenta` int(10)
,`nombre` varchar(100)
,`ap_paterno` varchar(45)
,`ap_materno` varchar(45)
,`email` varchar(100)
,`procedencia` varchar(45)
,`carrera` varchar(45)
,`tipo` tinyint(4)
,`diagnostico` decimal(3,2)
,`calificacion` decimal(3,2)
,`registro` timestamp
,`examen` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `evaluacion_alm`
--

CREATE TABLE IF NOT EXISTS `evaluacion_alm` (
`idevaluacion_alm` int(11) NOT NULL COMMENT 'Evaluciones o exámenes realizados por el alumno',
  `idrespuesta` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idtipo_exmn` int(11) NOT NULL,
  `idcalificacion` int(11) NOT NULL COMMENT 'El valor 0 corresponde al examen diagnostico, Los demas valores correspondes la examen del curso de lectura o matematicas',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=197954 DEFAULT CHARSET=utf8 COMMENT='Evaluación del alumno';

-- --------------------------------------------------------

--
-- Table structure for table `hash`
--

CREATE TABLE IF NOT EXISTS `hash` (
`idhash` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10308 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_preguntas`
--

CREATE TABLE IF NOT EXISTS `log_preguntas` (
`idlog_pregunta` int(11) NOT NULL COMMENT 'Respaldo de preguntas modificadas',
  `idpregunta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `pregunta_anterior` text NOT NULL,
  `razon` varchar(300) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_respuestas`
--

CREATE TABLE IF NOT EXISTS `log_respuestas` (
`idlog_respuesta` int(11) NOT NULL COMMENT 'Respaldo de respuestas modificadas',
  `idrespuesta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `respuesta_anterior` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `no_constancia`
--
CREATE TABLE IF NOT EXISTS `no_constancia` (
`idalumno` int(11)
,`cuenta` int(10)
,`nombre` varchar(100)
,`ap_paterno` varchar(45)
,`ap_materno` varchar(45)
,`nacimiento` date
,`email` varchar(100)
,`procedencia` varchar(45)
,`carrera` varchar(45)
,`password` varchar(150)
,`status` tinyint(1)
,`certificado` tinyint(1)
,`calificacion` decimal(3,2)
,`intentos` tinyint(3)
,`tipo` tinyint(4)
,`update_date` timestamp
,`create_date` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
`idpregunta` int(11) NOT NULL COMMENT 'Preguntas del examen',
  `idcategoria` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `progreso`
--

CREATE TABLE IF NOT EXISTS `progreso` (
`idprogreso` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `progreso` tinyint(3) NOT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9361 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `reactivos_totales`
--
CREATE TABLE IF NOT EXISTS `reactivos_totales` (
`nombre` varchar(300)
,`categoria` varchar(45)
,`total` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `reporte_alumnos`
--
CREATE TABLE IF NOT EXISTS `reporte_alumnos` (
`idalumno` int(11)
,`cuenta` int(10)
,`nombre` varchar(100)
,`ap_paterno` varchar(45)
,`ap_materno` varchar(45)
,`email` varchar(100)
,`procedencia` varchar(45)
,`carrera` varchar(45)
,`tipo` tinyint(4)
,`diagnostico` decimal(3,2)
,`constancia` tinyint(1)
,`registro` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `respuestas`
--

CREATE TABLE IF NOT EXISTS `respuestas` (
`idrespuesta` int(11) NOT NULL COMMENT 'Respuestas de las preguntas de examen',
  `idusuario` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_exmn`
--

CREATE TABLE IF NOT EXISTS `tipo_exmn` (
`idtipo_exmn` int(11) NOT NULL COMMENT 'Tipos de examen generados',
  `idusuario` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`idusuario` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `alumnosCursoCalificaciones`
--
DROP TABLE IF EXISTS `alumnosCursoCalificaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`juanma`@`%` SQL SECURITY DEFINER VIEW `alumnosCursoCalificaciones` AS select count(`calificacion`.`idalumno`) AS `count(calificacion.idalumno)`,`calificacion`.`idcurso` AS `idcurso`,`curso`.`curso` AS `curso`,`calificacion`.`calificacion` AS `calificacion` from (`calificacion` join `curso` on((`curso`.`idcurso` = `calificacion`.`idcurso`))) group by `calificacion`.`calificacion`;

-- --------------------------------------------------------

--
-- Structure for view `alumno_resume`
--
DROP TABLE IF EXISTS `alumno_resume`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alumno_resume` AS select `alumno`.`cuenta` AS `cuenta`,`alumno`.`nombre` AS `nombre`,`alumno`.`ap_paterno` AS `ap_paterno`,`alumno`.`ap_materno` AS `ap_materno`,`alumno`.`email` AS `email`,`alumno`.`procedencia` AS `procedencia`,`alumno`.`carrera` AS `carrera`,`alumno`.`tipo` AS `tipo`,`alumno`.`calificacion` AS `dx`,`alumno`.`intentos` AS `intentos`,`alumno`.`create_date` AS `create_date`,`calificacion`.`calificacion` AS `final`,`calificacion`.`update_date` AS `update_date` from (`alumno` join `calificacion` on((`calificacion`.`idalumno` = `alumno`.`idalumno`))) group by `alumno`.`cuenta` order by `alumno`.`idalumno`;

-- --------------------------------------------------------

--
-- Structure for view `alumno_tipo`
--
DROP TABLE IF EXISTS `alumno_tipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alumno_tipo` AS select `alumno`.`tipo` AS `tipo`,count(`alumno`.`tipo`) AS `total` from `alumno` group by `alumno`.`tipo`;

-- --------------------------------------------------------

--
-- Structure for view `cursoAlumnos`
--
DROP TABLE IF EXISTS `cursoAlumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`juanma`@`%` SQL SECURITY DEFINER VIEW `cursoAlumnos` AS select count(`calificacion`.`idalumno`) AS `count(calificacion.idalumno)`,`calificacion`.`idcurso` AS `idcurso`,`curso`.`curso` AS `curso` from (`calificacion` join `curso` on((`curso`.`idcurso` = `calificacion`.`idcurso`))) group by `calificacion`.`idcurso`;

-- --------------------------------------------------------

--
-- Structure for view `diagnostico_vs_examen`
--
DROP TABLE IF EXISTS `diagnostico_vs_examen`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diagnostico_vs_examen` AS select `alumno`.`idalumno` AS `idalumno`,`alumno`.`cuenta` AS `cuenta`,`alumno`.`nombre` AS `nombre`,`alumno`.`ap_paterno` AS `ap_paterno`,`alumno`.`ap_materno` AS `ap_materno`,`alumno`.`email` AS `email`,`alumno`.`procedencia` AS `procedencia`,`alumno`.`carrera` AS `carrera`,`alumno`.`tipo` AS `tipo`,`alumno`.`calificacion` AS `diagnostico`,max(`calificacion`.`calificacion`) AS `calificacion`,`alumno`.`create_date` AS `registro`,`calificacion`.`create_date` AS `examen` from (`alumno` join `calificacion` on((`alumno`.`idalumno` = `calificacion`.`idalumno`))) group by `alumno`.`idalumno`;

-- --------------------------------------------------------

--
-- Structure for view `no_constancia`
--
DROP TABLE IF EXISTS `no_constancia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `no_constancia` AS select `alumno`.`idalumno` AS `idalumno`,`alumno`.`cuenta` AS `cuenta`,`alumno`.`nombre` AS `nombre`,`alumno`.`ap_paterno` AS `ap_paterno`,`alumno`.`ap_materno` AS `ap_materno`,`alumno`.`nacimiento` AS `nacimiento`,`alumno`.`email` AS `email`,`alumno`.`procedencia` AS `procedencia`,`alumno`.`carrera` AS `carrera`,`alumno`.`password` AS `password`,`alumno`.`status` AS `status`,`alumno`.`certificado` AS `certificado`,`alumno`.`calificacion` AS `calificacion`,`alumno`.`intentos` AS `intentos`,`alumno`.`tipo` AS `tipo`,`alumno`.`update_date` AS `update_date`,`alumno`.`create_date` AS `create_date` from `alumno` where (`alumno`.`certificado` = 0);

-- --------------------------------------------------------

--
-- Structure for view `reactivos_totales`
--
DROP TABLE IF EXISTS `reactivos_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reactivos_totales` AS select `usuarios`.`nombre` AS `nombre`,`categorias`.`categoria` AS `categoria`,count(`preguntas`.`idcategoria`) AS `total` from ((`preguntas` join `usuarios` on((`preguntas`.`idusuario` = `usuarios`.`idusuario`))) join `categorias` on((`preguntas`.`idcategoria` = `categorias`.`idcategoria`))) group by `preguntas`.`idusuario`,`preguntas`.`idcategoria`;

-- --------------------------------------------------------

--
-- Structure for view `reporte_alumnos`
--
DROP TABLE IF EXISTS `reporte_alumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reporte_alumnos` AS select `alumno`.`idalumno` AS `idalumno`,`alumno`.`cuenta` AS `cuenta`,`alumno`.`nombre` AS `nombre`,`alumno`.`ap_paterno` AS `ap_paterno`,`alumno`.`ap_materno` AS `ap_materno`,`alumno`.`email` AS `email`,`alumno`.`procedencia` AS `procedencia`,`alumno`.`carrera` AS `carrera`,`alumno`.`tipo` AS `tipo`,`alumno`.`calificacion` AS `diagnostico`,`alumno`.`certificado` AS `constancia`,`alumno`.`create_date` AS `registro` from `alumno` order by `alumno`.`idalumno`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumno`
--
ALTER TABLE `alumno`
 ADD PRIMARY KEY (`idalumno`);

--
-- Indexes for table `calificacion`
--
ALTER TABLE `calificacion`
 ADD PRIMARY KEY (`idcalificacion`), ADD KEY `fk_examen_alumno1_idx` (`idalumno`), ADD KEY `fk_calificacion_curso1_idx` (`idcurso`);

--
-- Indexes for table `cantidad_categoria`
--
ALTER TABLE `cantidad_categoria`
 ADD PRIMARY KEY (`idcantidad_categoria`), ADD KEY `fk_cantidad_categoría_tipo_exmn1_idx` (`idtipo_exmn`), ADD KEY `fk_cantidad_categoría_categorias1_idx` (`idcategoria`), ADD KEY `fk_cantidad_categoría_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
 ADD PRIMARY KEY (`idcategoria`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ci_sessions_alumno1_idx` (`idalumno`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`idcurso`);

--
-- Indexes for table `evaluacion_alm`
--
ALTER TABLE `evaluacion_alm`
 ADD PRIMARY KEY (`idevaluacion_alm`), ADD KEY `fk_preguntas_examen_respuestas1_idx` (`idrespuesta`), ADD KEY `fk_preguntas_examen_preguntas1_idx` (`idpregunta`), ADD KEY `fk_evalucion_alm_alumno1_idx` (`idalumno`), ADD KEY `fk_evaluacion_alm_tipo_exmn1_idx` (`idtipo_exmn`), ADD KEY `fk_calificacion_idx` (`idcalificacion`);

--
-- Indexes for table `hash`
--
ALTER TABLE `hash`
 ADD PRIMARY KEY (`idhash`), ADD KEY `fk_hash_alumno1_idx` (`idalumno`);

--
-- Indexes for table `log_preguntas`
--
ALTER TABLE `log_preguntas`
 ADD PRIMARY KEY (`idlog_pregunta`), ADD KEY `fk_log_reactivos_reactivos1_idx` (`idpregunta`), ADD KEY `fk_log_reactivos_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `log_respuestas`
--
ALTER TABLE `log_respuestas`
 ADD PRIMARY KEY (`idlog_respuesta`), ADD KEY `fk_log_respuestas_respuestas1_idx` (`idrespuesta`), ADD KEY `fk_log_respuestas_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `preguntas`
--
ALTER TABLE `preguntas`
 ADD PRIMARY KEY (`idpregunta`), ADD KEY `fk_reactivos_categorias1_idx` (`idcategoria`), ADD KEY `fk_preguntas_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `progreso`
--
ALTER TABLE `progreso`
 ADD PRIMARY KEY (`idprogreso`), ADD KEY `fk_progreso_alumno1_idx` (`idalumno`);

--
-- Indexes for table `respuestas`
--
ALTER TABLE `respuestas`
 ADD PRIMARY KEY (`idrespuesta`), ADD KEY `fk_respuestas_reactivos1_idx` (`idpregunta`), ADD KEY `fk_respuestas_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `tipo_exmn`
--
ALTER TABLE `tipo_exmn`
 ADD PRIMARY KEY (`idtipo_exmn`), ADD KEY `fk_tipo_exmn_usuarios1_idx` (`idusuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumno`
--
ALTER TABLE `alumno`
MODIFY `idalumno` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9890;
--
-- AUTO_INCREMENT for table `calificacion`
--
ALTER TABLE `calificacion`
MODIFY `idcalificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Calificaciones de los exámenes hechos por el alumno de acuerdo al último realizado',AUTO_INCREMENT=4669;
--
-- AUTO_INCREMENT for table `cantidad_categoria`
--
ALTER TABLE `cantidad_categoria`
MODIFY `idcantidad_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cantidad de preguntas por categoría',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Categorías para el examen',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34973;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `evaluacion_alm`
--
ALTER TABLE `evaluacion_alm`
MODIFY `idevaluacion_alm` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Evaluciones o exámenes realizados por el alumno',AUTO_INCREMENT=197954;
--
-- AUTO_INCREMENT for table `hash`
--
ALTER TABLE `hash`
MODIFY `idhash` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10308;
--
-- AUTO_INCREMENT for table `log_preguntas`
--
ALTER TABLE `log_preguntas`
MODIFY `idlog_pregunta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Respaldo de preguntas modificadas';
--
-- AUTO_INCREMENT for table `log_respuestas`
--
ALTER TABLE `log_respuestas`
MODIFY `idlog_respuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Respaldo de respuestas modificadas';
--
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Preguntas del examen',AUTO_INCREMENT=317;
--
-- AUTO_INCREMENT for table `progreso`
--
ALTER TABLE `progreso`
MODIFY `idprogreso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9361;
--
-- AUTO_INCREMENT for table `respuestas`
--
ALTER TABLE `respuestas`
MODIFY `idrespuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Respuestas de las preguntas de examen',AUTO_INCREMENT=1024;
--
-- AUTO_INCREMENT for table `tipo_exmn`
--
ALTER TABLE `tipo_exmn`
MODIFY `idtipo_exmn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipos de examen generados',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calificacion`
--
ALTER TABLE `calificacion`
ADD CONSTRAINT `fk_calificacion_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_examen_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cantidad_categoria`
--
ALTER TABLE `cantidad_categoria`
ADD CONSTRAINT `fk_cantidad_categoría_categorias1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_cantidad_categoría_tipo_exmn1` FOREIGN KEY (`idtipo_exmn`) REFERENCES `tipo_exmn` (`idtipo_exmn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_cantidad_categoría_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
ADD CONSTRAINT `fk_ci_sessions_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `evaluacion_alm`
--
ALTER TABLE `evaluacion_alm`
ADD CONSTRAINT `fk_evaluacion_alm_tipo_exmn1` FOREIGN KEY (`idtipo_exmn`) REFERENCES `tipo_exmn` (`idtipo_exmn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_evalucion_alm_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_preguntas_examen_preguntas1` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_preguntas_examen_respuestas1` FOREIGN KEY (`idrespuesta`) REFERENCES `respuestas` (`idrespuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hash`
--
ALTER TABLE `hash`
ADD CONSTRAINT `fk_hash_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log_preguntas`
--
ALTER TABLE `log_preguntas`
ADD CONSTRAINT `fk_log_reactivos_reactivos1` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_log_reactivos_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log_respuestas`
--
ALTER TABLE `log_respuestas`
ADD CONSTRAINT `fk_log_respuestas_respuestas1` FOREIGN KEY (`idrespuesta`) REFERENCES `respuestas` (`idrespuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_log_respuestas_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preguntas`
--
ALTER TABLE `preguntas`
ADD CONSTRAINT `fk_preguntas_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reactivos_categorias1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `progreso`
--
ALTER TABLE `progreso`
ADD CONSTRAINT `fk_progreso_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `respuestas`
--
ALTER TABLE `respuestas`
ADD CONSTRAINT `fk_respuestas_reactivos1` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_respuestas_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tipo_exmn`
--
ALTER TABLE `tipo_exmn`
ADD CONSTRAINT `fk_tipo_exmn_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
