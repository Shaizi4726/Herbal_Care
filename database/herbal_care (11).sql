-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2023 at 12:37 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `herbal_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_tablet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `banners`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Herb', 'herb', 'active', '2022-07-11 04:38:50', '2022-07-11 04:38:50'),
(9, 'Non Herb', 'non-herb', 'active', '2022-07-14 05:30:29', '2022-07-14 05:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `product_atrr_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `tax_amount` double(8,2) NOT NULL,
  `t_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `plu`, `product_atrr_id`, `order_id`, `user_id`, `form`, `price`, `size`, `status`, `quantity`, `amount`, `tax_amount`, `t_amount`, `created_at`, `updated_at`) VALUES
(21, 3, NULL, 16, NULL, 2, 'Raw', 140.00, '1 kg', 'new', 1, 133.33, 6.67, 140.00, '2023-01-14 03:54:28', '2023-01-14 03:54:28'),
(26, 2, NULL, 5, NULL, 1, 'Raw', 18.00, '90 g', 'new', 1, 17.14, 0.86, 18.00, '2023-01-18 05:20:11', '2023-01-18 05:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Botanical Herbs & Extracts', 'botanical-herbs-extracts', '/storage/photos/1/Final Pic/abresham.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:35:01', '2022-12-27 01:15:50'),
(2, 'Botanical Herbs', 'botanical-herbs', '/storage/photos/1/Final Pic/Anar Chilka.jpg', 0, 1, NULL, 'active', '2022-10-26 09:35:33', '2022-12-07 10:27:11'),
(3, 'Natural Minerals', 'natural-minerals', '/storage/photos/1/Final Pic/Amla.jpg', 0, 1, NULL, 'active', '2022-10-26 09:36:12', '2022-12-27 01:16:07'),
(4, 'Gums & Resins', 'gums-resins', '/storage/photos/1/Final Pic/Amlasar.jpg', 0, 1, NULL, 'active', '2022-10-26 09:36:54', '2022-12-27 01:16:23'),
(5, 'Oil Seeds', 'oil-seeds', '/storage/photos/1/Final Pic/Arjuna.jpg', 0, 1, NULL, 'active', '2022-10-26 09:37:14', '2022-12-27 01:16:40'),
(6, 'Natural Herbal Oils & Mists', 'natural herbal oils & mists', '/storage/photos/1/Final Pic/Aselio.jpg', 0, 1, NULL, 'active', '2022-10-26 09:37:59', '2023-01-11 07:43:40'),
(7, 'Natural Cleansing Raw Material', 'natural-cleansing-raw-material-face-packs-body-butters', '/storage/photos/1/Final Pic/Babul Chall.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:39:22', '2022-12-29 07:39:03'),
(8, 'Herbal Teas', 'herbal-teas', '/storage/photos/1/Final Pic/Gond katira.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:39:56', '2022-12-27 01:17:36'),
(9, 'Brands & Herbal Products', 'brands-herbal-products', '/storage/photos/1/Final Pic/Amalbed.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:40:12', '2022-12-29 07:24:32'),
(10, 'Natural Honey & Jams', 'natural-honey-jams', '/storage/photos/1/Final Pic/Amlasar.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:40:26', '2022-12-07 10:23:39'),
(11, 'Spice, Salts & Superfood', 'spice-salts-superfood', '/storage/photos/1/Final Pic/Belgiri.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:40:40', '2022-12-07 10:23:57'),
(12, 'Spices & Salts', 'spices-salts', '/storage/photos/1/Final Pic/Red Fenugreek (1).jpg', 0, 11, NULL, 'active', '2022-10-26 09:41:08', '2022-12-07 10:24:15'),
(13, 'Superfood', 'superfood', '/storage/photos/1/Final Pic/Amlasar.jpg', 0, 11, NULL, 'active', '2022-10-26 09:41:30', '2022-12-07 10:24:44'),
(14, 'Herbal Books & Education', 'herbal-books-education', '/storage/photos/1/Final Pic/Thyme.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:41:43', '2022-12-07 10:25:02'),
(15, 'Used Book', 'used-book', '/storage/photos/1/Final Pic/Stone Flower.jpg', 0, 14, NULL, 'active', '2022-10-26 09:42:18', '2022-12-07 10:25:24'),
(16, 'Attar & Perfumes', 'attar-perfumes', '/storage/photos/1/Final Pic/Findak.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:42:31', '2022-12-07 10:25:50'),
(17, 'Gift Items', 'gift-items', '/storage/photos/1/Final Pic/ajwain khurasani black.jpg', 1, NULL, NULL, 'active', '2022-10-26 09:42:43', '2022-12-27 01:15:20'),
(18, 'New Book', 'new-book', '/storage/photos/1/Final Pic/Fox Nuts.jpg', 0, 14, NULL, 'active', '2022-12-06 07:02:10', '2022-12-07 10:26:25'),
(19, 'Face Packs', 'face-packs', NULL, 0, 7, NULL, 'active', '2022-12-29 07:38:53', '2022-12-29 07:39:47'),
(20, 'Body Butters', 'body-butters', NULL, 0, 7, NULL, 'active', '2022-12-29 07:39:19', '2022-12-29 07:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'ABC', 'fixed', '50.00', 'active', '2022-07-11 04:30:14', '2022-07-11 04:30:14'),
(7, 'XYZ', 'percent', '5.00', 'active', '2022-07-11 04:30:28', '2022-07-11 04:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `product_id`, `plu`, `created_at`, `updated_at`) VALUES
(1, '/abresham 2.jpg', 1, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(2, '/Ajwain 2.jpg', 4, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(3, '/Ajwain-2.jpg', 4, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(4, '/Ajwain khurasani white 2.jpg', 5, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(5, '/akarkara thin 2.jpg', 6, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(6, '/Flax Seeds-2.jpg', 7, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(7, '/Amalbed 2.jpg', 8, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(8, '/Mango Ginger-2.jpg', 11, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(9, '/amba haldi 2.jpg', 11, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(10, '/amba haldi.jpg', 11, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(11, '/amla 2.jpg', 13, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(12, '/Amla-2.jpg', 13, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(13, '/amlasar 2.jpg', 14, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(14, '/Anantmool 2.jpg', 15, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(16, '/Castor Seeds 2.jpg', 19, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(17, '/Arjun 2.jpg', 20, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(18, '/Arjun 3.jpg', 20, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(19, '/Arjun.jpg', 20, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(20, '/Aselio 2.jpg', 21, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(21, '/bABCHI 2.jpg', 24, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(22, '/Babul Chal 2.jpg', 25, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(23, '/bahera 2.jpg', 26, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(24, '/Bakayan 2.jpg', 29, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(25, '/Balchar 2.jpg', 31, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(26, '/Banafsaj 2.jpg', 32, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(27, '/Bansa patta 2.jpg', 33, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(28, '/quince seed 2.jpg', 34, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(29, '/Beej band Lal 2.jpg', 35, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(30, '/Beej band kala 2.jpg', 36, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(31, '/Belgiri 2.jpg', 37, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(32, '/Silicate of lime 2.jpg', 38, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(33, '/Bheman lal 2.jpg', 40, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(34, '/bheman safed 2.jpg', 41, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(35, '/Bhilawa 2.jpg', 42, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(36, '/rajad Al Asad 2.jpg', 44, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(37, '/Bhuzidan 2.jpg', 45, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(38, '/Bidara lakad 2.jpg', 46, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(39, '/Bindal doda 2.jpg', 48, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(40, '/binola giri 2.jpg', 49, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(41, '/Polypody 2.jpg', 51, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(42, '/bisfatch.jpg', 51, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(43, '/bisfatch 2.jpg', 51, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(44, '/Bacopa-2.jpg', 52, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(45, '/brahmi booti.jpg', 52, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(46, '/brahmi booti 2.jpg', 52, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(47, '/Thyme-2.jpg', 53, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(48, '/yarrow 2.jpg', 54, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(49, '/Chaskoo 2.jpg', 55, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(50, '/Red beetel nut 2.jpg', 57, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(51, '/Chiraita 2.jpg', 58, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(52, '/Chiraita 2.jpg', 59, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(53, '/chirongi 2.jpg', 60, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(54, '/Chitrakmool 2.jpg', 61, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(55, '/chobchini 2.jpg', 62, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(56, '/Stone Flower-2.jpg', 63, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(57, '/Damar Batu 2.jpg', 64, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(58, '/Gum Dragon Blood 2.jpg', 65, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(59, '/Dandasa 2.jpg', 66, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(60, '/darunj akrabi 2.jpg', 67, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(61, '/Findak 2.jpg', 69, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(62, '/Fox Nuts 2.jpg', 72, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(63, '/Carrot Seeds 2.jpg', 73, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(64, '/ginseng red 2.jpg', 76, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(65, '/Godvach 2.jpg', 78, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(66, '/Gond katira 2.jpg', 80, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(67, '/East India Globe Thistle 2.jpg', 83, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(68, '/Gul Kesu 2.jpg', 90, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(69, '/Gurmar 2.jpg', 91, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(70, '/Hartaki Peeled-2.jpg', 98, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(71, '/zalap root 2.jpg', 99, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(72, '/Harmal 2.jpg', 100, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(73, '/Hauber 2.jpg', 103, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(74, '/Garbeej 2.jpg', 109, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(75, '/Inderjow Kadwa 2.jpg', 110, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(76, '/Inderjow meetha 2.jpg', 111, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(77, '/Red Fenugreek (2).jpg', 112, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(78, '/jarawand mudhraj 2.jpg', 117, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(79, '/jarawad mudhraj.jpg', 117, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(80, '/jawakhar papdi 2.jpg', 118, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(81, '/kahu beej 2.jpg', 122, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(82, '/khairuba shami 2.jpg', 124, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(83, '/kala Dana 2.jpg', 126, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(84, '/Kali Jiri 2.jpg', 127, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(85, '/Black Pepper-2.jpg', 128, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(86, '/Lotus Seeds 2.jpg', 132, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(87, '/karanjwa 2.jpg', 134, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(88, '/karela dry Seeds  2.jpg', 135, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(89, '/kasini beej 2.jpg', 136, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(90, '/Katha white 2.jpg', 138, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(91, '/Gambier 2.jpg', 139, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(92, '/Kaths kanpuri.jpg', 140, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(93, '/Katha Kanpuri 2.jpg', 140, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(94, '/Khubazi 2.jpg', 145, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(95, '/Khaksheer 2.jpg', 146, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(96, '/wormseed 22.jpg', 148, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(97, '/Cowries 3.jpg', 149, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(98, '/Cowries 2.jpg', 149, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(99, '/Cowhage White 2.jpg', 151, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(100, '/konch beej white 2.jpg', 151, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(101, '/Kulanjan 2.jpg', 152, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(102, '/Kulfa beej 2.jpg', 153, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(103, '/kuth talkh 2.jpg', 156, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(104, '/kuth shreen 2.jpg', 157, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(105, '/Lac Button 2.jpg', 159, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(106, '/lajwanti 2.jpg', 161, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(107, '/Lasudia 2.jpg', 162, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(108, '/Lodh Pathani 2.jpg', 164, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(109, '/Magaz Kaddu 2.jpg', 166, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(110, '/Magaz kheera 2.jpg', 168, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(111, '/Magaz tarbuz 2.jpg', 169, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(112, '/mahi 2.jpg', 170, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(113, '/maida lakad 2.jpg', 171, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(114, '/maju Phal 2.jpg', 172, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(115, '/madder Roots 2.jpg', 173, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(116, '/main phal 2.jpg', 174, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(117, '/makoi Dana 2.jpg', 175, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(118, '/Mamira 2.jpg', 176, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(119, '/Cathechu 2.jpg', 180, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(120, 'Gul Supari 2.jpg', 180, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(121, '/Mochrass lal 2.jpg', 181, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(122, '/Liquorice Roots-2.jpg', 182, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(123, '/mulethi 2.jpg', 182, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(124, '/mulethi.jpg', 182, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(125, '/Muli Beej 2.jpg', 184, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(126, '/multani mitti 2.jpg', 185, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(127, '/Musabbar Yemeni 2.jpg', 188, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(128, '/Musli Kali 2.jpg', 189, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(129, '/False Black Pepper-2.jpg', 189, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(130, '/Musli Safed Indian-2.jpg', 190, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(131, '/nagkesar 2.jpg', 193, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(132, '/Himalyan Pink Salt 2.jpg', 195, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(133, '/Narkachur 3.jpg', 196, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(134, '/Narkachur 2.jpg', 196, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(135, '/navshadhar tikri 2.jpg', 197, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(136, '/Neem Chal 2.jpg', 198, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(137, '/Nilofar 2.jpg', 201, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(138, '/Nirmali Beej 2.jpg', 202, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(139, '/pakhan Ved 2.jpg', 205, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(140, '/palas papda 2.jpg', 206, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(141, '/Paneer Dodi 2.jpg', 207, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(142, '/Panvar beej 2.jpg', 208, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(143, '/Parshosha 2.jpg', 209, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(144, '/Long Pepper-2.jpg', 211, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(145, '/Piplamool 2.jpg', 212, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(146, '/Rasauth 2.jpg', 219, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(147, '/Rati lal 2.jpg', 221, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(148, '/Rati Safed 2.jpg', 222, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(149, '/Rosemary (2).jpg', 226, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(150, '/saji khar black 2.jpg', 228, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(151, '/saji khar white 2.jpg', 229, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(152, '/salab gatta 2.jpg', 232, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(153, '/sambhalu beej 2.jpg', 235, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(154, '/Samundar jhag 2.jpg', 236, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(155, '/sange zehrat 2.jpg', 240, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(156, '/Asrool 2.jpg', 241, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(157, '/sarfoka 2.jpg', 242, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(158, '/sarvali beej 2.jpg', 244, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(159, '/Senna Leaves-2.jpg', 248, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(160, '/Senna pods 2.jpg', 249, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(161, '/sakar tiger 2.jpg', 253, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(162, '/shivlingi 2.jpg', 258, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(163, '/suhaga 2.jpg', 265, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(164, '/suranjan shreen 2.jpg', 267, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(165, '/tabasheer blue 2.jpg', 268, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(166, '/tabasheer white 2.jpg', 269, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(167, '/taj 2.jpg', 270, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(168, '/talispater 2.jpg', 271, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(169, '/Celery Seeds 2.jpg', 277, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(170, '/til kala 2.jpg', 274, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(171, '/todari lal (2).jpg', 275, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(172, '/tulsi seed 2.jpg', 281, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(173, '/tulsi leaf 2.jpg', 282, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(174, '/tumba 2.jpg', 283, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(175, '/unab 2.jpg', 285, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(176, '/utangan 2.jpg', 287, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(177, '/wauing 2.jpg', 289, NULL, '2022-12-26 10:50:12', '2022-12-26 10:50:12'),
(316, '/lajwanti 2.jpg', 430, 20023, '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(317, '/Lasudia 2.jpg', 430, 20023, '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(318, '/maju Phal 2.jpg', 430, 20023, '2023-01-16 05:02:02', '2023-01-16 05:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'zafar', 'hello', 'user@gmail.com', NULL, '0565801300', 'Hello how are you whats your name', '2022-07-12 09:21:41', '2022-07-12 08:07:40', '2022-07-12 09:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2022_07_12_132540_create_permission_tables', 2),
(22, '2020_07_11_063933_create_products_attributes_table', 3),
(23, '2022_10_08_073715_create_gifts_table', 4),
(24, '2020_07_11_063932_create_product_forms_table', 5),
(25, '2023_01_06_110947_create_product_categories_table', 6),
(26, '2023_01_16_143847_create_sessions_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('003c3b8d-9ad9-4c13-aabb-5cc7db751755', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Madder%20Roots\",\"fas\":\"fa-star\"}', NULL, '2023-01-14 03:41:33', '2023-01-14 03:41:33'),
('08fb7f7a-b8be-4e73-a295-d2e71f18830b', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:51:51', '2022-12-29 10:51:51'),
('0b7a03e0-bbb4-4d25-a797-971620f01e1b', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:31:12', '2022-12-30 02:31:12'),
('109e7582-9f6a-43b8-80c3-7818a8e4c08e', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:38:53', '2022-12-31 03:38:53'),
('1177f9c2-3505-4279-b567-856630f79c4a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:31:12', '2022-12-30 02:31:12'),
('1251bc9f-d473-4ec0-a57b-5aa0bffdb45d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:39:15', '2022-12-31 03:39:15'),
('12f94c53-fced-4090-8fed-ce59c5c383ee', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:38:42', '2022-12-31 03:38:42'),
('1a8d7c6a-725c-4f7e-9ee1-91389490f145', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 06:43:46', '2022-12-30 06:43:46'),
('1f9d8abe-c163-4425-a4fa-995acd4db164', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:51:17', '2022-12-31 03:51:17'),
('2055328e-d8d7-4f45-a14d-ed0615470961', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/amlaTest3\",\"fas\":\"fa-star\"}', NULL, '2023-01-14 03:43:15', '2023-01-14 03:43:15'),
('21e25952-bfe1-4650-b65d-983f48715538', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:53:38', '2022-12-29 10:53:38'),
('2452fba9-451c-43e7-b700-1ef5661148b7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/52\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 05:20:16', '2022-12-20 05:20:16'),
('25bbf26e-4822-4e72-ab0c-2db5466c058f', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Wormwood\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:48:26', '2022-12-29 10:48:26'),
('26774d0c-9756-402c-9d5d-98f19aca6b90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/56\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-31 05:02:59', '2022-12-31 05:02:59'),
('285bc984-92a1-45e9-a2a5-d26571c00a8f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:02:40', '2022-12-30 02:02:40'),
('2ae57071-0678-425c-a3e4-797108f96645', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/60\",\"fas\":\"fa-file-alt\"}', '2023-01-10 09:37:43', '2022-12-31 05:42:34', '2023-01-10 09:37:43'),
('2cde23d4-dfa5-41d5-b377-51bc4a1338a4', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:45:00', '2022-12-29 10:45:00'),
('32f8fc7d-8578-4f22-8d0f-a587ff641875', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:37:37', '2022-12-31 03:37:37'),
('3adc5486-9fe0-4550-96d4-db0cbfdab593', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/53\",\"fas\":\"fa-file-alt\"}', '2022-12-24 09:55:27', '2022-12-20 07:06:03', '2022-12-24 09:55:27'),
('3b030beb-4a2a-442c-87d8-01797ec461a3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:51:17', '2022-12-31 03:51:17'),
('3b433042-bd47-4310-971d-12546a60a576', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Ajwain%20Khurasani%20White\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:39:29', '2022-12-31 03:39:29'),
('3cfb454d-68de-4d84-bd62-b07f498d283e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/51\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 04:19:16', '2022-12-20 04:19:16'),
('3f60e76b-68cd-4174-8a20-57c2b0282873', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Ajwain%20Khurasani%20White\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:39:29', '2022-12-31 03:39:29'),
('48f1af78-ce5b-478f-a820-8242ed2813b9', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 06:43:29', '2022-12-30 06:43:29'),
('4d90c394-181e-4ccf-ac99-43198a11d73d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:46:55', '2022-12-29 10:46:55'),
('616829b4-df5d-4aaf-965c-38ce8a985dec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:51:51', '2022-12-29 10:51:51'),
('65d1ec48-1630-4bf9-9293-8f163af57ceb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Bush%20Grape\",\"fas\":\"fa-star\"}', '2023-01-10 09:37:36', '2023-01-02 03:33:47', '2023-01-10 09:37:36'),
('6a4bc31e-28f3-4e2c-af0d-9aec9c609416', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:38:42', '2022-12-31 03:38:42'),
('6aff7e22-6957-4650-9141-afef7bb4b0c1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/amlaTest3\",\"fas\":\"fa-star\"}', NULL, '2023-01-14 03:43:15', '2023-01-14 03:43:15'),
('7b071371-ae4d-4cfb-8e5b-105dd6cb17bf', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/57\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-31 05:05:06', '2022-12-31 05:05:06'),
('7d408b7b-344e-4566-8146-0a216cf49f14', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Wormwood\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:47:21', '2022-12-29 10:47:21'),
('80d2f9ad-c0d1-4177-b548-8b167a1c5247', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:37:37', '2022-12-31 03:37:37'),
('835bc90d-3e76-48c5-8c68-27bf9204a607', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/58\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-31 05:30:13', '2022-12-31 05:30:13'),
('8be19bb8-84ea-4b8c-ad6d-2fac015e3a14', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/59\",\"fas\":\"fa-file-alt\"}', '2023-01-10 09:37:50', '2022-12-31 05:33:52', '2023-01-10 09:37:50'),
('915d6b6e-5e6b-43f7-aaa2-4275018d5184', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/54\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-31 04:24:16', '2022-12-31 04:24:16'),
('92946915-8317-43a1-a472-0548a41e57d7', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 05:28:06', '2022-12-29 05:28:06'),
('94407349-6125-414e-9918-7896029f5681', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Madder%20Roots\",\"fas\":\"fa-star\"}', NULL, '2023-01-14 03:41:33', '2023-01-14 03:41:33'),
('9590f06d-ba9f-4a9b-bc86-5138ddccdedb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:31:30', '2022-12-30 02:31:30'),
('996cb554-faea-46de-926f-b21e0821dd14', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:51:19', '2022-12-29 10:51:19'),
('9cbf03da-f881-4759-88ff-06270fbe102f', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:46:55', '2022-12-29 10:46:55'),
('a7bb8fdc-6251-4f36-b2a7-3eb37504cb15', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:53:38', '2022-12-29 10:53:38'),
('a822604d-bc34-48a0-a582-467d6e36aa09', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Wormwood\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:47:21', '2022-12-29 10:47:21'),
('ae9f99eb-27c7-4282-99b2-499880b12e1f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:38:53', '2022-12-31 03:38:53'),
('b0b39b87-70cc-4aed-a8de-4cdc0dd8c2e1', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:31:31', '2022-12-30 02:31:31'),
('b38c2e21-773a-4963-b35c-b8d6e0bc6492', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 05:28:06', '2022-12-29 05:28:06'),
('bc41e092-640b-4105-9f7e-300ccae13eac', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:45:00', '2022-12-29 10:45:00'),
('c45e6625-e733-46ca-89ae-75c492186c0e', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:51:19', '2022-12-29 10:51:19'),
('c594008f-1408-4e10-9d44-7352efc57825', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/55\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-31 04:53:54', '2022-12-31 04:53:54'),
('d5178ed3-0f29-41d9-a248-de7de52d0f35', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Carrom%20Seeds\",\"fas\":\"fa-star\"}', NULL, '2022-12-31 03:39:15', '2022-12-31 03:39:15'),
('d7f71cae-ceca-4ac3-b7de-fc2b43bbd066', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 02:02:40', '2022-12-30 02:02:40'),
('dcbc2ea3-2567-4904-a536-3509d9382c2e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 06:43:46', '2022-12-30 06:43:46'),
('e96a7d6b-4a2f-45ae-a153-7d0af5b84fd1', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Bush%20Grape\",\"fas\":\"fa-star\"}', NULL, '2023-01-02 03:33:47', '2023-01-02 03:33:47'),
('ee8e0ff3-47eb-4d2b-8363-38d038d81715', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:50:59', '2022-12-29 10:50:59'),
('eeba4d32-43dd-4594-b8c2-3e9cb063aa4e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Wormwood\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:48:26', '2022-12-29 10:48:26'),
('fd7ebe50-15cf-418a-95e6-e3c7cbdb5a43', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-30 06:43:29', '2022-12-30 06:43:29'),
('fe244b3e-8014-4578-affd-52d64bb279a2', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/Silk%20Pods\",\"fas\":\"fa-star\"}', NULL, '2022-12-29 10:50:59', '2022-12-29 10:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `tax_total` double(8,2) NOT NULL,
  `t_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('Prajapativikas11060@gmail.com', '$2y$10$J7fmLBOTED1siUN8Y/TdnOicd0E8KfmtVvl8llvtrjbG/ChPY5kuC', '2022-12-28 02:34:51'),
