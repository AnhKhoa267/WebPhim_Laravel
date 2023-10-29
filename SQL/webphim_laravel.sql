-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2023 at 12:37 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webphim_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `slug`, `position`) VALUES
(1, 'Phim mới', 'Phim mới cập nhật hằng ngày', 1, 'phim-moi', 0),
(3, 'Phim chiếu rạp', 'Phim chiếu rạp cập nhật hằng ngày', 1, 'phim-chieu-rap', 1),
(4, 'Phim thuyết minh', 'Phim thuyết minh cập nhật hằng ngày', 1, 'phim-thuyet-minh', 2),
(5, 'Phim bộ', 'Phim bộ cập nhật hằng ngày', 1, 'phim-bo', 3),
(8, 'Phim lẻ mới', 'Phim lẻ mới cập nhật hằng ngày', 1, 'phim-le-moi', 4);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title`, `description`, `status`, `slug`) VALUES
(1, 'Việt Nam', 'Phim Việt Nam cập nhật thường xuyên', 1, 'viet-nam'),
(2, 'Mỹ', 'Phim Mỹ cập nhật thường xuyên', 1, 'my');

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `id` int NOT NULL,
  `movie_id` int NOT NULL,
  `linkphim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `episode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `title`, `description`, `status`, `slug`) VALUES
(1, 'Tâm lý', 'Tâm lý cập nhật thường xuyên', 1, 'tam-ly'),
(3, 'Hành động', 'Hành động cập nhật thường xuyên', 1, 'hanh-dong'),
(4, 'Tình cảm', 'Tình cảm cập nhật thường xuyên', 1, 'tinh-cam');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thoiluong` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_eng` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `country_id` int NOT NULL,
  `phim_hot` int NOT NULL,
  `resolution` int DEFAULT '0',
  `phude` int NOT NULL DEFAULT '0',
  `ngaytao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngaycapnhat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `topview` int DEFAULT NULL,
  `season` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '0',
  `trailer` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `thoiluong`, `slug`, `name_eng`, `description`, `status`, `image`, `category_id`, `genre_id`, `country_id`, `phim_hot`, `resolution`, `phude`, `ngaytao`, `ngaycapnhat`, `year`, `tags`, `topview`, `season`, `trailer`) VALUES
(18, 'Movistar R7 Esport', '133 phút', 'movistar-r7-esport', 'Movistar R7 Esport', 'R7 vả GAM biến VCS thành khu vực CONCARD', 1, 'download8771.png', 3, 1, 1, 1, 0, 0, '2023-09-20 09:54:41', '2023-09-20 09:55:41', '2017', NULL, 2, '0', NULL),
(31, 'Ganyu', '133 phút', 'ganyu', 'Ganyu Genshin Impact', 'Ganyu cập nhật mới nhất', 1, '900226-Ganyu-Genshin-Impact-Genshin-Impact-Atdan-anime-girls2759.jpg', 1, 1, 1, 0, 0, 0, '2023-09-22 09:54:41', '2023-09-22 09:55:41', '2021', NULL, 1, '0', NULL),
(32, 'GAM Esport', '133 phút', 'gam-esport', 'Gam Esport', 'GAM trở lại cực mạnh vả WILDCARD', 1, 'GAMesportslogo3217.png', 3, 3, 1, 1, 0, 0, '2023-09-01 09:54:41', '2023-09-01 09:55:41', '2014', NULL, 0, '0', NULL),
(33, 'Raiden Shogun', '24 phút / 1 tập', 'raiden-shogun', 'Raiden Shogun Genshin Impact', 'Raiden Shogun cập nhật mới nhất', 1, 'E-vTGvcXIAMxyD52748.jpg', 1, 1, 1, 1, 0, 0, '2023-09-21 09:54:41', '2023-09-21 19:44:26', '2022', NULL, 1, '0', NULL),
(34, 'Genshin impact ss1', '133 phút', 'genshin-impact-ss1', 'Genshin Impact', 'Genshin impact cập nhật mới nhất', 1, 'hu_tao keqing shenhe  xiaoshan_jiang yun_jin6898.jpg', 8, 4, 1, 1, 0, 0, '2023-08-21 09:54:41', '2023-08-21 09:55:41', '2021', NULL, 0, '0', NULL),
(35, 'Genshin impact full character', '133 phút', 'genshin-impact-full-character', 'Genshin Impact ova', 'Genshin impact full character cập nhật mới nhất', 1, '1304411-Aether-Genshin-Impact-Albedo-Genshin-Impact-Barbara7578.jpg', 4, 1, 1, 1, 0, 0, '2023-09-18 09:54:41', '2023-09-18 09:55:41', '2020', NULL, 2, '0', NULL),
(36, 'Genshin impact ss2', '133 phút', 'genshin-impact-ss2', 'Genshin Impact ss2', 'Genshin impact ss2 cập nhật mới nhất', 1, 'amber ganyu jean lumine9179.jpg', 8, 4, 1, 0, 0, 0, '2023-09-02 09:54:41', '2023-09-02 09:55:41', '2021', NULL, 0, '0', NULL),
(37, 'Hu Tao', '133 phút', 'hu-tao', 'Hu Tao Genshin Impact', 'Hu Tao cập nhật mới nhất', 1, 'hu_tao_ver_0_1_png_by_jay_256_dfqcgsw1175.png', 1, 3, 1, 0, 0, 0, '2023-09-20 08:54:41', '2023-09-20 08:55:41', '2020', NULL, 2, '0', NULL),
(38, 'Bóng Ma Anh Quốc', '90 phút / 1 tập', 'bong-ma-anh-quoc', 'Peaky Blinders', 'Bóng ma Anh Quốc là một bộ phim chính kịch truyền hình tội phạm của Anh, được sản xuất vào năm 2013 bởi đạo diễn Steven Knight. Loạt phim lấy bối cảnh tại thành phố Birmingham, kể về sự khai thác của Gia đình tội phạm Shelby trong hậu quả trực tiếp của Thế chiến thứ nhất.', 1, 'bong-ma-anh-quoc5645.jpg', 5, 3, 2, 1, 4, 0, '2023-09-20 09:30:22', '2023-10-13 09:24:41', '2013', 'peaky blinders, bóng ma anh quốc', 0, '1', 'oVzVdvGIC7U');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Trần Anh Khoa', 'trananhkhoa260702@gmail.com', NULL, '$2y$10$0nt3AJglr6jG76w/fZ91rOzEJsjWq8JQF41FMCd.KiGV4WRRYg1qS', NULL, '2023-09-08 00:57:28', '2023-09-08 00:57:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
