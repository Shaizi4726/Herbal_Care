-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 02:12 PM
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
-- Database: `abc`
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
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Herb', 'herb', '/storage/photos/1/3.jpeg', '<p>Herb Brand</p>', 'active', '2022-07-11 04:35:41', '2022-07-13 02:38:05'),
(7, 'The Herb Room', 'the-herb-room', '/storage/photos/1/Banner/WhatsApp Image 2022-07-26 at 3.18.35 PM.png', NULL, 'active', '2022-08-13 03:49:27', '2022-08-13 03:56:40'),
(12, 'The Herb Room', 'the-herb-room-2209295222-302', '/storage/photos/1/Banner/Banner 5.jpg', NULL, 'active', '2022-09-29 07:52:22', '2022-09-29 07:52:22');

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
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
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

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `size`, `status`, `quantity`, `amount`, `tax_amount`, `t_amount`, `created_at`, `updated_at`) VALUES
(5, 2, NULL, 1, 151.20, '900 grm', 'new', 2, 302.40, 15.12, 287.28, '2022-11-21 10:17:57', '2022-11-21 10:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Botanical Herbs & Extracts', 'botanical-herbs-extracts', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:35:01', '2022-10-26 09:35:01'),
(2, 'Botanical Herbs', 'botanical-herbs', NULL, NULL, 0, 1, NULL, 'active', '2022-10-26 09:35:33', '2022-10-26 09:35:33'),
(3, 'Natural Minerals', 'natural-minerals', NULL, NULL, 0, 1, NULL, 'active', '2022-10-26 09:36:12', '2022-10-26 09:36:12'),
(4, 'Gums & Resins', 'gums-resins', NULL, NULL, 0, 1, NULL, 'active', '2022-10-26 09:36:54', '2022-10-26 09:36:54'),
(5, 'Oil Seeds', 'oil-seeds', NULL, NULL, 0, 1, NULL, 'active', '2022-10-26 09:37:14', '2022-10-26 09:37:14'),
(6, 'Natural Herbal Oils & Mists', 'oil-seeds-2210263759-790', NULL, NULL, 0, NULL, NULL, 'active', '2022-10-26 09:37:59', '2022-11-09 09:58:01'),
(7, 'Natural Cleansing Raw Material, Face Packs, Body Butters', 'natural-cleansing-raw-material-face-packs-body-butters', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:39:22', '2022-10-26 09:39:22'),
(8, 'Herbal Teas', 'herbal-teas', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:39:56', '2022-10-26 09:39:56'),
(9, 'Brands & Herbal Products', 'brands-herbal-products', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:40:12', '2022-10-26 09:40:12'),
(10, 'Natural Honey & Jams', 'natural-honey-jams', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:40:26', '2022-10-26 09:40:26'),
(11, 'Spice, Salts & Superfood', 'spice-salts-superfood', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:40:40', '2022-10-26 09:40:40'),
(12, 'Spices & Salts', 'spices-salts', NULL, NULL, 0, 11, NULL, 'active', '2022-10-26 09:41:08', '2022-10-26 09:41:08'),
(13, 'Superfood', 'superfood', NULL, NULL, 0, 11, NULL, 'active', '2022-10-26 09:41:30', '2022-10-26 09:41:30'),
(14, 'Herbal Books & Education', 'herbal-books-education', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:41:43', '2022-10-26 09:41:43'),
(15, 'Used Book', 'used-book', NULL, NULL, 0, 14, NULL, 'active', '2022-10-26 09:42:18', '2022-10-26 09:42:18'),
(16, 'Attar & Perfumes', 'attar-perfumes', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:42:31', '2022-10-26 09:42:31'),
(17, 'Gift Items', 'gift-items', NULL, NULL, 1, NULL, NULL, 'active', '2022-10-26 09:42:43', '2022-10-26 09:42:43');

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
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Best Offer', 'test', '/storage/photos/1/Gift/Sale-01.jpg', '<p>Best Offer and Best Price</p>', 'active', '2022-10-08 04:55:29', '2022-10-08 07:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '/1667559432_amla_powder1.jpg', 1, '2022-11-16 09:12:16', '2022-11-16 09:12:16'),
(2, '/1667559432_Ashwagandha 2.jpg', 1, '2022-11-16 09:12:16', '2022-11-16 09:12:16'),
(3, '/1667559432_Ashwagandha_powder.jpg', 1, '2022-11-16 09:12:16', '2022-11-16 09:12:16'),
(4, '/1667560078_herbal.jpg', 2, '2022-11-16 09:12:16', '2022-11-16 09:12:16'),
(5, '/1667560078_herbal-removebg-preview (1).png', 2, '2022-11-16 09:12:16', '2022-11-16 09:12:16'),
(6, '/1667560078_oil.jpg', 2, '2022-11-16 09:12:16', '2022-11-16 09:12:16');

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
(24, '2020_07_11_063932_create_product_forms_table', 5);

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
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
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
  `scientific` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `benafit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
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

INSERT INTO `products` (`id`, `title`, `scientific`, `slug`, `summary`, `benafit`, `description`, `photo`, `stock`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Silk Pods', 'Bombyx Mori', 'Silk Pods', 'Abresham, Silk Pods,', '• Contains High level of Calcium<br>\n• Contains High level of protiens<br>\n• Contains Vitamin B\n', NULL, '/storage/photos/1/Untitled-2.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-22 04:37:08'),
(2, 'Wormwood', 'Artemisia Absinthium', 'Wormwood', 'Afsanteen, Wormwood, ', '• Increases Appetite<br>\n• Improves Digestion\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(3, 'Dodder', 'Cuscuta Reflexa Roxb.', 'Dodder', 'Aftimoon, Dodder,  Hellweed', '• May treats urinary tracts<br>\n• May treat hepatic disorders\n', NULL, '/storage/photos/1/Gums/Gum Powder/Gum Kikar Powder.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(4, 'Carrom Seeds', 'Trachysperum Ammi', 'Carrom Seeds', 'Ajwain, Carrom Seeds, Bijr Zamuta, ', '• Improves Cholestrol levels<br>\n• May Lower Blood pressure<br>\n• May prevent coughing and imporves Airflow\n', NULL, '/storage/photos/1/Gums/Gum Powder/Gum Powder.jpg', 20, 'new', 'active', 15.75, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(5, 'Black Henbane', 'Hyoscyamus Niger', 'Black Henbane', 'Ajwain Khurasani White, Black Henbane', '• Improves bone health<br>\n• May treat toothache<br>\n• May relieves Stomach Pain\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Arabic.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:47:36'),
(6, 'Pellitory Roots', 'Anacyclus Pyrethrum', 'Pellitory Roots', 'Akarkara Thick, Pellitory Roots, Oud Al Kara Magrabi,', '• Improves digestion<br>\n• May relieves toothache\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Copal.jpg', 20, 'new', 'active', 630.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:47:49'),
(7, 'Flax Seeds', 'Linium Usitatissimum', 'Flax Seeds', 'Alsi, Flax Seeds, Bijr Kataan,', '• High in Omega-3 fats<br>\n• Rich in dietary fiber<br>\n• May Improves Cholestrol<br>\n• Lower Blood Pressure\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Karaya.jpg', 20, 'new', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:47:59'),
(8, 'Bush Grape', 'Cayratia Carnosa', 'Bush Grape', 'Amalbed, Bush Grape, Cissus Trifolia,', '• Helps enhance spleen function<br>\n• Manages the gastro-intestinal tract<br>\n• Manages the gastro-intestinal tract\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Myrrh.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:48:10'),
(9, 'Golden Shower', 'Cassia Fishtula', 'Golden Shower', 'Amaltas, Golden Shower, Khaich Amber, ', '• Improves digestion<br>\n• May treats joint pains<br>\n• May useful in fever\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(10, 'Golden Shower', 'Cassia Fishtula', 'Golden Shower', 'Amaltas Gudda, Golden Shower', '• Improves digestion<br>\n• May treats joint pains<br>\n• May useful in fever\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(11, 'Mango Ginger', 'Curcuma Aromatica', 'Mango Ginger', 'Amba Haldi, Mango Ginger, Kurkum Kabir, White Turmeric', '• Treats skin problems<br>\n• May treats acne<br>\n• May useful in treating boils\n', NULL, '/storage/photos/1/Gums/Gum Powder/Gum Kikar Powder.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(12, 'Ambergris', 'Ambergresea', 'Ambergris', 'Amber, Ambergris, Amber Azrak, ', NULL, NULL, '/storage/photos/1/Gums/Gum Powder/Gum Powder.jpg', 20, 'new', 'active', 78.75, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(13, 'Indian Gooseberry', 'Emblica Officinalis', 'Indian Gooseberry', 'Amla, Indian Gooseberry, Amlaj, ', '• Boosts Immunity<br>\n• Beautifies Hair<br>\n• Improves Skin Health\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Arabic.jpg', 20, 'new', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(14, 'Sulphur', 'Sulphur', 'Sulphur', 'Amlasar, Sulphur, Gandak, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Gum Copal.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(15, 'Indian Sarsaparillia', 'Hemidesmus Indicus', 'Indian Sarsaparillia', 'Anatmool, Indian Sarsaparillia, Nanaree, ', '• Helpful in relieving burning sensations<br>\n• Aids Digestion <br>\n• Helpful in purifying blood\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Karaya.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(16, 'Pomegranate Peel', 'Punica Granatum', 'Pomegranate Peel', 'Anar Chilka, Pomegranate, Khashar Rhumaan, ', '• Rich Source of Vitamin C<br>\n• Reduce Skin Roughness<br>\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Myrrh.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(17, 'Anise Seeds', 'Pimpinella Anisum', 'Anise Seeds', 'Anise Seed, Anise Seeds, Yansoon, ', '• May fight stomach ulcers<br>\n• Keep Blood Sugar Levels in Check<br>\n• May reduce symptoms of Depression\n', NULL, '/storage/photos/1/Gums/Gum Resins/Styrax Benzoin Dry.jpg', 20, 'new', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(18, 'Snake Roots', 'Polygonum Bistorta linn.', 'Snake Roots', 'Anjbar, Snake Roots', '• Strenthens Heart and Liver by reducing intrinsic heat<br>\n• Helpful in healing wounds of lungs\n', NULL, '/storage\\photos\\1\\Gums\\Gum Resins\\Gum of Khejri Tree.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(19, 'Castor Seeds', 'Ricinus Communis', 'Castor Seeds', 'Arandi Beej, Castor Seeds, Bijr Kharwaa, ', '• Promotes Wounded Heals<br>\n• Reduces Achne<br>\n• Keep your Hair and Scalp Healthy<br>\n', NULL, '/storage/photos/1/Gums/Gum Resins/Gum Ollibanum.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(20, 'White Marudah', 'Termilia Arjna', 'White Marudah', 'Arjun, White Marudah, Arjuna,', '• May helps is strenthening the Heart Muscles<br>\n• May help in reducing the high blood pressure\n', NULL, '/storage/photos/1/Untitled-2.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-22 05:09:59'),
(21, 'Garden Cress', 'Lepidium Sativum', 'Garden Cress', 'Aselio, Garden Cress, Habbat ul Amraa, ', '• Helps in relieving the symptoms of Constipation and Indgestion<br>\n• May treat colic issue\n', NULL, '/storage/photos/1/Gums/Gum Resins/Salai Tree.jpg', 20, 'new', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(22, 'Ashwagandha', 'Withania Somnifera', 'Ashwagandha', 'Ashwagandha, Winter Cherry, Asgand Nagory, ', '• May reduce Blood Sugar levels<br>\n• Boost Immunity\n', NULL, '/storage/photos/1/Gums/Gum Resins/Shorea Robusta Gaertn.jpg', 20, 'new', 'active', 100.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(23, 'Ashoka', 'Sarala Asoca', 'Ashoka', 'Ashok, Ashoka, Ashoka, ', '• May help in relieving pain and healing wounds<br>\n• Helpful in reducing of Oily and Dull Skin \n', NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Cocoa Butter.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(24, 'Proralia', 'Psoralea Corylifolia', 'Proralia', 'Babchi, Proralia, Gumushki, ', '• May helps in reducing Skin Boils<br>\n• Improves Hair Growth<br>\n• May Control Dandruff\n', NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Cocoa Butter.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(25, 'Babool Chal', 'Acacia Nilotica', 'Babool Chal', 'Babool Chal, Tomentosa Babool', '• may helps in healing wounds, cuts and Injuries<br>\n• Controls Bleeding\n', NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Kokum Butter.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(26, 'Beleric', 'Terminalia Belerila Roxb.', 'Beleric', 'Bahera, Beleric Myrobalan, Balila ', '• Helps in controlling Cough and Cold<br>\n• Helps in Weight Loss<br>\n• Boost Immunity\n', NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Mango Butter.jpg', 20, 'hot', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(27, 'Corchorus', 'Corchdrus Depresses', 'Corchorus', 'Bu phali, Corchorus, Bufali, Bahu Phali', '• Helps Bone Health<br>\n• May Treats Bone Joints\n', NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Shea Butter.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(28, 'Nepeta', 'Nepeta Hindostana', 'Nepeta', 'Bajrang Boya', '• Promotes Heart health<br>\n• May relieves Anxiety\n', NULL, '/storage/photos/1/Herbal Cosmetic/Cosmetic Ingredient/Aloe vera gel.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(29, 'China Berry', 'Melia Azedarach', 'China Berry', 'Bakayan', '• May treats skin disorders<br>\n• May reduce achne\n', NULL, '/storage/photos/1/Herbal Cosmetic/Cosmetic Ingredient/Glycerine.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(30, 'Balanga', 'Lallemantia Royleana', 'Balanga', 'Basil Seeds Long, Tukhma Malanga', '• Helps in Weight Loss<br>\n• Reduces Body Heat<br>\n• Controls Blood Sugar Levels\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'hot', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(31, 'Indian Spiknard', 'Nardostachys Chinensis', 'Indian Spiknard', 'Balchar, Indian Spiknard, Sumbalteef, ', '• Boost Hair Growth<br>\n• May treat Insomnia\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Green Clay.jpg', 20, 'hot', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(32, 'Banafsaj', 'Viola Odorata Indian', 'Banafsaj', 'Banaksha , Sweet Violet Indian', '• Reduces Stress<br>\n• May helpful in Common Cold\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Pink Clay.jpg', 20, 'hot', 'active', 630.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(33, 'Malabar Nuts', 'Adhatoda Vasica', 'Malabar Nuts', 'Bansa Patta, Malabar Nuts', '• May loosen chest congestion<br>\n• May helpful in Common Cold\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Red Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(34, 'Quince Seeds', 'Cydonia Vulgaris', 'Quince Seeds', 'Beedana, Quince, Bijr Sifarjal, ', '• Improves digestion<br>\n• Rich in dietary fiber\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Fullers Earth Clay.jpg', 20, 'hot', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(35, 'Golden Dock Red', 'Rumex Maritimus', 'Golden Dock Red', 'Beej Band Lal, Indian Mallow', '• Helps in respiratory track<br>\n• Helps in reducing Itching\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Rhassoul Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(36, 'Golden Dock Black', 'Rumex Maritimus', 'Golden Dock Black', 'Beej Band Kala, Indian Mallow', '• Helps in respiratory track<br>\n• helps in reducing Itching\n', NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Zeolite Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(37, 'Bengal Quince', 'Aegle Marmelos Correa', 'Bengal Quince', 'Belgiri, Bengal Quince', '• Reduces gastric ulcers<br>\n• Aids in digestion\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Asphaltum.jpg', 20, 'hot', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(38, 'Silicate of Lime', 'Silicate of Lime', 'Silicate of Lime', 'Berpather, Hajr ul Fakk, Sange Yahud, ', '• Helps in dissolving kidney stones<br>\n• Helps in reducing Itching\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Katha kala.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(39, 'Narrow Leaf', 'Indigofera linifolium', 'Narrow Leaf', 'Bhangra, Narrow Leaf', '• Antiseptic<br>\n• Coagulant<br>\n• Anti-inflammatory\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Kushta Sona.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(40, 'Red Behen', 'Salvia Haematodes', 'Red Behen', 'Bheman Lal, Red Behen, Bheman Ahmer, ', '• Promotes Heart health<br>\n• Improves Memory\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Peppermint.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(41, 'White Rhapontic', 'Cantaurea Behen Linn.', 'White Rhapontic', 'Bheman Safed, White Rhapontic, Bheman Abhiyat, ', '• Improves Complexion of skin<br>\n• Beneficial in deafness<br>\n• Treats General Body Weakness\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Spirulina.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(42, 'Marking Nut Tree', 'Semecarpus Anacardium', 'Marking Nut Tree', 'Bhilawa, Marking Nut Tree', '• Improves Digestive health<br>\n• Helps improve scaly skin<br>\n• Controls Blood Sugar Levels\n', NULL, '/storage/photos/1/Herbs/Herbal Extracts/Thyme Extract.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(43, 'Bhumi Amla', 'Phyllanthus Niruri', 'Bhumi Amla', 'Bhumi Amla, Stonebreaker, Gale of the wind, ', '• Helps in controlling Cough and Cold<br>\n• Improves Digestive Disorders\n', NULL, '/storage/photos/1/Herbs/Herbal Powder/Sandalwood Powder.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(44, 'Rajad Al Asad', 'Corydalis Govaniana', 'Rajad Al Asad', 'Kabutar Pau, Govans Corydalis, Rajad Al Asad, ', '• Helps in treatment of disorders from poisoning, swelling of the limbs<br>\n• Helps in treatment of pain due to worm infestation\n', NULL, '/storage/photos/1/Herbs/Seeds/Carrot Seed.jpg', 20, 'default', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(45, 'Bhuzidan', 'Pyrethrum Indicum', 'Bhuzidan', 'Pyrethrum', '• Improves digestion<br>\n• May relieves toothache\n', NULL, '/storage/photos/1/Herbs/Seeds/Fenugreek Seed.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(46, 'Elephant Creeper', 'Argyreia Nervosa', 'Elephant Creeper', 'Bidara Lakad, Elephant Creeper', '• Aids Digestion <br>\n• May treats Constipation\n', NULL, '/storage/photos/1/Herbs/Single Herbs/ahhwagandha powder.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(47, 'Giant Potatoe Roots', 'Pueraria Tuberosa', 'Giant Potatoe Roots', 'Bidarikand, Giant Potatoe Roots', '• Promotes Wounded Heals<br>\n• improves skin texture\n', NULL, '/storage/photos/1/Herbs/Single Herbs/amla powder.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(48, 'Bristly Luffa', 'Luffa Enchinata Roxb.', 'Bristly Luffa', 'Bindal Doda, Bristly Luffa', '• Helps in treatment of jaundice<br>\n• Strengthens Heart and Liver by reducing intrinsic heat\n', NULL, '/storage/photos/1/Herbs/Single Herbs/amla powder1.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(49, 'Cotton Seeds', 'Gossypium Hirsutum', 'Cotton Seeds', 'Binola Giri, Cotton Seeds, Pamba Dana, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Amla.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(50, 'Rosin', 'Resin', 'Rosin', 'Biroza, Rosin, Damar, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/amla1.jpg', 20, 'default', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(51, 'Polypody', 'Polypodium Vulgare', 'Polypody', 'Bisfatch, Polypody', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Ashwagandha 2.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(52, 'Bacopa', 'Bacopa Monnieri', 'Bacopa', 'Brahmi Booti, Bacopa, Thyme Leaves Gratiola, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Ashwagandha powder.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(53, 'Camels Thistle', 'Echinops Echinatus', 'Camels Thistle', 'Brahmi Dandi, Camels Thistle', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Benefits-Of-Ashwagandha.png', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(54, 'Yarrow', 'Achillea Millefollium Linn.', 'Yarrow', 'Brinjasif, Yarrow', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Benefits-Of-Ashwagandha.png', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(55, 'Cassia Absus', 'Cassia Absus', 'Cassia Absus', 'Chaskoo, Ringworm Cassia, Chasmizaa, ', NULL, NULL, '/storage/photos/1/Herbs/Ashwagandha 1.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(56, 'Chia Seed', 'Salvia Hispanica', 'Chia Seed', 'Chia Seeds', NULL, NULL, '/storage/photos/1/Herbs/LOBAN.jpg', 20, 'default', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(57, 'Red Betelnut', 'Areca Catechu Linn.', 'Red Betelnut', 'Chikni Supari Lal, Red Betelnut, Fufil Ahmer, ', NULL, NULL, '/storage/photos/1/Herbs/pr 1.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(58, 'Chirata Indian', 'Swertia Chirata', 'Chirata Indian', 'Chiraytha Indian, Cirata, Bitter Stick Indian, ', NULL, NULL, '/storage/photos/1/Herbs/pr 2.jpg', 20, 'default', 'active', 90.09, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(59, 'Chirata Nepal', 'Swertia Chirata', 'Chirata Nepal', 'Chiraytha Nepal, Cirata, Bitter Stick Nepal, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Castor.jpg', 20, 'default', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(60, 'Charoli', 'Buchanania Lanzan', 'Charoli', 'Chironji, Cuddapah Almond', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Neem.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(61, 'Wild Leadwort', 'Plumbago Zeylanica', 'Wild Leadwort', 'Chitrakmool, Wild Leadwort', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Sessame.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(62, 'China Root', 'Smilax Chinalium', 'China Root', 'Chobchini, China Root', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Essential Oil/Clove.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(63, 'Stone Flower', 'Parmelia Perlata', 'Stone Flower', 'Dager Phool, Stone Flower, Shaiba, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Essential Oil/Nutmeg.jpg', 20, 'default', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(64, 'Sal Tree', 'Shorea Robusta Gaertn', 'Sal Tree', 'Damar Batu, Sal Tree, Raal Safied, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Hydrosols & Herbal Water/Rose Hydrosol.jpg', 20, 'default', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(65, 'Gum Dragon Blood', 'Dracaena Cinnabari', 'Gum Dragon Blood', 'Damlakhven, Gum Dragon Blood', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Natural Herbal Oil/Balsam Oil.jpg', 20, 'default', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(66, 'Walnut Bark', 'Juglans Regia Linn.', 'Walnut Bark', 'Dandasa, Walnut Bark, Dairam, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Natural Herbal Oil/Chamomile.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(67, 'Leopards Bane', 'Doronicum Roylei', 'Leopards Bane', 'Darunj Akrabi, Leopards Bane', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Natural Herbal Oil/Rose.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(68, 'Black Cardmom Seeds', 'Amomum Subulatum', 'Black Cardmom Seeds', 'Elaichi Kali, Black Cardmom Seeds, Hail Aswat, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Natural Herbal Oil/Saffron Oil.jpg', 20, 'default', 'active', 44.10, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(69, 'Fiber Fruit', 'Corylus Avellana Linn.', 'Fiber Fruit', 'Findak, Fiber Fruit ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Natural Herbal Oil/Tetree oil.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(70, 'Alum Red', 'Potassium Aluminium Sulfate', 'Alum Red', 'Fitkari lal, Alum Red, Shab Ahmer, ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp [ Large Crystal ].jpg', 20, 'default', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(71, 'Alum White', 'Potassium Aluminium Sulfate', 'Alum White', 'Fitkari Safed, Alum White, Shab Abhiyat, ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Bowl with Balls.jpg', 20, 'default', 'active', 9.45, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(72, 'Fox Nuts', 'Euryahle Ferox', 'Fox Nuts', ' Phool Makhana, Fox Nuts, Fool Makhana, ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Bowl with Hearts.jpg', 20, 'default', 'active', 50.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(73, 'Carrot Seeds', 'Daucus Carota', 'Carrot Seeds', 'Gajar beej, Carrot Seeds, Bijr Jizar, ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Heart.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(74, 'China Clay', 'Kaolinum', 'China Clay', 'Geru Lal, China Clay', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Large Ball.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(75, 'Giloy', 'Tinospora Cordifolia', 'Giloy', 'Gilo Lakdi, Heart Leaved Moonseed, Cocculus Cordifolius, ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Mushroom.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(76, 'Ginseng Red', 'Panax Ginseng', 'Ginseng Red', 'Ginseng', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Pyramid.jpg', 20, 'default', 'active', 378.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(77, 'Ginseng White', 'Panax Ginseng', 'Ginseng White', 'Ginseng ', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Small Ball.jpg', 20, 'default', 'active', 504.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(78, 'Godvach', 'Ajmoda', 'Godvach', 'Ajmoda, Sweet Flag', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Thick Bricks.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(79, 'Land Caltrops', 'Tribulus Terrestric', 'Land Caltrops', 'Gokhru, Land Caltrops', NULL, NULL, '/storage/photos/1/Other/Herbal Gift Set/Himalayan Salt Lamp Thin Bricks.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(80, 'Gond Katira', 'Astragalus Gummifer', 'Gond Katira', 'Gum Tragacanth, Gum Karaya', NULL, NULL, '/storage/photos/1/Spices & Salts/Edible Salt/Black Salt.jpg', 20, 'default', 'active', 50.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(81, 'Gond Kikar', 'Acacia Nilotica', 'Gond Kikar', 'Samukh Arabi Sudani, Acacia', NULL, NULL, '/storage/photos/1/Spices & Salts/Edible Salt/Himaliyan Pink Salt.jpg', 20, 'default', 'active', 47.25, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(82, 'Gond Kondru', 'Boswellia Serrata Roxb.', 'Gond Kondru', 'Loban Ollibanum, Ollibanum', NULL, NULL, '/storage/photos/1/Spices & Salts/Salt Powder/Black Salt Powder.jpg', 20, 'default', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(83, 'East Indian Globe Thistle', 'Sphaeranthus Inducus', 'East Indian Globe Thistle', 'Gorakh Mundi, East Indian Globe Thistle', NULL, NULL, '/storage/photos/1/Spices & Salts/Spice Powder/Cinnamon Powder.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(84, 'Guggal Indian', 'Commiphora Mukul', 'Guggal Indian', 'Mukul Bukhoor, Salai Tree', NULL, NULL, '/storage/photos/1/Spices & Salts/Spice Powder/Turmeric Powder.jpg', 20, 'default', 'active', 47.25, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(85, 'Guggal Yemen', 'Commiphora Mukul', 'Guggal Yemen', 'Mukul Akal, Salai Tree', NULL, NULL, '/storage/photos/1/Spices & Salts/Spices/oregano.jpg', 20, 'default', 'active', 330.75, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(86, 'Flower of Pomegranate', 'Punica Granatum', 'Flower of Pomegranate', 'Gul Anar, Pomegranate, Gul e Rumaan, ', NULL, NULL, '/storage/photos/1/Spices & Salts/Spices/Tuwmeric.jpg', 20, 'default', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(87, 'Chamomile Stick', 'Matricaria Chamomilla', 'Chamomile Stick', 'Gul E Babuna, Chamomile Stick, Babunaj, ', NULL, NULL, '/storage/photos/1/Teas/Green Tea/Green Tea With Laravender.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(88, 'Fir Flame Bush', 'Woodfordia', 'Fir Flame Bush', 'Gul e Dhava, Fir Flame Bush', NULL, NULL, '/storage/photos/1/Teas/Green Tea/Green Tea With Rose.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(89, 'Borage Flower', 'Borago Officinalis', 'Borage Flower', 'Gul Gajban, Borage', NULL, NULL, '/storage/photos/1/Teas/Herbal Teas/Chamomile Tea.jpg', 20, 'default', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(90, 'Bastard Tree', 'Butea Monosperma', 'Bastard Tree', 'Gul Tesu, Bastard Tree', NULL, NULL, '/storage/photos/1/Teas/Herbal Teas/Lavender Tea.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(91, 'Gymnema', 'Gymnema Sylvestre', 'Gymnema', 'Gurmar Butti, Gymnema, Naked Thread, ', NULL, NULL, '/storage/photos/1/2 - Copy.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(92, 'Habulas', 'Mytrus Communis Linn.', 'Habulas', 'Habulas, Myrtle', NULL, NULL, '/storage/photos/1/2.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(93, 'Hartaki (Kabuli Jumbo)', 'Terminalia Chebula ', 'Hartaki (Kabuli Jumbo)', 'Harad Kabuli Jumbo, Chebulic Myrobalan, Halila Kabuli Kabir Jumbo, ', NULL, NULL, '/storage/photos/1/3.jpeg', 20, 'new', 'active', 378.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(94, 'Hartaki (Kabuli Large)', 'Terminalia Chebula', 'Hartaki (Kabuli Large)', 'Harad Kabuli Large, Chebulic Myrobalan, Halila Kabuli Kabir, ', NULL, NULL, '/storage/photos/1/whiteSoil.jpg', 20, 'new', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(95, 'Hartaki (Kabuli Small)', 'Terminalia Chebula', 'Hartaki (Kabuli Small)', 'Harad Kabuli Small, Chebulic Myrobalan, Halila Kabuli Sageer, ', NULL, NULL, '/storage/photos/1/Lavender Oil.jpg', 20, 'new', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(96, 'Hartaki Black', 'Terminalia Chebula', 'Hartaki Black', 'Harad Kali, Chebulic Myrobalan, Halila Aswat, Harad Black', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(97, 'Hartaki Yellow', 'Terminalia Chebula', 'Hartaki Yellow', 'Harad Pilli, Chebulic Myrobalan, Halila Asfar, Harad Yellow', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'new', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(98, 'Hartaki Peeled', 'Terminalia Chebula', 'Hartaki Peeled', 'Harad Pilli Chilka, Chebulic Myrobalan, Khashar Halila Asfar, Harad Peeled', NULL, NULL, '/storage/photos/1/Gums/Gum Powder/Gum Kikar Powder.jpg', 20, 'new', 'active', 50.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(99, 'Jalap roots', 'Ipomoea Purga', 'Jalap roots', 'Harad Zulafa, Jalap roots, Halila Zulafa, ', NULL, NULL, '/storage/photos/1/Gums/Gum Powder/Gum Powder.jpg', 20, 'new', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(100, 'Syrian Rue', 'Peganum harmala', 'Syrian Rue', 'Harmal, Syrian Rue, Isfhaan, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Gum Copal.jpg', 20, 'new', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(101, 'Orpiment', 'Orpiment', 'Orpiment', 'Hartal, Orpiment, Zarnick, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Gum Karaya.jpg', 20, 'new', 'active', 113.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(102, 'Whiteoxide of Arsenic', 'Arsenic Sulphate', 'Whiteoxide of Arsenic', 'Hartal Godanti, Whiteoxide of Arsenic', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Gum Myrrh.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(103, 'Juniper', 'Juniperus Communis Linn.', 'Juniper', 'Hauber, Juniper', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Styrax Benzoin Dry.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(104, 'Asafoetida Indian', 'Ferula Assafoetida', 'Asafoetida Indian', 'Hing Brown, Asafoetida, Halteet Bunee, ', NULL, NULL, '/storage\\photos\\1\\Gums\\Gum Resins\\Gum of Khejri Tree.jpg', 20, 'new', 'active', 94.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(105, 'Asafoetida Iranian', 'Ferula Assafoetida', 'Asafoetida Iranian', 'Hing White, Asafoetida, Halteet Abhiyat, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Gum Ollibanum.jpg', 20, 'new', 'active', 94.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(106, 'Asafoetida Powder', 'Ferula Assafoetida', 'Asafoetida Powder', 'Hing Powder, Asafoetida, Halteet Mathoon, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Resin.jpg', 20, 'new', 'active', 50.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(107, 'Gum Myrrh', 'Commiphora Myrrha', 'Gum Myrrh', 'Hirabol, Gum Myrrh, Murr, ', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Salai Tree.jpg', 20, 'new', 'active', 113.40, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(108, 'Green Vitrol', 'Ferri Sulphas', 'Green Vitrol', 'Hirakasis, Green Vitrol', NULL, NULL, '/storage/photos/1/Gums/Gum Resins/Shorea Robusta Gaertn.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(109, 'Tamarindus Indicus', 'Tamarindus Indicus', 'Tamarindus Indicus', 'Garbeej, Tamarind Seeds, Imli Beej, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Cocoa Butter.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(110, 'Inderjo Kadwa', 'Wrughtia Tinctoria', 'Inderjo Kadwa', 'Inderjow Kadwa, Pala Indigo Plant, Lisaan Tair Murr, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Cocoa Butter.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(111, 'Inderjo Meetha', 'Wrughtia Tinctoria', 'Inderjo Meetha', 'Inderjow Meetha, Pala Indigo Plant, Lisaan Tair Hayloo, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Kokum Butter.jpg', 20, 'new', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(112, 'Red Fenugreek', 'Trigonella Foenumgraecum', 'Red Fenugreek', 'Methi Lal, Red Fenugreek ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Mango Butter.jpg', 20, 'new', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(113, 'Plantago Husk', 'Plantago Ovata', 'Plantago Husk', 'Isabgul Bhusi, Plantago Husk, Khashar Katuna, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Body Butters/Shea Butter.jpg', 20, 'hot', 'active', 66.15, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(114, 'Plantago Seeds', 'Plantago Ispaghula', 'Plantago Seeds', 'Isabgul Dana, Plantago Seeds, Bijr Katuna, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Cosmetic Ingredient/Aloe vera gel.jpg', 20, 'hot', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(115, 'Delphinium', 'Delphinium Denudatum', 'Delphinium', 'Jadwaar Khatai, Delphinium', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Cosmetic Ingredient/Glycerine.jpg', 20, 'hot', 'active', 2520.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(116, 'Jambola Seeds', 'Syzgium Cumini', 'Jambola Seeds', 'Jamun Gutli, Jambola Seeds, Black Plum Seeds, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Bentonite Clay.jpg', 20, 'hot', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(117, 'Round Leaved Birthwort', 'Aristolochia Rotunda', 'Round Leaved Birthwort', 'Jarawand Mudhraj, Round Leaved Birthwort, Smearwort, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Green Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(118, 'Impure Potash Carbonate', 'Potassium Carbonate', 'Impure Potash Carbonate', 'Jawakhar Papdi, Impure Potash Carbonate, , ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Pink Clay.jpg', 20, 'hot', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(119, 'Cubebs', 'Piper Cubeba Linn.', 'Cubebs', 'Kabab Chini, Cubebs, Kababa, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/French Red Clay.jpg', 20, 'hot', 'active', 226.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(120, 'Kadwa Badam', 'Prunus dulcis', 'Kadwa Badam', 'Kadwe Badam, Bittter Almond, Loz murr, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Fullers Earth Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(121, 'Maryam Flower', 'Anstatica Hierochuntica', 'Maryam Flower', 'Kaff Mariam, Leaf of Maryam, Maryiam Booti, ', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Rhassoul Clay.jpg', 20, 'hot', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(122, 'Wild Lettuce Seeds', 'Lactuca Sativa', 'Wild Lettuce Seeds', 'Kahu Beej, Wild Lettuce Seeds', NULL, NULL, '/storage/photos/1/Herbal Cosmetic/Herbal Clay/Zeolite Clay.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(123, 'Box Myrtle', 'Myrica Esulenta', 'Box Myrtle', 'Kaiphal, Box Myrtle', NULL, NULL, '/storage/photos/1/Herbs/Herbal Extracts/Kushta Sona.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(124, 'Khejri Tree', 'Prosopis cineraria', 'Khejri Tree', 'Kairuba Shami, Khejri Tree', NULL, NULL, '/storage/photos/1/Herbs/Herbal Extracts/Kushta Sona.jpg', 20, 'hot', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(125, 'Zebrawood', 'Pistacia integerrima', 'Zebrawood', 'Kakda Singhi, Zebrawood', NULL, NULL, '/storage/photos/1/Herbs/Herbal Extracts/Peppermint.jpg', 20, 'hot', 'active', 189.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(126, 'Habbe Neel', 'Ipomoea Hederacea', 'Habbe Neel', 'Kala Dana, Pharbitis Seeds, Habbe Neel, ', NULL, NULL, '/storage/photos/1/Herbs/Herbal Extracts/Spirulina.jpg', 20, 'hot', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(127, 'Kali Jiri', 'Carum Carui Linn.', 'Kali Jiri', 'Kadwi Jiri, Bitter Cumin, Kamoon Aswat Murr, ', NULL, NULL, '/storage/photos/1/Herbs/Herbal Extracts/Thyme Extract.jpg', 20, 'hot', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(128, 'Black Pepper', 'piper Nigrum', 'Black Pepper', 'Kali Mirchi, Black Pepper, Fil Fil Aswat, ', NULL, NULL, '/storage/photos/1/Herbs/Herbal Powder/Sandalwood Powder.jpg', 20, 'default', 'active', 31.50, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(129, 'Salt Petre', 'Salt Petre', 'Salt Petre', 'Kalmi Shora, Salt Petre, Shurra, ', NULL, NULL, '/storage/photos/1/Herbs/Seeds/Carrot Seed.jpg', 20, 'default', 'active', 37.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(130, 'Kalonji', 'Nigella Sativa', 'Kalonji', 'Black Seeds, Black Cumin Seeds, Habba Sauda, ', NULL, NULL, '/storage/photos/1/Herbs/Seeds/Fenugreek Seed.jpg', 20, 'default', 'active', 18.90, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(131, 'Lotus Seeds', 'Nelumbo nucifera', 'Lotus Seeds', 'Kamal Gatta, Lotus Seeds, Koldoda, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/ahhwagandha powder.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(132, 'Flame of the Forest', 'Butea frondoa', 'Flame of the Forest', 'Kamarkass, Flame of the Forest', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/amla powder.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(133, 'Kamila Powder', 'Campila', 'Kamila Powder', 'Kamphila', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/amla powder1.jpg', 20, 'default', 'active', 138.60, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(134, 'Fever Nuts', 'Caesalpinia Bonduc', 'Fever Nuts', 'Karanjwa, Fever Nuts', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Amla.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(135, 'Bitter Gourd', 'Momordica charantia', 'Bitter Gourd', 'Karela Dry, Bitter Gourd, Bitter Melon, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/amla1.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(136, 'Common Chicory', 'Cichorium intybus', 'Common Chicory', 'Kasini Beej, Common Chicory, Hindiba, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Ashwagandha 2.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(137, 'Catechu Big', 'Senegalia catechu', 'Catechu Big', 'Katha Belgaon, Catechu, Gaath, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Ashwagandha powder.jpg', 20, 'default', 'active', 226.80, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(138, 'Catechu White', 'Senegalia catechu', 'Catechu White', 'Katha Crown, Catechu, Gaath, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Benefits-Of-Ashwagandha.png', 20, 'default', 'active', 315.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(139, 'Gambier', 'Uncaria Gambir', 'Gambier', 'Katha Gambier, Gambier, Gaath, ', NULL, NULL, '/storage/photos/1/Herbs/Single Herbs/Benefits-Of-Ashwagandha.png', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(140, 'Catechu Small', 'Senegalia catechu', 'Catechu Small', 'Katha Kanpuri, Catechu, Gaath, ', NULL, NULL, '/storage/photos/1/Herbs/Ashwagandha 1.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(141, 'Catechu Sagar', 'Senegalia catechu', 'Catechu Sagar', 'Katha Sagar, Catechu, Gaath, ', NULL, NULL, '/storage/photos/1/Herbs/LOBAN.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(142, 'Saffron', 'Crocus Sativus', 'Saffron', 'Kesar, Zaffran', NULL, NULL, '/storage/photos/1/Herbs/pr 1.jpg', 20, 'default', 'active', 7560.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(143, 'Marshmallow Seeds', 'Althaea officinalis', 'Marshmallow Seeds', 'Khatmi, Marshmallow Seeds', NULL, NULL, '/storage/photos/1/Herbs/pr 2.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(144, 'Lavender Petals', 'Lavendula Officinalis', 'Lavender Petals', 'Khazama, French Lavender Petals', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Castor.jpg', 20, 'default', 'active', 126.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(145, 'Common Mallow', 'Malva Syvestris', 'Common Mallow', 'Khubazi, Common Mallow ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Neem.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(146, 'Hedge seeds', 'Sysymbrium Irio', 'Hedge seeds', 'Khubkalan, Hedge seeds, Khaksheer', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Carrier Oils/Sessame.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00'),
(147, 'Babul Fruit', 'Vachellia nilotica', 'Babul Fruit', 'Kikarfali, Babul, Gairaat, ', NULL, NULL, '/storage/photos/1/Oils & Aromatherapy/Essential Oil/Clove.jpg', 20, 'default', 'active', 63.00, 0.00, 1, 1, NULL, 7, '2022-11-16 03:36:00', '2022-11-16 03:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(2, 1, '1_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(3, 1, '1_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(4, 1, '1_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(5, 2, '2_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(6, 2, '2_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(7, 2, '2_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(8, 2, '2_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(9, 3, '3_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(10, 3, '3_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(11, 3, '3_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(12, 3, '3_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(13, 4, '4_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(14, 4, '4_Raw_225 grm', 'Raw', '225 grm', 6.07, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(15, 4, '4_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(16, 4, '4_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(17, 5, '5_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(18, 5, '5_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(19, 5, '5_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(20, 5, '5_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(21, 6, '6_Raw_90 grm', 'Raw', '90 grm', 90.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(22, 6, '6_Raw_225 grm', 'Raw', '225 grm', 202.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(23, 6, '6_Raw_450 grm', 'Raw', '450 grm', 360.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(24, 6, '6_Raw_900 grm', 'Raw', '900 grm', 630.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(25, 7, '7_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(26, 7, '7_Raw_225 grm', 'Raw', '225 grm', 6.07, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(27, 7, '7_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(28, 7, '7_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(29, 8, '8_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(30, 8, '8_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(31, 8, '8_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(32, 8, '8_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(33, 9, '9_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(34, 9, '9_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(35, 9, '9_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(36, 9, '9_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(37, 10, '10_Raw_90 grm', NULL, '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(38, 10, '10_Raw_225 grm', NULL, '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(39, 10, '10_Raw_450 grm', NULL, '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(40, 10, '10_Raw_900 grm', NULL, '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(41, 11, '11_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(42, 11, '11_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(43, 11, '11_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(44, 11, '11_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(45, 12, '12_Raw_90 grm', 'Raw', '90 grm', 11.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(46, 12, '12_Raw_225 grm', 'Raw', '225 grm', 25.31, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(47, 12, '12_Raw_450 grm', 'Raw', '450 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(48, 12, '12_Raw_900 grm', 'Raw', '900 grm', 78.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(49, 13, '13_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(50, 13, '13_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(51, 13, '13_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(52, 13, '13_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(53, 14, '14_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(54, 14, '14-Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(55, 14, '14-Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(56, 14, '14-Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(57, 15, '15_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(58, 15, '15_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(59, 15, '15_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(60, 15, '15_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(61, 16, '16_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(62, 16, '16_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(63, 16, '16_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(64, 16, '16_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(65, 17, '17_Raw_90 grm', 'Raw', '90 grm', 76.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(66, 17, '17_Raw_225 grm', 'Raw', '225 grm', 94.28, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(67, 17, '17_Raw_450 grm', 'Raw', '450 grm', 112.05, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(68, 17, '17_Raw_900 grm', 'Raw', '900 grm', 129.82, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(69, 18, '18_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(70, 18, '18_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(71, 18, '18_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(72, 18, '18_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(73, 19, '19_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(74, 19, '19_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(75, 19, '19_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(76, 19, '19_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(77, 20, '20_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(78, 20, '20_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(79, 20, '20_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(80, 20, '20_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(81, 2, '2_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(82, 2, '2_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(83, 2, '2_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(84, 2, '2_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(85, 3, '3_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(86, 3, '3_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(87, 3, '3_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(88, 3, '3_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(89, 4, '4_Pow_90 grm', 'Powder', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(90, 4, '4_Pow_225 grm', 'Powder', '225 grm', 6.08, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(91, 4, '4_Pow_450 grm', 'Powder', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(92, 4, '4_Pow_900 grm', 'Powder', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(93, 5, '5_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(94, 5, '5_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(95, 5, '5_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(96, 5, '5_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(97, 6, '6_Pow_90 grm', 'Powder', '90 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(98, 6, '6_Pow_225 grm', 'Powder', '225 grm', 243.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(99, 6, '6_Pow_450 grm', 'Powder', '450 grm', 432.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(100, 6, '6_Pow_900 grm', 'Powder', '900 grm', 756.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(101, 7, '7_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(102, 7, '7_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(103, 7, '7_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(104, 7, '7_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(105, 8, '8_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(106, 8, '8_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(107, 8, '8_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(108, 8, '8_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(109, 11, '11_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(110, 11, '11_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(111, 11, '11_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(112, 11, '11_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(113, 13, '13_Pow_90 grm', 'Powder', '90 grm', 6.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(114, 13, '13_Pow_225 grm', 'Powder', '225 grm', 15.58, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(115, 13, '13_Pow_450 grm', 'Powder', '450 grm', 25.92, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(116, 13, '13_Pow_900 grm', 'Powder', '900 grm', 45.36, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(117, 14, '14_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(118, 14, '14_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(119, 14, '14_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(120, 14, '14_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(121, 16, '16_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(122, 16, '16_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(123, 16, '16_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(124, 16, '16_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(125, 17, '17_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(126, 17, '17_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(127, 17, '17_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(128, 17, '17_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(129, 18, '18_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(130, 18, '18_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(131, 18, '18_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(132, 18, '18_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(133, 20, '20_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(134, 20, '20_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(135, 20, '20_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(136, 20, '20_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(137, 21, '21_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(138, 21, '21_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(139, 21, '21_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(140, 21, '21_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(141, 22, '22_Pow_90 grm', 'Powder', '90 grm', 17.28, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(142, 22, '22_Pow_225 grm', 'Powder', '225 grm', 38.88, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(143, 22, '22_Pow_450 grm', 'Powder', '450 grm', 69.12, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(144, 22, '22_Pow_900 grm', 'Powder', '900 grm', 120.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(145, 23, '23_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(146, 23, '23_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(147, 23, '23_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(148, 23, '23_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(149, 23, '23_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(150, 23, '23_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(151, 23, '23_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(152, 23, '23_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(153, 24, '24_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(154, 24, '24_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(155, 24, '24_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(156, 24, '24_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(157, 24, '24_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(158, 24, '24_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(159, 24, '24_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(160, 24, '24_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(161, 25, '25_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(162, 25, '25_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(163, 25, '25_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(164, 25, '25_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(165, 25, '25_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(166, 25, '25_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(167, 25, '25_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(168, 25, '25_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(169, 26, '26_Pow_90 grm', 'Powder', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(170, 26, '26_Pow_225 grm', 'Powder', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(171, 26, '26_Pow_450 grm', 'Powder', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(172, 26, '26_Pow_900 grm', 'Powder', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(173, 26, '26_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(174, 26, '26_Raw_225 grm', 'Raw', '225 grm', 10.13, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(175, 26, '26_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(176, 26, '26_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(177, 27, '27_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(178, 27, '27_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(179, 27, '27_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(180, 27, '27_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(181, 27, '27_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(182, 27, '27_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(183, 27, '27_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(184, 27, '27_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(185, 28, '28_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(186, 28, '28_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(187, 28, '28_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(188, 28, '28_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(189, 28, '28_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(190, 28, '28_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(191, 28, '28_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(192, 28, '28_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(193, 29, '29_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(194, 29, '29_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(195, 29, '29_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(196, 29, '29_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(197, 30, '30_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(198, 30, '30_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(199, 30, '30_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(200, 30, '30_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(201, 30, '30_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(202, 30, '30_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(203, 30, '30_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(204, 30, '30_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(205, 31, '31_Pow_90 grm', 'Powder', '90 grm', 324.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(206, 31, '31_Pow_225 grm', 'Powder', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(207, 31, '31_Pow_450 grm', 'Powder', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(208, 31, '31_Pow_900 grm', 'Powder', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(209, 31, '31_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(210, 31, '31_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(211, 31, '31_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(212, 31, '31_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(213, 32, '32_Raw_90 grm', 'Raw', '90 grm', 90.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(214, 32, '32_Raw_225 grm', 'Raw', '225 grm', 202.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(215, 32, '32_Raw_450 grm', 'Raw', '450 grm', 360.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(216, 32, '32_Raw_900 grm', 'Raw', '900 grm', 630.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(217, 33, '33_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(218, 33, '33_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(219, 33, '33_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(220, 33, '33_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(221, 33, '33_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(222, 33, '33_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(223, 33, '33_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(224, 33, '33_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(225, 34, '34_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(226, 34, '34_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(227, 34, '34_Raw_450 grm', 'Raw', '450 grm', 180.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(228, 34, '34_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(229, 35, '35_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(230, 35, '35_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(231, 35, '35_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(232, 35, '35_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(233, 35, '35_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(234, 35, '35_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(235, 35, '35_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(236, 35, '35_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(237, 36, '36_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(238, 36, '36_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(239, 36, '36_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(240, 36, '36_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(241, 36, '36_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(242, 36, '36_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(243, 36, '36_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(244, 36, '36_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(245, 37, '37_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(246, 37, '37_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(247, 37, '37_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(248, 37, '37_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(249, 37, '37_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(250, 37, '37_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(251, 37, '37_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(252, 37, '37_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(253, 38, '38_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(254, 38, '38_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(255, 38, '38_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(256, 38, '38_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(257, 38, '38_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(258, 38, '38_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(259, 38, '38_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(260, 38, '38_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(261, 39, '39_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(262, 39, '39_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(263, 39, '39_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(264, 39, '39_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(265, 39, '39_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(266, 39, '39_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(267, 39, '39_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(268, 39, '39_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(269, 40, '40_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(270, 40, '40_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(271, 40, '40_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(272, 40, '40_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(273, 40, '40_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(274, 40, '40_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(275, 40, '40_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(276, 40, '40_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(277, 41, '41_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(278, 41, '41_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(279, 41, '41_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(280, 41, '41_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(281, 41, '41_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(282, 41, '41_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(283, 41, '41_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(284, 41, '41_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(285, 42, '42_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(286, 42, '42_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(287, 42, '42_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(288, 42, '42_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(289, 43, '43_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(290, 43, '43_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(291, 43, '43_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(292, 43, '43_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(293, 44, '44_Pow_90 grm', 'Powder', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(294, 44, '44_Pow_225 grm', 'Powder', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(295, 44, '44_Pow_450 grm', 'Powder', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(296, 44, '44_Pow_900 grm', 'Powder', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(297, 44, '44_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(298, 44, '44_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(299, 44, '44_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(300, 44, '44_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(301, 45, '45_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(302, 45, '45_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(303, 45, '45_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(304, 45, '45_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(305, 45, '45_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(306, 45, '45_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(307, 45, '45_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(308, 45, '45_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(309, 46, '46_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(310, 46, '46_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(311, 46, '46_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(312, 46, '46_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(313, 46, '46_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(314, 46, '46_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(315, 46, '46_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(316, 46, '46_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(317, 47, '47_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(318, 47, '47_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(319, 47, '47_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(320, 47, '47_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(321, 47, '47_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(322, 47, '47_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(323, 47, '47_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(324, 47, '47_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(325, 48, '48_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(326, 48, '48_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(327, 48, '48_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(328, 48, '48_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(329, 49, '49_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(330, 49, '49_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(331, 49, '49_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(332, 49, '49_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(333, 50, '50_Raw_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(334, 50, '50_Raw_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(335, 50, '50_Raw_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(336, 50, '50_Raw_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(337, 51, '51_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(338, 51, '51_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(339, 51, '51_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(340, 51, '51_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(341, 51, '51_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(342, 51, '51_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(343, 51, '51_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(344, 51, '51_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(345, 52, '52_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(346, 52, '52_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(347, 52, '52_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(348, 52, '52_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(349, 52, '52_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(350, 52, '52_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(351, 52, '52_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(352, 52, '52_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(353, 53, '53_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(354, 53, '53_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(355, 53, '53_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(356, 53, '53_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(357, 53, '53_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(358, 53, '53_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(359, 53, '53_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(360, 53, '53_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(361, 54, '54_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(362, 54, '54_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(363, 54, '54_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(364, 54, '54_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(365, 55, '55_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(366, 55, '55_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(367, 55, '55_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(368, 55, '55_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(369, 55, '55_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(370, 55, '55_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(371, 55, '55_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(372, 55, '55_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(373, 56, '56_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(374, 56, '56_Raw_225 grm', 'Raw', '225 grm', 10.13, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(375, 56, '56_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(376, 56, '56_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(377, 57, '57_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(378, 57, '57_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(379, 57, '57_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(380, 57, '57_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(381, 58, '58_Pow_90 grm', 'Powder', '90 grm', 15.44, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(382, 58, '58_Pow_225 grm', 'Powder', '225 grm', 34.74, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(383, 58, '58_Pow_450 grm', 'Powder', '450 grm', 61.77, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(384, 58, '58_Pow_900 grm', 'Powder', '900 grm', 108.10, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(385, 58, '58_Raw_90 grm', 'Raw', '90 grm', 12.87, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(386, 58, '58_Raw_225 grm', 'Raw', '225 grm', 28.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(387, 58, '58_Raw_450 grm', 'Raw', '450 grm', 51.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(388, 58, '58_Raw_900 grm', 'Raw', '900 grm', 90.09, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(389, 59, '59_Pow_90 grm', 'Powder', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(390, 59, '59_Pow_225 grm', 'Powder', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(391, 59, '59_Pow_450 grm', 'Powder', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(392, 59, '59_Pow_900 grm', 'Powder', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(393, 59, '59_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(394, 59, '59_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(395, 59, '59_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(396, 59, '59_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(397, 60, '60_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(398, 60, '60_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(399, 60, '60_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(400, 60, '60_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(401, 61, '61_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(402, 61, '61_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(403, 61, '61_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(404, 61, '61_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(405, 61, '61_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(406, 61, '61_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(407, 61, '61_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(408, 61, '61_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(409, 62, '62_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(410, 62, '62_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03');
INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(411, 62, '62_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(412, 62, '62_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(413, 62, '62_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(414, 62, '62_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(415, 62, '62_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(416, 62, '62_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(417, 63, '63_Raw_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(418, 63, '63_Raw_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(419, 63, '63_Raw_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(420, 63, '63_Raw_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(421, 64, '64_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(422, 64, '64_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(423, 64, '64_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(424, 64, '64_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(425, 64, '64_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(426, 64, '64_Raw_225 grm', 'Raw', '225 grm', 6.08, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(427, 64, '64_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(428, 64, '64_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(429, 65, '65_Pow_90 grm', 'Powder', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(430, 65, '65_Pow_225 grm', 'Powder', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(431, 65, '65_Pow_450 grm', 'Powder', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(432, 65, '65_Pow_900 grm', 'Powder', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(433, 65, '65_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(434, 65, '65_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(435, 65, '65_Raw_450 grm', 'Raw', '450 grm', 180.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(436, 65, '65_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(437, 66, '66_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(438, 66, '66_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(439, 66, '66_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(440, 66, '66_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(441, 67, '67_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(442, 67, '67_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(443, 67, '67_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(444, 67, '67_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(445, 67, '67_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(446, 67, '67_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(447, 67, '67_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(448, 67, '67_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(449, 68, '68_Pow_90 grm', 'Powder', '90 grm', 7.56, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(450, 68, '68_Pow_225 grm', 'Powder', '225 grm', 17.01, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(451, 68, '68_Pow_450 grm', 'Powder', '450 grm', 30.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(452, 68, '68_Pow_900 grm', 'Powder', '900 grm', 52.92, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(453, 68, '68_Raw_90 grm', 'Raw', '90 grm', 6.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(454, 68, '68_Raw_225 grm', 'Raw', '225 grm', 14.17, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(455, 68, '68_Raw_450 grm', 'Raw', '450 grm', 25.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(456, 68, '68_Raw_900 grm', 'Raw', '900 grm', 44.10, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(457, 69, '69_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(458, 69, '69_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(459, 69, '69_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(460, 69, '69_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(461, 69, '69_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(462, 69, '69_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(463, 69, '69_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(464, 69, '69_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(465, 70, '70_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(466, 70, '70_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(467, 70, '70_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(468, 70, '70_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(469, 70, '70_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(470, 70, '70_Raw_225 grm', 'Raw', '225 grm', 6.08, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(471, 70, '70_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(472, 70, '70_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(473, 71, '71_Pow_90 grm', 'Powder', '90 grm', 1.62, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(474, 71, '71_Pow_225 grm', 'Powder', '225 grm', 3.64, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(475, 71, '71_Pow_450 grm', 'Powder', '450 grm', 6.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(476, 71, '71_Pow_900 grm', 'Powder', '900 grm', 11.34, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(477, 71, '71_Raw_90 grm', 'Raw', '90 grm', 1.35, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(478, 71, '71_Raw_225 grm', 'Raw', '225 grm', 3.03, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(479, 71, '71_Raw_450 grm', 'Raw', '450 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(480, 71, '71_Raw_900 grm', 'Raw', '900 grm', 9.45, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(481, 72, '72_Raw_90 grm', 'Raw', '90 grm', 7.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(482, 72, '72_Raw_225 grm', 'Raw', '225 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(483, 72, '72_Raw_450 grm', 'Raw', '450 grm', 28.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(484, 72, '72_Raw_900 grm', 'Raw', '900 grm', 50.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(485, 73, '73_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(486, 73, '73_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(487, 73, '73_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(488, 73, '73_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(489, 73, '73_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(490, 73, '73_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(491, 73, '73_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(492, 73, '73_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(493, 74, '74_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(494, 74, '74_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(495, 74, '74_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(496, 74, '74_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(497, 74, '74_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(498, 74, '74_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(499, 74, '74_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(500, 74, '74_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(501, 75, '75_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(502, 75, '75_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(503, 75, '75_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(504, 75, '75_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(505, 75, '75_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(506, 75, '75_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(507, 75, '75_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(508, 75, '75_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(509, 76, '76_Pow_90 grm', 'Powder', '90 grm', 64.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(510, 76, '76_Pow_225 grm', 'Powder', '225 grm', 145.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(511, 76, '76_Pow_450 grm', 'Powder', '450 grm', 259.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(512, 76, '76_Pow_900 grm', 'Powder', '900 grm', 453.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(513, 76, '76_Raw_90 grm', 'Raw', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(514, 76, '76_Raw_225 grm', 'Raw', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(515, 76, '76_Raw_450 grm', 'Raw', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(516, 76, '76_Raw_900 grm', 'Raw', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(517, 77, '77_Pow_90 grm', 'Powder', '90 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(518, 77, '77_Pow_225 grm', 'Powder', '225 grm', 194.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(519, 77, '77_Pow_450 grm', 'Powder', '450 grm', 345.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(520, 77, '77_Pow_900 grm', 'Powder', '900 grm', 604.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(521, 77, '77_Raw_90 grm', 'Raw', '90 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(522, 77, '77_Raw_225 grm', 'Raw', '225 grm', 162.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(523, 77, '77_Raw_450 grm', 'Raw', '450 grm', 288.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(524, 77, '77_Raw_900 grm', 'Raw', '900 grm', 504.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(525, 78, '78_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(526, 78, '78_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(527, 78, '78_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(528, 78, '78_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(529, 78, '78_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(530, 78, '78_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(531, 78, '78_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(532, 78, '78_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(533, 79, '79_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(534, 79, '79_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(535, 79, '79_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(536, 79, '79_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(537, 79, '79_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(538, 79, '79_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(539, 79, '79_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(540, 79, '79_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(541, 80, '80_Raw_90 grm', 'Raw', '90 grm', 7.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(542, 80, '80_Raw_225 grm', 'Raw', '225 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(543, 80, '80_Raw_450 grm', 'Raw', '450 grm', 28.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(544, 80, '80_Raw_900 grm', 'Raw', '900 grm', 50.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(545, 81, '81_Pow_90 grm', 'Powder', '90 grm', 8.10, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(546, 81, '81_Pow_225 grm', 'Powder', '225 grm', 18.22, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(547, 81, '81_Pow_450 grm', 'Powder', '450 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(548, 81, '81_Pow_900 grm', 'Powder', '900 grm', 56.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(549, 81, '81_Raw_90 grm', 'Raw', '90 grm', 6.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(550, 81, '81_Raw_225 grm', 'Raw', '225 grm', 15.18, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(551, 81, '81_Raw_450 grm', 'Raw', '450 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(552, 81, '81_Raw_900 grm', 'Raw', '900 grm', 47.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(553, 82, '82_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(554, 82, '82_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(555, 82, '82_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(556, 82, '82_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(557, 82, '82_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(558, 82, '82_Raw_225 grm', 'Raw', '225 grm', 6.07, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(559, 82, '82_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(560, 82, '82_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(561, 83, '83_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(562, 83, '83_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(563, 83, '83_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(564, 83, '83_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(565, 84, '84_Raw_90 grm', 'Raw', '90 grm', 6.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(566, 84, '84_Raw_225 grm', 'Raw', '225 grm', 15.18, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(567, 84, '84_Raw_450 grm', 'Raw', '450 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(568, 84, '84_Raw_900 grm', 'Raw', '900 grm', 47.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(569, 85, '85_Pow_90 grm', 'Powder', '90 grm', 56.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(570, 85, '85_Pow_225 grm', 'Powder', '225 grm', 127.57, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(571, 85, '85_Pow_450 grm', 'Powder', '450 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(572, 85, '85_Pow_900 grm', 'Powder', '900 grm', 396.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(573, 85, '85_Raw_90 grm', 'Raw', '90 grm', 47.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(574, 85, '85_Raw_225 grm', 'Raw', '225 grm', 106.31, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(575, 85, '85_Raw_450 grm', 'Raw', '450 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(576, 85, '85_Raw_900 grm', 'Raw', '900 grm', 330.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(577, 86, '86_Pow_90 grm', 'Powder', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(578, 86, '86_Pow_225 grm', 'Powder', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(579, 86, '86_Pow_450 grm', 'Powder', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(580, 86, '86_Pow_900 grm', 'Powder', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(581, 86, '86_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(582, 86, '86_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(583, 86, '86_Raw_450 grm', 'Raw', '450 grm', 180.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(584, 86, '86_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(585, 87, '87_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(586, 87, '87_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(587, 87, '87_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(588, 87, '87_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(589, 87, '87_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(590, 87, '87_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(591, 87, '87_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(592, 87, '87_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(593, 88, '88_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(594, 88, '88_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(595, 88, '88_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(596, 88, '88_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(597, 88, '88_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(598, 88, '88_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(599, 88, '88_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(600, 88, '88_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(601, 89, '89_Pow_90 grm', 'Powder', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(602, 89, '89_Pow_225 grm', 'Powder', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(603, 89, '89_Pow_450 grm', 'Powder', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(604, 89, '89_Pow_900 grm', 'Powder', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(605, 89, '89_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(606, 89, '89_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(607, 89, '89_Raw_450 grm', 'Raw', '450 grm', 180.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(608, 89, '89_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(609, 90, '90_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(610, 90, '90_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(611, 90, '90_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(612, 90, '90_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(613, 91, '91_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(614, 91, '91_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(615, 91, '91_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(616, 91, '91_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(617, 91, '91_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(618, 91, '91_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(619, 91, '91_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(620, 91, '91_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(621, 92, '92_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(622, 92, '92_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(623, 92, '92_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(624, 92, '92_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(625, 93, '93_Pow_90 grm', 'Powder', '90 grm', 64.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(626, 93, '93_Pow_225 grm', 'Powder', '225 grm', 145.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(627, 93, '93_Pow_450 grm', 'Powder', '450 grm', 259.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(628, 93, '93_Pow_900 grm', 'Powder', '900 grm', 453.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(629, 93, '93_Raw_90 grm', 'Raw', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(630, 93, '93_Raw_225 grm', 'Raw', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(631, 93, '93_Raw_450 grm', 'Raw', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(632, 93, '93_Raw_900 grm', 'Raw', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(633, 94, '94_Pow_90 grm', 'Powder', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(634, 94, '94_Pow_225 grm', 'Powder', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(635, 94, '94_Pow_450 grm', 'Powder', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(636, 94, '94_Pow_900 grm', 'Powder', '900 grm', 266.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(637, 94, '94_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(638, 94, '94_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(639, 94, '94_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(640, 94, '94_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(641, 95, '95_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(642, 95, '95_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(643, 95, '95_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(644, 95, '95_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(645, 95, '95_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(646, 95, '95_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(647, 95, '95_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(648, 95, '95_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(649, 96, '96_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(650, 96, '96_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(651, 96, '96_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(652, 96, '96_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(653, 96, '96_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(654, 96, '96_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(655, 96, '96_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(656, 96, '96_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(657, 97, '97_Pow_90 grm', 'Powder', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(658, 97, '97_Pow_225 grm', 'Powder', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(659, 97, '97_Pow_450 grm', 'Powder', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(660, 97, '97_Pow_900 grm', 'Powder', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(661, 97, '97_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(662, 97, '97_Raw_225 grm', 'Raw', '225 grm', 10.12, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(663, 97, '97_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(664, 97, '97_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(665, 98, '98_Pow_90 grm', 'Powder', '90 grm', 8.64, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(666, 98, '98_Pow_225 grm', 'Powder', '225 grm', 19.44, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(667, 98, '98_Pow_450 grm', 'Powder', '450 grm', 34.56, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(668, 98, '98_Pow_900 grm', 'Powder', '900 grm', 53.76, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(669, 98, '98_Raw_90 grm', 'Raw', '90 grm', 7.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(670, 98, '98_Raw_225 grm', 'Raw', '225 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(671, 98, '98_Raw_450 grm', 'Raw', '450 grm', 28.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(672, 98, '98_Raw_900 grm', 'Raw', '900 grm', 50.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(673, 99, '99_Pow_90 grm', 'Powder', '90 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(674, 99, '99_Pow_225 grm', 'Powder', '225 grm', 121.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(675, 99, '99_Pow_450 grm', 'Powder', '450 grm', 216.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(676, 99, '99_Pow_900 grm', 'Powder', '900 grm', 378.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(677, 99, '99_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(678, 99, '99_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(679, 99, '99_Raw_450 grm', 'Raw', '450 grm', 180.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(680, 99, '99_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(681, 100, '100_Pow_90 grm', 'Powder', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(682, 100, '100_Pow_225 grm', 'Powder', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(683, 100, '100_Pow_450 grm', 'Powder', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(684, 100, '100_Pow_900 grm', 'Powder', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(685, 100, '100_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(686, 100, '100_Raw_225 grm', 'Raw', '225 grm', 10.12, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(687, 100, '100_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(688, 100, '100_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(689, 101, '101_Pow_90 grm', 'Powder', '90 grm', 19.44, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(690, 101, '101_Pow_225 grm', 'Powder', '225 grm', 43.74, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(691, 101, '101_Pow_450 grm', 'Powder', '450 grm', 77.76, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(692, 101, '101_Pow_900 grm', 'Powder', '900 grm', 136.08, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(693, 101, '101_Raw_90 grm', 'Raw', '90 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(694, 101, '101_Raw_225 grm', 'Raw', '225 grm', 36.45, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(695, 101, '101_Raw_450 grm', 'Raw', '450 grm', 64.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(696, 101, '101_Raw_900 grm', 'Raw', '900 grm', 113.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(697, 102, '102_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(698, 102, '102_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(699, 102, '102_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(700, 102, '102_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(701, 102, '102_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(702, 102, '102_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(703, 102, '102_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(704, 102, '102_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(705, 103, '103_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(706, 103, '103_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(707, 103, '103_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(708, 103, '103_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(709, 104, '104_Raw_90 grm', 'Raw', '90 grm', 13.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(710, 104, '104_Raw_225 grm', 'Raw', '225 grm', 30.37, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(711, 104, '104_Raw_450 grm', 'Raw', '450 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(712, 104, '104_Raw_900 grm', 'Raw', '900 grm', 94.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(713, 105, '105_Raw_90 grm', 'Raw', '90 grm', 13.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(714, 105, '105_Raw_225 grm', 'Raw', '225 grm', 30.37, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(715, 105, '105_Raw_450 grm', 'Raw', '450 grm', 54.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(716, 105, '105_Raw_900 grm', 'Raw', '900 grm', 94.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(717, 106, '106_Raw_90 grm', 'Raw', '90 grm', 7.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(718, 106, '106_Raw_225 grm', 'Raw', '225 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(719, 106, '106_Raw_450 grm', 'Raw', '450 grm', 28.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(720, 106, '106_Raw_900 grm', 'Raw', '900 grm', 50.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(721, 107, '107_Pow_90 grm', 'Powder', '90 grm', 19.44, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(722, 107, '107_Pow_225 grm', 'Powder', '225 grm', 43.74, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(723, 107, '107_Pow_450 grm', 'Powder', '450 grm', 77.76, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(724, 107, '107_Pow_900 grm', 'Powder', '900 grm', 136.08, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(725, 107, '107_Raw_90 grm', 'Raw', '90 grm', 16.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(726, 107, '107_Raw_225 grm', 'Raw', '225 grm', 36.45, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(727, 107, '107_Raw_450 grm', 'Raw', '450 grm', 64.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(728, 107, '107_Raw_900 grm', 'Raw', '900 grm', 113.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(729, 108, '108_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(730, 108, '108_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(731, 108, '108_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(732, 108, '108_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(733, 109, '109_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(734, 109, '109_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(735, 109, '109_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(736, 109, '109_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(737, 109, '109_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(738, 109, '109_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(739, 109, '109_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(740, 109, '109_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(741, 110, '110_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(742, 110, '110_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(743, 110, '110_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(744, 110, '110_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(745, 110, '110_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(746, 110, '110_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(747, 110, '110_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(748, 110, '110_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(749, 111, '111_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(750, 111, '111_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(751, 111, '111_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(752, 111, '111_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(753, 111, '111_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(754, 111, '111_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(755, 111, '111_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(756, 111, '111_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(757, 112, '112_Pow_90 grm', 'Powder', '90 grm', 6.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(758, 112, '112_Pow_225 grm', 'Powder', '225 grm', 14.58, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(759, 112, '112_Pow_450 grm', 'Powder', '450 grm', 25.92, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(760, 112, '112_Pow_900 grm', 'Powder', '900 grm', 45.36, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(761, 112, '112_Raw_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(762, 112, '112_Raw_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(763, 112, '112_Raw_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(764, 112, '112_Raw_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(765, 113, '113_Pow_90 grm', 'Powder', '90 grm', 11.34, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(766, 113, '113_Pow_225 grm', 'Powder', '225 grm', 25.51, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(767, 113, '113_Pow_450 grm', 'Powder', '450 grm', 45.36, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(768, 113, '113_Pow_900 grm', 'Powder', '900 grm', 79.38, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(769, 113, '113_Raw_90 grm', 'Raw', '90 grm', 9.45, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(770, 113, '113_Raw_225 grm', 'Raw', '225 grm', 21.26, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(771, 113, '113_Raw_450 grm', 'Raw', '450 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(772, 113, '113_Raw_900 grm', 'Raw', '900 grm', 66.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(773, 114, '114_Pow_90 grm', 'Powder', '90 grm', 6.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(774, 114, '114_Pow_225 grm', 'Powder', '225 grm', 14.58, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(775, 114, '114_Pow_450 grm', 'Powder', '450 grm', 25.92, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(776, 114, '114_Pow_900 grm', 'Powder', '900 grm', 45.36, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(777, 114, '114_Raw_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(778, 114, '114_Raw_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(779, 114, '114_Raw_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(780, 114, '114_Raw_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(781, 115, '115_Pow_90 grm', 'Powder', '90 grm', 432.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(782, 115, '115_Pow_225 grm', 'Powder', '225 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(783, 115, '115_Pow_450 grm', 'Powder', '450 grm', 1728.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(784, 115, '115_Pow_900 grm', 'Powder', '900 grm', 3024.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(785, 115, '115_Raw_90 grm', 'Raw', '90 grm', 360.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(786, 115, '115_Raw_225 grm', 'Raw', '225 grm', 810.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(787, 115, '115_Raw_450 grm', 'Raw', '450 grm', 1440.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(788, 115, '115_Raw_900 grm', 'Raw', '900 grm', 2520.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(789, 116, '116_Pow_90 grm', 'Powder', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(790, 116, '116_Pow_225 grm', 'Powder', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(791, 116, '116_Pow_450 grm', 'Powder', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(792, 116, '116_Pow_900 grm', 'Powder', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(793, 116, '116_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(794, 116, '116_Raw_225 grm', 'Raw', '225 grm', 10.13, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(795, 116, '116_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(796, 116, '116_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(797, 117, '117_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(798, 117, '117_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(799, 117, '117_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(800, 117, '117_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(801, 117, '117_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(802, 117, '117_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(803, 117, '117_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(804, 117, '117_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(805, 118, '118_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(806, 118, '118_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(807, 118, '118_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(808, 118, '118_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(809, 118, '118_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(810, 118, '118_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(811, 118, '118_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(812, 118, '118_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(813, 119, '119_Pow_90 grm', 'Powder', '90 grm', 38.88, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(814, 119, '119_Pow_225 grm', 'Powder', '225 grm', 87.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(815, 119, '119_Pow_450 grm', 'Powder', '450 grm', 155.52, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(816, 119, '119_Pow_900 grm', 'Powder', '900 grm', 272.16, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03');
INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `form`, `size`, `price`, `discount`, `stock`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(817, 119, '119_Raw_90 grm', 'Raw', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(818, 119, '119_Raw_225 grm', 'Raw', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(819, 119, '119_Raw_450 grm', 'Raw', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(820, 119, '119_Raw_900 grm', 'Raw', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(821, 120, '120_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(822, 120, '120_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(823, 120, '120_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(824, 120, '120_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(825, 120, '120_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(826, 120, '120_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(827, 120, '120_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(828, 120, '120_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(829, 121, '121_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(830, 121, '121_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(831, 121, '121_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(832, 121, '121_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(833, 122, '122_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(834, 122, '122_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(835, 122, '122_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(836, 122, '122_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(837, 122, '122_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(838, 122, '122_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(839, 122, '122_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(840, 122, '122_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(841, 123, '123_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(842, 123, '123_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(843, 123, '123_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(844, 123, '123_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(845, 123, '123_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(846, 123, '123_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(847, 123, '123_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(848, 123, '123_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(849, 124, '124_Pow_90 grm', 'Powder', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(850, 124, '124_Pow_225 grm', 'Powder', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(851, 124, '124_Pow_450 grm', 'Powder', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(852, 124, '124_Pow_900 grm', 'Powder', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(853, 124, '124_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(854, 124, '124_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(855, 124, '124_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(856, 124, '124_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(857, 125, '125_Raw_90 grm', 'Raw', '90 grm', 27.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(858, 125, '125_Raw_225 grm', 'Raw', '225 grm', 60.75, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(859, 125, '125_Raw_450 grm', 'Raw', '450 grm', 108.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(860, 125, '125_Raw_900 grm', 'Raw', '900 grm', 189.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(861, 126, '126_Pow_90 grm', 'Powder', '90 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(862, 126, '126_Pow_225 grm', 'Powder', '225 grm', 48.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(863, 126, '126_Pow_450 grm', 'Powder', '450 grm', 86.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(864, 126, '126_Pow_900 grm', 'Powder', '900 grm', 151.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(865, 126, '126_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(866, 126, '126_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(867, 126, '126_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(868, 126, '126_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(869, 127, '127_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(870, 127, '127_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(871, 127, '127_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(872, 127, '127_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(873, 127, '127_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(874, 127, '127_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(875, 127, '127_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(876, 127, '127_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(877, 128, '128_Pow_90 grm', 'Powder', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(878, 128, '128_Pow_225 grm', 'Powder', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(879, 128, '128_Pow_450 grm', 'Powder', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(880, 128, '128_Pow_900 grm', 'Powder', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(881, 128, '128_Raw_90 grm', 'Raw', '90 grm', 4.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(882, 128, '128_Raw_225 grm', 'Raw', '225 grm', 10.12, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(883, 128, '128_Raw_450 grm', 'Raw', '450 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(884, 128, '128_Raw_900 grm', 'Raw', '900 grm', 31.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(885, 129, '129_Pow_90 grm', 'Powder', '90 grm', 6.48, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(886, 129, '129_Pow_225 grm', 'Powder', '225 grm', 14.58, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(887, 129, '129_Pow_450 grm', 'Powder', '450 grm', 25.92, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(888, 129, '129_Pow_900 grm', 'Powder', '900 grm', 45.36, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(889, 129, '129_Raw_90 grm', 'Raw', '90 grm', 5.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(890, 129, '129_Raw_225 grm', 'Raw', '225 grm', 12.15, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(891, 129, '129_Raw_450 grm', 'Raw', '450 grm', 21.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(892, 129, '129_Raw_900 grm', 'Raw', '900 grm', 37.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(893, 130, '130_Pow_90 grm', 'Powder', '90 grm', 3.24, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(894, 130, '130_Pow_225 grm', 'Powder', '225 grm', 7.29, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(895, 130, '130_Pow_450 grm', 'Powder', '450 grm', 12.96, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(896, 130, '130_Pow_900 grm', 'Powder', '900 grm', 22.68, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(897, 130, '130_Raw_90 grm', 'Raw', '90 grm', 2.70, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(898, 130, '130_Raw_225 grm', 'Raw', '225 grm', 6.07, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(899, 130, '130_Raw_450 grm', 'Raw', '450 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(900, 130, '130_Raw_900 grm', 'Raw', '900 grm', 18.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(901, 131, '131_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(902, 131, '131_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(903, 131, '131_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(904, 131, '131_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(905, 132, '132_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(906, 132, '132_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(907, 132, '132_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(908, 132, '132_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(909, 132, '132_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(910, 132, '132_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(911, 132, '132_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(912, 132, '132_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(913, 133, '133_Raw_90 grm', 'Raw', '90 grm', 19.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(914, 133, '133_Raw_225 grm', 'Raw', '225 grm', 44.55, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(915, 133, '133_Raw_450 grm', 'Raw', '450 grm', 79.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(916, 133, '133_Raw_900 grm', 'Raw', '900 grm', 138.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(917, 134, '134_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(918, 134, '134_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(919, 134, '134_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(920, 134, '134_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(921, 135, '135_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(922, 135, '135_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(923, 135, '135_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(924, 135, '135_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(925, 135, '135_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(926, 135, '135_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(927, 135, '135_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(928, 135, '135_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(929, 136, '136_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(930, 136, '136_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(931, 136, '136_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(932, 136, '136_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(933, 136, '136_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(934, 136, '136_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(935, 136, '136_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(936, 136, '136_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(937, 137, '137_Raw_90 grm', 'Raw', '90 grm', 32.40, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(938, 137, '137_Raw_225 grm', 'Raw', '225 grm', 72.90, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(939, 137, '137_Raw_450 grm', 'Raw', '450 grm', 129.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(940, 137, '137_Raw_900 grm', 'Raw', '900 grm', 226.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(941, 138, '138_Raw_90 grm', 'Raw', '90 grm', 45.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(942, 138, '138_Raw_225 grm', 'Raw', '225 grm', 101.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(943, 138, '138_Raw_450 grm', 'Raw', '450 grm', 182.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(944, 138, '138_Raw_900 grm', 'Raw', '900 grm', 315.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(945, 139, '139_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(946, 139, '139_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(947, 139, '139_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(948, 139, '139_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(949, 140, '140_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(950, 140, '140_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(951, 140, '140_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(952, 140, '140_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(953, 141, '141_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(954, 141, '141_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(955, 141, '141_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(956, 141, '141_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(957, 142, '142_Pow_90 grm', 'Powder', '90 grm', 1296.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(958, 142, '142_Pow_225 grm', 'Powder', '225 grm', 2916.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(959, 142, '142_Pow_450 grm', 'Powder', '450 grm', 5184.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(960, 142, '142_Pow_900 grm', 'Powder', '900 grm', 9072.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(961, 142, '142_Raw_90 grm', 'Raw', '90 grm', 1080.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(962, 142, '142_Raw_225 grm', 'Raw', '225 grm', 2430.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(963, 142, '142_Raw_450 grm', 'Raw', '450 grm', 4320.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(964, 142, '142_Raw_900 grm', 'Raw', '900 grm', 7560.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(965, 143, '143_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(966, 143, '143_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(967, 143, '143_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(968, 143, '143_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(969, 143, '143_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(970, 143, '143_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(971, 143, '143_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(972, 143, '143_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(973, 144, '144_Raw_90 grm', 'Raw', '90 grm', 18.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(974, 144, '144_Raw_225 grm', 'Raw', '225 grm', 40.50, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(975, 144, '144_Raw_450 grm', 'Raw', '450 grm', 72.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(976, 144, '144_Raw_900 grm', 'Raw', '900 grm', 126.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(977, 145, '145_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(978, 145, '145_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(979, 145, '145_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(980, 145, '145_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(981, 145, '145_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(982, 145, '145_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(983, 145, '145_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(984, 145, '145_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(985, 146, '146_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(986, 146, '146_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(987, 146, '146_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(988, 146, '146_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(989, 146, '146_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(990, 146, '146_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(991, 146, '146_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(992, 146, '146_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(993, 147, '147_Pow_90 grm', 'Powder', '90 grm', 10.80, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(994, 147, '147_Pow_225 grm', 'Powder', '225 grm', 24.30, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(995, 147, '147_Pow_450 grm', 'Powder', '450 grm', 43.20, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(996, 147, '147_Pow_900 grm', 'Powder', '900 grm', 75.60, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(997, 147, '147_Raw_90 grm', 'Raw', '90 grm', 9.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(998, 147, '147_Raw_225 grm', 'Raw', '225 grm', 20.25, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(999, 147, '147_Raw_450 grm', 'Raw', '450 grm', 36.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03'),
(1000, 147, '147_Raw_900 grm', 'Raw', '900 grm', 63.00, 0.00, 20, 1, 'active', '2022-11-16 03:41:03', '2022-11-16 03:41:03');

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
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 20, 5, 'hello', 'active', '2022-08-10 05:43:06', '2022-08-10 05:43:06'),
(4, 1, 1, 5, 'best', 'active', '2022-10-14 04:05:56', '2022-10-14 04:05:56');

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
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/3.jpeg', 'Al Ras, Diera , P.O Box - 64389  Dubai - U.A.E', '+971506810195', 'theherbroom.2001@gmail.com', NULL, '2022-10-24 08:38:21');

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
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/logo.png', 'admin', NULL, NULL, 'active', 'X5afYCoD76rimgWn2nPnFbtXxsxPTIyGqTZIB3FjRbwtp5v4INtq6RlM6Jih', NULL, '2022-07-11 04:32:25'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/cover.png', 'user', NULL, NULL, 'active', NULL, NULL, '2022-07-11 04:32:37'),
(30, 'Zafar', 'zafar@gmail.com', NULL, '$2y$10$PXS2IneuYU8jMyMEKdpyOegA6qoEr3tOU5GJhu.3P0MuXI4hnxlFS', NULL, 'user', NULL, NULL, 'active', NULL, '2022-07-12 10:37:00', '2022-07-12 10:37:00'),
(31, 'zafar', 'zafar1@gmail.com', NULL, '$2y$10$xqU2kHe19Fbikjw0vwqRfuikR.CB5gnAqKRERaWE6NuiX1/IG7zQS', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-13 08:54:49', '2022-08-13 08:54:49'),
(32, 'Aqbal', 'zafaraqbal@gmail.com', NULL, '$2y$10$s3IaSUW235g0xJ5QjLLLZ.0ZQzeOm0BPCTE3sP6DVLyoIZbATHhp.', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-27 07:21:50', '2022-08-27 07:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
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
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gifts_slug_unique` (`slug`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