('malikshahzad1644@gmail.com', '$2y$10$.kg59vU/mQC8p9TM.u9bGO0YXSjlK6nI2rFLU7Ugwd4s6x14Yz6hK', '2022-12-28 07:52:09'),
('admin@gmail.com', '$2y$10$4V/FvUIKxJI/gfnvRH8Q4eimX1dbzKkTKeEpyg2qrnSis.tMGExlu', '2022-12-28 09:51:42'),
('zafaraqbal786@gmail.com', '$2y$10$76Lo7XWYI78lAqwiDtvTWeLG4Ita9hGa/1nefgeQ/ysN2bMlXwbJi', '2023-01-02 03:53:30');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `other_name`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Herb', 'herb', '<p>Herb is best</p>', '<p>Herb is best</p>', '<p>Best Herb</p>', '/storage/photos/1/Category/herbal.jpg', '', 6, NULL, 1, 'active', '2022-07-11 04:33:23', '2022-10-12 07:50:36'),
(8, 'Non Herb', 'non-herb', '<p>Not Herb</p>', '<p>This is not a Herb product<br></p>', '<p>This is not a Herb</p>', '/storage/photos/1/whiteSoil.jpg', 'Herb', 7, NULL, 1, 'active', '2022-07-11 04:34:47', '2022-10-12 07:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'OIl', 'oil', 'active', '2022-07-11 04:28:15', '2022-07-11 04:28:15'),
(7, 'Powder', 'powder', 'active', '2022-07-11 04:28:26', '2022-07-11 04:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 1, 7, 'xsx', 'active', NULL, NULL, '2022-10-13 04:20:38', '2022-10-13 04:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Herb', 'herb', 'active', '2022-07-11 04:28:58', '2022-07-11 04:28:58'),
(6, 'Hrbal', 'hrbal', 'active', '2022-07-11 04:29:20', '2022-07-11 04:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scientific` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `other_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `benefit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minprice` bigint(20) UNSIGNED DEFAULT NULL,
  `promotion` enum('default','new','trending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `plu`, `other_name`, `benefit`, `description`, `photo`, `minprice`, `promotion`, `status`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Silk Pods', 'Bombyx Mori', 'Silk Pods', NULL, 'Abresham, Silkworms', 'Contains High level of Calcium@\nContains High level of protiens@\nContains Vitamin B\n', 'Silk Pods are made of natural silkworm cocoons, which is ideal for removing blackheads and exfoliating the skin.Your skin can be made from drab to brilliant by using these protected silk cocoons that help the transformation of the silkworm. Any hesitation you may have will be quickly dispelled when you see the imperfectionsthese silky cocoons remove from your skin. The rich silk not only imparts lovely skincare benefits but also gently exfoliates, drawing dirt and dead skin cells like a magnet. \r\nSericin, also known as \"Natural Moisturizing Factor (NMF)\", has been applauded for having anti-wrinkle and anti-aging benefits, while simultaneously enhancing moisturising and skin elasticity.\r\nCut holes make it simple to insert your finger and increase the flexibility of cleaning your face. Your face will feel smoother when used with a facial cleanser. \r\n\r\nAfter use, you can wash them with warm water and soap. One cocoon can be used again three times.', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2023-01-02 04:08:56'),
(2, 'Wormwood', 'Artemisia Absinthium', 'Wormwood', NULL, 'Afsanteen', 'Increases Appetite@\nImproves Digestion\n', 'Wormwood herb is an herb that’s prized for its distinctive aroma, herbaceous flavour, and purported health benefits. Whether you’re looking to add a new flavour to your cooking or want to try something new, wormwood is a great choice.', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(3, 'Dodder', 'Cuscuta Reflexa Roxb.', 'Dodder', NULL, 'Aftimoon, Hellweed', 'May treats urinary tracts@\nMay treat hepatic disorders\n', 'Dodder Seeds, also known as Semen Cuscutae, is frequently used in Chinese medicine to increase male fertility naturally (can also be used by females for its other benefits). Dodder plant has a number of phytoconstituents with great medicinal potential. Dodder seed supplements are popular because of this. By improving sperm motility and low sperm count, it offers a natural treatment for male infertility. Additionally, the seeds boost levels of luteinizing hormones in men, which increases testosterone.\nThese plants\' antibacterial, antioxidant, hepatoprotective, anti-inflammatory, and anticancer effects have all been found to be beneficial. It is still a well-liked treatment for anti-aging skin and can be coupled with vitamins or other compounds to boost energy. Dodder Seeds also support and cleanse the reproductive system, which helps with normal urine function. \nThis potent herb can be added to your daily routine to boost hormone nutrition and vitality because it works by nourishing the kidneys.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(4, 'Carrom Seeds', 'Trachysperum Ammi', 'Carrom Seeds', NULL, 'Ajwain,  Bijr Zamuta, ', 'Improves Cholestrol levels@\nMay Lower Blood pressure@\nMay prevent coughing and imporves Airflow\n', 'Carom Seeds (or Ajwain) is an important spice that has been long used in Indian Cuisine. Along with other spices, it is used to season fish, chicken, and pickles. Additionally, it\'s a remarkable herb to make herbal tea.\nIn addition to enhancing the flavour of our food, carom seeds have a number of health advantages, including the maintenance of our digestive health, treatment of the common cold, relief from ear and toothaches, prevention of hair ageing, relief from arthritis pain, treatment of asthma, treatment of excessive bleeding and irregular menstruation, and weight loss.\nDue to their abundance in fibre, antioxidants, other vitamins and minerals, carom seeds are exceptionally nutrient-dense. As a result, they have long been used in Indian traditional medicine and are recognised for their positive effects on health.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(5, 'Ajwain Khurasani White', 'Hyoscyamus Niger', 'Ajwain Khurasani White', NULL, ' White Henbane', 'Improves bone health@\nMay treat toothache@\nMay relieves Stomach Pain\n', NULL, '/storage/photos/1/Final Pic/Ajwain khurasani white.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(6, 'Pellitory Roots', 'Anacyclus Pyrethrum', 'Pellitory Roots', NULL, 'Akarkara Thick,  Oud Al Kara Magrabi ', 'Improves digestion@\nMay relieves toothache\n', 'Pellitory roots are a powerful herbal medicine that can help you treat various health problems. Pellitory roots are a must-have if you suffer from rheumatoid arthritis (RA), seizure disorder (epilepsy), erectile dysfunction (ED), indigestion (dyspepsia), and other promotions. People also use it to kill insects when applied to their skin or apply it directly to their gums if they are suffering from toothaches. \nBecause of its effects on the brain and nerves, pellitory roots are a libido stimulant for males. It stimulates desire and improves blood flow to the genitalia. Due to its antiviral qualities, pellitory reduces all flu symptoms and eases nasal congestion. Children\'s speech can be improved by gently massaging the mouth with 125 mg of honey-mixed Pellitory root powder. \nThe plant\'s roots have excellent therapeutic benefits because they exhibit potent aphrodisiac characteristics that aid in lowering anxiety and tension levels.\n', '/storage/photos/1/Final Pic/akarkara thin.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(7, 'Flax Seeds', 'Linium Usitatissimum', 'Flax Seeds', NULL, 'Alsi, Bijr Kataan, ', 'High in Omega-3 fats@\nRich in dietary fiber@\nMay Improves Cholestrol@\nLower Blood Pressure\n', 'Flaxseeds have shown to be a powerful nutritional powerhouse full of heart-healthy benefits and preventive characteristics, much more than just a delicate topping to sprinkle over porridge or a beautiful acai bowl. Furthermore, while appearing to be such little seeds, don\'t let their small size fool you. Flaxseed is a rich source of important vitamins and nutrients.\nHigh fibre content in flaxseeds may aid to promote digestive health. Exceptional sources of both soluble and insoluble fibre are flaxseeds.\nThey also include omega-3 fatty acids, which have been linked to a number of health advantages, including the potential to lower blood pressure, reduce inflammation, and raise levels of healthy cholesterol.\nThe lignans found in flaxseeds can aid in defending the skin from deterioration brought on by the sun and other environmental causes. These oils should be regularly consumed to delay the appearance of wrinkles and other signs of premature ageing.\n', '/storage/photos/1/Final Pic/Flax Seeds.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(8, 'Bush Grape', 'Cayratia Carnosa', 'Bush Grape', NULL, 'Amalbed, Cissus Trifolia, ', 'Helps enhance spleen function@\nManages the gastro-intestinal tract@\nManages the gastro-intestinal tract\n', 'The Bush Grape is a native Indian plant and will help to soothe painful muscles @ it helps to purify the blood, to control pain and inflammation. The shrub has a spicy, sour taste and can be chewed for this effect.\nDiabetic patients are usually given an oral infusion of seeds and a tuber extract to assess their blood sugar levels. In order to treat a snake bite, tuberous paste is administered to the injured area.\nBush Grape is a great blood purifier, astringent and diuretic herb. It has been used to strengthen the heart and reduce swelling, pain and inflammatory disorders. It is a warming herb that would be beneficial in cold weather. \nA superior herbal remedy, Bush Grape is excellent for any type of pain, especially headaches and menstrual cramps. It is also a powerful astringent and diuretic that detoxes the body.Bush Grape has been used in India since prehistoric times to aid in healing wounds and as a tonic for general detoxification.\n', '/storage/photos/1/Final Pic/Amalbed.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(9, 'Golden Shower', 'Cassia Fishtula', 'Golden Shower', NULL, 'Amaltas, Khaich Amber, ', 'Improves digestion@\nMay treats joint pains@\nMay useful in fever\n', 'The Golden Shower is an elegant evergreen tree with lovely branches covered in yellow blooms. It has powerful purgative, anti-inflammatory, diuretic, antioxidant, antipyretic, astringent, carminative, antipruritic, and laxative qualities as well as bioactive compounds.\nAs a result of its astringent qualities, Golden Shower can also be applied to the skin. Cells are brought into contraction, which tightens the pores. Additionally, it cleans the skin of extra oil, avoiding breakouts and acne. This amazing plant works as a skin lightening agent to lessen skin pigmentation and delay the signs of ageing. Additionally, this plant\'s oil and gel lessens eczema, blisters, and ulcers on the skin and mucous membranes.\nThis summer-blooming plant, which has been used since prehistoric times, is known as Thailand\'s national tree and flower because of its long history of domestication.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(10, 'Golden Shower Extract', 'Cassia Fishtula', 'Golden Shower Extract', NULL, 'Amaltas Gudda', 'Improves digestion@\nMay treats joint pains@\nMay useful in fever\n', 'The Golden Shower is an elegant evergreen tree with lovely branches covered in yellow blooms. It has powerful purgative, anti-inflammatory, diuretic, antioxidant, antipyretic, astringent, carminative, antipruritic, and laxative qualities as well as bioactive compounds.\nAs a result of its astringent qualities, Golden Shower can also be applied to the skin. Cells are brought into contraction, which tightens the pores. Additionally, it cleans the skin of extra oil, avoiding breakouts and acne. This amazing plant works as a skin lightening agent to lessen skin pigmentation and delay the signs of ageing. Additionally, this plant\'s oil and gel lessens eczema, blisters, and ulcers on the skin and mucous membranes.\nThis summer-blooming plant, which has been used since prehistoric times, is known as Thailand\'s national tree and flower because of its long history of domestication.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(11, 'Mango Ginger', 'Curcuma Aromatica', 'Mango Ginger', NULL, 'Amba Haldi,Kurkum Kabir, White Turmeric', 'Treats skin problems@\nMay treats acne@\nMay useful in treating boils\n', 'A tillering, tall, herbaceous perennial known as Mango Ginger has a mango- or kwini-like scent when crushed or sliced, and it is yellowish-brown on the exterior, white at the top, and citron yellow inside.\nWhen the monsoons arrive, the markets are flooded with this spice that resembles ginger but is actually another type of spice. Well, it tastes like mango with a hint of ginger.\nMango Ginger contains effective characteristics of an antibacterial and antioxidant. As a result, it is used to treat skin problems. It aids in bodily detoxification, skin improvement, and the eradication of acne and other skin issues. Additionally, it is a component of many skin care and cosmetic products.\nWhen it comes to metabolic difficulties, it contains features that stop the growth of triglycerides in our bodies, which is really effective. Both antibacterial and antifungal activities are present. Mango Ginger proves to be a vital component in the treatment of head lice and eliminates dandruff.\n', '/storage/photos/1/Final Pic/Mango Ginger.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(12, 'Ambergris', 'Ambergresea', 'Ambergris', NULL, 'Amber, Amber Azrak, ', NULL, 'Ambergris is a solid, waxy material that comes from the sperm whale. Fresh ambergris is smooth and dark, and exhibits bad odour. Ambergris is used as a spice, in medications, and in other concoctions. The aromas of perfumes have long been fixed by Ambergris in the perfume and medical sectors.\nHuman liver cancer, colon adenocarcinoma, lung carcinoma, and human breast adenocarcinoma cell lines are all susceptible to the ambergris\' cytotoxic properties. Ambrein has been demonstrated to have analgesic properties through lowering temperature sensitivity.\nAmbergris was employed in numerous treatments but could also be taken on its own, particularly to cure disorders of the heart, brain, and neurological system as well as headaches, tension, and muscle spasms.\nAmbergris has demonstrated joint health benefits, and its warmth acts as a fortifier, particularly for the aged. Men use it to increase their sexual arousal, and women use it to treat infertility.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(13, 'Indian Gooseberry', 'Emblica Officinalis', 'Indian Gooseberry', NULL, 'Amla, Amlaj, ', 'Boosts Immunity@\nBeautifies Hair@\nImproves Skin Health\n', 'Ignore those who say Indian gooseberry is made of earthworms and leaves—this fruit really does pack a powerful punch! \nIndian gooseberry is known for its blood-strengthening properties, which make it useful in ageing care. For centuries, the Indian gooseberry has been used as an appetite suppressant and natural remedy for heartburn, constipation, coughs and colds. \nIndian Gooseberries are the most concentrated source of vitamin C, making it an all-natural skin-brightening and antioxidant powerhouse. Rich in vitamin A, B vitamins and antioxidants, Indian gooseberry leaves a beautiful natural glow to the skin.\nIndian Gooseberry is always a fantastic option, whether you\'re a health-conscious person or a beauty aficionado. Your needs are always taken care of by its hydrating skin-peptide and natural collagen qualities.\n', '/storage/photos/1/Final Pic/Amla.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(14, 'Amlasar', 'Sulphur', 'Amlasar', NULL, ' Gandak, ', NULL, 'The anti-inflammatory and anti-redness properties of sulphur have long been associated with its use in skincare products. It works well as an ingredient in anti-aging and acne treatments since it helps to smooth out and soften the skin and increase blood flow. The moisturising benefits of natural latex, sea salt extracts and mineral-rich botanicals create an effective solution for dry skin. People with rosacea, eczema, and other inflammatory skin diseases can also benefit from sulphur.\nYou can enhance the effects of your favourite skin care or hair care products by incorporating this \"beauty mineral\" into them. It helps with acne-prone skin by gently exfoliating the epidermis, removing dead skin cells. This \"Super Power mineral\" increases collagen synthesis and functions as a mild natural antioxidant. By encouraging cell growth and hydration, lowering fine lines, wrinkles, and even scars, it enhances overall complexion.\n', '/storage/photos/1/Final Pic/Amlasar.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(15, 'Indian Sarsaparillia', 'Hemidesmus Indicus', 'Indian Sarsaparillia', NULL, 'Anatmool, Nanaree, ', 'Helpful in relieving burning sensations@\nAids Digestion @\nHelpful in purifying blood\n', 'It tastes delicious, is all-natural, and works like magic! Free radicals, which cause eczema, are eliminated from your body by Indian sarsaparilla\'s antioxidant capabilities. Indian Sarsaparilla is a herbal antiseptic that has been used for centuries to treat cuts and bites. It is a native remedy for rashes, psoriasis, and other skin promotions.\nAn efficient natural treatment for dermatitis, dandruff, and even minor wounds- Indian Sarsaparilla root is a potent herbal remedy that has been utilised in traditional and folklore medicine for generations. It is regarded as a powerful remedy for the treatment of skin diseases when drunk as tea. Inflammation and redness brought on by excessive oil evaporation can be reduced with its assistance.\nSarsaparilla is often included in herbal teas and other temporary remedies, as it is thought to enhance the bioavailability of other ingredients therein.\nWithin weeks, you\'ll notice a difference in your skin thanks to Indian sarsaparilla. This dietary supplement supports pH balance and promotes skin renewal, keeping the skin smooth and young-looking.\n', '/storage/photos/1/Final Pic/Anantmool.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(17, 'Anise Seeds', 'Pimpinella Anisum', 'Anise Seeds', NULL, 'Anise Seed,  Yansoon, ', 'May fight stomach ulcers@\nKeep Blood Sugar Levels in Check@\nMay reduce symptoms of Depression\n', NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(18, 'Snake Roots', 'Polygonum Bistorta linn.', 'Snake Roots', NULL, 'Anjbar', 'Strenthens Heart and Liver by reducing intrinsic heat@\nHelpful in healing wounds of lungs\n', 'SnakeRoot\'s peptides, complex glycosaminoglycans, and antioxidants target multiple wrinkle attributes. By targeting key components of the dermal-epidermal junction, SnakeRoot improves dermal integrity by strengthening DEJs and improving capillary strength.\nRadiance, texture and complexion is improved by strengthening the underlying collagen fibres and improving the skin\'s surface. The firmness of the skin is reduced, wrinkles are diminished, pores are minimised and red spots, as well as skin roughness are reduced. Radiance drops also help with perioral hyperpigmentation.\nSnakeRoot offers a comprehensive hydrating, firming, and lifting solution. The unique mixture promotes collagen development and drastically reduces multiple wrinkle features to maintain healthy, youthful skin.\nThe botanical elements in SnakeRoot, which are concentrated and specifically designed to target fine wrinkles, have been shown to have skin-smoothing properties.\n', '/storage/photos/1/Final Pic/snake root.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(19, 'Castor Seeds', 'Ricinus Communis', 'Castor Seeds', NULL, 'Arandi Beej,  Bijr Kharwaa, ', 'Promotes Wounded Heals@\nReduces Achne@\nKeep your Hair and Scalp Healthy@\n', 'Castor Seed oil, one of the most popular ingredients in skin care products, has an unique ability to heal skin thanks to its high concentrations of omega-6 fatty acids and antioxidants. A body lotion with included Castor Seeds oil will successfully keep your skin moisturised. Fatty acids found in abundance in Castor oil aid in deep skin penetration and provide relief from dryness and damaged skin. Stretch marks, acne, eczema, and a host of other skin promotions can all be treated using this oil, which also works fantastically as a skin moisturiser. All skin types, especially sensitive and acne-prone skin, are safe to use castor seed oil. The oil is so incredibly effective that it has been used by women in India for over 6,000 years.\nCastor Seed oils\' characteristics allows it to beapplied as an antibacterial agent to cure many skin infections like warts and fungal infections. \nYour beauty regimen should include Castor Seed oil. One of the greatest oils for older skin, Castor Seed is known for its capacity to relieve sunburn and dermatitis.\n', '/storage/photos/1/Final Pic/Castor Seeds.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(20, 'Arjuna', 'Termilia Arjna', 'Arjuna', NULL, 'Arjun, White Marudah,', 'May helps is strenthening the Heart Muscles@\nMay help in reducing the high blood pressure\n', 'We frequently seek out natural remedies for skin or hair problems since they are safer than commercially available solutions. Therefore, White Marudah is a great herb to put your faith in if you\'re looking for a natural way to solve your hair and skin problems.\nWhite Marudah is known to be one of the most important ingredients used in Ayurvedic medicines. In today’s world, we are exposed to a multitude of agents that can damage our skin and cause premature ageing. The best way in protecting our skin from such damages is through using a natural product like White Marudah. \nRich in antioxidants that prevent skin damage from free radicals, White Marudahhelps in improving skin elasticity and prevents sagging of the skin. It also improves our skin\'s appearance and makes a shield that strengthens and acts as the skim barrier.\nThis miraculous herb has countless skin-care advantages. Bring White Marudah home today and use it to get the most out of it for all of your skin and hair issues.\n', '/storage/photos/1/Final Pic/Arjuna.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(21, 'Garden Cress', 'Lepidium Sativum', 'Garden Cress', NULL, 'Aselio,Halim Seeds, Habbat ul Amraa, ', 'Helps in relieving the symptoms of Constipation and Indgestion@\nMay treat colic issue\n', 'Low in calories and packing essential nutrients like vitamins A, C, K, and omega-3 fatty acids - this tiny herb has got it all! \nGarden Cress seed paste mixed in honey is a refreshing skin care treatment that works well on the face or body. It soothes sensitive skin, softens rough skin and dries out chapped lips. This all-natural remedy contains Garden Cress seeds that are known to help fight against sunburn, dryness and irritation of the lips. \nIn addition, the unique blend of ingredients can even be used as an antiaging product, addressing age spots and protecting your skin from the damage of free radicals.\nThis nutritious vegetable crop which also has numerous therapeutic properties, can help to prevent hair loss. That’s maybe why it is so popular among women looking for natural remedies for hair growth.\nA little sweet and sour in one package, Garden Cress Seeds can take you to the next level. Mixed with jaggery and coconut, these seeds will give you a glowing complexion on healthy skin.\n', '/storage/photos/1/Final Pic/Aselio.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(22, 'Ashwagandha', 'Withania Somnifera', 'Ashwagandha', NULL, 'Asgand Nagory, ', 'May reduce Blood Sugar levels@\nBoost Immunity\n', 'If you are looking for a natural cure that deals with skin problems such as acne, pigmentation and irritation, then it’s high time you try Ashwagandha for your skin.\nAshwagandha is used as a rejuvenating therapy for the dermal layer of the skin. It contains high levels of Vitamins A, B-complex, C and E and is rich in zinc and copper. Ashwagandha\'s antioxidant properties help to combat the human body\'s ageing process. \nThe anti-inflammatory & anti-oxidant effects of Ashwagandha can help reduce redness and pigmentation, thereby reducing the appearance of fine lines and blemishes.\nAn Indian herb that has been practised for centuries to promote the general health of your hair follicles @ This prodigious ingredient improves scalp promotions such as dandruff, itchiness, psoriasis, eczema, and other inflammation-related allergies.\nAshwagandha is one of the most important herbs known to mankind. It has been used to treat a variety of problems, but today it is most commonly seen as an adaptogen, a substance that helps the body adapt and recover from stress.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(23, 'Asoka', 'Sarala Asoca', 'Asoka', NULL, 'Ashok, Ashoka, ', 'May help in relieving pain and healing wounds@\nHelpful in reducing of Oily and Dull Skin \n', 'Containing high traces of micronutrients such as magnesium, iron and calcium, this herb can prove vital for healthy teeth, skin, and bones. So, stop taking supplements and opt for natural herbs like Ashoka – this will help you avoid side effects as well.\nOther than its mythological relevance, Ashoka tree is cultivated for the benefits it has for clearer and complexed skin. Many people use Ashoka paste as a hair and skin promotioner, since the tree bark has no side-effects. \nAshoka, a deciduous tree commonly found in India, holds many medicinal properties. It is used in Ayurveda to treat skin ailments like eczema and psoriasis. The tree’s natural anti-inflammatory properties have also been shown to be effective against acne as well! In fact, it is so powerful that you can use its extracts in your bathwater for a complete anti-acne remedy.\nWhen it comes to eliminating toxins from the body and purifying it, Ashoka tree leaves are particularly effective. With this, it can be said that you will be healthy and fit!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(24, 'Proralia', 'Psoralea Corylifolia', 'Proralia', NULL, 'Babchi, Proralia,', 'May helps in reducing Skin Boils@\nImproves Hair Growth@\nMay Control Dandruff\n', 'Referred to as a \"Wonder Ingredient\", this natural skin care remedy for eczema and psoriasis, is known to have many benefits. The Proralia Seed Powder extract is used to manage promotions like leucoderma and psoriasis by loosening the epidermis allowing better absorption of nutrients into the dermis.\nA highly concentrated bioactive oil, Proralia (Bakuchi) Oil is known to reduce the appearance of fine lines and face wrinkles by stimulating collagen production. It also helps improve uneven skin tone by reducing the pigmentation, and can also promote skin elasticity and firmness.\nProralia (or Bakuchi) oil is an effective home remedy for skin. It is a mixture of pure essential oils exhibiting pleasant aroma and mitigating properties. This oil is mainly used to reduce skin eruptions, boils, softening of acne scars and vitiligo.\nApplying Proralia mixed with coconut oil helps reduce inflammatory reactions on skin due to anti-inflammatory properties. \nUtilise this organically produced herb for multiple advantages – in skin care, hair care, health and wellness to procure its \"wonder benefits\".\n', '/storage/photos/1/Final Pic/Babchi.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(25, 'Babool Chal', 'Acacia Nilotica', 'Babool Chal', NULL, 'Babool Chal, Babul  Chal', 'may helps in healing wounds, cuts and Injuries@\nControls Bleeding\n', 'A highly prized Ayurvedic plant - Babool Chal is well-known for its indispensable medicinal properties. This flowering herb is used as a home remedy for various skin diseases, diabetes, bleeding disorders, gastrointestinal problems and intestinal worms.\nBabool Chal is rich in antioxidants, which are helpful in minimising oxidative damage by neutralising free radicals. Babool Chal lends a bright glow to your skin. It helps rejuvenate dull and tired skin as well as reduces age spots, pimples and wrinkles.\nGently detoxify, balance, and protect liver function. Babool Chal is a traditional Indian remedy used to purify and rejuvenate the mind and body. Far more than just an effective restorative for the skin and hair, babool chal helps support digestion and levels the nervous system so it can properly communicate with all tissues in your body.\nAn age-old Indian remedy known to protect the skin from the onset of skin diseases and premature ageing, this potent anti-inflammatory and antifungal herb has been traditionally used in Ayurveda to treat various skin promotions such as pimples, acne, boils and ringworm.\n', '/storage/photos/1/Final Pic/Babul Chall.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(26, 'Beleric', 'Terminalia Belerila Roxb.', 'Beleric', NULL, 'Bahera, Balila ', 'Helps in controlling Cough and Cold@\nHelps in Weight Loss@\nBoost Immunity\n', 'A natural extract of Rhodiola Rosea, Beleric is well known for its ability to support brain function, fight fatigue and mood, alleviate stress, improve physical performance, balance mental health and combat muscle aches.\nBeleric Fruit Powder makes you healthy and sound. It helps to reduce insulin resistance, thus lowering the risk of diabetes. Beleric improves digestive disorders such as gaseous and gastric problems, constipation, dyspepsia and heartburn.\nThis wonderful herb is extremely effective in enhancing the scalp health and has skin benefits. Baheda oil contains Gallic acid which acts as a natural barrier for damaged hair and prevents breakage, split ends and dandruff.\nUsed for centuries in the Middle East as an aphrodisiac and healer, Beleric has anti-ageing properties.\nBeleric’s anti-inflammatory and antiseptic properties can soothe the skin, leaving it feeling smooth and refreshed. The infusion of these seeds into your beauty routine has been found to help diminish acne scars and heal other skin promotions such as eczema, psoriasis and rosacea.\n', '/storage/photos/1/Final Pic/bahera.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(27, 'Corchorus', 'Corchdrus Depresses', 'Corchorus', NULL, 'Bu phali, Corchorus, Bufali, Bahu Phali', 'Helps Bone Health@\nMay Treats Bone Joints\n', 'Corchorus is one of the few natural alternatives to treat several common health issues. It is believed that it has a variety of health benefits. This includes curing fever, treating pain and sexual dysfunction, controlling diarrhea and inflammation of the urinary tract.\nRegarded as a skin hydration system, Corchorus helps improve the health of your skin. The unique blend of ingredients in Corchorus produce a natural, anti-inflammatory and anti-bacterial effect that protects moisture levels to help reduce transepidermal water loss (TEWL) while providing relief from dry cracked skin.\nCorchorus is a highly concentrated, 100% natural formula that moisturises, improves texture and tone, reduces the appearance of wrinkles and fine lines, promotes elasticity, firmness and smoothness of the skin.\nCorchorus leaves are used as an herbal emollient and cooling agent. They gently cool the skin, leaving it soft to the touch. A cup of tea made with our corchorus leaves is a great choice for soothing sore muscles, or for comforting hot flashes.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(28, 'Nepeta', 'Nepeta Hindostana', 'Nepeta', NULL, 'Bajrang Boya', 'Promotes Heart health@\nMay relieves Anxiety\n', 'If your mind is racing and you feel anxious or nervous, this herb may help you unwind and relax. Nepeta is known to work on relaxation, providing calm, while in stressful situations. This may boost mood and reduce anxiety, restlessness, and nervousness.\nNepeta is a valuable herb tea from the mint family that is commonly used in the diet. It is traditional medicine that has been used by herbalists and naturopaths for centuries. Nepeta tea can be used as a soothing digestive aid, particularly for people with irritable bowel syndrome.\nThe infamous Nepeta Plant has been proven to promote healthy skin due to its antiseptic, antifungal and antioxidant properties. The seeds are used as a natural remedy for treating minor cuts, scrapes and burns @ they can also be used to fight athlete\'s foot and scabies.\nKnown for its attractive foliage and delicate flowers, this perennial deserves a place in your garden.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(29, 'China Berry', 'Melia Azedarach', 'China Berry', NULL, 'Bakayan', 'May treats skin disorders@\nMay reduce achne\n', 'Chinaberry tree is more than simply a pretty ornamental tree @ the Ayurvedic system values its medicinal properties and uses. Chinaberry tree leaves powder is high in antioxidants and is used as a rejuvenative, anti-aging, and epicanthic tonic as well as to cure diabetes, arthritis, skin promotions, and many other illnesses.\nThe regular empty stomach ingestion of Bakayan (ChinaBerry) dried seed powder offers treatment from intestinal illnesses and parasites. It also has additional effects, such as raising immunity and lowering cholesterol.\nChinaberry extract is a powerful ingredient that helps improve skin\'s firmness and elasticity, providing an additional boost of moisture to your daily regimen.\nNourish your skin with a potent antioxidant blend of Chinaberry Extract. It works to boost the photo-protective abilities of sunscreens and protect your skin from environmental stressors like pollution. To assist in treating excessive pigmentation and restore damage to the skin barrier, we advise using this serum in combination with Vitamin C.\n', '/storage/photos/1/Final Pic/Bakayan.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(30, 'Balanga', 'Lallemantia Royleana', 'Balanga', NULL, 'Basil Seeds Long', 'Helps in Weight Loss@\nReduces Body Heat@\nControls Blood Sugar Levels\n', 'Out of all the sun-loving seeds, Balanga seeds have the most health benefits by far. \nBalanga seeds is a treasure chest of health for man from nature, rich in omega-3 fatty acids and antioxidant properties. Also referred to as \'Natural Coolant of Summer\', these tiny little seeds are truly a miracle!\nA fibre-rich seed that cleanses the stomach and intestines, strengthens the gastrointestinal tract’s ability to absorb food, and removes waste products from the body.\nThis plant-based supplement helps reduce cholesterol levels and prevent clogged arteries. In addition, it combats the effects of ageing on the body and improves overall well-being.\nContaining a good amount of flavonoids, Balanga seeds aid in skin tightening, while they also serve as anti-inflammatory and anti-tumor agents. The seeds can help to fight free radicals, reduce wrinkles, age spots and regenerate healthy skin cells.\nBalanga is a deep cleansing facial wash that exfoliates the skin and removes all impurities to give your skin a radiant glow while restoring its natural immunity. Its antibiotic properties soothe the skin from within and keep it infection-free.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(31, 'Indian Spiknard', 'Nardostachys Chinensis', 'Indian Spiknard', NULL, 'Balchar,  Sumbalteef, ', 'Boost Hair Growth@\nMay treat Insomnia\n', 'Serving as a natural alternative to common medicines, Indian Spikenard possesses properties that make it useful for treating acne, fungal infections and even leprosy. It is one of the best essential oils for relieving inflammation and pain. Additionally, it helps with sleeplessness, melancholy, and anxiety. There is a long history of using spikenard essential oil to treat many illnesses. Use this essential oil regularly to improve your mood and overall wellness.\nAdditionally, anti-inflammatory and anti-diarrheal activities are thought to exist.\nDiarrhoea, dysentery, and nausea are among the gastrointestinal issues that the roots are used to cure. Additionally, it is used to treat eczema and ringworm, two skin promotions.\nIt is thought to have anti-aging qualities and aids in the relief of nervous tension. \nIndian spikenard can also assist you in promoting hair growth and preventing hair loss when used regularly. When used properly, Indian Spikenard can be successful in treating dandruff and other promotions of the scalp.\n', '/storage/photos/1/Final Pic/Balchar.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(32, 'Banafsaj', 'Viola Odorata Indian', 'Banafsaj', NULL, 'Banaksha', 'Reduces Stress@\nMay helpful in Common Cold\n', 'An Ayurvedic herb with a sweet violet scent - Banafsaj is known to be a potent nervine sedative. This herbal remedy is used to cure sadness, irritability, hysteria, weariness both physically and mentally, and nervous tension.\nAs a mitigating agent, banafsaj is diaphoretic, diuretic, emollient, expectorant, and purgative. This decorative herb is used to cure illnesses of the respiratory system, including bronchitis, coughs, hoarseness, dry or sore throat, and stuffy nose.\nThe naturally wonderful-smelling banafsaj body oil intensively hydrates the skin and gives it a radiant, healthy appearance.\nThis robust herbaceous perennial plant contains decongestant, expectorant, antimicrobial, anti-asthmatic, anti-inflammatory, and analgesic effects. For skin promotions and as a skin cleanser, banafsaj can be applied straight to the skin. Banafsaj can be used topically to treat skin promotions and clean the skin.\n', '/storage/photos/1/Final Pic/banafsaj.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(33, 'Malabar Nuts', 'Adhatoda Vasica', 'Malabar Nuts', NULL, 'Bansa Patta', 'May loosen chest congestion@\nMay helpful in Common Cold\n', 'Malabar Nut, A potent ayurvedic plant that enhances the respiratory system. This herbaceous evergreen shrub has manifold curative properties and is an ultimate remedial measure for a lot of health anomalies like asthma and bronchitis.\nMalabar Nut bears great relevance in treating the symptoms of the common cold, cough, and flu due to its abundance in anti-inflammatory, antibacterial, and expectorant characteristics.\nThe herb\'s carminative and appetite-stimulating effects aid in the breakdown of food particles in the stomach, increasing the absorption of vital nutrients through the intestines.\nMalabar Nut provides substantial relief from pain and inflammation in cases of arthritis and joint discomfort due to the potent analgesic, anti-inflammatory, and pain-relieving effects of the bio-active components.\nMalabar nut oil-infused beauty products also enhance complexion by levelling out skin tone, unclogging blocked pores, and minimising various indicators of ageing.\n', '/storage/photos/1/Final Pic/Bansa patta.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(34, 'Quince Seeds', 'Cydonia Vulgaris', 'Quince Seeds', NULL, 'Beedana, Bijr Sifarjal, ', 'Improves digestion@\nRich in dietary fiber\n', 'Regarded as one of the Nordic superfoods, Quince Seeds have a long history of usage in traditional and folk medicine to treat a variety of digestive issues. \nInflammatory bowel illnesses (IBD), such as ulcerative colitis, can destroy gut tissue, however quince extract helps to prevent this from happening.\nReduced bacterial development, better heart health, quicker wound healing, and treatment from constipation and GERD are a few potential quince advantages.\nThis fruit is loaded with fibre, pectin, tannins, vitamins, and minerals. Quince Seeds is well known for its wide range of medicinal properties, including its antioxidant, anti-inflammatory, antibacterial, anti-ulcerative, and anticancer properties.\nQuince Seeds, Additionally abundant in minerals necessary for the creation of red blood cells.\nQuince Seeds are a good source of vitamins and minerals that help to maintain healthy skin. It calms the skin and helps to lock in moisture when applied to it. Additionally, it guards against sun damage to the skin.\n', '/storage/photos/1/Final Pic/quince seed.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(35, 'Golden Dock Red', 'Rumex Maritimus', 'Golden Dock Red', NULL, 'Beej Band Lal', 'Helps in respiratory track@\nHelps in reducing Itching\n', 'Rich in natural compounds, which are capable of reducing the body’s inflammatory response, Golden Dock Red is a trademarked supplement.\nIt is a perennial herb containing anti-inflammatory, anti-fungal, and anti-viral properties and is used to treat many promotions such as eczema, psoriasis, arthritis, and gout. \nThese natural diuretics\' leaves can be dried and then steeped in hot water and the tea is taken. It can be consumed regularly, which will help to keep the body healthy and clean.\nGolden Dock Red is rich in antioxidants, which helps to cleanse the body of free radicals and boost its immune system. It also helps to reduce inflammation and lower blood pressure\nGolden Dock Red has a long history of usage as a skin treatment. For those who suffer from psoriasis, dermatitis, acne, and other common skin diseases, it has actually emerged as a natural alternative. It cleans the blood and gives young wenches a fair, cherry-like appearance.\n', '/storage/photos/1/Final Pic/Beej band lal.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(36, 'Golden Dock Black', 'Rumex Maritimus', 'Golden Dock Black', NULL, 'Beej Band Kala', 'Helps in respiratory track@\nhelps in reducing Itching\n', 'The Ayurvedic medication Golden Dock Black is regarded as one of the most precious. Golden Dock Black as an aphrodisiac and antipyretic in febrile and infectious disorders. \nThis nerve tonic is the best for treating a range of vata problems. It cleanses the blood, treats piles, and promotes foetal growth and development.\nThis plant is effective in treating fatigue brought on by a hectic lifestyle. Due to its incredible concentration of antioxidants and other key nutrients, Golden Dock Blackhelps to repair, restore, and revitalise the health of the skin and hair.\nWell recognised for its lengthy history as a herb that improves appearance, the skin can be nourished and repaired from the inside out using this conventional herbal medicine, which can be applied topically and taken internally. \nAdditionally, Golden Dock Black strengthens the scalp and encourages hair growth.It\'s beneficiary oil extracts can be used as a natural promotioner on hair.\n', '/storage/photos/1/Final Pic/Beej band kala.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(37, 'Bengal Quince', 'Aegle Marmelos Correa', 'Bengal Quince', NULL, 'Belgiri', 'Reduces gastric ulcers@\nAids in digestion\n', 'Bengal Quince is a revolutionary supplement designed for the optimal digestive health of your body. This potent blend of natural ingredients helps improve digestion, reduce bloating, and support a healthy gut microbiome. The expertly formulated formula is packed with essential vitamins, minerals, and probiotics to help promote regular digestion and bowel movements. With Bengal Quince, you can feel confident in your digestive health and get the most out of your body.\nBengal Quince is a powerhouse of antioxidants that reduce inflammation, protect cells from damage, and even reduce blood sugar levels. As a result, this amazing herb is a great choice for those looking for natural and holistic solutions for digestive and diabetic issues.\nSkin problems and rashes are a common occurrence during the summer months. Fortunately, Bengal Quince is an excellent remedy for skin infections due to its anti-bacterial, anti-fungal, and anti-inflammatory properties. With regular use, the Bengal Quince can help keep your skin healthy and free from any skin problems or rashes.\n', '/storage/photos/1/Final Pic/Belgiri.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(38, 'Silicate of Lime', 'Silicate of Lime', 'Silicate of Lime', NULL, 'Berpather, Sange Yahud, ', 'Helps in dissolving kidney stones@\nHelps in reducing Itching\n', 'Silicate of Lime is a natural calcium-based mineral supplement that offers amazing health benefits. This prodigious mineral helps to improve digestion and reduce inflammation in the body, making it an ideal supplement for those looking to maintain their health and wellness. \nWith its all-natural ingredients and amazing health benefits, Silicate of Lime is an excellent choice for those looking to stay healthy and fit.\nSilicate of Lime is the perfect choice for those seeking to improve the overall health and appearance of their skin. Our natural and powerful blend of minerals and botanicals provides the skin with essential nutrients for optimal health. Silicate of Lime is designed to help protect the skin from environmental aggressors and to improve skin hydration, elasticity, and tone. This product is free of parabens, sulphates, and other harsh chemicals, and is suitable for all skin types. With regular use, Silicate of Lime will help to improve the overall look and feel of your skin, providing a healthier, more youthful appearance.\n', '/storage/photos/1/Final Pic/silicate of lime.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(39, 'Narrow Leaf', 'Indigofera linifolium', 'Narrow Leaf', NULL, 'Bhangra', 'Antiseptic@\nCoagulant@\nAnti-inflammatory\n', 'Narrow Leaf is an all-natural medicinal herb used to treat a wide range of complaints, such as diarrhoea, gastritis, peptic ulcers, irritable bowel syndrome, haemorrhage, haemorrhoids, cystitis, bronchitis, catarrh, sinusitis, asthma and hay fever. It is a safe, effective, and natural remedy for these promotions, and is backed by decades of research and use. Unlike traditional medications, Narrow Leaf does not contain any synthetic or artificial ingredients, making it safe for long-term use. With its powerful anti-inflammatory and healing properties, Narrow Leaf can provide relief from the symptoms of these promotions, and promote overall well-being.\nNarrow Leaf provides skin benefits that are out of this world! This unique herb helps to protect your skin from environmental damage, reduce signs of ageing, and helps to keep your skin hydrated and moisturised. With long-lasting hydration, it helps to minimise the appearance of wrinkles and fine lines, and boost your skin\'s natural radiance. With Narrow Leaf, you can get the skin you\'ve always dreamed of!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:13', '2022-12-29 09:30:13'),
(40, 'Red Behen', 'Salvia Haematodes', 'Red Behen', NULL, 'Bheman Lal, Bheman Ahmer, ', 'Promotes Heart health@\nImproves Memory\n', 'Red Behen is an all-in-one herbal supplement that offers powerful anti-microbial, anti-inflammatory and antioxidant benefits. Its active ingredients help to reduce inflammation, combat harmful bacteria and viruses, and provide powerful antioxidant protection. Red Behen helps to keep you feeling healthy and energised, while also providing a natural boost to your immune system. With its unique combination of properties, \nRed Behen helps to improve memory and learning abilities. Whether you\'re a student studying for exams or a busy professional needing to stay sharp, Red Behen is the perfect solution to help you remember important information and stay on top of your game.\nFormulated with a carefully selected blend of plant extracts, Red Behen is designed to help your body cope with stress-related promotions and can even help lower your blood pressure. It also strengthens your nervous system, helping you to recover faster from illness or injury. With Red Behen, you can help your body stay strong and healthy so you can take on the world!\n', '/storage/photos/1/Final Pic/Bheman lal.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(41, 'White Rhapontic', 'Cantaurea Behen Linn.', 'White Rhapontic', NULL, 'Bheman Safed, Bheman Abhiyat, ', 'Improves Complexion of skin@\nBeneficial in deafness@\nTreats General Body Weakness\n', 'White Raphontic is an ayurvedic medicinal blend formulated to promote and maintain healthy sexual vitality, fertility, and general wellbeing. Using the principles of traditional Indian medicine, this powdered herbal remedy works to support the natural balance of the body while targeting symptoms associated with male and female infertility, erectile dysfunction, and overall sexual health. An easy-to-take form, it offers a convenient solution for treating and maintaining vital health in a safe, natural way.\nThis natural supplement helps to regulate body functions and maintain homeostasis in the body during times of stress or weakness. It is easy to use, non-habit forming, and contains no artificial ingredients, making it safe and effective for all ages.\nWith regular use, this natural ingredient helps to improve texture, reduce wrinkles and even out skin tone. White Raphontic also aids in bettering vision and can even relieve eye strain and dryness caused by long hours of looking at screens.\n', '/storage/photos/1/Final Pic/bheman safed.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14');
INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `plu`, `other_name`, `benefit`, `description`, `photo`, `minprice`, `promotion`, `status`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(42, 'Marking Nut Tree', 'Semecarpus Anacardium', 'Marking Nut Tree', NULL, 'Bhilawa', 'Improves Digestive health@\nHelps improve scaly skin@\nControls Blood Sugar Levels\n', 'Marking Nut Tree is a revolutionary health supplement that packs a powerful punch of natural antioxidants, anti-inflammatory, anti-arthritic, antimicrobial, anti-cancer and anti-diabetic properties. The unique blend of all-natural ingredients is designed to support your body\'s natural defence system, locking in essential nutrients, vitamins and minerals for optimal health. With Marking Nut Tree, you can trust that you are getting the best of the natural world – and a healthier you.\nThis unique and effective product has been formulated to effectively treat Leucoderma. Using natural ingredients, it can help reduce the appearance of white spots on the skin, providing long-term relief from this troubling promotion. The active ingredients also help protect against further damage while boosting overall skin health and clarity.\nMarking Nut Tree contains a powerful blend of nutrients that nourish and strengthen the hair follicles, preventing grey hairs from forming and providing you with youthful, natural looking hair. With regular use, this product helps promote strong, healthy-looking hair and prevents greying to keep your locks looking naturally vibrant and beautiful.\n', '/storage/photos/1/Final Pic/Bhilawa.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(43, 'Bhumi Amla', 'Phyllanthus Niruri', 'Bhumi Amla', NULL, 'Bhumi Amla, Stonebreaker, Gale of the wind, ', 'Helps in controlling Cough and Cold@\nImproves Digestive Disorders\n', 'Bhumi Amla is an Ayurvedic superfood known for its wide range of health benefits. This unique ingredient is rich in flavonoids, a powerful antioxidant that helps boost the body’s metabolism and burn fat quickly. This makes Bhumi Amla a great natural aid in helping shed excess weight, as well as promote healthy blood circulation, immunity, digestion and skin health.\nBhumi Amla is an effective supplement for liver health due to its powerful hepatoprotective, antioxidant, and antiviral properties. \nBhumi amla is an effective and natural remedy for those who suffer from arthritis and joint pain. It has powerful analgesic, anti-inflammatory and pain-relieving characteristics, making it the ideal product to reduce pain and inflammation in affected areas. Its bio-active components provide long-lasting relief from your symptoms, helping you feel better with improved quality of life.\nRich in antioxidants and anti-microbial properties, this medicinal herb helps fight off skin infections like acne, warts, boils, psoriasis, scabies, eczema, blisters and itching. Add this herbal supplement to your daily routine to enjoy glowing and healthy skin.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(44, 'Rajad Al Asad', 'Corydalis Govaniana', 'Rajad Al Asad', NULL, 'Kabutar Pau, Govans Corydalis, Rajad Al Asad, ', 'Helps in treatment of disorders from poisoning, swelling of the limbs@\nHelps in treatment of pain due to worm infestation\n', 'Rajad Al Asad, the natural herbal supplement for total body health. Made from a proprietary blend of premium herbs and roots, Rajad Al Asad is a powerful pain reliever and energy enhancer. It also has anticancer effects, allowing you to reduce your risk of developing cancer-related illnesses. \nRajad Al Asad is an ideal remedy that acts as a powerful analgesic, sedative, and hypnotic to provide long-lasting relief from discomfort and improve the overall wellbeing of users. It works quickly to ease tension, reduce inflammation, and soothe stress. For those seeking a reliable remedy for their pain, Rajad Al Asad provides the perfect solution.\nThis specially formulated medication is perfect for treating menstrual-related headaches and migraines. It has been clinically proven to help with relieving general menstrual pain. Take this medication to alleviate any type of discomfort related to menstruation so you can feel your best during your period!\n', '/storage/photos/1/Final Pic/rajad Al Asad.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(45, 'Bhuzidan', 'Pyrethrum Indicum', 'Bhuzidan', NULL, 'Pyrethrum', 'Improves digestion@\nMay relieves toothache\n', 'Bhuzidan is an all-natural herbal supplement that provides natural relief from inflammation, hypertension, and respiratory diseases. This powerful combination of plant extracts works quickly to soothe and ease symptoms, providing long-term benefits with regular use. With Bhuzidan, you can trust that you\'re getting effective, safe treatment for the root cause of your ailments - not just a temporary masking of symptoms. \nThis natural supplement contains several potent ingredients known to promote a healthy inflammatory response. By providing the body with these important anti-inflammatory compounds, Bhuzidan may help alleviate pain and swelling due to inflammation, improve mobility and increase overall wellbeing.\nWhen taken daily, this powerful herb helps promote healthy weight loss, regulate appetite and support digestion, aiding in the maintenance of a healthy body mass index (BMI). This natural herb helps improve cardiovascular health, boost metabolism and strengthen immunity. All in all, this natural supplement is a great choice for those looking to lose weight naturally and live a healthier lifestyle!\n', '/storage/photos/1/Final Pic/Bhuzidan.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(46, 'Elephant Creeper', 'Argyreia Nervosa', 'Elephant Creeper', NULL, 'Bidara Lakad', 'Aids Digestion @\nMay treats Constipation\n', 'Long been used in traditional indigenous medicine for its many health benefits, Elephant Creeper has been found to be especially useful in treating chronic ulcers, gonorrhoea, strangury, and gleet. \nPacked with antioxidants, making it a great choice for anyone looking to support their overall health. It is an all-natural solution to a range of medical promotions that can cause pain and discomfort. Give your body the support it needs with this ancient remedy.\nThis incredibly powerful herbal remedy has anti-inflammatory and anti-microbial properties which make it an ideal choice for people suffering from rheumatism and Gangrene. With regular use of Elephant Creeper, you can be sure that you\'re getting all the benefits this remarkable herb has to offer.\nElephant Creeper\'sproperties as an emollient help soften and soothe, while its astringent qualities act as a natural toner to tighten and firm your skin. It also helps to promote healing and reduce redness, allowing you to feel beautiful and confident in your own skin.\n', '/storage/photos/1/Final Pic/Bidara lakad.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(47, 'Giant Potatoe Roots', 'Pueraria Tuberosa', 'Giant Potatoe Roots', NULL, 'Bidarikand, Indian Kudzu', 'Promotes Wounded Heals@\nimproves skin texture\n', 'Regarded as a remarkable diuretic, helpful in leprosy, soothing for burning sensation, relieving vomiting and aiding diseases of the blood - Giant Potato Root contains anthelmintic and syphilis-fighting abilities, as well as being able to aid with spleen-related illnesses. \nPlus, Giant Potato Root even possesses Aphrodisiac activity, Anticancer activity and anti microbial activity - making it a great all-rounder!\nPotato Root is a natural skincare solution that can help lighten up scars, blemishes, dark spots, and hyperpigmentation. It\'s formulated with powerful natural ingredients to promote rapid healing of skin damage and restore an even complexion. Perfect for those looking to fade away the effects of sun damage or any other kind of discoloration on the skin. Try Giant Potato Root today and watch as your skin looks brighter, smoother and more beautiful in no time!\nUsed as an active ingredient in hair washes to effectively combat dryness and provide the scalp with necessary nutrients, Giant Potato Root is a powerful anti-dandruff ingredient that helps to keep your scalp hydrated and nourished.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(48, 'Bristly Luffa', 'Luffa Enchinata Roxb.', 'Bristly Luffa', NULL, 'Bindal Doda', 'Helps in treatment of jaundice@\nStrengthens Heart and Liver by reducing intrinsic heat\n', 'Luffa is an all-natural remedy that is traditionally used to treat and prevent colds, as well as alleviate nasal swelling and sinus problems. \nAdditionally, it may help ease arthritis pain, muscle pain, chest pain, and restore absent menstrual periods in women. By taking Luffa orally, you can naturally enjoy its beneficial effects.\nLuffa is an incredible medicinal herb with antiseptic properties, making it great for treating minor cuts and scrapes. \nThis incredible medicinal herb has been used as a blood purifier to help cleanse the body and remove any impurities within.\nBristly Luffa is a natural and effective way to exfoliate your skin without scratching or causing any chemical-induced irritation. The gentle fibrous texture helps remove dead skin cells that accumulate on the surface of the skin, leaving it smooth and glowing. By using Luffa regularly, you can achieve beautiful and healthy looking skin.\nThis natural luffa plant extract is perfect for nourishing your hair. Not only that, but it is also believed to prevent premature greying, giving you strong, healthy and vibrant locks!\n', '/storage/photos/1/Final Pic/Bindal doda.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(49, 'Cotton Seeds', 'Gossypium Hirsutum', 'Cotton Seeds', NULL, 'Binola Giri, Pamba Dana, ', 'Antioxidant @ Improves overall skin health @ Reduces scalp itchiness.', 'An incredibly nutritious source of vitamins, minerals, and antioxidants - Cotton Seed contains high amounts of powerful antioxidants which are necessary for maintaining a healthy lifestyle. These antioxidants help to combat free radicals and protect cells from oxidative damage, while also providing the body with essential nutrients such as Vitamin A, Vitamin E, and selenium. \nAdditionally, Cotton Seed is high in fibre and low in calories, making it a great addition to any diet or health plan. With its unique combination of benefits, cottonseed can help you lead a healthier life. \nWhen used topically, Cotton Seed Oil can help moisturise and hydrate skin, fight against signs of ageing, protect from environmental stressors, reduce irritation, reduce inflammation and improve overall skin health. \nFor hair care, Cotton Seed can be used to help reduce scalp itchiness or flakiness as well as give extra shine and strength to your locks. With its impressive list of natural nourishing benefits, Cotton Seed is an essential part of any beauty routine.\n', '/storage/photos/1/Final Pic/binola giri.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(50, 'Rosin', 'Resin', 'Rosin', NULL, 'Biroza, Damar, ', 'Contains Antiseptic and Phygocytic properties @ Removes unwanted body hair @ Promotes perspiration.', 'This traditional remedy has been used for centuries to stimulate, promote perspiration, and aid in the burning of toxins within the body. \nIts stimulating and diaphoretic qualities are also helpful for aiding with colds, flu, feverish promotions, headaches and more. Rosin is an incredibly versatile medicinal herb that has been treasured by many cultures throughout history.\nAn all-natural compound that is known to have antiseptic and phagocytic properties, \nGum Rosin\'s antiseptic capabilities help fight against bacterial infections and it also helps stimulate the body\'s natural phagocytic activities, which help the immune system combat foreign pathogens. Rosin is easy to use and provides long-lasting protection from infection and inflammation.\nGum Rosin is an all-natural hair removal option that effectively and safely removes unwanted body hair, providing smooth, long-lasting results with no mess or hassle. Gum Rosin\'s non-irritating properties means it won\'t cause redness, burning, or stinging sensations often associated with waxing or other traditional hair removal methods. Use Gum Rosin for quick, efficient removal of body hair.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(51, 'Polypody', 'Polypodium Vulgare', 'Polypody', NULL, 'Bisfatch', 'Helps stimulate digestion @ Powerful Analgesic @ Anti-bacterial.', 'A herbal medicine traditionally used for a variety of ailments, Polypody has been used as a laxative to stimulate digestion, as an appetite stimulant, for bronchitis relief, and for dry irritable coughs. \nTaken in various forms including teas, capsules, tinctures and more, Polypody\'s natural properties make it a great choice for anyone looking to naturally treat their ailments.\nPolypody is an effective remedy for pain relief. This herbal supplement is a powerful analgesic, making it a great choice for those looking for natural ways to relieve pain and discomfort. Polypody can help to reduce inflammation and swelling, soothe aches and pains, and provide overall comfort to the body. \nApplied topically, its unique antibacterial properties help protect the skin from infection. Polypody has been used for centuries to heal damaged skin and restore it back to health.\nUse it as an ointment or apply a compress for a fast-acting relief from the irritation caused by minor wounds, grazes, cuts, scrapes and bites. With its natural ingredients, Polypody is gentle yet powerful enough to effectively aid in your healing journey.\n', '/storage/photos/1/Final Pic/Polypody.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(52, 'Bacopa', 'Bacopa Monnieri', 'Bacopa', NULL, 'Brahmi Booti,  Thyme Leaves Gratiola, ', 'Prevents anxiety @ Sharpen and improves memory @ Promotes healthy blood flow.', 'Bacopa is an amazing adaptogenic herb with multiple health benefits. It can help your body better resist the physical and mental effects of stress, as well as prevent feelings of anxiety and fear. \nAn ancient herbal remedy used in Ayurvedic medicine for centuries, this traditional brain tonic helps to improve memory, sharpen focus, and boost overall mental performance and even promote better sleep. Bacopa is a safe and natural way to improve concentration and memory - perfect for anyone looking to increase their cognitive performance. Add a dose of this incredible herb to your daily routine for optimal stress relief and enhanced mental clarity.\nBacopa has an energising cooling property, making it an ideal choice to support healthy joint movement and a sense of ease. This unique herb can also promote healthy blood flow, creating the perfect environment for vibrant and lustrous hair, as well as a glowing complexion.\n', '/storage/photos/1/Final Pic/Bacopa.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(53, 'Camels Thistle', 'Echinops Echinatus', 'Camels Thistle', NULL, 'Brahmi Dandi', 'Antioxidant @ Aphrodisiac @ Provides soothing on irritated skin.', 'Camel\'s Thistle, this herbal remedy has anti-inflammatory, analgesic, antipyretic, and wound healing properties that work together to provide a soothing relief that can reduce inflammation while relieving pain. Unlike many medications, Camel\'s Thistle is safe and effective with no known side effects.\nThe active ingredients of this herb are natural antioxidants which are remarked as the primary source of its therapeutic effects. \nCamel\'s Thistle is a special, natural supplement used for centuries as an aphrodisiac, providing a boost to sexual arousal and pleasure. In addition to this, Camel\'s Thistle also boosts immunity, giving your body extra protection against colds and other illnesses. Taking Camel\'s Thistle on a regular basis helps maintain good health and provide you with an overall sense of wellbeing. \nAn effective skincare remedy, Camel\'s Thistle is known to provide soothing relief to irritated skin and leave it feeling nourished, moisturised, and hydrated. This special herbcan also help improve the appearance of wrinkles, dark spots, scars, and other skin promotions. With regular use, your skin will become more radiant and youthful-looking!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(54, 'Yarrow', 'Achillea Millefollium Linn.', 'Yarrow', NULL, 'Brinjasif', 'Improves digestion @ Anti-Inflammatory @ Provides soothing relief for skin.', 'A beneficial herb that aids in improving digestion, Yarrow helps increase saliva and stomach acid levels which can help break down food more effectively. Yarrow also relaxes the smooth muscles in the intestine and uterus, allowing for the relief of abdominal pain and menstrual cramps. \nA natural remedy, Yarrow contains several active compounds, including essential oils and flavonoids, which are thought to have anti-inflammatory and blood pressure-lowering properties making it an ideal herbal supplement for those who wish to improve their overall health.\nThe perfect natural remedy for skin and muscle discomfort -This green, sweetly scented oil is known for its anti-inflammatory, antiseptic, antispasmodic, and astringent properties which work together to provide soothing relief. Yarrow essential oil can be used as a topical ointment to reduce inflammation or in aromatherapy sessions to help relax the mind and body. \nIn hair care, Yarrow can be a great choice for increasing hair growth, as well as soothing scalp irritations.\n', '/storage/photos/1/Final Pic/yarrow.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(55, 'Cassia Absus', 'Cassia Absus', 'Cassia Absus', NULL, 'Chaskoo, Chasmizaa, ', 'Treats high blood pressure @ Helps in weight loss @ Beneficial against complications from diabetes.', 'Cassia Absus is a powerful herbal remedy that can help alleviate the symptoms of hypertension, infections, and diabetes. It has been used traditionally in many parts of the world to treat high blood pressure, improve circulation, and help manage glucose levels. It also helps reduce inflammation associated with these promotions and may be beneficial for those with complications from diabetes such as diabetic nephropathy. \nThis natural herbal supplement that can help you in your journey towards healthy weight loss. By incorporating this supplement into your daily routine, you can help your body burn excess fat and reduce inches off of your waistline. \nIn addition to its weight-loss benefits, Cassia Absus can also aid with getting a better night’s sleep. Not only will it relax the mind, but it can also soothe away sore muscles and ease joint pain for long lasting relief. Take advantage of these incredible benefits with just one dose each day.\n', '/storage/photos/1/Final Pic/Chaskoo.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(56, 'Chia Seed', 'Salvia Hispanica', 'Chia Seed', NULL, 'Chia Seeds', 'Helps support cardiovascular health @ Boosts energy levels @ Promotes healthy skin and hair.', 'Chia seeds are a nutritional powerhouse packed with essential vitamins and minerals. Adding Chia to your diet can help support cardiovascular health, regulate digestion, boost energy levels and mental clarity, as well as help to promote healthy skin and hair. \nThese tiny, nutty-tasting seeds reduce blood pressure levels in individuals who already have elevated readings.\nNot only are they beneficial for overall health, but they also help nourish and beautify skin. Eating chia seeds regularly helps increase skin elasticity, providing the firmness and luminosity you want for glowing skin. Plus, because chia seeds are so nutrient-rich, your skin will benefit from a healthier complexion from the inside out.\nPacked with healthy omega-3 fatty acids, Chia Seeds are a great way to naturally inhibit hair fall and give your hair a much needed boost of new growth. This nutrient-rich superfood will help bring life back to dry, damaged hair, leaving it looking fuller and more vibrant. Give yourself the gift of beautiful hair today - with Chia Seeds.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(57, 'Red Betelnut', 'Areca Catechu Linn.', 'Red Betelnut', NULL, 'Chikni Supari Lal, Red Betelnut, Fufil Ahmer, ', 'Anti-cancer properties @ Anti-bacterial @ Antioxidant.', 'Amazing superfood renowned for its many health benefits, Red Betelnut has cancer-fighting properties, but it may also help with cardiovascular and digestive issues, while providing anti-inflammatory and wound-healing properties. With so much to offer in one package, Red Betelnut is a must-have for those looking to improve their overall wellbeing. \nRed Betelnut\'s astringent and antibacterial properties can help protect your teeth from plaque buildup and enamel erosion, as well as reduce tooth sensitivity. Not only does Red Betelnut help fight cavities, but it can also freshen breath naturally with its sweet, licorice-like flavour.\nWith its anti-acne, antioxidant, and tyrosinase inhibiting properties, it helps prevent acne breakouts and its potent antioxidants also help protect skin from environmental stressors like free radicals while slowing down the ageing process. Moreover, its ability to inhibit tyrosinase production helps reduce wrinkles by reducing melanin formation. Red Betelnut is the perfect solution to get youthful looking skin without having to spend a fortune.\n', '/storage/photos/1/Final Pic/Red beetel nut.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(58, 'Chirata Indian', 'Swertia Chirata', 'Chirata Indian', NULL, 'Chiraytha Indian, Bitter Stick Indian, ', 'Helps in weight loss @ Effective against respiratory ailments @ Treats acne.', 'Known for its ability to treat and manage different types of fever, hysteria and convulsions @ Indian Chirata is a powerful medicinal herb that has many health benefits. \nDried Indian Chirata Leaves are a fantastic way to help shed excess weight faster. Rich in flavonoids, a natural antioxidant that helps to speed up the metabolism and boost your energy levels. Adding these leaves to your diet can help you reach your weight loss goals quickly and naturally. \nRich in anti-inflammatory, anti-biotic, and anti-asthmatic properties, Indian Chirata can be used as an effective treatment against various respiratory ailments. By utilising the natural healing powers of these special leaves, you can quickly reduce symptoms associated with these seasonal illnesses. \nA natural remedy for skin problems such as acne. Indian Chirata works by removing toxins from your body and helping the skin stay healthy. Indian Chirata can also help reduce inflammation, balance sebum levels, and moisturise the skin. Regular use of this natural ingredient can keep your skin looking and feeling healthy!\n', '/storage/photos/1/Final Pic/Chiraita.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(59, 'Chirata Nepal', 'Swertia Chirata', 'Chirata Nepal', NULL, 'Chiraytha Nepal, Bitter Stick Nepal, ', 'Provides relief from digestive ailments @ Increases blood flow @ Provide relief from burning sensations.', 'A herbal remedy from Nepal, Chirata Nepal can provide relief from various digestive system ailments. This product has been traditionally used to treat issues such as gastritis, indigestion, heartburn and stomach pain. \nTaken orally to help with seizures, high blood pressure, asthma, diabetes and hiccups, Chirata Nepal has a long history of use in Ayurvedic medicine and may help alleviate symptoms of these health issues when used correctly. \nContaining many amazing medicinal properties, Chirata Nepal is also believed to have a special ability to increase blood flow in the body. This can be beneficial for those suffering from anaemia, as it helps replenish depleted red blood cells. Regular intake of this herb can help increase your energy levels and overall well-being. \nThe decoction obtained from Chirata Nepal can provide relief from burning sensations, dryness, and itchy skin. Not only is this herb incredibly effective at soothing irritation and inflammation on the skin, but it\'s also safe and non-toxic, making it a great choice for those with sensitive skin.\n', '/storage/photos/1/Final Pic/Chiraita.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(60, 'Charoli', 'Buchanania Lanzan', 'Charoli', NULL, 'Chironji', 'Source of protein and dietary fibres @ Helps in weight loss @ Skin Hydration.', 'Charoli is a nutritional powerhouse, boasting an abundance of proteins and dietary fibre, while also being low in calories. Incorporating this amazing plant into your diet can help give your body the strength it needs to fight off tiredness and boost your immunity. \nA healthy, natural way to help people with obesity manage their diet, Charoli are low in calories so you can add them to your diet chart without feeling guilty. Enjoy the delicious nutty flavour of Charoli seeds while still maintaining your healthy weight goals.\nAn ideal solution for skin hydration, Charoli Seeds are high in oil and fats that can provide a powerful moisturising effect, making them perfect for application to the face to treat acne, pimples, and blemishes. Get smooth and glowing skin with this natural remedy.\nCharoli is a nourishing oil that can be used for various purposes, including haircare. When applied to the scalp, this all-natural oil may help provide the hair and scalp with essential moisture and nutrients for healthy growth and shine. Give your locks the luxurious treatment they deserve with Charoli!\n', '/storage/photos/1/Final Pic/chirongi.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(61, 'Wild Leadwort', 'Plumbago Zeylanica', 'Wild Leadwort', NULL, 'Chitrakmool, Wild Leadwort', 'Antiviral and Antibacterial properties @ Antioxidant and Anti-inflammatory @ Provides relief from headache.', 'A versatile herb with many medicinal properties, The Wild Leadwort can be used to treat a variety of ailments including fevers, diarrhoea, digestive problems, colds and skin promotions such as leprosy and malaria. This traditional remedy is a natural source of essential nutrients and provides an array of healing benefits. With its powerful antiviral and antibacterial properties, Wild Leadwort is the perfect solution for treating both internal and external issues.\nRich in polyphenols, Wild Leadwort can be used as an herbal supplement to help protect your cells from the effects of oxidative stress. Its natural compounds have been shown to have antioxidant, anti-inflammatory and even anti-tumor properties. Regular use of Wild Leadwort may support heart health, brain health, and boost overall immunity. Start reaping the benefits of this super plant and enjoy improved health for a better you.\nWith its antispasmodic and analgesic properties, this plant is the perfect solution for when you need relief from that throbbing headache. It has a calming effect on the body, relieving pain and reducing stress to bring a sense of balance and well-being.\n', '/storage/photos/1/Final Pic/Chitrakamool.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(62, 'China Root', 'Smilax Chinalium', 'China Root', NULL, 'Chobchini', 'Contains Anti-inflammatory properties @ Improves digestion @ Purifies blood.', 'Containing numerous beneficial properties, such as analgesic, anti-inflammatory, diuretic, stimulant, carminative, laxative and tonic effects, China Root is a powerful herbal remedy that has been used in traditional Chinese medicine for centuries. With its potent active ingredients, its natural anti-inflammatory properties help to reduce pain and discomfort at the joints, allowing you to move freely without any discomfort. With its ability to increase circulation and stimulate healing, China Root can be an effective part of your daily supplement routine for overall joint health. \nIt also has natural laxative and tonic effects that can improve digestion and overall well-being. China Root is an all-natural supplement that provides fast-acting relief and lasting results.\nChina Root is an incredibly powerful herb that helps to unclog sweat pores, remove toxins from the body, and purify the blood. This special herb can also be used as a remedy for skin infections and other ailments. Take advantage of all the incredible properties of China Root and give your health a natural boost.\n', '/storage/photos/1/Final Pic/chobchini.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(63, 'Stone Flower', 'Parmelia Perlata', 'Stone Flower', NULL, 'Dager Phool, Shaiba, ', 'Helps in healing of wounds @ Promotes optimal cardiac function @ Effective against bacteria.', 'A rare flower that is known for its purported ability to speed up the healing process of wounds, Stone Flower also has some anti-inflammatory and pain relief benefits.It is believed that this medicinal plant can accelerate the natural healing of cuts and bruises, as well as reducing pain from burns or sunburns. \nStone Flower has been used in Ayurveda for centuries and is renowned for its ability to treat and prevent kidney stones. Providing an overall sense of well-being, Stone Flower helps to reduce blood pressure and relaxes the blood vessels.\nThis natural herb also supports a healthy balance between stress and relaxation, promoting optimal cardiac function. By regularly taking Stone Flower, you can enjoy long-term support for your cardiovascular system.\nHaving amazing antimicrobial and phytochemical properties, Stone Flower can help to effectively kill off harmful bacteria in the body. Its powerful nutrients also work as a natural way to reduce inflammation and boost immunity. With Stone Flower, you\'ll be on the path to better health in no time.\n', '/storage/photos/1/Final Pic/Stone Flower.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(64, 'Sal Tree', 'Shorea Robusta Gaertn', 'Sal Tree', NULL, 'Damar Batu, Raal Safied, ', 'Antibacterial and Antiseptic properties @ Stimulate digestion @ Antioxidant and Anti-inflammatory properties.', 'A powerful natural remedy that has been used for centuries in traditional medicine, Sal Tree\'s leaves and bark have been found to be beneficial for treating a variety of promotions including leprosy, wounds, ulcers, cough, headache, diarrhoea and vaginal discharges. With its potent antibacterial and antiseptic properties, Sal Tree is an excellent choice when it comes to relieving discomfort and promoting healing. \nA herbal extract known for its powerful medicinal properties, its natural resin has astringent, carminative, and stomachic qualities that can be used to treat digestive problems. Sal Tree Resin helps reduce the acidity of the digestive system while calming any spasms or pain. Additionally, it can be used as a tonic to increase appetite and stimulate digestion.\nSal Tree has powerful antioxidant and anti-inflammatory properties that make it effective in treating excessive oiliness, itching, red rashes, and other common skin irritations. Not only is this extract a safe choice for all skin types, but it can also provide long-lasting results when used consistently.\n', '/storage/photos/1/Final Pic/Damar Batu.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(65, 'Gum Dragon Blood', 'Dracaena Cinnabari', 'Gum Dragon Blood', NULL, 'Damlakhven', 'Improves digestive health @ Reduces inflammation @ Anti-aging and skin healing.', 'A popular herbal supplement used for digestive health, Dragon Blood has beenused for centuries to soothe the gastrointestinal system and support regularity. Beneficial for the digestive tract, including phenols, saponins, and proanthocyanidins, Taking Dragon Blood daily can help to keep your digestive system functioning optimally and promote overall well-being.\nAn all-natural and effective remedy that can be used to help reduce inflammation. It contains powerful antioxidants, minerals, and other active compounds that work together to relieve inflammation associated with chronic pain and stiffness. With regular use, it can help restore balance in the body for improved overall health.\nThe amazing all-natural skin treatment that provides superior anti-aging, regenerating, and skin healing benefits. Utilising powerful ingredients derived from the exotic dragon\'s blood tree keep your skin looking and feeling young, healthy, and vibrant. Whether you are dealing with wrinkles, fine lines, discoloration, blemishes, or other signs of ageing - Dragon Blood will work hard to make sure that your skin is taken care of.\n', '/storage/photos/1/Final Pic/Gum Dragon Blood.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(66, 'Walnut Bark', 'Juglans Regia Linn.', 'Walnut Bark', NULL, 'Dandasa, Dairam, ', 'Anti-inflammatory @ Provides complexion of skin @ Rich in protein and dietary fibre.', 'The perfect remedy for relieving pain and swelling in the body, Walnut Bark\'s natural tannins have potent properties that can help to dry up body fluids like mucous. This makes Walnut Bark an effective, all-natural treatment option. Get fast-acting relief with the powerful benefits of this natural product. \nWalnut Bark is an incredible superfood that is most known for its anti-inflammatory properties, helping to reduce pain and inflammation associated with various promotions. Walnut Bark also contains essential vitamins, minerals, antioxidants and healthy fats, making it a nutritious addition to any diet. \nWalnut Bark Powder is an all-natural, gentle exfoliant for the skin. Its unique granules provide a soft and subtle exfoliation, eliminating dead skin cells and revealing a smoother and healthier complexion. Regular use of Walnut Bark Powder can even out skin tone, resulting in brighter and more radiant looking skin.\nWalnut Bark is the perfect addition to your diet. Rich in both protein and dietary fibre, these provide essential nutrition and support your health. Walnut Bark can help you stay full for longer and prevent fat absorption, making them an excellent option for weight management.\n', '/storage/photos/1/Final Pic/Dandasa.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(67, 'Leopards Bane', 'Doronicum Roylei', 'Leopards Bane', NULL, 'Darunj Akrabi', 'Treats hair loss @ Soothes muscle spasms @ Analgesic.', 'A revolutionary product designed to tackle all your health issues, Leopard Bane\'s natural blend of herbs and extracts is effective at treating hair loss, arthritis, inflammation, bruises, infections and muscle and joint pain. This herbal supplement has anti-inflammatory properties that help to reduce swelling in the affected areas and also soothe muscle spasms. With regular use, Leopard Bane helps improve blood circulation and stimulate healthy hair growth.\nAn all-natural analgesic that helps to reduce pain and discomfort. Its antibacterial properties make it a powerful solution for reducing bacteria that cause infection and irritation. Apply as needed and experience fast relief of your sore muscles and joints. Trust in the power of Leopard Bane and enjoy a life free of pain.\nDesigned to promote healthy hair growth, prevent further hair loss, and even treat pesky dandruff, Leopard Bane is the ultimate solution to your hair woes. Enjoy thick, voluminous hair that\'s easy to manage without any harsh chemicals or expensive treatments. Leopard Bane is a one-stop shop for all your hair needs.\n', '/storage/photos/1/Final Pic/darunj akrabi.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(68, 'Black Cardmom Seeds', 'Amomum Subulatum', 'Black Cardmom Seeds', NULL, 'Elaichi Kali, Hail Aswat, ', NULL, 'These little superfoods can activate antioxidant enzymes in your heart, providing it with powerful antioxidant activity. Experience the benefits of black cardamom and its powerful protective effects on your cardiovascular system today. \nBlack Cardamom Seeds have powerful antimicrobial properties, meaning it can potentially help to fight off infections and protect your health. Add black cardamom to curries, soups, or desserts for a fragrant, smoky flavour – and reap the potential benefits of its powerful protective powers.\nThis unique essential oil, extracted from Black Cardamom Seeds, carries with it many benefits that may help improve your overall well being. Not only does it contain properties that can stimulate your appetite, but also helps to promote healthy digestion. \nThese natural and herbal seeds are an ancient remedy for gum and teeth infections. Containing a number of powerful antiseptic, antiviral and anti-inflammatory agents, Black Cardamom Seeds can help to soothe, protect and prevent oral infections. Enjoy their pleasant aroma or grind them up into a powder and make a healing mouth rinse - either way these unique spices offer numerous benefits for dental health.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(69, 'Fiber Fruit', 'Corylus Avellana Linn.', 'Fiber Fruit', NULL, 'Findak', 'Promotes digestive health @ Provides complexion to skin @ Nourishes hair follicles.', 'A unique, healthy snack that packs an abundance of nutrients into one tasty treat. With an unbeatable combination of oil, protein, fibre, and antioxidants, it is the perfect snack to give your body the nourishment it needs. Whether you\'re looking for a quick snack to fuel your day or something special to treat yourself, Fiber Fruit has you covered.\nAn excellent source of dietary fibre, Fiber Fruit contains both soluble and insoluble fibres, which makes it a great choice for those looking to promote digestive health. This natural supplement can help regulate intestinal transit, keeping your system running smoothly. \nRich in oleic acid, Fiber Fruit (or Hazelnut) oil helps to hydrate and moisturise the skin for a healthy-looking complexion. Just apply a few drops onto clean skin each day for soft and visibly supple skin. Plus, its natural oils provide long-lasting hydration so you can say goodbye to dryness. \nThis innovative fruit nourishes hair follicles with an enriching blend of vitamins, minerals, and proteins that promote blood flow and helps reduce breakage - leaving you with luscious, healthy locks.\n', '/storage/photos/1/Final Pic/Findak.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(70, 'Alum Red', 'Potassium Aluminium Sulfate', 'Alum Red', NULL, 'Fitkari lal, Shab Ahmer, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(71, 'Alum White', 'Potassium Aluminium Sulfate', 'Alum White', NULL, 'Fitkari Safed, Shab Abhiyat, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(72, 'Makhana', 'Euryahle Ferox', 'Makhana', NULL, ' Phool Makhana, Fox Nuts, Fool Makhana, ', NULL, NULL, '/storage/photos/1/Final Pic/Fox Nuts.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(73, 'Carrot Seeds', 'Daucus Carota', 'Carrot Seeds', NULL, 'Gajar beej, Carrot Seeds, Bijr Jizar, ', 'Helps in weight loss @ Stimulates digestive system @ Antiseptic properties.', 'From cardio- and hepatoprotective effects to cognitive dysfunction prevention, these tiny seeds have it all! Carrot Seeds can help reduce cholesterol levels and boast powerful anti-bacterial, anti-fungal, anti-inflammatory, analgesic, and wound healing properties. Add some to your diet today and reap the rewards of this amazing superfood.\nRich in dietary fibre, Carrot Seeds can help keep you full longer and prevent overeating. Eating carrot seeds can aid in weight management and help maintain a healthy weight. Helping stimulate the digestive system, These premium seeds provide a natural way to aid digestion and help with overall gut health. Carrot Seeds can be used as part of everyday diet to help boost  health and keep you feeling your best. \nWith its natural antimicrobial and antiseptic properties, these seeds can help prevent acne breakouts, as well as deeply cleanse your skin leaving it hydrated and refreshed. Incorporate carrot seed oil into your daily skin routine and start seeing the amazing results of this amazing ingredient!\n', '/storage/photos/1/Final Pic/Carrot Seeds.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(74, 'China Clay', 'Kaolinum', 'China Clay', NULL, 'Geru Lal', 'Cleansing properties @ Teeth whitener @ Prevents dry scalp.', 'An all-natural ingredient often used as a gentle cleanser, an exfoliating scrub, or even a soothing mask for the ultimate spa day experience. \nChina Clay is specially formulated to absorb any extra oil from your skin’s surface and prevent clogged pores. In addition, it helps even out your skin tone, resulting in a healthy and youthful look. \nHaving powerful cleansing properties that work to deep clean and remove dirt, impurities, and excess oils from your skin pores. This helps prevent the accumulation of bacteria that causes acne breakouts, allowing you to keep your skin looking healthy and blemish-free. \nFor a brightening smile, China Clay draws out toxins and impurities from your teeth, while whitening them in a safe and gentle way. \nAn effective way to remove excess oil, dirt and other pollutants from your scalp, China Clay\'s unique formula is enriched with the nourishing benefits which gently cleanses while adding a touch of natural moisture. With regular use, it can help soothe an itchy or dry scalp and promote healthy hair growth.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(75, 'Giloy', 'Tinospora Cordifolia', 'Giloy', NULL, 'Gilo Lakdi, Cocculus Cordifolius, ', 'Boosts immunity @ Reduces mental stress and anxiety @ Anti-ageing.', 'An all-natural remedy to help maintain healthy blood sugar levels, Giloy has the ability to enhance insulin production and control diabetes-related issues, such as ulcers and kidney problems. With regular use, Giloy helps to provide you with improved health and increased energy throughout the day. \nDesigned to increase vitality and activate the immune system of your body, its natural ingredients are carefully selected and formulated - Perfect for those looking for a way to improve their body\'s ability to fight off disease and remain healthy.\nA powerful herb that can help reduce mental stress and anxiety with the ability to calm down your body, Giloy has been known to enhance memory and cognitive functions, allowing for better learning and recall of important information. \nThis anti-ageing herb, Giloy, is rich in antioxidant content that helps to fight oxidative stress caused by free radicals, ultimately slowing down the ageing process of the skin. Make sure to incorporate this amazing herbal supplement into your daily regimen to keep your skin looking young and fresh.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(76, 'Ginseng Red', 'Panax Ginseng', 'Ginseng Red', NULL, 'Ginseng', 'Effective with erectile dysfunction @ Increase blood circulation @ Antioxidant.', 'Made from natural root harvested and carefully selected, Red Ginseng has long been associated with increased alertness, making it a perfect choice for those who want to be more awake and attentive. Additionally, Red Ginseng is effective with erectile dysfunction. \nParticularly effective at improving cardiovascular health due to its active ingredients, this powerful herbal remedy helps to increase blood circulation throughout the body and support healthy heart and artery function. \nEnjoy increased mental clarity, focus, and alertness with Ginseng Red - Rich in active compounds that have been carefully chosen to help maintain a healthy brain and optimise cognitive functions. With consistent use, you can experience the long-term benefits that come with this traditional herb.\nTreat yourself to the amazing benefits of Red Ginseng, Rich in antioxidants and minerals to nourish your skin. It helps to improve the texture and tone of your skin, reduce the signs of ageing, fight off environmental toxins, and increase elasticity. Give your skin the nourishment it needs today with our Red Ginseng skincare.\n', '/storage/photos/1/Final Pic/ginseng red.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(77, 'Ginseng White', 'Panax Ginseng', 'Ginseng White', NULL, 'Ginseng ', 'Boosts immune system @ Enhances mental clarity @ Improves blood circulation.', 'This ancient herbal remedy nourishes the muscles, strengthens the nervous system, and helps balance hormone secretion particularly relating to reproductive organs. Packed with nutrients such as Vitamin A, Calcium, Iron and other essential vitamins and minerals, White Ginseng\'s long history of use demonstrates its ability to improve health and well-being in many ways. \nThis herbal supplement has been traditionally used to support the immune system and fight off stress, as well as helping to protect against disease. With its antioxidant properties, White Ginseng is a natural way to boost your health and overall wellbeing. \nUseful in promoting mental clarity and concentration, balance blood sugar levels, and support sexual health in men, White Ginseng has a unique composition of active ingredients, including saponins and ginsenosides that make it an effective treatment option for those suffering from diabetes, male erectile dysfunction, and general brain fog or lack of focus.\nExperience healthier, more vibrant skin with White Ginseng. Its powerful formula helps to boost circulation in your skin\'s smallest blood vessels and ramp up collagen production for an overall improved appearance. \n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(78, 'Sweet Flag', 'Acorus Calamus', 'Sweet Flag', NULL, 'Ajmoda , Godvach , Vach , Vasambu  ', 'Eases gastric discomfort @ Relieves coughing @ Effective for skin.', 'A traditional herbal medicine used to treat gastritis, Godvach\'s root is made into an infusion, which can help with digestion by providing carminative properties and relief from nausea or spasms. It also has antispasmodic effects that may further ease gastrointestinal discomfort. A great option for those looking for natural relief from gastric upset.\nGodvach\'s antispasmodic properties make it a great choice for those looking to ease the coughing fits associated with this promotion. Godvach helps provide relief and soothe the throat, reducing discomfort and allowing for a restful night\'s sleep. Not only does it prevent severe coughing, but it can also help relieve other respiratory symptoms. Give your little one a gentle, yet effective way of combating their whooping cough with Godvach.\nGodvach\'s natural oil-based solution absorbs quickly, delivering intense hydration without leaving a greasy residue. It is infused with key ingredients that help keep your skin looking and feeling its best. With Godvach, you can achieve the perfect balance of softness, suppleness, and protection for all types of skin.\n', '/storage/photos/1/Final Pic/Godvach.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(79, 'Land Caltrops', 'Tribulus Terrestric', 'Land Caltrops', NULL, 'Gokhru, Pakhda', 'Treats urinary tract disorders @ Promotes mental well-being @ Reduces Inflammation.', 'A natural remedy for urinary tract disorders, Land Caltrops helps to promote healthy urinary tract function and promote bladder health. Tested and proven effective in reducing inflammation and restoring normal functioning of the urinary tract. \nSpecifically designed to help people with low libido and erectile-dysfunction - Experience the invigorating power of this time-honoured medicinal herb and take advantage of the revitalising effects of Land Caltrops extract for your health and wellness.\nLand Caltrops - a herbal supplement designed to help alleviate the effects of stress, depression and nervousness. By incorporating this all-natural remedy into your daily routine, you\'ll enjoy improved mental wellbeing and enhanced emotional balance. Plus, you can look forward to deeper, more restful sleep each night. Get ready to reclaim your peace of mind and say goodbye to stress with Land Caltrops.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14');
INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `plu`, `other_name`, `benefit`, `description`, `photo`, `minprice`, `promotion`, `status`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(80, 'Gond Katira', 'Astragalus Gummifer', 'Gond Katira', NULL, 'Gum Tragacanth', 'Improves digestion @ Helps in weight loss @ Improves skin complexion.', 'A powerful herbal remedy that has multiple benefits, Gond Katira helps in relieving symptoms of dysentery and cough, as well as providing a cooling effect on the body by lowering the temperature. This all-natural product is perfect for anyone looking for a natural remedy to ease their health ailments.\nRich in fibre, this natural remedy offers many health benefits for gut health and digestion, including laxative effects that help to prevent constipation. With its high fibre content, Gond Katira keeps you feeling full for a longer period of time, helping you manage your weight in a healthy way. In addition to keeping hunger at bay, this wonder food also promotes better gut health - another major contributor to healthy weight management.\nRenowned for its anti-aging and anti-inflammatory properties, Gond Katira has been used traditionally to reduce fine lines, delay wrinkles, and combat the signs of ageing. This special herb also helps to improve skin complexion, tone, and elasticity, allowing you to enjoy more youthful looking skin. Enjoy a healthier complexion that radiates with youthful vigour.\n', '/storage/photos/1/Final Pic/Gond katira.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(81, 'Gond Kikar', 'Acacia Nilotica', 'Gond Kikar', NULL, 'Samukh Arabi Sudani', 'Analgesic @ Provides relief against digestive disorders @ Promotes hair growth.', 'An all-natural herbal remedy that helps relieve mouth ulcers, throat pain, and gum bleeding, Gond Kikar also helps prevent diarrhoea and dysenteric problems. Made with potent herbal ingredients, Gond Kikar works to provide effective relief while maintaining the natural balance of your body. Plus, its pleasant taste makes it easy to take regularly as a mouth rinse or mixed into food or drink for daily use. \nGond Kikar\'s potent analgesic and anti-inflammatory properties help to reduce joint discomfort, swelling, and tenderness, providing an overall reduction in pain. \nThis powerful supplement has been found to help with constipation and Irritable bowel syndrome (IBS) as well as other digestive disorders by providing relief from symptoms like abdominal cramping, bloating, flatulence and diarrhoea. \nWith its all-natural ingredients, it helps in maintaining healthy and glowing skin while promoting healthier hair growth. It contains essential vitamins and minerals that work to nourish your body from the inside out, so you can look and feel your best!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(82, 'Gond Kondru', 'Boswellia Serrata Roxb.', 'Gond Kondru', NULL, 'Loban Ollibanum', 'Relieves joint issues @ Improves respiratory function @ Prevents wrinkles.', 'An effective remedy for reducing morning stiffness, relieving arthritic pain and reducing inflammation and discomfort, Gond Kondru is specially formulated to quickly and safely target these troublesome ailments with fast-acting relief. Perfect for anyone dealing with the aches and pains of joint issues, Gond Kondru is a safe and natural solution.\nThis natural herbal medicine helps soothe your throat and improves overall respiratory function to give you long-term relief from these symptoms. Enjoy a healthier and better quality of life with Gond Kondru.\nRenowned for its positive effects on female reproductive health, Gond Kondru effectively helps to balance the hormones in women’s bodies, reducing symptoms of menstrual pain and helping to maintain a healthy menstrual cycle. \nKeeping your skin looking young and healthy for years to come, This natural formula helps maintain the firmness of your skin and prevents wrinkles in old age. Gond Komdru\'s antioxidant-rich blend of herbs, oils, and extracts provide intense hydration, repair sun damage, reduce inflammation, and strengthen the protective barrier of your skin.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(83, 'East Indian Globe Thistle', 'Sphaeranthus Inducus', 'East Indian Globe Thistle', NULL, 'Gorakh Mundi, Gurmundi', 'Antibacterial and antimicrobial @ Relief against indigestion @ Antiseptic.', 'Containing antibacterial and antimicrobial properties that make it highly effective, East Indian Globe Thistle\'s ability to soothe irritated skin makes it an excellent addition to any home health regimen. Known for its powerful healing properties, and its ability to reduce redness and inflammation - This incredible plant helps bring fast relief from itching, burning, and other skin issues.\nA powerful tonic, East Indian Globe Thistle is an effective remedy for indigestion, asthma, leucoderma, and dysentery. The active compounds found in this tonic provide potent therapeutic benefits, making it an excellent choice for natural healing and wellbeing.\nUsed as a detoxifying agent to help support optimal health, This medicinal herb is known for its antibacterial and antiseptic properties that helps cleanse the bloodstream and fight off harmful toxins and naturally purify the blood.\nReducing the appearance of acne and eczema, The active components in East Indian Globe Thistle help lock in moisture that protects against environmental aggressors. In addition, the plant’s antioxidants boost skin regeneration, leaving you with a soft and smooth complexion.\n', '/storage/photos/1/Final Pic/East India Globe Thistle.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(84, 'Guggal Indian', 'Commiphora Mukul', 'Guggal Indian', NULL, 'Mukul Bukhoor, Salai Tree', 'Promotes weight loss @ Boosts immune system @ Antioxidant.', 'An ayurvedic herb, Guggal Indian is beneficial to support weight loss, help treat hypothyroidism, and improve cholesterol and blood sugar levels. Incorporating Guggal Indian into your daily health regimen, you will find a range of therapeutic benefits including increased metabolism and improved digestion.\nContaining high concentrations of antioxidants and essential fatty acids, Guggal Indian is a natural remedy praised for its anti-inflammatory properties. It has been used to help treat certain inflammatory promotions such as acne, eczema, psoriasis and arthritis.\nA powerful immune system booster, Guggal Indian also reduces symptoms associated with chronic illness. Give your body the relief it deserves with this safe and effective anti-inflammatory solution.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(85, 'Guggal Yemen', 'Commiphora Mukul', 'Guggal Yemen', NULL, 'Mukul Akal, Salai Tree', NULL, 'Experience the anti-ageing benefits with our all-natural Chamomile Stick! Made from organic and natural ingredients, this stick is specifically formulated to help diminish wrinkles, dark circles, and other signs of ageing. This revolutionary product is rich in antioxidants and will provide your skin with an instant burst of moisture. \nThis all-natural skin soother helps to relieve skin irritation and inflammation with its powerful blend of antioxidants and flavonoids. Whether you suffer from dryness, redness, or just want to give your skin a boost of hydration and calming benefits, this is the perfect solution for your needs. \nChamomile Stick is the perfect choice to soothe and moisturise dry, chapped skin. With fantastic nourishing properties, this stick helps repair skin damaged by cold weather or excessive work. Apply a small amount of the stick directly to your skin to experience long-lasting moisture and rejuvenation. \nUsed for centuries as an all-natural remedy for common ailments like colds, flu, headaches, stress, and insomnia, Chamomile Stick\'s calming aroma and soothing effects on the body, it is the perfect addition to any daily wellness routine.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(86, 'Gul Anar', 'Punica Granatum', 'Gul Anar', NULL, ' Gul e Rumaan, Flower of Pomegranate ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(87, 'Chamomile Stick', 'Matricaria Chamomilla', 'Chamomile Stick', NULL, 'Gul E Babuna', 'Anti-ageing @ Heals dry skin @ Soothing effects.', 'Experience the anti-ageing benefits with our all-natural Chamomile Stick! Made from organic and natural ingredients, this stick is specifically formulated to help diminish wrinkles, dark circles, and other signs of ageing. This revolutionary product is rich in antioxidants and will provide your skin with an instant burst of moisture. \nThis all-natural skin soother helps to relieve skin irritation and inflammation with its powerful blend of antioxidants and flavonoids. Whether you suffer from dryness, redness, or just want to give your skin a boost of hydration and calming benefits, this is the perfect solution for your needs. \nChamomile Stick is the perfect choice to soothe and moisturise dry, chapped skin. With fantastic nourishing properties, this stick helps repair skin damaged by cold weather or excessive work. Apply a small amount of the stick directly to your skin to experience long-lasting moisture and rejuvenation. \nUsed for centuries as an all-natural remedy for common ailments like colds, flu, headaches, stress, and insomnia, Chamomile Stick\'s calming aroma and soothing effects on the body, it is the perfect addition to any daily wellness routine.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(88, 'Fir Flame Bush', 'Woodfordia', 'Fir Flame Bush', NULL, 'Gul e Dhava', 'Antibacterial @ Antiulcer properties @ Astringent.', 'This herbaceous plant is believed to be a potent healer of skin diseases, especially leprosy, thirst dysentery, erysipelas and other blood disorders. Extracts from the leaves and stems are thought to possess antiseptic and antibacterial properties, helping to reduce inflammation and improve wound healing. Fire Flame Bush has been used traditionally to aid digestion, purify the blood and detoxify the body. \nThe Fire Flame Bush\'s powerful antiulcer properties make it a topical treatment on the affected area, users can take advantage of its potent properties to help relieve symptoms such as burning and pain associated with ulcers. This natural remedy can help bring about long-term relief and may even work better than traditional pharmaceutical treatments in some cases. \n This incredibly potent astringent helps to improve skin texture, leaving you with a smoother, more radiant complexion. This shrub can be used as a spot treatment or all over your face to help improve your skin\'s overall tone and clarity. With regular use, your skin will be noticeably clearer and healthier.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(89, 'Borage Flower', 'Borago Officinalis', 'Borage Flower', NULL, 'Gul Gajban', 'Purifies blood @ Hydrates skin @ Eases coughing.', 'A natural herbal supplement, Borage Flower  is believed to help reduce fever, ease coughing, and relieve symptoms of depression. Borage is easy to take, giving  your health an herbal boost with the naturally calming and soothing effects of borage flower and leaves.\nNot only can it be used for blood purification, Borage Flower also helps increase urine flow, prevent inflammation of the lungs, and act as a natural sedative. Even said to promote sweating to help your body naturally detoxify, These helpful properties can be a great addition to your daily wellness routine.\nAn excellent natural remedy for those seeking to improve the health of their hair and skin, Borage Flower Seeds can be used to create borage oil, a soothing and hydrating topical treatment. This oil is renowned for its moisturising and anti-inflammatory properties, helping to reduce redness, irritation, and dryness while providing essential nutrients that strengthen the hair follicles and protect the skin from environmental stressors. Give your hair and skin some love with Borage Flower.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(90, 'Bastard Tree', 'Butea Monosperma', 'Bastard Tree', NULL, 'Gul Tesu, Gul Kesu, Kesu Flower', 'Analgesic @ Reduces swelling in stomach @ Helps against night blindness.', 'A natural herbal supplement, Borage Flower  is believed to help reduce fever, ease coughing, and relieve symptoms of depression. Borage is easy to take, giving  your health an herbal boost with the naturally calming and soothing effects of borage flower and leaves.\nNot only can it be used for blood purification, Borage Flower also helps increase urine flow, prevent inflammation of the lungs, and act as a natural sedative. Even said to promote sweating to help your body naturally detoxify, These helpful properties can be a great addition to your daily wellness routine.\nAn excellent natural remedy for those seeking to improve the health of their hair and skin, Borage Flower Seeds can be used to create borage oil, a soothing and hydrating topical treatment. This oil is renowned for its moisturising and anti-inflammatory properties, helping to reduce redness, irritation, and dryness while providing essential nutrients that strengthen the hair follicles and protect the skin from environmental stressors. Give your hair and skin some love with Borage Flower.\n', '/storage/photos/1/Final Pic/Gul Kesu.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(91, 'Gymnema', 'Gymnema Sylvestre', 'Gymnema', NULL, 'Gurmar Butti, Naked Thread', 'Digestive stimulant @ Promotes weight loss @ Improves complexion of skin.', 'A potent herb native to India, Gymnema is  effective in supporting healthy blood sugar levels, helping manage symptoms associated with diabetes and metabolic syndrome, promoting weight loss, and reducing chronic cough. \nA powerful natural remedy used to treat malaria and snake bites, Gymnema can also be used as a digestive stimulant to improve digestion, as a laxative to promote bowel movements, as an appetite suppressant to reduce cravings, and as a diuretic to increase urination. A versatile addition to any home remedy kit.\nAn ancient herb used to support weight loss, It works by helping reduce sugar cravings and appetite while increasing fat burning.This amazing herb can aid in reducing food cravings, boosting energy levels and aiding digestion. \nThe perfect way to keep your skin looking and feeling young, This advanced, natural revitalizer works quickly to improve your complexion and make you look your best. Plus, Gymnema\'s potent antioxidant blend helps fight the signs of ageing and prevents wrinkles from forming. Enjoy vibrant, youthful-looking skin with Gymnema.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(92, 'Habulas', 'Mytrus Communis Linn.', 'Habulas', NULL, 'Habulas', 'Nutritional powerhouse @ Powerful antioxidant @ Reduces redness and acne.', 'Perfect addition to your diet, providing an abundance of essential vitamins and minerals to support your overall health and wellbeing. Rich in Vitamin C, Manganese and Vitamin A, Habulas is a nutrient powerhouse that can help promote better immune system functioning and reduce inflammation. With its impressive nutritional profile, Habulas makes it simple to incorporate more wholesome nutrition into your diet.\nA superfood packed with powerful antioxidants that can help protect your body from the effects of free radicals and oxidative stress. With its unique blend of ingredients, Habulas provides natural protection against damage caused by pollutants, ultraviolet radiation, and other sources of inflammation. Give your body the ultimate antioxidant boost today with Habulas!\nA gentle, yet powerful skin-clearing product that helps get rid of acne and other unwanted imperfections. This advanced product contains natural ingredients that effectively reduce redness and excess oil on the skin, leaving you with clearer, brighter looking skin. Plus, it works fast and doesn\'t leave any residue behind. Get back your confidence today with Habulas.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(93, 'Hartaki (Kabuli Jumbo)', 'Terminalia Chebula ', 'Hartaki (Kabuli Jumbo)', NULL, 'Harad Kabuli Jumbo, Halila Kabuli Kabir Jumbo', 'Promotes heart health @ Helps in constipation @ Anti-inflammatory.', 'A great choice for those looking to protect their heart, Haritaki (Kabuli Jumbo) contains cardioprotective properties, providing protection against potential harm that could be caused to the heart. Enjoy all of the benefits that this nutritious and delicious pericarp has to offer while feeling secure in knowing your heart is being taken care of.\nA natural laxative that helps to manage constipation, Haritaki (Kabuli Jumbo) is  effective in completely evacuating the bowel, while also providing lasting effects by prolonging gastric emptying time. Traditionally used for digestive issues, It\'s sure to provide your body with the relief you\'re looking for. Add this herbal remedy to your health regimen today and enjoy its many benefits.\nA raisin with unique characteristics that provide anti-inflammatory benefits, Its chewy texture and subtle sweetness contains high levels of magnesium, potassium, iron, phosphorus and vitamin B-6 which can help reduce inflammation in the body. Haritaki helps lower levels of bad cholesterol and improves heart health. Enjoy its delicious flavour and benefit from its many anti-inflammatory properties today.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(94, 'Hartaki (Kabuli Large)', 'Terminalia Chebula', 'Hartaki (Kabuli Large)', NULL, 'Harad Kabuli Large, Halila Kabuli Kabir, ', 'Antibacterial and Antifungal properties @ Treats stomach disorders @ Anti-inflammatory.', 'A great source of heart protection and helps in keeping the liver healthy, Haritaki (Kabuli Large) has antibacterial, antifungal, and antiviral properties that can be used to fight against various infections. One of the best natural products available in the market today, providing both protection and prevention against many health issues.\nNot only do they provide a tasty and wholesome source of nutrition, but their special ingredients have also been found to benefit certain health promotions like cancer, diabetes, inflammation, and stomach disorders. Eating Haritaki (Kabuli Large) can be a great way to keep your body healthy whilst enjoying deliciousness.\nAn incredible all-natural toner that not only works to protect your skin from oxidative damage, but also detoxifies and treats a wide range of skin infections. Haritaki (Kabuli Large) has powerful anti-inflammatory properties that target free radicals and help reduce acne, pimples, rashes, and boils. The cleansing properties flush out toxins from the inner layers of the skin while promoting overall skin health and vitality. Experience maximum skincare benefits with Haritaki.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(95, 'Hartaki (Kabuli Small)', 'Terminalia Chebula', 'Hartaki (Kabuli Small)', NULL, 'Harad Kabuli Small, Halila Kabuli Sageer', 'Supports intestinal health @ Lowers cholesterol levels @ Anti-inflammatory.', 'A unique blend of natural ingredients specifically formulated to support intestinal health. This effective supplement helps maintain an ideal balance in the intestines, while providing a mild and gentle action. With its perfect combination of herbal extracts, Haritaki helps maintain regularity and ease digestive issues without harsh or intense side effects. \nThis superfood has been proven to help lower levels of bad cholesterol, thus improving heart health. The healthy ingredients used in Haritaki (Kabuli Small) provide an excellent source of dietary fibre and can help support weight management goals. Enjoy Haritaki (Kabuli Small) as part of a balanced diet to reap the health benefits it offers.\nContaining powerful anti-inflammatory properties that target free radicals to reduce acne, pimples, rashes and boils - Haritaki (Kabuli Small) cleansing action flushes toxins from the skin\'s inner layers, promoting overall skin health and vitality. Experience the maximum skin care effect with Haritaki.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(96, 'Hartaki Black', 'Terminalia Chebula', 'Hartaki Black', NULL, 'Harad Kali,  Halila Aswat, Harad Black', 'Cardioprotective @ Treats constipation @ Helps in weight management. ', 'Perfect for those who want to protect their hearts, Haritaki Black contains cardioprotective properties to protect against potential damage to the heart. Make sure your heart is protected while you enjoy all the benefits this nutritious and delicious peel has to offer.\nAn all-natural laxative that helps treat constipation, Haritaki Black is effective in completely emptying the intestines while providing lasting benefits by increasing gastric emptying time. Add this herbal remedy to your health regimen today and enjoy its many benefits. \nA raisin with unique properties that provide anti-inflammatory benefits. The crunchy texture and subtle sweetness are packed with high levels of magnesium, potassium, iron, phosphorus and vitamin B-6, which help reduce inflammation in the body. \nA great source of fibre that can help support your weight management goals - Enjoy Haritaki Black as part of a balanced diet to reap the health benefits it provides.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(97, 'Hartaki Yellow', 'Terminalia Chebula', 'Hartaki Yellow', NULL, 'Harad Pilli, Halila Asfar, Harad Yellow', 'Antiviral and Antifungal properties @ Anti-inflammatory @ Promotes skin health.', 'Protecting your heart and keeping your liver healthy, Haritaki Yellow has antibacterial, antifungal, and antiviral properties and can be used to fight various infections. One of the best natural products available on the market today, offering both protection and prevention against many health problems.\nNot only do they provide a delicious and healthy food source, their special ingredients have also been found to benefit certain health promotions such as cancer, diabetes, inflammation, and stomach ailments. By eating Haritaki Yellow, you can ensure a healthy, fit and relaxed body state.\nAn incredible natural toner that not only protects your skin from oxidative damage, but also detoxifies and treats a variety of skin infections - Haritaki Yellow has powerful anti-inflammatory properties that target free radicals to reduce acne, pimples, rashes and boils. Its cleansing action flushes toxins from the skin\'s inner layers, promoting overall skin health and vitality. Experience the maximum skin care effect with Haritaki.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(98, 'Hartaki Peeled', 'Terminalia Chebula', 'Hartaki Peeled', NULL, 'Harad Pilli Chilka,  Khashar Halila Asfar, Harad Peeled', 'Aids in weight loss @ Promotes better vision @ Promotes hair growth.', 'An amazing all-natural remedy that can help treat a wide range of health issues, Haritaki Peeled has been used for centuries to reduce indigestion, improve digestion, ease gastritis, and help with lung diseases. It has also been found to aid in weight loss, provide relief from impotence and other reproductive issues, relieve coughing and colds, clear up asthma, promote better vision, fight urinary tract infections, and help keep your skin healthy. There\'s no doubt why this incredible natural product is so popular—its amazing healing powers have helped countless individuals over the years!\nA revolutionary hair product designed to help you get the head of hair you desire -  Haritaki Peeled prevents the drying up of hair follicles and promotes new hair growth in areas of the scalp that have suffered from hair loss. In addition to supporting existing hairs, Haritaki Peeled can also help increase your natural hair density so that you look and feel like a million bucks! Experience a thicker, healthier looking head of hair with Haritaki Peeled today.\n', '/storage/photos/1/Final Pic/Hartaki Peeled.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(99, 'Jalap roots', 'Ipomoea Purga', 'Jalap roots', NULL, 'Harad Zulafa, Halila Zulafa, ', 'Effective Purgative @ Promotes liver health @ Controls stretched skin.', 'An effective purgative, Jalap Roots provides rapid and complete emptying of the bowels. Unlike some laxatives, it doesn\'t produce unpleasant side effects such as bloating or cramps, making it a safe and natural way to treat your digestive issues.\nEspecially when it comes to improving liver health, Jalap Roots is an effective supplement that works by flushing out the toxins in the liver and ensuring that it remains healthy. Regular use of this supplement can help reduce liver problems such as jaundice, hepatic impairment, and more. With its detoxifying properties, jalap root can give your body the boost it needs to function at its optimal level.\nAn incredibly beneficial herb, Jalap Roots works by reducing excess water from the body. It helps to control symptoms such as swelling of tissues and stretched skin. Jalap Roots also works to naturally improve overall health and well-being. Not only is this herbal supplement a great choice for those looking for natural relief, but it is also very affordable.\n', '/storage/photos/1/Final Pic/zalap root.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(100, 'Syrian Rue', 'Peganum harmala', 'Syrian Rue', NULL, 'Harmal, Isfhaan, ', 'Reliefs depression and anxiety @ Analgesic @ Purifies blood.', 'Syrian Rue\'s extract has the ability to calm the mind and body by releasing relaxing chemicals into the bloodstream, reducing stress and tension. This natural remedy provides significant relief from common psychological symptoms associated with both depression and anxiety. A gentle treatment which is easy to find, safe to use, and an alternative solution for anyone who wishes to reduce their symptoms naturally.\nContaining alkaloids, flavonoids and saponins that are thought to have anti-inflammatory and analgesic properties @ Syrian Rue helps reduce pain in muscles, joints, nerves and other areas of the body. When consumed as a tea or powder, it has been found to be beneficial for promotions like arthritis and sciatica. This natural remedy is a great alternative to chemical-based medications while exhibiting minimal side effects.\nA powerful and beneficial herb that can help to purify the blood and eliminate toxins from the body, Syrian Rue helps to improve overall health, boost immunity, and support liver function. Known for its antioxidant properties, making it an excellent choice for supporting general wellbeing. Enjoy the benefits of Syrian Rue today.\n', '/storage/photos/1/Final Pic/Harmal.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(101, 'Orpiment', 'Orpiment', 'Orpiment', NULL, 'Hartal,  Zarnick, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(102, 'Whiteoxide of Arsenic', 'Arsenic Sulphate', 'Whiteoxide of Arsenic', NULL, 'Hartal Godanti', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(103, 'Juniper', 'Juniperus Communis Linn.', 'Juniper', NULL, 'Hauber', 'Packed with nutrients @ Powerful Antiseptic @ Soothes irritated skin.', 'A herbal supplement renowned to have diuretic, anti-arthritic, and anti-diabetic properties, Juniper can help to reduce inflammation, alleviate digestive issues and provide relief from autoimmune disorders. Juniper can be used as a preventative health measure or to ease symptoms associated with specific ailments.\nAn incredibly nutritious fruit packed with essential vitamins and minerals, Juniper\'s high nutrient content helps to provide energy, boost immunity and promote healthy digestion.\nA powerful natural antiseptic with anti-inflammatory properties that help to reduce the discomfort associated with many skin promotions - Juniper works to quickly restore balance to troubled skin, helping it heal faster and look healthier. \nThis powerful plant extract helps clear away dirt, oil, and debris while soothing and calming inflamed or irritated skin. With regular use, Juniper can help prevent breakouts, maintain your complexion’s natural vibrancy, and reduce redness. Give your skin the best care it deserves by incorporating Juniper into your daily skincare routine.\n', '/storage/photos/1/Final Pic/Hauber.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(104, 'Asafoetida Indian', 'Ferula Assafoetida', 'Asafoetida Indian', NULL, 'Hing Brown,  Halteet Bunee, ', 'Regulates bowel movement @ Treats indigestion @ Anti-ageing and Anti-acne.', 'Commonly used to treat indigestion, respiratory issues, nervous problems, hypertension, and menstrual cramps, The natural ingredients in Asafoetida Indian work together to help soothe symptoms and bring balance to your system. \nAn excellent dietary supplement that helps to maintain a healthy digestive system, Asafoetida Indian is packed with a great amount of dietary fibre, which not only aids in digestion but also helps regulate your regular bowel movements. This natural remedy is extremely beneficial for promoting gastrointestinal health and can help reduce the symptoms of gas and bloating.\nExperience the powerful benefits of Asafoetida Indian for your skin! This ancient spice is naturally rich in essential oils and contains multiple medicinal properties, such as anti-ageing, anti-acne, anti-dryness and skin whitening. All of these incredible benefits are packaged into one convenient product to keep your skin healthy and looking beautiful.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(105, 'Asafoetida Iranian', 'Ferula Assafoetida', 'Asafoetida Iranian', NULL, 'Hing White,  Halteet Abhiyat, ', 'Antispasmodic @ Improves cardiovascular health @ Anti-ageing.', 'Containing anti-inflammatory and antispasmodic properties, Asafoetida Iranian helps to alleviate promotions like asthma, bronchitis, whooping cough, ulcer, stomachache, epilepsy, flatulence, weak digestion and influenza. With its proven track record in improving digestion and reducing pain and discomfort, Asafoetida Iranian is an effective remedy for anyone dealing with digestive disorders.\nHaving a variety of components, including saponins, antioxidants, minerals and vitamins - Asafoetida Iranian is an effective means to improve cardiovascular health and maintain healthy blood levels. By using this product on a regular basis, it can help to keep cholesterol and other lipid levels in balance. \nExperience the anti-ageing power of Asafoetida Iranian! This unique herbal spice helps reduce wrinkles, fine lines, and age spots for a youthful, refreshed complexion. With regular use, you can start to see amazing results in no time at all. Restore your skin\'s natural glow and enjoy younger-looking skin today with Asafoetida Iranian.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(106, 'Asafoetida Powder', 'Ferula Assafoetida', 'Asafoetida Powder', NULL, 'Hing Powder,  Halteet Mathoon, ', 'Treats menstrual clamps @ Regulates bowel movement @ Anti-ageing.', 'Most commonly used to treat indigestion, respiratory problems, nervous system problems, high blood pressure, and menstrual cramps. The natural ingredients blended in Asafoetida Powder work together to relieve symptoms and restore balance to the body.\nPacked with high amounts of fibre, Asafoetida Powder is a great dietary supplement to help maintain a healthy digestive system. It not only aids in digestion but also regulates regular bowel movements. Very beneficial in promoting gastrointestinal health, this natural remedy is great for reducing symptoms of gas and bloating. \nExperience the anti-ageing power of Asafoetida Powder! This unique herbal powder reduces wrinkles, fine lines and age spots for a youthful, refreshed complexion. With regular use you will see amazing results in no time. Restore your skin\'s natural radiance and enjoy youthful skin with Asafoetida Powder.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(107, 'Gum Myrrh', 'Commiphora Myrrha', 'Gum Myrrh', NULL, 'Hirabol,  Murr, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(108, 'Green Vitrol', 'Ferri Sulphas', 'Green Vitrol', NULL, 'Hirakasis', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(109, 'Tamarindus Indicus', 'Tamarindus Indicus', 'Tamarindus Indicus', NULL, 'Garbeej, Imli Beej, ', 'Anti-inflammatory @ Strengthen immune system @ Antioxidant.', 'A powerful herb, Tamarindus Indicus is packed with medicinal benefits and can be used to treat wound healing, abdominal pain, diarrhoea, dysentery, parasitic infestation, fever, malaria and respiratory problems. Contains anti-inflammatory properties which helps to reduce inflammation and provide relief from soreness and discomfort. \nStrengthens the immune system by providing it with vital vitamins and minerals for better protection against infection - This ancient herbal remedy provides many other benefits as well including improving digestion, detoxifying the body, promoting healthy blood circulation and treating skin disorders. With its numerous medicinal uses and great nutritional content, Tamarindus Indicus is an essential addition to any health routine.\nPerfect way to achieve healthy, beautiful skin, Tamarindus Indicus has natural healing properties that make it ideal for treating burns and reducing edema. Plus, its antioxidant content helps keep your skin glowing and hydrated. With regular use of Tamarindus Indicus, you\'ll be left with smooth, radiant skin.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(110, 'Inderjo Kadwa', 'Wrughtia Tinctoria', 'Inderjo Kadwa', NULL, 'Inderjow Kadwa, Lisaan Tair Murr, ', 'Maintains glucose levels @ Relieves digestive issues @ Promotes skin health.', 'An all-natural herbal remedy that helps lower your sugar levels and support healthy glucose balance. Made from natural ingredients, including a combination of medicinal herbs and spices, Inderjo Kadwa are known to reduce blood sugar, stimulate the pancreas, reduce oxidative stress and strengthen immunity. Taking Inderjo Kadwa regularly helps maintain a healthy level of glucose in your blood and promotes overall well-being. \nProviding relief from stomach ache and also purifying the blood, Inderjo Kadwa works quickly and efficiently, with many users reporting almost immediate results. For those suffering from digestive issues or feeling fatigued, Inderjo Kadwa can help to restore balance and bring back vitality. \nPromoting overall skin health by nourishing your skin from within, This all-natural supplement provides essential vitamins and minerals to keep your skin looking its best. With Inderjo Kadwa, you can enjoy vibrant and healthy-looking skin all year round.\n', '/storage/photos/1/Final Pic/Inderjow Kadwa.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(111, 'Inderjo Meetha', 'Wrughtia Tinctoria', 'Inderjo Meetha', NULL, 'Inderjow Meetha, Lisaan Tair Hailu', 'Improves digestive health @ Reliefs flu-related symptoms @ Reduces hair fall.', 'Alleviating digestive issues like diarrhoea and colic pain, This herbal remedy provides the body with beneficial nutrients to help improve overall digestive health. In addition to this, Inderjo Meetha also helps support healthy digestion and can be used regularly to maintain digestive balance. With regular use of Inderjo Meetha, you can be sure that your digestive system will be functioning optimally.\nA medicinal product designed to provide relief from promotions associated with the flu, such as colds accompanied by runny noses, frequent sneezing, and fevers. With its special combination of natural herbs and extracts, Inderjo Meetha provides fast-acting relief from these flu-related ailments. Enjoy the restorative power of Inderjo Meetha for relief when you need it most.\nDeveloped to ensure that your skin remains nourished and hydrated, making it softer and brighter over time. Inderjo Meetha is specifically formulated to provide essential nutrients for healthy hair growth and reduce hair fall, leaving you with thicker and luscious locks. \n', '/storage/photos/1/Final Pic/Inderjow meetha.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(112, 'Red Fenugreek', 'Trigonella Foenumgraecum', 'Red Fenugreek', NULL, 'Methi Lal, Halba Ahmer', 'Reduce cholesterol levels @ Protects against acne @ Antioxidant.', 'An ancient herb highly beneficial in lowering blood sugar levels, boosting testosterone, and increasing milk production in breastfeeding mothers - Red Fenugreek can also help regulate appetite and digestion. With a unique spicy aroma, this amazing herb is easy to add to your daily diet and lifestyle for a myriad of benefits. \nAn incredibly versatile herb, Red Fenugreek\'s rich content of nutrients helps to reduce cholesterol levels, lower inflammation, and provide powerful antioxidant benefits. Adding a slightly nutty flavour to any dish, Red Fenugreek is a natural choice for anyone looking to maintain optimal health.\nAn effective solution to help protect the skin against acne and reduce the signs of ageing, Red Fenugreek helps destroy free radicals in the body that are responsible for dark spots, wrinkles, and infections. By regularly using Red Fenugreek you can maintain youthful looking skin while also protecting it from further damage.\n', '/storage/photos/1/Final Pic/Red Fenugreek (1).jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(113, 'Plantago Husk', 'Plantago Ovata', 'Plantago Husk', NULL, 'Isabgul Bhusi,  Khashar Katuna, ', 'Aids in weight loss @ Promotes healthy digestion @ Cleanses skin.', 'An ideal solution for people who are looking to support a healthy digestive system, Plantago Husk is packed with fibre, which can make bowel movements much easier and promote regularity without increasing flatulence. This natural ingredient can help reduce discomfort from constipation and helps keep your body feeling clean and energised. \nAn all-natural weight loss supplement, This powerful superfood helps boost metabolism and energy levels, making it easier for your body to burn fat faster. With Plantago Husk, you can help detoxify the body and flush out toxins that can interfere with weight loss efforts. Additionally, it contains essential dietary fibres that can help promote healthy digestion, while also suppressing hunger pangs and cravings. Get started on a natural journey towards weight loss today with Plantago Husk.\nThe perfect solution for all your skin cleansing and exfoliating needs, Plantago Husk\'s natural fibre content gently yet effectively buffs away dirt and impurities, leaving your skin feeling fresh, smooth and renewed. Perfect for removing stubborn make-up, it\'s an ideal addition to any skincare routine.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(114, 'Plantago Seeds', 'Plantago Ispaghula', 'Plantago Seeds', NULL, 'Isabgul Dana,  Bijr Katuna, ', 'Packed with dietary fibres @ Aids weight loss @ Exfoliator.', 'An ideal solution for those looking to support a healthy digestive system, Plantago Seeds are packed with fibre that makes bowel movements much easier and promotes regularity without increasing bloating.This natural ingredient helps reduce the discomfort caused by constipation and keep the body clean and energised.\nThis powerful superfood is an all-natural weight loss supplement that boosts your metabolism and energy levels, helping your body burn fat faster. Plus, it contains essential fibre that helps promote healthy digestion while curbing hunger and cravings. Start your natural weight loss journey today with Plantago Seeds.\nThe perfect solution for all your skin cleansing and exfoliating needs. Plantago Seed\'s natural fibre content gently and effectively removes dirt and impurities, leaving skin fresh, smooth and regenerated. Perfect for removing stubborn makeup and a great addition to any skincare routine.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(115, 'Delphinium', 'Delphinium Denudatum', 'Delphinium', NULL, 'Jadwaar Khatai', 'Treats insomnia Improves circulation @ Boosts cognitive performance.', 'A medicinal herb used to treat a variety of ailments, including fluid retention, poor appetite, and insomnia - Delphinium is known for its calming properties and can be used as a sedative to induce relaxation. Its natural components work together to relieve the symptoms of various illnesses, allowing for improved overall health.\nLong been valued for its incredible cardioprotective activity, Delphinium helps to improve circulation and support overall heart health by stimulating the flow of blood around the body. \nAn all-natural brain tonic that helps to boost your mental performance. It is designed to increase your focus, attention span and memory retention, allowing you to remain sharp and alert even during times of intense stress. \nAn all-natural skincare product, the special blend of natural herbs helps to deeply hydrate the skin while reducing redness, irritation, and signs of ageing. Delphinium works to protect and enhance the skin\'s barrier to keep it looking younger for longer. With regular use of Delphinium, you\'ll have softer, more luminous skin in no time.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(116, 'Jambola Seeds', 'Syzgium Cumini', 'Jambola Seeds', NULL, 'Jamun Gutli, Black Plum Seeds, ', 'Antioxidant @Supports detoxification @ Improves oral health.', 'A natural plant-based supplement that reduces sugar cravings and improves glycemic control, Antioxidants present in jambolan seeds can improve insulin sensitivity and help maintain healthy glucose levels. These antioxidant-rich seeds also help to combat inflammation, making them an ideal supplement for those who struggle with high blood sugar levels. Take Jambola Seeds daily to benefit from their powerful, naturally occurring compounds and see your blood sugar levels go down!\nRich in vitamin C, antioxidants, and polyphenols, this powerful little seed can help rid the body of excess waste and support detoxification processes in the body, helping to keep you feeling your best.  \nTake your oral health to the next level with Jambola Seed! Known for its various benefits, it can help fight bad breath, gum disease, tooth decay, and other common dental issues. \nPerfect for any skin type, Jambola Seed\'s natural healing powers can reduce the appearance of acne and blemishes, providing you with healthy, beautiful skin. A gentle yet effective way to keep your skin looking clear and vibrant.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(117, 'Round Leaved Birthwort', 'Aristolochia Rotunda', 'Round Leaved Birthwort', NULL, 'Jarawand Mudhraj, Smearwort ', 'Healing properties  @Improves skin health @ Anti-inflammatory.', 'A unique herbal remedy known for its powerful healing properties, Round Leaved Birthwort acts as a resolvent to dissolve hard and abnormal formations in the body, a deobstruent to open up any blockages, an expectorant to help clear out respiratory secretions, an emollient to soothe skin and provide moisture, an emmenagogue to encourage menstruation, an aphrodisiac to stimulate libido, and an analgesic to relieve pain. This versatile plant provides relief from numerous health promotions, making it an essential addition to any natural medicine cabinet.\nThis powerful herb helps to soothe swollen and inflamed tissue, helping the body to heal faster and with less discomfort. When taken regularly, Round Leaved Birthwort can help to provide relief from inflammatory promotions and pain.\nAn incredible herb to improve skin health, Round Leaved Birthwort is used for various skin problems and offers many wonderful benefits, including soothing inflammation and moisturising the skin. It can be consumed or applied directly to the skin for you to take advantage of its beneficial properties. \n', '/storage/photos/1/Final Pic/jarawand mudhraj.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(118, 'Impure Potash Carbonate', 'Potassium Carbonate', 'Impure Potash Carbonate', NULL, 'Jawakhar Papdi,', NULL, NULL, '/storage/photos/1/Final Pic/jawakhar papdi.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(119, 'Cubebs', 'Piper Cubeba Linn.', 'Cubebs', NULL, 'Kabab Chini, Kababa, ', 'Diuretic @Reduces swelling @ Aids in digestion @Prevents dandruff.', 'A natural diuretic that helps increase urination to help relieve water retention, Cubeb also has anti-parasitic properties and has been traditionally used to treat amoebic dysentery, a parasitic infection in the intestines. \nThis traditional herb helps improve digestion, cleanse the body of toxins, and flush out excess water weight for better health. \nAn effective way to clear up congested nasal and chest passages, Cubeb helps to reduce mucus buildup and swelling, which can cause discomfort. With regular use, Cubeb can help promote healthy breathing and improve overall wellness.\nBy taking Cubeb, you can reduce digestive issues and improve your digestive health overall. Whether you\'re looking for a more natural way to aid your digestion or just need some extra help to maintain a balanced diet, Cubeb is the perfect choice.\nA natural and effective solution to treating and preventing dandruff, Cubeb contains powerful anti-bacterial and antifungal properties. Don\'t suffer from dry, itchy, and flaky scalp any longer – try Cubeb today!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(120, 'Kadwa Badam', 'Prunus dulcis', 'Kadwa Badam', NULL, 'Kadwe Badam, Loz murr, Mahogany Seeds, Bitter almond, Badham, Sugar Badam, Sky Fruit Seeds', 'Antidiabetic @Promotes blood flow @ Nourishes dry skin.', 'A nut that is especially beneficial for people with diabetes, Kadwa Badam is rich in nutrients, including magnesium and healthy fats, which help to support healthy blood sugar levels. It also contains several important minerals and vitamins, such as copper, zinc, iron, selenium and manganese. \nA great way to improve your overall circulation, Kadwa Badam can help promote better blood flow in the body, helping you to feel more energised throughout the day. By incorporating Kadwa Badam into your diet on a regular basis, you\'ll be able to experience increased alertness and improved vitality. \nA luxurious skincare solution, This unique nut helps nourish and moisturise dry skin, while improving the appearance of acne-prone skin. Rich in vitamin E, omega-3 fatty acids, and essential oils, Kadwa Badam helps protect the skin from external factors that cause irritation and redness. Its non-comedogenic formula ensures deep hydration for long-lasting comfort and relief. \n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14');
INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `plu`, `other_name`, `benefit`, `description`, `photo`, `minprice`, `promotion`, `status`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(121, 'Maryam Flower', 'Anstatica Hierochuntica', 'Maryam Flower', NULL, 'Kaff Mariam, Maryiam Booti, ', 'Diuretic @Relief against menstrual pain @ Reduces inflammation.', 'A natural remedy for relieving the uncomfortable symptoms associated with menstruation, menopause and rheumatism, Maryam Flower helps to reduce cramps and pain, as well as alleviate fatigue and irritability caused by these promotions. An all-natural alternative to traditional treatments, providing long-term relief from menstrual and menopausal discomfort. \nMaryam Flower is diuretic @ meaning it increases the rate of urination, which helps rid the body of excess fluids and toxins. Also found to be effective in helping to control blood sugar levels and treat diabetes, Maryam Flower can help lower cholesterol and reduce inflammation in the body. Its natural ingredients make it safe to use and provide relief from many ailments.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(122, 'Wild Lettuce Seeds', 'Lactuca Sativa', 'Wild Lettuce Seeds', NULL, 'Kahu Beej, wild lettuce seeds, Bijr Khus', 'Analgesic  @Anti-inflammatory @ Improves sleep quality.', 'A natural, effective remedy, Wild Lettuce Seed\'s active components are thought to have analgesic properties that help reduce pain. This natural herb is a safe alternative to traditional medications for managing chronic or acute discomfort. Wild Lettuce can also be used as an expectorant for helping clear mucus from the airways during an episode of whooping cough. \nWith its calming properties, it has been used for centuries as a powerful natural medicine to help reduce discomfort and soothe away pain. From easing sore muscles to reducing cramps during menstruation, Wild Lettuce offers effective relief. Its anti-inflammatory properties make it perfect for relieving joint stiffness and promoting improved mobility. \nWith its mild sedative effect, Wild Lettuce has been used to naturally improve sleep quality and reduce feelings of restlessness. Whether you are dealing with occasional sleeplessness or chronic insomnia, wild lettuce may help give you the sound night’s rest that you deserve.\n', '/storage/photos/1/Final Pic/kahu beej.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(123, 'Box Myrtle', 'Myrica Esulenta', 'Box Myrtle', NULL, 'Kaiphal', 'Reduces swelling @Soothes digestive system @ Anti-inflammatory.', 'An all-natural herbal remedy,Box Myrtle\'s  unique blend of herbs helps to reduce swelling, joint pain, oral ulcer, paralysis and diarrhoea. Also widely known for its potential to aid with the management of diabetes. With a gentle yet effective formula, Box Myrtle can be taken safely by adults and children alike. \nThis herbal supplement combines traditional Ayurvedic ingredients that work together to soothe your digestive system and provide relief from occasional heartburn and other uncomfortable symptoms. Use Box Myrtle for fast-acting relief of indigestion.\nContaining high levels of active compounds such as tannins, flavonoids, triterpenes, essential oils and other antioxidants which are known to help soothe inflammation, restore damaged skin tissue and speed up the healing process. Gentle enough, Box Myrtle can be used on even the most sensitive skin types without causing any irritation or dryness.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(124, 'Khejri Tree', 'Prosopis cineraria', 'Khejri Tree', NULL, 'Kairuba Shami', 'Anti-inflammatory @ Fights infection @ Antioxidant.', 'An all-natural medicinal powerhouse, Khejri Tree with its astringent, demulcent and pectoral properties, has long been used in traditional medicine to help promote health and well-being. This tree extract has strong anti-inflammatory properties that can reduce redness and swelling of affected areas. Additionally, it may help support the body\'s natural healing processes, aid digestion, and improve overall skin health. \nA versatile herb, Khejri Tree is anthelmintic, tonic and refrigerant, making it beneficial for fighting against infections. Particularly helpful for treating asthma, bronchitis, dysentery, skin disorders, leprosy, muscle tremors, piles and wandering of the mind. \nA natural ability to fight oxidative stress and damage due to its high antioxidant activity,  Khejri Tree can protect your body from free radical damage caused by toxins and environmental pollutants. In addition, it can boost your immune system and support overall health. With a regular dosage, you can get long-lasting benefits from its antioxidants and enjoy better physical and mental well-being.\n', '/storage/photos/1/Final Pic/khairuba shami.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(125, 'Zebrawood', 'Pistacia integerrima', 'Zebrawood', NULL, 'Kakda Singhi, Rhus Succedancea, karkadakchringi', 'Supports digestive health @ Healing properties @ Improves circulation.', 'Possessing antispasmodic and antioxidant properties, Zebrawood is helpful in relieving symptoms including coughs, dyspeptic vomiting, appetite loss, phthisis, dysentery and asthma. This therapeutic plant has also been known to support digestive health, reduce mucus production, improve circulation and fight free radicals.', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(126, 'Habbe Neel', 'Ipomoea Hederacea', 'Habbe Neel', NULL, 'Kala Dana', 'Relieves joint pain @ Reduces hyperacidity @ Relieves headache.', 'An effective herbal remedy, Habbe Neel is an acrid, anthelmintic, antifungal, antispasmodic, blood purifying, cathartic, diuretic, laxative and purgative remedy that helps improve the functioning of vital organs in the body. Helps in clearing the bloodstream from harmful toxins and improves circulation, Habbe Neel can provide immediate relief of symptoms related to common ailments like fever, skin irritation and joint pain. Powerful formula made up of natural herbs, it contains curative properties and works to naturally promote overall well being.\nA herbal supplement helping to reduce hyperacidity, it works to soothe and ease discomfort caused by excess stomach acid. This remedy also helps strengthen digestion and provide relief from symptoms such as indigestion, heartburn, and bloating. \nNon-addictive, easy to use and providing quick relief, Habbe Neel has proven to be effective in providing relief for minor and moderate headaches. Give it a try today and enjoy the peace of mind knowing you have an effective natural remedy at your disposal.\n', '/storage/photos/1/Final Pic/kala Dana.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(127, 'Kali Jiri', 'Carum Carui Linn.', 'Kali Jiri', NULL, 'Kadwi Jiri,  Kamoon Aswat Murr, ', 'Manages cholesterol levels @ Diuretic @ Antibacterial.', 'Used traditionally in Ayurvedic medicine to aid in managing indigestion, cholesterol levels, arthritis, and diabetes - Kali Jiri\'s blend of herbs are known for their natural anti-inflammatory properties. Take Kali Jiri to help maintain and regulate your blood sugar levels.\nKali Jiri\'s diuretic activity works by increasing the rate of urine flow, helping you quickly expel any excess fluid buildup in your body - Resulting in improved fluid balance and healthier bodily functioning. Kali Jiri also has a mild taste, making it an easy-to-consume option for relieving ailments naturally.\nContaining antibacterial properties, Kali Jiri  is effective in helping treat minor to severe skin issues, including boils, blisters, and cuts. In addition to this, Kali Jiri has natural astringent and antiseptic qualities that can help protect the skin from further irritation and infection. With regular use, you can help restore your skin’s healthy glow and enjoy long-term relief from painful skin infections.\n', '/storage/photos/1/Final Pic/Kali Jiri.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(128, 'Black Pepper', 'piper Nigrum', 'Black Pepper', NULL, 'Kali Mirchi, Fil Fil Aswat, ', NULL, NULL, '/storage/photos/1/Final Pic/Black Pepper.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(129, 'Salt Petre', 'Salt Petre', 'Salt Petre', NULL, 'Kalmi Shora,  Shurra, ', 'Anti-inflammatory @ Lowers blood pressure @ Controls blackheads.', 'Salt Petre\'s powerful anti-inflammatory properties can help to reduce swelling, inflammation and pain in the bladder and kidneys. It also helps to break down existing kidney stones, promoting better urine flow. When used for indigestion, Salt Petre helps to calm the stomach, soothe spasms and promote healthy digestion. For optimal results, try this all-natural solution today for improved urinary health and better digestive balance.\nContaining potassium nitrate, which works by dilating your blood vessels, Salt Petre helps to balance electrolytes in your body, making it easier for the heart to pump blood throughout your system. This can result in lowered blood pressure levels, which makes Salt Petre an ideal supplement for those with hypertension. \nAn all-purpose skin care product, designed to meet the needs of both oily and dry skin types - Salt Petre\'s natural properties work to control blackheads and reduce flakiness, while providing a cool, refreshing sensation on the skin. Use Salt Petre as part of your daily skin care routine to keep your complexion looking its best.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(130, 'Kalonji', 'Nigella Sativa', 'Kalonji', NULL, 'Black Seeds, Habba Sauda, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(131, 'Lotus Seeds', 'Nelumbo nucifera', 'Lotus Seeds', NULL, 'Kamal Gatta, Koldoda, ', 'Rich in dietary fibres @ Aids in weight loss @ Promotes skin health.', 'A nutritious superfood with powerful health benefits, Lotus Seeds contain numerous compounds that help fight inflammation, cancer, and even diabetes. Plus, their consumption can help reduce the risk of chronic diseases. An easy way to boost your overall health, add this delicious nutty flavoured seeds to your daily diet.\nRich in dietary fibre, they help to promote healthy digestion and balance blood sugar levels. These tasty seeds also support weight loss by providing satiation that helps to reduce calorie intake throughout the day. Lotus Seeds - A nutritional powerhouse that is easy to enjoy.\nRich in Vitamins A, B1, B2, and C as well as minerals like zinc and magnesium, these powerful little seeds can help promote skin health and a youthful complexion. Plus, Lotus Seeds are packed with antioxidants, which help protect cells from oxidative damage and fight the signs of ageing. Try Lotus Seeds for a nutritious boost and healthier skin!\n', '/storage/photos/1/Final Pic/Lotus Seeds.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(132, 'Flame of the Forest', 'Butea frondoa', 'Flame of the Forest', NULL, 'Kamarkass', 'Boosts cognitive performance @ Relieves pain @ Antiseptic.', 'A herbal supplement that can help to enhance your memory and rejuvenate your mind and body. With a unique blend of potent natural ingredients, Flame of the Forest (Kamarkass) helps to provide lasting results in helping to boost brainpower, clarity and alertness while improving energy levels and promoting general health and well-being. With regular use, you can expect improved focus, enhanced concentration, better recall and more energy throughout the day.\nAn all-in-one natural remedy for pain, inflammation, and infection - Kamarkass has a powerful combination of analgesic, anti-inflammatory, antimicrobial, astringent, and diuretic properties that work together to quickly and effectively address a variety of physical ailments. Whether it\'s an ache in your back or a cold that just won\'t quit, Kamarkass has you covered with its healing and restorative power. \nIts powerful antiseptic properties work to soothe the skin, while promoting healing and preventing further damage. With regular use, Kamarkass will help you maintain a healthy complexion and ward off any unwanted irritations.\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(133, 'Kamila Powder', 'Campila', 'Kamila Powder', NULL, 'Kamphila', 'Treats eye problems @ Reduces excess mucus @ Promotes hair growth.', 'A herbal remedy derived from Ayurvedic medicine, Kamila Powder is most effective in treating bleeding disorders, intestinal worms, abdominal tumours and other digestive issues. Furthermore, Kamila Powder promotes quick healing of wounds and ulcers to speed up recovery time. Incorporating this powerful powder into your daily routine will help improve your overall health and well-being.\nThis natural supplement works quickly and effectively, reducing symptoms like blurred vision, redness and irritation. The powder helps to clear out bacteria, fungus, parasites and other irritants that cause inflammation and eye problems. In addition, Kamila Powder can reduce the production of excess mucus which can help to improve overall eye health. Give your eyes the relief they deserve with Kamila Powder.\nRich in essential oils and minerals, this powder helps to promote hair growth, nourish the scalp, and provide natural shine and volume to your locks. When mixed with a carrier oil, Kamila Powder works its magic when massaged into the scalp, giving you a refreshing spa-like experience at home. Enjoy thicker, healthier hair that\'s fuller of life!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(134, 'Fever Nuts', 'Caesalpinia Bonduc', 'Fever Nuts', NULL, 'Karanjwa, Caesalpinia Crista,Sagar Goti, kaantaa karanj, gajjike kaayi, gazka, kayinjikuru, kazhanjikkuru, ', 'Treats fever @ Purifies blood @ Antibacterial.', 'A powerful herbal supplement, Fever Nut can be used to treat fever, inflammation, diabetes, cardiovascular disorder, cancer and also for birth control. Fever Nut helps reduce inflammation and balances blood sugar levels. It can also improve the body’s response to stress and improve cardiovascular health. In addition, Fever Nut can act as a natural form of birth control and has even been shown to help fight some forms of cancer. For those seeking natural solutions to their health concerns, Fever Nut is a great option.\nContaining powerful febrifuge, antiperiodic, anthelmintic and tonic properties - Fever Nut provides relief in symptoms of malaria to purifying blood. Fever Nut offers the holistic benefits you need to keep feeling your best. \nAn all-natural solution for powerful antibacterial protection, Fever Nut can keep your family and home healthy by preventing bacteria from spreading. This wonder nut contains high levels of antioxidants to fight off harmful bacteria, providing an extra layer of protection against common illnesses. Additionally, Fever Nut has anti-inflammatory properties that make it an ideal supplement for promoting overall wellness.\n', '/storage/photos/1/Final Pic/karanjwa.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(135, 'Bitter Gourd', 'Momordica charantia', 'Bitter Gourd', NULL, 'Karela Dry, Bitter Melon', 'Source of nutrition @ Reduces dark circles @ Combats dandruff.', 'Packed with vitamins and nutrients, Bitter Gourd\'s high content of vitamin C helps protect your body from diseases, while also speeding up the healing process for wounds. It\'s essential for development and growth in the body, making Bitter Gourd an invaluable source of nutrition. Add it to your diet today for a healthier, more vibrant lifestyle.\nBitter Gourd is not only packed with powerful antioxidants and nutrients, but its properties are known to be beneficial for your eyes\' health. Effectively reducing dark circles, promoting a healthier and brighter look around the eyes. Bitter Gourd – the perfect way to improve your vision naturally!\nBitter Gourd\'s anti-ageing properties help to reduce wrinkles, while its powerful antioxidants can help to fight off acne and other blemishes -  Nourishing your skin and giving it a healthier glow. \nA great addition to any hair care routine, Bitter Gourd helps combat dandruff, hair loss, and split-ends by adding lustre and strength to your locks. With regular use, you can expect to see smoother and healthier hair that\'s easier to manage. Plus, it smells great too!\n', '/storage/photos/1/Final Pic/karela dry Seeds.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(136, 'Common Chicory', 'Cichorium intybus', 'Common Chicory', NULL, 'Kasini Beej, Hindiba, ', 'Aids in weight loss @ Antioxidant @ Anti-ageing.', 'An all-natural herbal supplement, Common Chicory can be used to help with a range of issues, including loss of appetite, upset stomach, constipation, liver and gallbladder disorders, cancer, and rapid heartbeat. Consisting of only natural ingredients, Common Chicory provides a safe and reliable solution to address a variety of health concerns. Easy-to-take, you\'ll experience the full effects of this powerful herb in no time! \nAn ideal powerhouse for anyone looking to support their weight loss journey, Common Chicory can help reduce unhealthy cravings and support metabolic functions for improved overall wellness. Additionally, its antioxidants can protect against free radical damage and reduce oxidative stress on the brain for increased cognitive clarity.\nA revolutionary product, Common Chicory, can help you achieve youthful skin by increasing collagen production - Helping improve skin\'s elasticity and vibrancy while reducing wrinkles and age spots. An essential part of any anti-aging skin care routine, Common Chicory helps restore skin health and give your complexion a beautiful glow.\n', '/storage/photos/1/Final Pic/kasini beej.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(137, 'Catechu Big', 'Senegalia catechu', 'Catechu Big', NULL, 'Katha Belgaon,  Gaath, ', 'Anti-inflammatory @ Stops bleeding @ Nourishes hair quality.', 'A traditional Chinese Medicine, Catechu Big can help relieve a range of gastrointestinal issues, including diarrhoea, swelling of the nose and throat, dysentery, swelling of the colon (colitis), indigestion, and bleeding. It may also provide relief from symptoms associated with osteoarthritis and cancer. Catechu Big helps to reduce inflammation in the body and promote better digestion, allowing you to maintain overall health and wellness.\nA topical remedy specifically designed for treating skin diseases, haemorrhoids, and traumatic injuries- Catechu Big\'s active ingredient can help to stop bleeding quickly, and the product can be applied directly to the affected area for rapid results. Catechu Big is also great for dressing wounds and can help reduce pain and swelling from inflammatory promotions. \nNourish and improve the quality of your hair - Catechu\'s powerful formula helps add body, shine, and volume to dull and lifeless locks. It also adds vibrancy to your hair colour, leaving it looking shinier and healthier than ever before. Give your hair the love it needs with Catechu Big!\n', '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(138, 'Catechu White', 'Senegalia catechu', 'Catechu White', NULL, 'Katha Crown,  Gaath, ', 'Prevents gum diseases @ Effective against trauma @ Treats skin disorders.', 'Useful in treating gum disease, stomatitis, sore throats, and mouth ulcers, The active ingredient of Catechu White has been proven to reduce inflammation in the gums and mouth, relieve pain and swelling associated with these ailments. Its antibacterial properties also help protect against bacteria and other infections. In addition to its therapeutic effects, it can also be used as a breath freshener.\nSpecially formulated for topical use to treat skin promotions, haemorrhoids, and trauma, the active ingredients in Catechu White helps stop bleeding quickly, and the product can be applied directly to the affected area for rapid results. \nCatechu White\'s decoction is a fermented liquid, used to treat skin disorders such as psoriasis, eczema, allergic hives, and dermatitis. The unique combination of active ingredients make this a great choice for those seeking relief from their skin-related ailments. This herbal remedy can be taken orally to help reduce redness and itching, and clear up any blemishes or sores. With regular use, you can see an improvement in the overall health and appearance of your skin.\n', '/storage/photos/1/Final Pic/Katha white.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(139, 'Gambier', 'Uncaria Gambir', 'Gambier', NULL, 'Katha Gambier,  Gaath, ', 'Effective against migraine @ Boosts immunity @ Treats thrush and dry lips.', 'An effective treatment for those suffering from migraine headaches, Gambier provides fast relief by soothing inflammation and reducing pain. The herbs used in Gambier have been known to work as muscle relaxants and reduce stress levels, making it an excellent choice. Easier to take with minimal side effects, Gambier makes it a safe and natural option for those seeking migraine headache relief.\nFormulated with powerful herbal extracts and compounds that work together, Gambier is an immune-boosting supplement that helps to increase your body\'s natural defence system. \nRenowned for its effectiveness in helping to keep your teeth and gums healthy. Gambier is used to improve oral hygiene, reduce bad breath, and protect against cavities. Its natural ingredients help to eliminate bacteria and plaque, reducing the chances of tooth decay. \nAn incredibly versatile natural remedy, Gambier is especially helpful for treating thrush and dry lips, thanks to its moisturising properties and natural antifungal agents. By soothing and hydrating your skin, Gambier can provide quick relief from irritation and inflammation.\n', '/storage/photos/1/Final Pic/Gambier.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(140, 'Catechu Small', 'Senegalia catechu', 'Catechu Small', NULL, 'Katha Kanpuri, Gaath, ', NULL, NULL, '/storage/photos/1/Final Pic/Katha Kanpuri.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(141, 'Catechu Sagar', 'Senegalia catechu', 'Catechu Sagar', NULL, 'Katha Sagar, Gaath, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(142, 'Saffron', 'Crocus Sativus', 'Saffron', NULL, 'Kesar, Zaffran', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(143, 'Marshmallow Seeds', 'Althaea officinalis', 'Marshmallow Seeds', NULL, 'Khatmi', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(144, 'Lavender Petals', 'Lavendula Officinalis', 'Lavender Petals', NULL, 'Khazama', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(145, 'Common Mallow', 'Malva Syvestris', 'Common Mallow', NULL, 'Khubazi', NULL, NULL, '/storage/photos/1/Final Pic/Khubazi.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(146, 'Hedge seeds', 'Sysymbrium Irio', 'Hedge seeds', NULL, 'Khubkalan,  Khaksheer', NULL, NULL, '/storage/photos/1/Final Pic/Khaksheer.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(147, 'Babul Fruit', 'Vachellia nilotica', 'Babul Fruit', NULL, 'Kikarfali, Gairaat, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(148, 'Wormseed', 'Artemesia Maritima', 'Wormseed', NULL, 'Kirmani', NULL, NULL, '/storage/photos/1/Final Pic/wormseed.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(149, 'Cowries', 'Cypraeidae', 'Cowries', NULL, 'Kodi Safed,  Sadaf Sageer, ', NULL, NULL, '/storage/photos/1/Final Pic/Cowries.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(150, 'Black Velvet Beans', 'Mucuna Pruriens DC', 'Black Velvet Beans', NULL, 'Konch Beej Black', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(151, 'Cowhage White', 'Mucuna Pruriens DC', 'Cowhage White', NULL, 'Konch Beej White', NULL, NULL, '/storage/photos/1/Final Pic/Cowhage White.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(152, 'Galangal', 'Alphinia Galanga Linn.', 'Galangal', NULL, 'Kulanjan', NULL, NULL, '/storage/photos/1/Final Pic/Kulanjan.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(153, 'Indian Purslane', 'Portulaca Oleracea', 'Indian Purslane', NULL, 'Kulfa Beej, Bijr Kurfaa, ', NULL, NULL, '/storage/photos/1/Final Pic/Kulfa Beej.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(154, 'Horsegram', 'Dolichos Bilforus Linn.', 'Horsegram', NULL, 'Kulti Dal', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(155, 'Safflower', 'Carthamus Tinctorius', 'Safflower', NULL, 'Kusum Phool, Asfoor, Lisaan Asfoor', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(156, 'Costus', 'Saussurea Lappa', 'Costus', NULL, 'Kuth Kadwi, Qist Talkh, Qist Al Hind', NULL, NULL, '/storage/photos/1/Final Pic/kuth talkh.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(157, 'White Costus', 'Saussurea costus', 'White Costus', NULL, 'Kuth Shreen, Qist Bahari, ', NULL, NULL, '/storage/photos/1/Final Pic/kuth shreen.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(158, 'Helibore', 'Picrorhiza Kurroa', 'Helibore', NULL, 'Kutki', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(159, 'Lac Button', 'Laccifer Lacca Kerr', 'Lac Button', NULL, 'Lac', NULL, NULL, '/storage/photos/1/Final Pic/Lac Button.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(160, 'Gum Lac ', 'Laccifer Lacca Kerr', 'Gum Lac ', NULL, 'Lac', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(161, 'Shy plant', 'Mimosa Pudica', 'Shy plant', NULL, 'Lajwanti, Touch me not, ', NULL, NULL, '/storage/photos/1/Final Pic/lajwanti.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(162, 'Sebestan Fruit', 'Cordia Myxa', 'Sebestan Fruit', NULL, 'Lasudia, Sapistan, ', NULL, NULL, '/storage/photos/1/Final Pic/Lasudia.jpg', 0, 'default', 'active', 1, 1, 4, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(163, 'Benzoin', 'Styrax Brnzoin Dry', 'Benzoin', NULL, 'Loban Javi', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 8, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(164, 'Blotur Bark', 'Symplocossa', 'Blotur Bark', NULL, 'Lodh Pathani', NULL, NULL, '/storage/photos/1/Final Pic/Lodh Pathani.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(165, 'Intellect tree', 'Tylophora', 'Intellect tree', NULL, 'Maalkanguni, Staff Tree, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(166, 'Peeled Pumpkin Seeds', 'Cucurbita Pepo', 'Peeled Pumpkin Seeds', NULL, 'Magaz Kadu', NULL, NULL, '/storage/photos/1/Final Pic/Magaz Kaddu.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(167, 'Peeled Muskmelon Seeds', 'Cucumis Melo', 'Peeled Muskmelon Seeds', NULL, 'Magaz Kharbuza', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(168, 'Peeled Cucumber Seeds', 'Curcumis Sativus', 'Peeled Cucumber Seeds', NULL, 'Magaz Kheera, Magaz Khayareen, ', NULL, NULL, '/storage/photos/1/Final Pic/Magaz kheera.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(169, 'Peeled Watermelon Seeds', 'Citrullus Lanatus', 'Peeled Watermelon Seeds', NULL, 'Magaz Tarbuz', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, 3, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(170, 'Indian Tamarisk', 'Tamarix Gallica Linn', 'Indian Tamarisk', NULL, 'Mahi', NULL, NULL, '/storage/photos/1/Final Pic/mahi.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(171, 'Litsea Bark', 'Neolitsea Chinensis', 'Litsea Bark', NULL, 'Maida Lakdi', NULL, NULL, '/storage/photos/1/Final Pic/maida lakad.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(172, 'Emetic Nut', 'Randia Dumetorum', 'Emetic Nut', NULL, 'Main Phal, Tufaal jaan, ', NULL, NULL, '/storage/photos/1/Final Pic/main phal.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(173, 'Madder Roots', 'Rubia Cordifolia', 'Madder Roots', NULL, 'Majith, Runass, Fuva', NULL, NULL, '/storage/photos/1/Final Pic/madder Roots.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(174, 'Gallnuts', 'Quercus Infectoria Linn.', 'Gallnuts', NULL, 'Maju Phal, Hafz, ', NULL, NULL, '/storage/photos/1/Final Pic/Maju phal.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(175, 'Black Night Shade', 'Solanum Nigrum', 'Black Night Shade', NULL, 'Makoi Dana', NULL, NULL, '/storage/photos/1/Final Pic/makoi Dana.jpg', 0, 'new', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(176, 'Coptis Teeta', 'Thalictrum foliolosum', 'Coptis Teeta', NULL, 'Mamira,  Mamiraj, ', NULL, NULL, '/storage/photos/1/Final Pic/Mamira.jpg', 0, 'new', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(177, 'Screw Tree', 'Helicteres Isora', 'Screw Tree', NULL, 'Maror phali, Arq Layi, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(178, 'Dry Camels Milk', 'Dry Camels Milk', 'Dry Camels Milk', NULL, 'Maya Shurta Arbi', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(179, 'Henna Leaves', 'Lawsonia inermis', 'Henna Leaves', NULL, 'Mehandi Patta,  Vark Henna, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(180, 'Gum Betel Nut flower', 'Areca Cathechu', 'Gum Betel Nut flower', NULL, 'Mochrass Kala , Salmali, Gul Supari', NULL, NULL, '/storage/photos/1/Final Pic/Cathechu.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(181, 'Silk Cotton Tree', 'Salmalia', 'Silk Cotton Tree', NULL, 'Mochrass lal', NULL, NULL, '/storage/photos/1/Final Pic/Mochrass lal.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(182, 'Liquorice Roots', 'Glycyrrhiza Blabra Linn.', 'Liquorice Roots', NULL, 'Mulethi, Athimathiram, Arkisus, ', NULL, NULL, '/storage/photos/1/Final Pic/Liquorice Roots.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(183, 'Liquorice Extract', 'Glycyrrhiza Blabra Linn.', 'Liquorice Extract', NULL, 'Mulethi Sat', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(184, 'Radish Seeds', 'Raphanus Sativus', 'Radish Seeds', NULL, 'Muli Beej, Bijr Rovet, Bijr Fijil', NULL, NULL, '/storage/photos/1/Final Pic/Muli Beej.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(185, 'Fullers Earth clay', 'Fullers Earth clay', 'Fullers Earth clay', NULL, 'Multani Mitti, Teen Abhiyat, ', NULL, NULL, '/storage/photos/1/Final Pic/multani miti.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(186, 'Litharge', 'Triplumbic Tetroxide', 'Litharge', NULL, 'Murdasang, Bint Al Dahab, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(187, 'Aloe Vera Extract Indian', 'Aloe', 'Aloe Vera Extract Indian', NULL, 'Musabbar Indian, Sabar Hindi, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(188, 'Aloe Vera Extract Yemen', 'Aloe', 'Aloe Vera Extract Yemen', NULL, 'Musabbar Yemeni, Sabar Yemeni, ', NULL, NULL, '/storage/photos/1/Final Pic/Musabbar Yemeni.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(189, 'Golden Eye Grass', 'Curculigo Orchiodes', 'Golden Eye Grass', NULL, 'Musli Kali, Musali Aswat, ', NULL, NULL, '/storage/photos/1/Final Pic/Musli Kali.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(190, 'Musli Safed Indian', 'Asparagus Chlorophytum', 'Musli Safed Indian', NULL, 'Musli Safed Indian, Musali Abhiyat Hindi, ', NULL, NULL, '/storage/photos/1/Final Pic/Musli Safed Indian.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(191, 'Musli Safed Pakistan', 'Asparagus Chlorophytum', 'Musli Safed Pakistan', NULL, 'Musli Safed Pakistan,  Musli Abhiyat Pakistani, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(192, 'Nutgrass', 'Cyperus scariosus', 'Nutgrass', NULL, 'Nagermotha, Saad Kufi, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(193, 'Ncobras Saffron', 'Mesua Ferrea Linn.', 'Ncobras Saffron', NULL, 'Nagkesar', NULL, NULL, '/storage/photos/1/Final Pic/nagkesar 2.jpg', 0, 'new', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(194, 'Black Salt', 'Black Salt', 'Black Salt', NULL, 'Namak Kala, Mileh Aswat, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(195, 'Rock Salt', 'Himalyan Pink Salt', 'Rock Salt', NULL, 'Namak Lahori, Mileh Ahmer, ', NULL, NULL, '/storage/photos/1/Final Pic/Himalyan Pink Salt.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(196, 'White Turmeric', 'Curcuma zedoaria', 'White Turmeric', NULL, 'Narkachur', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(197, 'Ammonium Chloride', 'Choride of Ammonia', 'Ammonium Chloride', NULL, 'Navshadar Tikri, Shanadar, ', NULL, NULL, '/storage/photos/1/Final Pic/navshadhar tikri.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(198, 'Neem Chal', 'Azadirachta', 'Neem Chal', NULL, 'Neem Chal', NULL, NULL, '/storage/photos/1/Final Pic/neem chal.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(199, 'Neem Dana', 'Azadirachta', 'Neem Dana', NULL, 'Neem Dana', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(200, 'Neem Magaz', 'Azadirachta', 'Neem Magaz', NULL, 'Neem Magaz', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(201, 'Water Lilly', 'Nelumbium', 'Water Lilly', NULL, 'Nilofar', NULL, NULL, '/storage/photos/1/Final Pic/Nilofar.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(202, 'Clearing Nut Tree', 'Strychnos Potatorum', 'Clearing Nut Tree', NULL, 'Nirmali Beej', NULL, NULL, '/storage/photos/1/Final Pic/Nirmali Beej.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(203, 'Turpeth Root', 'Ipomoea Turpethum', 'Turpeth Root', NULL, 'Nisoth, Indian Jalap ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(204, 'Paeomi Roots', 'Paeomia Emodi Wall', 'Paeomi Roots', NULL, 'Oodsaleeb', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(205, 'Hairy Bergenia', 'Bergenia Ciliata', 'Hairy Bergenia', NULL, 'Pakhan Ved, Pashanbhed, ', NULL, NULL, '/storage/photos/1/Final Pic/pakhan Ved.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(206, 'Butea Gum tree', 'Butea Monosperma', 'Butea Gum tree', NULL, 'Palas Papda', NULL, NULL, '/storage/photos/1/Final Pic/palas papda 2.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(207, 'Indian Rennet', 'Withania Coagulans', 'Indian Rennet', NULL, 'Paneer Dodi', NULL, NULL, '/storage/photos/1/Final Pic/Paneer Dodi 2.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(208, 'Sickle Senna', ' Senna Tora', 'Sickle Senna', NULL, 'Panvar Beej, Cassia Tora, ', NULL, NULL, '/storage/photos/1/Final Pic/Panvar beej.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(209, 'Maiden Hair Fern', 'Adiantum capillus-veneris L.', 'Maiden Hair Fern', NULL, 'Parshosha', NULL, NULL, '/storage/photos/1/Final Pic/Parshosha.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(210, 'Patchouli Leaves', 'Pogostemon cablin', 'Patchouli Leaves', NULL, 'Patchouli Leaves, Vark Rehan, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, '', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(211, 'Long Pepper', 'Piper Longnum Linn.', 'Long Pepper', NULL, 'Pipal Big, Fil Fil Daraaj, ', NULL, NULL, '/storage/photos/1/Final Pic/Long Pepper.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(212, 'Long Pepper Roots', 'Piper Longnum Linn.', 'Long Pepper Roots', NULL, 'Piplamool, Long Pepper Roots, Peepramul, ', NULL, NULL, '/storage/photos/1/Final Pic/Piplamool.jpg', 0, '', 'active', 1, 11, 13, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(213, 'Onion Seeds', 'Allium Cepa', 'Onion Seeds', NULL, 'Pyaz Beej, Bijr Basal, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 13, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(214, 'Quinoa Black', 'Chenopodium Quinoa', 'Quinoa Black', NULL, 'Quinoa Black', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 13, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(215, 'Quinoa Mix', 'Chenopodium Quinoa', 'Quinoa Mix', NULL, 'Quinoa Mix', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 13, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(216, 'Quinoa Red', 'Chenopodium Quinoa', 'Quinoa Red', NULL, 'Quinoa Red', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 13, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(217, 'Quinoa White', 'Chenopodium Quinoa', 'Quinoa White', NULL, 'Quinoa White', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(218, 'Malabar Mace', 'Myristica Malabarica', 'Malabar Mace', NULL, 'Rampatri, Malabar Mace, Jangli Jaiphal, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(219, 'Indian Barberry', 'Berberis aristata', 'Indian Barberry', NULL, 'Rasauth, Raswal, ', NULL, NULL, '/storage/photos/1/Final Pic/Rasauth.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(220, 'Alkanet root', 'Alkanna tinctoria', 'Alkanet root', NULL, 'Ratanjot, Khawa Jawa, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(221, 'Red Jequirity Beans', 'Abrus Precatorius', 'Red Jequirity Beans', NULL, 'Rati Lal, Aiyan Afreed Ahmer, ', NULL, NULL, '/storage/photos/1/Final Pic/Rati lal.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(222, 'White Jequirity Beans', 'Abrus Precatorius', 'White Jequirity Beans', NULL, 'Rati Safed,  Aiyan Afreed Abhiyat, ', NULL, NULL, '/storage/photos/1/Final Pic/Rati Safed.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(223, 'Soapnut', 'Sapindus', 'Soapnut', NULL, 'Reetha, Aritha', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(224, 'Rhubarb Root', 'Rheum Emodi Wall', 'Rhubarb Root', NULL, 'Rewand Chini, Khasab Rewand, ', NULL, NULL, '/storage/photos/1/Final Pic/Revand Chini.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(225, 'Peeled Rhubarb Root', 'Rheum Emodi Wall', 'Peeled Rhubarb Root', NULL, 'Rewand Khatai, Khasab Rewand, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(226, 'Rosemary', 'Rosmarinus Officinalis', 'Rosemary', NULL, 'Ikleel e jabal, Iklil e Jabal', NULL, NULL, '/storage/photos/1/Final Pic/Rosemary (1).jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(227, 'Gum Mastic', 'Pistacia lentiscus', 'Gum Mastic', NULL, 'Rumi Mastagi,  Mastaka, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(228, 'Sodium Salt Black', 'Sodium Chloride', 'Sodium Salt Black', NULL, 'Sajji Khar Black', NULL, NULL, '/storage/photos/1/Final Pic/saji khar black.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(229, 'Sodium Salt White', 'Sodium Chloride', 'Sodium Salt White', NULL, 'Sajji Khar White', NULL, NULL, '/storage/photos/1/Final Pic/saji khar white.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(230, 'Scammony Resin', 'Convolvulus Scammonia', 'Scammony Resin', NULL, 'Sakmunia', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(231, 'Marsh Orchid', 'Dactylorhiza', 'Marsh Orchid', NULL, 'Salab Dana, Salab Habb, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(232, 'Salep Orchid Roots', 'Orchis Mascula', 'Salep Orchid Roots', NULL, 'Salab Gatta', NULL, NULL, '/storage/photos/1/Final Pic/salab gatta.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(233, 'Finger Salep Orchid Brown', 'Dactylorhiza Hatagirea', 'Finger Salep Orchid Brown', NULL, 'Salab Panja Brown, Marsh Orchid Brown, Salab Kaff, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(234, 'Finger Salep Orchid White', 'Dactylorhiza Hatagirea', 'Finger Salep Orchid White', NULL, 'Salab Panja White, Marsh Orchid White, Salab Kaff, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(235, 'Five Leaves Chaste tree', ' Vitex Negundo', 'Five Leaves Chaste tree', NULL, 'Sambhalu Beej,  Bijr Suleyega, ', NULL, NULL, '/storage/photos/1/Final Pic/sambhalu beej.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(236, 'Cuttle Fish Bone', 'Sepia Officinalis', 'Cuttle Fish Bone', NULL, 'Samunder Jhag,  Zibit Al Bahaar, ', NULL, NULL, '/storage/photos/1/Final Pic/samundar jhag.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(237, 'Elephant Creeper Seeds', 'Argyrela Speciosa', 'Elephant Creeper Seeds', NULL, 'Samunder Sokh Dana', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(238, 'Sandalwood', 'Santalum Album', 'Sandalwood', NULL, 'Sandal Safed Ind', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(239, 'Otholith', 'Otholith', 'Otholith', NULL, 'Sange Sarmahi, Otholith, Stone in head of fish, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(240, 'Soap Stone', 'Silicate of Magnesia', 'Soap Stone', NULL, 'Sange Zehrat, Hydrated Magnesium Silicate, ', NULL, NULL, '/storage/photos/1/Final Pic/sange zehrat.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(241, 'Serpentna', 'Rauwolfia Serpentina', 'Serpentna', NULL, 'Sarpagandha, Asrool, Choti Chandan', NULL, NULL, '/storage/photos/1/Final Pic/Asrool.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(242, 'Senna Sophera', 'Cassia Sophera', 'Senna Sophera', NULL, 'Sarfoka, Senna Purpurea, ', NULL, NULL, '/storage/photos/1/Final Pic/sarfoka.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(243, 'Yellow Mustard Seeds', 'Brassica Alba', 'Yellow Mustard Seeds', NULL, 'Sarso Pilli, Khardal Abhiyat, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(244, 'Plumed Cockscomb', 'Celosia Argentea', 'Plumed Cockscomb', NULL, 'Sarvali Beej, Silver Cockscomb, ', NULL, NULL, '/storage/photos/1/Final Pic/sarvalli beejl.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(245, 'Sat Giloy', 'Tinospora Cordifolia', 'Sat Giloy', NULL, 'Sat Gilo, Heart Leaved Moonseed Powder, Cocculus Cordifolius, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(246, 'Shataveri', 'Asparagus Racemosus', 'Shataveri', NULL, 'Satawar, Sataveri, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(247, 'Indian Senna Leaves', 'Cassia Angustifolia', 'Indian Senna Leaves', NULL, 'Senna Leaves, Indian Senna, Halul, ', NULL, NULL, '/storage/photos/1/Final Pic/Senna Leaves.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(248, 'Senna Pods', 'Senna Alexandria', 'Senna Pods', NULL, 'Senna Pods,  Ishrik, ', NULL, NULL, '/storage/photos/1/Final Pic/senna pods.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(249, 'Mother of Pearls Shell', 'Pinctada', 'Mother of Pearls Shell', NULL, 'Seep, MOP Shells, Sadaf, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 11, 12, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(250, 'Shah Jeera', 'Cuminum Cyminum', 'Shah Jeera', NULL, 'Shahjeera, Black Cumin Seeds Afgani', NULL, NULL, '/storage/photos/1/Final Pic/Cumin Seed.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(251, 'Common Fumitory', 'Fumaria officinalis', 'Common Fumitory', NULL, 'Shahtra', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(252, 'Wild Parsnip', 'Pastinaca Sativa', 'Wild Parsnip', NULL, 'Shakakal Mishri', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(253, 'Hemiptera', 'Hemiptera', 'Hemiptera', NULL, 'Sakar Tigar, Shakar Tigar, ', NULL, NULL, '/storage/photos/1/Final Pic/sakar tiger.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(254, 'Shark Marjan Small', 'Corallium', 'Shark Marjan Small', NULL, 'Shark Marjan Small, Red Coral', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(255, 'Shark Marjan Big', 'Corallium', 'Shark Marjan Big', NULL, 'Shark Marjan Big, Red Coral', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(256, 'Shikakai', 'Acacia Concinna', 'Shikakai', NULL, 'Shikakai', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14');
INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `plu`, `other_name`, `benefit`, `description`, `photo`, `minprice`, `promotion`, `status`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(257, 'Shilajit', 'Asphaltum', 'Shilajit', NULL, 'Asphalt, Momiyai, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(258, 'Gargumaru', 'Bryonia Laciniosa', 'Gargumaru', NULL, 'Shivlingi, Lollipo Climber, Ishwar Lingi', NULL, NULL, '/storage/photos/1/Final Pic/Shivlingi.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(259, 'Silk Cotton Tree', 'Bombax Ceiba Linn.', 'Silk Cotton Tree', NULL, 'Simbhal Musli', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(260, 'Water Chestnut', 'Trapa Bispinosa', 'Water Chestnut', NULL, 'Singara, Khameerat al Beera, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(261, 'Dill Seeds', 'Anethum Graveolens', 'Dill Seeds', NULL, 'Soya Beej, Bijr Shibit, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(262, 'Extra Large Size Pearls', 'Pearls', 'Extra Large Size Pearls', NULL, 'Sucha Moti Extra Large, Lulu XL, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(263, 'Large Size Pearls', 'Pearls', 'Large Size Pearls', NULL, 'Sucha Moti Large, Lulu Large, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(264, 'Medium Sized Pearls', 'Pearls', 'Medium Sized Pearls', NULL, 'Sucha Moti Small, Lulu Small, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(265, 'Borax', 'Sodium Tetraborate', 'Borax', NULL, 'Suhaga, Tinkaar Abhiyat, ', NULL, NULL, '/storage/photos/1/Final Pic/suhaga.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(266, 'Colchicum Bitter', 'Colchicum luteum', 'Colchicum Bitter', NULL, 'Suranjan Kadwi', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(267, 'Colchicum Sweet', 'Colchicum luteum', 'Colchicum Sweet', NULL, 'Suranjan Shreen', NULL, NULL, '/storage/photos/1/Final Pic/suranjan shreen.jpg', 0, 'default', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(268, 'Babmboo Resin Blue', 'Bambusa Arundinacea', 'Babmboo Resin Blue', NULL, 'Tabasheer Blue, Banslochan Blue', NULL, NULL, '/storage/photos/1/Final Pic/tabasheer blue.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(269, 'Babmboo Resin White', 'Bambusa Arundinacea', 'Babmboo Resin White', NULL, 'Tabasheer White, Banslochan White', NULL, NULL, '/storage/photos/1/Final Pic/tabasheer white.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(270, 'Taj', 'Cinnamomum Cassia', 'Taj', NULL, 'Taj', NULL, NULL, '/storage/photos/1/Final Pic/taj.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(271, 'Himalyan Silver Fir', 'Abies Webbiana', 'Himalyan Silver Fir', NULL, 'Talispater', NULL, NULL, '/storage/photos/1/Final Pic/talispater.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(272, 'Hygrophila', 'Hygrophila Spinosa', 'Hygrophila', NULL, 'Talmakhana', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(273, 'Extract of Thyme', 'Thymis Vulgaris', 'Extract of Thyme', NULL, 'Thymol,Sat Ajwain, ', NULL, NULL, '/storage/photos/1/Final Pic/Thyme.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(274, 'Sesame Black', 'Sesamum Indicum', 'Sesame Black', NULL, 'Til Kala, Sim Sim Aswat, ', NULL, NULL, '/storage/photos/1/Final Pic/til kala.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(275, 'Peppercress Red Seed', 'Lepidium Iberis', 'Peppercress Red Seed', NULL, 'Todari Lal, Pepper Wort Red, ', NULL, NULL, '/storage/photos/1/Final Pic/todari lal (1).jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(276, 'Peppercress White Seed', 'Lepidium Iberis', 'Peppercress White Seed', NULL, 'Todari Safed, Pepper Wort White, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(277, 'Celery Seeds', 'Apium Graveolens', 'Celery Seeds', NULL, 'Tukhm Karfas, Bijr Karaf, ', NULL, NULL, '/storage/photos/1/Final Pic/Celery Seeds.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(278, 'Dodder seeds', 'Cuscuta Reflexa', 'Dodder seeds', NULL, 'Tukhm Khasus', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(279, 'Turnip Seeds', 'Brassica rapa', 'Turnip Seeds', NULL, 'Tukhm Shalgam, Bijr Lifth, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(280, 'Sweet Basil Seed Small', 'Ocimum Pilosum', 'Sweet Basil Seed Small', NULL, 'Tukhmria, Sharbati', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(281, 'Holy Basil Seeds', 'Ocimum Tenuiflorum', 'Holy Basil Seeds', NULL, 'Tulsi Beej', NULL, NULL, '/storage/photos/1/Final Pic/tulsi seed.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(282, 'Holy Basil Leaves', 'Ocimum Tenuiflorum', 'Holy Basil Leaves', NULL, 'Tulsi Patta', NULL, NULL, '/storage/photos/1/Final Pic/tulsi leaf.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(283, 'Colocynth', 'Citrullus Colocythis', 'Colocynth', NULL, 'Tumba, Indrayan Phal, ', NULL, NULL, '/storage/photos/1/Final Pic/tumba.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(284, 'Camphora', 'Cinnamomum Camphora', 'Camphora', NULL, 'Camphor , Kapur, ', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(285, 'Jujube', 'Zizyphus Sativa Gaetn', 'Jujube', NULL, 'Unab', NULL, NULL, '/storage/photos/1/Final Pic/unab.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(286, 'French Lavender Flower', 'Lavendula Stoechas', 'French Lavender Flower', NULL, 'Ustakhadus', NULL, NULL, '/storage/photos/1/Final Pic/Ajwain.jpg', 0, 'new', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(287, 'Creeping Belpharis', 'Blepharis Edulis', 'Creeping Belpharis', NULL, 'Utangan', NULL, NULL, '/storage/photos/1/Final Pic/utangan.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(288, 'Slow Match Tree', 'Careya Arborea', 'Slow Match Tree', NULL, 'Vaikumba', NULL, NULL, '/storage/photos/1/Final Pic/vaikumba.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(289, 'False Black Pepper', 'Embelia Ribes', 'False Black Pepper', NULL, 'Vaivadang, Wauring, ', NULL, NULL, '/storage/photos/1/Final Pic/False Black Pepper.jpg', 0, '', 'active', 1, 1, NULL, 7, '2022-12-29 09:30:14', '2022-12-29 09:30:14'),
(430, 'Test', 'Bombyx Mori', 'Test', 20023, 'Abresham, Silkworms', NULL, 'Silk Pods are made of natural silkworm cocoons, which is ideal for removing blackheads and exfoliating the skin.Your skin can be made from drab to brilliant by using these protected silk cocoons that help the transformation of the silkworm. Any hesitation you may have will be quickly dispelled when you see the imperfectionsthese silky cocoons remove from your skin. The rich silk not only imparts lovely skincare benefits but also gently exfoliates, drawing dirt and dead skin cells like a magnet. \nSericin, also known as \"Natural Moisturizing Factor (NMF)\", has been applauded for having anti-wrinkle and anti-aging benefits, while simultaneously enhancing moisturising and skin elasticity.\nCut holes make it simple to insert your finger and increase the flexibility of cleaning your face. Your face will feel smoother when used with a facial cleanser. \n\nAfter use, you can wash them with warm water and soap. One cocoon can be used again three times.\n', '/storage/photos/1/Final Pic/akarkara thin.jpg', 18, 'new', 'active', 1, 1, NULL, 7, '2023-01-16 05:02:02', '2023-01-16 05:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 121212, '1_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(2, 1, NULL, '1_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(3, 1, NULL, '1_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(4, 1, NULL, '1_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(5, 2, NULL, '2_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(6, 2, NULL, '2_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(7, 2, NULL, '2_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(8, 2, NULL, '2_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(9, 2, NULL, '2_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(10, 2, NULL, '2_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(11, 2, NULL, '2_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(12, 2, NULL, '2_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(13, 3, NULL, '3_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(14, 3, NULL, '3_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(15, 3, NULL, '3_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(16, 3, NULL, '3_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(17, 3, NULL, '3_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(18, 3, NULL, '3_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(19, 3, NULL, '3_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(20, 3, NULL, '3_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(21, 4, NULL, '4_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(22, 4, NULL, '4_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(23, 4, NULL, '4_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(24, 4, NULL, '4_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(25, 4, NULL, '4_Pow_90 g', 'Powder', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(26, 4, NULL, '4_Pow_225 g', 'Powder', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(27, 4, NULL, '4_Pow_450 g', 'Powder', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(28, 4, NULL, '4_Pow_1 kg', 'Powder', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(29, 5, NULL, '5_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(30, 5, NULL, '5_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(31, 5, NULL, '5_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(32, 5, NULL, '5_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(33, 5, NULL, '5_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(34, 5, NULL, '5_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(35, 5, NULL, '5_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(36, 5, NULL, '5_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(37, 6, NULL, '6_Raw_90 g', 'Raw', '90 g', 90.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(38, 6, NULL, '6_Raw_225 g', 'Raw', '225 g', 202.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(39, 6, NULL, '6_Raw_450 g', 'Raw', '450 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(40, 6, NULL, '6_Raw_1 kg', 'Raw', '1 kg', 700.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(41, 6, NULL, '6_Pow_90 g', 'Powder', '90 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(42, 6, NULL, '6_Pow_225 g', 'Powder', '225 g', 243.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(43, 6, NULL, '6_Pow_450 g', 'Powder', '450 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(44, 6, NULL, '6_Pow_1 kg', 'Powder', '1 kg', 840.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(45, 7, NULL, '7_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(46, 7, NULL, '7_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(47, 7, NULL, '7_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(48, 7, NULL, '7_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(49, 7, NULL, '7_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(50, 7, NULL, '7_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(51, 7, NULL, '7_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(52, 7, NULL, '7_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(53, 8, NULL, '8_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(54, 8, NULL, '8_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(55, 8, NULL, '8_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(56, 8, NULL, '8_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(57, 8, NULL, '8_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(58, 8, NULL, '8_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(59, 8, NULL, '8_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(60, 8, NULL, '8_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(61, 9, NULL, '9_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(62, 9, NULL, '9_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(63, 9, NULL, '9_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(64, 9, NULL, '9_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(65, 10, NULL, '10_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(66, 10, NULL, '10_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(67, 10, NULL, '10_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(68, 10, NULL, '10_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(69, 11, NULL, '11_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(70, 11, NULL, '11_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(71, 11, NULL, '11_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(72, 11, NULL, '11_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(73, 11, NULL, '11_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(74, 11, NULL, '11_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(75, 11, NULL, '11_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(76, 11, NULL, '11_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(77, 12, NULL, '12_Raw_90 g', 'Raw', '90 g', 11.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(78, 12, NULL, '12_Raw_225 g', 'Raw', '225 g', 25.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(79, 12, NULL, '12_Raw_450 g', 'Raw', '450 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(80, 12, NULL, '12_Raw_1 kg', 'Raw', '1 kg', 87.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(81, 13, NULL, '13_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(82, 13, NULL, '13_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(83, 13, NULL, '13_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(84, 13, NULL, '13_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(85, 13, NULL, '13_Pow_90 g', 'Powder', '90 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(86, 13, NULL, '13_Pow_225 g', 'Powder', '225 g', 15.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(87, 13, NULL, '13_Pow_450 g', 'Powder', '450 g', 26.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(88, 13, NULL, '13_Pow_1 kg', 'Powder', '1 kg', 50.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(89, 14, NULL, '14_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(90, 14, NULL, '14-Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(91, 14, NULL, '14-Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(92, 14, NULL, '14_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(93, 14, NULL, '14_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(94, 14, NULL, '14_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(95, 14, NULL, '14_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(96, 14, NULL, '14_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(97, 15, NULL, '15_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(98, 15, NULL, '15_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(99, 15, NULL, '15_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(100, 15, NULL, '15_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(109, 17, NULL, '17_Raw_90 g', 'Raw', '90 g', 76.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(110, 17, NULL, '17_Raw_225 g', 'Raw', '225 g', 94.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(111, 17, NULL, '17_Raw_450 g', 'Raw', '450 g', 112.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(112, 17, NULL, '17_Raw_1 kg', 'Raw', '1 kg', 144.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(113, 17, NULL, '17_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(114, 17, NULL, '17_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(115, 17, NULL, '17_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(116, 17, NULL, '17_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(117, 18, NULL, '18_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(118, 18, NULL, '18_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(119, 18, NULL, '18_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(120, 18, NULL, '18_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(121, 18, NULL, '18_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(122, 18, NULL, '18_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(123, 18, NULL, '18_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(124, 18, NULL, '18_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(125, 19, NULL, '19_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(126, 19, NULL, '19_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(127, 19, NULL, '19_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(128, 19, NULL, '19_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(129, 20, NULL, '20_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(130, 20, NULL, '20_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(131, 20, NULL, '20_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(132, 20, NULL, '20_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(133, 20, NULL, '20_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(134, 20, NULL, '20_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(135, 20, NULL, '20_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(136, 20, NULL, '20_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(137, 21, NULL, '21_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(138, 21, NULL, '21_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(139, 21, NULL, '21_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(140, 21, NULL, '21_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(141, 21, NULL, '21_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(142, 21, NULL, '21_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(143, 21, NULL, '21_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(144, 21, NULL, '21_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(145, 22, NULL, '22_Pow_90 g', 'Powder', '90 g', 17.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(146, 22, NULL, '22_Pow_225 g', 'Powder', '225 g', 39.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(147, 22, NULL, '22_Pow_450 g', 'Powder', '450 g', 69.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(148, 22, NULL, '22_Pow_1 kg', 'Powder', '1 kg', 134.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(149, 22, NULL, '22_Raw_90 g', 'Raw', '90 g', 14.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(150, 22, NULL, '22_Raw_225 g', 'Raw', '225 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(151, 22, NULL, '22_Raw_450 g', 'Raw', '450 g', 57.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(152, 22, NULL, '22_Raw_1 kg', 'Raw', '1 kg', 112.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(153, 23, NULL, '23_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(154, 23, NULL, '23_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(155, 23, NULL, '23_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(156, 23, NULL, '23_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(157, 23, NULL, '23_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(158, 23, NULL, '23_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(159, 23, NULL, '23_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(160, 23, NULL, '23_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(161, 24, NULL, '24_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(162, 24, NULL, '24_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(163, 24, NULL, '24_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(164, 24, NULL, '24_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(165, 24, NULL, '24_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(166, 24, NULL, '24_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(167, 24, NULL, '24_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(168, 24, NULL, '24_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(169, 25, NULL, '25_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(170, 25, NULL, '25_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(171, 25, NULL, '25_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(172, 25, NULL, '25_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(173, 25, NULL, '25_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(174, 25, NULL, '25_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(175, 25, NULL, '25_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(176, 25, NULL, '25_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(177, 26, NULL, '26_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(178, 26, NULL, '26_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(179, 26, NULL, '26_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(180, 26, NULL, '26_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(181, 26, NULL, '26_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(182, 26, NULL, '26_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(183, 26, NULL, '26_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(184, 26, NULL, '26_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(185, 27, NULL, '27_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(186, 27, NULL, '27_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(187, 27, NULL, '27_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(188, 27, NULL, '27_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(189, 27, NULL, '27_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(190, 27, NULL, '27_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(191, 27, NULL, '27_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(192, 27, NULL, '27_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(193, 28, NULL, '28_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(194, 28, NULL, '28_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(195, 28, NULL, '28_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(196, 28, NULL, '28_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(197, 28, NULL, '28_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(198, 28, NULL, '28_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(199, 28, NULL, '28_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(200, 28, NULL, '28_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(201, 29, NULL, '29_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(202, 29, NULL, '29_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(203, 29, NULL, '29_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(204, 29, NULL, '29_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(205, 30, NULL, '30_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(206, 30, NULL, '30_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(207, 30, NULL, '30_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(208, 30, NULL, '30_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(209, 30, NULL, '30_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(210, 30, NULL, '30_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(211, 30, NULL, '30_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(212, 30, NULL, '30_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(213, 31, NULL, '31_Pow_90 g', 'Powder', '90 g', 324.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(214, 31, NULL, '31_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(215, 31, NULL, '31_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(216, 31, NULL, '31_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(217, 31, NULL, '31_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(218, 31, NULL, '31_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(219, 31, NULL, '31_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(220, 31, NULL, '31_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(221, 32, NULL, '32_Raw_90 g', 'Raw', '90 g', 90.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(222, 32, NULL, '32_Raw_225 g', 'Raw', '225 g', 202.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(223, 32, NULL, '32_Raw_450 g', 'Raw', '450 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(224, 32, NULL, '32_Raw_1 kg', 'Raw', '1 kg', 700.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(225, 33, NULL, '33_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(226, 33, NULL, '33_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(227, 33, NULL, '33_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(228, 33, NULL, '33_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(229, 33, NULL, '33_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(230, 33, NULL, '33_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(231, 33, NULL, '33_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(232, 33, NULL, '33_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(233, 34, NULL, '34_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(234, 34, NULL, '34_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(235, 34, NULL, '34_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(236, 34, NULL, '34_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(237, 35, NULL, '35_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(238, 35, NULL, '35_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(239, 35, NULL, '35_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(240, 35, NULL, '35_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(241, 35, NULL, '35_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(242, 35, NULL, '35_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(243, 35, NULL, '35_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(244, 35, NULL, '35_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(245, 36, NULL, '36_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(246, 36, NULL, '36_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(247, 36, NULL, '36_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(248, 36, NULL, '36_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(249, 36, NULL, '36_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(250, 36, NULL, '36_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(251, 36, NULL, '36_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(252, 36, NULL, '36_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(253, 37, NULL, '37_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(254, 37, NULL, '37_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(255, 37, NULL, '37_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(256, 37, NULL, '37_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(257, 37, NULL, '37_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(258, 37, NULL, '37_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(259, 37, NULL, '37_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(260, 37, NULL, '37_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(261, 38, NULL, '38_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(262, 38, NULL, '38_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(263, 38, NULL, '38_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(264, 38, NULL, '38_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(265, 38, NULL, '38_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(266, 38, NULL, '38_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(267, 38, NULL, '38_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(268, 38, NULL, '38_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(269, 39, NULL, '39_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(270, 39, NULL, '39_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(271, 39, NULL, '39_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(272, 39, NULL, '39_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(273, 39, NULL, '39_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(274, 39, NULL, '39_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(275, 39, NULL, '39_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(276, 39, NULL, '39_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(277, 40, NULL, '40_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(278, 40, NULL, '40_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(279, 40, NULL, '40_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(280, 40, NULL, '40_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(281, 40, NULL, '40_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(282, 40, NULL, '40_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(283, 40, NULL, '40_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(284, 40, NULL, '40_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(285, 41, NULL, '41_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(286, 41, NULL, '41_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(287, 41, NULL, '41_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(288, 41, NULL, '41_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(289, 41, NULL, '41_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(290, 41, NULL, '41_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(291, 41, NULL, '41_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(292, 41, NULL, '41_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(293, 42, NULL, '42_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(294, 42, NULL, '42_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(295, 42, NULL, '42_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(296, 42, NULL, '42_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(297, 43, NULL, '43_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(298, 43, NULL, '43_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(299, 43, NULL, '43_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(300, 43, NULL, '43_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(301, 44, NULL, '44_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(302, 44, NULL, '44_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(303, 44, NULL, '44_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(304, 44, NULL, '44_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(305, 44, NULL, '44_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(306, 44, NULL, '44_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(307, 44, NULL, '44_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(308, 44, NULL, '44_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(309, 45, NULL, '45_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(310, 45, NULL, '45_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(311, 45, NULL, '45_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(312, 45, NULL, '45_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(313, 45, NULL, '45_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(314, 45, NULL, '45_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(315, 45, NULL, '45_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(316, 45, NULL, '45_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(317, 46, NULL, '46_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(318, 46, NULL, '46_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(319, 46, NULL, '46_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(320, 46, NULL, '46_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(321, 46, NULL, '46_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(322, 46, NULL, '46_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(323, 46, NULL, '46_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(324, 46, NULL, '46_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(325, 47, NULL, '47_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(326, 47, NULL, '47_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(327, 47, NULL, '47_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(328, 47, NULL, '47_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(329, 47, NULL, '47_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(330, 47, NULL, '47_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(331, 47, NULL, '47_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(332, 47, NULL, '47_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(333, 48, NULL, '48_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(334, 48, NULL, '48_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(335, 48, NULL, '48_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(336, 48, NULL, '48_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(337, 49, NULL, '49_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(338, 49, NULL, '49_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(339, 49, NULL, '49_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(340, 49, NULL, '49_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(341, 50, NULL, '50_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(342, 50, NULL, '50_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(343, 50, NULL, '50_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(344, 50, NULL, '50_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(345, 51, NULL, '51_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(346, 51, NULL, '51_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(347, 51, NULL, '51_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(348, 51, NULL, '51_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(349, 51, NULL, '51_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(350, 51, NULL, '51_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(351, 51, NULL, '51_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(352, 51, NULL, '51_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(353, 52, NULL, '52_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(354, 52, NULL, '52_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(355, 52, NULL, '52_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(356, 52, NULL, '52_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(357, 52, NULL, '52_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(358, 52, NULL, '52_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(359, 52, NULL, '52_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(360, 52, NULL, '52_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(361, 53, NULL, '53_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(362, 53, NULL, '53_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(363, 53, NULL, '53_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(364, 53, NULL, '53_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(365, 53, NULL, '53_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(366, 53, NULL, '53_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(367, 53, NULL, '53_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(368, 53, NULL, '53_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(369, 54, NULL, '54_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(370, 54, NULL, '54_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(371, 54, NULL, '54_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(372, 54, NULL, '54_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(373, 55, NULL, '55_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(374, 55, NULL, '55_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(375, 55, NULL, '55_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(376, 55, NULL, '55_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(377, 55, NULL, '55_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(378, 55, NULL, '55_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(379, 55, NULL, '55_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(380, 55, NULL, '55_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(381, 56, NULL, '56_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(382, 56, NULL, '56_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(383, 56, NULL, '56_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(384, 56, NULL, '56_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(385, 57, NULL, '57_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(386, 57, NULL, '57_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(387, 57, NULL, '57_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(388, 57, NULL, '57_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(389, 58, NULL, '58_Pow_90 g', 'Powder', '90 g', 15.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(390, 58, NULL, '58_Pow_225 g', 'Powder', '225 g', 34.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(391, 58, NULL, '58_Pow_450 g', 'Powder', '450 g', 62.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(392, 58, NULL, '58_Pow_1 kg', 'Powder', '1 kg', 120.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(393, 58, NULL, '58_Raw_90 g', 'Raw', '90 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(394, 58, NULL, '58_Raw_225 g', 'Raw', '225 g', 29.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(395, 58, NULL, '58_Raw_450 g', 'Raw', '450 g', 51.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(396, 58, NULL, '58_Raw_1 kg', 'Raw', '1 kg', 100.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(397, 59, NULL, '59_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(398, 59, NULL, '59_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(399, 59, NULL, '59_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(400, 59, NULL, '59_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(401, 59, NULL, '59_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(402, 59, NULL, '59_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(403, 59, NULL, '59_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(404, 59, NULL, '59_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(405, 60, NULL, '60_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(406, 60, NULL, '60_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(407, 60, NULL, '60_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(408, 60, NULL, '60_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(409, 61, NULL, '61_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(410, 61, NULL, '61_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(411, 61, NULL, '61_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(412, 61, NULL, '61_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(413, 61, NULL, '61_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05');
INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(414, 61, NULL, '61_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(415, 61, NULL, '61_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(416, 61, NULL, '61_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(417, 62, NULL, '62_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(418, 62, NULL, '62_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(419, 62, NULL, '62_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(420, 62, NULL, '62_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(421, 62, NULL, '62_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(422, 62, NULL, '62_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(423, 62, NULL, '62_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(424, 62, NULL, '62_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(425, 63, NULL, '63_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(426, 63, NULL, '63_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(427, 63, NULL, '63_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(428, 63, NULL, '63_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(429, 64, NULL, '64_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(430, 64, NULL, '64_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(431, 64, NULL, '64_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(432, 64, NULL, '64_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(433, 64, NULL, '64_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(434, 64, NULL, '64_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(435, 64, NULL, '64_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(436, 64, NULL, '64_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(437, 65, NULL, '65_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(438, 65, NULL, '65_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(439, 65, NULL, '65_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(440, 65, NULL, '65_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(441, 65, NULL, '65_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(442, 65, NULL, '65_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(443, 65, NULL, '65_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(444, 65, NULL, '65_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(445, 66, NULL, '66_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(446, 66, NULL, '66_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(447, 66, NULL, '66_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(448, 66, NULL, '66_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(449, 67, NULL, '67_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(450, 67, NULL, '67_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(451, 67, NULL, '67_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(452, 67, NULL, '67_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(453, 67, NULL, '67_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(454, 67, NULL, '67_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(455, 67, NULL, '67_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(456, 67, NULL, '67_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(457, 68, NULL, '68_Pow_90 g', 'Powder', '90 g', 7.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(458, 68, NULL, '68_Pow_225 g', 'Powder', '225 g', 17.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(459, 68, NULL, '68_Pow_450 g', 'Powder', '450 g', 30.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(460, 68, NULL, '68_Pow_1 kg', 'Powder', '1 kg', 59.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(461, 68, NULL, '68_Raw_90 g', 'Raw', '90 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(462, 68, NULL, '68_Raw_225 g', 'Raw', '225 g', 14.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(463, 68, NULL, '68_Raw_450 g', 'Raw', '450 g', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(464, 68, NULL, '68_Raw_1 kg', 'Raw', '1 kg', 49.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(465, 69, NULL, '69_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(466, 69, NULL, '69_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(467, 69, NULL, '69_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(468, 69, NULL, '69_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(469, 69, NULL, '69_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(470, 69, NULL, '69_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(471, 69, NULL, '69_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(472, 69, NULL, '69_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(473, 70, NULL, '70_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(474, 70, NULL, '70_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(475, 70, NULL, '70_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(476, 70, NULL, '70_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(477, 70, NULL, '70_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(478, 70, NULL, '70_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(479, 70, NULL, '70_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(480, 70, NULL, '70_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(481, 71, NULL, '71_Pow_90 g', 'Powder', '90 g', 1.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(482, 71, NULL, '71_Pow_225 g', 'Powder', '225 g', 3.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(483, 71, NULL, '71_Pow_450 g', 'Powder', '450 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(484, 71, NULL, '71_Pow_1 kg', 'Powder', '1 kg', 12.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(485, 71, NULL, '71_Raw_90 g', 'Raw', '90 g', 1.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(486, 71, NULL, '71_Raw_225 g', 'Raw', '225 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(487, 71, NULL, '71_Raw_450 g', 'Raw', '450 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(488, 71, NULL, '71_Raw_1 kg', 'Raw', '1 kg', 10.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(489, 72, NULL, '72_Raw_90 g', 'Raw', '90 g', 7.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(490, 72, NULL, '72_Raw_225 g', 'Raw', '225 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(491, 72, NULL, '72_Raw_450 g', 'Raw', '450 g', 29.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(492, 72, NULL, '72_Raw_1 kg', 'Raw', '1 kg', 56.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(493, 73, NULL, '73_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(494, 73, NULL, '73_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(495, 73, NULL, '73_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(496, 73, NULL, '73_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(497, 73, NULL, '73_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(498, 73, NULL, '73_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(499, 73, NULL, '73_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(500, 73, NULL, '73_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(501, 74, NULL, '74_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(502, 74, NULL, '74_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(503, 74, NULL, '74_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(504, 74, NULL, '74_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(505, 74, NULL, '74_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(506, 74, NULL, '74_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(507, 74, NULL, '74_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(508, 74, NULL, '74_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(509, 75, NULL, '75_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(510, 75, NULL, '75_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(511, 75, NULL, '75_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(512, 75, NULL, '75_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(513, 75, NULL, '75_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(514, 75, NULL, '75_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(515, 75, NULL, '75_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(516, 75, NULL, '75_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(517, 76, NULL, '76_Pow_90 g', 'Powder', '90 g', 65.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(518, 76, NULL, '76_Pow_225 g', 'Powder', '225 g', 146.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(519, 76, NULL, '76_Pow_450 g', 'Powder', '450 g', 259.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(520, 76, NULL, '76_Pow_1 kg', 'Powder', '1 kg', 504.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(521, 76, NULL, '76_Raw_90 g', 'Raw', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(522, 76, NULL, '76_Raw_225 g', 'Raw', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(523, 76, NULL, '76_Raw_450 g', 'Raw', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(524, 76, NULL, '76_Raw_1 kg', 'Raw', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(525, 77, NULL, '77_Pow_90 g', 'Powder', '90 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(526, 77, NULL, '77_Pow_225 g', 'Powder', '225 g', 194.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(527, 77, NULL, '77_Pow_450 g', 'Powder', '450 g', 345.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(528, 77, NULL, '77_Pow_1 kg', 'Powder', '1 kg', 672.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(529, 77, NULL, '77_Raw_90 g', 'Raw', '90 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(530, 77, NULL, '77_Raw_225 g', 'Raw', '225 g', 162.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(531, 77, NULL, '77_Raw_450 g', 'Raw', '450 g', 288.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(532, 77, NULL, '77_Raw_1 kg', 'Raw', '1 kg', 560.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(533, 78, NULL, '78_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(534, 78, NULL, '78_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(535, 78, NULL, '78_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(536, 78, NULL, '78_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(537, 78, NULL, '78_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(538, 78, NULL, '78_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(539, 78, NULL, '78_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(540, 78, NULL, '78_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(541, 79, NULL, '79_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(542, 79, NULL, '79_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(543, 79, NULL, '79_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(544, 79, NULL, '79_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(545, 79, NULL, '79_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(546, 79, NULL, '79_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(547, 79, NULL, '79_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(548, 79, NULL, '79_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(549, 80, NULL, '80_Raw_90 g', 'Raw', '90 g', 7.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(550, 80, NULL, '80_Raw_225 g', 'Raw', '225 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(551, 80, NULL, '80_Raw_450 g', 'Raw', '450 g', 29.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(552, 80, NULL, '80_Raw_1 kg', 'Raw', '1 kg', 56.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(553, 81, NULL, '81_Pow_90 g', 'Powder', '90 g', 8.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(554, 81, NULL, '81_Pow_225 g', 'Powder', '225 g', 18.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(555, 81, NULL, '81_Pow_450 g', 'Powder', '450 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(556, 81, NULL, '81_Pow_1 kg', 'Powder', '1 kg', 63.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(557, 81, NULL, '81_Raw_90 g', 'Raw', '90 g', 6.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(558, 81, NULL, '81_Raw_225 g', 'Raw', '225 g', 15.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(559, 81, NULL, '81_Raw_450 g', 'Raw', '450 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(560, 81, NULL, '81_Raw_1 kg', 'Raw', '1 kg', 52.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(561, 82, NULL, '82_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(562, 82, NULL, '82_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(563, 82, NULL, '82_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(564, 82, NULL, '82_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(565, 82, NULL, '82_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(566, 82, NULL, '82_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(567, 82, NULL, '82_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(568, 82, NULL, '82_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(569, 83, NULL, '83_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(570, 83, NULL, '83_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(571, 83, NULL, '83_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(572, 83, NULL, '83_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(573, 84, NULL, '84_Raw_90 g', 'Raw', '90 g', 6.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(574, 84, NULL, '84_Raw_225 g', 'Raw', '225 g', 15.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(575, 84, NULL, '84_Raw_450 g', 'Raw', '450 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(576, 84, NULL, '84_Raw_1 kg', 'Raw', '1 kg', 52.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(577, 85, NULL, '85_Pow_90 g', 'Powder', '90 g', 56.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(578, 85, NULL, '85_Pow_225 g', 'Powder', '225 g', 127.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(579, 85, NULL, '85_Pow_450 g', 'Powder', '450 g', 227.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(580, 85, NULL, '85_Pow_1 kg', 'Powder', '1 kg', 441.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(581, 85, NULL, '85_Raw_90 g', 'Raw', '90 g', 47.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(582, 85, NULL, '85_Raw_225 g', 'Raw', '225 g', 106.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(583, 85, NULL, '85_Raw_450 g', 'Raw', '450 g', 189.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(584, 85, NULL, '85_Raw_1 kg', 'Raw', '1 kg', 367.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(585, 86, NULL, '86_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(586, 86, NULL, '86_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(587, 86, NULL, '86_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(588, 86, NULL, '86_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(589, 86, NULL, '86_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(590, 86, NULL, '86_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(591, 86, NULL, '86_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(592, 86, NULL, '86_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(593, 87, NULL, '87_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(594, 87, NULL, '87_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(595, 87, NULL, '87_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(596, 87, NULL, '87_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(597, 87, NULL, '87_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(598, 87, NULL, '87_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(599, 87, NULL, '87_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(600, 87, NULL, '87_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(601, 88, NULL, '88_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(602, 88, NULL, '88_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(603, 88, NULL, '88_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(604, 88, NULL, '88_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(605, 88, NULL, '88_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(606, 88, NULL, '88_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(607, 88, NULL, '88_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(608, 88, NULL, '88_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(609, 89, NULL, '89_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(610, 89, NULL, '89_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(611, 89, NULL, '89_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(612, 89, NULL, '89_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(613, 89, NULL, '89_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(614, 89, NULL, '89_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(615, 89, NULL, '89_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(616, 89, NULL, '89_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(617, 90, NULL, '90_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(618, 90, NULL, '90_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(619, 90, NULL, '90_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(620, 90, NULL, '90_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(621, 91, NULL, '91_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(622, 91, NULL, '91_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(623, 91, NULL, '91_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(624, 81, NULL, '91_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(625, 91, NULL, '91_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(626, 91, NULL, '91_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(627, 91, NULL, '91_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(628, 91, NULL, '91_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(629, 92, NULL, '92_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(630, 92, NULL, '92_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(631, 92, NULL, '92_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(632, 92, NULL, '92_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(633, 93, NULL, '93_Pow_90 g', 'Powder', '90 g', 65.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(634, 93, NULL, '93_Pow_225 g', 'Powder', '225 g', 146.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(635, 93, NULL, '93_Pow_450 g', 'Powder', '450 g', 259.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(636, 93, NULL, '93_Pow_1 kg', 'Powder', '1 kg', 504.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(637, 93, NULL, '93_Raw_90 g', 'Raw', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(638, 93, NULL, '93_Raw_225 g', 'Raw', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(639, 93, NULL, '93_Raw_450 g', 'Raw', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(640, 93, NULL, '93_Raw_1 kg', 'Raw', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(641, 94, NULL, '94_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(642, 94, NULL, '94_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(643, 94, NULL, '94_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(644, 94, NULL, '94_Pow_1 kg', 'Powder', '1 kg', 296.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(645, 94, NULL, '94_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(646, 94, NULL, '94_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(647, 94, NULL, '94_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(648, 94, NULL, '94_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(649, 95, NULL, '95_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(650, 95, NULL, '95_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(651, 95, NULL, '95_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(652, 95, NULL, '95_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(653, 95, NULL, '95_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(654, 95, NULL, '95_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(655, 95, NULL, '95_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(656, 95, NULL, '95_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(657, 96, NULL, '96_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(658, 96, NULL, '96_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(659, 96, NULL, '96_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(660, 96, NULL, '96_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(661, 96, NULL, '96_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(662, 96, NULL, '96_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(663, 96, NULL, '96_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(664, 96, NULL, '96_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(665, 97, NULL, '97_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(666, 97, NULL, '97_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(667, 97, NULL, '97_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(668, 97, NULL, '97_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(669, 97, NULL, '97_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(670, 97, NULL, '97_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(671, 97, NULL, '97_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(672, 97, NULL, '97_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(673, 98, NULL, '98_Pow_90 g', 'Powder', '90 g', 8.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(674, 98, NULL, '98_Pow_225 g', 'Powder', '225 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(675, 98, NULL, '98_Pow_450 g', 'Powder', '450 g', 34.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(676, 98, NULL, '98_Pow_1 kg', 'Powder', '1 kg', 59.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(677, 98, NULL, '98_Raw_90 g', 'Raw', '90 g', 7.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(678, 98, NULL, '98_Raw_225 g', 'Raw', '225 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(679, 98, NULL, '98_Raw_450 g', 'Raw', '450 g', 29.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(680, 98, NULL, '98_Raw_1 kg', 'Raw', '1 kg', 56.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(681, 99, NULL, '99_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(682, 99, NULL, '99_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(683, 99, NULL, '99_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(684, 99, NULL, '99_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(685, 99, NULL, '99_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(686, 99, NULL, '99_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(687, 99, NULL, '99_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(688, 99, NULL, '99_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(689, 100, NULL, '100_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(690, 100, NULL, '100_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(691, 100, NULL, '100_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(692, 100, NULL, '100_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(693, 100, NULL, '100_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(694, 100, NULL, '100_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(695, 100, NULL, '100_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(696, 100, NULL, '100_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(697, 101, NULL, '101_Pow_90 g', 'Powder', '90 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(698, 101, NULL, '101_Pow_225 g', 'Powder', '225 g', 43.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(699, 101, NULL, '101_Pow_450 g', 'Powder', '450 g', 78.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(700, 101, NULL, '101_Pow_1 kg', 'Powder', '1 kg', 151.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(701, 101, NULL, '101_Raw_90 g', 'Raw', '90 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(702, 101, NULL, '101_Raw_225 g', 'Raw', '225 g', 36.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(703, 101, NULL, '101_Raw_450 g', 'Raw', '450 g', 65.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(704, 101, NULL, '101_Raw_1 kg', 'Raw', '1 kg', 126.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(705, 102, NULL, '102_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(706, 102, NULL, '102_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(707, 102, NULL, '102_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(708, 102, NULL, '102_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(709, 102, NULL, '102_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(710, 102, NULL, '102_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(711, 102, NULL, '102_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(712, 102, NULL, '102_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(713, 103, NULL, '103_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(714, 103, NULL, '103_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(715, 103, NULL, '103_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(716, 103, NULL, '103_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(717, 104, NULL, '104_Raw_90 g', 'Raw', '90 g', 13.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(718, 104, NULL, '104_Raw_225 g', 'Raw', '225 g', 30.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(719, 104, NULL, '104_Raw_450 g', 'Raw', '450 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(720, 104, NULL, '104_Raw_1 kg', 'Raw', '1 kg', 105.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(721, 105, NULL, '105_Raw_90 g', 'Raw', '90 g', 13.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(722, 105, NULL, '105_Raw_225 g', 'Raw', '225 g', 30.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(723, 105, NULL, '105_Raw_450 g', 'Raw', '450 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(724, 105, NULL, '105_Raw_1 kg', 'Raw', '1 kg', 105.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(725, 106, NULL, '106_Raw_90 g', 'Raw', '90 g', 7.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(726, 106, NULL, '106_Raw_225 g', 'Raw', '225 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(727, 106, NULL, '106_Raw_450 g', 'Raw', '450 g', 29.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(728, 106, NULL, '106_Raw_1 kg', 'Raw', '1 kg', 56.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(729, 107, NULL, '107_Pow_90 g', 'Powder', '90 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(730, 107, NULL, '107_Pow_225 g', 'Powder', '225 g', 43.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(731, 107, NULL, '107_Pow_450 g', 'Powder', '450 g', 78.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(732, 107, NULL, '107_Pow_1 kg', 'Powder', '1 kg', 151.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(733, 107, NULL, '107_Raw_90 g', 'Raw', '90 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(734, 107, NULL, '107_Raw_225 g', 'Raw', '225 g', 36.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(735, 107, NULL, '107_Raw_450 g', 'Raw', '450 g', 65.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(736, 107, NULL, '107_Raw_1 kg', 'Raw', '1 kg', 126.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(737, 108, NULL, '108_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(738, 108, NULL, '108_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(739, 108, NULL, '108_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(740, 108, NULL, '108_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(741, 109, NULL, '109_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(742, 109, NULL, '109_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(743, 109, NULL, '109_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(744, 109, NULL, '109_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(745, 109, NULL, '109_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(746, 109, NULL, '109_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(747, 109, NULL, '109_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(748, 109, NULL, '109_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(749, 110, NULL, '110_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(750, 110, NULL, '110_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(751, 110, NULL, '110_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(752, 110, NULL, '110_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(753, 110, NULL, '110_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(754, 110, NULL, '110_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(755, 110, NULL, '110_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(756, 110, NULL, '110_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(757, 111, NULL, '111_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(758, 111, NULL, '111_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(759, 111, NULL, '111_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(760, 111, NULL, '111_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(761, 111, NULL, '111_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(762, 111, NULL, '111_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(763, 111, NULL, '111_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(764, 111, NULL, '111_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(765, 112, NULL, '112_Pow_90 g', 'Powder', '90 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(766, 112, NULL, '112_Pow_225 g', 'Powder', '225 g', 14.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(767, 112, NULL, '112_Pow_450 g', 'Powder', '450 g', 26.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(768, 112, NULL, '112_Pow_1 kg', 'Powder', '1 kg', 50.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(769, 112, NULL, '112_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(770, 112, NULL, '112_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(771, 112, NULL, '112_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(772, 112, NULL, '112_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(773, 113, NULL, '113_Pow_90 g', 'Powder', '90 g', 11.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(774, 113, NULL, '113_Pow_225 g', 'Powder', '225 g', 25.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(775, 113, NULL, '113_Pow_450 g', 'Powder', '450 g', 45.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(776, 113, NULL, '113_Pow_1 kg', 'Powder', '1 kg', 88.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(777, 113, NULL, '113_Raw_90 g', 'Raw', '90 g', 9.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(778, 113, NULL, '113_Raw_225 g', 'Raw', '225 g', 21.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(779, 113, NULL, '113_Raw_450 g', 'Raw', '450 g', 38.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(780, 113, NULL, '113_Raw_1 kg', 'Raw', '1 kg', 73.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(781, 114, NULL, '114_Pow_90 g', 'Powder', '90 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(782, 114, NULL, '114_Pow_225 g', 'Powder', '225 g', 14.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(783, 114, NULL, '114_Pow_450 g', 'Powder', '450 g', 26.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(784, 114, NULL, '114_Pow_1 kg', 'Powder', '1 kg', 50.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(785, 114, NULL, '114_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(786, 114, NULL, '114_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(787, 114, NULL, '114_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(788, 114, NULL, '114_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(789, 115, NULL, '115_Pow_90 g', 'Powder', '90 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(790, 115, NULL, '115_Pow_225 g', 'Powder', '225 g', 972.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(791, 115, NULL, '115_Pow_450 g', 'Powder', '450 g', 1728.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(792, 115, NULL, '115_Pow_1 kg', 'Powder', '1 kg', 3360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(793, 115, NULL, '115_Raw_90 g', 'Raw', '90 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(794, 115, NULL, '115_Raw_225 g', 'Raw', '225 g', 810.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(795, 115, NULL, '115_Raw_450 g', 'Raw', '450 g', 1440.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(796, 115, NULL, '115_Raw_1 kg', 'Raw', '1 kg', 2800.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(797, 116, NULL, '116_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(798, 116, NULL, '116_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(799, 116, NULL, '116_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(800, 116, NULL, '116_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(801, 116, NULL, '116_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(802, 116, NULL, '116_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(803, 116, NULL, '116_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(804, 116, NULL, '116_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(805, 117, NULL, '117_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(806, 117, NULL, '117_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(807, 117, NULL, '117_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(808, 117, NULL, '117_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(809, 117, NULL, '117_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(810, 117, NULL, '117_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(811, 117, NULL, '117_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(812, 117, NULL, '117_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(813, 118, NULL, '118_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(814, 118, NULL, '118_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05');
INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(815, 118, NULL, '118_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(816, 118, NULL, '118_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(817, 118, NULL, '118_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(818, 118, NULL, '118_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(819, 118, NULL, '118_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(820, 118, NULL, '118_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(821, 119, NULL, '119_Pow_90 g', 'Powder', '90 g', 39.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(822, 119, NULL, '119_Pow_225 g', 'Powder', '225 g', 87.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(823, 119, NULL, '119_Pow_450 g', 'Powder', '450 g', 155.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(824, 119, NULL, '119_Pow_1 kg', 'Powder', '1 kg', 302.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(825, 119, NULL, '119_Raw_90 g', 'Raw', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(826, 119, NULL, '119_Raw_225 g', 'Raw', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(827, 119, NULL, '119_Raw_450 g', 'Raw', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(828, 119, NULL, '119_Raw_1 kg', 'Raw', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(829, 120, NULL, '120_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(830, 120, NULL, '120_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(831, 120, NULL, '120_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(832, 120, NULL, '120_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(833, 120, NULL, '120_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(834, 120, NULL, '120_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(835, 120, NULL, '120_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(836, 120, NULL, '120_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(837, 121, NULL, '121_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(838, 121, NULL, '121_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(839, 121, NULL, '121_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(840, 121, NULL, '121_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(841, 122, NULL, '122_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(842, 122, NULL, '122_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(843, 122, NULL, '122_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(844, 122, NULL, '122_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(845, 122, NULL, '122_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(846, 122, NULL, '122_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(847, 122, NULL, '122_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(848, 122, NULL, '122_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(849, 123, NULL, '123_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(850, 123, NULL, '123_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(851, 123, NULL, '123_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(852, 123, NULL, '123_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(853, 123, NULL, '123_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(854, 123, NULL, '123_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(855, 123, NULL, '123_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(856, 123, NULL, '123_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(857, 124, NULL, '124_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(858, 124, NULL, '124_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(859, 124, NULL, '124_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(860, 124, NULL, '124_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(861, 124, NULL, '124_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(862, 124, NULL, '124_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(863, 124, NULL, '124_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(864, 124, NULL, '124_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(865, 125, NULL, '125_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(866, 125, NULL, '125_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(867, 125, NULL, '125_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(868, 125, NULL, '125_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(869, 126, NULL, '126_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(870, 126, NULL, '126_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(871, 126, NULL, '126_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(872, 126, NULL, '126_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(873, 126, NULL, '126_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(874, 126, NULL, '126_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(875, 126, NULL, '126_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(876, 126, NULL, '126_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(877, 127, NULL, '127_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(878, 127, NULL, '127_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(879, 127, NULL, '127_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(880, 127, NULL, '127_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(881, 127, NULL, '127_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(882, 127, NULL, '127_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(883, 127, NULL, '127_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(884, 127, NULL, '127_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(885, 128, NULL, '128_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(886, 128, NULL, '128_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(887, 128, NULL, '128_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(888, 128, NULL, '128_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(889, 128, NULL, '128_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(890, 128, NULL, '128_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(891, 128, NULL, '128_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(892, 128, NULL, '128_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(893, 129, NULL, '129_Pow_90 g', 'Powder', '90 g', 6.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(894, 129, NULL, '129_Pow_225 g', 'Powder', '225 g', 14.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(895, 129, NULL, '129_Pow_450 g', 'Powder', '450 g', 26.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(896, 129, NULL, '129_Pow_1 kg', 'Powder', '1 kg', 50.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(897, 129, NULL, '129_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(898, 129, NULL, '129_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(899, 129, NULL, '129_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(900, 129, NULL, '129_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(901, 130, NULL, '130_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(902, 130, NULL, '130_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(903, 130, NULL, '130_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(904, 130, NULL, '130_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(905, 130, NULL, '130_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(906, 130, NULL, '130_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(907, 130, NULL, '130_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(908, 130, NULL, '130_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(909, 131, NULL, '131_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(910, 131, NULL, '131_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(911, 131, NULL, '131_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(912, 131, NULL, '131_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(913, 132, NULL, '132_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(914, 132, NULL, '132_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(915, 132, NULL, '132_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(916, 132, NULL, '132_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(917, 132, NULL, '132_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(918, 132, NULL, '132_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(919, 132, NULL, '132_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(920, 132, NULL, '132_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(921, 133, NULL, '133_Raw_90 g', 'Raw', '90 g', 20.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(922, 133, NULL, '133_Raw_225 g', 'Raw', '225 g', 44.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(923, 133, NULL, '133_Raw_450 g', 'Raw', '450 g', 79.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(924, 133, NULL, '133_Raw_1 kg', 'Raw', '1 kg', 154.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(925, 134, NULL, '134_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(926, 134, NULL, '134_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(927, 134, NULL, '134_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(928, 134, NULL, '134_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(929, 135, NULL, '135_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(930, 135, NULL, '135_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(931, 135, NULL, '135_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(932, 135, NULL, '135_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(933, 135, NULL, '135_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(934, 135, NULL, '135_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(935, 135, NULL, '135_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(936, 135, NULL, '135_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(937, 136, NULL, '136_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(938, 136, NULL, '136_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(939, 136, NULL, '136_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(940, 136, NULL, '136_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(941, 136, NULL, '136_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(942, 136, NULL, '136_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(943, 136, NULL, '136_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(944, 136, NULL, '136_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(945, 137, NULL, '137_Raw_90 g', 'Raw', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(946, 137, NULL, '137_Raw_225 g', 'Raw', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(947, 137, NULL, '137_Raw_450 g', 'Raw', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(948, 137, NULL, '137_Raw_1 kg', 'Raw', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(949, 138, NULL, '138_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(950, 138, NULL, '138_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(951, 138, NULL, '138_Raw_450 g', 'Raw', '450 g', 182.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(952, 138, NULL, '138_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(953, 139, NULL, '139_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(954, 139, NULL, '139_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(955, 139, NULL, '139_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(956, 139, NULL, '139_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(957, 140, NULL, '140_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(958, 140, NULL, '140_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(959, 140, NULL, '140_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(960, 140, NULL, '140_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(961, 141, NULL, '141_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(962, 141, NULL, '141_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(963, 141, NULL, '141_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(964, 141, NULL, '141_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(965, 142, NULL, '142_Pow_90 g', 'Powder', '90 g', 1296.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(966, 142, NULL, '142_Pow_225 g', 'Powder', '225 g', 2916.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(967, 142, NULL, '142_Pow_450 g', 'Powder', '450 g', 5184.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(968, 142, NULL, '142_Pow_1 kg', 'Powder', '1 kg', 10080.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(969, 142, NULL, '142_Raw_90 g', 'Raw', '90 g', 1080.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(970, 142, NULL, '142_Raw_225 g', 'Raw', '225 g', 2430.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(971, 142, NULL, '142_Raw_450 g', 'Raw', '450 g', 4320.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(972, 142, NULL, '142_Raw_1 kg', 'Raw', '1 kg', 8400.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(973, 143, NULL, '143_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(974, 143, NULL, '143_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(975, 143, NULL, '143_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(976, 143, NULL, '143_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(977, 143, NULL, '143_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(978, 143, NULL, '143_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(979, 143, NULL, '143_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(980, 143, NULL, '143_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(981, 144, NULL, '144_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(982, 144, NULL, '144_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(983, 144, NULL, '144_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(984, 144, NULL, '144_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(985, 145, NULL, '145_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(986, 145, NULL, '145_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(987, 145, NULL, '145_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(988, 145, NULL, '145_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(989, 145, NULL, '145_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(990, 145, NULL, '145_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(991, 145, NULL, '145_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(992, 145, NULL, '145_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(993, 146, NULL, '146_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(994, 146, NULL, '146_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(995, 146, NULL, '146_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(996, 146, NULL, '146_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(997, 146, NULL, '146_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(998, 146, NULL, '146_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(999, 146, NULL, '146_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1000, 146, NULL, '146_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1001, 147, NULL, '147_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1002, 147, NULL, '147_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1003, 147, NULL, '147_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1004, 147, NULL, '147_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1005, 147, NULL, '147_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1006, 147, NULL, '147_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1007, 147, NULL, '147_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1008, 147, NULL, '147_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1009, 148, NULL, '148_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1010, 148, NULL, '148_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1011, 148, NULL, '148_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1012, 148, NULL, '148_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1013, 148, NULL, '148_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1014, 148, NULL, '148_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1015, 148, NULL, '148_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1016, 148, NULL, '148_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1017, 149, NULL, '149_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1018, 149, NULL, '149_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1019, 149, NULL, '149_Pow_450 g', 'Powder', '450 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1020, 149, NULL, '149_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1021, 149, NULL, '149_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1022, 149, NULL, '149_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1023, 149, NULL, '149_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1024, 149, NULL, '149_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1025, 150, NULL, '150_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1026, 150, NULL, '150_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1027, 150, NULL, '150_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1028, 150, NULL, '150_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1029, 150, NULL, '150_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1030, 150, NULL, '150_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1031, 150, NULL, '150_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1032, 150, NULL, '150_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1033, 151, NULL, '151_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1034, 151, NULL, '151_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1035, 151, NULL, '151_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1036, 151, NULL, '151_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1037, 151, NULL, '151_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1038, 151, NULL, '151_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1039, 151, NULL, '151_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1040, 151, NULL, '151_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1041, 152, NULL, '152_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1042, 152, NULL, '152_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1043, 152, NULL, '152_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1044, 152, NULL, '152_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1045, 152, NULL, '152_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1046, 152, NULL, '152_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1047, 152, NULL, '152_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1048, 152, NULL, '152_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1049, 153, NULL, '153_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1050, 153, NULL, '153_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1051, 153, NULL, '153_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1052, 153, NULL, '153_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1053, 153, NULL, '153_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1054, 153, NULL, '153_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1055, 153, NULL, '153_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1056, 153, NULL, '153_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1057, 154, NULL, '154_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1058, 154, NULL, '154_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1059, 154, NULL, '154_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1060, 154, NULL, '154_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1061, 154, NULL, '154_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1062, 154, NULL, '154_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1063, 154, NULL, '154_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1064, 154, NULL, '154_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1065, 155, NULL, '155_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1066, 155, NULL, '155_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1067, 155, NULL, '155_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1068, 155, NULL, '155_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1069, 155, NULL, '155_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1070, 155, NULL, '155_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1071, 155, NULL, '155_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1072, 155, NULL, '155_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1073, 156, NULL, '156_Raw_90 g', 'Raw', '90 g', 15.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1074, 156, NULL, '156_Raw_225 g', 'Raw', '225 g', 34.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1075, 156, NULL, '156_Raw_450 g', 'Raw', '450 g', 61.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1076, 156, NULL, '156_Raw_1 kg', 'Raw', '1 kg', 119.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1077, 157, NULL, '157_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1078, 157, NULL, '157_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1079, 157, NULL, '157_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1080, 157, NULL, '157_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1081, 157, NULL, '157_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1082, 157, NULL, '157_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1083, 157, NULL, '157_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1084, 157, NULL, '157_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1085, 158, NULL, '158_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1086, 158, NULL, '158_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1087, 158, NULL, '158_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1088, 158, NULL, '158_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1089, 158, NULL, '158_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1090, 158, NULL, '158_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1091, 158, NULL, '158_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1092, 158, NULL, '158_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1093, 159, NULL, '159_Pow_90 g', 'Powder', '90 g', 43.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1094, 159, NULL, '159_Pow_225 g', 'Powder', '225 g', 97.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1095, 159, NULL, '159_Pow_450 g', 'Powder', '450 g', 173.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1096, 159, NULL, '159_Pow_1 kg', 'Powder', '1 kg', 336.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1097, 159, NULL, '159_Raw_90 g', 'Raw', '90 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1098, 159, NULL, '159_Raw_225 g', 'Raw', '225 g', 81.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1099, 159, NULL, '159_Raw_450 g', 'Raw', '450 g', 144.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1100, 159, NULL, '159_Raw_1 kg', 'Raw', '1 kg', 280.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1101, 160, NULL, '160_Pow_90 g', 'Powder', '90 g', 22.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1102, 160, NULL, '160_Pow_225 g', 'Powder', '225 g', 51.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1103, 160, NULL, '160_Pow_450 g', 'Powder', '450 g', 90.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1104, 160, NULL, '160_Pow_1 kg', 'Powder', '1 kg', 176.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1105, 160, NULL, '160_Raw_90 g', 'Raw', '90 g', 19.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1106, 160, NULL, '160_Raw_225 g', 'Raw', '225 g', 42.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1107, 160, NULL, '160_Raw_450 g', 'Raw', '450 g', 75.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1108, 160, NULL, '160_Raw_1 kg', 'Raw', '1 kg', 147.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1109, 161, NULL, '161_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1110, 161, NULL, '161_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1111, 161, NULL, '161_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1112, 161, NULL, '161_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1113, 162, NULL, '162_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1114, 162, NULL, '162_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1115, 162, NULL, '162_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1116, 162, NULL, '162_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1117, 162, NULL, '162_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1118, 162, NULL, '162_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1119, 162, NULL, '162_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1120, 162, NULL, '162_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1121, 163, NULL, '163_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1122, 163, NULL, '163_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1123, 163, NULL, '163_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1124, 163, NULL, '163_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1125, 163, NULL, '163_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1126, 163, NULL, '163_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1127, 163, NULL, '163_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1128, 163, NULL, '163_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1129, 164, NULL, '164_Raw_90 g', 'Raw', '90 g', 3.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1130, 164, NULL, '164_Raw_225 g', 'Raw', '225 g', 8.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1131, 164, NULL, '164_Raw_450 g', 'Raw', '450 g', 14.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1132, 164, NULL, '164_Raw_1 kg', 'Raw', '1 kg', 28.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1133, 165, NULL, '165_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1134, 165, NULL, '165_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1135, 165, NULL, '165_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1136, 165, NULL, '165_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1137, 165, NULL, '165_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1138, 165, NULL, '165_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1139, 165, NULL, '165_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1140, 165, NULL, '165_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1141, 166, NULL, '166_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1142, 166, NULL, '166_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1143, 166, NULL, '166_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1144, 166, NULL, '166_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1145, 167, NULL, '167_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1146, 167, NULL, '167_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1147, 167, NULL, '167_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1148, 167, NULL, '167_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1149, 167, NULL, '167_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1150, 167, NULL, '167_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1151, 167, NULL, '167_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1152, 167, NULL, '167_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1153, 168, NULL, '168_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1154, 168, NULL, '168_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1155, 168, NULL, '168_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1156, 168, NULL, '168_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1157, 168, NULL, '168_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1158, 168, NULL, '168_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1159, 168, NULL, '168_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1160, 168, NULL, '168_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1161, 169, NULL, '169_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1162, 169, NULL, '169_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1163, 169, NULL, '169_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1164, 169, NULL, '169_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1165, 169, NULL, '169_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1166, 169, NULL, '169_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1167, 169, NULL, '169_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1168, 169, NULL, '169_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1169, 170, NULL, '170_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1170, 170, NULL, '170_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1171, 170, NULL, '170_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1172, 170, NULL, '170_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1173, 170, NULL, '170_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1174, 170, NULL, '170_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1175, 170, NULL, '170_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1176, 170, NULL, '170_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1177, 171, NULL, '171_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1178, 171, NULL, '171_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1179, 171, NULL, '171_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1180, 171, NULL, '171_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1181, 171, NULL, '171_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1182, 171, NULL, '171_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1183, 171, NULL, '171_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1184, 171, NULL, '171_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1185, 172, NULL, '172_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1186, 172, NULL, '172_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1187, 172, NULL, '172_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1188, 172, NULL, '172_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1189, 172, NULL, '172_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1190, 172, NULL, '172_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1191, 172, NULL, '172_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1192, 172, NULL, '172_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1193, 173, NULL, '173_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1194, 173, NULL, '173_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1195, 173, NULL, '173_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1196, 173, NULL, '173_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1197, 173, NULL, '173_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1198, 173, NULL, '173_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1199, 173, NULL, '173_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1200, 173, NULL, '173_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1201, 174, NULL, '174_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1202, 174, NULL, '174_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1203, 174, NULL, '174_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1204, 174, NULL, '174_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1205, 174, NULL, '174_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1206, 174, NULL, '174_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1207, 174, NULL, '174_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1208, 174, NULL, '174_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1209, 175, NULL, '175_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05');
INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1210, 175, NULL, '175_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1211, 175, NULL, '175_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1212, 175, NULL, '175_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1213, 175, NULL, '175_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1214, 175, NULL, '175_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1215, 175, NULL, '175_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1216, 175, NULL, '175_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1217, 176, NULL, '176_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1218, 176, NULL, '176_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1219, 176, NULL, '176_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1220, 176, NULL, '176_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1221, 176, NULL, '176_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1222, 176, NULL, '176_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1223, 176, NULL, '176_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1224, 176, NULL, '176_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1225, 177, NULL, '177_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1226, 177, NULL, '177_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1227, 177, NULL, '177_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1228, 177, NULL, '177_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1229, 177, NULL, '177_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1230, 177, NULL, '177_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1231, 177, NULL, '177_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1232, 177, NULL, '177_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1233, 178, NULL, '178_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1234, 178, NULL, '178_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1235, 178, NULL, '178_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1236, 178, NULL, '178_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1237, 178, NULL, '178_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1238, 178, NULL, '178_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1239, 178, NULL, '178_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1240, 178, NULL, '178_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1241, 179, NULL, '179_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1242, 179, NULL, '179_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1243, 179, NULL, '179_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1244, 179, NULL, '179_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1245, 180, NULL, '180_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1246, 180, NULL, '180_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1247, 180, NULL, '180_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1248, 180, NULL, '180_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1249, 181, NULL, '181_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1250, 181, NULL, '181_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1251, 181, NULL, '181_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1252, 181, NULL, '181_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1253, 181, NULL, '181_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1254, 181, NULL, '181_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1255, 181, NULL, '181_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1256, 181, NULL, '181_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1257, 182, NULL, '182_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1258, 182, NULL, '182_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1259, 182, NULL, '182_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1260, 182, NULL, '182_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1261, 182, NULL, '182_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1262, 182, NULL, '182_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1263, 182, NULL, '182_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1264, 182, NULL, '182_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1265, 183, NULL, '183_Pow_90 g', 'Powder', '90 g', 5.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1266, 183, NULL, '183_Pow_225 g', 'Powder', '225 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1267, 183, NULL, '183_Pow_450 g', 'Powder', '450 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1268, 183, NULL, '183_Pow_1 kg', 'Powder', '1 kg', 38.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1269, 183, NULL, '183_Raw_90 g', 'Raw', '90 g', 4.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1270, 183, NULL, '183_Raw_225 g', 'Raw', '225 g', 9.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1271, 183, NULL, '183_Raw_450 g', 'Raw', '450 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1272, 183, NULL, '183_Raw_1 kg', 'Raw', '1 kg', 31.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1273, 184, NULL, '184_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1274, 184, NULL, '184_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1275, 184, NULL, '184_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1276, 184, NULL, '184_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1277, 185, NULL, '185_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1278, 185, NULL, '185_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1279, 185, NULL, '185_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1280, 184, NULL, '184_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1281, 185, NULL, '185_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1282, 185, NULL, '185_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1283, 185, NULL, '185_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1284, 185, NULL, '185_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1285, 186, NULL, '186_Pow_90 g', 'Powder', '90 g', 2.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1286, 186, NULL, '186_Pow_225 g', 'Powder', '225 g', 5.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1287, 186, NULL, '186_Pow_450 g', 'Powder', '450 g', 8.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1288, 186, NULL, '186_Pow_1 kg', 'Powder', '1 kg', 17.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1289, 186, NULL, '186_Raw_90 g', 'Raw', '90 g', 2.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1290, 186, NULL, '186_Raw_225 g', 'Raw', '225 g', 4.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1291, 186, NULL, '186_Raw_450 g', 'Raw', '450 g', 7.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1292, 186, NULL, '186_Raw_1 kg', 'Raw', '1 kg', 14.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1293, 187, NULL, '187_Raw_90 g', 'Raw', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1294, 187, NULL, '187_Raw_225 g', 'Raw', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1295, 187, NULL, '187_Raw_450 g', 'Raw', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1296, 187, NULL, '187_Raw_1 kg', 'Raw', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1297, 188, NULL, '188_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1298, 188, NULL, '188_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1299, 188, NULL, '188_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1300, 188, NULL, '188_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1301, 189, NULL, '189_Pow_90 g', 'Powder', '90 g', 35.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1302, 189, NULL, '189_Pow_225 g', 'Powder', '225 g', 80.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1303, 189, NULL, '189_Pow_450 g', 'Powder', '450 g', 142.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1304, 189, NULL, '189_Pow_1 kg', 'Powder', '1 kg', 277.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1305, 189, NULL, '189_Raw_90 g', 'Raw', '90 g', 29.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1306, 189, NULL, '189_Raw_225 g', 'Raw', '225 g', 67.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1307, 189, NULL, '189_Raw_450 g', 'Raw', '450 g', 119.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1308, 189, NULL, '189_Raw_1 kg', 'Raw', '1 kg', 231.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1309, 190, NULL, '190_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1310, 190, NULL, '190_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1311, 190, NULL, '190_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1312, 190, NULL, '190_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1313, 190, NULL, '190_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1314, 190, NULL, '190_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1315, 190, NULL, '190_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1316, 190, NULL, '190_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1317, 191, NULL, '191_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1318, 191, NULL, '191_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1319, 191, NULL, '191_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1320, 191, NULL, '191_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1321, 191, NULL, '191_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1322, 191, NULL, '191_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1323, 191, NULL, '191_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1324, 191, NULL, '191_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1325, 192, NULL, '192_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1326, 192, NULL, '192_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1327, 192, NULL, '192_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1328, 192, NULL, '192_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1329, 192, NULL, '192_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1330, 192, NULL, '192_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1331, 192, NULL, '192_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1332, 192, NULL, '192_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1333, 193, NULL, '193_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1334, 193, NULL, '193_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1335, 193, NULL, '193_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1336, 193, NULL, '193_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1337, 193, NULL, '193_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1338, 193, NULL, '193_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1339, 193, NULL, '193_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1340, 193, NULL, '193_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1341, 194, NULL, '194_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1342, 194, NULL, '194_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1343, 194, NULL, '194_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1344, 194, NULL, '194_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1345, 194, NULL, '194_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1346, 194, NULL, '194_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1347, 194, NULL, '194_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1348, 194, NULL, '194_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1349, 195, NULL, '195_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1350, 195, NULL, '195_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1351, 195, NULL, '195_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1352, 195, NULL, '195_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1353, 195, NULL, '195_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1354, 195, NULL, '195_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1355, 195, NULL, '195_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1356, 195, NULL, '195_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1357, 196, NULL, '196_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1358, 196, NULL, '196_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1359, 196, NULL, '196_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1360, 196, NULL, '196_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1361, 196, NULL, '196_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1362, 196, NULL, '196_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1363, 196, NULL, '196_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1364, 196, NULL, '196_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1365, 197, NULL, '197_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1366, 197, NULL, '197_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1367, 197, NULL, '197_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1368, 197, NULL, '197_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1369, 197, NULL, '197_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1370, 197, NULL, '197_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1371, 197, NULL, '197_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1372, 197, NULL, '197_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1373, 198, NULL, '198_Pow_90 g', 'Powder', '90 g', 5.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1374, 198, NULL, '198_Pow_225 g', 'Powder', '225 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1375, 198, NULL, '198_Pow_450 g', 'Powder', '450 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1376, 198, NULL, '198_Pow_1 kg', 'Powder', '1 kg', 38.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1377, 198, NULL, '198_Raw_90 g', 'Raw', '90 g', 4.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1378, 198, NULL, '198_Raw_225 g', 'Raw', '225 g', 9.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1379, 198, NULL, '198_Raw_450 g', 'Raw', '450 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1380, 198, NULL, '198_Raw_1 kg', 'Raw', '1 kg', 31.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1381, 199, NULL, '199_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1382, 199, NULL, '199_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1383, 199, NULL, '199_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1384, 199, NULL, '199_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1385, 199, NULL, '199_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1386, 199, NULL, '199_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1387, 199, NULL, '199_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1388, 199, NULL, '199_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1389, 200, NULL, '200_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1390, 200, NULL, '200_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1391, 200, NULL, '200_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1392, 200, NULL, '200_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1393, 200, NULL, '200_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1394, 200, NULL, '200_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1395, 200, NULL, '200_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1396, 200, NULL, '200_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1397, 201, NULL, '201_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1398, 201, NULL, '201_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1399, 201, NULL, '201_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1400, 201, NULL, '201_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1401, 201, NULL, '201_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1402, 201, NULL, '201_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1403, 201, NULL, '201_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1404, 201, NULL, '201_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1405, 202, NULL, '202_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1406, 202, NULL, '202_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1407, 202, NULL, '202_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1408, 202, NULL, '202_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1409, 203, NULL, '203_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1410, 203, NULL, '203_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1411, 203, NULL, '203_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1412, 203, NULL, '203_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1413, 203, NULL, '203_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1414, 203, NULL, '203_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1415, 203, NULL, '203_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1416, 203, NULL, '203_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1417, 204, NULL, '204_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1418, 204, NULL, '204_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1419, 204, NULL, '204_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1420, 204, NULL, '204_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1421, 204, NULL, '204_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1422, 204, NULL, '204_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1423, 204, NULL, '204_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1424, 204, NULL, '204_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1425, 205, NULL, '205_Pow_90 g', 'Powder', '90 g', 22.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1426, 205, NULL, '205_Pow_225 g', 'Powder', '225 g', 51.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1427, 205, NULL, '205_Pow_450 g', 'Powder', '450 g', 90.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1428, 205, NULL, '205_Pow_1 kg', 'Powder', '1 kg', 176.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1429, 205, NULL, '205_Raw_90 g', 'Raw', '90 g', 19.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1430, 205, NULL, '205_Raw_225 g', 'Raw', '225 g', 42.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1431, 205, NULL, '205_Raw_450 g', 'Raw', '450 g', 75.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1432, 205, NULL, '205_Raw_1 kg', 'Raw', '1 kg', 147.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1433, 206, NULL, '206_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1434, 206, NULL, '206_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1435, 206, NULL, '206_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1436, 206, NULL, '206_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1437, 206, NULL, '206_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1438, 206, NULL, '206_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1439, 206, NULL, '206_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1440, 206, NULL, '206_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1441, 207, NULL, '207_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1442, 207, NULL, '207_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1443, 207, NULL, '207_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1444, 207, NULL, '207_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1445, 207, NULL, '207_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1446, 207, NULL, '207_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1447, 207, NULL, '207_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1448, 207, NULL, '207_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1449, 208, NULL, '208_Raw_90 g', 'Raw', '90 g', 4.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1450, 208, NULL, '208_Raw_225 g', 'Raw', '225 g', 9.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1451, 208, NULL, '208_Raw_450 g', 'Raw', '450 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1452, 208, NULL, '208_Raw_1 kg', 'Raw', '1 kg', 31.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1453, 209, NULL, '209_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1454, 209, NULL, '209_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1455, 209, NULL, '209_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1456, 209, NULL, '209_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1457, 209, NULL, '209_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1458, 209, NULL, '209_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1459, 209, NULL, '209_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1460, 209, NULL, '209_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1461, 210, NULL, '210_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1462, 210, NULL, '210_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1463, 210, NULL, '210_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1464, 210, NULL, '210_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1465, 210, NULL, '210_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1466, 210, NULL, '210_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1467, 210, NULL, '210_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1468, 210, NULL, '210_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1469, 211, NULL, '211_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1470, 211, NULL, '211_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1471, 211, NULL, '211_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1472, 211, NULL, '211_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1473, 211, NULL, '211_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1474, 211, NULL, '211_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1475, 211, NULL, '211_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1476, 211, NULL, '211_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1477, 212, NULL, '212_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1478, 212, NULL, '212_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1479, 212, NULL, '212_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1480, 212, NULL, '212_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1481, 212, NULL, '212_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1482, 212, NULL, '212_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1483, 212, NULL, '212_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1484, 212, NULL, '212_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1485, 213, NULL, '213_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1486, 213, NULL, '213_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1487, 213, NULL, '213_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1488, 213, NULL, '213_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1489, 213, NULL, '213_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1490, 213, NULL, '213_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1491, 213, NULL, '213_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1492, 213, NULL, '213_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1493, 214, NULL, '214_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1494, 214, NULL, '214_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1495, 214, NULL, '214_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1496, 214, NULL, '214_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1497, 214, NULL, '214_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1498, 214, NULL, '214_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1499, 214, NULL, '214_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1500, 214, NULL, '214_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1501, 215, NULL, '215_Raw_90 g', 'Raw', '90 g', 6.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1502, 215, NULL, '215_Raw_225 g', 'Raw', '225 g', 15.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1503, 215, NULL, '215_Raw_450 g', 'Raw', '450 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1504, 215, NULL, '215_Raw_1 kg', 'Raw', '1 kg', 47.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1505, 216, NULL, '216_Raw_90 g', 'Raw', '90 g', 8.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1506, 216, NULL, '216_Raw_225 g', 'Raw', '225 g', 18.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1507, 216, NULL, '216_Raw_450 g', 'Raw', '450 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1508, 216, NULL, '216_Raw_1 kg', 'Raw', '1 kg', 63.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1509, 217, NULL, '217_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1510, 217, NULL, '217_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1511, 217, NULL, '217_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1512, 217, NULL, '217_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1513, 218, NULL, '218_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1514, 218, NULL, '218_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1515, 218, NULL, '218_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1516, 218, NULL, '218_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1517, 219, NULL, '219_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1518, 219, NULL, '219_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1519, 219, NULL, '219_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1520, 219, NULL, '219_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1521, 219, NULL, '219_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1522, 219, NULL, '219_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1523, 219, NULL, '219_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1524, 219, NULL, '219_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1525, 220, NULL, '220_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1526, 220, NULL, '220_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1527, 220, NULL, '220_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1528, 220, NULL, '220_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1529, 221, NULL, '221_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1530, 221, NULL, '221_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1531, 221, NULL, '221_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1532, 221, NULL, '221_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1533, 221, NULL, '221_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1534, 221, NULL, '221_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1535, 221, NULL, '221_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1536, 221, NULL, '221_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1537, 222, NULL, '222_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1538, 222, NULL, '222_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1539, 222, NULL, '222_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1540, 222, NULL, '222_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1541, 223, NULL, '223_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1542, 223, NULL, '223_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1543, 223, NULL, '223_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1544, 223, NULL, '223_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1545, 224, NULL, '224_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1546, 224, NULL, '224_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1547, 224, NULL, '224_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1548, 224, NULL, '224_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1549, 224, NULL, '224_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1550, 224, NULL, '224_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1551, 224, NULL, '224_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1552, 224, NULL, '224_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1553, 225, NULL, '225_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1554, 225, NULL, '225_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1555, 225, NULL, '225_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1556, 225, NULL, '225_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1557, 225, NULL, '225_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1558, 225, NULL, '225_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1559, 225, NULL, '225_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1560, 225, NULL, '225_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1561, 226, NULL, '226_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1562, 226, NULL, '226_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1563, 226, NULL, '226_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1564, 226, NULL, '226_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1565, 226, NULL, '226_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1566, 226, NULL, '226_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1567, 226, NULL, '226_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1568, 226, NULL, '226_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1569, 227, NULL, '227_Pow_90 g', 'Powder', '90 g', 17.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1570, 227, NULL, '227_Pow_225 g', 'Powder', '225 g', 39.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1571, 227, NULL, '227_Pow_450 g', 'Powder', '450 g', 69.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1572, 227, NULL, '227_Pow_1 kg', 'Powder', '1 kg', 134.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1573, 227, NULL, '227_Raw_90 g', 'Raw', '90 g', 14.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1574, 227, NULL, '227_Raw_225 g', 'Raw', '225 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1575, 227, NULL, '227_Raw_450 g', 'Raw', '450 g', 57.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1576, 227, NULL, '227_Raw_1 kg', 'Raw', '1 kg', 112.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1577, 228, NULL, '228_Pow_90 g', 'Powder', '90 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1578, 228, NULL, '228_Pow_225 g', 'Powder', '225 g', 972.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1579, 228, NULL, '228_Pow_450 g', 'Powder', '450 g', 1728.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1580, 228, NULL, '228_Pow_1 kg', 'Powder', '1 kg', 3360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1581, 228, NULL, '228_Raw_90 g', 'Raw', '90 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1582, 228, NULL, '228_Raw_225 g', 'Raw', '225 g', 810.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1583, 228, NULL, '228_Raw_450 g', 'Raw', '450 g', 1440.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1584, 228, NULL, '228_Raw_1 kg', 'Raw', '1 kg', 2800.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1585, 229, NULL, '229_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1586, 229, NULL, '229_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1587, 229, NULL, '229_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1588, 229, NULL, '229_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1589, 229, NULL, '229_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1590, 229, NULL, '229_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1591, 229, NULL, '229_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1592, 229, NULL, '229_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1593, 230, NULL, '230_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1594, 230, NULL, '230_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1595, 230, NULL, '230_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1596, 230, NULL, '230_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1597, 230, NULL, '230_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1598, 230, NULL, '230_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1599, 230, NULL, '230_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1600, 230, NULL, '230_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1601, 231, NULL, '231_Pow_90 g', 'Powder', '90 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1602, 231, NULL, '231_Pow_225 g', 'Powder', '225 g', 194.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1603, 231, NULL, '231_Pow_450 g', 'Powder', '450 g', 345.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05');
INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1604, 231, NULL, '231_Pow_1 kg', 'Powder', '1 kg', 672.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1605, 231, NULL, '231_Raw_90 g', 'Raw', '90 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1606, 231, NULL, '231_Raw_225 g', 'Raw', '225 g', 162.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1607, 231, NULL, '231_Raw_450 g', 'Raw', '450 g', 288.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1608, 231, NULL, '231_Raw_1 kg', 'Raw', '1 kg', 560.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1609, 232, NULL, '232_Pow_90 g', 'Powder', '90 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1610, 232, NULL, '232_Pow_225 g', 'Powder', '225 g', 243.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1611, 232, NULL, '232_Pow_450 g', 'Powder', '450 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1612, 232, NULL, '232_Pow_1 kg', 'Powder', '1 kg', 840.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1613, 232, NULL, '232_Raw_90 g', 'Raw', '90 g', 90.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1614, 232, NULL, '232_Raw_225 g', 'Raw', '225 g', 202.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1615, 232, NULL, '232_Raw_450 g', 'Raw', '450 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1616, 232, NULL, '232_Raw_1 kg', 'Raw', '1 kg', 700.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1617, 233, NULL, '233_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1618, 233, NULL, '233_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1619, 233, NULL, '233_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1620, 233, NULL, '233_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1621, 233, NULL, '233_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1622, 233, NULL, '233_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1623, 233, NULL, '233_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1624, 233, NULL, '233_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1625, 234, NULL, '234_Pow_90 g', 'Powder', '90 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1626, 234, NULL, '234_Pow_225 g', 'Powder', '225 g', 243.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1627, 234, NULL, '234_Pow_450 g', 'Powder', '450 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1628, 234, NULL, '234_Pow_1 kg', 'Powder', '1 kg', 840.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1629, 234, NULL, '234_Raw_90 g', 'Raw', '90 g', 90.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1630, 234, NULL, '234_Raw_225 g', 'Raw', '225 g', 202.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1631, 234, NULL, '234_Raw_450 g', 'Raw', '450 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1632, 234, NULL, '234_Raw_1 kg', 'Raw', '1 kg', 700.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1633, 235, NULL, '235_Pow_90 g', 'Powder', '90 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1634, 235, NULL, '235_Pow_225 g', 'Powder', '225 g', 243.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1635, 235, NULL, '235_Pow_450 g', 'Powder', '450 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1636, 235, NULL, '235_Pow_1 kg', 'Powder', '1 kg', 840.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1637, 235, NULL, '235_Raw_90 g', 'Raw', '90 g', 90.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1638, 235, NULL, '235_Raw_225 g', 'Raw', '225 g', 202.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1639, 235, NULL, '235_Raw_450 g', 'Raw', '450 g', 360.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1640, 235, NULL, '235_Raw_1 kg', 'Raw', '1 kg', 700.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1641, 236, NULL, '236_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1642, 236, NULL, '236_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1643, 236, NULL, '236_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1644, 236, NULL, '236_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1645, 236, NULL, '236_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1646, 236, NULL, '236_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1647, 236, NULL, '236_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1648, 236, NULL, '236_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1649, 237, NULL, '237_Pow_90 g', 'Powder', '90 g', 54.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1650, 237, NULL, '237_Pow_225 g', 'Powder', '225 g', 121.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1651, 237, NULL, '237_Pow_450 g', 'Powder', '450 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1652, 237, NULL, '237_Pow_1 kg', 'Powder', '1 kg', 420.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1653, 237, NULL, '237_Raw_90 g', 'Raw', '90 g', 45.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1654, 237, NULL, '237_Raw_225 g', 'Raw', '225 g', 101.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1655, 237, NULL, '237_Raw_450 g', 'Raw', '450 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1656, 237, NULL, '237_Raw_1 kg', 'Raw', '1 kg', 350.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1657, 238, NULL, '238_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1658, 238, NULL, '238_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1659, 238, NULL, '238_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1660, 238, NULL, '238_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1661, 238, NULL, '238_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1662, 238, NULL, '238_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1663, 238, NULL, '238_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1664, 238, NULL, '238_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1665, 239, NULL, '239_Pow_90 g', 'Powder', '90 g', 162.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1666, 239, NULL, '239_Pow_225 g', 'Powder', '225 g', 364.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1667, 239, NULL, '239_Pow_450 g', 'Powder', '450 g', 648.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1668, 239, NULL, '239_Pow_1 kg', 'Powder', '1 kg', 1260.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1669, 239, NULL, '239_Raw_90 g', 'Raw', '90 g', 135.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1670, 239, NULL, '239_Raw_225 g', 'Raw', '225 g', 303.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1671, 239, NULL, '239_Raw_450 g', 'Raw', '450 g', 540.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1672, 239, NULL, '239_Raw_1 kg', 'Raw', '1 kg', 1050.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1673, 240, NULL, '240_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1674, 240, NULL, '240_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1675, 240, NULL, '240_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1676, 240, NULL, '240_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1677, 241, NULL, '241_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1678, 241, NULL, '241_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1679, 241, NULL, '241_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1680, 241, NULL, '241_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1681, 242, NULL, '242_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1682, 242, NULL, '242_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1683, 242, NULL, '242_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1684, 242, NULL, '242_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1685, 242, NULL, '242_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1686, 242, NULL, '242_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1687, 242, NULL, '242_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1688, 242, NULL, '242_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1689, 243, NULL, '243_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1690, 243, NULL, '243_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1691, 243, NULL, '243_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1692, 243, NULL, '243_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1693, 244, NULL, '244_Pow_90 g', 'Powder', '90 g', 3.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1694, 244, NULL, '244_Pow_225 g', 'Powder', '225 g', 7.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1695, 244, NULL, '244_Pow_450 g', 'Powder', '450 g', 13.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1696, 244, NULL, '244_Pow_1 kg', 'Powder', '1 kg', 25.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1697, 244, NULL, '244_Raw_90 g', 'Raw', '90 g', 2.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1698, 244, NULL, '244_Raw_225 g', 'Raw', '225 g', 6.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1699, 244, NULL, '244_Raw_450 g', 'Raw', '450 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1700, 244, NULL, '244_Raw_1 kg', 'Raw', '1 kg', 21.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1701, 245, NULL, '245_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1702, 245, NULL, '245_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1703, 245, NULL, '245_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1704, 245, NULL, '245_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1705, 245, NULL, '245_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1706, 245, NULL, '245_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1707, 245, NULL, '245_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1708, 245, NULL, '245_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1709, 246, NULL, '246_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1710, 246, NULL, '246_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1711, 246, NULL, '246_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1712, 246, NULL, '246_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1713, 247, NULL, '247_Pow_90 g', 'Powder', '90 g', 17.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1714, 247, NULL, '247_Pow_225 g', 'Powder', '225 g', 39.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1715, 247, NULL, '247_Pow_450 g', 'Powder', '450 g', 69.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1716, 247, NULL, '247_Pow_1 kg', 'Powder', '1 kg', 134.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1717, 247, NULL, '247_Raw_90 g', 'Raw', '90 g', 14.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1718, 247, NULL, '247_Raw_225 g', 'Raw', '225 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1719, 247, NULL, '247_Raw_450 g', 'Raw', '450 g', 57.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1720, 247, NULL, '247_Raw_1 kg', 'Raw', '1 kg', 112.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1721, 248, NULL, '248_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1722, 248, NULL, '248_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1723, 248, NULL, '248_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1724, 248, NULL, '248_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1725, 248, NULL, '248_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1726, 248, NULL, '248_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1727, 248, NULL, '248_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1728, 248, NULL, '248_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1729, 249, NULL, '249_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1730, 249, NULL, '249_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1731, 249, NULL, '249_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1732, 249, NULL, '249_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:05', '2022-12-26 10:50:05'),
(1733, 249, NULL, '249_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1734, 249, NULL, '249_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1735, 249, NULL, '249_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1736, 249, NULL, '249_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1737, 250, NULL, '250_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1738, 250, NULL, '250_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1739, 250, NULL, '250_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1740, 250, NULL, '250_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1741, 251, NULL, '251_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1742, 251, NULL, '251_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1743, 251, NULL, '251_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1744, 250, NULL, '250_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1745, 251, NULL, '251_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1746, 251, NULL, '251_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1747, 251, NULL, '251_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1748, 251, NULL, '251_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1749, 252, NULL, '252_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1750, 252, NULL, '252_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1751, 252, NULL, '252_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1752, 252, NULL, '252_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1753, 252, NULL, '252_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1754, 252, NULL, '252_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1755, 252, NULL, '252_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1756, 252, NULL, '252_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1757, 253, NULL, '253_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1758, 253, NULL, '253_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1759, 253, NULL, '253_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1760, 253, NULL, '253_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1761, 253, NULL, '253_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1762, 253, NULL, '253_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1763, 253, NULL, '253_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1764, 253, NULL, '253_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1765, 254, NULL, '254_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1766, 254, NULL, '254_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1767, 254, NULL, '254_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1768, 254, NULL, '254_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1769, 255, NULL, '255_Pow_90 g', 'Powder', '90 g', 389.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1770, 255, NULL, '255_Pow_225 g', 'Powder', '225 g', 875.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1771, 255, NULL, '255_Pow_450 g', 'Powder', '450 g', 1555.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1772, 255, NULL, '255_Pow_1 kg', 'Powder', '1 kg', 3024.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1773, 255, NULL, '255_Raw_90 g', 'Raw', '90 g', 324.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1774, 255, NULL, '255_Raw_225 g', 'Raw', '225 g', 729.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1775, 255, NULL, '255_Raw_450 g', 'Raw', '450 g', 1296.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1776, 255, NULL, '255_Raw_1 kg', 'Raw', '1 kg', 2520.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1777, 256, NULL, '256_Pow_90 g', 'Powder', '90 g', 194.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1778, 256, NULL, '256_Pow_225 g', 'Powder', '225 g', 437.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1779, 256, NULL, '256_Pow_450 g', 'Powder', '450 g', 777.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1780, 256, NULL, '256_Pow_1 kg', 'Powder', '1 kg', 1512.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1781, 256, NULL, '256_Raw_90 g', 'Raw', '90 g', 162.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1782, 256, NULL, '256_Raw_225 g', 'Raw', '225 g', 364.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1783, 256, NULL, '256_Raw_450 g', 'Raw', '450 g', 648.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1784, 256, NULL, '256_Raw_1 kg', 'Raw', '1 kg', 1260.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1785, 257, NULL, '257_Pow_90 g', 'Powder', '90 g', 5.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1786, 257, NULL, '257_Pow_225 g', 'Powder', '225 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1787, 257, NULL, '257_Pow_450 g', 'Powder', '450 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1788, 257, NULL, '257_Pow_1 kg', 'Powder', '1 kg', 38.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1789, 257, NULL, '257_Raw_90 g', 'Raw', '90 g', 4.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1790, 257, NULL, '257_Raw_225 g', 'Raw', '225 g', 9.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1791, 257, NULL, '257_Raw_450 g', 'Raw', '450 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1792, 257, NULL, '257_Raw_1 kg', 'Raw', '1 kg', 31.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1793, 258, NULL, '258_Pow_90 g', 'Powder', '90 g', 216.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1794, 258, NULL, '258_Pow_225 g', 'Powder', '225 g', 486.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1795, 258, NULL, '258_Pow_450 g', 'Powder', '450 g', 864.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1796, 258, NULL, '258_Pow_1 kg', 'Powder', '1 kg', 1680.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1797, 258, NULL, '258_Raw_90 g', 'Raw', '90 g', 180.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1798, 258, NULL, '258_Raw_225 g', 'Raw', '225 g', 405.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1799, 258, NULL, '258_Raw_450 g', 'Raw', '450 g', 720.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1800, 258, NULL, '258_Raw_1 kg', 'Raw', '1 kg', 1400.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1801, 259, NULL, '259_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1802, 259, NULL, '259_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1803, 259, NULL, '259_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1804, 259, NULL, '259_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1805, 259, NULL, '259_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1806, 259, NULL, '259_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1807, 259, NULL, '259_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1808, 259, NULL, '259_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1809, 260, NULL, '260_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1810, 260, NULL, '260_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1811, 260, NULL, '260_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1812, 260, NULL, '260_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1813, 260, NULL, '260_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1814, 260, NULL, '260_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1815, 260, NULL, '260_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1816, 260, NULL, '260_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1817, 261, NULL, '261_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1818, 261, NULL, '261_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1819, 261, NULL, '261_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1820, 261, NULL, '261_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1821, 261, NULL, '261_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1822, 261, NULL, '261_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1823, 261, NULL, '261_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1824, 261, NULL, '261_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1825, 262, NULL, '262_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1826, 262, NULL, '262_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1827, 262, NULL, '262_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1828, 262, NULL, '262_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1829, 262, NULL, '262_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1830, 262, NULL, '262_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1831, 262, NULL, '262_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1832, 262, NULL, '262_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1833, 263, NULL, '263_Pow_90 g', 'Powder', '90 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1834, 263, NULL, '263_Pow_225 g', 'Powder', '225 g', 291.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1835, 263, NULL, '263_Pow_450 g', 'Powder', '450 g', 518.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1836, 263, NULL, '263_Pow_1 kg', 'Powder', '1 kg', 1008.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1837, 263, NULL, '263_Raw_90 g', 'Raw', '90 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1838, 263, NULL, '263_Raw_225 g', 'Raw', '225 g', 243.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1839, 263, NULL, '263_Raw_450 g', 'Raw', '450 g', 432.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1840, 263, NULL, '263_Raw_1 kg', 'Raw', '1 kg', 840.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1841, 264, NULL, '264_Pow_90 g', 'Powder', '90 g', 389.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1842, 264, NULL, '264_Pow_225 g', 'Powder', '225 g', 875.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1843, 264, NULL, '264_Pow_450 g', 'Powder', '450 g', 1555.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1844, 264, NULL, '264_Pow_1 kg', 'Powder', '1 kg', 3024.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1845, 264, NULL, '264_Raw_90 g', 'Raw', '90 g', 324.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1846, 264, NULL, '264_Raw_225 g', 'Raw', '225 g', 729.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1847, 264, NULL, '264_Raw_450 g', 'Raw', '450 g', 1296.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1848, 264, NULL, '264_Raw_1 kg', 'Raw', '1 kg', 2520.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1849, 265, NULL, '265_Pow_90 g', 'Powder', '90 g', 648.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1850, 265, NULL, '265_Pow_225 g', 'Powder', '225 g', 1458.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1851, 265, NULL, '265_Pow_450 g', 'Powder', '450 g', 2592.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1852, 265, NULL, '265_Pow_1 kg', 'Powder', '1 kg', 5040.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1853, 265, NULL, '265_Raw_90 g', 'Raw', '90 g', 540.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1854, 265, NULL, '265_Raw_225 g', 'Raw', '225 g', 1215.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1855, 265, NULL, '265_Raw_450 g', 'Raw', '450 g', 2160.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1856, 265, NULL, '265_Raw_1 kg', 'Raw', '1 kg', 4200.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1857, 266, NULL, '266_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1858, 266, NULL, '266_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1859, 266, NULL, '266_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1860, 266, NULL, '266_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1861, 266, NULL, '266_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1862, 266, NULL, '266_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1863, 266, NULL, '266_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1864, 266, NULL, '266_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1865, 267, NULL, '267_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1866, 267, NULL, '267_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1867, 267, NULL, '267_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1868, 267, NULL, '267_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1869, 267, NULL, '267_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1870, 267, NULL, '267_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1871, 267, NULL, '267_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1872, 267, NULL, '267_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1873, 268, NULL, '268_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1874, 268, NULL, '268_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1875, 268, NULL, '268_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1876, 268, NULL, '268_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1877, 268, NULL, '268_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1878, 268, NULL, '268_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1879, 268, NULL, '268_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1880, 268, NULL, '268_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1881, 269, NULL, '269_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1882, 269, NULL, '269_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1883, 269, NULL, '269_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1884, 269, NULL, '269_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1885, 269, NULL, '269_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1886, 269, NULL, '269_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1887, 269, NULL, '269_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1888, 269, NULL, '269_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1889, 270, NULL, '270_Pow_90 g', 'Powder', '90 g', 19.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1890, 270, NULL, '270_Pow_225 g', 'Powder', '225 g', 43.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1891, 270, NULL, '270_Pow_450 g', 'Powder', '450 g', 78.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1892, 270, NULL, '270_Pow_1 kg', 'Powder', '1 kg', 151.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1893, 270, NULL, '270_Raw_90 g', 'Raw', '90 g', 16.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1894, 270, NULL, '270_Raw_225 g', 'Raw', '225 g', 36.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1895, 270, NULL, '270_Raw_450 g', 'Raw', '450 g', 65.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1896, 270, NULL, '270_Raw_1 kg', 'Raw', '1 kg', 126.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1897, 271, NULL, '271_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1898, 271, NULL, '271_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1899, 271, NULL, '271_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1900, 271, NULL, '271_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1901, 271, NULL, '271_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1902, 271, NULL, '271_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1903, 271, NULL, '271_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1904, 271, NULL, '271_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1905, 272, NULL, '272_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1906, 272, NULL, '272_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1907, 272, NULL, '272_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1908, 272, NULL, '272_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1909, 272, NULL, '272_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1910, 272, NULL, '272_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1911, 272, NULL, '272_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1912, 272, NULL, '272_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1913, 273, NULL, '273_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1914, 273, NULL, '273_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1915, 273, NULL, '273_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1916, 273, NULL, '273_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1917, 273, NULL, '273_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1918, 273, NULL, '273_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1919, 273, NULL, '273_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1920, 273, NULL, '273_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1921, 274, NULL, '274_Raw_90 g', 'Raw', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1922, 274, NULL, '274_Raw_225 g', 'Raw', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1923, 274, NULL, '274_Raw_450 g', 'Raw', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1924, 274, NULL, '274_Raw_1 kg', 'Raw', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1925, 275, NULL, '275_Pow_90 g', 'Powder', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1926, 275, NULL, '275_Pow_225 g', 'Powder', '225 g', 9.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1927, 275, NULL, '275_Pow_450 g', 'Powder', '450 g', 17.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1928, 275, NULL, '275_Pow_1 kg', 'Powder', '1 kg', 33.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1929, 275, NULL, '275_Raw_90 g', 'Raw', '90 g', 3.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1930, 275, NULL, '275_Raw_225 g', 'Raw', '225 g', 8.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1931, 275, NULL, '275_Raw_450 g', 'Raw', '450 g', 14.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1932, 275, NULL, '275_Raw_1 kg', 'Raw', '1 kg', 28.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1933, 276, NULL, '276_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1934, 276, NULL, '276_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1935, 276, NULL, '276_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1936, 276, NULL, '276_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1937, 276, NULL, '276_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1938, 276, NULL, '276_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1939, 276, NULL, '276_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1940, 276, NULL, '276_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1941, 277, NULL, '277_Pow_90 g', 'Powder', '90 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1942, 277, NULL, '277_Pow_225 g', 'Powder', '225 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1943, 277, NULL, '277_Pow_450 g', 'Powder', '450 g', 86.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1944, 277, NULL, '277_Pow_1 kg', 'Powder', '1 kg', 168.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1945, 277, NULL, '277_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1946, 277, NULL, '277_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1947, 277, NULL, '277_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1948, 277, NULL, '277_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1949, 278, NULL, '278_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1950, 278, NULL, '278_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1951, 278, NULL, '278_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1952, 278, NULL, '278_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1953, 278, NULL, '278_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1954, 278, NULL, '278_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1955, 278, NULL, '278_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1956, 278, NULL, '278_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1957, 279, NULL, '279_Raw_90 g', 'Raw', '90 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1958, 279, NULL, '279_Raw_225 g', 'Raw', '225 g', 40.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1959, 279, NULL, '279_Raw_450 g', 'Raw', '450 g', 72.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1960, 279, NULL, '279_Raw_1 kg', 'Raw', '1 kg', 140.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1961, 280, NULL, '280_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1962, 280, NULL, '280_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1963, 280, NULL, '280_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1964, 280, NULL, '280_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1965, 280, NULL, '280_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1966, 280, NULL, '280_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1967, 280, NULL, '280_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1968, 280, NULL, '280_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1969, 281, NULL, '281_Pow_90 g', 'Powder', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1970, 281, NULL, '281_Pow_225 g', 'Powder', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1971, 281, NULL, '281_Pow_450 g', 'Powder', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1972, 281, NULL, '281_Pow_1 kg', 'Powder', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1973, 281, NULL, '281_Raw_90 g', 'Raw', '90 g', 4.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1974, 281, NULL, '281_Raw_225 g', 'Raw', '225 g', 10.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1975, 281, NULL, '281_Raw_450 g', 'Raw', '450 g', 18.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1976, 281, NULL, '281_Raw_1 kg', 'Raw', '1 kg', 35.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1977, 282, NULL, '282_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1978, 282, NULL, '282_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1979, 282, NULL, '282_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1980, 282, NULL, '282_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1981, 282, NULL, '282_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1982, 282, NULL, '282_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1983, 282, NULL, '282_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1984, 282, NULL, '282_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1985, 283, NULL, '283_Pow_90 g', 'Powder', '90 g', 9.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1986, 283, NULL, '283_Pow_225 g', 'Powder', '225 g', 22.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1987, 283, NULL, '283_Pow_450 g', 'Powder', '450 g', 39.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1988, 283, NULL, '283_Pow_1 kg', 'Powder', '1 kg', 75.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1989, 283, NULL, '283_Raw_90 g', 'Raw', '90 g', 8.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1990, 283, NULL, '283_Raw_225 g', 'Raw', '225 g', 18.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1991, 283, NULL, '283_Raw_450 g', 'Raw', '450 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1992, 283, NULL, '283_Raw_1 kg', 'Raw', '1 kg', 63.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1993, 284, NULL, '284_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1994, 284, NULL, '284_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1995, 284, NULL, '284_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1996, 284, NULL, '284_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06');
INSERT INTO `products_attributes` (`id`, `product_id`, `plu`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1997, 284, NULL, '284_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1998, 284, NULL, '284_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(1999, 284, NULL, '284_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2000, 284, NULL, '284_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2001, 285, NULL, '285_Raw_90 g', 'Raw', '90 g', 0.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2002, 285, NULL, '285_Raw_225 g', 'Raw', '225 g', 0.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2003, 285, NULL, '285_Raw_450 g', 'Raw', '450 g', 1.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2004, 285, NULL, '285_Raw_1 kg', 'Raw', '1 kg', 2.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2005, 286, NULL, '286_Raw_90 g', 'Raw', '90 g', 5.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2006, 286, NULL, '286_Raw_225 g', 'Raw', '225 g', 12.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2007, 286, NULL, '286_Raw_450 g', 'Raw', '450 g', 21.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2008, 286, NULL, '286_Raw_1 kg', 'Raw', '1 kg', 42.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2009, 287, NULL, '287_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2010, 287, NULL, '287_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2011, 287, NULL, '287_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2012, 287, NULL, '287_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2013, 288, NULL, '288_Pow_90 g', 'Powder', '90 g', 32.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2014, 288, NULL, '288_Pow_225 g', 'Powder', '225 g', 73.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2015, 288, NULL, '288_Pow_450 g', 'Powder', '450 g', 129.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2016, 288, NULL, '288_Pow_1 kg', 'Powder', '1 kg', 252.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2017, 288, NULL, '288_Raw_90 g', 'Raw', '90 g', 27.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2018, 288, NULL, '288_Raw_225 g', 'Raw', '225 g', 60.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2019, 288, NULL, '288_Raw_450 g', 'Raw', '450 g', 108.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2020, 288, NULL, '288_Raw_1 kg', 'Raw', '1 kg', 210.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2021, 289, NULL, '289_Pow_90 g', 'Powder', '90 g', 11.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2022, 289, NULL, '289_Pow_225 g', 'Powder', '225 g', 24.50, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2023, 289, NULL, '289_Pow_450 g', 'Powder', '450 g', 48.75, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2024, 289, NULL, '289_Pow_1 kg', 'Powder', '1 kg', 84.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2025, 289, NULL, '289_Raw_90 g', 'Raw', '90 g', 9.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2026, 289, NULL, '289_Raw_225 g', 'Raw', '225 g', 20.25, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2027, 289, NULL, '289_Raw_450 g', 'Raw', '450 g', 36.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2028, 289, NULL, '289_Raw_1 kg', 'Raw', '1 kg', 70.00, 0.00, 20, 1, 'active', '2022-12-26 10:50:06', '2022-12-26 10:50:06'),
(2235, 430, 20023, '20023_Raw_90 gm', 'Raw', '90 gm', 21.75, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2236, 430, 20023, '20023_Raw_225gm', 'Raw', '225gm', 48.75, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2237, 430, 20023, '20023_Raw_450 gm', 'Raw', '450 gm', 86.50, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2238, 430, 20023, '20023_Raw_1kg', 'Raw', '1kg', 168.00, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2239, 430, 20023, '20023_Powder_90 gm', 'Powder', '90 gm', 18.00, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2240, 430, 20023, '20023_Powder_225gm', 'Powder', '225gm', 40.50, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2241, 430, 20023, '20023_Powder_450 gm', 'Powder', '450 gm', 72.00, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(2242, 430, 20023, '20023_Powder_1kg', 'Powder', '1kg', 140.00, 0.00, 20, 1, 'active', '2023-01-16 05:02:02', '2023-01-16 05:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(293, 430, 1, '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(294, 430, 8, '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(295, 430, 5, '2023-01-16 05:02:02', '2023-01-16 05:02:02'),
(296, 430, 12, '2023-01-16 05:02:02', '2023-01-16 05:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_forms`
--

CREATE TABLE `product_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_forms`
--

INSERT INTO `product_forms` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'Raw', 'raw', '2022-10-21 08:22:06', '2022-10-21 08:22:06'),
(4, 'Powder', 'powder', '2022-10-21 08:22:14', '2022-10-21 08:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `plu`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, 2, 'hhhh', 'active', '2022-12-31 03:51:17', '2022-12-31 07:06:41'),
(2, 1, 8, NULL, 4, 'hello', 'active', '2023-01-02 03:33:46', '2023-01-02 03:34:05'),
(3, 1, 173, NULL, 5, 'good', 'active', '2023-01-14 03:41:32', '2023-01-14 03:42:13'),
(4, 1, 415, 65858, 5, 'Best', 'active', '2023-01-14 03:43:15', '2023-01-14 03:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CsxmKYl844x8mzV1fEVlyzMEmS0VaG2v29FpkjgJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo3OntzOjEwOiJjYXJ0X2l0ZW1zIjtpOjQ7czo0OiJjYXJ0IjthOjQ6e2k6MDthOjQ6e3M6NDoiZm9ybSI7YToxOntpOjA7czozOiJSYXciO31zOjU6InByaWNlIjthOjE6e2k6MDtzOjU6IjE4LjAwIjt9czo0OiJzaXplIjthOjE6e2k6MDtzOjQ6IjkwIGciO31zOjg6InF1YW50aXR5IjthOjE6e2k6MDtzOjE6IjMiO319aToxO2E6NDp7czo0OiJmb3JtIjthOjE6e2k6MDtzOjM6IlJhdyI7fXM6NToicHJpY2UiO2E6MTp7aTowO3M6NToiMTguMDAiO31zOjQ6InNpemUiO2E6MTp7aTowO3M6NDoiOTAgZyI7fXM6ODoicXVhbnRpdHkiO2E6MTp7aTowO3M6MToiMSI7fX1pOjI7YTo0OntzOjQ6ImZvcm0iO2E6MTp7aTowO3M6MzoiUmF3Ijt9czo1OiJwcmljZSI7YToxOntpOjA7czo1OiI5MC4wMCI7fXM6NDoic2l6ZSI7YToxOntpOjA7czo0OiI5MCBnIjt9czo4OiJxdWFudGl0eSI7YToxOntpOjA7czoxOiIxIjt9fWk6MzthOjQ6e3M6NDoiZm9ybSI7YToxOntpOjA7czozOiJSYXciO31zOjU6InByaWNlIjthOjE6e2k6MDtzOjU6IjkwLjAwIjt9czo0OiJzaXplIjthOjE6e2k6MDtzOjQ6IjkwIGciO31zOjg6InF1YW50aXR5IjthOjE6e2k6MDtzOjE6IjMiO319fXM6NjoiX3Rva2VuIjtzOjQwOiJrYlpRZnR6NTBqTUFIN1N3NWtUaDJUcnNvaEpQc2JqVTM0d05Uakg2IjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0NDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2ZpbGVtYW5hZ2VyP3R5cGU9aW1hZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoidXNlciI7czoxNToiYWRtaW5AZ21haWwuY29tIjt9', 1674041546);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/3.jpeg', 'Al Ras, Diera , P.O Box - 64389  Dubai - U.A.E', '+971506810195', 'theherbroom.2001@gmail.com', NULL, '2022-12-20 01:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Dubai', '10.00', 'active', '2022-07-11 04:29:45', '2022-08-29 02:19:32'),
(6, 'Bur Dubai', '15.00', 'active', '2022-07-11 04:29:57', '2022-08-29 02:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2022-12-27 12:38:55', '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL),
(2, 'zafar', 'zafaraqbal786@gmail.com', NULL, '$2y$10$tnYxpK2gMunDrGRx87kS2./NEnnaVlozLrIhweXlhwGzSncHqiXOi', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-27 08:46:11', '2022-12-27 08:46:11'),
(3, 'Vikas', 'Prajapativikas11060@gmail.com', NULL, '$2y$10$ud/YPWeySExIrWuy7g.v3.VB3CdVj9e6u4TdZtVIfdcDRywV3xjmu', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-28 02:28:19', '2022-12-28 02:28:19'),
(4, 'Shahzad', 'malikshahzad1644@gmail.com', NULL, '$2y$10$ZTxhjAvcCBgQBCX8qY85t./QW/6NKzHQLlUjkclLbjXI/J9tdkOZe', NULL, 'admin', NULL, NULL, 'active', NULL, '2022-12-28 07:42:26', '2022-12-28 07:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plu` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_product_atrr_id_foreign` (`product_atrr_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`),
  ADD KEY `plu` (`plu`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plu` (`plu`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_attributes_sku_unique` (`sku`),
  ADD KEY `products_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_forms`
--
ALTER TABLE `product_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_slug_unique` (`slug`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=431;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2243;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `product_forms`
--
ALTER TABLE `product_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_atrr_id_foreign` FOREIGN KEY (`product_atrr_id`) REFERENCES `products_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD CONSTRAINT `products_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
