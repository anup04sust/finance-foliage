-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 17, 2023 at 02:28 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
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
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
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

INSERT INTO `aa_alliance` (`ID`, `user_id`, `aid`, `user_name`, `business_center`, `left_node`, `right_node`, `left_node_count`, `right_node_count`, `parent_node`, `spos`, `wallet_amount`, `updated`, `created_at`) VALUES
(3, 21, '717086', 'Mohammad Amjad  Hossain', 1, '1136399', '1141543', 5, 4, '0', '0', 0, '2023-08-16 11:18:05', 1692144000),
(4, 22, '1136399', 'Salim  Hossain', 1, '1146291', '1153782', 3, 1, '717086', 'L', 0, '2023-08-16 11:22:34', 1692144000),
(5, 23, '1141543', 'Eyasin  Arafat', 1, '1152526', '1154311', 2, 1, '717086', 'R', 0, '2023-08-16 18:02:58', 1692144000),
(6, 24, '1146291', 'Zahidul  Islam', 1, NULL, '1146299', 0, 2, '1136399', 'L', 0, '2023-08-17 12:36:54', 1692230400),
(7, 25, '1146299', 'Shipon  Mia', 1, '1154306', NULL, 1, 0, '1146291', 'R', 0, '2023-08-17 12:38:16', 1692230400),
(8, 26, '1152526', 'Alomgir  Hossen', 1, '1153518', NULL, 1, 0, '1141543', 'L', 0, '2023-08-17 13:43:42', 1692230400),
(9, 27, '1153518', 'Saiful  Islam', 1, NULL, NULL, 0, 0, '1152526', 'L', 0, '2023-08-17 13:44:57', 1692230400),
(10, 28, '1153782', 'Shorif  Ahamed', 1, NULL, NULL, 0, 0, '1136399', 'R', 0, '2023-08-17 13:45:16', 1692230400),
(11, 29, '1154306', 'Fardous  Hossain', 1, NULL, NULL, 0, 0, '1146299', 'L', 0, '2023-08-17 13:45:41', 1692230400),
(12, 30, '1154311', 'Mohammad Riman Islam', 1, NULL, NULL, 0, 0, '1141543', 'R', 0, '2023-08-17 13:56:51', 1692230400);

-- --------------------------------------------------------

--
-- Table structure for table `aa_commentmeta`
--

CREATE TABLE `aa_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aa_comments`
--

CREATE TABLE `aa_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_comments`
--

INSERT INTO `aa_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2023-08-10 05:18:54', '2023-08-10 05:18:54', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aa_links`
--

CREATE TABLE `aa_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aa_options`
--

CREATE TABLE `aa_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_options`
--

