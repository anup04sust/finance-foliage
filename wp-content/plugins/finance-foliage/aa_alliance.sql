-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 14, 2023 at 02:31 PM
-- Server version: 8.0.33-0ubuntu0.22.04.4
-- PHP Version: 8.1.2-1ubuntu2.13

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
  `cid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `business_center` int NOT NULL DEFAULT '1',
  `left_node` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `right_node` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `left_node_count` bigint NOT NULL DEFAULT '0',
  `right_node_count` bigint DEFAULT '0',
  `parent_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `spos` enum('L','R','0') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `wallet_amount` float NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_alliance`
--

INSERT INTO `aa_alliance` (`ID`, `user_id`, `cid`, `user_name`, `business_center`, `left_node`, `right_node`, `left_node_count`, `right_node_count`, `parent_node`, `spos`, `wallet_amount`, `updated`, `created_at`) VALUES
(1, 11, 'asdas', 'asdasd', 1, NULL, NULL, 0, 0, '0', '0', 0, '2023-08-14 20:27:34', 1691971200),
(2, 19, 'z717086233333ww55rrrrrasdasd', 'Mohammad Amjad  Hossain', 1, NULL, NULL, 0, 0, '0', 'L', 0, '2023-08-14 20:30:58', 1691971200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
