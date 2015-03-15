-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2015 at 12:46 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `todo`
--
CREATE DATABASE IF NOT EXISTS `todo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `todo`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_02_22_121214_CreateTodosTable', 1),
('2015_02_22_121719_AddTodos', 2),
('2015_03_04_174747_create_oauth_scopes_table', 3),
('2015_03_04_174748_create_oauth_grants_table', 3),
('2015_03_04_174749_create_oauth_grant_scopes_table', 3),
('2015_03_04_174750_create_oauth_clients_table', 3),
('2015_03_04_174751_create_oauth_client_endpoints_table', 3),
('2015_03_04_174752_create_oauth_client_scopes_table', 3),
('2015_03_04_174753_create_oauth_client_grants_table', 3),
('2015_03_04_174754_create_oauth_sessions_table', 3),
('2015_03_04_174755_create_oauth_session_scopes_table', 3),
('2015_03_04_174756_create_oauth_auth_codes_table', 3),
('2015_03_04_174757_create_oauth_auth_code_scopes_table', 3),
('2015_03_04_174758_create_oauth_access_tokens_table', 3),
('2015_03_04_174759_create_oauth_access_token_scopes_table', 3),
('2015_03_04_174800_create_oauth_refresh_tokens_table', 3),
('2015_03_15_082636_updateTodoTable', 4),
('2015_03_15_083744_updateTodoTable', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_access_tokens_id_session_id_unique` (`id`,`session_id`),
  KEY `oauth_access_tokens_session_id_index` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `session_id`, `expire_time`, `created_at`, `updated_at`) VALUES
