-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2023 at 08:51 PM
-- Server version: 10.3.38-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uumitpro_wellpathing`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_results`
--

CREATE TABLE `tbl_results` (
  `result_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `sskm_score` int(3) NOT NULL,
  `sskm_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sskm_sentiasa` int(3) NOT NULL,
  `result_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_results`
--

INSERT INTO `tbl_results` (`result_id`, `user_id`, `sskm_score`, `sskm_level`, `sskm_sentiasa`, `result_date`) VALUES
(1, 0, 13, 'positive', 0, '2023-05-05 17:44:51.105590'),
(5, 8, 18, 'negative', 0, '2023-05-05 17:51:27.994878'),
(6, 8, 16, 'negative', 1, '2023-05-05 17:52:36.035084'),
(7, 8, 6, 'positive', 0, '2023-05-05 17:54:45.218113'),
(8, 8, 11, 'positive', 1, '2023-05-05 18:35:06.054591'),
(9, 8, 22, 'negative', 1, '2023-05-08 22:59:40.668947'),
(10, 8, 21, 'negative', 1, '2023-05-08 23:21:15.943711'),
(11, 8, 15, 'negative', 0, '2023-05-08 23:31:00.385550'),
(12, 0, 3, 'positive', 0, '2023-05-09 00:14:00.584817'),
(13, 0, 3, 'positive', 0, '2023-05-09 00:16:35.163484'),
(15, 0, 15, 'negative', 0, '2023-05-09 00:18:02.397300'),
(16, 0, 15, 'negative', 0, '2023-05-09 00:18:29.026115'),
(17, 0, 15, 'negative', 0, '2023-05-09 00:18:58.910583'),
(18, 0, 15, 'negative', 0, '2023-05-09 00:20:06.622671'),
(21, 0, 15, 'negative', 0, '2023-05-09 00:21:05.844465'),
(22, 0, 15, 'negative', 0, '2023-05-09 00:21:11.997942'),
(23, 0, 15, 'negative', 0, '2023-05-09 00:21:19.326654'),
(24, 0, 15, 'negative', 0, '2023-05-09 00:28:41.648955'),
(25, 0, 15, 'negative', 0, '2023-05-09 00:57:11.648136'),
(26, 0, 15, 'negative', 0, '2023-05-09 01:00:31.944272'),
(27, 0, 21, 'negative', 1, '2023-05-09 10:40:10.793606'),
(28, 8, 22, 'negative', 0, '2023-05-13 13:39:50.131135'),
(29, 8, 6, 'positive', 0, '2023-05-13 15:38:59.631907'),
(30, 8, 8, 'positive', 1, '2023-05-13 15:46:03.933363'),
(31, 8, 28, 'negative', 1, '2023-05-13 15:46:18.304632'),
(32, 8, 3, 'positive', 0, '2023-05-13 15:46:36.371992'),
(33, 8, 27, 'negative', 1, '2023-05-13 15:53:44.918625'),
(34, 8, 27, 'negative', 1, '2023-05-13 16:21:27.907635'),
(36, 8, 27, 'negative', 1, '2023-05-13 16:26:32.699929'),
(37, 8, 3, 'positive', 1, '2023-05-13 16:27:26.781921'),
(38, 8, 3, 'positive', 1, '2023-05-13 16:28:43.261567'),
(39, 8, 27, 'negative', 1, '2023-05-13 16:29:00.546104'),
(40, 8, 3, 'positive', 1, '2023-05-13 16:29:17.345267'),
(41, 8, 0, 'positive', 0, '2023-05-13 16:29:29.445328'),
(42, 8, 9, 'positive', 0, '2023-05-13 23:49:32.165069'),
(44, 0, 9, 'positive', 0, '2023-05-15 22:05:26.876987'),
(45, 21, 11, 'positive', 0, '2023-05-15 23:30:44.547010'),
(46, 22, 9, 'positive', 0, '2023-05-15 23:57:06.706883'),
(47, 23, 26, 'negative', 1, '2023-05-16 00:40:08.689513'),
(48, 24, 7, 'positive', 0, '2023-05-16 00:41:38.806066'),
(49, 24, 12, 'positive', 0, '2023-05-16 00:43:17.990550'),
(50, 24, 13, 'positive', 1, '2023-05-16 00:47:39.113286'),
(51, 0, 5, 'positive', 0, '2023-05-16 00:48:15.181343'),
(52, 25, 12, 'positive', 0, '2023-05-16 00:54:00.130716'),
(53, 0, 12, 'positive', 0, '2023-05-16 02:12:25.261535'),
(54, 0, 21, 'negative', 0, '2023-05-16 09:30:46.406043'),
(55, 26, 17, 'negative', 1, '2023-05-16 11:13:20.870163'),
(56, 8, 9, 'positive', 0, '2023-05-16 11:57:52.669678'),
(57, 8, 38, 'negative', 1, '2023-05-16 12:00:42.356337'),
(58, 0, 11, 'positive', 0, '2023-05-16 22:15:44.747615'),
(59, 0, 0, 'positive', 0, '2023-05-17 14:34:22.274480');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(6) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_role` varchar(10) NOT NULL,
  `user_matric` varchar(8) NOT NULL,
  `user_staffid` varchar(10) NOT NULL,
  `user_school` varchar(200) NOT NULL,
  `user_programme` varchar(300) NOT NULL,
  `user_department` varchar(200) NOT NULL,
  `user_datereg` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `user_otp` int(6) NOT NULL,
  `user_password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_email`, `user_name`, `user_role`, `user_matric`, `user_staffid`, `user_school`, `user_programme`, `user_department`, `user_datereg`, `user_otp`, `user_password`) VALUES