INSERT INTO `aa_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://affiliate-alliance.me', 'yes'),
(2, 'home', 'http://affiliate-alliance.me', 'yes'),
(3, 'blogname', 'Affiliate Alliance', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'anup@themeperch.net', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:97:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=55&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:31:\"query-monitor/query-monitor.php\";i:1;s:35:\"finance-foliage/finance-foliage.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'affiliate-alliance', 'yes'),
(41, 'stylesheet', 'affiliate-alliance', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '55853', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '55', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1707196730', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'aa_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:15:\"finance_manager\";a:2:{s:4:\"name\";s:15:\"Finance Manager\";s:12:\"capabilities\";a:6:{s:4:\"read\";b:1;s:9:\"add_users\";b:1;s:12:\"create_users\";b:1;s:10:\"list_users\";b:1;s:10:\"edit_users\";b:1;s:12:\"upload_files\";b:1;}}s:13:\"finance_agent\";a:2:{s:4:\"name\";s:13:\"Finance Agent\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'user_count', '12', 'no'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:8:{i:1692281934;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1692292734;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1692292747;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1692335934;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1692335947;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1692335950;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1692856285;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(121, 'theme_mods_twentytwentythree', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1691667393;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(122, 'recovery_keys', 'a:1:{s:22:\"gfHRdDUgSDYriHEpH7tuXJ\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BEoT4d3wwzUaJUcW7eLkPURWspqyi90\";s:10:\"created_at\";i:1692164611;}}', 'yes'),
(123, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}', 'yes'),
(152, 'finished_updating_comment_type', '1', 'yes'),
(154, 'db_upgraded', '', 'yes'),
(157, 'can_compress_scripts', '1', 'yes');
INSERT INTO `aa_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(158, '_transient_wp_core_block_css_files', 'a:496:{i:0;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/editor-rtl.css\";i:1;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/editor-rtl.min.css\";i:2;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/editor.css\";i:3;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/editor.min.css\";i:4;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/style-rtl.css\";i:5;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/style-rtl.min.css\";i:6;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/style.css\";i:7;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/archives/style.min.css\";i:8;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/editor-rtl.css\";i:9;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/editor-rtl.min.css\";i:10;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/editor.css\";i:11;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/editor.min.css\";i:12;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/style-rtl.css\";i:13;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/style-rtl.min.css\";i:14;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/style.css\";i:15;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/style.min.css\";i:16;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/theme-rtl.css\";i:17;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/theme-rtl.min.css\";i:18;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/theme.css\";i:19;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/audio/theme.min.css\";i:20;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/editor-rtl.css\";i:21;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/editor-rtl.min.css\";i:22;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/editor.css\";i:23;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/editor.min.css\";i:24;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/style-rtl.css\";i:25;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/style-rtl.min.css\";i:26;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/style.css\";i:27;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/avatar/style.min.css\";i:28;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/block/editor-rtl.css\";i:29;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/block/editor-rtl.min.css\";i:30;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/block/editor.css\";i:31;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/block/editor.min.css\";i:32;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/editor-rtl.css\";i:33;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/editor-rtl.min.css\";i:34;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/editor.css\";i:35;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/editor.min.css\";i:36;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/style-rtl.css\";i:37;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/style-rtl.min.css\";i:38;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/style.css\";i:39;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/button/style.min.css\";i:40;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/editor-rtl.css\";i:41;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/editor-rtl.min.css\";i:42;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/editor.css\";i:43;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/editor.min.css\";i:44;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/style-rtl.css\";i:45;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/style-rtl.min.css\";i:46;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/style.css\";i:47;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/buttons/style.min.css\";i:48;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/calendar/style-rtl.css\";i:49;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/calendar/style-rtl.min.css\";i:50;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/calendar/style.css\";i:51;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/calendar/style.min.css\";i:52;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/editor-rtl.css\";i:53;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/editor-rtl.min.css\";i:54;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/editor.css\";i:55;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/editor.min.css\";i:56;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/style-rtl.css\";i:57;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/style-rtl.min.css\";i:58;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/style.css\";i:59;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/categories/style.min.css\";i:60;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/editor-rtl.css\";i:61;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/editor-rtl.min.css\";i:62;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/editor.css\";i:63;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/editor.min.css\";i:64;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/style-rtl.css\";i:65;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/style-rtl.min.css\";i:66;s:64:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/style.css\";i:67;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/style.min.css\";i:68;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/theme-rtl.css\";i:69;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/theme-rtl.min.css\";i:70;s:64:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/theme.css\";i:71;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/code/theme.min.css\";i:72;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/editor-rtl.css\";i:73;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/editor-rtl.min.css\";i:74;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/editor.css\";i:75;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/editor.min.css\";i:76;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/style-rtl.css\";i:77;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/style-rtl.min.css\";i:78;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/style.css\";i:79;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/columns/style.min.css\";i:80;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-content/style-rtl.css\";i:81;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-content/style-rtl.min.css\";i:82;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-content/style.css\";i:83;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-content/style.min.css\";i:84;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-template/style-rtl.css\";i:85;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-template/style-rtl.min.css\";i:86;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-template/style.css\";i:87;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comment-template/style.min.css\";i:88;s:92:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination-numbers/editor-rtl.css\";i:89;s:96:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination-numbers/editor-rtl.min.css\";i:90;s:88:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination-numbers/editor.css\";i:91;s:92:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination-numbers/editor.min.css\";i:92;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/editor-rtl.css\";i:93;s:88:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/editor-rtl.min.css\";i:94;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/editor.css\";i:95;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/editor.min.css\";i:96;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/style-rtl.css\";i:97;s:87:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/style-rtl.min.css\";i:98;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/style.css\";i:99;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-pagination/style.min.css\";i:100;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-title/editor-rtl.css\";i:101;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-title/editor-rtl.min.css\";i:102;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-title/editor.css\";i:103;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments-title/editor.min.css\";i:104;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/editor-rtl.css\";i:105;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/editor-rtl.min.css\";i:106;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/editor.css\";i:107;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/editor.min.css\";i:108;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/style-rtl.css\";i:109;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/style-rtl.min.css\";i:110;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/style.css\";i:111;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/comments/style.min.css\";i:112;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/editor-rtl.css\";i:113;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/editor-rtl.min.css\";i:114;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/editor.css\";i:115;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/editor.min.css\";i:116;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/style-rtl.css\";i:117;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/style-rtl.min.css\";i:118;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/style.css\";i:119;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/cover/style.min.css\";i:120;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/editor-rtl.css\";i:121;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/editor-rtl.min.css\";i:122;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/editor.css\";i:123;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/editor.min.css\";i:124;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/style-rtl.css\";i:125;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/style-rtl.min.css\";i:126;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/style.css\";i:127;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/details/style.min.css\";i:128;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/editor-rtl.css\";i:129;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/editor-rtl.min.css\";i:130;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/editor.css\";i:131;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/editor.min.css\";i:132;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/style-rtl.css\";i:133;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/style-rtl.min.css\";i:134;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/style.css\";i:135;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/style.min.css\";i:136;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/theme-rtl.css\";i:137;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/theme-rtl.min.css\";i:138;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/theme.css\";i:139;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/embed/theme.min.css\";i:140;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/editor-rtl.css\";i:141;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/editor-rtl.min.css\";i:142;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/editor.css\";i:143;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/editor.min.css\";i:144;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/style-rtl.css\";i:145;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/style-rtl.min.css\";i:146;s:64:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/style.css\";i:147;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/file/style.min.css\";i:148;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/footnotes/style-rtl.css\";i:149;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/footnotes/style-rtl.min.css\";i:150;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/footnotes/style.css\";i:151;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/footnotes/style.min.css\";i:152;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/freeform/editor-rtl.css\";i:153;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/freeform/editor-rtl.min.css\";i:154;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/freeform/editor.css\";i:155;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/freeform/editor.min.css\";i:156;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/editor-rtl.css\";i:157;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/editor-rtl.min.css\";i:158;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/editor.css\";i:159;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/editor.min.css\";i:160;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/style-rtl.css\";i:161;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/style-rtl.min.css\";i:162;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/style.css\";i:163;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/style.min.css\";i:164;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/theme-rtl.css\";i:165;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/theme-rtl.min.css\";i:166;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/theme.css\";i:167;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/gallery/theme.min.css\";i:168;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/editor-rtl.css\";i:169;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/editor-rtl.min.css\";i:170;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/editor.css\";i:171;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/editor.min.css\";i:172;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/style-rtl.css\";i:173;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/style-rtl.min.css\";i:174;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/style.css\";i:175;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/style.min.css\";i:176;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/theme-rtl.css\";i:177;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/theme-rtl.min.css\";i:178;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/theme.css\";i:179;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/group/theme.min.css\";i:180;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/heading/style-rtl.css\";i:181;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/heading/style-rtl.min.css\";i:182;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/heading/style.css\";i:183;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/heading/style.min.css\";i:184;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/html/editor-rtl.css\";i:185;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/html/editor-rtl.min.css\";i:186;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/html/editor.css\";i:187;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/html/editor.min.css\";i:188;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/editor-rtl.css\";i:189;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/editor-rtl.min.css\";i:190;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/editor.css\";i:191;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/editor.min.css\";i:192;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/style-rtl.css\";i:193;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/style-rtl.min.css\";i:194;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/style.css\";i:195;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/style.min.css\";i:196;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/theme-rtl.css\";i:197;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/theme-rtl.min.css\";i:198;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/theme.css\";i:199;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/image/theme.min.css\";i:200;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-comments/style-rtl.css\";i:201;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-comments/style-rtl.min.css\";i:202;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-comments/style.css\";i:203;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-comments/style.min.css\";i:204;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/editor-rtl.css\";i:205;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/editor-rtl.min.css\";i:206;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/editor.css\";i:207;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/editor.min.css\";i:208;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/style-rtl.css\";i:209;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/style-rtl.min.css\";i:210;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/style.css\";i:211;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/latest-posts/style.min.css\";i:212;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/list/style-rtl.css\";i:213;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/list/style-rtl.min.css\";i:214;s:64:\"/var/www/affiliate-alliance.me/wp-includes/blocks/list/style.css\";i:215;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/list/style.min.css\";i:216;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/editor-rtl.css\";i:217;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/editor-rtl.min.css\";i:218;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/editor.css\";i:219;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/editor.min.css\";i:220;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/style-rtl.css\";i:221;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/style-rtl.min.css\";i:222;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/style.css\";i:223;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/media-text/style.min.css\";i:224;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/more/editor-rtl.css\";i:225;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/more/editor-rtl.min.css\";i:226;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/more/editor.css\";i:227;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/more/editor.min.css\";i:228;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/editor-rtl.css\";i:229;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/editor-rtl.min.css\";i:230;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/editor.css\";i:231;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/editor.min.css\";i:232;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/style-rtl.css\";i:233;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/style-rtl.min.css\";i:234;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/style.css\";i:235;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-link/style.min.css\";i:236;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-submenu/editor-rtl.css\";i:237;s:87:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-submenu/editor-rtl.min.css\";i:238;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-submenu/editor.css\";i:239;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation-submenu/editor.min.css\";i:240;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/editor-rtl.css\";i:241;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/editor-rtl.min.css\";i:242;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/editor.css\";i:243;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/editor.min.css\";i:244;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/style-rtl.css\";i:245;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/style-rtl.min.css\";i:246;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/style.css\";i:247;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/navigation/style.min.css\";i:248;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/nextpage/editor-rtl.css\";i:249;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/nextpage/editor-rtl.min.css\";i:250;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/nextpage/editor.css\";i:251;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/nextpage/editor.min.css\";i:252;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/editor-rtl.css\";i:253;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/editor-rtl.min.css\";i:254;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/editor.css\";i:255;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/editor.min.css\";i:256;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/style-rtl.css\";i:257;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/style-rtl.min.css\";i:258;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/style.css\";i:259;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/page-list/style.min.css\";i:260;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/editor-rtl.css\";i:261;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/editor-rtl.min.css\";i:262;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/editor.css\";i:263;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/editor.min.css\";i:264;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/style-rtl.css\";i:265;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/style-rtl.min.css\";i:266;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/style.css\";i:267;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/paragraph/style.min.css\";i:268;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-author/style-rtl.css\";i:269;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-author/style-rtl.min.css\";i:270;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-author/style.css\";i:271;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-author/style.min.css\";i:272;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/editor-rtl.css\";i:273;s:87:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/editor-rtl.min.css\";i:274;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/editor.css\";i:275;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/editor.min.css\";i:276;s:82:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/style-rtl.css\";i:277;s:86:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/style-rtl.min.css\";i:278;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/style.css\";i:279;s:82:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-comments-form/style.min.css\";i:280;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-date/style-rtl.css\";i:281;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-date/style-rtl.min.css\";i:282;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-date/style.css\";i:283;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-date/style.min.css\";i:284;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/editor-rtl.css\";i:285;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/editor-rtl.min.css\";i:286;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/editor.css\";i:287;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/editor.min.css\";i:288;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/style-rtl.css\";i:289;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/style-rtl.min.css\";i:290;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/style.css\";i:291;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-excerpt/style.min.css\";i:292;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/editor-rtl.css\";i:293;s:88:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/editor-rtl.min.css\";i:294;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/editor.css\";i:295;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/editor.min.css\";i:296;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/style-rtl.css\";i:297;s:87:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/style-rtl.min.css\";i:298;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/style.css\";i:299;s:83:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-featured-image/style.min.css\";i:300;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-navigation-link/style-rtl.css\";i:301;s:88:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-navigation-link/style-rtl.min.css\";i:302;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-navigation-link/style.css\";i:303;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-navigation-link/style.min.css\";i:304;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/editor-rtl.css\";i:305;s:82:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/editor-rtl.min.css\";i:306;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/editor.css\";i:307;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/editor.min.css\";i:308;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/style-rtl.css\";i:309;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/style-rtl.min.css\";i:310;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/style.css\";i:311;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-template/style.min.css\";i:312;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-terms/style-rtl.css\";i:313;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-terms/style-rtl.min.css\";i:314;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-terms/style.css\";i:315;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-terms/style.min.css\";i:316;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-title/style-rtl.css\";i:317;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-title/style-rtl.min.css\";i:318;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-title/style.css\";i:319;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/post-title/style.min.css\";i:320;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/preformatted/style-rtl.css\";i:321;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/preformatted/style-rtl.min.css\";i:322;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/preformatted/style.css\";i:323;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/preformatted/style.min.css\";i:324;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/editor-rtl.css\";i:325;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/editor-rtl.min.css\";i:326;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/editor.css\";i:327;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/editor.min.css\";i:328;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/style-rtl.css\";i:329;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/style-rtl.min.css\";i:330;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/style.css\";i:331;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/style.min.css\";i:332;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/theme-rtl.css\";i:333;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/theme-rtl.min.css\";i:334;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/theme.css\";i:335;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/pullquote/theme.min.css\";i:336;s:89:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination-numbers/editor-rtl.css\";i:337;s:93:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination-numbers/editor-rtl.min.css\";i:338;s:85:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination-numbers/editor.css\";i:339;s:89:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination-numbers/editor.min.css\";i:340;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/editor-rtl.css\";i:341;s:85:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/editor-rtl.min.css\";i:342;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/editor.css\";i:343;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/editor.min.css\";i:344;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/style-rtl.css\";i:345;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/style-rtl.min.css\";i:346;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/style.css\";i:347;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-pagination/style.min.css\";i:348;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-title/style-rtl.css\";i:349;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-title/style-rtl.min.css\";i:350;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-title/style.css\";i:351;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query-title/style.min.css\";i:352;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query/editor-rtl.css\";i:353;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query/editor-rtl.min.css\";i:354;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query/editor.css\";i:355;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/query/editor.min.css\";i:356;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/style-rtl.css\";i:357;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/style-rtl.min.css\";i:358;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/style.css\";i:359;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/style.min.css\";i:360;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/theme-rtl.css\";i:361;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/theme-rtl.min.css\";i:362;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/theme.css\";i:363;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/quote/theme.min.css\";i:364;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/read-more/style-rtl.css\";i:365;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/read-more/style-rtl.min.css\";i:366;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/read-more/style.css\";i:367;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/read-more/style.min.css\";i:368;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/editor-rtl.css\";i:369;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/editor-rtl.min.css\";i:370;s:64:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/editor.css\";i:371;s:68:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/editor.min.css\";i:372;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/style-rtl.css\";i:373;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/style-rtl.min.css\";i:374;s:63:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/style.css\";i:375;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/rss/style.min.css\";i:376;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/editor-rtl.css\";i:377;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/editor-rtl.min.css\";i:378;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/editor.css\";i:379;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/editor.min.css\";i:380;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/style-rtl.css\";i:381;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/style-rtl.min.css\";i:382;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/style.css\";i:383;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/style.min.css\";i:384;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/theme-rtl.css\";i:385;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/theme-rtl.min.css\";i:386;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/theme.css\";i:387;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/search/theme.min.css\";i:388;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/editor-rtl.css\";i:389;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/editor-rtl.min.css\";i:390;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/editor.css\";i:391;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/editor.min.css\";i:392;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/style-rtl.css\";i:393;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/style-rtl.min.css\";i:394;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/style.css\";i:395;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/style.min.css\";i:396;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/theme-rtl.css\";i:397;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/theme-rtl.min.css\";i:398;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/theme.css\";i:399;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/separator/theme.min.css\";i:400;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/shortcode/editor-rtl.css\";i:401;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/shortcode/editor-rtl.min.css\";i:402;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/shortcode/editor.css\";i:403;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/shortcode/editor.min.css\";i:404;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/editor-rtl.css\";i:405;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/editor-rtl.min.css\";i:406;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/editor.css\";i:407;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/editor.min.css\";i:408;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/style-rtl.css\";i:409;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/style-rtl.min.css\";i:410;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/style.css\";i:411;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-logo/style.min.css\";i:412;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-tagline/editor-rtl.css\";i:413;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-tagline/editor-rtl.min.css\";i:414;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-tagline/editor.css\";i:415;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-tagline/editor.min.css\";i:416;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/editor-rtl.css\";i:417;s:79:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/editor-rtl.min.css\";i:418;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/editor.css\";i:419;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/editor.min.css\";i:420;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/style-rtl.css\";i:421;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/style-rtl.min.css\";i:422;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/style.css\";i:423;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/site-title/style.min.css\";i:424;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-link/editor-rtl.css\";i:425;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-link/editor-rtl.min.css\";i:426;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-link/editor.css\";i:427;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-link/editor.min.css\";i:428;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/editor-rtl.css\";i:429;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/editor-rtl.min.css\";i:430;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/editor.css\";i:431;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/editor.min.css\";i:432;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/style-rtl.css\";i:433;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/style-rtl.min.css\";i:434;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/style.css\";i:435;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/social-links/style.min.css\";i:436;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/editor-rtl.css\";i:437;s:75:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/editor-rtl.min.css\";i:438;s:67:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/editor.css\";i:439;s:71:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/editor.min.css\";i:440;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/style-rtl.css\";i:441;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/style-rtl.min.css\";i:442;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/style.css\";i:443;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/spacer/style.min.css\";i:444;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/editor-rtl.css\";i:445;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/editor-rtl.min.css\";i:446;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/editor.css\";i:447;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/editor.min.css\";i:448;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/style-rtl.css\";i:449;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/style-rtl.min.css\";i:450;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/style.css\";i:451;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/style.min.css\";i:452;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/theme-rtl.css\";i:453;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/theme-rtl.min.css\";i:454;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/theme.css\";i:455;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/table/theme.min.css\";i:456;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/tag-cloud/style-rtl.css\";i:457;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/tag-cloud/style-rtl.min.css\";i:458;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/tag-cloud/style.css\";i:459;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/tag-cloud/style.min.css\";i:460;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/editor-rtl.css\";i:461;s:82:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/editor-rtl.min.css\";i:462;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/editor.css\";i:463;s:78:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/editor.min.css\";i:464;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/theme-rtl.css\";i:465;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/theme-rtl.min.css\";i:466;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/theme.css\";i:467;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/template-part/theme.min.css\";i:468;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/term-description/style-rtl.css\";i:469;s:84:\"/var/www/affiliate-alliance.me/wp-includes/blocks/term-description/style-rtl.min.css\";i:470;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/term-description/style.css\";i:471;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/term-description/style.min.css\";i:472;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/editor-rtl.css\";i:473;s:81:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/editor-rtl.min.css\";i:474;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/editor.css\";i:475;s:77:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/editor.min.css\";i:476;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/style-rtl.css\";i:477;s:80:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/style-rtl.min.css\";i:478;s:72:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/style.css\";i:479;s:76:\"/var/www/affiliate-alliance.me/wp-includes/blocks/text-columns/style.min.css\";i:480;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/verse/style-rtl.css\";i:481;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/verse/style-rtl.min.css\";i:482;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/verse/style.css\";i:483;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/verse/style.min.css\";i:484;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/editor-rtl.css\";i:485;s:74:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/editor-rtl.min.css\";i:486;s:66:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/editor.css\";i:487;s:70:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/editor.min.css\";i:488;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/style-rtl.css\";i:489;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/style-rtl.min.css\";i:490;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/style.css\";i:491;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/style.min.css\";i:492;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/theme-rtl.css\";i:493;s:73:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/theme-rtl.min.css\";i:494;s:65:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/theme.css\";i:495;s:69:\"/var/www/affiliate-alliance.me/wp-includes/blocks/video/theme.min.css\";}', 'yes'),
(159, 'recently_activated', 'a:0:{}', 'yes'),
(165, 'recovery_mode_email_last_sent', '1692164611', 'yes'),
(166, 'finance_foliage_login_page_id', '5', 'yes'),
(168, 'finance_foliage_settings', 'a:9:{s:17:\"dashboard_page_id\";i:55;s:16:\"settings_page_id\";i:56;s:18:\"agentnodes_page_id\";i:57;s:22:\"finance_report_page_id\";i:58;s:13:\"login_page_id\";i:40;s:28:\"finance_report_print_page_id\";i:45;s:20:\"user_account_page_id\";i:54;s:24:\"agentnode_addnew_page_id\";i:59;s:24:\"agentnode_single_page_id\";i:60;}', 'yes'),
(172, 'mbup_keys', 'a:3:{s:32:\"1c83fd04b4abe0c7a1ee996c77eeddb5\";a:23:{s:2:\"id\";s:0:\"\";s:8:\"redirect\";s:0:\"\";s:7:\"form_id\";s:13:\"register-form\";s:13:\"recaptcha_key\";s:0:\"\";s:16:\"recaptcha_secret\";s:0:\"\";s:11:\"label_title\";s:0:\"\";s:14:\"label_username\";s:8:\"Username\";s:11:\"label_email\";s:5:\"Email\";s:14:\"label_password\";s:8:\"Password\";s:15:\"label_password2\";s:16:\"Confirm Password\";s:12:\"label_submit\";s:8:\"Register\";s:11:\"id_username\";s:10:\"user_login\";s:8:\"id_email\";s:10:\"user_email\";s:11:\"id_password\";s:9:\"user_pass\";s:12:\"id_password2\";s:10:\"user_pass2\";s:9:\"id_submit\";s:6:\"submit\";s:12:\"confirmation\";s:43:\"Your account has been created successfully.\";s:18:\"email_confirmation\";s:5:\"false\";s:17:\"password_strength\";s:6:\"strong\";s:17:\"email_as_username\";s:5:\"false\";s:16:\"show_if_user_can\";s:0:\"\";s:4:\"role\";s:0:\"\";s:11:\"append_role\";s:5:\"false\";}s:32:\"8a860234858b27b3d6ce825e951a4a68\";a:18:{s:8:\"redirect\";s:0:\"\";s:7:\"form_id\";s:10:\"login-form\";s:13:\"recaptcha_key\";s:0:\"\";s:16:\"recaptcha_secret\";s:0:\"\";s:11:\"label_title\";s:0:\"\";s:14:\"label_username\";s:25:\"Username or Email Address\";s:14:\"label_password\";s:8:\"Password\";s:14:\"label_remember\";s:11:\"Remember Me\";s:19:\"label_lost_password\";s:14:\"Lost Password?\";s:12:\"label_submit\";s:6:\"Log In\";s:11:\"id_username\";s:10:\"user_login\";s:11:\"id_password\";s:9:\"user_pass\";s:11:\"id_remember\";s:8:\"remember\";s:9:\"id_submit\";s:6:\"submit\";s:14:\"value_username\";s:0:\"\";s:14:\"value_remember\";b:0;s:12:\"confirmation\";s:22:\"You are now logged in.\";s:17:\"password_strength\";s:4:\"weak\";}s:32:\"7928b0ed7e841365cea7c320d0255bda\";a:18:{s:8:\"redirect\";s:28:\"http://affiliate-alliance.me\";s:7:\"form_id\";s:10:\"login-form\";s:13:\"recaptcha_key\";s:0:\"\";s:16:\"recaptcha_secret\";s:0:\"\";s:11:\"label_title\";s:0:\"\";s:14:\"label_username\";s:25:\"Username or Email Address\";s:14:\"label_password\";s:8:\"Password\";s:14:\"label_remember\";s:11:\"Remember Me\";s:19:\"label_lost_password\";s:14:\"Lost Password?\";s:12:\"label_submit\";s:6:\"Log In\";s:11:\"id_username\";s:10:\"user_login\";s:11:\"id_password\";s:9:\"user_pass\";s:11:\"id_remember\";s:8:\"remember\";s:9:\"id_submit\";s:6:\"submit\";s:14:\"value_username\";s:0:\"\";s:14:\"value_remember\";b:0;s:12:\"confirmation\";s:22:\"You are now logged in.\";s:17:\"password_strength\";s:4:\"weak\";}}', 'yes');
INSERT INTO `aa_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(181, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1692247987;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:31:\"query-monitor/query-monitor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:27:\"w.org/plugins/query-monitor\";s:4:\"slug\";s:13:\"query-monitor\";s:6:\"plugin\";s:31:\"query-monitor/query-monitor.php\";s:11:\"new_version\";s:6:\"3.13.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/query-monitor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/query-monitor.3.13.1.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:58:\"https://ps.w.org/query-monitor/assets/icon.svg?rev=2870124\";s:3:\"svg\";s:58:\"https://ps.w.org/query-monitor/assets/icon.svg?rev=2870124\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/query-monitor/assets/banner-1544x500.png?rev=2870124\";s:2:\"1x\";s:68:\"https://ps.w.org/query-monitor/assets/banner-772x250.png?rev=2457098\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.3\";}}s:7:\"checked\";a:4:{s:19:\"akismet/akismet.php\";s:3:\"5.2\";s:35:\"finance-foliage/finance-foliage.php\";s:5:\"1.0.0\";s:9:\"hello.php\";s:5:\"1.7.2\";s:31:\"query-monitor/query-monitor.php\";s:6:\"3.13.1\";}}', 'no'),
(182, 'current_theme', 'Affiliate Alliance', 'yes'),
(183, 'theme_mods_affiliate-alliance', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(184, 'theme_switched', '', 'yes'),
(194, '_transient_health-check-site-status-result', '{\"good\":16,\"recommended\":6,\"critical\":1}', 'yes'),
(233, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.3.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-6.3-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.3\";s:7:\"version\";s:3:\"6.3\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1692250611;s:15:\"version_checked\";s:3:\"6.3\";s:12:\"translations\";a:0:{}}', 'no'),
(247, '_site_transient_timeout_theme_roots', '1692252411', 'no'),
(248, '_site_transient_theme_roots', 'a:4:{s:18:\"affiliate-alliance\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no'),
(249, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1692250613;s:7:\"checked\";a:4:{s:18:\"affiliate-alliance\";s:3:\"1.8\";s:15:\"twentytwentyone\";s:3:\"1.8\";s:17:\"twentytwentythree\";s:3:\"1.1\";s:15:\"twentytwentytwo\";s:3:\"1.4\";}s:8:\"response\";a:1:{s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.2.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:9:\"no_update\";a:2:{s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.8.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.4.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `aa_postmeta`
--

CREATE TABLE `aa_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_postmeta`
--

INSERT INTO `aa_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 8, '_wp_trash_meta_status', 'publish'),
(4, 8, '_wp_trash_meta_time', '1691653162'),
(5, 8, '_wp_desired_post_slug', 'agent-nodes'),
(6, 6, '_wp_trash_meta_status', 'publish'),
(7, 6, '_wp_trash_meta_time', '1691653162'),
(8, 6, '_wp_desired_post_slug', 'dashboard'),
(9, 9, '_wp_trash_meta_status', 'publish'),
(10, 9, '_wp_trash_meta_time', '1691653162'),
(11, 9, '_wp_desired_post_slug', 'finance-report'),
(12, 3, '_wp_trash_meta_status', 'draft'),
(13, 3, '_wp_trash_meta_time', '1691653163'),
(14, 3, '_wp_desired_post_slug', 'privacy-policy'),
(15, 2, '_wp_trash_meta_status', 'publish'),
(16, 2, '_wp_trash_meta_time', '1691653163'),
(17, 2, '_wp_desired_post_slug', 'sample-page'),
(18, 7, '_wp_trash_meta_status', 'publish'),
(19, 7, '_wp_trash_meta_time', '1691653163'),
(20, 7, '_wp_desired_post_slug', 'settings'),
(21, 5, '_wp_trash_meta_status', 'publish'),
(22, 5, '_wp_trash_meta_time', '1691653163'),
(23, 5, '_wp_desired_post_slug', 'user-signin'),
(24, 20, '_wp_trash_meta_status', 'publish'),
(25, 20, '_wp_trash_meta_time', '1691653207'),
(26, 20, '_wp_desired_post_slug', 'agent-nodes'),
(27, 18, '_wp_trash_meta_status', 'publish'),
(28, 18, '_wp_trash_meta_time', '1691653207'),
(29, 18, '_wp_desired_post_slug', 'dashboard'),
(30, 21, '_wp_trash_meta_status', 'publish'),
(31, 21, '_wp_trash_meta_time', '1691653208'),
(32, 21, '_wp_desired_post_slug', 'finance-report'),
(33, 19, '_wp_trash_meta_status', 'publish'),
(34, 19, '_wp_trash_meta_time', '1691653208'),
(35, 19, '_wp_desired_post_slug', 'settings'),
(36, 17, '_wp_trash_meta_status', 'publish'),
(37, 17, '_wp_trash_meta_time', '1691653208'),
(38, 17, '_wp_desired_post_slug', 'user-signin'),
(39, 32, '_wp_trash_meta_status', 'publish'),
(40, 32, '_wp_trash_meta_time', '1691654862'),
(41, 32, '_wp_desired_post_slug', 'add-agent'),
(42, 30, '_wp_trash_meta_status', 'publish'),
(43, 30, '_wp_trash_meta_time', '1691654863'),
(44, 30, '_wp_desired_post_slug', 'agent-nodes'),
(45, 28, '_wp_trash_meta_status', 'publish'),
(46, 28, '_wp_trash_meta_time', '1691654863'),
(47, 28, '_wp_desired_post_slug', 'dashboard'),
(48, 31, '_wp_trash_meta_status', 'publish'),
(49, 31, '_wp_trash_meta_time', '1691654863'),
(50, 31, '_wp_desired_post_slug', 'finance-report'),
(51, 29, '_wp_trash_meta_status', 'publish'),
(52, 29, '_wp_trash_meta_time', '1691654863'),
(53, 29, '_wp_desired_post_slug', 'settings'),
(54, 27, '_wp_trash_meta_status', 'publish'),
(55, 27, '_wp_trash_meta_time', '1691654863'),
(56, 27, '_wp_desired_post_slug', 'user-signin'),
(57, 45, '_wp_trash_meta_status', 'publish'),
(58, 45, '_wp_trash_meta_time', '1691911577'),
(59, 45, '_wp_desired_post_slug', 'add-agent'),
(60, 43, '_wp_trash_meta_status', 'publish'),
(61, 43, '_wp_trash_meta_time', '1691911577'),
(62, 43, '_wp_desired_post_slug', 'agent-nodes'),
(63, 41, '_wp_trash_meta_status', 'publish'),
(64, 41, '_wp_trash_meta_time', '1691911578'),
(65, 41, '_wp_desired_post_slug', 'dashboard'),
(66, 44, '_wp_trash_meta_status', 'publish'),
(67, 44, '_wp_trash_meta_time', '1691911578'),
(68, 44, '_wp_desired_post_slug', 'finance-report'),
(69, 46, '_wp_trash_meta_status', 'publish'),
(70, 46, '_wp_trash_meta_time', '1691911578'),
(71, 46, '_wp_desired_post_slug', 'user-account'),
(72, 42, '_wp_trash_meta_status', 'publish'),
(73, 42, '_wp_trash_meta_time', '1691911578'),
(74, 42, '_wp_desired_post_slug', 'settings'),
(75, 40, '_wp_trash_meta_status', 'publish'),
(76, 40, '_wp_trash_meta_time', '1691911579'),
(77, 40, '_wp_desired_post_slug', 'user-signin');

