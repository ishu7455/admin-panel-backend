-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 07, 2025 at 01:04 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `immigration1`
--

-- --------------------------------------------------------

--
-- Table structure for table `document_checklists`
--

DROP TABLE IF EXISTS `document_checklists`;
CREATE TABLE IF NOT EXISTS `document_checklists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applicant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_checklists`
--

INSERT INTO `document_checklists` (`id`, `category_id`, `title`, `heading_id`, `created_at`, `updated_at`, `applicant_id`) VALUES
(9, 1, 'Passports/Travel Documents (Multiple, Study Permit, Work Permit)', NULL, NULL, NULL, NULL),
(10, 1, 'Marriage License/Certificate', NULL, NULL, NULL, NULL),
(11, 1, 'Birth Certificate', NULL, NULL, NULL, NULL),
(12, 1, 'Police certificate', NULL, NULL, NULL, NULL),
(13, 1, 'Education (diplomas/degrees & transcripts)', NULL, NULL, NULL, NULL),
(14, 1, 'Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment all)', NULL, NULL, NULL, NULL),
(15, 1, 'Use of representative (IMM5476)', NULL, NULL, NULL, NULL),
(16, 1, 'Proof of Means of Financial Support – (as explained in the email)', NULL, NULL, NULL, NULL),
(17, 1, 'Digital Photo', NULL, NULL, NULL, NULL),
(18, 1, 'Proof of English Proficiency – IELTS/CELPIP/PTE', NULL, NULL, NULL, NULL),
(19, 1, 'Credential Evaluation (any education completed outside Canada)', NULL, NULL, NULL, NULL),
(20, 1, 'Spouse - Passports/Travel Documents (Multiple)', NULL, NULL, NULL, NULL),
(21, 1, 'Spouse - Education (diplomas/degrees & transcripts)', NULL, NULL, NULL, NULL),
(22, 1, 'Spouse - Employment Records (Offer Letter, Relieving Letter, Current & Previous proof of employment)', NULL, NULL, NULL, NULL),
(23, 1, 'Spouse - Birth Certificate', NULL, NULL, NULL, NULL),
(24, 1, 'Spouse - Digital photo', NULL, NULL, NULL, NULL),
(25, 1, 'Spouse - Proof of English Proficiency – IELTS/CELPIP/PTE (optional)', NULL, NULL, NULL, NULL),
(26, 1, 'Spouse - Credential Evaluation (any education completed outside Canada) (optional)', NULL, NULL, NULL, NULL),
(27, 1, 'Child - Passports/Travel Documents (Multiple)', NULL, NULL, NULL, NULL),
(28, 1, 'Child - Education Documents', NULL, NULL, NULL, NULL),
(29, 1, 'Child - Birth Certificate', NULL, NULL, NULL, NULL),
(30, 1, 'Child - Digital photo', NULL, NULL, NULL, NULL),
(31, 2, 'Passport including biodata pages and all entry/departure stamps and visa pages', 1, NULL, NULL, NULL),
(32, 2, 'Bank statements for the past 6 months showing consistency of bank balance.', 1, NULL, NULL, NULL),
(33, 2, 'If there are any transfers of funds in large amounts, kindly provide the explanation for the same.', 1, NULL, NULL, NULL),
(34, 2, 'Fixed deposit accounts', 1, NULL, NULL, NULL),
(35, 2, 'Any other investments/savings (mutual funds, stocks, etc.)', 1, NULL, NULL, NULL),
(36, 2, 'Income tax documents', 1, NULL, NULL, NULL),
(37, 2, 'Property valuation reports for immovable property', 1, NULL, NULL, NULL),
(38, 2, 'Purpose of visit (a letter explaining your reason/purpose for the visit and details relating to where and when you wish to visit)', 1, NULL, NULL, NULL),
(39, 2, 'Marriage certificate/divorce certificate/separation agreement (as applicable)', 1, NULL, NULL, NULL),
(40, 2, 'CA reporting stating all assets and liabilities', 1, NULL, NULL, NULL),
(41, 2, 'Birth certificate of accompanying minor children (if applicable)', 1, NULL, NULL, NULL),
(42, 2, 'Parental consent letter (if the child is not travelling with both parents)', 1, NULL, NULL, NULL),
(43, 2, 'Digital photo (35mm × 45mm with a neutral face and white background)', 1, NULL, NULL, NULL),
(44, 2, 'Kindly provide the document proving your status in Canada (valid work permit, study permit, PR card, Canadian passport)', 2, NULL, NULL, NULL),
(45, 2, 'Job letter stating your job title, start date of work, hours of work, number of hours per week, and salary', 2, NULL, NULL, NULL),
(46, 2, 'Enrolment letter from the college', 2, NULL, NULL, NULL),
(47, 2, 'Transcripts (official/unofficial for the courses completed)', 2, NULL, NULL, NULL),
(48, 2, 'Birth certificate if you invite your parents (if the document is not in English, kindly provide a translated copy along with the original)', 2, NULL, NULL, NULL),
(49, 2, 'Proof of relationship to the applicant (if inviting a relative)', 2, NULL, NULL, NULL),
(50, 2, 'Copy of passport with all stamps and visa pages', 2, NULL, NULL, NULL),
(51, 2, 'Invitation letter stating the reason for the visit, date of visit, background of the applicant, etc.', 2, NULL, NULL, NULL),
(52, 2, 'Pay stubs', 3, NULL, NULL, NULL),
(53, 2, 'Bank balance confirmation / portfolio letter from the bank', 3, NULL, NULL, NULL),
(54, 2, 'Bank statements (3 months)', 3, NULL, NULL, NULL),
(55, 2, 'RRSP etc. (if applicable)', 3, NULL, NULL, NULL),
(56, 2, 'NOA/T4’s (if applicable)', 3, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