(7, 'staff1@gmail.com', 'staff1', 'Staff', 'na', '1234567', 'na', 'na', 'PKU', '2023-01-24 00:19:09.732104', 38862, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(8, 'max@gmail.com', 'max', 'Student', '277691', 'na', 'CAS', 'Bachelor of Information Tecnology', 'na', '2023-01-24 00:19:51.266606', 86201, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(9, 'min@gmail.com', 'min', 'Student', '123456', 'na', 'CAS', 'Bachelor of Information Tecnology', 'na', '2023-05-03 02:27:23.658163', 36214, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(10, 'stu@gmail.com', 'Student', 'Student', '123456', '', 'CAS', 'Bachelor of Information Tecnology', 'PKU', '2023-05-05 00:20:09.932784', 63726, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(13, 'stud@gmail.com', 'Student', 'Student', '123456', '', 'CAS', 'Bachelor of Information Tecnology', 'PKU', '2023-05-05 00:21:25.987182', 31638, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(14, 'studu@gmail.com', 'Student', 'Student', '123456', '', 'CAS', 'Bachelor of Information Tecnology', 'PKU', '2023-05-05 00:24:48.472129', 47475, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(15, 'studun@gmail.com', 'Student', 'Student', '123456', 'na', 'CAS', 'Bachelor of Information Tecnology', 'na', '2023-05-05 00:25:24.330542', 75281, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(16, 'staff@gmail.com', 'Student', 'Staff', 'na', '123456', 'na', 'na', 'PKU', '2023-05-05 00:25:50.292612', 77921, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(17, 'e@gmail.com', 'ewwd', 'Student', '123234', 'na', 'CAS', 'Bachelor of Information Tecnology', 'na', '2023-05-05 15:17:20.973058', 71552, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(21, 'mini@gmail.com', 'min', 'Student', '123456', 'na', 'COLGIS', 'Bachelor of Multimedia', 'na', '2023-05-15 23:29:47.544795', 51823, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(22, 'pku@gmail.com', 'pku', 'Staff', 'na', '123456', 'na', 'na', 'PKU', '2023-05-15 23:56:26.707832', 39720, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(23, 'uas@gmail.com', 'uas', 'Staff', 'na', '123456', 'na', 'na', 'UAssist', '2023-05-16 00:39:31.251257', 19124, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(24, 'lib@gmail.com', 'lib', 'Staff', 'na', '123456', 'na', 'na', 'Library', '2023-05-16 00:40:50.282679', 84388, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(25, 'spo@gmail.com', 'spo', 'Staff', 'na', '123456', 'na', 'na', 'Sport-Centre', '2023-05-16 00:53:32.007434', 20113, '9f1768929c8a85e7385dd1a6294ed7745620d124'),
(26, 'kimsiong1109@gmail.com', 'Tan KimSiong', 'Student', '279570', 'na', 'CAS', 'Bachelor of Multimedia', 'na', '2023-05-16 11:11:23.138536', 61623, '8ee13be6b00cccc2674e12e8df14ca5b6213a1cc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_results`
--
ALTER TABLE `tbl_results`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_results`
--
ALTER TABLE `tbl_results`
  MODIFY `result_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
