-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 02:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youth_hero`
--
CREATE DATABASE IF NOT EXISTS `youth_hero` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `youth_hero`;

-- --------------------------------------------------------

--
-- Table structure for table `companyimage_table`
--

DROP TABLE IF EXISTS `companyimage_table`;
CREATE TABLE IF NOT EXISTS `companyimage_table` (
  `ImageId` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `CompanyImagePath` text NOT NULL,
  PRIMARY KEY (`ImageId`),
  KEY `CompanyId` (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `companyimage_table`:
--   `CompanyId`
--       `company_table` -> `CompanyId`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_table`
--

DROP TABLE IF EXISTS `company_table`;
CREATE TABLE IF NOT EXISTS `company_table` (
  `CompanyId` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `CompanyDescription` text NOT NULL,
  `Website` varchar(50) NOT NULL,
  `UserAccountId` int(11) NOT NULL,
  PRIMARY KEY (`CompanyId`),
  KEY `company_table_ibfk_1` (`UserAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `company_table`:
--   `UserAccountId`
--       `useraccount_table` -> `UserAccountId`
--

-- --------------------------------------------------------

--
-- Table structure for table `contract_table`
--

DROP TABLE IF EXISTS `contract_table`;
CREATE TABLE IF NOT EXISTS `contract_table` (
  `ContractId` int(11) NOT NULL AUTO_INCREMENT,
  `SeekerId` int(11) NOT NULL,
  `OfferId` int(11) NOT NULL,
  `HourDuration` int(11) NOT NULL,
  `Details` text NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`ContractId`),
  KEY `OfferId` (`OfferId`),
  KEY `SeekerId` (`SeekerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `contract_table`:
--   `OfferId`
--       `offer_table` -> `OfferId`
--   `SeekerId`
--       `seekerprofile_table` -> `SeekerId`
--

-- --------------------------------------------------------

--
-- Table structure for table `education_table`
--

DROP TABLE IF EXISTS `education_table`;
CREATE TABLE IF NOT EXISTS `education_table` (
  `EducationId` int(11) NOT NULL AUTO_INCREMENT,
  `SeekerId` int(11) NOT NULL,
  `CertificateDegreeName` varchar(100) NOT NULL,
  `Major` varchar(50) NOT NULL,
  `SchoolName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EducationId`),
  KEY `SeekerId` (`SeekerId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `education_table`:
--   `SeekerId`
--       `seekerprofile_table` -> `SeekerId`
--

--
-- Dumping data for table `education_table`
--

INSERT INTO `education_table` (`EducationId`, `SeekerId`, `CertificateDegreeName`, `Major`, `SchoolName`) VALUES
(5, 7, 'college ', 'comsci', 'USM');

-- --------------------------------------------------------

--
-- Table structure for table `offerlocation_table`
--

DROP TABLE IF EXISTS `offerlocation_table`;
CREATE TABLE IF NOT EXISTS `offerlocation_table` (
  `Locationid` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(100) NOT NULL,
  `CityMunicipality` varchar(100) NOT NULL,
  `Zip` varchar(10) NOT NULL,
  PRIMARY KEY (`Locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `offerlocation_table`:
--

-- --------------------------------------------------------

--
-- Table structure for table `offerskillset_table`
--

DROP TABLE IF EXISTS `offerskillset_table`;
CREATE TABLE IF NOT EXISTS `offerskillset_table` (
  `OfferId` int(11) NOT NULL,
  `SkillSetId` int(11) NOT NULL,
  KEY `OfferId` (`OfferId`),
  KEY `SkillSetId` (`SkillSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `offerskillset_table`:
--   `OfferId`
--       `offer_table` -> `OfferId`
--   `SkillSetId`
--       `skillset_table` -> `SkillSetId`
--

-- --------------------------------------------------------

--
-- Table structure for table `offertype_table`
--

DROP TABLE IF EXISTS `offertype_table`;
CREATE TABLE IF NOT EXISTS `offertype_table` (
  `OfferTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  PRIMARY KEY (`OfferTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `offertype_table`:
--

-- --------------------------------------------------------

--
-- Table structure for table `offer_table`
--

DROP TABLE IF EXISTS `offer_table`;
CREATE TABLE IF NOT EXISTS `offer_table` (
  `OfferId` int(11) NOT NULL AUTO_INCREMENT,
  `PostedBy` int(11) NOT NULL,
  `OfferType` int(11) NOT NULL,
  `OfferLocation` int(11) NOT NULL,
  `OfferDescription` text NOT NULL,
  `IsActive` int(11) NOT NULL,
  PRIMARY KEY (`OfferId`),
  KEY `PostedBy` (`PostedBy`),
  KEY `OfferLocation` (`OfferLocation`),
  KEY `offer_table_ibfk_2` (`OfferType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `offer_table`:
--   `PostedBy`
--       `company_table` -> `CompanyId`
--   `OfferType`
--       `offertype_table` -> `OfferTypeId`
--   `OfferLocation`
--       `offerlocation_table` -> `Locationid`
--

-- --------------------------------------------------------

--
-- Table structure for table `seekerprofile_table`
--

DROP TABLE IF EXISTS `seekerprofile_table`;
CREATE TABLE IF NOT EXISTS `seekerprofile_table` (
  `SeekerId` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `ContactNumber` varchar(15) NOT NULL,
  `BirthDate` date NOT NULL,
  `UserAccountId` int(11) NOT NULL,
  PRIMARY KEY (`SeekerId`),
  KEY `UserAccountId` (`UserAccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `seekerprofile_table`:
--   `UserAccountId`
--       `useraccount_table` -> `UserAccountId`
--

--
-- Dumping data for table `seekerprofile_table`
--

INSERT INTO `seekerprofile_table` (`SeekerId`, `Firstname`, `Lastname`, `Gender`, `ContactNumber`, `BirthDate`, `UserAccountId`) VALUES
(7, 'Seeker1f', 'Seeker1l', 'Male', '090909090o0', '0000-00-00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `seekerskillset_table`
--

DROP TABLE IF EXISTS `seekerskillset_table`;
CREATE TABLE IF NOT EXISTS `seekerskillset_table` (
  `SeekerSkillSetId` int(11) NOT NULL,
  `SkillSetId` int(11) NOT NULL,
  KEY `SeekerSkillSetId` (`SeekerSkillSetId`),
  KEY `SkillSetId` (`SkillSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `seekerskillset_table`:
--   `SeekerSkillSetId`
--       `seekerprofile_table` -> `SeekerId`
--   `SkillSetId`
--       `skillset_table` -> `SkillSetId`
--

-- --------------------------------------------------------

--
-- Table structure for table `skillset_table`
--

DROP TABLE IF EXISTS `skillset_table`;
CREATE TABLE IF NOT EXISTS `skillset_table` (
  `SkillSetId` int(11) NOT NULL AUTO_INCREMENT,
  `SkillSetDescription` text NOT NULL,
  PRIMARY KEY (`SkillSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `skillset_table`:
--

-- --------------------------------------------------------

--
-- Table structure for table `useraccount_table`
--

DROP TABLE IF EXISTS `useraccount_table`;
CREATE TABLE IF NOT EXISTS `useraccount_table` (
  `UserAccountId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `UserTypeId` int(11) NOT NULL,
  PRIMARY KEY (`UserAccountId`),
  UNIQUE KEY `Username` (`Username`),
  KEY `UserTypeId` (`UserTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `useraccount_table`:
--   `UserTypeId`
--       `usertype_table` -> `UserTypeId`
--

--
-- Dumping data for table `useraccount_table`
--

INSERT INTO `useraccount_table` (`UserAccountId`, `Username`, `Password`, `LastLogin`, `UserTypeId`) VALUES
(7, 'seeker1@mail.com', '$2y$10$dNEFdwinEkShJ1NzxHB6cOP9ji/o08Wx8xl5DJg9xcQiRoLnfLEvW', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype_table`
--

DROP TABLE IF EXISTS `usertype_table`;
CREATE TABLE IF NOT EXISTS `usertype_table` (
  `UserTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `UserTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`UserTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `usertype_table`:
--

--
-- Dumping data for table `usertype_table`
--

INSERT INTO `usertype_table` (`UserTypeId`, `UserTypeName`) VALUES
(1, 'Seeker'),
(2, 'Company');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companyimage_table`
--
ALTER TABLE `companyimage_table`
  ADD CONSTRAINT `companyimage_table_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company_table` (`CompanyId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_table`
--
ALTER TABLE `company_table`
  ADD CONSTRAINT `company_table_ibfk_1` FOREIGN KEY (`UserAccountId`) REFERENCES `useraccount_table` (`UserAccountId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_table`
--
ALTER TABLE `contract_table`
  ADD CONSTRAINT `contract_table_ibfk_1` FOREIGN KEY (`OfferId`) REFERENCES `offer_table` (`OfferId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_table_ibfk_2` FOREIGN KEY (`SeekerId`) REFERENCES `seekerprofile_table` (`SeekerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `education_table`
--
ALTER TABLE `education_table`
  ADD CONSTRAINT `education_table_ibfk_1` FOREIGN KEY (`SeekerId`) REFERENCES `seekerprofile_table` (`SeekerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offerskillset_table`
--
ALTER TABLE `offerskillset_table`
  ADD CONSTRAINT `offerskillset_table_ibfk_1` FOREIGN KEY (`OfferId`) REFERENCES `offer_table` (`OfferId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offerskillset_table_ibfk_2` FOREIGN KEY (`SkillSetId`) REFERENCES `skillset_table` (`SkillSetId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offer_table`
--
ALTER TABLE `offer_table`
  ADD CONSTRAINT `offer_table_ibfk_1` FOREIGN KEY (`PostedBy`) REFERENCES `company_table` (`CompanyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offer_table_ibfk_2` FOREIGN KEY (`OfferType`) REFERENCES `offertype_table` (`OfferTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offer_table_ibfk_3` FOREIGN KEY (`OfferLocation`) REFERENCES `offerlocation_table` (`Locationid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seekerprofile_table`
--
ALTER TABLE `seekerprofile_table`
  ADD CONSTRAINT `seekerprofile_table_ibfk_1` FOREIGN KEY (`UserAccountId`) REFERENCES `useraccount_table` (`UserAccountId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seekerskillset_table`
--
ALTER TABLE `seekerskillset_table`
  ADD CONSTRAINT `seekerskillset_table_ibfk_1` FOREIGN KEY (`SeekerSkillSetId`) REFERENCES `seekerprofile_table` (`SeekerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seekerskillset_table_ibfk_2` FOREIGN KEY (`SkillSetId`) REFERENCES `skillset_table` (`SkillSetId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `useraccount_table`
--
ALTER TABLE `useraccount_table`
  ADD CONSTRAINT `useraccount_table_ibfk_1` FOREIGN KEY (`UserTypeId`) REFERENCES `usertype_table` (`UserTypeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
