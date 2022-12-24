-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 02:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yommies`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add artikel', 7, 'add_artikel'),
(26, 'Can change artikel', 7, 'change_artikel'),
(27, 'Can delete artikel', 7, 'delete_artikel'),
(28, 'Can view artikel', 7, 'view_artikel'),
(29, 'Can add kategori artikel', 8, 'add_kategoriartikel'),
(30, 'Can change kategori artikel', 8, 'change_kategoriartikel'),
(31, 'Can delete kategori artikel', 8, 'delete_kategoriartikel'),
(32, 'Can view kategori artikel', 8, 'view_kategoriartikel'),
(33, 'Can add kategori resep', 9, 'add_kategoriresep'),
(34, 'Can change kategori resep', 9, 'change_kategoriresep'),
(35, 'Can delete kategori resep', 9, 'delete_kategoriresep'),
(36, 'Can view kategori resep', 9, 'view_kategoriresep'),
(37, 'Can add resep', 10, 'add_resep'),
(38, 'Can change resep', 10, 'change_resep'),
(39, 'Can delete resep', 10, 'delete_resep'),
(40, 'Can view resep', 10, 'view_resep'),
(41, 'Can add komentar resep', 11, 'add_komentarresep'),
(42, 'Can change komentar resep', 11, 'change_komentarresep'),
(43, 'Can delete komentar resep', 11, 'delete_komentarresep'),
(44, 'Can view komentar resep', 11, 'view_komentarresep'),
(45, 'Can add bookmarks', 12, 'add_bookmarks'),
(46, 'Can change bookmarks', 12, 'change_bookmarks'),
(47, 'Can delete bookmarks', 12, 'delete_bookmarks'),
(48, 'Can view bookmarks', 12, 'view_bookmarks');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$f7Yc1TaqZ0MrTG0tK9YRM9$wO6O2fcyNN3BRoLDpM8T7eQaJiFzm/xulRv6edrI5mI=', '2022-12-24 04:09:26.953649', 1, 'anna', 'Siti', 'Muawwanah', 'anna@gmail.com', 1, 1, '2022-12-05 15:29:42.790808'),
(2, 'pbkdf2_sha256$390000$oNa2l5slgvmhWO3PSLJ9cB$Y73oO4ye1XhJto4GLSMZjnR3LYq7QSVsClM0i/HESxM=', '2022-12-24 08:22:07.642696', 0, 'argi', 'argi nur', 'fatur', '', 0, 1, '2022-12-10 04:39:14.734588');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `base_bookmarks`
--

CREATE TABLE `base_bookmarks` (
  `id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resep_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_bookmarks`
--

INSERT INTO `base_bookmarks` (`id`, `created`, `user_id`, `resep_id`) VALUES
(3, '2022-12-11 15:25:39.116683', 2, NULL),
(6, '2022-12-12 00:41:13.589867', 2, NULL),
(8, '2022-12-24 09:13:38.284433', 1, 226);

-- --------------------------------------------------------

--
-- Table structure for table `base_kategoriresep`
--

CREATE TABLE `base_kategoriresep` (
  `id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `is_from_api` tinyint(1) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_kategoriresep`
--

INSERT INTO `base_kategoriresep` (`id`, `created`, `updated`, `category`, `key`, `is_from_api`, `thumb`) VALUES
(20, '2022-12-13 03:44:13.711420', '2022-12-13 03:44:13.711420', 'Dessert', 'resep-dessert', 1, NULL),
(21, '2022-12-13 03:44:13.823424', '2022-12-13 03:44:13.823424', 'Masakan Hari Raya', 'masakan-hari-raya', 1, NULL),
(22, '2022-12-13 03:44:13.839422', '2022-12-13 03:44:13.839422', 'Masakan Tradisional', 'masakan-tradisional', 1, NULL),
(23, '2022-12-13 03:44:13.887421', '2022-12-13 03:44:13.887421', 'Menu Makan Malam', 'makan-malam', 1, NULL),
(24, '2022-12-13 03:44:13.936063', '2022-12-13 03:44:13.936063', 'Menu Makan Siang', 'makan-siang', 1, NULL),
(25, '2022-12-13 03:44:13.984061', '2022-12-13 03:44:13.984061', 'Resep Ayam', 'resep-ayam', 1, NULL),
(26, '2022-12-13 03:44:14.129097', '2022-12-13 03:44:14.129097', 'Resep Daging', 'resep-daging', 1, NULL),
(27, '2022-12-13 03:44:14.177123', '2022-12-13 03:44:14.177123', 'Resep Sayuran', 'resep-sayuran', 1, NULL),
(28, '2022-12-13 03:44:14.226631', '2022-12-13 03:44:14.226631', 'Resep Seafood', 'resep-seafood', 1, NULL),
(29, '2022-12-13 03:44:14.274287', '2022-12-13 03:44:14.274287', 'Sarapan', 'sarapan', 1, NULL),
(32, '2022-12-24 04:44:58.447192', '2022-12-24 04:44:58.447192', 'Kategori 1 masaaa', 'kategori-1-masaaa', NULL, 'chef-180511033819.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `base_komentarresep`
--

CREATE TABLE `base_komentarresep` (
  `id` bigint(20) NOT NULL,
  `key_resep` varchar(255) DEFAULT NULL,
  `komentar` longtext DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_komentarresep`
