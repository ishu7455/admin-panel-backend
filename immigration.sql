-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2025 at 07:42 PM
-- Server version: 8.0.42-0ubuntu0.20.04.1
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `immigration`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_check_lists`
--

CREATE TABLE `add_check_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `update_by` bigint UNSIGNED DEFAULT NULL,
  `list_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_check_lists`
--

INSERT INTO `add_check_lists` (`id`, `applicant_id`, `update_by`, `list_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 'inactive', '2025-07-29 02:58:13', '2025-07-31 07:00:23'),
(2, 6, 1, 3, 'active', '2025-07-29 03:01:11', '2025-07-29 05:06:46'),
(3, 6, 1, 4, 'inactive', '2025-07-29 03:01:13', '2025-07-29 03:01:13'),
(4, 6, 1, 2, 'active', '2025-07-29 04:28:17', '2025-07-31 06:40:47'),
(5, NULL, 1, 5, 'active', '2025-08-06 10:28:26', '2025-08-06 10:28:26'),
(6, NULL, 1, 6, 'active', '2025-08-06 10:28:33', '2025-08-06 10:28:33'),
(7, NULL, 1, 7, 'active', '2025-08-06 10:28:43', '2025-08-06 10:28:43'),
(8, NULL, 1, 8, 'active', '2025-08-06 10:28:48', '2025-08-06 10:28:48'),
(9, NULL, 1, 9, 'active', '2025-08-06 10:29:05', '2025-08-06 10:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `assign_by` int DEFAULT NULL,
  `assign_to` int DEFAULT NULL,
  `external_id` int NOT NULL,
  `family_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `given_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `number_of_applicants` int DEFAULT NULL,
  `country_of_residence` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_citizenship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_dob` date DEFAULT NULL,
  `have_children` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `children_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `applied_canada_visa` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applied_canada_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refused_canada_visa` tinyint(1) DEFAULT NULL,
  `refused_canada_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refused_us_visa` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refused_us_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `interested_program` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_start_date` date DEFAULT NULL,
  `edu_end_date` date DEFAULT NULL,
  `edu_degree` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_start_date` date DEFAULT NULL,
  `emp_end_date` date DEFAULT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_worth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income_source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listening_score` int DEFAULT NULL,
  `reading_score` int DEFAULT NULL,
  `writing_score` int DEFAULT NULL,
  `speaking_score` int DEFAULT NULL,
  `test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `spouse_edu_start_date` date DEFAULT NULL,
  `spouse_edu_end_date` date DEFAULT NULL,
  `spouse_edu_degree` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_edu_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_emp_start_date` date DEFAULT NULL,
  `spouse_emp_end_date` date DEFAULT NULL,
  `spouse_designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_net_worth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_income_source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_property_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_listening_score` int DEFAULT NULL,
  `spouse_reading_score` int DEFAULT NULL,
  `spouse_writing_score` int DEFAULT NULL,
  `spouse_speaking_score` int DEFAULT NULL,
  `spouse_test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_test_date` date DEFAULT NULL,
  `have_connections` tinyint(1) DEFAULT NULL,
  `friends_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `family_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `parent_id`, `assign_by`, `assign_to`, `external_id`, `family_name`, `given_name`, `title`, `phone_number`, `email_id`, `date_of_birth`, `gender`, `marital_status`, `address`, `number_of_applicants`, `country_of_residence`, `country_of_citizenship`, `status`, `spouse_name`, `spouse_dob`, `have_children`, `children_details`, `applied_canada_visa`, `applied_canada_visa_details`, `refused_canada_visa`, `refused_canada_visa_details`, `refused_us_visa`, `refused_us_visa_details`, `interested_program`, `edu_start_date`, `edu_end_date`, `edu_degree`, `edu_field`, `emp_start_date`, `emp_end_date`, `designation`, `emp_location`, `company_name`, `net_worth`, `income_source`, `property_value`, `listening_score`, `reading_score`, `writing_score`, `speaking_score`, `test_type`, `test_date`, `spouse_edu_start_date`, `spouse_edu_end_date`, `spouse_edu_degree`, `spouse_edu_field`, `spouse_emp_start_date`, `spouse_emp_end_date`, `spouse_designation`, `spouse_location`, `spouse_company`, `spouse_net_worth`, `spouse_income_source`, `spouse_property_value`, `spouse_listening_score`, `spouse_reading_score`, `spouse_writing_score`, `spouse_speaking_score`, `spouse_test_type`, `spouse_test_date`, `have_connections`, `friends_details`, `family_details`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 1, 102, 'Derek Sherman', 'Mr', NULL, '+1 (142) 212-8093', 'vupepap@mailinator.com', '1992-10-02', 'Select Gender', 'Widowed', 'Inventore veritatis', 1, 'Odio autem suscipit', 'Aut cumque non conse', 'Completed', 'Colin Kinney', '1985-01-07', 'Deleniti est itaque', 'Enim in ut officiis', 'Veniam incididunt v', 'Quis dolor dolore ma', 0, '1', '0', '0', '2', '2018-11-21', '1997-05-09', 'Voluptatibus volupta', 'Eum qui nostrud amet', '1991-01-23', '2025-04-05', 'Ea natus facere cons', 'Id iure iusto ad ani', 'Wolf and Bolton Inc', 'Qui voluptas quod te', '839', 'Aut sed ut voluptate', 54, 31, 5, 38, 'Labore autem rerum m', '2013-01-18', '1981-08-31', '1999-03-05', 'Maxime non voluptate', 'Ullamco cumque ad na', '1978-07-20', '1974-10-03', 'Voluptatum aut eum d', 'Placeat id commodo', 'Carson and Charles Traders', 'Culpa do voluptate h', '323', 'Nostrud aliquam quis', 22, 50, 57, 14, 'Sint quo sit odit r', '1995-10-04', 0, 'Sequi amet nulla ei', 'Sint molestias enim', '2025-07-22 05:00:24', '2025-07-25 01:39:01'),
(2, NULL, 1, 9, 103, 'Derek Sherman', 'Mr', NULL, '+1 (142) 212-8093', 'vupepap@mailinator.com', '1992-10-02', 'Select Gender', 'Widowed', 'Inventore veritatis', 1, 'Odio autem suscipit', 'Aut cumque non conse', 'Completed', 'Colin Kinney', '1985-01-07', 'Deleniti est itaque', 'Enim in ut officiis', 'Veniam incididunt v', 'Quis dolor dolore ma', 0, '1', '0', '0', '2', '2018-11-21', '1997-05-09', 'Voluptatibus volupta', 'Eum qui nostrud amet', '1991-01-23', '2025-04-05', 'Ea natus facere cons', 'Id iure iusto ad ani', 'Wolf and Bolton Inc', 'Qui voluptas quod te', '839', 'Aut sed ut voluptate', 54, 31, 5, 38, 'Labore autem rerum m', '2013-01-18', '1981-08-31', '1999-03-05', 'Maxime non voluptate', 'Ullamco cumque ad na', '1978-07-20', '1974-10-03', 'Voluptatum aut eum d', 'Placeat id commodo', 'Carson and Charles Traders', 'Culpa do voluptate h', '323', 'Nostrud aliquam quis', 22, 50, 57, 14, 'Sint quo sit odit r', '1995-10-04', 0, 'Sequi amet nulla ei', NULL, '2025-07-22 05:02:37', '2025-07-30 02:38:52'),
(3, NULL, 2, 1, 104, 'Giselle Rocha', 'Mrs', NULL, '+1 (746) 482-6769', 'memanowoce@mailinator.com', '2020-06-11', 'Select Gender', 'Divorced', 'Dolores voluptatem i', 8, 'Accusamus assumenda', 'Numquam delectus po', 'Final Review', 'Victor Espinoza', '1978-06-13', 'Eiusmod culpa assum', 'Similique ad nisi te', 'Qui officia molestia', 'Magna neque ut tempo', 0, '0', '1', '1', '1', '2007-05-15', '1985-04-23', 'Illum tenetur vitae', 'Velit dolor facilis', '1990-03-07', '2013-03-03', 'Quia laboriosam aut', 'Pariatur Tempore a', 'Levy and Kerr Plc', 'Omnis recusandae Ne', '948', 'Quis aperiam iusto f', 95, 20, 18, 3, 'Magnam fugiat cumqu', '2002-11-05', '2015-11-10', '2018-04-18', 'Sed quis est quia ul', 'Aut eum autem occaec', '2018-01-07', '1979-04-09', 'Quia odit provident', 'Occaecat totam irure', 'Acevedo and Vang Inc', 'Irure consequatur s', '508', 'Sunt laboriosam ut', 12, 33, 53, 74, 'Dolore perferendis d', '2019-07-12', 0, 'Quasi lorem voluptat', 'Repudiandae et liber', '2025-07-22 06:46:18', '2025-07-25 04:12:49'),
(4, NULL, NULL, NULL, 105, 'Sopoline Alvarado', 'Mrs', NULL, '+1 (208) 927-2421', 'hovo@mailinator.com', '2023-07-11', 'Select Gender', 'Widowed', 'Ad quae vero officia', 4, 'Enim unde vero ut pe', 'Nisi exercitationem', 'Single', 'Nichole Casey', '1971-03-20', 'Placeat ex libero o', 'Nostrum dolore paria', 'Excepturi velit del', 'Perspiciatis illum', 1, '1', '0', '0', '2', '1974-10-27', '1996-05-15', 'Doloribus et praesen', 'Excepturi sunt numqu', '1993-02-06', '2010-08-20', 'Commodo omnis quam v', 'Id harum similique e', 'Blake and Skinner Plc', 'Aperiam excepturi et', '686', 'Eum nihil quis sit', 30, 6, 21, 85, 'Voluptatem Sit tem', '2012-01-18', '1978-10-07', '2021-08-02', 'Mollitia at quis nih', 'Consectetur laboris', '2014-02-14', '1985-07-28', 'Proident elit quis', 'Dolor culpa delectu', 'David and Nichols Associates', 'Voluptatem do dolor', '25', 'Velit dolore omnis', 84, 43, 80, 42, 'Eum ut quo in maiore', '2024-07-06', 0, 'Aut id quos labore u', 'Blanditiis nulla ali', '2025-07-23 05:19:16', '2025-07-23 05:19:16'),
(5, 1, NULL, NULL, 106, 'Breanna Gill', 'Ms', NULL, '+1 (254) 745-6005', 'gehah@mailinator.com', '2009-10-04', 'Select Gender', 'Single', 'Ad duis et obcaecati', 5, 'Ad saepe facilis fac', 'Voluptate perferendi', 'Completed', 'Paul Tyson', '1983-01-19', 'Autem est dolor opti', 'Dicta veniam fugiat', 'Aut aut lorem sint', 'Reiciendis vitae vel', 1, '1', '1', '0', '1', '1993-06-09', '1988-05-21', 'Et laudantium offic', 'Cum voluptatibus vel', '1974-02-01', '1972-05-05', 'Illum sunt eum occa', 'Elit non repellendu', 'Strong and Boyd Plc', 'Dolorem iste odio qu', '766', 'Velit voluptas earum', 18, 91, 80, 82, 'Voluptates qui vero', '1972-07-07', '1994-11-10', '1972-06-11', 'Mollit officia digni', 'Et culpa magna eu ve', '1995-05-21', '1973-06-01', 'Veniam voluptatem', 'Consequatur Assumen', 'Becker Moore Co', 'Lorem et cupidatat a', '255', 'Temporibus dolor ass', 88, 70, 54, 84, 'Asperiores modi fugi', '2000-02-12', 0, 'Vero accusamus ducim', 'Mollit adipisci pari', '2025-07-23 05:19:16', '2025-07-25 05:11:12'),
(6, 2, NULL, NULL, 107, 'Imani Carson', 'Miss', NULL, '+1 (537) 198-9257', 'hikol@mailinator.com', '1986-10-27', 'Other', 'Divorced', 'Nostrud culpa delec', 6, 'Duis reiciendis non', 'Lorem voluptatum adi', 'Select', 'Cameron Gibson', '2018-02-01', 'Velit placeat poss', 'Aut natus aut quis u', 'Sunt aspernatur even', 'Earum occaecat lorem', 1, '1', '0', '0', '1', '1975-05-20', '1978-05-31', 'Corporis praesentium', 'Soluta omnis consequ', '1971-01-28', '1979-02-03', 'Velit deserunt at t', 'Laboriosam aliquip', 'Delaney Lara Trading', 'Voluptatem Ipsam de', '81', 'Natus voluptatem Vo', 70, 18, 98, 53, 'Ad pariatur Enim du', '2019-08-24', '1996-11-05', '1993-09-09', 'Velit quis distinct', 'Autem id illum con', '1992-07-16', '2018-07-31', 'Ex quos quidem repre', 'Exercitation beatae', 'Shaffer Bradford Traders', 'Excepturi odio culpa', '2', 'Eiusmod quam a conse', 48, 74, 99, 55, 'Ab commodo et consec', '2003-06-24', 0, 'Rerum inventore est', 'Nisi dolorem hic cum', '2025-07-23 05:19:16', '2025-07-30 01:08:10'),
(7, 1, NULL, NULL, 108, 'Rahim Bauer', 'Ms', NULL, '+1 (148) 631-5648', 'wopiqu@mailinator.com', '1999-04-15', 'Male', 'Widowed', 'Non doloribus autem', 7, 'Animi aliquid sint', 'Voluptates nemo nobi', 'Final Review', 'Shelby Burke', '2006-04-22', 'Ipsum laboris sit', 'At delectus excepte', 'Sunt sit et corpori', 'Veniam id perferend', 1, '1', '0', '0', '2', '1982-10-10', '1996-05-13', 'Vitae necessitatibus', 'Non ipsam ipsum dolo', '2016-12-26', '2013-10-09', 'Ullamco autem cum si', 'Ut voluptatem enim s', 'James Barr Traders', 'Nisi qui non optio', '785', 'Veritatis vel tempor', 85, 52, 48, 98, 'Est consequatur dict', '2019-12-14', '1982-03-22', '2000-05-07', 'Sunt iure culpa vol', 'Elit corporis aut c', '2014-01-23', '1992-06-19', 'Irure quos reprehend', 'Mollit voluptatem co', 'Holmes and Barr Traders', 'Nesciunt voluptatem', '352', 'Tempora minus rerum', 36, 96, 14, 81, 'Autem magna ex conse', '1975-02-04', 1, 'Alias quia inventore', 'Consequuntur ipsum u', '2025-07-24 02:57:17', '2025-07-25 05:11:12'),
(8, 2, NULL, NULL, 109, 'Porter Bolton', 'Mr', NULL, '+1 (109) 162-3997', 'poviqew@mailinator.com', '2020-10-11', 'Other', 'Married', 'Quod esse sed paria', 10, 'Nihil corporis autem', 'Ut cillum quibusdam', 'Select', 'Sybil Mcgee', '2003-06-06', 'Adipisci voluptas di', 'Explicabo Nulla off', 'Ut rerum sunt distin', 'Libero repellendus', 0, '1', '0', '0', '1', '1995-01-07', '1993-02-25', 'Cupidatat excepturi', 'Illum odio deleniti', '1977-03-07', '1978-04-04', 'Accusantium ullamco', 'Facere quo ea et atq', 'Hayes Rhodes Co', 'Qui aut doloremque v', '25', 'Inventore perspiciat', 50, 22, 95, 6, 'Qui eos duis cupidat', '2022-04-25', '1971-01-29', '1997-07-17', 'Nisi at iure dolore', 'Dolor nisi magni lab', '2003-06-04', '2004-05-20', 'Nobis est voluptas i', 'Culpa consequatur c', 'Stout and Herman Traders', 'Id incidunt ea sed', '537', 'Consectetur omnis su', 100, 27, 99, 3, 'Ea ut qui qui in acc', '2022-05-10', 1, 'Et ut incididunt acc', 'Mollit molestias sit', '2025-07-24 04:19:56', '2025-07-30 02:38:52'),
(9, 2, NULL, NULL, 110, 'Mufutau Parker', 'Ms', NULL, '+1 (656) 138-9011', 'guba@mailinator.com', '1976-01-25', 'Other', 'Single', 'Dolor cum cumque sit', 7, 'Ex non obcaecati dol', 'Distinctio Quia obc', 'Single', 'Alfonso Hicks', '2007-04-26', 'Ipsum odio at quaera', 'Odit ea qui repudian', 'Unde aliquip sequi r', 'Nobis cupidatat ipsu', 1, '0', '0', '0', '2', '1979-06-04', '1995-12-15', 'Sint est eos qui qu', 'Sit ad qui odit con', '1996-10-29', '2015-09-19', 'Nulla aut fugit quo', 'Ut dolor et cumque n', 'Shelton and Cardenas Trading', 'Consequatur dolor si', '529', 'Quibusdam sed ad aut', 47, 29, 64, 79, 'Dolore error qui qui', '2001-09-07', '2021-04-09', '1989-04-27', 'Ab explicabo Volupt', 'Voluptatem Laborios', '1981-08-18', '1986-02-22', 'Cupiditate distincti', 'Porro ab sapiente ma', 'Fitzgerald and Marshall Co', 'Autem consequatur an', '858', 'Dignissimos perspici', 7, 27, 12, 100, 'Sit exercitationem i', '1988-09-13', 1, 'Accusamus sed ea del', 'Aspernatur eos non', '2025-07-24 04:20:27', '2025-07-30 02:38:52'),
(10, 2, NULL, NULL, 111, 'Nayda Oliver', 'Ms', NULL, '+1 (673) 371-6382', 'jilyfe@mailinator.com', '2015-10-07', 'Female', 'Married', 'Minus vel unde ut ea', 7, 'Harum id sunt vel au', 'Duis exercitationem', 'Married', 'Haviva Bryant', '2025-03-06', 'Dolorem non duis qua', 'Non cupiditate sed r', 'Quam velit sunt vel', 'Consequatur error do', 1, '1', '0', '0', '1', '1988-10-17', '2024-01-19', 'Aperiam voluptas sit', 'Incidunt non culpa', '1974-07-25', '1988-02-20', 'Et velit est in mag', 'Quis sit iure culpa', 'Huffman and Kelly LLC', 'Excepteur fugiat nih', '980', 'Rem qui veniam debi', 94, 72, 67, 91, 'Necessitatibus qui e', '2017-09-03', '2018-06-04', '1983-05-25', 'Eos perspiciatis a', 'Velit ullam impedit', '1976-04-11', '2007-04-21', 'Adipisci ut omnis vo', 'Optio et rem quia i', 'Fox and Wiley Inc', 'Quis ullam suscipit', '432', 'Similique quis fugit', 10, 50, 7, 97, 'Harum atque aute vol', '2023-11-20', 1, 'Qui error cupiditate', 'Quaerat placeat qua', '2025-07-24 05:45:20', '2025-07-30 02:38:52'),
(11, NULL, 1, 9, 112, 'Bradley Maddox', 'Ms', NULL, '+1 (384) 491-5569', 'faruran@mailinator.com', '1992-11-14', 'Select Gender', 'Divorced', 'Qui nihil qui velit', 1, 'Fugiat aliquam quae', 'Nostrud ipsum doloru', 'In Process', 'Rowan Mcmillan', '2024-12-05', 'Magni recusandae Il', 'Magnam consequuntur', 'Veritatis corrupti', 'Ipsum itaque totam m', 0, '1', '0', '1', '1', '2024-12-03', '1996-06-03', 'Consequatur Laudant', 'Necessitatibus harum', '1999-04-03', '1978-06-02', 'Adipisci exercitatio', 'Corrupti aut fugiat', 'Meyers Moran Co', 'Non temporibus susci', '641', 'Laudantium accusamu', 96, 35, 45, 98, 'Velit qui consectetu', '1971-10-06', '1983-09-18', '1987-10-24', 'Placeat dolorem aut', 'Ullamco est in omnis', '2012-09-16', '1975-03-19', 'Laborum tenetur dolo', 'Eu dolor assumenda v', 'Grant and Porter Co', 'Minus nihil et labor', '350', 'Rem sint atque est m', 42, 82, 4, 88, 'Mollitia dolorem et', '1999-01-22', 1, 'Minim quibusdam recu', 'Pariatur Tempore a', '2025-07-30 02:40:42', '2025-07-30 02:40:42'),
(12, NULL, 1, 9, 113, 'Bradley Maddox', 'Ms', NULL, '+1 (384) 491-5569', 'faruran@mailinator.com', '1992-11-14', 'Select Gender', 'Divorced', 'Qui nihil qui velit', 1, 'Fugiat aliquam quae', 'Nostrud ipsum doloru', 'In Process', 'Rowan Mcmillan', '2024-12-05', 'Magni recusandae Il', 'Magnam consequuntur', 'Veritatis corrupti', 'Ipsum itaque totam m', 0, '1', '0', '1', '1', '2024-12-03', '1996-06-03', 'Consequatur Laudant', 'Necessitatibus harum', '1999-04-03', '1978-06-02', 'Adipisci exercitatio', 'Corrupti aut fugiat', 'Meyers Moran Co', 'Non temporibus susci', '641', 'Laudantium accusamu', 96, 35, 45, 98, 'Velit qui consectetu', '1971-10-06', '1983-09-18', '1987-10-24', 'Placeat dolorem aut', 'Ullamco est in omnis', '2012-09-16', '1975-03-19', 'Laborum tenetur dolo', 'Eu dolor assumenda v', 'Grant and Porter Co', 'Minus nihil et labor', '350', 'Rem sint atque est m', 42, 82, 4, 88, 'Mollitia dolorem et', '1999-01-22', 1, 'Minim quibusdam recu', 'Pariatur Tempore a', '2025-07-30 02:41:43', '2025-07-30 02:41:43'),
(13, NULL, 1, 9, 114, 'Bradley Maddox', 'Ms', NULL, '+1 (384) 491-5569', 'faruran@mailinator.com', '1992-11-14', 'Select Gender', 'Divorced', 'Qui nihil qui velit', 1, 'Fugiat aliquam quae', 'Nostrud ipsum doloru', 'In Process', 'Rowan Mcmillan', '2024-12-05', 'Magni recusandae Il', 'Magnam consequuntur', 'Veritatis corrupti', 'Ipsum itaque totam m', 0, '1', '0', '1', '1', '2024-12-03', '1996-06-03', 'Consequatur Laudant', 'Necessitatibus harum', '1999-04-03', '1978-06-02', 'Adipisci exercitatio', 'Corrupti aut fugiat', 'Meyers Moran Co', 'Non temporibus susci', '641', 'Laudantium accusamu', 96, 35, 45, 98, 'Velit qui consectetu', '1971-10-06', '1983-09-18', '1987-10-24', 'Placeat dolorem aut', 'Ullamco est in omnis', '2012-09-16', '1975-03-19', 'Laborum tenetur dolo', 'Eu dolor assumenda v', 'Grant and Porter Co', 'Minus nihil et labor', '350', 'Rem sint atque est m', 42, 82, 4, 88, 'Mollitia dolorem et', '1999-01-22', 1, 'Minim quibusdam recu', 'Pariatur Tempore a', '2025-07-30 02:53:26', '2025-07-30 02:53:26'),
(14, NULL, 1, 9, 115, 'Bradley Maddox', 'Ms', NULL, '+1 (384) 491-5569', 'faruran@mailinator.com', '1992-11-14', 'Select Gender', 'Divorced', 'Qui nihil qui velit', 1, 'Fugiat aliquam quae', 'Nostrud ipsum doloru', 'In Process', 'Rowan Mcmillan', '2024-12-05', 'Magni recusandae Il', 'Magnam consequuntur', 'Veritatis corrupti', 'Ipsum itaque totam m', 0, '1', '0', '1', '1', '2024-12-03', '1996-06-03', 'Consequatur Laudant', 'Necessitatibus harum', '1999-04-03', '1978-06-02', 'Adipisci exercitatio', 'Corrupti aut fugiat', 'Meyers Moran Co', 'Non temporibus susci', '641', 'Laudantium accusamu', 96, 35, 45, 98, 'Velit qui consectetu', '1971-10-06', '1983-09-18', '1987-10-24', 'Placeat dolorem aut', 'Ullamco est in omnis', '2012-09-16', '1975-03-19', 'Laborum tenetur dolo', 'Eu dolor assumenda v', 'Grant and Porter Co', 'Minus nihil et labor', '350', 'Rem sint atque est m', 42, 82, 4, 88, 'Mollitia dolorem et', '1999-01-22', 1, 'Minim quibusdam recu', 'Pariatur Tempore a', '2025-07-30 02:59:04', '2025-07-30 02:59:04'),
(15, NULL, 1, 9, 116, 'Guy Hawkins', 'Select Title', NULL, '+1 (898) 321-7647', 'vybe@mailinator.com', '2019-11-26', 'Male', 'Single', 'Tempora beatae dolor', 9, 'Ipsa et placeat ap', 'Quod ipsum enim in r', 'Final Review', 'Grace Burke', '2006-06-04', 'Dolor sunt dicta ni', 'A placeat ea nobis', 'Enim veniam exercit', 'Illum non ex except', 0, '1', '0', '1', '1', '2018-12-11', '1991-01-30', 'Tenetur enim accusan', 'Porro labore consect', '1971-04-09', '1974-07-27', 'Nemo et minim culpa', 'Iure a quis dolorem', 'Ortiz and Gibson Plc', 'Earum id voluptatem', '851', 'Exercitationem delec', 39, 22, 73, 94, 'Eaque tempore illo', '1972-04-14', '2008-05-09', '2016-07-21', 'Dolor tempor volupta', 'Libero non sint face', '2019-05-07', '1991-01-01', 'In lorem ullam optio', 'Dolor itaque odit te', 'Flynn Gamble Trading', 'Temporibus similique', '713', 'Numquam sunt laboris', 19, 6, 1, 16, 'Consequuntur aperiam', '2019-09-07', 1, 'Voluptas accusamus e', 'Quisquam sed aliqua', '2025-07-31 07:32:04', '2025-07-31 07:32:04'),
(16, NULL, 1, 9, 117, 'Joy Cote', 'Mr', NULL, '+1 (753) 912-9618', 'lykywy@mailinator.com', '1988-07-01', 'Other', 'Divorced', 'Dolorem in eaque et', 2, 'Officia dolor pariat', 'Commodo ad voluptate', 'Final Review', 'Morgan Snow', '1999-05-01', 'Nemo suscipit tempor', 'Ut tenetur quidem ve', 'Aperiam quis hic eiu', 'Consequatur sed quo', 0, '1', '0', '0', '2', '2003-11-09', '2014-08-26', 'Esse ut beatae ratio', 'Rerum ut quis volupt', '2005-07-09', '1991-11-14', 'Aliquid quod est se', 'Incidunt provident', 'Branch Travis Associates', 'Consectetur cupidit', '587', 'In sapiente corrupti', 83, 59, 12, 11, 'Itaque alias quia eu', '2016-03-18', '1985-12-19', '1998-02-08', 'Fugiat earum rerum', 'Vero sunt rerum quo', '1977-03-09', '1984-12-26', 'Itaque rerum autem u', 'Aut est autem ipsum', 'Mosley and Avery Plc', 'Atque maiores et qui', '550', 'Omnis tempor molliti', 19, 77, 29, 70, 'Dolor et ullamco ut', '1994-09-23', 1, 'Velit molestiae cill', 'Alias quia vitae ear', '2025-07-31 07:32:19', '2025-07-31 07:32:19'),
(17, NULL, 1, 6, 118, 'Julian Fowler', 'Miss', NULL, '+1 (541) 608-9507', 'nahagefumo@mailinator.com', '1999-02-09', 'Select Gender', 'Divorced', 'Consectetur vitae co', 5, 'Vero atque hic eu ei', 'Asperiores et sed vo', 'Pending Document Request', 'Kasper Sullivan', '1979-12-07', 'Proident commodi ci', 'Nisi optio perferen', 'Quia aut in ipsum p', 'Deserunt incididunt', 1, '0', '1', '1', '2', '2017-01-01', '2000-07-16', 'Veritatis et reprehe', 'Tenetur aut accusamu', '2019-08-15', '2006-07-26', 'Quod est nostrud iru', 'Neque porro dicta co', 'Burke Wiley LLC', 'Adipisci enim est et', '426', 'Neque nisi quia et h', 90, 76, 93, 24, 'Ut cupiditate modi i', '2004-10-15', '1979-02-02', '1977-03-22', 'Accusamus aut non vo', 'Eius consequatur de', '2009-08-19', '2021-04-23', 'Qui elit sunt sint', 'Ullamco quod nobis o', 'Garrett and Cline Traders', 'Aut voluptatem Veni', '218', 'Omnis aute quis even', 83, 98, 75, 12, 'Dolor consectetur ut', '1979-07-29', 1, 'Dolor quos dolore qu', 'In exercitationem ea', '2025-07-31 07:32:37', '2025-07-31 07:32:37'),
(18, NULL, 1, 9, 119, 'Merrill Cote', 'Ms', NULL, '+1 (453) 153-8805', 'pyjegenohy@mailinator.com', '2014-09-28', 'Select Gender', 'Divorced', 'Ab perferendis maxim', 8, 'Enim vel eligendi iu', 'Dolor eos est molest', 'On Hold', 'Lareina Boyle', '1974-06-17', 'Quidem adipisci opti', 'Amet consequatur qu', 'Aut sapiente et lore', 'Omnis mollitia sapie', 0, '0', '0', '0', '1', '1984-09-18', '2011-02-27', 'Commodi aut aut esse', 'Voluptates aut et qu', '1989-05-13', '1978-12-01', 'Laborum suscipit ven', 'Excepteur aliquam do', 'Holland and Salazar Associates', 'Earum voluptate quod', '87', 'Voluptas facere eum', 25, 15, 91, 47, 'Rerum enim et volupt', '1976-08-06', '2002-07-08', '2017-12-13', 'At assumenda ut vel', 'Eius impedit et dol', '1987-01-06', '2001-02-18', 'Culpa iure reiciend', 'Nostrum voluptatibus', 'Crawford Wyatt Inc', 'Mollitia ullam error', '951', 'Deleniti incididunt', 87, 88, 86, 72, 'Non error aliquam fu', '1982-02-27', 1, 'Vel harum officia ab', 'Id ad in officia per', '2025-07-31 07:32:42', '2025-07-31 07:32:42'),
(19, NULL, 1, 9, 120, 'Lara Pope', 'Miss', NULL, '+1 (728) 529-1177', 'giqokymide@mailinator.com', '1984-08-26', 'Other', 'Widowed', 'Omnis dicta ea asper', 9, 'Et vel id rerum veli', 'Iusto vel ratione qu', 'In Process', 'Angelica Hensley', '2013-06-08', 'Est similique ad id', 'Quas est quis illo n', 'Est corporis ut aliq', 'Aut lorem et culpa', 0, '1', '1', '0', '2', '2024-08-25', '1989-01-22', 'Sed laborum harum do', 'Quibusdam cillum err', '2010-06-30', '1977-05-15', 'Eos ipsa dolore pla', 'Aspernatur dolor vol', 'Durham and Hays Plc', 'Fugiat tempore eum', '590', 'Et omnis tempor prov', 66, 31, 15, 71, 'Repellendus Minima', '2012-12-01', '1980-09-10', '1970-10-23', 'Facilis suscipit mai', 'Vitae quis iste dolo', '2009-10-03', '2005-11-13', 'Id alias numquam vel', 'Voluptate excepturi', 'Flynn and Bernard Plc', 'Sint odit incididunt', '1000', 'Labore quo praesenti', 11, 36, 43, 98, 'Explicabo Ipsum dig', '1998-05-18', 0, 'Enim itaque et illum', 'At ratione pariatur', '2025-07-31 07:33:12', '2025-07-31 07:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'created', 'App\\Models\\AddCheckList', 5, '[]', '{\"list_id\":5,\"applicant_id\":null,\"status\":\"active\",\"id\":5}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:26', '2025-08-06 10:28:26'),
(2, 'App\\Models\\User', 1, 'updated', 'App\\Models\\AddCheckList', 5, '{\"update_by\":null}', '{\"update_by\":1}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:26', '2025-08-06 10:28:26'),
(3, 'App\\Models\\User', 1, 'created', 'App\\Models\\AddCheckList', 6, '[]', '{\"list_id\":6,\"applicant_id\":null,\"status\":\"active\",\"id\":6}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:33', '2025-08-06 10:28:33'),
(4, 'App\\Models\\User', 1, 'updated', 'App\\Models\\AddCheckList', 6, '{\"update_by\":null}', '{\"update_by\":1}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:33', '2025-08-06 10:28:33'),
(5, 'App\\Models\\User', 1, 'created', 'App\\Models\\AddCheckList', 7, '[]', '{\"list_id\":7,\"applicant_id\":null,\"status\":\"active\",\"id\":7}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:43', '2025-08-06 10:28:43'),
(6, 'App\\Models\\User', 1, 'updated', 'App\\Models\\AddCheckList', 7, '{\"update_by\":null}', '{\"update_by\":1}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:43', '2025-08-06 10:28:43'),
(7, 'App\\Models\\User', 1, 'created', 'App\\Models\\AddCheckList', 8, '[]', '{\"list_id\":8,\"applicant_id\":null,\"status\":\"active\",\"id\":8}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:48', '2025-08-06 10:28:48'),
(8, 'App\\Models\\User', 1, 'updated', 'App\\Models\\AddCheckList', 8, '{\"update_by\":null}', '{\"update_by\":1}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:28:48', '2025-08-06 10:28:48'),
(9, 'App\\Models\\User', 1, 'created', 'App\\Models\\AddCheckList', 9, '[]', '{\"list_id\":9,\"applicant_id\":null,\"status\":\"active\",\"id\":9}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:29:05', '2025-08-06 10:29:05'),
(10, 'App\\Models\\User', 1, 'updated', 'App\\Models\\AddCheckList', 9, '{\"update_by\":null}', '{\"update_by\":1}', 'http://localhost:8000/api/checklists/toggle-status', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, '2025-08-06 10:29:05', '2025-08-06 10:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'permanent residency', 1, NULL, NULL),
(2, 'study', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `check_lists`
--

CREATE TABLE `check_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `check_lists`
--

INSERT INTO `check_lists` (`id`, `category_id`, `title`, `heading_id`, `created_at`, `updated_at`) VALUES
(5, 1, 'Passports/Travel Documents (Multiple, Study Permit, Work Permit)', NULL, NULL, NULL),
(6, 1, 'Marriage License/Certificate', NULL, NULL, NULL),
(7, 1, 'Birth Certificate', NULL, NULL, NULL),
(8, 1, 'Police certificate', NULL, NULL, NULL),
(9, 1, 'Education (diplomas/degrees & transcripts)', NULL, NULL, NULL),
(10, 1, 'Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment all)', NULL, NULL, NULL),
(11, 1, 'Use of representative (IMM5476)', NULL, NULL, NULL),
(12, 1, 'Proof of Means of Financial Support – (as explained in the email)', NULL, NULL, NULL),
(13, 1, 'Digital Photo', NULL, NULL, NULL),
(14, 1, 'Proof of English Proficiency – IELTS/CELPIP/PTE', NULL, NULL, NULL),
(15, 1, 'Credential Evaluation (any education completed outside Canada)', NULL, NULL, NULL),
(16, 1, 'Spouse - Passports/Travel Documents (Multiple)', NULL, NULL, NULL),
(17, 1, 'Spouse - Education (diplomas/degrees & transcripts)', NULL, NULL, NULL),
(18, 1, 'Spouse - Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment)', NULL, NULL, NULL),
(19, 1, 'Spouse - Birth Certificate', NULL, NULL, NULL),
(20, 1, 'Spouse - Digital photo', NULL, NULL, NULL),
(21, 1, 'Spouse - Proof of English Proficiency – IELTS/CELPIP/PTE (optional)', NULL, NULL, NULL),
(22, 1, 'Spouse - Credential Evaluation (any education completed outside Canada) (optional)', NULL, NULL, NULL),
(23, 1, 'Child - Passports/Travel Documents (Multiple)', NULL, NULL, NULL),
(24, 1, 'Child - Education Documents', NULL, NULL, NULL),
(25, 1, 'Child - Birth Certificate', NULL, NULL, NULL),
(26, 1, 'Child - Digital photo', NULL, NULL, NULL),
(27, 2, 'Passport including biodata pages and all entry/departure stamps and visa pages', 1, NULL, NULL),
(28, 2, 'Bank statements for the past 6 months showing consistency of bank balance.', 1, NULL, NULL),
(29, 2, 'If there are any transfers of funds in large amounts, kindly provide the explanation for the same.', 1, NULL, NULL),
(30, 2, 'Fixed deposit accounts', 1, NULL, NULL),
(31, 2, 'Any other investments/savings (mutual funds, stocks, etc.)', 1, NULL, NULL),
(32, 2, 'Income tax documents', 1, NULL, NULL),
(33, 2, 'Property valuation reports for immovable property', 1, NULL, NULL),
(34, 2, 'Purpose of visit (a letter explaining your reason/purpose for the visit and details relating to where and when you wish to visit)', 1, NULL, NULL),
(35, 2, 'Marriage certificate/divorce certificate/separation agreement (as applicable)', 1, NULL, NULL),
(36, 2, 'CA reporting stating all assets and liabilities', 1, NULL, NULL),
(37, 2, 'Birth certificate of accompanying minor children (if applicable)', 1, NULL, NULL),
(38, 2, 'Parental consent letter (if the child is not travelling with both parents)', 1, NULL, NULL),
(39, 2, 'Digital photo (35mm × 45mm with a neutral face and white background)', 1, NULL, NULL),
(40, 2, 'Kindly provide the document proving your status in Canada (valid work permit, study permit, PR card, Canadian passport)', 2, NULL, NULL),
(41, 2, 'Job letter stating your job title, start date of work, hours of work, number of hours per week, and salary', 2, NULL, NULL),
(42, 2, 'Enrolment letter from the college', 2, NULL, NULL),
(43, 2, 'Transcripts (official/unofficial for the courses completed)', 2, NULL, NULL),
(44, 2, 'Birth certificate if you invite your parents (if the document is not in English, kindly provide a translated copy along with the original)', 2, NULL, NULL),
(45, 2, 'Proof of relationship to the applicant (if inviting a relative)', 2, NULL, NULL),
(46, 2, 'Copy of passport with all stamps and visa pages', 2, NULL, NULL),
(47, 2, 'Invitation letter stating the reason for the visit, date of visit, background of the applicant, etc.', 2, NULL, NULL),
(48, 2, 'Pay stubs', 3, NULL, NULL),
(49, 2, 'Bank balance confirmation / portfolio letter from the bank', 3, NULL, NULL),
(50, 2, 'Bank statements (3 months)', 3, NULL, NULL),
(51, 2, 'RRSP etc. (if applicable)', 3, NULL, NULL),
(52, 2, 'NOA/T4’s (if applicable)', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_checklists`
--

CREATE TABLE `custom_checklists` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_checklists`
--

INSERT INTO `custom_checklists` (`id`, `title`, `applicant_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'check1', 6, NULL, 'inactive', NULL, '2025-07-31 05:13:37'),
(2, '9u09', 6, NULL, 'active', '2025-07-29 00:58:58', '2025-07-31 05:13:40'),
(3, '08-8', 6, NULL, 'inactive', '2025-07-29 00:58:58', '2025-07-31 00:08:47'),
(4, '9u09', 6, NULL, 'inactive', '2025-07-29 00:59:26', '2025-07-31 00:08:48'),
(19, 'iuip', 6, 1, 'inactive', '2025-07-31 06:32:48', '2025-07-31 06:32:48'),
(18, '0970', 6, 1, 'active', '2025-07-31 01:56:50', '2025-07-31 01:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `custom_document_checklists`
--

CREATE TABLE `custom_document_checklists` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `upload_by` bigint UNSIGNED DEFAULT NULL,
  `upload_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_document_checklists`
--

INSERT INTO `custom_document_checklists` (`id`, `title`, `applicant_id`, `upload_by`, `upload_path`, `created_at`, `updated_at`) VALUES
(20, '76876', 6, 1, 'uploads/checklists/Zql2upr53faq1tiGmCCPsupjsriyV5zpWGH40xMa.jpg', '2025-07-31 01:56:36', '2025-07-31 06:21:44'),
(22, 'test1', 6, 1, 'uploads/checklists/UnRF924jWBe5nFgvWqxtDx2MZpGyDpbFzAUPb9SW.jpg', '2025-07-31 02:27:44', '2025-07-31 02:48:57'),
(14, '9709', 6, 1, 'uploads/checklists/o3zzgeGAUWlTbTD4MsTOuAabpcFt9sVT6dotLi7i.jpg', '2025-07-29 00:45:48', '2025-07-31 01:21:39'),
(15, '89870', 6, 1, 'uploads/checklists/Q7sXaa4NMPvLYCT7EtAMQzm5N5RDmmR0RgAJKYNB.jpg', '2025-07-29 00:45:48', '2025-07-29 07:29:10'),
(24, '353', 6, 1, NULL, '2025-07-31 06:22:17', '2025-07-31 06:22:17'),
(17, '8787', 6, 1, 'uploads/checklists/JkxTup1mAOiR5HfXF90J88bTca6iXTbvVgCKJVah.jpg', '2025-07-29 00:55:44', '2025-07-31 01:26:05'),
(19, '09890', 6, 1, 'uploads/checklists/SBcOMMZuwJdSIjwg0sk8fI9g9BWggTsJE9WBgaqa.png', '2025-07-29 00:56:47', '2025-07-31 01:23:38'),
(23, 'uuiy', 6, 1, NULL, '2025-07-31 06:22:17', '2025-07-31 06:22:17'),
(25, '00-', 6, 1, NULL, '2025-07-31 06:22:35', '2025-07-31 06:22:35'),
(26, '9890', 6, 1, NULL, '2025-07-31 06:24:47', '2025-07-31 06:24:47'),
(27, 'ttttt', 6, 1, NULL, '2025-07-31 06:25:10', '2025-07-31 06:25:10'),
(30, 'u8-8', 6, 1, 'uploads/checklists/jfY4aexycoyxKwJtLTlbZnOV4Xs9jmai3Z6lhaTD.png', '2025-07-31 06:33:26', '2025-07-31 06:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `document_checklists`
--

CREATE TABLE `document_checklists` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applicant_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_checklists`
--

INSERT INTO `document_checklists` (`id`, `category_id`, `title`, `created_at`, `updated_at`, `applicant_id`) VALUES
(9, 1, 'Passports/Travel Documents (Multiple, Study Permit, Work Permit)', NULL, NULL, NULL),
(10, 1, 'Marriage License/Certificate', NULL, NULL, NULL),
(11, 1, 'Birth Certificate', NULL, NULL, NULL),
(12, 1, 'Police certificate', NULL, NULL, NULL),
(13, 1, 'Education (diplomas/degrees & transcripts)', NULL, NULL, NULL),
(14, 1, 'Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment all)', NULL, NULL, NULL),
(15, 1, 'Use of representative (IMM5476)', NULL, NULL, NULL),
(16, 1, 'Proof of Means of Financial Support – (as explained in the email)', NULL, NULL, NULL),
(17, 1, 'Digital Photo', NULL, NULL, NULL),
(18, 1, 'Proof of English Proficiency – IELTS/CELPIP/PTE', NULL, NULL, NULL),
(19, 1, 'Credential Evaluation (any education completed outside Canada)', NULL, NULL, NULL),
(20, 1, 'Spouse - Passports/Travel Documents (Multiple)', NULL, NULL, NULL),
(21, 1, 'Spouse - Education (diplomas/degrees & transcripts)', NULL, NULL, NULL),
(22, 1, 'Spouse - Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment)', NULL, NULL, NULL),
(23, 1, 'Spouse - Birth Certificate', NULL, NULL, NULL),
(24, 1, 'Spouse - Digital photo', NULL, NULL, NULL),
(25, 1, 'Spouse - Proof of English Proficiency – IELTS/CELPIP/PTE (optional)', NULL, NULL, NULL),
(26, 1, 'Spouse - Credential Evaluation (any education completed outside Canada) (optional)', NULL, NULL, NULL),
(27, 1, 'Child - Passports/Travel Documents (Multiple)', NULL, NULL, NULL),
(28, 1, 'Child - Education Documents', NULL, NULL, NULL),
(29, 1, 'Child - Birth Certificate', NULL, NULL, NULL),
(30, 1, 'Child - Digital photo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_headings`
--

CREATE TABLE `document_headings` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `document_headings`
--

INSERT INTO `document_headings` (`id`, `title`, `category_id`, `created_at`) VALUES
(1, 'For the applicant', 2, '2025-08-06 19:19:17'),
(2, 'Documents required from the inviter', 2, '2025-08-06 19:19:17'),
(3, 'Proof of funds of the inviter and/or spouse', 2, '2025-08-06 19:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_logs`
--

CREATE TABLE `history_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `change_by` bigint UNSIGNED DEFAULT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_id` int DEFAULT NULL,
  `custom_doc_id` int DEFAULT NULL,
  `custom_check_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_logs`
--

INSERT INTO `history_logs` (`id`, `applicant_id`, `change_by`, `message`, `note_id`, `custom_doc_id`, `custom_check_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'User Updated', NULL, NULL, NULL, '2025-07-30 02:38:52', '2025-07-30 02:38:52'),
(2, 6, 1, 'File Added', NULL, NULL, NULL, '2025-07-30 02:41:43', '2025-07-30 02:41:43'),
(3, 6, 1, 'File Added Todd', NULL, NULL, NULL, '2025-07-30 02:59:04', '2025-07-30 02:59:04'),
(4, 6, 1, 'Note Added', 1, NULL, NULL, '2025-07-31 00:30:29', '2025-07-31 00:30:29'),
(5, 6, 1, 'Note Added', 1, NULL, NULL, '2025-07-31 00:30:43', '2025-07-31 00:30:43'),
(6, 6, 1, 'Custom Document Updated', NULL, 17, NULL, '2025-07-31 01:26:05', '2025-07-31 01:26:05'),
(7, 6, 1, 'Custom Document Updated', NULL, 16, NULL, '2025-07-31 01:56:16', '2025-07-31 01:56:16'),
(8, 6, 1, 'Custom Document Deleted', NULL, 12, NULL, '2025-07-31 01:56:23', '2025-07-31 01:56:23'),
(9, 6, 1, 'Custom Document Added', NULL, 20, NULL, '2025-07-31 01:56:36', '2025-07-31 01:56:36'),
(10, 6, 1, 'Custom Document Added', NULL, 21, NULL, '2025-07-31 01:56:36', '2025-07-31 01:56:36'),
(11, 6, 1, 'Custom CheckList Added', NULL, NULL, 5, '2025-07-31 01:56:50', '2025-07-31 01:56:50'),
(12, 6, 1, 'Custom CheckList Added', NULL, NULL, 5, '2025-07-31 01:56:50', '2025-07-31 01:56:50'),
(13, 6, 1, 'Custom CheckList Status Update', NULL, NULL, 5, '2025-07-31 01:56:53', '2025-07-31 01:56:53'),
(14, 6, 1, 'Custom CheckList Deleted', NULL, NULL, 4, '2025-07-31 01:57:01', '2025-07-31 01:57:01'),
(15, 6, 1, 'Note Added', 14, NULL, NULL, '2025-07-31 02:09:04', '2025-07-31 02:09:04'),
(16, 6, 1, 'Note Added', 15, NULL, NULL, '2025-07-31 02:09:55', '2025-07-31 02:09:55'),
(17, 6, 1, 'Note Updated', 1, NULL, NULL, '2025-07-31 02:24:42', '2025-07-31 02:24:42'),
(18, 6, 1, 'Custom Document Updated', NULL, 20, NULL, '2025-07-31 02:27:21', '2025-07-31 02:27:21'),
(19, 6, 1, 'Custom Document Deleted', NULL, 21, NULL, '2025-07-31 02:27:33', '2025-07-31 02:27:33'),
(20, 6, 1, 'Custom Document Added', NULL, 22, NULL, '2025-07-31 02:27:44', '2025-07-31 02:27:44'),
(21, 6, 1, 'Custom Document Updated', NULL, 22, NULL, '2025-07-31 02:28:44', '2025-07-31 02:28:44'),
(22, 6, 1, 'Custom Document Updated', NULL, 22, NULL, '2025-07-31 02:48:57', '2025-07-31 02:48:57'),
(23, 6, 1, 'Custom Document Deleted', NULL, 16, NULL, '2025-07-31 04:15:13', '2025-07-31 04:15:13'),
(24, 6, 1, 'Custom CheckList Status Update', NULL, NULL, 1, '2025-07-31 05:13:37', '2025-07-31 05:13:37'),
(25, 6, 1, 'Custom CheckList Status Update', NULL, NULL, 2, '2025-07-31 05:13:40', '2025-07-31 05:13:40'),
(26, 6, 1, 'Custom Document Updated', NULL, 20, NULL, '2025-07-31 06:21:44', '2025-07-31 06:21:44'),
(27, 6, 1, 'Custom Document Added', NULL, 23, NULL, '2025-07-31 06:22:17', '2025-07-31 06:22:17'),
(28, 6, 1, 'Custom Document Added', NULL, 24, NULL, '2025-07-31 06:22:17', '2025-07-31 06:22:17'),
(29, 6, 1, 'Custom Document Added', NULL, 25, NULL, '2025-07-31 06:22:35', '2025-07-31 06:22:35'),
(30, 6, 1, 'Custom Document Added', NULL, 26, NULL, '2025-07-31 06:24:47', '2025-07-31 06:24:47'),
(31, 6, 1, 'Custom Document Added', NULL, 27, NULL, '2025-07-31 06:25:10', '2025-07-31 06:25:10'),
(32, 6, 1, 'Custom Document Added', NULL, 28, NULL, '2025-07-31 06:28:07', '2025-07-31 06:28:07'),
(33, 6, 1, 'Custom Document Added', NULL, 29, NULL, '2025-07-31 06:28:07', '2025-07-31 06:28:07'),
(34, 6, 1, 'Custom Document Deleted', NULL, 28, NULL, '2025-07-31 06:28:39', '2025-07-31 06:28:39'),
(35, 6, 1, 'Custom Document Deleted', NULL, 29, NULL, '2025-07-31 06:28:52', '2025-07-31 06:28:52'),
(36, 6, 1, 'Custom CheckList Added', NULL, NULL, 19, '2025-07-31 06:32:48', '2025-07-31 06:32:48'),
(37, 6, 1, 'Custom Document Added', NULL, 30, NULL, '2025-07-31 06:33:26', '2025-07-31 06:33:26'),
(38, 6, 1, 'Custom CheckList Added', NULL, NULL, 20, '2025-07-31 06:33:37', '2025-07-31 06:33:37'),
(39, 6, 1, 'Custom CheckList Status Update', NULL, NULL, 20, '2025-07-31 06:45:24', '2025-07-31 06:45:24'),
(40, 6, 1, 'Custom CheckList Deleted', NULL, NULL, 20, '2025-07-31 06:46:13', '2025-07-31 06:46:13'),
(41, 6, 1, 'Note Added', 16, NULL, NULL, '2025-07-31 07:00:41', '2025-07-31 07:00:41'),
(42, 6, 1, 'Note Added', 17, NULL, NULL, '2025-07-31 07:00:41', '2025-07-31 07:00:41'),
(43, 6, 1, 'Note Deleted', 1, NULL, NULL, '2025-07-31 07:00:53', '2025-07-31 07:00:53'),
(44, 15, 1, 'File Added', NULL, NULL, NULL, '2025-07-31 07:32:04', '2025-07-31 07:32:04'),
(45, 16, 1, 'File Added', NULL, NULL, NULL, '2025-07-31 07:32:19', '2025-07-31 07:32:19'),
(46, 17, 1, 'File Added', NULL, NULL, NULL, '2025-07-31 07:32:37', '2025-07-31 07:32:37'),
(47, 18, 1, 'File Added', NULL, NULL, NULL, '2025-07-31 07:32:42', '2025-07-31 07:32:42'),
(48, 19, 1, 'File Added', NULL, NULL, NULL, '2025-07-31 07:33:12', '2025-07-31 07:33:12'),
(49, 5, 1, 'File created', NULL, NULL, NULL, '2025-08-06 10:28:26', '2025-08-06 10:28:26'),
(50, 6, 1, 'File created', NULL, NULL, NULL, '2025-08-06 10:28:33', '2025-08-06 10:28:33'),
(51, 7, 1, 'File updated', NULL, NULL, NULL, '2025-08-06 10:28:43', '2025-08-06 10:28:43'),
(52, 8, 1, 'File updated', NULL, NULL, NULL, '2025-08-06 10:28:48', '2025-08-06 10:28:48'),
(53, 9, 1, 'File updated', NULL, NULL, NULL, '2025-08-06 10:29:05', '2025-08-06 10:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2014_10_12_000000_create_users_table', 3),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2025_07_16_054326_create_roles_table', 2),
(12, '2025_07_21_061640_create_applicants_table', 4),
(13, '2025_07_21_061642_create_sub_applicants_table', 4),
(14, '2025_07_22_111203_create_categories_table', 5),
(15, '2025_07_22_124211_create_document_checklists_table', 6),
(16, '2025_07_25_114948_create_custom_document_checklists_table', 7),
(17, '2025_07_25_125915_create_upload_check_lists_table', 8),
(18, '2025_07_28_121136_create_custom_checklists_table', 9),
(19, '2025_07_29_065745_create_check_lists_table', 10),
(20, '2025_07_29_070304_create_add_check_lists_table', 10),
(21, '2025_07_29_112031_create_notes_table', 11),
(22, '2025_07_30_075420_create_history_logs_table', 12),
(23, '2025_08_05_051552_create_audits_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint UNSIGNED NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `applicant_id`, `added_by`, `text`, `created_at`, `updated_at`) VALUES
(2, 6, NULL, '8789', '2025-07-29 06:46:45', '2025-07-29 06:46:45'),
(3, 6, NULL, 'Dolor debitis dolore', '2025-07-29 06:47:01', '2025-07-29 06:47:01'),
(4, 6, NULL, 'Consequatur Quis te', '2025-07-29 06:47:01', '2025-07-29 06:47:01'),
(5, 6, NULL, 'Eiusmod saepe numqua', '2025-07-29 06:47:01', '2025-07-29 06:47:01'),
(6, 6, NULL, 'Quis qui ipsam dicta', '2025-07-29 06:47:01', '2025-07-29 06:47:01'),
(7, 2, 1, 'iouioupup', '2025-07-30 00:22:57', '2025-07-30 00:47:56'),
(9, 6, 1, 'p[i[', '2025-07-31 00:30:29', '2025-07-31 00:30:29'),
(10, 6, 1, '8707', '2025-07-31 00:30:43', '2025-07-31 00:30:43'),
(11, 6, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'', '2025-07-31 02:04:56', '2025-07-31 02:04:56'),
(12, 6, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'', '2025-07-31 02:05:38', '2025-07-31 02:05:38'),
(13, 6, 1, '\\kk', '2025-07-31 02:05:49', '2025-07-31 02:05:49'),
(14, 6, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2025-07-31 02:09:04', '2025-07-31 02:09:04'),
(15, 6, 1, 'last', '2025-07-31 02:09:55', '2025-07-31 02:09:55'),
(16, 6, 1, '78jh', '2025-07-31 07:00:41', '2025-07-31 07:00:41'),
(17, 6, 1, 'khl', '2025-07-31 07:00:41', '2025-07-31 07:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5bea172275aff873f305cd2f4272d20d873585d997e4181e19983e12dd3b074ec7f211ddd12fbf2c', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:20:36', '2025-07-25 00:20:37', '2026-07-25 05:50:36'),
('55563695311b37e981c1896b9c1007c1a1fc51b7978ee5b59cb4d18d72a36ff8ce4d94e7deb7f137', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:24:12', '2025-07-25 00:24:12', '2026-07-25 05:54:12'),
('19a09fa9fa024b237bfe6998878b04b8099b0ab0ee1e6a155d96d3d7a20a181815599c3a565c9734', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:24:20', '2025-07-25 00:24:20', '2026-07-25 05:54:20'),
('b98e4faafb843ca01ec0379188dc46a7999bb4089342ec96fe2d5bfd96679ac38c72ed06e64646ce', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:25:14', '2025-07-25 00:25:14', '2026-07-25 05:55:14'),
('33c3788f8d856ffec204b005f6b11dc9cc39e7b89b8105338c9e95f39b44e1b21fef0d9291bba123', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:31:40', '2025-07-25 00:31:40', '2026-07-25 06:01:40'),
('e01a6163d65c3081f06d9310c9496ac6ef746c45ed243a31d87b4b81b48ffc43082bf0b56b5f785f', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:32:27', '2025-07-25 00:32:27', '2026-07-25 06:02:27'),
('4d0d4d507b04b0a9affad9f705a171e213a6ac7a42c93bd73b82adf1cb54adb6dd496899bbaac3e0', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:33:49', '2025-07-25 00:33:49', '2026-07-25 06:03:49'),
('f0f62971d56d106f23c0172f8411194fb2cd4dbbb8a1fa04e7a60d43df7c35ace1ac5b82cc9666d7', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:34:28', '2025-07-25 00:34:28', '2026-07-25 06:04:28'),
('35dcfc660c88a282a94f88e42fe6c987b768f374779f9ec3131b1f669fa57c6f6d552ccb7db00730', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 00:35:44', '2025-07-25 00:35:44', '2026-07-25 06:05:44'),
('231d47edfc817ed2293385c059398d635ae4ece59361e20a5d391209b1cffd847e6f3fec8ffc5326', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 01:17:26', '2025-07-25 01:17:26', '2026-07-25 06:47:26'),
('48dd7a6e4ef450588d0375f7b75aad661e505377d85d2fe2dcf5b932957e86fe241b03e3e5492ab7', 1, 1, 'Microsoft-Login', '[]', 0, '2025-07-25 01:24:12', '2025-07-25 01:24:12', '2026-07-25 06:54:12'),
('8857d9b7643480919a9291b363ed6acec1b0bc1ce81cd80acf70f33a3d3f14e0c24dc05131702d67', 1, 3, 'Microsoft-Login', '[]', 0, '2025-07-25 03:05:21', '2025-07-25 03:05:21', '2026-07-25 08:35:21'),
('1d6648b981c600975c2767c77c24d4de3e861ae43714162f9c7d92cbfb4962aa087322a1630a17db', 1, 3, 'Microsoft-Login', '[]', 0, '2025-07-25 04:46:20', '2025-07-25 04:46:20', '2026-07-25 10:16:20'),
('0d24660595584b1914107472432dc441b63e27202d3fb2e7e8d8aa18773d3cd86edb4ed0366fda0a', 1, 3, 'Microsoft-Login', '[]', 0, '2025-07-25 06:32:33', '2025-07-25 06:32:33', '2026-07-25 12:02:33'),
('6eec78d5ffb5b1f92822e04f4b6bfdbff31b0bb84a6487d20fdbd11c4c9e0fb52f975d881eb9f560', 1, 3, 'Microsoft-Login', '[]', 0, '2025-08-05 13:54:17', '2025-08-05 13:54:17', '2026-08-05 19:24:17'),
('76466f8757712560a5ed324dea46d81b323eb889f57e5d9749e1f54014974c4dc52de70958014e84', 1, 3, 'Microsoft-Login', '[]', 0, '2025-08-06 10:26:33', '2025-08-06 10:26:33', '2026-08-06 15:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'jsr3jxQNXVWh5EDw1n8R7jiI0kPWbVrlsbCbGRbA', NULL, 'http://localhost', 1, 0, 0, '2025-07-25 00:20:15', '2025-07-25 00:20:15'),
(2, NULL, 'Laravel Password Grant Client', 'JLG3TGHwBAPCaj4VtB18sva64at6PGBrSvZivTKA', 'users', 'http://localhost', 0, 1, 0, '2025-07-25 00:20:15', '2025-07-25 00:20:15'),
(3, NULL, 'Laravel Personal Access Client', 'Cpsq330XB8KVznGA6zkl3FcybubKmRb7mDbsYqQZ', NULL, 'http://localhost', 1, 0, 0, '2025-07-25 01:35:22', '2025-07-25 01:35:22'),
(4, NULL, 'Laravel Password Grant Client', 'BCjPlt25FpMj77TOPFGHdztqlwK3F90G8rnF0siJ', 'users', 'http://localhost', 0, 1, 0, '2025-07-25 01:35:22', '2025-07-25 01:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-07-25 00:20:15', '2025-07-25 00:20:15'),
(2, 3, '2025-07-25 01:35:22', '2025-07-25 01:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '0000-00-00 00:00:00', NULL),
(2, 'Admin', '0000-00-00 00:00:00', NULL),
(3, 'Manager', NULL, NULL),
(4, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_applicants`
--

CREATE TABLE `sub_applicants` (
  `id` bigint UNSIGNED NOT NULL,
  `external_id` int NOT NULL,
  `applicant_id` bigint UNSIGNED NOT NULL,
  `family_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `given_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `number_of_applicants` int DEFAULT NULL,
  `country_of_residence` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_citizenship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_dob` date DEFAULT NULL,
  `have_children` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `children_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `applied_canada_visa` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applied_canada_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refused_canada_visa` tinyint(1) DEFAULT NULL,
  `refused_canada_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refused_us_visa` tinyint(1) DEFAULT NULL,
  `refused_us_visa_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `interested_program` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_start_date` date DEFAULT NULL,
  `edu_end_date` date DEFAULT NULL,
  `edu_degree` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_start_date` date DEFAULT NULL,
  `emp_end_date` date DEFAULT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_worth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income_source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listening_score` int DEFAULT NULL,
  `reading_score` int DEFAULT NULL,
  `writing_score` int DEFAULT NULL,
  `speaking_score` int DEFAULT NULL,
  `test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `spouse_edu_start_date` date DEFAULT NULL,
  `spouse_edu_end_date` date DEFAULT NULL,
  `spouse_edu_degree` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_edu_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_emp_start_date` date DEFAULT NULL,
  `spouse_emp_end_date` date DEFAULT NULL,
  `spouse_designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_net_worth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_income_source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_property_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_listening_score` int DEFAULT NULL,
  `spouse_reading_score` int DEFAULT NULL,
  `spouse_writing_score` int DEFAULT NULL,
  `spouse_speaking_score` int DEFAULT NULL,
  `spouse_test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_test_date` date DEFAULT NULL,
  `have_connections` tinyint(1) DEFAULT NULL,
  `friends_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `family_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_applicants`
--

INSERT INTO `sub_applicants` (`id`, `external_id`, `applicant_id`, `family_name`, `given_name`, `phone_number`, `email_id`, `date_of_birth`, `gender`, `marital_status`, `address`, `number_of_applicants`, `country_of_residence`, `country_of_citizenship`, `status`, `spouse_name`, `spouse_dob`, `have_children`, `children_details`, `applied_canada_visa`, `applied_canada_visa_details`, `refused_canada_visa`, `refused_canada_visa_details`, `refused_us_visa`, `refused_us_visa_details`, `interested_program`, `edu_start_date`, `edu_end_date`, `edu_degree`, `edu_field`, `emp_start_date`, `emp_end_date`, `designation`, `emp_location`, `company_name`, `net_worth`, `income_source`, `property_value`, `listening_score`, `reading_score`, `writing_score`, `speaking_score`, `test_type`, `test_date`, `spouse_edu_start_date`, `spouse_edu_end_date`, `spouse_edu_degree`, `spouse_edu_field`, `spouse_emp_start_date`, `spouse_emp_end_date`, `spouse_designation`, `spouse_location`, `spouse_company`, `spouse_net_worth`, `spouse_income_source`, `spouse_property_value`, `spouse_listening_score`, `spouse_reading_score`, `spouse_writing_score`, `spouse_speaking_score`, `spouse_test_type`, `spouse_test_date`, `have_connections`, `friends_details`, `family_details`, `created_at`, `updated_at`) VALUES
(1, 102, 1, 'Carl Moss', 'Select Title', '+1 (569) 678-8844', 'dimuqoq@mailinator.com', '1989-05-04', 'Female', 'Widowed', 'Numquam voluptatem', 1, 'Maiores numquam odit', 'Molestias sint maxi', 'Pending Document Request', 'Shaeleigh Forbes', '2009-05-01', 'Eum saepe rerum cons', 'Possimus nisi possi', 'Est quo maxime quis', 'Exercitationem sit a', 1, '1', 0, '0', 'Aliqua Quam ea dolo', '1980-02-19', '2000-06-12', 'Aut in voluptate off', 'Et necessitatibus ne', '1972-01-30', '2004-10-01', 'Consequatur qui ut', 'Quia in laboriosam', 'Lott Reid Traders', 'Ut quia consequuntur', '572', 'Repellendus Ad dolo', 36, 51, 10, 6, 'Cupidatat unde quam', '1999-05-08', '2022-12-21', '1999-06-24', 'Laborum Qui alias m', 'Saepe tempora sequi', '2001-05-14', '2023-02-02', 'Quas ducimus omnis', 'Similique omnis temp', 'Mcleod Foley Associates', 'Illum est rem quia', '610', 'Beatae autem veniam', 5, 59, 26, 40, 'Exercitation et cill', '1998-10-12', 1, 'Amet fuga Neque qu', 'Nam ut irure molliti', '2025-07-22 05:00:24', '2025-07-23 04:55:26'),
(2, 103, 1, 'Scarlet Bender', 'Miss', '+1 (793) 667-9699', 'raze@mailinator.com', '1988-07-19', 'Other', 'Married', 'Dolores similique od', 6, 'Quaerat deserunt acc', 'Voluptatem magna ten', 'Final Review', 'Walter Dodson', '1994-02-24', 'Aliqua Consequuntur', 'Mollit dolore pariat', 'Officia quos quas Na', 'Officia tempore fug', 0, '0', 1, '0', 'Accusamus fuga Tene', '2009-09-01', '1997-10-16', 'Ad dolorem voluptati', 'Officia architecto e', '2016-01-29', '1995-09-06', 'Molestiae qui omnis', 'Reprehenderit fugiat', 'England and Wise Inc', 'Dolor blanditiis do', '673', 'Corrupti animi ab', 38, 64, 78, 87, 'Eveniet rerum velit', '2006-10-20', '2006-11-09', '2004-01-02', 'Dicta tempore et ul', 'Voluptatem enim cons', '1980-10-10', '2021-07-09', 'Iste consequatur inc', 'Enim cillum nisi aut', 'Powers and Reeves Plc', 'Elit culpa quaerat', '264', 'Repudiandae reiciend', 43, 62, 95, 60, 'Alias eveniet conse', '2011-09-09', 0, 'Quasi doloribus nemo', 'In et veritatis ut n', '2025-07-22 05:00:24', '2025-07-23 04:55:26'),
(3, 104, 2, 'Carl Moss', 'Select Title', '+1 (569) 678-8844', 'dimuqoq@mailinator.com', '1989-05-04', 'Female', 'Widowed', 'Numquam voluptatem', 1, 'Maiores numquam odit', 'Molestias sint maxi', 'Pending Document Request', 'Shaeleigh Forbes', '2009-05-01', 'Eum saepe rerum cons', 'Possimus nisi possi', 'Est quo maxime quis', 'Exercitationem sit a', 1, '1', 0, '0', '2', '1980-02-19', '2000-06-12', 'Aut in voluptate off', 'Et necessitatibus ne', '1972-01-30', '2004-10-01', 'Consequatur qui ut', 'Quia in laboriosam', 'Lott Reid Traders', 'Ut quia consequuntur', '572', 'Repellendus Ad dolo', 36, 51, 10, 6, 'Cupidatat unde quam', '1999-05-08', '2022-12-21', '1999-06-24', 'Laborum Qui alias m', 'Saepe tempora sequi', '2001-05-14', '2023-02-02', 'Quas ducimus omnis', 'Similique omnis temp', 'Mcleod Foley Associates', 'Illum est rem quia', '610', 'Beatae autem veniam', 5, 59, 26, 40, 'Exercitation et cill', '1998-10-12', 1, 'Amet fuga Neque qu', 'Nam ut irure molliti', '2025-07-22 05:02:37', '2025-07-23 02:36:07'),
(4, 105, 2, 'Scarlet Bender', 'Miss', '+1 (793) 667-9699', 'raze@mailinator.com', '1988-07-19', 'Other', 'Married', 'Dolores similique od', 6, 'Quaerat deserunt acc', 'Voluptatem magna ten', 'Final Review', 'Walter Dodson', '1994-02-24', 'Aliqua Consequuntur', 'Mollit dolore pariat', 'Officia quos quas Na', 'Officia tempore fug', 0, '0', 1, '0', '2', '2009-09-01', '1997-10-16', 'Ad dolorem voluptati', 'Officia architecto e', '2016-01-29', '1995-09-06', 'Molestiae qui omnis', 'Reprehenderit fugiat', 'England and Wise Inc', 'Dolor blanditiis do', '673', 'Corrupti animi ab', 38, 64, 78, 87, 'Eveniet rerum velit', '2006-10-20', '2006-11-09', '2004-01-02', 'Dicta tempore et ul', 'Voluptatem enim cons', '1980-10-10', '2021-07-09', 'Iste consequatur inc', 'Enim cillum nisi aut', 'Powers and Reeves Plc', 'Elit culpa quaerat', '264', 'Repudiandae reiciend', 43, 62, 95, 60, 'Alias eveniet conse', '2011-09-09', 0, 'Quasi doloribus nemo', 'In et veritatis ut n', '2025-07-22 05:02:37', '2025-07-23 02:36:07'),
(5, 106, 2, 'Zia Gonzalez', 'Miss', '+1 (654) 736-2032', 'lenocyram@mailinator.com', '1974-03-07', 'Female', 'Widowed', 'Repellendus Eu haru', 2, 'Debitis est ducimus', 'Id adipisci enim dol', 'Single', 'Zorita Good', '2002-04-05', 'Optio eveniet reru', 'Fugiat officiis impe', 'Excepteur dolor reru', 'Vitae eaque dolorem', 0, '1', 1, '1', '2', '1988-12-10', '2006-04-30', 'Nobis numquam possim', 'Dolore in autem temp', '1977-07-08', '2020-03-28', 'Consequatur non maxi', 'Illum consequuntur', 'Cote and Webb Trading', 'Commodo deserunt duc', '146', 'Consequatur aut num', 70, 7, 6, 61, 'Non necessitatibus n', '1973-10-28', '2021-02-28', '2009-11-07', 'Perferendis autem qu', 'Est rerum nesciunt', '1985-03-18', '2001-07-30', 'Praesentium laborum', 'Illo ut sequi aspern', 'Douglas and Whitaker Traders', 'Quo magni nostrud iu', '625', 'Aut ea do eos aliqua', 40, 90, 34, 84, 'Commodi velit est ea', '2024-05-06', 0, 'Laudantium nesciunt', 'Est quis lorem nemo', '2025-07-22 05:02:37', '2025-07-23 02:36:07'),
(6, 107, 2, 'Thomas Oneal', 'Mr', '+1 (934) 907-5187', 'ryfucykena@mailinator.com', '1970-12-10', 'Select Gender', 'Widowed', 'Minima et qui except', 9, 'Quam laborum Dolore', 'Sunt quo id mollitia', 'New', 'Xyla Cannon', '2016-01-01', 'Rem voluptatem mini', 'Maxime corrupti sit', 'Facilis odio ut non', 'Et quia duis aliquid', 0, '0', 0, '1', '2', '1977-03-21', '1980-12-23', 'Illo voluptatem ut d', 'Dolores ut occaecat', '2011-11-18', '2003-02-08', 'Voluptatibus et sit', 'Similique consectetu', 'Lindsay and Hudson Trading', 'Impedit cupidatat v', '448', 'Quis irure beatae mo', 24, 31, 20, 61, 'Dolorum nesciunt an', '1980-11-09', '1977-08-25', '1985-11-04', 'Laboriosam sit ab n', 'Fuga Id voluptate c', '2011-01-31', '2023-03-17', 'Dolore voluptatem F', 'Quae eum omnis volup', 'Eaton Watkins Trading', 'Commodi dolorum dese', '471', 'Quis vitae nihil in', 10, 59, 95, 95, 'Asperiores pariatur', '1993-10-03', 1, 'Enim fugiat molestia', 'Consequat Voluptate', '2025-07-22 05:02:37', '2025-07-23 02:36:07'),
(7, 108, 2, 'Ivan Holcomb', 'Select Title', '+1 (884) 307-2814', 'nazoculad@mailinator.com', '1995-12-10', 'Select Gender', 'Single', 'In at perferendis am', 8, 'Velit obcaecati ven', 'Minus irure aut vel', 'Final Review', 'Hyatt Stanton', '1997-10-08', 'A iusto eum voluptat', 'Impedit incididunt', 'Sunt veritatis dolor', 'Ex architecto blandi', 0, '0', 1, '0', '2', '1991-06-10', '2002-11-27', 'Tempora cum maiores', 'Id nisi adipisci co', '1970-04-04', '1986-02-10', 'Praesentium quis ali', 'Tempora labore numqu', 'Moran and Bates Inc', 'Et adipisicing repre', '732', 'Aliquam quis optio', 36, 95, 31, 92, 'Nam sed doloremque l', '2017-05-01', '2009-05-15', '1991-05-12', 'Veniam officiis vol', 'Ex quis irure aut om', '1980-09-29', '2001-03-03', 'Mollit necessitatibu', 'Excepturi velit volu', 'Burns Harrison Plc', 'Sit rem ea reiciendi', '215', 'Adipisicing qui cons', 85, 51, 60, 18, 'Harum saepe occaecat', '1992-07-13', 1, 'Est nihil eum conse', 'Doloremque tempore', '2025-07-22 05:02:37', '2025-07-23 02:36:07'),
(8, 109, 3, 'Chiquita Vazquez', 'Mrs', '+1 (255) 827-5547', 'tokoc@mailinator.com', '1979-05-17', 'Female', 'Married', 'Corporis quis quis e', 1, 'Tenetur velit eum pe', 'Nihil neque ut velit', 'Widowed', 'Calvin Franks', '2008-08-26', 'Sed in molestiae nos', 'Assumenda et quasi e', 'Laudantium adipisci', 'Nulla quis blanditii', 1, '0', 1, '1', '2', '1974-01-31', '1992-06-19', 'Iure voluptates dolo', 'Provident repudiand', '1990-01-15', '2000-07-06', 'Consequuntur totam o', 'Accusamus voluptatem', 'Singleton and Joseph Co', 'Non officiis cumque', '965', 'Deserunt assumenda s', 96, 88, 69, 26, 'Tempore aliqua Exp', '1979-12-04', '2022-10-03', '2023-07-12', 'Explicabo Sunt sit', 'Esse aut et cillum', '2016-07-21', '2014-04-21', 'Quisquam iure ut mol', 'Perferendis earum am', 'Bishop Ortiz Inc', 'Laudantium tempor d', '369', 'Nemo non dolor volup', 39, 78, 87, 15, 'Aut aliquip voluptas', '2012-11-20', 0, 'Sit esse a fugiat', 'Sit accusantium acc', '2025-07-22 06:46:18', '2025-07-22 06:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `upload_check_lists`
--

CREATE TABLE `upload_check_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `applicant_id` bigint UNSIGNED DEFAULT NULL,
  `upload_by` bigint UNSIGNED DEFAULT NULL,
  `doc_id` bigint UNSIGNED DEFAULT NULL,
  `upload_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upload_check_lists`
--

INSERT INTO `upload_check_lists` (`id`, `applicant_id`, `upload_by`, `doc_id`, `upload_path`, `created_at`, `updated_at`) VALUES
(13, NULL, NULL, 9, 'uploads/checklists/v9QjzST690GqaAb8rfwSXGbtih8xxAPAgGFWOZGA.jpg', '2025-07-28 05:36:17', '2025-07-28 05:36:17'),
(10, 2, NULL, 1, 'uploads/checklists/ilrO7K34637YYe37X6OhukRHANgtFSvYoBL6G1nx.jpg', '2025-07-28 02:50:58', '2025-07-28 04:51:34'),
(12, NULL, NULL, 8, 'uploads/checklists/muHVnV7hHJLoVQOe8HfYwkZDXtFsdfG6JuFgiroE.png', '2025-07-28 05:33:29', '2025-07-28 05:39:01'),
(9, 6, 1, 2, 'uploads/checklists/7JiXRKLZg5EmzS6XEHWQSZhUWo7SQAVZlVgCCYc3.jpg', '2025-07-28 02:49:19', '2025-07-31 04:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `role_id`, `position`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Todd', 'Lawrence', 'bifot@mailinator.com', 1, 'Expedita eu nostrud', 'uploads/users/f9460563-b9a6-4da0-a841-136940e58d7b.png', '2025-07-16 01:42:13', '2025-07-16 01:42:13'),
(2, 'Halla', 'Dillard', 'zaqucil@mailinator.com', 3, 'Autem ipsum illum', 'uploads/users/eac93c20-3e91-4086-9fc4-a58b72f605bf.png', '2025-07-16 02:11:02', '2025-07-16 04:55:37'),
(3, 'Unity', 'Olson', 'tabajotew@mailinator.com', 1, 'Optio eos esse con', 'uploads/users/e3a77028-9c3e-4752-a761-95a128f7605b.png', '2025-07-16 02:15:41', '2025-07-16 02:15:41'),
(4, 'Kai', 'Harris', 'hyzil@mailinator.com', 2, 'Velit temporibus aut', 'uploads/users/37d25e29-c049-4ca4-b04a-a0169cd32b0b.png', '2025-07-16 02:16:36', '2025-07-16 02:16:36'),
(5, 'Upton', 'Carey', 'pyqiti@mailinator.com', 2, 'Ea voluptatibus nisi', 'uploads/users/1232c84f-a4c0-4b82-b717-923e620f7452.png', '2025-07-16 02:37:18', '2025-07-16 02:37:18'),
(6, 'Fredericka', 'Valdez', 'seriwok@mailinator.com', 3, 'Est maiores officia', 'uploads/users/54a41cfe-dc6a-4936-89e9-01ca30001a9c.png', '2025-07-16 02:38:36', '2025-07-16 02:38:36'),
(7, 'Tana', 'Salinas', 'luxicywo@mailinator.com', 2, 'Est ea voluptas natu', 'uploads/users/5e5cc8e3-ad63-4707-823d-7b3136a44af1.png', '2025-07-16 02:45:08', '2025-07-16 02:45:08'),
(8, 'Jackson', 'Aguirre', 'lonuf@mailinator.com', 1, 'Aut ut mollit in aut', 'uploads/users/2d83d645-259a-437d-932e-6c75631ea940.png', '2025-07-16 02:45:17', '2025-07-16 02:45:17'),
(9, 'Anastasia', 'Mccullough', 'xoneh@mailinator.com', 4, 'Earum voluptas sequi', 'uploads/users/9ff79145-d726-4421-99dd-4ece04a7faa1.png', '2025-07-16 02:45:26', '2025-07-16 02:45:26'),
(10, 'Declan', 'Mcfadden', 'rusuhi@mailinator.com', 1, 'Et non dolor sint in', 'uploads/users/5aa324a5-197d-4d06-a83c-5bc4687faa80.png', '2025-07-16 02:45:47', '2025-07-16 02:45:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_check_lists`
--
ALTER TABLE `add_check_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `add_check_lists_update_by_foreign` (`update_by`),
  ADD KEY `add_check_lists_applicant_id_foreign` (`applicant_id`),
  ADD KEY `add_check_lists_list_id_foreign` (`list_id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_lists`
--
ALTER TABLE `check_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `check_lists_category_id_foreign` (`category_id`);

--
-- Indexes for table `custom_checklists`
--
ALTER TABLE `custom_checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_checklists_added_by_foreign` (`added_by`),
  ADD KEY `custom_checklists_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `custom_document_checklists`
--
ALTER TABLE `custom_document_checklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_document_checklists_upload_by_foreign` (`upload_by`),
  ADD KEY `custom_document_checklists_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `document_checklists`
--
ALTER TABLE `document_checklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_headings`
--
ALTER TABLE `document_headings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `history_logs`
--
ALTER TABLE `history_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_logs_change_by_foreign` (`change_by`),
  ADD KEY `history_logs_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_added_by_foreign` (`added_by`),
  ADD KEY `notes_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_applicants`
--
ALTER TABLE `sub_applicants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_applicants_external_id_unique` (`external_id`),
  ADD KEY `sub_applicants_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `upload_check_lists`
--
ALTER TABLE `upload_check_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_check_lists_upload_by_foreign` (`upload_by`),
  ADD KEY `upload_check_lists_applicant_id_foreign` (`applicant_id`),
  ADD KEY `upload_check_lists_doc_id_foreign` (`doc_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_check_lists`
--
ALTER TABLE `add_check_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `check_lists`
--
ALTER TABLE `check_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `custom_checklists`
--
ALTER TABLE `custom_checklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `custom_document_checklists`
--
ALTER TABLE `custom_document_checklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `document_checklists`
--
ALTER TABLE `document_checklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `document_headings`
--
ALTER TABLE `document_headings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_logs`
--
ALTER TABLE `history_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_applicants`
--
ALTER TABLE `sub_applicants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `upload_check_lists`
--
ALTER TABLE `upload_check_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