('0ig15KM0mwpTv0qEldRQ9LtOerMTCKyYXULhfUMt', 57, 1426415154, '2015-03-15 03:55:54', '2015-03-15 03:55:54'),
('5lr5yVF4zovvjMjpo8Lz2HVlWimd43wG5ylTgbNw', 2, 1425529678, '2015-03-04 21:57:58', '2015-03-04 21:57:58'),
('6KCwQSIclEvUInQ54XF9oFoVRgZeZ21Lhi8IrRZV', 49, 1426410852, '2015-03-15 02:44:12', '2015-03-15 02:44:12'),
('7RQ5pF1YrI0nAwNoLuuw6p4KCOONxrF67g4JUQU8', 20, 1425838370, '2015-03-08 11:42:50', '2015-03-08 11:42:50'),
('9r8YVsX2S7ToPdGMbozZOeormhvNs74nNLdOCzaw', 37, 1426095418, '2015-03-11 11:06:58', '2015-03-11 11:06:58'),
('9YH7K40IaXgUUwbifTXaHSf7HHKqzj7DT309TbVS', 29, 1426092167, '2015-03-11 10:12:47', '2015-03-11 10:12:47'),
('abclbTNOlIMPpbJjamDj2Ztj0sXKuDCzNPAey05p', 54, 1426414983, '2015-03-15 03:53:03', '2015-03-15 03:53:03'),
('afKQyvSqnsuf37JbTyQSJyy3SCSo36lYWIygdqHF', 17, 1425837096, '2015-03-08 11:21:36', '2015-03-08 11:21:36'),
('AoXArohkCkLAnsPQ3JOVWTYFIPWYLUnWWvbwXvaY', 50, 1426412418, '2015-03-15 03:10:18', '2015-03-15 03:10:18'),
('b6P2JVW4CmhyBaHTWdC7xdCB005oRqK622tWDErz', 65, 1426418132, '2015-03-15 04:45:32', '2015-03-15 04:45:32'),
('bnf2NqpdGFG9Caym94r2xCVSIz3W17YRK8Od54Co', 30, 1426092425, '2015-03-11 10:17:05', '2015-03-11 10:17:05'),
('Cn1dzMu3ehdPgwb7fHJN6WESvpfyZGllvwjKgH9d', 67, 1426419028, '2015-03-15 05:00:28', '2015-03-15 05:00:28'),
('CSCVerckrnEUlpJpt63Wiu1nMCWmF5kyPM5jC7jy', 55, 1426415042, '2015-03-15 03:54:02', '2015-03-15 03:54:02'),
('ddmymfBD5qDVf0jdECLUjSEvQ6NObmNdTsDsEMrQ', 64, 1426417933, '2015-03-15 04:42:13', '2015-03-15 04:42:13'),
('Emiglx9hn3dph46WvBdgVcnsOI61C2VZfhQ6ZMf4', 10, 1425728962, '2015-03-07 05:19:22', '2015-03-07 05:19:22'),
('fJ0EzXHij6OtROlIPbF393D9JKnJKN8J0q00OmLg', 70, 1426422570, '2015-03-15 05:59:30', '2015-03-15 05:59:30'),
('ftCakkxTiBdQdLRfEuTZwWGc7Ld7thM5NX6cWYq6', 76, 1426426990, '2015-03-15 07:13:10', '2015-03-15 07:13:10'),
('fZhvYqZa2x2jSJ7mZqsSYowfSlOSqUencMVpFAR5', 43, 1426401047, '2015-03-15 00:00:47', '2015-03-15 00:00:47'),
('GMkrTFh47pmX0UuXJg51lrNNg1ntZNLVCqBCSM4n', 42, 1426400313, '2015-03-14 23:48:33', '2015-03-14 23:48:33'),
('HovMhrxyqgKV9gMSrPsnBkZn9EWKfHm2fgaiKeV4', 34, 1426094683, '2015-03-11 10:54:43', '2015-03-11 10:54:43'),
('hpO30sKTwv33Lfb3SYDKXHUBR9bDUYaSCschJ1TU', 23, 1425920981, '2015-03-09 10:39:41', '2015-03-09 10:39:41'),
('hs8riOx0fP4RcCGpjAZPmw4QIdB5pjIkT4IrnSqb', 38, 1426096175, '2015-03-11 11:19:35', '2015-03-11 11:19:35'),
('hT2p4m8gSMX0aPbkhc8oLJHPSBYqH2jttBN63McH', 46, 1426401587, '2015-03-15 00:09:47', '2015-03-15 00:09:47'),
('i4TippXdGuOrJZoEastihfEXzo7WSbAZ7OmiTOv8', 12, 1425729338, '2015-03-07 05:25:38', '2015-03-07 05:25:38'),
('ioGYyjfiCnWA4xsKHtr8ybJkyvaBdhEHYVT9Be3p', 22, 1425920324, '2015-03-09 10:28:44', '2015-03-09 10:28:44'),
('iOSm01w6E7TN9WVXGvTPXm7xnpWVAnf8ukgo5wHP', 1, 1425529617, '2015-03-04 21:56:57', '2015-03-04 21:56:57'),
('K0WS3VzOs7N7keigSOQMObXOBgy7ctxZZ9PIh5TR', 7, 1425725399, '2015-03-07 04:19:59', '2015-03-07 04:19:59'),
('KBhGNsIQbcFsddoPVsgDWdt1OvfLy1TfKySSb8Vj', 25, 1425921373, '2015-03-09 10:46:13', '2015-03-09 10:46:13'),
('KEyJDjHhbn2SQx5qdwLbxSinUNDbTXwbWjYAmAeu', 18, 1425837339, '2015-03-08 11:25:39', '2015-03-08 11:25:39'),
('kqnbo3WTPkNZTY9pn167jmxAWTkHWXkiNr4S5jcD', 14, 1425835772, '2015-03-08 10:59:32', '2015-03-08 10:59:32'),
('kvWdlwQSAIwCeQHrlX04zTNaadPvXUCefTzDbdRx', 3, 1425709050, '2015-03-06 23:47:30', '2015-03-06 23:47:30'),
('MDiOUMfr5fDN0H7HwitWYrcFbKoBrerdywgbPg6o', 24, 1425921196, '2015-03-09 10:43:16', '2015-03-09 10:43:16'),
('MspD89jCeK8zClgqeOUe8KjSLHjOJN4AI2kIqBni', 40, 1426098415, '2015-03-11 11:56:55', '2015-03-11 11:56:55'),
('mwJfV28Xcc464mp7gBCZiaZ7P0OoDqHAcw7RzPFh', 39, 1426096646, '2015-03-11 11:27:26', '2015-03-11 11:27:26'),
('n5Sn1u3D26Cugb7TjRHMcbxAuY4oygK9WvpPGAuy', 4, 1425718402, '2015-03-07 02:23:22', '2015-03-07 02:23:22'),
('NK3LjlA36T7rjiMcn7DozpGjT92M1EddPtIhp127', 21, 1425919668, '2015-03-09 10:17:48', '2015-03-09 10:17:48'),
('nLagPdI1KwiDPW54774ZZMSEof6Hn203JLWa7IHC', 51, 1426414413, '2015-03-15 03:43:33', '2015-03-15 03:43:33'),
('NqcFauIw1jjew6KcCc1VMOpR2KBbv300hy7eZ2dA', 35, 1426095070, '2015-03-11 11:01:10', '2015-03-11 11:01:10'),
('Nu1oedetGCv0cL0MW9ea3ADU1wz1VW4gxWHYWGH1', 47, 1426402472, '2015-03-15 00:24:32', '2015-03-15 00:24:32'),
('nzfw7U0emj5LrEn3fwlMmTdxfCqkQ4rsn0RPSDCy', 13, 1425834567, '2015-03-08 10:39:27', '2015-03-08 10:39:27'),
('okc4sigc79yjzY8fHyvWOFbq8GjWOJIEkZVP2gQz', 15, 1425836683, '2015-03-08 11:14:43', '2015-03-08 11:14:43'),
('OKKwjd0L87A2f8Wg3Ij5wy23BsyJNDoAQDCsZh1r', 53, 1426414912, '2015-03-15 03:51:52', '2015-03-15 03:51:52'),
('phEAbD5iTkQy9lBrDLVsSwYXlfzGIoY7M2oh5kKb', 48, 1426402604, '2015-03-15 00:26:44', '2015-03-15 00:26:44'),
('PhN6bWtz7FzBCaEGk80VkEgFPKNXIMrdH6JnTgUC', 75, 1426426160, '2015-03-15 06:59:20', '2015-03-15 06:59:20'),
('piz1x0bP5dExgvwkKIA0QKe5TPwLLGpXPukpzET1', 69, 1426420181, '2015-03-15 05:19:41', '2015-03-15 05:19:41'),
('QDnd15BAOVJbh19XhEy85VSJeZsVJQkuJDKJUlsM', 74, 1426424649, '2015-03-15 06:34:09', '2015-03-15 06:34:09'),
('qedKYVDJFfTo3vLsXpBSmN34YsCvJ5d3tWHDFwOF', 36, 1426095221, '2015-03-11 11:03:41', '2015-03-11 11:03:41'),
('QLIk4xq90XdlDR4jU5ZsJD2L7qPj7fThOwbKW8zt', 63, 1426417909, '2015-03-15 04:41:49', '2015-03-15 04:41:49'),
('Qo85UfnTMPWmY6RHVvGe4PuvpYIUTqGchEY7D0Vy', 41, 1426400094, '2015-03-14 23:44:54', '2015-03-14 23:44:54'),
('qUDhstl7nuYGkkIH6PAbxTH3ARp6XYLWVGguFpxu', 26, 1425921627, '2015-03-09 10:50:27', '2015-03-09 10:50:27'),
('QVemwEZuOq3xtNq1Z4WHAY6W05EVb7BiQJ1P0t6V', 6, 1425724452, '2015-03-07 04:04:12', '2015-03-07 04:04:12'),
('QvU0w3thzkif4YfJVHytr0Vn2hdtWI1ttwENlJel', 52, 1426414554, '2015-03-15 03:45:54', '2015-03-15 03:45:54'),
('rfRqIdJnd5vStCrFPF7VWnNr4HQN61yxyF3Vc9Bu', 16, 1425836798, '2015-03-08 11:16:38', '2015-03-08 11:16:38'),
('RKy3L4Ro22nF1dUw57XLi6lUpTWytYPsHRszXLfl', 66, 1426419008, '2015-03-15 05:00:08', '2015-03-15 05:00:08'),
('SCoEzn5e1LptY4Xnj3MOyUZnthgvbALEuBCJFsbc', 32, 1426093208, '2015-03-11 10:30:08', '2015-03-11 10:30:08'),
('SMEj5uilaZVS0jOhblqm9984mXANQnM7XK748J2L', 68, 1426419746, '2015-03-15 05:12:26', '2015-03-15 05:12:26'),
('sO2IWDR6mFAX6ENaCLNqTSzUZEgJhY6AsOBWyi30', 71, 1426424004, '2015-03-15 06:23:24', '2015-03-15 06:23:24'),
('SUF3ThPHYwj2yHcjfYFJIyq2ppCvP37WKDYE6BxO', 5, 1425724217, '2015-03-07 04:00:17', '2015-03-07 04:00:17'),
('SyrtACbrrFWwXEakTGjo5Wq7KTyy8oE0MfDzih0D', 44, 1426401309, '2015-03-15 00:05:09', '2015-03-15 00:05:09'),
('T7hRY6M17jv5uBnyiDp9Rr7AZ0LkRiVzRHhZGUJq', 31, 1426092543, '2015-03-11 10:19:03', '2015-03-11 10:19:03'),
('t83UVxZ77wJcum8PjoxVbi1aO22GWgkFb6tPPUDv', 59, 1426416836, '2015-03-15 04:23:56', '2015-03-15 04:23:56'),
('u4WB0XXy0ekBF21qweGAMfIFZjqYzWGD6O0ujt3w', 62, 1426417790, '2015-03-15 04:39:50', '2015-03-15 04:39:50'),
('uA6wdNP4FAZdlBeXtYhjR3Q4wcX8asBFteTyBc5g', 58, 1426415234, '2015-03-15 03:57:14', '2015-03-15 03:57:14'),
('uP5SOrJv09vcBtWwrUyFzsUmx8CRIeqprCnpmcu1', 28, 1425922900, '2015-03-09 11:11:40', '2015-03-09 11:11:40'),
('UUBOJN7RyuJiLc1TroGhJSn3H8BW3CKL3KAxIzdc', 60, 1426417344, '2015-03-15 04:32:24', '2015-03-15 04:32:24'),
('uwEWBqT67CsHJpGT3wKJGymPfKTsUHwcp7OCujn0', 73, 1426424572, '2015-03-15 06:32:52', '2015-03-15 06:32:52'),
('VsoAqeQgc42uPf7allgtOTvCecXEHIFoM8LEDsP6', 11, 1425729199, '2015-03-07 05:23:19', '2015-03-07 05:23:19'),
('wEuAbdCFW0hHCNsC4ySemSC5pQJm0KuzB28zeWzj', 9, 1425728043, '2015-03-07 05:04:03', '2015-03-07 05:04:03'),
('Wlfis0oQ51GQIY70bgFzDz6ZnvdAzDmmcCQxD2BM', 27, 1425922150, '2015-03-09 10:59:10', '2015-03-09 10:59:10'),
('xJ92N1YmBCHVRHnnJctYzWYvYRlpy20ksgEgYQKS', 8, 1425727468, '2015-03-07 04:54:28', '2015-03-07 04:54:28'),
('yulbcu7i1crjxtzIC7mhcH7H7jtnBNHRIDCq13lZ', 61, 1426417459, '2015-03-15 04:34:19', '2015-03-15 04:34:19'),
('ZcQHQeFi57uLpyrdOxPUIyHuJ9CIB1jnHVXzwpFL', 33, 1426094384, '2015-03-11 10:49:44', '2015-03-11 10:49:44'),
('Zi659scWn9f6vVRHCLKSa7iWduaALKDuP5nRYX0z', 56, 1426415099, '2015-03-15 03:54:59', '2015-03-15 03:54:59'),
('ziB4C8hLfBkTwf03qdHMwAwyXWB8bZVWnqBEb0mM', 19, 1425838091, '2015-03-08 11:38:11', '2015-03-08 11:38:11'),
('ZoXSMQ2V9qqJX7LLOVggCtPqhJyx4dFV4OUr4PRr', 72, 1426424483, '2015-03-15 06:31:23', '2015-03-15 06:31:23'),
('ztzxAdcmIATAWVUT8n8glAZTOsfL3x8BAJTliWea', 45, 1426401504, '2015-03-15 00:08:24', '2015-03-15 00:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_access_token_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_access_token_scopes_access_token_id_index` (`access_token_id`),
  KEY `oauth_access_token_scopes_scope_id_index` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_session_id_index` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_code_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_code_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_code_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_auth_code_scopes_auth_code_id_index` (`auth_code_id`),
  KEY `oauth_auth_code_scopes_scope_id_index` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_clients_id_secret_unique` (`id`,`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `secret`, `name`, `created_at`, `updated_at`) VALUES