--

INSERT INTO `base_komentarresep` (`id`, `key_resep`, `komentar`, `created`, `user_id`) VALUES
(1, 'resep-kue-cubit-gurih', 'komentar baru', '2022-12-11 09:10:11.443264', 2),
(2, 'resep-kue-cubit-gurih', 'komen lagi', '2022-12-11 09:16:12.594321', 2),
(3, 'cara-membuat-sate-kambing-kuah-tongseng', 'komentar baru', '2022-12-11 09:17:01.746592', 2),
(6, 'resep-terbaru', 'komentar baru', '2022-12-24 08:22:00.767395', 1);

-- --------------------------------------------------------

--
-- Table structure for table `base_resep`
--

CREATE TABLE `base_resep` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `times` varchar(255) DEFAULT NULL,
  `serving` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `author_user` varchar(255) DEFAULT NULL,
  `author_datePublished` varchar(255) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `ingredient` longtext DEFAULT NULL,
  `step` longtext DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `is_from_api` tinyint(1) DEFAULT NULL,
  `kategori_resep_id` bigint(20) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `url_youtube` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_resep`
--

INSERT INTO `base_resep` (`id`, `title`, `thumb`, `key`, `times`, `serving`, `difficulty`, `author_user`, `author_datePublished`, `desc`, `ingredient`, `step`, `created`, `author_id`, `is_from_api`, `kategori_resep_id`, `updated`, `url_youtube`) VALUES
(1, 'Maskan murah mudah praktis', 'DSC02465_edit-1000x350.jpg', 'maskan-murah-mudah-praktis', '1jam', '1 Porsi', 'Cukup Rumit', NULL, NULL, '<p>adasdas</p>\r\n', 'bawang putih, merica bubuk, lada', '1. panaskan minyak, 2. masukkan air, 3. terserah mau ngapain', '2022-12-17 05:03:34.414648', 2, 0, 20, '2022-12-22 02:49:29.681451', NULL),
(225, 'Resep Bakwan Jagung Sayuran Sambal Kecap Pedas yang Bikin Nagih', 'https://www.masakapahariini.com/wp-content/uploads/2022/10/resep-bakwan-jagung-sayur-400x240.jpg', 'resep-bakwan-jagung-sayuran', '30mnt', '3 Porsi', 'Mudah', NULL, NULL, NULL, '[\'150 g jagung manis pipil\', \'100 g tepung terigu\', \'80 g wortel, potong korek api\', \'80 g kol, iris\', \'130 ml air\', \'1 batang daun bawang, iris halus\', \'1 sdt garam\', \'½ sdt Royco Kaldu Ayam\', \'½ sdt merica putih bubuk\', \'½ sdt baking powder\', \' Minyak, untuk menggoreng\', \'6 butir bawang merah\', \'4 siung bawang putih\', \'10 buah cabai rawit, iris\', \'8 butir bawang merah\', \'5 sdm Bango Kecap Manis\']', '[\'1 Aduk tepung, air, bumbu halus, Royco Kaldu Ayam, merica, garam, dan baking powder hingga rata. Sisihkan.\', \'2 Sambal kecap: Aduk rata semua bahan termasuk Bango Kecap Manis. Sisihkan.\', \'3 Masukkan jagung, wortel, buncis, dan kol, aduk rata.\', \'4 Panaskan minyak, ambil satu sendok sayur adonan, goreng dalam minyak panas hingga matang dan kecokelatan. Angkat, tiriskan. Sajikan.\']', NULL, NULL, 1, 23, '0000-00-00 00:00:00.000000', NULL),
(226, 'Resep Gule Daging Sapi, Paling Istimewa untuk Makan Malam', 'https://www.masakapahariini.com/wp-content/uploads/2020/08/gule-daging-400x240.jpg', 'resep-gule-daging-sapi', '1jam 30mnt', '2 Porsi', 'Mudah', NULL, NULL, NULL, '[\'5 sdm minyak\', \'600 g daging sapi bagian sengkel, potong-potong\', \'700 ml santan encer\', \'700 ml susu rendah lemak\', \'200 ml santan kental\', \'1 sdt gula merah\', \'1 sdt asam jawa, larutkan dengan 1 sdm air panas\', \'1 sdt Royco Kaldu Sapi\', \'2 cm lengkuas', '[\'1 Panaskan minyak,tumis bumbu halus, lengkuas, serai, dan bumbu kering hingga harum.\', \'2 Masukkanxa0dagingxa0sapi,xa0masakxa0hinggaxa0kaku.xa0Tuangxa0santanxa0encerxa0dan susuxa0rendahxa0lemak,xa0aduk.xa0Masakxa0hinggaxa0mend', NULL, NULL, 1, 24, '0000-00-00 00:00:00.000000', NULL),
(227, 'Resep Ceker Pedas Manis Daun Jeruk, Sajian Lezat untuk Weekend', 'https://www.masakapahariini.com/wp-content/uploads/2022/06/resep-ceker-pedas-manis-400x240.jpg', 'resep-ceker-pedas-manis-daun-jeruk', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'800 g ceker ayam, potong kukunya\', \'800 ml air, untuk merebus\', \'1 sdt garam\', \'½ sdt merica putih bubuk\', \'1 cm jahe\', \'8 lembar daun jeruk\', \'4 sdm Bango Kecap Manis Hitam Gurih\', \'1 sdt Royco Kaldu Ayam\', \'3 sdm minyak, untuk menumis\', \'15 buah cabai', '[\'1 Rebus ceker ayam bersama garam, merica, dan jahe hingga ceker empuk. Angkat. Sisihkan.\', \'2 Panaskan minyak, tumis bumbu halus dan daun jeruk hingga harum. Masukkan ceker, Bango Kecap Manis Hitam Gurih, dan Royco Kaldu Ayam. Aduk rata.\', \'3 Tuang 150 ', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(228, 'Resep Pecel Ayam Sambal Bawang Khas Warung Tenda yang Nikmat', 'https://www.masakapahariini.com/wp-content/uploads/2020/05/resep-pecel-ayam-400x240.jpg', 'resep-pecel-ayam-sambal-bawang', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'1 ekor ayam, potong 4 bagian, buang kulitnya\', \'3 sdm air perasan jeruk nipis\', \'1 sdt garam\', \' minyak, untuk menggoreng\', \'10 siung bawang putih\', \'3 buah kemiri\', \'10 cm kunyit\', \'1 sdm ketumbar\', \'1 sdt Royco Kaldu Ayam\', \'20 buah cabai rawit merah\'', '[\'1 Lumurixa0dagingxa0ayamxa0denganxa0airxa0jerukxa0nipisxa0dan garam,xa0sisihkan.xa0\', \'2 Panaskanxa0minyak,xa0tumisxa0bumbuxa0halusxa0hinggaxa0harum. Masukkanxa0dagingxa0ayam,xa0aduk.xa0Tambahkanxa0Royco Kalduxa0Ayam,xa0aduk.xa0Masakxa0hinggaxa0dagingxa', NULL, NULL, 1, 25, '0000-00-00 00:00:00.000000', NULL),
(229, 'Resep Taoge Goreng, Satu yang Klasik dari Bogor', 'https://www.masakapahariini.com/wp-content/uploads/2020/03/taoge-goreng-1-400x240.jpg', 'resep-taoge-goreng', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'200 g taoge, siangi, seduh air panas\', \'150 g mi telur, rebus\', \'2 bungkus lontong, iris\', \'3 siung bawang putih\', \'5 butir bawang merah\', \'2 buah cabai merah\', \'150 g oncom, potong kotak\', \'6 sdm taoco manis\', \'2 batang kucai, potong-potong\', \'2 batang', '[\'1 Panaskan minyak, tumis bumbu halus hingga harum.\', \'2 Masukkan daun bawang, serai, dan daun salam. Aduk rata.\', \'3 Masukkan taoco, Bango Kecap Manis, Royco Kaldu Ayam, gula, merica, oncom, dan air. Masak hingga kuah mengental.\', \'4 Tata lontong, mi, d', NULL, NULL, 1, 25, '0000-00-00 00:00:00.000000', NULL),
(230, 'Resep Nasi Kari Hamburg, Menu Masa Kini untuk Akhir Pekan', 'https://www.masakapahariini.com/wp-content/uploads/2019/07/nasi-kari-hamburg-400x240.jpg', 'resep-nasi-kari-hamburg', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'300 g nasi hangat\', \'3 butir telur ayam\', \'250 g daging sapi giling\', \'100 g tahu\', \'40 g saus tomat\', \'10 g saus tiram\', \'10 g bawang bombay, potong dadu\', \'50 g bawang putih, potong dadu\', \'7 g Royco Kaldu Ayam\', \'4 g Bango Kecap Manis\', \'1 sachet Roy', '[\'1 Hamburg: Tumis bawang putih dan bawang bombay. Sisihkan.\', \'2 Satukan daging cincang, Royco Kaldu Ayam, Bango Kecap Manis, saus tomat, tahu dan saus tiram. Campur bersama bawang bombay dan bawang putih. Aduk hingga rata.\', \'3 Bentuk adonan seperti ham', NULL, NULL, 1, 27, '0000-00-00 00:00:00.000000', NULL),
(231, 'Resep Pepes Ikan Mas, Menu Jadul Nikmat yang Bikin Nagih', 'https://www.masakapahariini.com/wp-content/uploads/2019/05/pepes-ikan-mas-8-400x240.jpg', 'resep-pepes-ikan-mas', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'500 g ikan mas\', \'1 sdm air jeruk nipis\', \'15 g daun kemangi\', \' daun pisang, untuk membungkus ikan\', \'1 buah tomat, iris tipis\', \'5 lembar daun salam\', \'5 lembar daun jeruk\', \'1 batang serai\', \'2 sdm Bango Kecap Manis Pedas\', \'10 butir bawang merah\', \'', '[\'1 Ambil Bumbu halus dengan kecap.\', \'2 Campur rata bumbu halus dengan Bango Kecap Manis Pedas. Sisihkan.\', \'3 Ambi daun pisang, letakkan ikan ke atasnya. Tutup ikan dengan bumbu pepes secara merata. Letakkan daun salam, serai, tomat, dan daun kemangi ke', NULL, NULL, 1, 27, '0000-00-00 00:00:00.000000', NULL),
(232, 'Resep Paprika Isi Daging Asam Manis, Untuk Bekal Sehat', 'https://www.masakapahariini.com/wp-content/uploads/2019/10/Paprika-Isi-Daging-400x240.jpg', 'resep-paprika-isi-daging-asam-manis', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'300 g nasi putih\', \'300 g daging sapi giling\', \'3 buah tomat, buang biji, potong dadu 1 cm\', \'1 buah bawang bombay, cincang halus\', \'4 siung bawang putih, cincang halus\', \'3 sdm Bango Kecap Manis\', \'1 sdt garam\', \'½ sdt merica bubuk\', \'2 sdm minyak, unt', '[\'1 Panaskan minyak, tumis bawang bombay dan bawang putih hingga harum.\', \'2 Masukkan daging giling, Bango Kecap Manis, garam, dan merica. Masak hingga daging berubah warna, angkat dan sisihkan.\', \'3 Dalam mangkuk, campur nasi, tumisan daging, dan tomat. ', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(233, 'Resep Iga Bakar Jangkung yang Bikin Ngiler Pencinta Iga Kambing', 'https://www.masakapahariini.com/wp-content/uploads/2019/06/iga-bakar-jangkung-400x240.jpg', 'resep-iga-bakar-jangkung', '2jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'250 g daging iga kambing atau bisa juga menggunakan daging kambing\', \'5 siung bawang putih, haluskan\', \'5 cm kunyit, haluskan\', \'1.5 L air\', \'2 sdm minyak samin\', \'4 sdm Bango Kecap Manis\', \'10 butir bawang merah, iris halus\', \'2 buah tomat merah, iris ', '[\'1 Bersihkan iga dan potong 2 atau 3 ruas saja agar cepat matang merata. Rebus iga bersama bawang putih, kunyit, dan garam hingga empuk (sekitar 1 jam).\', \'2 Angkat iga, tiriskan. Sisihkan hingga daging iga tidak panas.\', \'3 Siapkan grill pan atau wajan ', NULL, NULL, 1, 21, '0000-00-00 00:00:00.000000', NULL),
(234, 'Resep Nasi Goreng Ayam Suwir, Lezatnya Bikin Ludes Tak Bersisa', 'https://www.masakapahariini.com/wp-content/uploads/2021/09/04.-Nasi-Goreng-Sayur-400x240.jpg', 'resep-nasi-goreng-ayam-suwir', '30mnt', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'400 g nasi putih\', \'2 buah sosis sapi, kerat ujungnya, iris kecil-kecil\', \'100 g ayam goreng, suwir\', \'1 butir telur ayam\', \'3 butir bawang merah, iris tipis\', \'2 siung bawang putih, cincang halus\', \'2 buah cabai merah, buang biji, iris tipis\', \'2 sdm B', '[\'1 Panaskan minyak, tumis bawang merah, bawang putih, dan cabai hingga harum.\', \'2 Masukkan nasi, telur, dan ayam suwir. Aduk rata.\', \'3 Tambahkan kecap asin, Bango Kecap Manis, merica, dan garam. Aduk rata.\', \'4 Tambahkan sosis dan daun bawang. Aduk rat', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(235, 'Resep Lumpia Beef a la Thailand, Ide Camilan Enak untuk Keluarga', 'https://www.masakapahariini.com/wp-content/uploads/2022/05/lumpia-beef-featured-400x240.jpg', 'resep-lumpia-beef-a-la-thailand', '1jam', '1 Porsi', 'Cukup Rumit', NULL, NULL, NULL, '[\'350 g daging sapi has dalam, iris tipis\', \'100 g wortel, potong korek api\', \'100 g kyuri, potong korek api\', \'100 g selada iceberg, iris\', \'50 g daun ketumbar\', \'12 lembar rice paper/banh trang\', \'1 batang daun bawang, iris tipis\', \'1 sdt Royco Kaldu Sa', '[\'1 Lumuri daging sapi dengan Royco Kaldu Sapi, Royco Saus Tiram, dan merica hitam.\', \'2 Panaskan grill pan atau wajan antilengket, masak daging sapi hingga matang. Angkat. Sisihkan.\', \'3 Saus: Aduk rata semua bahan. Sisihkan.\', \'4 Siapkan wadah lebar yan', NULL, NULL, 1, 25, '0000-00-00 00:00:00.000000', NULL),
(236, 'Resep Sandwich Ayam Krispi Saus Telur Asin, Ide Praktis Untuk Menu Brunch', NULL, 'resep-sandwich-ayam-krispi-saus-telur-asin', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'4 buah roti burger atau roll bread\', \'4 filet dada ayam tanpa kulit\', \'½ sdt Royco Kaldu Ayam\', \'¼ sdt merica putih bubuk\', \'¼ sdt bawang putih bubuk\', \' Minyak, untuk menggoreng\', \'5 sdm tepung maizena\', \'¼ sdt Royco Kaldu Ayam\', \'1 bungkus Royco Bumbu', '[\'1 Ayam krispi: Marinasi daging ayam dengan Royco Kaldu Ayam, bawang putih bubuk, dan merica. Diamkan selama 10 menit dalam kulkas. Sisihkan.\', \'2 Lumuri daging ayam dengan tepung bumbu hingga tersalut rata.\', \'3 Panaskan minyak, goreng daging ayam hingg', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(237, 'Resep Semur Daging Betawi Asli dan Lezat untuk Hidangan Sekeluarga', 'https://www.masakapahariini.com/wp-content/uploads/2018/04/End-Shot-400x240.jpg', 'semur-daging-betawi', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'500 g daging sapi sengkel\', \'400 g kentang poton...', '[\'1 Sangrai semua bahan bumbu halus sampai harum, kemudian haluskan.\', \'2 Marinate daging sapi dengan bumbu halus dan bumbu iris hingga tercampur dengan rata. Lalu tambahkan daun salam, serai, kayu manis, kapulaga, bunga peka, biji pala, cengkeh, Royco Ka', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(238, 'Resep Ikan Goreng Acar Kuning, Hadirkan Keseruan Saat Santap Bersama', 'https://www.masakapahariini.com/wp-content/uploads/2018/12/ikan-goreng-acar-kuning-MAHI-8-400x240.jpg', 'resep-ikan-goreng-acar-kuning', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'600 g ikan gurame\', \'1 sdm air jeruk nipis\', \'1 sdt garam\', \'½ sdt merica putih bubuk\', \'500 ml minyak, untuk menggoreng dan menumis\', \'2 batang serai, memarkan\', \'3 cm lengkuas, memarkan\', \'2 lembar daun salam\', \'250 ml air\', \'1 buah wortel, potong kor', '[\'1 Lumuri ikan gurame dengan jeruk nipis secara merata. Diamkan hingga meresap selama sekitar 10 menit. Cuci bersih, bumbui dengan garam dan merica.\', \'2 Panaskan minyak untuk menggoreng dalam wajan, goreng ikan gurame hingga kecokelatan dan garing. Angk', NULL, NULL, 1, 32, '0000-00-00 00:00:00.000000', NULL),
(239, 'Resep Buntil Daun Singkong, Menu Pendamping Lezat untuk Makan Siang', 'https://www.masakapahariini.com/wp-content/uploads/2020/10/buntil-daun-singkong-400x240.jpg', 'resep-buntil-daun-singkong', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'15 buah cabai rawit merah\', \'6 lembar daun salam\', \'2 cm jahe, memarkan\', \'350 ml susu rendah lemak\', \'350 ml santan\', \'1 sdt Royco Kaldu Ayam\', \'3 sdm minyak, untuk menumis\', \'300 g kelapa setengah tua, parut memanjang\', \'100 g petai cina\', \'100 g teri', '[\'1 Buntil: Campur kelapa parut, petai cina, teri medan, bawang merah, bawang putih, dan garam. Sisihkan.\', \'2 Siapkan talenan, letakkan ± 10 lembar daun singkong ke atasnya. Ambil 2 sdm campuran kelapa, taruh di atas daun. Lipat setiap sisi daun ke bagia', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(240, 'Resep Tumis Daging Sapi Jamur Hioko, Resep Praktis Seenak Restoran', 'https://www.masakapahariini.com/wp-content/uploads/2021/06/Tumis-Daging-Sapi-Jamur-Hioko-400x240.jpg', 'resep-tumis-daging-sapi-jamur-hioko', '30mnt', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'500 g daging sapi has dalam, iris tipis\', \'200 g jamur hioko segar, iris\', \'1 sdm Bango Kecap Manis Light\', \'1 buah bawang bombay, iris 1 cm\', \'4 siung bawang putih, cincang\', \'2 cm jahe\', \'100 ml air\', \'1 sdt Royco Kaldu Sapi\', \'1 sdm Jawara Cabai Tabu', '[\'1 Panaskan minyak, tumis bawang putih dan jahe hingga harum. Masukkan daging sapi, tumis hingga berubah warna.\', \'2 Masukkan Bango Kecap Manis Light, Royco Kaldu Sapi, aduk. Tambahkan jamur, aduk hingga jamur layu. Tuang air. Masak hingga mendidih.\', \'3', NULL, NULL, 1, 18, '0000-00-00 00:00:00.000000', NULL),
(241, 'Resep Sup Tomat Daging Sapi, Sajian yang Menghangatkan Badan', 'https://www.masakapahariini.com/wp-content/uploads/2019/01/sup-tomat-daging-sapi-6-400x240.jpg', 'resep-sup-tomat-daging', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'350 g daging sapi cincang\', \'400 g tomat merah, potong dadu kecil\', \'2 buah kentang, potong dadu 1 cm\', \'2 buah wortel, potong dadu kecil\', \'1 sdm minyak, untuk menumis\', \'1 buah bawang bombay, potong kotak kecil\', \'3 siung bawang putih, cincang\', \'800 ', '[\'1 Panaskan minyak, tumis bawang bombay dan bawang putih hingga harum.\', \'2 Masukkan daging sapi cincang, wortel, dan tomat. Tumis hingga daging matang.\', \'3 Tuang air, merica, dan Royco Kaldu Sapi, aduk rata.\', \'4 Masukkan kentang, gula, daun basil, ore', NULL, NULL, 1, 21, '0000-00-00 00:00:00.000000', NULL),
(242, 'Resep Bola Tempe Keju Siram Saus Kacang, Kudapan Super Lezat', 'https://www.masakapahariini.com/wp-content/uploads/2018/07/bola_tempe_keju_MAHI-400x240.jpg', 'resep-bola-tempe-keju-siram-saus-kacang', '45mnt', '1 Porsi', 'Cukup Rumit', NULL, NULL, NULL, '[\'100 g tempe, kukus dan hancurkan\', \'50 g keju parut\', \'¼ batang daun bawang, cincang halus\', \'1 batang seledri, cincang halus\', \'100 g tepung tapioka\', \'120 g tepung terigu serbaguna\', \'1 sdt Royco Kaldu Ayam\', \'½ sdt garam\', \'½ sdt garlic powder\', \'1 s', '[\'1 Cara membuat bola tempe kenyal: Didihkan air untuk merebus tepung tapioka. Tambahkan 1 sdm minyak goreng.\', \'2 Campur semua bahan termasuk Royco Kaldu Ayam, tuang air panas, dan aduk rata. Setelah hangat uleni sebentar dengan tangan dan bentuk bulat-b', NULL, NULL, 1, 26, '0000-00-00 00:00:00.000000', NULL),
(243, 'Resep Sup Jamur, Ide Menu Isoman yang Enak dan Bikin Tubuh Hangat', 'https://www.masakapahariini.com/wp-content/uploads/2019/01/sup-jamur-6-400x240.jpg', 'resep-sup-jamur', '1jam', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'150 g jamur kancing (champignon), iris tipis\', \'50 g jamur tiram\', \'50 g jamur enoki\', \'1 buah bawang bombay, iris tipis\', \'1 siung bawang putih, cincang\', \'½ sdt merica putih bubuk\', \'¼ sdt pala bubuk\', \'1 bungkus Royco Sup Krim Ayam\', \'1 sdm margarin,', '[\'1 Campur Royco Sup Krim Ayam dengan air dingin, aduk hingga tidak menggumpal.\', \'2 Panaskan margarin, tumis bawang bombay hingga harum.\', \'3 Masukkan bawang putih dan jamur. Tumis hingga jamur matang. Sisihkan 3 sdm jamur.\', \'4 Tuangkan tumis jamur ke d', NULL, NULL, 1, 28, '0000-00-00 00:00:00.000000', NULL),
(244, 'Resep Laksa Bogor, Street Food Paling Hits dari Kota Hujan', 'https://www.masakapahariini.com/wp-content/uploads/2020/07/Laksa-Bogor-400x240.jpg', 'resep-laksa-bogor', '1jam 15mnt', '1 Porsi', 'Mudah', NULL, NULL, NULL, '[\'1 ekor (800 g) ayam kampung\', \'500 ml air, untuk merebus\', \'500 ml susu rendah lemak\', \'2 batang serai\', \'3 lembar daun salam\', \'3 lembar daun jeruk\', \'250 g udang kupas\', \'300 ml santan kental\', \'1 sdt Royco Kaldu Ayam\', \' minyak, untuk menumis\', \'12 b', '[\'1 Rebus daging ayam kampung hingga mendidih. Sisihkan.\', \'2 Panaskan minyak, tumis bumbu halus, serai, daun salam, dan daun jeruk hingga harum. Angkat.\', \'3 Masukkan ke dalam rebusan daging ayam, aduk. Tuang susu rendah lemak, santan, dan Royco Kaldu Ay', NULL, NULL, 1, 29, '0000-00-00 00:00:00.000000', NULL),
(245, 'Resep Terbaru', 'chef-180511033819.jpg', 'resep-terbaru', '1jam', '1 pporsi', 'Mudah', NULL, NULL, '<p>resep by resep</p>\r\n', 'bawang merah, bawang putih', 'cukup rumit, kemudian ', '2022-12-22 08:09:58.017168', 2, 0, 29, '2022-12-24 05:58:32.120948', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-06 05:10:56.277374', '1', 'Kategori 1 - Masakan padang', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-12-06 05:11:16.241961', '1', 'Padang Nimbro', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'base', 'artikel'),
(12, 'base', 'bookmarks'),
(8, 'base', 'kategoriartikel'),
(9, 'base', 'kategoriresep'),
(11, 'base', 'komentarresep'),
(10, 'base', 'resep'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-05 15:29:01.779441'),
(2, 'auth', '0001_initial', '2022-12-05 15:29:07.282477'),
(3, 'admin', '0001_initial', '2022-12-05 15:29:08.201185'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-05 15:29:08.232438'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-05 15:29:08.279315'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-05 15:29:08.623065'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-05 15:29:08.998058'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-05 15:29:09.255458'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-05 15:29:09.286706'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-05 15:29:09.614832'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-05 15:29:09.646082'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-05 15:29:09.683707'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-05 15:29:09.824325'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-05 15:29:09.937453'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-05 15:29:10.046833'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-05 15:29:10.093706'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-05 15:29:10.203081'),
(18, 'base', '0001_initial', '2022-12-05 15:29:10.734785'),
(19, 'base', '0002_remove_artikel_kategori_artikel_host', '2022-12-05 15:29:11.829683'),
(20, 'base', '0003_rename_host_artikel_kategori_artikel_author', '2022-12-05 15:29:21.389766'),
(21, 'base', '0004_kategoriartikel_kategoriproduk_produk_and_more', '2022-12-05 15:29:23.817082'),
(22, 'base', '0005_alter_produk_harga', '2022-12-05 15:29:23.863961'),
(23, 'base', '0006_kategoriartikel_created_kategoriproduk_created', '2022-12-05 15:29:23.988971'),
(24, 'base', '0007_slider', '2022-12-05 15:29:24.126001'),
(25, 'base', '0008_produk_gambar_alter_slider_gambar', '2022-12-05 15:29:24.172878'),
(26, 'base', '0009_rename_judul_produk_nama_produk', '2022-12-05 15:29:24.219760'),
(27, 'base', '0010_setting', '2022-12-05 15:29:24.410236'),
(28, 'base', '0011_kategoriresep', '2022-12-05 15:29:24.597765'),
(29, 'base', '0012_remove_produk_author_remove_produk_kategori_produk_and_more', '2022-12-05 15:29:25.685798'),
(30, 'sessions', '0001_initial', '2022-12-05 15:29:25.906289'),
(31, 'base', '0013_resep_delete_artikel_delete_kategoriartikel', '2022-12-06 03:57:50.253596'),
(32, 'base', '0014_resep_url_youtube', '2022-12-08 03:15:51.499551'),
(33, 'base', '0015_remove_resep_gambar_remove_resep_isi_and_more', '2022-12-10 09:40:33.925914'),
(34, 'base', '0016_resep_is_from_api', '2022-12-10 11:05:25.807251'),
(35, 'base', '0017_remove_kategoriresep_judul_kategoriresep_category_and_more', '2022-12-11 06:20:41.331973'),
(36, 'base', '0018_kategoriresep_is_from_api', '2022-12-11 07:01:25.254126'),
(37, 'base', '0019_komentarresep', '2022-12-11 08:57:05.258123'),
(38, 'base', '0020_bookmarks', '2022-12-11 12:27:44.212848'),
(39, 'base', '0021_bookmarks_difficulty_resep_bookmarks_serving_resep_and_more', '2022-12-11 15:20:29.549881'),
(40, 'base', '0022_kategoriresep_thumb_alter_resep_key', '2022-12-24 04:17:46.481354'),
(41, 'base', '0023_remove_bookmarks_difficulty_resep_and_more', '2022-12-24 06:33:45.034302');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1v0fnfvmbafdxlhk39dm0opzfplvpw98', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p7ED9:MGj_GaLEkITVLmVrSR8sMtjOUSUEubYwmVBlLEpLPvY', '2023-01-02 11:21:35.873059'),
('4du3tpnfhw67bhqsvompejjjkl1mec6v', '.eJxVjEEOwiAQRe_C2hA6lAIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7dmIJe1NjxAdt6ARzWCBZy8tlETJFQwAdmEOUadx6iG5K0nQ85qVl68P9WQN6M:1p8znD:R4XtVrGewNMgoKCyh4J0AXQIFk6O524X48CoFRHJ9_A', '2023-01-07 08:22:07.766420'),
('7u6vogckj42g4y4s2yg1wkb0sc7d6ald', '.eJxVjEEOwiAQRe_C2hA6lAIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7dmIJe1NjxAdt6ARzWCBZy8tlETJFQwAdmEOUadx6iG5K0nQ85qVl68P9WQN6M:1p4WcS:z4MFaqel7GA6OWgSPpyDXNq0bgLxf1_WikbtFGuszrk', '2022-12-26 00:24:32.338539'),
('81jy8zv99njxdcrp3fyo2jatz2ldc91x', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p4clr:iR2nVnzy5oROhcm3USxA3cJSmeLFnnQjeGSFzwjvFZ0', '2022-12-26 06:58:39.608794'),
('88bil8crdorprg7jfofy07h08fdc0lqr', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p2NLJ:JETaza3SD58ViiR7lhgYWR4U_dym8nyfZVi17BvpSlk', '2022-12-20 02:05:57.047187'),
('9gsfaosltfg6b7f3nsgzxns5kdt0zhaj', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p7FCq:z7MwZAGCer4VnEL6_jA3XUFBN2eTSmXwpR27_d2MID8', '2023-01-02 12:25:20.288949'),
('bn300cgi6yg0lloq4ilvlkqbfk9cdzmq', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p4Fi8:ZfUdnYolvcuqlmhwhkYyP2QfQZAp_vZnFa7Pc2I5TAg', '2022-12-25 06:21:16.208128'),
('f3hffrvy9o0ofajawthkxpwcxmf9apu5', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p379r:qRlxkX7pwR-bBxDSqW4qXzkfPNIfWfnXRwYtOSqU-VM', '2022-12-22 03:01:11.309515'),
('hl1u3658hct2ezrvpif4yfi78jcyv5vg', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p4xqP:c1iVDB2KcFi5C1SJK8IDJQMyrSP1OLLDKTuUc6XeiRM', '2022-12-27 05:28:45.736933'),
('i33o54m3q9y4k7y54urhkurfjnyimjhe', '.eJxVjEEOwiAQRe_C2hA6lAIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7dmIJe1NjxAdt6ARzWCBZy8tlETJFQwAdmEOUadx6iG5K0nQ85qVl68P9WQN6M:1p4ON5:f0XnstHw-aaq0EMm5w9FAjjUqsDbFzPAuMdWSF_48Js', '2022-12-25 15:36:07.322245'),
('n5lp3hfspti4zsrv9zo1zo95mj4tdm57', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p2ltp:90Y8gXn8ZmDE1QqcHGlEcl1WSA9XkukCxmpbLhl5AZE', '2022-12-21 04:19:13.619832'),
('p8nqk9f3vs0iivlsft0brex7k7xurl3r', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p8vqg:FMyYhFDr_fgiTfa1vRuAGFyq8pLA9Lq3TU73tXd2X54', '2023-01-07 04:09:26.999463'),
('rck57t82gk7wgvom1vy4m6b0g4ewzai5', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p3riu:ft-2y4ixoZq1N1NkFMeuRgxAaVkMTjcfmXo__KhvBww', '2022-12-24 04:44:28.048622'),
('ss60o02lru2pkpbaae2f9lj0dr1rbc70', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p3xit:9Y6SHAksOIkgaycieTvacmZMKHtuAmc8iCRFpOZtIJg', '2022-12-24 11:08:51.538912'),
('ug4b8xheowizq2mg53jl8qbmh1hucypv', '.eJxVjEEOwiAQRe_C2hAoFMSl-56BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4k7gILU6_WwJ8cN0B3aHemsRW12VOclfkQbucGvHzerh_BwV6-dbstFNEyirETODGwIQDBMwWB2-N0dYkjxkdJ5Wcy4QMnBOfx-CVNeL9AQxUORw:1p6PHo:xBOeD7C0r_cEWum2i3QhVa5c-MyEo4MuU4p3rlqxQzs', '2022-12-31 04:59:00.357996');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `base_bookmarks`
--
ALTER TABLE `base_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_bookmarks_user_id_03b53d72_fk_auth_user_id` (`user_id`),
  ADD KEY `base_bookmarks_resep_id_d5a4415a_fk_base_resep_id` (`resep_id`);

--
-- Indexes for table `base_kategoriresep`
--
ALTER TABLE `base_kategoriresep`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_komentarresep`
--
ALTER TABLE `base_komentarresep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_komentarresep_user_id_5de5441d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_resep`
--
ALTER TABLE `base_resep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_resep_author_id_7a918fb8_fk_auth_user_id` (`author_id`),
  ADD KEY `base_resep_kategori_resep_id_b92e9f75_fk_base_kategoriresep_id` (`kategori_resep_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_bookmarks`
--
ALTER TABLE `base_bookmarks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `base_kategoriresep`
--
ALTER TABLE `base_kategoriresep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `base_komentarresep`
--
ALTER TABLE `base_komentarresep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `base_resep`
--
ALTER TABLE `base_resep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_bookmarks`
--
ALTER TABLE `base_bookmarks`
  ADD CONSTRAINT `base_bookmarks_resep_id_d5a4415a_fk_base_resep_id` FOREIGN KEY (`resep_id`) REFERENCES `base_resep` (`id`),
  ADD CONSTRAINT `base_bookmarks_user_id_03b53d72_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_komentarresep`
--
ALTER TABLE `base_komentarresep`
  ADD CONSTRAINT `base_komentarresep_user_id_5de5441d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_resep`
--
ALTER TABLE `base_resep`
  ADD CONSTRAINT `base_resep_author_id_7a918fb8_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_resep_kategori_resep_id_b92e9f75_fk_base_kategoriresep_id` FOREIGN KEY (`kategori_resep_id`) REFERENCES `base_kategoriresep` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