-- --------------------------------------------------------

--
-- Table structure for table `aa_posts`
--

CREATE TABLE `aa_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_posts`
--

INSERT INTO `aa_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2023-08-10 05:18:54', '2023-08-10 05:18:54', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2023-08-10 05:18:54', '2023-08-10 05:18:54', '', 0, 'http://affiliate-alliance.me/?p=1', 0, 'post', '', 1),
(2, 1, '2023-08-10 05:18:54', '2023-08-10 05:18:54', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://affiliate-alliance.me/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 0, 'http://affiliate-alliance.me/?page_id=2', 0, 'page', '', 0),
(3, 1, '2023-08-10 05:18:54', '2023-08-10 05:18:54', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://affiliate-alliance.me.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'trash', 'closed', 'open', '', 'privacy-policy__trashed', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 0, 'http://affiliate-alliance.me/?page_id=3', 0, 'page', '', 0),
(5, 1, '2023-08-10 07:03:54', '2023-08-10 07:03:54', 'Test Page Content', 'Sign In', '', 'trash', 'closed', 'closed', '', 'user-signin__trashed', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 0, 'http://affiliate-alliance.me/user-signin/', 0, 'page', '', 0),
(6, 1, '2023-08-10 07:38:29', '2023-08-10 07:38:29', 'Dashboard shortcode', 'Dashboard', '', 'trash', 'closed', 'closed', '', 'dashboard__trashed', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 0, 'http://affiliate-alliance.me/dashboard/', 0, 'page', '', 0),
(7, 1, '2023-08-10 07:38:29', '2023-08-10 07:38:29', 'Dashboard shortcode', 'Settings', '', 'trash', 'closed', 'closed', '', 'settings__trashed', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 0, 'http://affiliate-alliance.me/settings/', 0, 'page', '', 0),
(8, 1, '2023-08-10 07:38:29', '2023-08-10 07:38:29', 'Agent Nodes shortcode', 'Agent Nodes', '', 'trash', 'closed', 'closed', '', 'agent-nodes__trashed', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 0, 'http://affiliate-alliance.me/agent-nodes/', 0, 'page', '', 0),
(9, 1, '2023-08-10 07:38:29', '2023-08-10 07:38:29', 'finance-report shortcode', 'Finance Report', '', 'trash', 'closed', 'closed', '', 'finance-report__trashed', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 0, 'http://affiliate-alliance.me/finance-report/', 0, 'page', '', 0),
(10, 1, '2023-08-10 07:39:22', '2023-08-10 07:39:22', 'Agent Nodes shortcode', 'Agent Nodes', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 8, 'http://affiliate-alliance.me/?p=10', 0, 'revision', '', 0),
(11, 1, '2023-08-10 07:39:22', '2023-08-10 07:39:22', 'Dashboard shortcode', 'Dashboard', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 6, 'http://affiliate-alliance.me/?p=11', 0, 'revision', '', 0),
(12, 1, '2023-08-10 07:39:22', '2023-08-10 07:39:22', 'finance-report shortcode', 'Finance Report', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2023-08-10 07:39:22', '2023-08-10 07:39:22', '', 9, 'http://affiliate-alliance.me/?p=12', 0, 'revision', '', 0),
(13, 1, '2023-08-10 07:39:23', '2023-08-10 07:39:23', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://affiliate-alliance.me.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 3, 'http://affiliate-alliance.me/?p=13', 0, 'revision', '', 0),
(14, 1, '2023-08-10 07:39:23', '2023-08-10 07:39:23', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://affiliate-alliance.me/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 2, 'http://affiliate-alliance.me/?p=14', 0, 'revision', '', 0),
(15, 1, '2023-08-10 07:39:23', '2023-08-10 07:39:23', 'Dashboard shortcode', 'Settings', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 7, 'http://affiliate-alliance.me/?p=15', 0, 'revision', '', 0),
(16, 1, '2023-08-10 07:39:23', '2023-08-10 07:39:23', 'Test Page Content', 'Sign In', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2023-08-10 07:39:23', '2023-08-10 07:39:23', '', 5, 'http://affiliate-alliance.me/?p=16', 0, 'revision', '', 0),
(17, 1, '2023-08-10 07:39:35', '2023-08-10 07:39:35', 'Login Form shortcode', 'Sign In', '', 'trash', 'closed', 'closed', '', 'user-signin__trashed-2', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 0, 'http://affiliate-alliance.me/user-signin/', 0, 'page', '', 0),
(18, 1, '2023-08-10 07:39:35', '2023-08-10 07:39:35', 'Dashboard shortcode', 'Dashboard', '', 'trash', 'closed', 'closed', '', 'dashboard__trashed-2', '', '', '2023-08-10 07:40:07', '2023-08-10 07:40:07', '', 0, 'http://affiliate-alliance.me/dashboard/', 0, 'page', '', 0),
(19, 1, '2023-08-10 07:39:36', '2023-08-10 07:39:36', 'Dashboard shortcode', 'Settings', '', 'trash', 'closed', 'closed', '', 'settings__trashed-2', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 0, 'http://affiliate-alliance.me/settings/', 0, 'page', '', 0),
(20, 1, '2023-08-10 07:39:36', '2023-08-10 07:39:36', 'Agent Nodes shortcode', 'Agent Nodes', '', 'trash', 'closed', 'closed', '', 'agent-nodes__trashed-2', '', '', '2023-08-10 07:40:07', '2023-08-10 07:40:07', '', 0, 'http://affiliate-alliance.me/agent-nodes/', 0, 'page', '', 0),
(21, 1, '2023-08-10 07:39:36', '2023-08-10 07:39:36', 'finance-report shortcode', 'Finance Report', '', 'trash', 'closed', 'closed', '', 'finance-report__trashed-2', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 0, 'http://affiliate-alliance.me/finance-report/', 0, 'page', '', 0),
(22, 1, '2023-08-10 07:40:07', '2023-08-10 07:40:07', 'Agent Nodes shortcode', 'Agent Nodes', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2023-08-10 07:40:07', '2023-08-10 07:40:07', '', 20, 'http://affiliate-alliance.me/?p=22', 0, 'revision', '', 0),
(23, 1, '2023-08-10 07:40:07', '2023-08-10 07:40:07', 'Dashboard shortcode', 'Dashboard', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2023-08-10 07:40:07', '2023-08-10 07:40:07', '', 18, 'http://affiliate-alliance.me/?p=23', 0, 'revision', '', 0),
(24, 1, '2023-08-10 07:40:08', '2023-08-10 07:40:08', 'finance-report shortcode', 'Finance Report', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 21, 'http://affiliate-alliance.me/?p=24', 0, 'revision', '', 0),
(25, 1, '2023-08-10 07:40:08', '2023-08-10 07:40:08', 'Dashboard shortcode', 'Settings', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 19, 'http://affiliate-alliance.me/?p=25', 0, 'revision', '', 0),
(26, 1, '2023-08-10 07:40:08', '2023-08-10 07:40:08', 'Login Form shortcode', 'Sign In', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2023-08-10 07:40:08', '2023-08-10 07:40:08', '', 17, 'http://affiliate-alliance.me/?p=26', 0, 'revision', '', 0),
(27, 1, '2023-08-10 07:40:57', '2023-08-10 07:40:57', 'Login Form shortcode', 'Sign In', '', 'trash', 'closed', 'closed', '', 'user-signin__trashed-3', '', '', '2023-08-10 08:07:44', '2023-08-10 08:07:44', '', 0, 'http://affiliate-alliance.me/user-signin/', 0, 'page', '', 0),
(28, 1, '2023-08-10 07:40:57', '2023-08-10 07:40:57', 'Dashboard shortcode', 'Dashboard', '', 'trash', 'closed', 'closed', '', 'dashboard__trashed-3', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 0, 'http://affiliate-alliance.me/dashboard/', 0, 'page', '', 0),
(29, 1, '2023-08-10 07:40:58', '2023-08-10 07:40:58', 'Dashboard shortcode', 'Settings', '', 'trash', 'closed', 'closed', '', 'settings__trashed-3', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 0, 'http://affiliate-alliance.me/settings/', 0, 'page', '', 0),
(30, 1, '2023-08-10 07:40:58', '2023-08-10 07:40:58', 'Agent Nodes shortcode', 'Agent Nodes', '', 'trash', 'closed', 'closed', '', 'agent-nodes__trashed-3', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 0, 'http://affiliate-alliance.me/agent-nodes/', 0, 'page', '', 0),
(31, 1, '2023-08-10 07:40:58', '2023-08-10 07:40:58', 'finance-report shortcode', 'Finance Report', '', 'trash', 'closed', 'closed', '', 'finance-report__trashed-3', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 0, 'http://affiliate-alliance.me/finance-report/', 0, 'page', '', 0),
(32, 1, '2023-08-10 07:40:58', '2023-08-10 07:40:58', 'add agent shortcode', 'Add Agent', '', 'trash', 'closed', 'closed', '', 'add-agent__trashed', '', '', '2023-08-10 08:07:42', '2023-08-10 08:07:42', '', 0, 'http://affiliate-alliance.me/add-agent/', 0, 'page', '', 0),
(33, 1, '2023-08-10 07:44:14', '2023-08-10 07:44:14', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2023-08-10 07:44:14', '2023-08-10 07:44:14', '', 0, 'http://affiliate-alliance.me/2023/08/10/navigation/', 0, 'wp_navigation', '', 0),
(34, 1, '2023-08-10 08:07:42', '2023-08-10 08:07:42', 'add agent shortcode', 'Add Agent', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2023-08-10 08:07:42', '2023-08-10 08:07:42', '', 32, 'http://affiliate-alliance.me/?p=34', 0, 'revision', '', 0),
(35, 1, '2023-08-10 08:07:43', '2023-08-10 08:07:43', 'Agent Nodes shortcode', 'Agent Nodes', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 30, 'http://affiliate-alliance.me/?p=35', 0, 'revision', '', 0),
(36, 1, '2023-08-10 08:07:43', '2023-08-10 08:07:43', 'Dashboard shortcode', 'Dashboard', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 28, 'http://affiliate-alliance.me/?p=36', 0, 'revision', '', 0),
(37, 1, '2023-08-10 08:07:43', '2023-08-10 08:07:43', 'finance-report shortcode', 'Finance Report', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 31, 'http://affiliate-alliance.me/?p=37', 0, 'revision', '', 0),
(38, 1, '2023-08-10 08:07:43', '2023-08-10 08:07:43', 'Dashboard shortcode', 'Settings', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2023-08-10 08:07:43', '2023-08-10 08:07:43', '', 29, 'http://affiliate-alliance.me/?p=38', 0, 'revision', '', 0),
(39, 1, '2023-08-10 08:07:44', '2023-08-10 08:07:44', 'Login Form shortcode', 'Sign In', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2023-08-10 08:07:44', '2023-08-10 08:07:44', '', 27, 'http://affiliate-alliance.me/?p=39', 0, 'revision', '', 0),
(40, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'Login Form shortcode', 'Sign In', '', 'trash', 'closed', 'closed', '', 'user-signin__trashed-4', '', '', '2023-08-13 07:26:19', '2023-08-13 07:26:19', '', 0, 'http://affiliate-alliance.me/user-signin/', 0, 'page', '', 0),
(41, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'Dashboard shortcode', 'Dashboard', '', 'trash', 'closed', 'closed', '', 'dashboard__trashed-4', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 0, 'http://affiliate-alliance.me/dashboard/', 0, 'page', '', 0),
(42, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'Dashboard shortcode', 'Settings', '', 'trash', 'closed', 'closed', '', 'settings__trashed-4', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 0, 'http://affiliate-alliance.me/settings/', 0, 'page', '', 0),
(43, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'Agent Nodes shortcode', 'Agent Nodes', '', 'trash', 'closed', 'closed', '', 'agent-nodes__trashed-4', '', '', '2023-08-13 07:26:17', '2023-08-13 07:26:17', '', 0, 'http://affiliate-alliance.me/agent-nodes/', 0, 'page', '', 0),
(44, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'finance-report shortcode', 'Finance Report', '', 'trash', 'closed', 'closed', '', 'finance-report__trashed-4', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 0, 'http://affiliate-alliance.me/finance-report/', 0, 'page', '', 0),
(45, 1, '2023-08-10 08:08:10', '2023-08-10 08:08:10', 'add agent shortcode', 'Add Agent', '', 'trash', 'closed', 'closed', '', 'add-agent__trashed-2', '', '', '2023-08-13 07:26:17', '2023-08-13 07:26:17', '', 0, 'http://affiliate-alliance.me/add-agent/', 0, 'page', '', 0),
(46, 1, '2023-08-10 08:35:49', '2023-08-10 08:35:49', 'Login Form shortcode', 'My Account', '', 'trash', 'closed', 'closed', '', 'user-account__trashed', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 0, 'http://affiliate-alliance.me/user-account/', 0, 'page', '', 0),
(47, 1, '2023-08-13 07:26:17', '2023-08-13 07:26:17', 'add agent shortcode', 'Add Agent', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2023-08-13 07:26:17', '2023-08-13 07:26:17', '', 45, 'http://affiliate-alliance.me/?p=47', 0, 'revision', '', 0),
(48, 1, '2023-08-13 07:26:17', '2023-08-13 07:26:17', 'Agent Nodes shortcode', 'Agent Nodes', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2023-08-13 07:26:17', '2023-08-13 07:26:17', '', 43, 'http://affiliate-alliance.me/?p=48', 0, 'revision', '', 0),
(49, 1, '2023-08-13 07:26:18', '2023-08-13 07:26:18', 'Dashboard shortcode', 'Dashboard', '', 'inherit', 'closed', 'closed', '', '41-revision-v1', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 41, 'http://affiliate-alliance.me/?p=49', 0, 'revision', '', 0),
(50, 1, '2023-08-13 07:26:18', '2023-08-13 07:26:18', 'finance-report shortcode', 'Finance Report', '', 'inherit', 'closed', 'closed', '', '44-revision-v1', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 44, 'http://affiliate-alliance.me/?p=50', 0, 'revision', '', 0),
(51, 1, '2023-08-13 07:26:18', '2023-08-13 07:26:18', 'Login Form shortcode', 'My Account', '', 'inherit', 'closed', 'closed', '', '46-revision-v1', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 46, 'http://affiliate-alliance.me/?p=51', 0, 'revision', '', 0),
(52, 1, '2023-08-13 07:26:18', '2023-08-13 07:26:18', 'Dashboard shortcode', 'Settings', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2023-08-13 07:26:18', '2023-08-13 07:26:18', '', 42, 'http://affiliate-alliance.me/?p=52', 0, 'revision', '', 0),
(53, 1, '2023-08-13 07:26:19', '2023-08-13 07:26:19', 'Login Form shortcode', 'Sign In', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2023-08-13 07:26:19', '2023-08-13 07:26:19', '', 40, 'http://affiliate-alliance.me/?p=53', 0, 'revision', '', 0),
(54, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'Login Form shortcode', 'My Account', '', 'publish', 'closed', 'closed', '', 'user-account', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/user-account/', 0, 'page', '', 0),
(55, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'Dashboard shortcode', 'Dashboard', '', 'publish', 'closed', 'closed', '', 'dashboard', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/dashboard/', 0, 'page', '', 0),
(56, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'Dashboard shortcode', 'Settings', '', 'publish', 'closed', 'closed', '', 'settings', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/settings/', 0, 'page', '', 0),
(57, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'Agent Nodes shortcode', 'Agent Nodes', '', 'publish', 'closed', 'closed', '', 'agent-nodes', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/agent-nodes/', 0, 'page', '', 0),
(58, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'finance-report shortcode', 'Finance Report', '', 'publish', 'closed', 'closed', '', 'finance-report', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/finance-report/', 0, 'page', '', 0),
(59, 1, '2023-08-13 07:26:28', '2023-08-13 07:26:28', 'add agent shortcode', 'Add Agent', '', 'publish', 'closed', 'closed', '', 'add-agent', '', '', '2023-08-13 07:26:28', '2023-08-13 07:26:28', '', 0, 'http://affiliate-alliance.me/add-agent/', 0, 'page', '', 0),
(60, 1, '2023-08-13 07:28:05', '2023-08-13 07:28:05', 'add agent shortcode', 'Agent info', '', 'publish', 'closed', 'closed', '', 'agent-info', '', '', '2023-08-13 07:28:05', '2023-08-13 07:28:05', '', 0, 'http://affiliate-alliance.me/agent-info/', 0, 'page', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aa_termmeta`
--

