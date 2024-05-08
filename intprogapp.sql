-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 May 2024, 22:47:26
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `intprogapp`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `branches`
--

INSERT INTO `branches` (`id`, `title`, `adress`, `created_at`) VALUES
(1, 'Demluk Çayevi', 'Rize/Fındıklı', '2024-05-08 13:00:18');

--
-- Tetikleyiciler `branches`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_branches` BEFORE DELETE ON `branches` FOR EACH ROW BEGIN
    INSERT INTO branches_log (log_status,id,title,adress,created_at)
    VALUES ('deleted',OLD.id,OLD.title,OLD.adress,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_branches` BEFORE UPDATE ON `branches` FOR EACH ROW BEGIN
    INSERT INTO branches_log (log_status,id,title,adress,created_at)
    VALUES ('update',OLD.id,OLD.title,OLD.adress,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches_log`
--

CREATE TABLE `branches_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `adress` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `branches_log`
--

INSERT INTO `branches_log` (`log_id`, `log_status`, `log_created_at`, `id`, `title`, `adress`, `created_at`) VALUES
(2, 'update', '2024-05-01 15:38:05', 1, 'sa', 'Denizli/Merkezefendi', '2024-05-01 18:37:53'),
(3, 'update', '2024-05-08 13:00:18', 1, 'Demluk Çayevi', 'Denizli/Merkezefendi', '2024-05-01 18:38:05'),
(4, 'deleted', '2024-05-08 20:37:15', 2, 'das', '', '2024-05-08 23:37:11'),
(5, 'deleted', '2024-05-08 20:37:50', 3, 'l', '', '2024-05-08 23:37:46'),
(6, 'update', '2024-05-08 20:37:58', 4, 'jkl', '', '2024-05-08 23:37:54'),
(7, 'deleted', '2024-05-08 20:38:00', 4, 'jkl', '', '2024-05-08 23:37:54'),
(8, 'update', '2024-05-08 20:39:41', 1, 'Demluk Çayevi', 'Rize/Fındıklı', '2024-05-08 16:00:18'),
(9, 'deleted', '2024-05-08 20:39:44', 5, 'asd', '', '2024-05-08 23:39:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `brands`
--

INSERT INTO `brands` (`id`, `img_url`, `title`, `rank`, `is_active`, `created_at`) VALUES
(4, '', 'Demluk Çayevi', 0, 0, '2024-05-01 15:38:16');

--
-- Tetikleyiciler `brands`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_brands` BEFORE DELETE ON `brands` FOR EACH ROW BEGIN
    INSERT INTO brands_log (log_status,id,img_url,title,rank,is_active,created_at)
    VALUES ('delete',OLD.id,OLD.img_url,OLD.title,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_brands` BEFORE UPDATE ON `brands` FOR EACH ROW BEGIN
    INSERT INTO brands_log (log_status,id,img_url,title,rank,is_active,created_at)
    VALUES ('update',OLD.id,OLD.img_url,OLD.title,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

CREATE TABLE `brands_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `brands_log`
--

INSERT INTO `brands_log` (`log_id`, `log_status`, `log_created_at`, `id`, `img_url`, `title`, `rank`, `is_active`, `created_at`) VALUES
(1, 'delete', '2024-05-01 15:24:14', 1, '', 'zibidi', 0, 0, '2024-05-01 18:19:28'),
(2, 'delete', '2024-05-01 15:24:14', 2, '', 'sa', 0, 0, '2024-05-01 18:20:01'),
(3, 'delete', '2024-05-01 15:34:12', 3, '', 'sa', 0, 0, '2024-05-01 18:24:44'),
(4, 'update', '2024-05-01 15:34:22', 4, '', 'sa', 0, 0, '2024-05-01 18:34:15'),
(5, 'update', '2024-05-01 15:38:16', 4, '', 'saa', 0, 0, '2024-05-01 18:34:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `products`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_products` BEFORE DELETE ON `products` FOR EACH ROW BEGIN
    INSERT INTO products_log (log_status,id,img_url,title,description,rank,is_active,r,created_at)
    VALUES ('deleted',OLD.id,OLD.img_url,OLD.title,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_products` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    INSERT INTO products_log (log_status,id,img_url,title,description,rank,is_active,created_at)
    VALUES ('updates',OLD.id,OLD.img_url,OLD.title,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_log`
--

CREATE TABLE `products_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `product_categories`
--

INSERT INTO `product_categories` (`id`, `title`, `is_active`, `created_at`) VALUES
(2, 'Ayakkabı', 1, '2024-03-19 15:40:28'),
(3, 'Kıyafet', 1, '2024-03-19 15:40:39'),
(4, 'mehmetcanhocamkalp', 0, '2024-05-01 15:35:36');

--
-- Tetikleyiciler `product_categories`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_product_categories` BEFORE DELETE ON `product_categories` FOR EACH ROW BEGIN
    INSERT INTO product_categories_log (log_status,id,title,is_active,created_at)
    VALUES ('deleted',OLD.id,OLD.title,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_product_categories` BEFORE UPDATE ON `product_categories` FOR EACH ROW BEGIN
    INSERT INTO product_categories_log (log_status,id,title,is_active,created_at)
    VALUES ('update',OLD.id,OLD.title,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories_log`
--

CREATE TABLE `product_categories_log` (
  `log` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `product_categories_log`
--

INSERT INTO `product_categories_log` (`log`, `log_status`, `log_created_at`, `id`, `title`, `is_active`, `created_at`) VALUES
(1, 'deleted', '2024-05-01 15:35:27', 1, 'Temizlik', 1, '2024-03-19 18:40:09');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_cover` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `product_images`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_product_images` BEFORE DELETE ON `product_images` FOR EACH ROW BEGIN
    INSERT INTO product_images_log (log_status,id,product_id,rank,is_cover,img_url,is_active,created_at)
    VALUES ('deleted',OLD.id,OLD.product_id,OLD.rank,OLD.is_cover,OLD.img_url,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_product_images` BEFORE UPDATE ON `product_images` FOR EACH ROW BEGIN
    INSERT INTO product_images_log (log_status,id,product_id,rank,is_cover,img_url,is_active,created_at)
    VALUES ('update',OLD.id,OLD.product_id,OLD.rank,OLD.is_cover,OLD.img_url,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images_log`
--

CREATE TABLE `product_images_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_cover` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `referances`
--

CREATE TABLE `referances` (
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `referances`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_referances` BEFORE DELETE ON `referances` FOR EACH ROW BEGIN
    INSERT INTO referances_log (log_status,id,img_url,url,title,description,rank,is_active,created_at)
    VALUES ('deleted',OLD.id,OLD.img_url,OLD.url,OLD.title,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_referances` BEFORE UPDATE ON `referances` FOR EACH ROW BEGIN
    INSERT INTO referances_log (log_status,id,img_url,url,title,description,rank,is_active,created_at)
    VALUES ('update',OLD.id,OLD.img_url,OLD.url,OLD.title,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `referances_log`
--

CREATE TABLE `referances_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `services`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_services` BEFORE DELETE ON `services` FOR EACH ROW BEGIN
    INSERT INTO services_log (log_status,id, img_url,title,url,description,rank,is_active,created_at)
    VALUES ('Updated',OLD.id,OLD.img_url,OLD.title,OLD.url,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_services` BEFORE UPDATE ON `services` FOR EACH ROW BEGIN
    INSERT INTO services_log (log_status,id, img_url,title,url,description,rank,is_active,created_at)
    VALUES ('Updated',OLD.id,OLD.img_url,OLD.title,OLD.url,OLD.description,OLD.rank,OLD.is_active,OLD.created_at);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

CREATE TABLE `services_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(200) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `vision` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `mobile_img_url` varchar(500) NOT NULL,
  `favicon` varchar(500) NOT NULL,
  `phone1` varchar(500) NOT NULL,
  `phone2` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `facebook` varchar(500) NOT NULL,
  `twitter` varchar(500) NOT NULL,
  `instagram` varchar(500) NOT NULL,
  `linkedin` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gsm1` varchar(500) NOT NULL,
  `gsm2` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `settings`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_settings` BEFORE DELETE ON `settings` FOR EACH ROW BEGIN
    INSERT INTO settings_log (log_status,id, company_name,adress,about_us,slogan,mission,vision,img_url,mobile_img_url,favicon,phone1,phone2,email,facebook,twitter,instagram,linkedin,created_at,gsm1,gsm2)
    VALUES ('deleted',OLD.id,OLD.company_name,OLD.adress,OLD.about_us,OLD.slogan,OLD.mission,OLD.vision,OLD.img_url,OLD.mobile_img_url,OLD.favicon,OLD.phone1,OLD.phone2,OLD.email,OLD.facebook,OLD.twitter,OLD.instagram,OLD.linkedin,OLD.created_at,OLD.gsm1,OLD.gsm2 );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_settings` BEFORE UPDATE ON `settings` FOR EACH ROW BEGIN
    INSERT INTO settings_log (log_status,id, company_name,adress,about_us,slogan,mission,vision,img_url,mobile_img_url,favicon,phone1,phone2,email,facebook,twitter,instagram,linkedin,created_at,gsm1,gsm2)
    VALUES ('Updated',OLD.id,OLD.company_name,OLD.adress,OLD.about_us,OLD.slogan,OLD.mission,OLD.vision,OLD.img_url,OLD.mobile_img_url,OLD.favicon,OLD.phone1,OLD.phone2,OLD.email,OLD.facebook,OLD.twitter,OLD.instagram,OLD.linkedin,OLD.created_at,OLD.gsm1,OLD.gsm2 );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

CREATE TABLE `settings_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(500) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `adress` varchar(500) NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(500) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `vision` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `mobile_img_url` varchar(500) NOT NULL,
  `favicon` varchar(500) NOT NULL,
  `phone1` varchar(500) NOT NULL,
  `phone2` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `facebook` varchar(500) NOT NULL,
  `twitter` varchar(500) NOT NULL,
  `instagram` varchar(500) NOT NULL,
  `linkedin` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `gsm1` varchar(500) NOT NULL,
  `gsm2` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `company` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tetikleyiciler `testimonials`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_testimonials` BEFORE DELETE ON `testimonials` FOR EACH ROW BEGIN
INSERT INTO testimonials_log(log_status,id,title,description,full_name,company,img_url,rank,is_active)
VALUES ('Deleted',OLD.id, OLD.title,OLD.description,OLD.full_name,OLD.company, OLD.img_url,OLD.rank,OLD.is_active);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_testimonials` BEFORE UPDATE ON `testimonials` FOR EACH ROW BEGIN
INSERT INTO testimonials_log(log_status,id,title,description,full_name,company,img_url,rank,is_active)
VALUES ('Updated',OLD.id, OLD.title,OLD.description,OLD.full_name,OLD.company, OLD.img_url,OLD.rank,OLD.is_active);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials_log`
--

CREATE TABLE `testimonials_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(200) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `company` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`, `created_at`) VALUES
(15, '', 'halit200453@gmail.com', 'hal', 'it', 'c20ad4d76fe97759aa27a0c99bff6710', 1, '2024-05-08 15:10:55');

--
-- Tetikleyiciler `users`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_users` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
INSERT INTO users_log(log_status,id,img_url,email,name,surname,password,is_active)
VALUES ('deleted',OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_before_update_users` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
INSERT INTO users_log(log_status,id,img_url,email,name,surname,password,is_active)
VALUES ('update',OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

CREATE TABLE `users_log` (
  `log_id` int(11) NOT NULL,
  `log_status` varchar(200) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users_log`
--

INSERT INTO `users_log` (`log_id`, `log_status`, `log_created_at`, `id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`) VALUES
(3, 'update', '2024-05-08 13:02:18', 3, '', 'halit53@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(4, 'update', '2024-05-08 13:04:49', 3, '', 'halit53@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(5, 'deleted', '2024-05-08 13:05:04', 3, '', 'halit53@gmail.com', 'hal', 'it', '137f676b1ddfde562587977245be6fb9', 1),
(6, 'update', '2024-05-08 13:06:15', 4, '', 'halit200453@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(7, 'update', '2024-05-08 13:06:25', 4, '', 'halit200453@gmail.com', 'hal', 'it', '5353', 1),
(8, 'update', '2024-05-08 13:06:33', 4, '', 'halit200453@gmail.com', 'hala', 'it', '5353', 1),
(9, 'deleted', '2024-05-08 13:22:14', 6, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(10, 'deleted', '2024-05-08 13:22:15', 7, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(11, 'deleted', '2024-05-08 13:22:17', 4, '', 'halit20045353@gmail.com', 'hala', 'it', '5353', 1),
(12, 'deleted', '2024-05-08 13:22:18', 5, '', 'ali53@gmail.com', 'ali', 'öz', '3c59dc048e8850243be8079a5c74d079', 1),
(13, 'update', '2024-05-08 13:22:53', 8, '', 'asdfasd@gmail.com', 'asd', 'asd', 'aa0d2a804a3510442f2fd40f2100b054', 0),
(14, 'deleted', '2024-05-08 13:23:11', 8, '', 'asdfasd@gmail.com', 'asd', 'asd', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(15, 'deleted', '2024-05-08 13:24:42', 9, '', 'halit200453@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(16, 'deleted', '2024-05-08 13:24:43', 10, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(17, 'deleted', '2024-05-08 13:24:44', 11, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 1),
(18, 'deleted', '2024-05-08 13:32:05', 13, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(20, 'update', '2024-05-08 15:05:33', 12, '', 'halit200453@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(21, 'deleted', '2024-05-08 15:10:14', 14, '', 'ali53@gmail.com', 'ali', 'öz', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(22, 'deleted', '2024-05-08 15:10:15', 12, '', 'halit200453@gmail.com', 'hal', 'it', '53', 1),
(23, 'update', '2024-05-08 15:10:49', 15, '', 'halit200453@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1),
(24, 'update', '2024-05-08 15:10:55', 15, '', 'halit200453@gmail.com', 'hal', 'it', 'aa0d2a804a3510442f2fd40f2100b054', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `branches_log`
--
ALTER TABLE `branches_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `brands_log`
--
ALTER TABLE `brands_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products_log`
--
ALTER TABLE `products_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_categories_log`
--
ALTER TABLE `product_categories_log`
  ADD PRIMARY KEY (`log`);

--
-- Tablo için indeksler `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_images_log`
--
ALTER TABLE `product_images_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `referances`
--
ALTER TABLE `referances`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `referances_log`
--
ALTER TABLE `referances_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `services_log`
--
ALTER TABLE `services_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `settings_log`
--
ALTER TABLE `settings_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `testimonials_log`
--
ALTER TABLE `testimonials_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users_log`
--
ALTER TABLE `users_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `branches_log`
--
ALTER TABLE `branches_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `brands_log`
--
ALTER TABLE `brands_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products_log`
--
ALTER TABLE `products_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `product_categories_log`
--
ALTER TABLE `product_categories_log`
  MODIFY `log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_images_log`
--
ALTER TABLE `product_images_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `referances`
--
ALTER TABLE `referances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `referances_log`
--
ALTER TABLE `referances_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services_log`
--
ALTER TABLE `services_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings_log`
--
ALTER TABLE `settings_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonials_log`
--
ALTER TABLE `testimonials_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `users_log`
--
ALTER TABLE `users_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
