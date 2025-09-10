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
-- Database: `veterinaria`
--

-- --------------------------------------------------------

--
-- Table structure for table `attemp`
--

CREATE TABLE IF NOT EXISTS `attemp` (
`idattemp` int(11) NOT NULL,
  `attemps` int(11) NOT NULL,
  `score` float NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_iduser` int(11) NOT NULL,
  `category_idcategory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5569 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`idcategory` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `image` varchar(145) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CountryCatalogue`
--

CREATE TABLE IF NOT EXISTS `CountryCatalogue` (
  `id_country` int(11) NOT NULL,
  `iso` char(4) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic`
--

CREATE TABLE IF NOT EXISTS `diagnostic` (
`iddiagnostic` int(11) NOT NULL,
  `correct` int(11) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reactive_idreactive` int(11) NOT NULL,
  `uapa_iduapa` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=67907 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
`idevaluation` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `correct` int(11) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uapa_iduapa` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL,
  `category_idcategory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `id_institution` int(11) NOT NULL,
  `nameInstitution` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0 <- Inactivo, 1 <- Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
`idoption` int(11) NOT NULL,
  `statement` varchar(545) NOT NULL,
  `correct` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reactive_idreactive` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reactive`
--

CREATE TABLE IF NOT EXISTS `reactive` (
`idreactive` int(11) NOT NULL,
  `statement` varchar(545) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uapa_iduapa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
`id_token` int(11) NOT NULL,
  `token` text NOT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `dateUpdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4944 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uapa`
--

CREATE TABLE IF NOT EXISTS `uapa` (
`iduapa` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `slug` varchar(145) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category_idcategory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`iduser` int(11) NOT NULL,
  `email` varchar(145) NOT NULL,
  `password` varchar(145) NOT NULL,
  `name` varchar(145) NOT NULL,
  `firstSurname` varchar(145) NOT NULL,
  `secondSurname` varchar(145) DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  `birthday` date NOT NULL,
  `userType_id` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `institution` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3547 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `UserType`
--

CREATE TABLE IF NOT EXISTS `UserType` (
`ID_user_type` int(11) NOT NULL,
  `user_type_name` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attemp`
--
ALTER TABLE `attemp`
 ADD PRIMARY KEY (`idattemp`), ADD KEY `fk_attemp_user1_idx` (`user_iduser`), ADD KEY `fk_attemp_category1_idx` (`category_idcategory`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`idcategory`);

--
-- Indexes for table `CountryCatalogue`
--
ALTER TABLE `CountryCatalogue`
 ADD PRIMARY KEY (`id_country`);

--
-- Indexes for table `diagnostic`
--
ALTER TABLE `diagnostic`
 ADD PRIMARY KEY (`iddiagnostic`), ADD KEY `fk_diagnostic_reactive1_idx` (`reactive_idreactive`), ADD KEY `fk_diagnostic_uapa1_idx` (`uapa_iduapa`), ADD KEY `fk_diagnostic_user1_idx` (`user_iduser`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
 ADD PRIMARY KEY (`idevaluation`), ADD KEY `fk_evaluation_uapa1_idx` (`uapa_iduapa`), ADD KEY `fk_evaluation_user1_idx` (`user_iduser`), ADD KEY `fk_evaluation_category1_idx` (`category_idcategory`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
 ADD PRIMARY KEY (`id_institution`);

--
-- Indexes for table `option`
--
ALTER TABLE `option`
 ADD PRIMARY KEY (`idoption`), ADD KEY `fk_option_reactive1_idx` (`reactive_idreactive`);

--
-- Indexes for table `reactive`
--
ALTER TABLE `reactive`
 ADD PRIMARY KEY (`idreactive`), ADD KEY `fk_reactive_uapa1_idx` (`uapa_iduapa`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
 ADD PRIMARY KEY (`id_token`), ADD KEY `fk_token_user` (`user_id`);

--
-- Indexes for table `uapa`
--
ALTER TABLE `uapa`
 ADD PRIMARY KEY (`iduapa`), ADD KEY `fk_uapa_category_idx` (`category_idcategory`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`iduser`), ADD KEY `fk_user_userType` (`userType_id`), ADD KEY `fk_user_country` (`country`), ADD KEY `fk_user_institution` (`institution`);

--
-- Indexes for table `UserType`
--
ALTER TABLE `UserType`
 ADD PRIMARY KEY (`ID_user_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attemp`
--
ALTER TABLE `attemp`
MODIFY `idattemp` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5569;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diagnostic`
--
ALTER TABLE `diagnostic`
MODIFY `iddiagnostic` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67907;
--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
MODIFY `idevaluation` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=883;
--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
MODIFY `idoption` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1096;
--
-- AUTO_INCREMENT for table `reactive`
--
ALTER TABLE `reactive`
MODIFY `idreactive` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4944;
--
-- AUTO_INCREMENT for table `uapa`
--
ALTER TABLE `uapa`
MODIFY `iduapa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3547;
--
-- AUTO_INCREMENT for table `UserType`
--
ALTER TABLE `UserType`
MODIFY `ID_user_type` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attemp`
--
ALTER TABLE `attemp`
ADD CONSTRAINT `fk_attemp_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_attemp_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `diagnostic`
--
ALTER TABLE `diagnostic`
ADD CONSTRAINT `fk_diagnostic_reactive1` FOREIGN KEY (`reactive_idreactive`) REFERENCES `reactive` (`idreactive`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_diagnostic_uapa1` FOREIGN KEY (`uapa_iduapa`) REFERENCES `uapa` (`iduapa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_diagnostic_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
ADD CONSTRAINT `fk_evaluation_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_evaluation_uapa1` FOREIGN KEY (`uapa_iduapa`) REFERENCES `uapa` (`iduapa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_evaluation_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `option`
--
ALTER TABLE `option`
ADD CONSTRAINT `fk_option_reactive1` FOREIGN KEY (`reactive_idreactive`) REFERENCES `reactive` (`idreactive`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reactive`
--
ALTER TABLE `reactive`
ADD CONSTRAINT `fk_reactive_uapa1` FOREIGN KEY (`uapa_iduapa`) REFERENCES `uapa` (`iduapa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
ADD CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `uapa`
--
ALTER TABLE `uapa`
ADD CONSTRAINT `fk_uapa_category` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `fk_user_country` FOREIGN KEY (`country`) REFERENCES `CountryCatalogue` (`id_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_institution` FOREIGN KEY (`institution`) REFERENCES `institution` (`id_institution`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_userType` FOREIGN KEY (`userType_id`) REFERENCES `UserType` (`ID_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