CREATE TABLE `aa_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aa_terms`
--

CREATE TABLE `aa_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_terms`
--

INSERT INTO `aa_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aa_term_relationships`
--

CREATE TABLE `aa_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_term_relationships`
--

INSERT INTO `aa_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aa_term_taxonomy`
--

CREATE TABLE `aa_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_term_taxonomy`
--

INSERT INTO `aa_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aa_usermeta`
--

CREATE TABLE `aa_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_usermeta`
--

INSERT INTO `aa_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'devteam'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'aa_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'aa_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"3967895c7d7ada78ee673f80de8a87401d7407d738bf19d01e2d022d0cdcc465\";a:4:{s:10:\"expiration\";i:1692854347;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:101:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36\";s:5:\"login\";i:1691644747;}}'),
(17, 1, 'aa_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(329, 20, 'nickname', 'finance_manager'),
(330, 20, 'first_name', 'Finance'),
(331, 20, 'last_name', 'manager'),
(332, 20, 'description', ''),
(333, 20, 'rich_editing', 'true'),
(334, 20, 'syntax_highlighting', 'true'),
(335, 20, 'comment_shortcuts', 'false'),
(336, 20, 'admin_color', 'fresh'),
(337, 20, 'use_ssl', '0'),
(338, 20, 'show_admin_bar_front', 'true'),
(339, 20, 'locale', ''),
(340, 20, 'aa_capabilities', 'a:1:{s:15:\"finance_manager\";b:1;}'),
(341, 20, 'aa_user_level', '0'),
(342, 20, 'dismissed_wp_pointers', ''),
(343, 20, 'session_tokens', 'a:1:{s:64:\"f1495a635d69e01e1fe60ef689741b9f44118f8c29e0c54ea2898f350801ea93\";a:4:{s:10:\"expiration\";i:1693371882;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/116.0\";s:5:\"login\";i:1692162282;}}'),
(344, 21, 'nickname', 'Mohammad Amjad Hossain'),
(345, 21, 'first_name', 'Mohammad'),
(346, 21, 'last_name', 'Hossain'),
(347, 21, 'description', ''),
(348, 21, 'rich_editing', 'true'),
(349, 21, 'syntax_highlighting', 'true'),
(350, 21, 'comment_shortcuts', 'false'),
(351, 21, 'admin_color', 'fresh'),
(352, 21, 'use_ssl', '0'),
(353, 21, 'show_admin_bar_front', 'true'),
(354, 21, 'locale', ''),
(355, 21, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(356, 21, 'aa_user_level', '0'),
(357, 21, 'dismissed_wp_pointers', ''),
(358, 21, '_agent_slno', '717086'),
(359, 21, '_agent_referral', '0'),
(360, 21, '_agent_created_at', '1692144000'),
(361, 22, 'nickname', 'Salim Hossain'),
(362, 22, 'first_name', 'Salim'),
(363, 22, 'last_name', 'Hossain'),
(364, 22, 'description', ''),
(365, 22, 'rich_editing', 'true'),
(366, 22, 'syntax_highlighting', 'true'),
(367, 22, 'comment_shortcuts', 'false'),
(368, 22, 'admin_color', 'fresh'),
(369, 22, 'use_ssl', '0'),
(370, 22, 'show_admin_bar_front', 'true'),
(371, 22, 'locale', ''),
(372, 22, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(373, 22, 'aa_user_level', '0'),
(374, 22, 'dismissed_wp_pointers', ''),
(375, 22, '_agent_slno', '1136399'),
(376, 22, '_agent_referral', '717086'),
(377, 22, '_agent_created_at', '1692144000'),
(378, 23, 'nickname', 'Eyasin Arafat'),
(379, 23, 'first_name', 'Eyasin'),
(380, 23, 'last_name', 'Arafat'),
(381, 23, 'description', ''),
(382, 23, 'rich_editing', 'true'),
(383, 23, 'syntax_highlighting', 'true'),
(384, 23, 'comment_shortcuts', 'false'),
(385, 23, 'admin_color', 'fresh'),
(386, 23, 'use_ssl', '0'),
(387, 23, 'show_admin_bar_front', 'true'),
(388, 23, 'locale', ''),
(389, 23, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(390, 23, 'aa_user_level', '0'),
(391, 23, 'dismissed_wp_pointers', ''),
(392, 23, '_agent_slno', '1141543'),
(393, 23, '_agent_referral', '717086'),
(394, 23, '_agent_created_at', '1692144000'),
(395, 24, 'nickname', 'Zahidul Islam'),
(396, 24, 'first_name', 'Zahidul'),
(397, 24, 'last_name', 'Islam'),
(398, 24, 'description', ''),
(399, 24, 'rich_editing', 'true'),
(400, 24, 'syntax_highlighting', 'true'),
(401, 24, 'comment_shortcuts', 'false'),
(402, 24, 'admin_color', 'fresh'),
(403, 24, 'use_ssl', '0'),
(404, 24, 'show_admin_bar_front', 'true'),
(405, 24, 'locale', ''),
(406, 24, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(407, 24, 'aa_user_level', '0'),
(408, 24, 'dismissed_wp_pointers', ''),
(409, 24, '_agent_slno', '1146291'),
(410, 24, '_agent_referral', '1136399'),
(411, 24, '_agent_created_at', '1692230400'),
(412, 25, 'nickname', 'Shipon Mia'),
(413, 25, 'first_name', 'Shipon'),
(414, 25, 'last_name', 'Mia'),
(415, 25, 'description', ''),
(416, 25, 'rich_editing', 'true'),
(417, 25, 'syntax_highlighting', 'true'),
(418, 25, 'comment_shortcuts', 'false'),
(419, 25, 'admin_color', 'fresh'),
(420, 25, 'use_ssl', '0'),
(421, 25, 'show_admin_bar_front', 'true'),
(422, 25, 'locale', ''),
(423, 25, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(424, 25, 'aa_user_level', '0'),
(425, 25, 'dismissed_wp_pointers', ''),
(426, 25, '_agent_slno', '1146299'),
(427, 25, '_agent_referral', '1146291'),
(428, 25, '_agent_created_at', '1692230400'),
(429, 26, 'nickname', 'Alomgir Hossen'),
(430, 26, 'first_name', 'Alomgir'),
(431, 26, 'last_name', 'Hossen'),
(432, 26, 'description', ''),
(433, 26, 'rich_editing', 'true'),
(434, 26, 'syntax_highlighting', 'true'),
(435, 26, 'comment_shortcuts', 'false'),
(436, 26, 'admin_color', 'fresh'),
(437, 26, 'use_ssl', '0'),
(438, 26, 'show_admin_bar_front', 'true'),
(439, 26, 'locale', ''),
(440, 26, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(441, 26, 'aa_user_level', '0'),
(442, 26, 'dismissed_wp_pointers', ''),
(443, 26, '_agent_slno', '1152526'),
(444, 26, '_agent_referral', '1141543'),
(445, 26, '_agent_created_at', '1692230400'),
(446, 27, 'nickname', 'Saiful Islam'),
(447, 27, 'first_name', 'Saiful'),
(448, 27, 'last_name', 'Islam'),
(449, 27, 'description', ''),
(450, 27, 'rich_editing', 'true'),
(451, 27, 'syntax_highlighting', 'true'),
(452, 27, 'comment_shortcuts', 'false'),
(453, 27, 'admin_color', 'fresh'),
(454, 27, 'use_ssl', '0'),
(455, 27, 'show_admin_bar_front', 'true'),
(456, 27, 'locale', ''),
(457, 27, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(458, 27, 'aa_user_level', '0'),
(459, 27, 'dismissed_wp_pointers', ''),
(460, 27, '_agent_slno', '1153518'),
(461, 27, '_agent_referral', '1152526'),
(462, 27, '_agent_created_at', '1692230400'),
(463, 28, 'nickname', 'Shorif Ahamed'),
(464, 28, 'first_name', 'Shorif'),
(465, 28, 'last_name', 'Ahamed'),
(466, 28, 'description', ''),
(467, 28, 'rich_editing', 'true'),
(468, 28, 'syntax_highlighting', 'true'),
(469, 28, 'comment_shortcuts', 'false'),
(470, 28, 'admin_color', 'fresh'),
(471, 28, 'use_ssl', '0'),
(472, 28, 'show_admin_bar_front', 'true'),
(473, 28, 'locale', ''),
(474, 28, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(475, 28, 'aa_user_level', '0'),
(476, 28, 'dismissed_wp_pointers', ''),
(477, 28, '_agent_slno', '1153782'),
(478, 28, '_agent_referral', '1136399'),
(479, 28, '_agent_created_at', '1692230400'),
(480, 29, 'nickname', 'Fardous Hossain'),
(481, 29, 'first_name', 'Fardous'),
(482, 29, 'last_name', 'Hossain'),
(483, 29, 'description', ''),
(484, 29, 'rich_editing', 'true'),
(485, 29, 'syntax_highlighting', 'true'),
(486, 29, 'comment_shortcuts', 'false'),
(487, 29, 'admin_color', 'fresh'),
(488, 29, 'use_ssl', '0'),
(489, 29, 'show_admin_bar_front', 'true'),
(490, 29, 'locale', ''),
(491, 29, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(492, 29, 'aa_user_level', '0'),
(493, 29, 'dismissed_wp_pointers', ''),
(494, 29, '_agent_slno', '1154306'),
(495, 29, '_agent_referral', '1146299'),
(496, 29, '_agent_created_at', '1692230400'),
(497, 30, 'nickname', 'Mohammad Riman Islam'),
(498, 30, 'first_name', 'Mohammad'),
(499, 30, 'last_name', 'Islam'),
(500, 30, 'description', ''),
(501, 30, 'rich_editing', 'true'),
(502, 30, 'syntax_highlighting', 'true'),
(503, 30, 'comment_shortcuts', 'false'),
(504, 30, 'admin_color', 'fresh'),
(505, 30, 'use_ssl', '0'),
(506, 30, 'show_admin_bar_front', 'true'),
(507, 30, 'locale', ''),
(508, 30, 'aa_capabilities', 'a:2:{s:10:\"subscriber\";b:1;s:13:\"finance_agent\";b:1;}'),
(509, 30, 'aa_user_level', '0'),
(510, 30, 'dismissed_wp_pointers', ''),
(511, 30, '_agent_slno', '1154311'),
(512, 30, '_agent_referral', '1141543'),
(513, 30, '_agent_created_at', '1692230400');

-- --------------------------------------------------------

--
-- Table structure for table `aa_users`
--

CREATE TABLE `aa_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `aa_users`
--

