-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2023 at 12:12 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `affiliate-alliance`
--

-- --------------------------------------------------------

--
-- Table structure for table `aa_alliance`
--

CREATE TABLE `aa_alliance` (
  `ID` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `aid` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `business_center` int NOT NULL DEFAULT '1',
  `left_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `right_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `left_node_count` int DEFAULT '0',
  `right_node_count` int DEFAULT '0',
  `parent_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `all_node_count_left` int NOT NULL DEFAULT '0',
  `all_node_count_right` int NOT NULL DEFAULT '0',
  `spos` enum('L','R','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `active_level` int NOT NULL DEFAULT '0',
  `active_circle` tinyint NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` bigint NOT NULL,
  `update_status` tinyint NOT NULL DEFAULT '0',
  `update_sync` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `aa_alliance`
--

INSERT INTO `aa_alliance` (`ID`, `user_id`, `aid`, `user_name`, `business_center`, `left_node`, `right_node`, `left_node_count`, `right_node_count`, `parent_node`, `all_node_count_left`, `all_node_count_right`, `spos`, `active_level`, `active_circle`, `updated`, `created_at`, `update_status`, `update_sync`) VALUES
(1, 0, 'X3410', 'ASMAUL HUSNA', 1, NULL, 'Z61000', 0, 13, '0', 0, 13, '0', 0, 0, '2023-09-18 14:57:37', 1694973600, 1, 1),
(5, 0, 'Z61000', 'AL AMIN JEWEL', 1, 'Z60978', 'Z60986', 4, 2, 'X3410', 7, 5, 'R', 2, 0, '2023-09-18 15:19:57', 1694973600, 1, 1),
(6, 0, 'Z60978', 'MOH ARIFUL ISLAM', 1, 'Z60979', 'Z60980', 0, 0, 'Z61000', 3, 3, 'L', 2, 0, '2023-09-18 15:20:58', 1694973600, 1, 1),
(7, 0, 'Z60986', 'MAMUN HOSEN', 1, 'Z60987', 'Z60988', 0, 2, 'Z61000', 1, 3, 'R', 1, 0, '2023-09-18 15:29:14', 1694973600, 1, 1),
(8, 0, 'Z60987', 'MERAJUL ISLAM', 1, NULL, NULL, 0, 0, 'Z60986', 0, 0, 'L', 0, 0, '2023-09-18 16:14:19', 1694973600, 1, 1),
(9, 0, 'Z60988', 'RAKIB HOSSAIN', 1, 'Z60995', 'Z60991', 0, 0, 'Z60986', 1, 1, 'R', 1, 0, '2023-09-18 16:15:40', 1694973600, 1, 1),
(10, 0, 'Z60979', 'SAJIBUL ISLAM', 1, 'Z62771', 'Z62205', 0, 0, 'Z60978', 1, 1, 'L', 1, 0, '2023-09-18 16:21:13', 1694973600, 1, 1),
(11, 0, 'Z60980', 'RAJON MODOK', 1, 'Z60981', 'Z60982', 0, 0, 'Z60978', 1, 1, 'R', 1, 0, '2023-09-20 13:41:07', 1695146400, 1, 1),
(12, 0, 'Z62771', 'FARZANA ISLAM ANU', 1, NULL, NULL, 0, 0, 'Z60979', 0, 0, 'L', 0, 0, '2023-09-20 14:40:53', 1695146400, 1, 1),
(13, 0, 'Z62205', 'ASHIK HOSEN', 1, NULL, NULL, 0, 0, 'Z60979', 0, 0, 'R', 0, 0, '2023-09-20 14:41:27', 1695146400, 1, 1),
(14, 0, 'Z60981', 'SAKIB UDDIN', 1, NULL, NULL, 0, 0, 'Z60980', 0, 0, 'L', 0, 0, '2023-09-20 16:07:06', 1695146400, 0, 1),
(15, 0, 'Z60982', 'SHIMLA KHANAM', 1, NULL, NULL, 0, 0, 'Z60980', 0, 0, 'R', 0, 0, '2023-09-20 16:09:33', 1695146400, 0, 1),
(16, 0, 'Z60995', 'OSMAN GONI', 1, NULL, NULL, 0, 0, 'Z60988', 0, 0, 'L', 0, 0, '2023-09-20 16:10:33', 1695146400, 0, 1),
(17, 0, 'Z60991', 'ABU HANIF', 1, NULL, NULL, 0, 0, 'Z60988', 0, 0, 'R', 0, 0, '2023-09-20 16:11:00', 1695146400, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aa_finance`
--

CREATE TABLE `aa_finance` (
  `ID` int NOT NULL,
  `aid` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `level` tinyint DEFAULT '0',
  `left_n` int NOT NULL DEFAULT '0',
  `right_n` int NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `aa_finance`
--

INSERT INTO `aa_finance` (`ID`, `aid`, `level`, `left_n`, `right_n`, `amount`, `ptype`, `update_at`, `created_at`) VALUES
(10, 'Z61000', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:03:47', '1694541600'),
(11, 'Z61000', 2, 2, 2, 2250, 'Cheque', '2023-09-20 10:03:47', '1694541600'),
(12, 'Z60978', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:03:47', '1694541600'),
(13, 'Z60986', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:03:47', '1694541600'),
(14, 'Z60979', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:03:47', '1694541600'),
(15, 'Z60978', 2, 2, 2, 2250, 'Cheque', '2023-09-20 10:17:25', '1695146400'),
(16, 'Z60988', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:17:25', '1695146400'),
(17, 'Z60980', 1, 1, 1, 1440, 'Cheque', '2023-09-20 10:17:26', '1695146400');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `aid` (`aid`,`parent_node`,`created_at`);

--
-- Indexes for table `aa_finance`
--
ALTER TABLE `aa_finance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `aid` (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `aa_finance`
--
ALTER TABLE `aa_finance`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
