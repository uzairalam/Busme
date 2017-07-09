-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2016 at 08:33 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `busme`
--

-- --------------------------------------------------------

--
-- Table structure for table `busme_area`
--

CREATE TABLE IF NOT EXISTS `busme_area` (
  `Area_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Area_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=191 ;

--
-- Dumping data for table `busme_area`
--

INSERT INTO `busme_area` (`Area_ID`, `Name`) VALUES
(1, 'MPR Colony'),
(2, 'Qasba Colony'),
(3, 'Banaras Colony'),
(4, 'SITE'),
(5, 'Plaza'),
(6, 'Regal'),
(7, 'Shahr-e-Liaquat'),
(8, 'Tower'),
(9, 'Maripur'),
(10, 'Gulbai'),
(11, 'Sultanabad'),
(12, 'Azam Basti'),
(13, 'Kalapul Road'),
(14, 'Jinnah Hospital'),
(15, 'Saddar'),
(16, 'Numaish'),
(17, 'Gurumandir'),
(18, 'Islamia College'),
(19, 'Jail Chowrangi'),
(20, 'Sabzi Mandi'),
(21, 'Civic Center'),
(22, 'NIPA'),
(23, 'Safari Park'),
(24, 'Karachi University'),
(25, 'safura goth'),
(26, 'Naval Colony'),
(27, 'Ramswamy'),
(28, 'Garden'),
(29, 'Valika'),
(30, 'Orangi'),
(31, 'Frere Road'),
(32, 'Teen Hatti'),
(33, 'Nazimabad'),
(34, 'Paposh Nagar'),
(35, 'Abdullah College'),
(36, 'Metro Cinema'),
(37, 'Data Chowk'),
(38, 'Gora Kabaristan'),
(39, 'Nursery'),
(40, 'Baloch Pul'),
(41, 'Awami Markaz'),
(42, 'Karsaz'),
(43, 'Drigh Road'),
(44, 'Nata Khan'),
(45, 'Star Gate'),
(46, 'Malir Halt'),
(47, 'Tank Chowk'),
(48, 'Malir Cantt'),
(49, 'Gulshan-e-Hadeed'),
(50, 'FAST University'),
(51, 'Shah Latif Town'),
(52, 'Bhains Colony'),
(53, 'Manzil Pump'),
(54, 'Quaidabad'),
(55, 'High Court Malir'),
(56, 'Malir 15'),
(57, 'Kala board'),
(58, 'Lal Kothi'),
(59, 'Shahr-e-Millat'),
(60, 'Jamaluddin Afghani Road'),
(61, 'Khalid Bin Waleed Road'),
(62, 'PECHS'),
(63, 'Khudadad Colony'),
(64, 'MA Jinnah Road'),
(65, 'Burns Road'),
(66, 'Bandar Road'),
(67, 'Maymar Flats'),
(68, 'Sohrab Goth'),
(69, 'Water Pump'),
(70, 'Fazal Mills'),
(71, 'Rashid Minhas Road'),
(72, 'Moti Mahal'),
(73, 'urdu College'),
(74, 'Hasan Square'),
(75, 'Bahadurabad'),
(76, 'Tariq Road'),
(77, 'fleet Club'),
(78, 'Baghdadi'),
(79, 'Agra Taj Colony'),
(80, 'National Stadium'),
(81, 'NUST University'),
(82, 'Liaquatabad'),
(83, 'Manghopir Road'),
(84, 'Metroville'),
(85, 'Mominabad'),
(86, 'Faqeer Colony'),
(87, 'Abidabad'),
(88, 'Surjani Town'),
(89, 'UP More'),
(90, 'Nagin Chowrangi'),
(91, 'Power House'),
(92, 'Shafiq Mills'),
(93, 'Dawood Chowrangi'),
(94, 'Chawal Godown'),
(95, 'Sherpao Colony'),
(96, 'Geedar Colony'),
(97, 'Hospital Chowrangi'),
(98, 'Gul Ahmed Textile'),
(99, 'Akhtar Colony'),
(100, 'Cantt Station'),
(101, 'Ziauddin Road'),
(102, 'PIDC'),
(103, 'Masan Road'),
(104, 'Rashidabad'),
(105, 'Bihar Colony'),
(106, 'Ghani Chowrangi'),
(107, 'Shershah'),
(108, 'Chakiwara'),
(109, 'Lee Market'),
(110, 'Haji Camp Road'),
(111, 'Nishtar Road'),
(112, 'Karachi Court'),
(113, 'Sarwar Shaheed Road'),
(114, 'Masjid-e-Khizra'),
(115, 'Model Colony'),
(116, 'Punjab Chowrangi'),
(117, 'Gizri'),
(118, 'Saudi Embassy'),
(119, 'Abdullah Shah Ghazi'),
(120, 'Kimari'),
(121, 'Ayub Goth'),
(122, 'Saba Cinema'),
(123, 'Industrial Area'),
(124, 'Godhra'),
(125, 'Dastageer'),
(126, 'Azizabad'),
(127, 'Hussainabad'),
(128, 'Ghareebabad'),
(129, 'Lasbela'),
(130, 'Kharadar'),
(131, 'Clifton'),
(132, 'Hatim Alvi Road'),
(133, 'Submarine Chowrangi'),
(134, 'Punjab Colony'),
(135, 'Defence'),
(136, 'Sunset Boulevard'),
(137, 'Defence Mor'),
(138, 'Qayyumabad'),
(139, 'PIB Colony'),
(140, 'Hyderabad Colony'),
(141, 'Ingle Road'),
(142, 'Napier Road'),
(143, 'Soldier Bazaar'),
(144, 'Lilly Road'),
(145, 'Garden Road'),
(146, 'Lawrence Road'),
(147, 'Dockyard'),
(148, 'Pehalwan Goth'),
(149, 'Gulistan-e-Johar'),
(150, 'Aladeen Park'),
(151, 'Gulshan Chowrangi'),
(152, 'Do Minut Ki Chowrangi'),
(153, '4K Chowrangi'),
(154, 'Khuda Ki Basti'),
(155, 'PIA Society'),
(156, 'Johar Chowrangi'),
(157, 'Sakhi Hassan'),
(158, 'Hyderi'),
(159, 'KDA'),
(160, 'Masroor Base'),
(161, 'Teer Town'),
(162, 'Landhi'),
(163, 'Korangi'),
(164, 'Cantt Post Office'),
(165, 'Light House'),
(166, 'Bolten Market'),
(167, 'Saeedabad'),
(168, 'Itehad Town'),
(169, 'Defence View'),
(170, 'Baloch Colony'),
(171, 'Hill Park'),
(172, 'Hill Park Hospital'),
(173, 'Jail Chowrangi'),
(174, 'Gulshan-e-Iqbal'),
(175, 'Checkpost 6'),
(176, 'Checkpost 5'),
(177, 'Baqai'),
(178, 'Toll Plaza'),
(179, 'Korangi Base'),
(180, 'Godown Chowrangi'),
(181, 'Chamra Chowrangi'),
(182, 'Bilal Chowrangi'),
(183, 'Dar-ul-Uloom'),
(184, 'Murtaza Chowrangi'),
(185, 'Mansehra Colony'),
(186, 'Mizar-e-Quaid'),
(187, 'Civil Hospital'),
(188, 'Steel Mill'),
(189, 'Punjab Adda'),
(190, 'Teen Talwaar');

-- --------------------------------------------------------

--
-- Table structure for table `busme_bus`
--

CREATE TABLE IF NOT EXISTS `busme_bus` (
  `Bus_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bus_Name` varchar(20) NOT NULL,
  `Bus_Route` text NOT NULL,
  `Start_Time` varchar(15) NOT NULL,
  `Delay_Time` varchar(15) NOT NULL,
  `End_Time` varchar(15) NOT NULL,
  PRIMARY KEY (`Bus_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `busme_bus`
--

INSERT INTO `busme_bus` (`Bus_ID`, `Bus_Name`, `Bus_Route`, `Start_Time`, `Delay_Time`, `End_Time`) VALUES
(1, '1-C', 'MPR Colony,Qasba Colony,Banaras Colony,SITE,Plaza,Regal,Shahr-e-Liaquat,Tower,Maripur,Gulbai,Sultanabad', '7', '15', '10'),
(2, '11-C', 'Azam Basti,Kalapul Road,Jinnah Hospital,Saddar,Numaish,Gurumandir,Islamia College,Jail Chowrangi,Sabzi Mandi,Civic Center,NIPA,Safari Park,Karachi University,Safura Goth', '7', '10', '10'),
(3, '1-F', 'Naval Colony,Maripur,Gulbai,Tower,Ramswamy,Garden,Valika,Orangi', '7', '15', '10'),
(4, '1-G', 'Frere Road,Saddar,Gurumandir,Numaish,Teen Hatti,Nazimabad,Paposh Nagar,Abdullah College,Metro Cinema,Data Chowk', '7', '15', '10'),
(5, '9-C', 'Saddar,Gora Kabaristan,Nursery,Awami Markaz,Karsaz,Drigh Road,Nata Khan,Star Gate,Malir Halt,Tank Chowk,Malir Cantt', '7', '10', '10'),
(6, 'CNG Green Bus', 'Steel Mill,Gulshan-e-Hadeed,FAST University,Shah Latif Town,Bhens Colony,Manzil Pump,Quaidabad,High Court Malir,Malir 15,Kala Board,Malir Halt,Star Gate,Nata Khan,Drigh Road,Karsaz,Awami Markaz,Nursery,Gora Kabaristan,Saddar,Tower', '7', '15', '10'),
(7, '10-A', 'Lal Kothi,Nursery,Shahr-e-Millat,Jamaluddin Afghani Road,Khalid Bin Waleed Road,PECHS,Khudadad Colony,MA Jinnah Road,Frere Road,Burns Road,Bandar Road,Tower\r\n', '7', '10', '11'),
(8, '11-B', 'Maymar Flats,Sohrab Goth,Water Pump,Fazal Mills,Rashid Minhas Road,NIPA,Urdu College,Hasan Square,Bahadurabad,Tariq Road,Nursery,Gora Kabaristan,Fleet Club,Burns Road,MA Jinnah Road,Tower,Baghdadi,Agra Taj Colony', '7', '15', '10'),
(9, 'D-1', 'Quaidabad,High Court Malir,Malir 15,Malir Halt,Star Gate,Awami Markaz,Karsaz,NUST University,National Stadium,Hasan Square,Liaquatabad,Nazimabad,Manghopir Road,Metroville,Mominabad,Faqeer Colony,Abidabad', '7', '10', '10'),
(10, 'D-13', 'Surjani Town,UP More,Nagin Chowrangi,Power House,Sohrab Goth,Shafiq Mills,NIPA,Rashid Minhas Road,Drigh Road,Awami Markaz,Karsaz,Drigh Road,Nata Khan,Star Gate,Malir Halt,Kala Board,Malir 15,High Court Malir,Quaidabad,Dawood Chowrangi,Chawal Godown,Sherpao Colony', '7', '15', '10'),
(11, 'F-10', 'Geedar Colony,Hospital Chowrangi,Gul Ahmed Textile,Akhtar Colony,Kalapul Road,Jinnah Hospital,Cantt Station,Ziauddin Road,PIDC,Sultanabad,Masan Road', '7', '10', '11'),
(12, '22-A', 'Rashidabad,Bihar Colony,Ghani Chowrangi,Shershah,Chakiwara,Lee Market,Haji Camp Road,Nishter Road,Frere Road,Karachi Court,Sarwar Shaheed Road,Burns Road,MA Jinnah Road,Cantt Station', '7', '10', '10'),
(13, 'R-1', 'Malir Cantt,Model Colony,Malir Halt,Star Gate,Nata Khan,Drigh Road,Karsaz,Awami Markaz,Nursery,Gora Kabaristan,Jinnah Hospital,Cantt Station,Punjab Chowrangi,Gizri,Saudi Embassy,Abdullah Shah Gazi,Keemari,Tower', '7', '10', '10'),
(14, 'N', 'Ayub Goth,Saba Cinema,Industrial Area,Godhra,Power House,Dastageer,Azizabad,Hussainabad,Liaquatabad,Teen Hatti,Lasbela,Garden,Lee Market,Kharadar,Tower,Keamari,Clifton,Hatim Alvi Road,Submarine Chowrangi,Defence,Sunset Boulevard,Defence Mor,Akhtar Colony,Qayyumabad', '8', '10', '10'),
(15, '8-A', 'PIB Colony,Hyderabad Colony,Gurumandir,MA Jinnah Road,Frere Road,Ingle Road,Napier Road,Keamari', '7', '15', '10'),
(16, '8-B', 'PIB Colony,Hyderabad Colony,Gurumandir,Soldier Bazaar,Lilly Road,Garden Road,Lawrence Road,Napier Road,Bandar Road,Tower,Dockyard', '7', '15', '11'),
(17, '8-C', 'PIB Colony,Hyderabad Colony,Gurumandir,Soldier Bazaar,Lilly Road,Garden Road,Lawrence Road,Napier Road,Bandar Road,Tower,Keamari', '7', '10', '10'),
(18, 'Meshood', 'Pehlwan Goth,Gulistan-e-Johar,Aladeen Park,NIPA,Gulshan Chowrangi,Sohrab Goth,Nagin Chowrangi,UP More,Do Minut Ki Chowrangi,4K Chowrangi,Surjani Town,Khuda ki Basti,Teer Town', '7', '10', '10'),
(19, '7-K', 'Safura Goth,PIA Society,Pehlwan Goth,Johar Chowrangi,Aladeen Park,NIPA,Gulshan Chowrangi,Sohrab Goth,Power House,Nagan Chowrangi,Sakhi Hassan,Hyderi,KDA,Ghani Chowrangi,Shershah,Gulbai,Masroor Base', '7', '10', '11'),
(20, 'Ilyas', 'Landhi,Chawal Godown,Korangi,Qayyumabad,Akhtar Colony,Defence,Punjab Colony,Cantt Post Office,PIDC,Light House,Karachi Court,Bolton Market,Tower,Gulbai,Shershah,Saeedabad,Itehad Town', '7', '10', '10'),
(21, 'S-2', 'Korangi,Qayyumabad,Defence View,Baloch Colony,Hill Park,Hill Park Hospital,Tariq Road,Jail Chowrangi,Hasan Square,Urdu College,NIPA,Gulshan-e-Iqbal,Moti Mahal,Fazal Mills,Sohrab Goth,Power House,Godhra,Saba Town,Ayub Goth', '7', '10', '10'),
(22, 'M-Shuttle', 'Hospital Chowrangi,Quaidabad,High Court Malir,Malir 15,Kala Board,Malir Halt,Tank Chowk,Checkpost 6,Checkpost 5,Baqai,Toll Plaza', '7', '15', '10'),
(23, '16-A', 'Korangi Base,Korangi,Qayyumabad,Akhtar Colony,Defence Mor,Kala Pul,Gora Kabaristan,Nursery,Baloch Pul,Awami Markaz,Drigh Road,Nata Khan,Malir Halt,Kala Board,Malir 15,High Court Malir,Quaidabad', '7', '10', '10'),
(24, 'Marwat', 'Qayyumabad,Godown Chowrangi,Chamra Chowrangi,Bilal Chowrangi,Dar-ul-Uloom,Murtaza Chowrangi,Mansehra Colony,Dawood Chowrangi,Quaidabad,High Court Malir,Malir 15,Kala Board,Malir Halt,Star Gate,Nata Khan,Drigh Road,Karsaz,Awami Markaz,Nursery,Khudadad Colony,Mizar-e-Quaid,Plaza,Civil Hospital,Light House,Karachi Court,Bolton Market,Tower,Kharadar,Gulbai,Maripur', '7', '15', '10'),
(25, 'Muslim', 'Steel Mill,Gulshan-e-Hadeed,FAST University,Shah Latif Town,Bhens Colony,Manzil Pump,Quaidabad,High Court Malir,Malir 15,Kala Board,Malir Halt,Star Gate,Nata Khan,Drigh Road,Karsaz,Awami Markaz,Nursery,Gora Kabaristan,Saddar,Tower', '7', '10', '11'),
(26, 'Super Hasanzai', 'Azam Basti,Punjab Adda,Sohrab Goth,Gulshan Chowrangi,NIPA,Urdu College,Hasan Square,Jail Chowrangi,Tariq Road,Nursery,Gora Kabaristan,Jinnah Hospital,Cantt Station,Teen Talwaar,Clifton', '7', '15', '11');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