INSERT INTO `aa_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'devteam', '$P$Bpze6yb/W9d1B5qeul/CbboFTLHTq70', 'devteam', 'anup@themeperch.net', 'http://affiliate-alliance.me', '2023-08-10 05:18:53', '', 0, 'devteam'),
(20, 'finance_manager', '$P$BMMBylzgx1ljPIqpUV2hSYnFGYtMJL0', 'finance_manager', 'finance_manager@ttme.me', '', '2023-08-16 05:04:30', '1692162270:$P$BtqX2LarwGh3hDpChQ8flsnJijh/Wg/', 0, 'Finance manager'),
(21, '717086MohHos', '$P$Bv58tVI2DZ6gZj7aHvUQbI.eP8KgCu.', '717086mohhos', '717086MohHos@example.me', '', '2023-08-16 05:18:05', '', 0, 'Mohammad Amjad Hossain'),
(22, '1136399SalHos', '$P$BXiy.a3RDYFZa9chBaUsgb8L2HyrdU/', '1136399salhos', '1136399SalHos@example.me', '', '2023-08-16 05:22:33', '', 0, 'Salim Hossain'),
(23, '1141543EyaAra', '$P$Bn8EOmaTyKULSasrQyjx4KrUDapLv41', '1141543eyaara', '1141543EyaAra@example.me', '', '2023-08-16 12:02:57', '', 0, 'Eyasin Arafat'),
(24, '1146291ZahIsl', '$P$B2YkYK2lyGUuZ/JeCBSZMAuoRhRtLI0', '1146291zahisl', '1146291ZahIsl@example.me', '', '2023-08-17 06:36:53', '', 0, 'Zahidul Islam'),
(25, '1146299ShiMia', '$P$Bs2LHX/JLWQCEEXtfXqZbmh8/5dOFt.', '1146299shimia', '1146299ShiMia@example.me', '', '2023-08-17 06:38:15', '', 0, 'Shipon Mia'),
(26, '1152526AloHos', '$P$B6WbbKsGJKUFpP9f6R4mscRqgrGUny.', '1152526alohos', '1152526AloHos@example.me', '', '2023-08-17 07:43:41', '', 0, 'Alomgir Hossen'),
(27, '1153518SaiIsl', '$P$BXnaAhhAFZFbRxGHwUBUsALlpJyVL9/', '1153518saiisl', '1153518SaiIsl@example.me', '', '2023-08-17 07:44:56', '', 0, 'Saiful Islam'),
(28, '1153782ShoAha', '$P$BvzMwleN2FzmS7ETR97oZBcbI2O.Zb.', '1153782shoaha', '1153782ShoAha@example.me', '', '2023-08-17 07:45:16', '', 0, 'Shorif Ahamed'),
(29, '1154306FarHos', '$P$Be/ODxXocMqAwoPgVi61s533AX6Zup.', '1154306farhos', '1154306FarHos@example.me', '', '2023-08-17 07:45:40', '', 0, 'Fardous Hossain'),
(30, '1154311MohIsl', '$P$BIrerhQLvFQGDHkORGAaC1f3bZeJKc/', '1154311mohisl', '1154311MohIsl@example.me', '', '2023-08-17 07:56:50', '', 0, 'Mohammad Riman Islam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aa_commentmeta`
--
ALTER TABLE `aa_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `aa_comments`
--
ALTER TABLE `aa_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `aa_links`
--
ALTER TABLE `aa_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `aa_options`
--
ALTER TABLE `aa_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `aa_postmeta`
--
ALTER TABLE `aa_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `aa_posts`
--
ALTER TABLE `aa_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `aa_termmeta`
--
ALTER TABLE `aa_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `aa_terms`
--
ALTER TABLE `aa_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `aa_term_relationships`
--
ALTER TABLE `aa_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `aa_term_taxonomy`
--
ALTER TABLE `aa_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `aa_usermeta`
--
ALTER TABLE `aa_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `aa_users`
--
ALTER TABLE `aa_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aa_alliance`
--
ALTER TABLE `aa_alliance`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `aa_commentmeta`
--
ALTER TABLE `aa_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aa_comments`
--
ALTER TABLE `aa_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aa_links`
--
ALTER TABLE `aa_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aa_options`
--
ALTER TABLE `aa_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `aa_postmeta`
--
ALTER TABLE `aa_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `aa_posts`
--
ALTER TABLE `aa_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `aa_termmeta`
--
ALTER TABLE `aa_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aa_terms`
--
ALTER TABLE `aa_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aa_term_taxonomy`
--
ALTER TABLE `aa_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aa_usermeta`
--
ALTER TABLE `aa_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT for table `aa_users`
--
ALTER TABLE `aa_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