('9DShVqiCL1stI2MF', 'KofpisFuTu0Yy6aJofGW33msjBcYxN3l', 'foo@foo.com', '2015-03-04 13:30:13', '2015-03-04 13:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_endpoints`
--

CREATE TABLE IF NOT EXISTS `oauth_client_endpoints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_client_endpoints_client_id_redirect_uri_unique` (`client_id`,`redirect_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_grants`
--

CREATE TABLE IF NOT EXISTS `oauth_client_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_grants_client_id_index` (`client_id`),
  KEY `oauth_client_grants_grant_id_index` (`grant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_client_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_scopes_client_id_index` (`client_id`),
  KEY `oauth_client_scopes_scope_id_index` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_grants`
--

CREATE TABLE IF NOT EXISTS `oauth_grants` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_grant_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_grant_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_grant_scopes_grant_id_index` (`grant_id`),
  KEY `oauth_grant_scopes_scope_id_index` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`access_token_id`),
  UNIQUE KEY `oauth_refresh_tokens_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_sessions`
--

CREATE TABLE IF NOT EXISTS `oauth_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` enum('client','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_redirect_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_sessions_client_id_owner_type_owner_id_index` (`client_id`,`owner_type`,`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=77 ;

--
-- Dumping data for table `oauth_sessions`
--

INSERT INTO `oauth_sessions` (`id`, `client_id`, `owner_type`, `owner_id`, `client_redirect_uri`, `created_at`, `updated_at`) VALUES
(1, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-04 21:56:57', '2015-03-04 21:56:57'),
(2, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-04 21:57:58', '2015-03-04 21:57:58'),
(3, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-06 23:47:30', '2015-03-06 23:47:30'),
(4, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 02:23:22', '2015-03-07 02:23:22'),
(5, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 04:00:17', '2015-03-07 04:00:17'),
(6, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 04:04:12', '2015-03-07 04:04:12'),
(7, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 04:19:59', '2015-03-07 04:19:59'),
(8, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 04:54:28', '2015-03-07 04:54:28'),
(9, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 05:04:03', '2015-03-07 05:04:03'),
(10, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 05:19:22', '2015-03-07 05:19:22'),
(11, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 05:23:19', '2015-03-07 05:23:19'),
(12, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-07 05:25:38', '2015-03-07 05:25:38'),
(13, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 10:39:27', '2015-03-08 10:39:27'),
(14, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 10:59:32', '2015-03-08 10:59:32'),
(15, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:14:43', '2015-03-08 11:14:43'),
(16, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:16:38', '2015-03-08 11:16:38'),
(17, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:21:36', '2015-03-08 11:21:36'),
(18, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:25:39', '2015-03-08 11:25:39'),
(19, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:38:11', '2015-03-08 11:38:11'),
(20, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-08 11:42:50', '2015-03-08 11:42:50'),
(21, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:17:48', '2015-03-09 10:17:48'),
(22, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:28:44', '2015-03-09 10:28:44'),
(23, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:39:41', '2015-03-09 10:39:41'),
(24, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:43:16', '2015-03-09 10:43:16'),
(25, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:46:13', '2015-03-09 10:46:13'),
(26, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:50:27', '2015-03-09 10:50:27'),
(27, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 10:59:10', '2015-03-09 10:59:10'),
(28, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-09 11:11:40', '2015-03-09 11:11:40'),
(29, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:12:47', '2015-03-11 10:12:47'),
(30, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:17:05', '2015-03-11 10:17:05'),
(31, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:19:03', '2015-03-11 10:19:03'),
(32, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:30:08', '2015-03-11 10:30:08'),
(33, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:49:44', '2015-03-11 10:49:44'),
(34, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 10:54:43', '2015-03-11 10:54:43'),
(35, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:01:10', '2015-03-11 11:01:10'),
(36, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:03:41', '2015-03-11 11:03:41'),
(37, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:06:58', '2015-03-11 11:06:58'),
(38, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:19:35', '2015-03-11 11:19:35'),
(39, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:27:26', '2015-03-11 11:27:26'),
(40, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-11 11:56:55', '2015-03-11 11:56:55'),
(41, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-14 23:44:54', '2015-03-14 23:44:54'),
(42, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-14 23:48:33', '2015-03-14 23:48:33'),
(43, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:00:47', '2015-03-15 00:00:47'),
(44, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:05:09', '2015-03-15 00:05:09'),
(45, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:08:24', '2015-03-15 00:08:24'),
(46, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:09:47', '2015-03-15 00:09:47'),
(47, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:24:32', '2015-03-15 00:24:32'),
(48, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 00:26:44', '2015-03-15 00:26:44'),
(49, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 02:44:12', '2015-03-15 02:44:12'),
(50, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:10:18', '2015-03-15 03:10:18'),
(51, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:43:33', '2015-03-15 03:43:33'),
(52, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:45:54', '2015-03-15 03:45:54'),
(53, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:51:52', '2015-03-15 03:51:52'),
(54, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:53:03', '2015-03-15 03:53:03'),
(55, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:54:02', '2015-03-15 03:54:02'),
(56, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:54:59', '2015-03-15 03:54:59'),
(57, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:55:54', '2015-03-15 03:55:54'),
(58, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 03:57:14', '2015-03-15 03:57:14'),
(59, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:23:56', '2015-03-15 04:23:56'),
(60, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:32:24', '2015-03-15 04:32:24'),
(61, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:34:19', '2015-03-15 04:34:19'),
(62, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:39:50', '2015-03-15 04:39:50'),
(63, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:41:49', '2015-03-15 04:41:49'),
(64, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:42:13', '2015-03-15 04:42:13'),
(65, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 04:45:32', '2015-03-15 04:45:32'),
(66, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 05:00:08', '2015-03-15 05:00:08'),
(67, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 05:00:28', '2015-03-15 05:00:28'),
(68, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 05:12:26', '2015-03-15 05:12:26'),
(69, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 05:19:41', '2015-03-15 05:19:41'),
(70, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 05:59:30', '2015-03-15 05:59:30'),
(71, '9DShVqiCL1stI2MF', 'user', '2', NULL, '2015-03-15 06:23:24', '2015-03-15 06:23:24'),
(72, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 06:31:23', '2015-03-15 06:31:23'),
(73, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 06:32:52', '2015-03-15 06:32:52'),
(74, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 06:34:09', '2015-03-15 06:34:09'),
(75, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 06:59:20', '2015-03-15 06:59:20'),
(76, '9DShVqiCL1stI2MF', 'user', '3', NULL, '2015-03-15 07:13:10', '2015-03-15 07:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_session_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_session_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_session_scopes_session_id_index` (`session_id`),
  KEY `oauth_session_scopes_scope_id_index` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE IF NOT EXISTS `todos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `title`, `completed`, `created_at`, `updated_at`, `userId`) VALUES
(5, 'today work1', 'Yes', '2015-03-04 10:07:34', '2015-03-15 07:13:46', 3),
(9, 'such', 'No', '2015-03-11 10:50:05', '2015-03-15 06:34:20', 3),
(11, 'hello', 'Yes', '2015-03-11 11:10:23', '2015-03-11 11:10:23', 0),
(12, 'wnsjsjsjsjsjsndn sjsjwj shakal disks shaken sjsbsb disks sjsj', 'Yes', '2015-03-11 11:10:45', '2015-03-11 11:10:45', 0),
(13, 'fhhh', 'Yes', '2015-03-15 04:52:53', '2015-03-15 04:52:53', 0),
(14, 'ugh', 'Yes', '2015-03-15 04:53:34', '2015-03-15 04:53:34', 0),
(15, 'gfd', 'Yes', '2015-03-15 04:56:19', '2015-03-15 04:56:19', 0),
(16, 'hdhhff', 'Yes', '2015-03-15 04:57:18', '2015-03-15 04:57:18', 0),
(17, 'gdj', 'Yes', '2015-03-15 04:57:56', '2015-03-15 04:57:56', 0),
(18, 'bgffddd', 'Yes', '2015-03-15 05:19:53', '2015-03-15 05:20:15', 3),
(19, 'gsghj', 'No', '2015-03-15 05:20:03', '2015-03-15 05:20:21', 3),
(20, 'rff', 'Yes', '2015-03-15 06:23:31', '2015-03-15 06:23:31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Nilesh', 'nileshdungarwal@aol.in', '$2y$10$FHlejLEhxhvzkoVdfqIj.uktE/vpIP21q.mADqLu8fUQ9EO8ASKEm', NULL, '2015-03-04 21:54:25', '2015-03-04 21:54:25'),
(3, 'nilesh', 'a@a.com', '$2y$10$RpZ9lR06hzo6/5u3wZzf..xRGbitFFrT/r2GzyN5Q5Uw2SvQcViZy', NULL, '2015-03-15 02:43:30', '2015-03-15 02:43:30');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `oauth_access_tokens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_access_token_scopes`
--
ALTER TABLE `oauth_access_token_scopes`
  ADD CONSTRAINT `oauth_access_token_scopes_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD CONSTRAINT `oauth_auth_codes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_auth_code_scopes`
--
ALTER TABLE `oauth_auth_code_scopes`
  ADD CONSTRAINT `oauth_auth_code_scopes_auth_code_id_foreign` FOREIGN KEY (`auth_code_id`) REFERENCES `oauth_auth_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_auth_code_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_client_endpoints`
--
ALTER TABLE `oauth_client_endpoints`
  ADD CONSTRAINT `oauth_client_endpoints_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_client_grants`
--
ALTER TABLE `oauth_client_grants`
  ADD CONSTRAINT `oauth_client_grants_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `oauth_client_grants_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oauth_client_scopes`
--
ALTER TABLE `oauth_client_scopes`
  ADD CONSTRAINT `oauth_client_scopes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_client_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_grant_scopes`
--
ALTER TABLE `oauth_grant_scopes`
  ADD CONSTRAINT `oauth_grant_scopes_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_grant_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD CONSTRAINT `oauth_refresh_tokens_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_sessions`
--
ALTER TABLE `oauth_sessions`
  ADD CONSTRAINT `oauth_sessions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oauth_session_scopes`
--
ALTER TABLE `oauth_session_scopes`
  ADD CONSTRAINT `oauth_session_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_session_scopes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
