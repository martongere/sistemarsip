-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 03:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arsip`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip`
--

CREATE TABLE `arsip` (
  `arsip_id` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `arsip_nomor` varchar(50) NOT NULL,
  `arsip_tanggalarsip` date NOT NULL,
  `arsip_tanggalrekam` date NOT NULL DEFAULT curdate(),
  `unit_id` int(11) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `arsip_file` varchar(50) DEFAULT NULL,
  `arsip_perihal` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`arsip_id`, `jenis_id`, `arsip_nomor`, `arsip_tanggalarsip`, `arsip_tanggalrekam`, `unit_id`, `deleted`, `arsip_file`, `arsip_perihal`) VALUES
(7, 2, '010203', '2025-07-10', '2024-09-03', 2, '1', 'arsip_7.pdf', NULL),
(8, 2, '010203ee', '2025-07-10', '2024-09-03', 3, '0', 'arsip_7.pdf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `jenis_id` int(11) NOT NULL,
  `jenis_nama` varchar(50) NOT NULL,
  `delete` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`jenis_id`, `jenis_nama`, `delete`) VALUES
(1, 'Jenis Baru', '1'),
(2, 'Jenis 1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-08-14-052517', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1723993121, 1),
(3, '2024-08-14-052532', 'App\\Database\\Migrations\\CreateUnit', 'default', 'App', 1723993184, 2),
(4, '2024-08-21-103010', 'App\\Database\\Migrations\\CreateOperator', 'default', 'App', 1724236587, 3),
(5, '2024-08-26-035544', 'App\\Database\\Migrations\\CreateJenis', 'default', 'App', 1724767515, 4),
(6, '2024-08-27-140717', 'App\\Database\\Migrations\\CreateArsip', 'default', 'App', 1724770267, 5),
(7, '2024-08-27-101435', 'App\\Database\\Migrations\\AddFiletoArsip', 'default', 'App', 1725363589, 6),
(8, '2024-08-31-090206', 'App\\Database\\Migrations\\CreatePinjam', 'default', 'App', 1725363619, 7),
(9, '2024-09-05-141038', 'App\\Database\\Migrations\\AddPerihaltoArsip', 'default', 'App', 1725545636, 8);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `operator_id` int(11) NOT NULL,
  `operator_nama` varchar(100) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `operator_aktif` enum('1','0') NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`operator_id`, `operator_nama`, `unit_id`, `operator_aktif`, `user_id`) VALUES
(1, 'Gilang', 2, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `pinjam_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `arsip_id` int(11) NOT NULL,
  `pinjam_waktu` datetime NOT NULL DEFAULT current_timestamp(),
  `pinjam_approved` enum('1','0','unchecked') NOT NULL DEFAULT 'unchecked',
  `pinjam_sampai` date NOT NULL,
  `pinjam_keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`pinjam_id`, `unit_id`, `arsip_id`, `pinjam_waktu`, `pinjam_approved`, `pinjam_sampai`, `pinjam_keterangan`) VALUES
(1, 2, 8, '2024-09-05 14:34:57', '1', '2024-09-12', 'k');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_nama` varchar(100) NOT NULL,
  `deleted` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit_nama`, `deleted`) VALUES
(1, 'Unit 1', '1'),
(2, 'Unit 1', '0'),
(3, 'Unit 2', '0'),
(4, 'Unit 1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_password` text NOT NULL,
  `user_tipe` enum('admin','operator') NOT NULL,
  `user_aktif` enum('1','0') NOT NULL DEFAULT '1',
  `user_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `user_password`, `user_tipe`, `user_aktif`, `user_created`) VALUES
(1, 'admin', '$2y$10$w2D6bO1mBM.TcR.XqAEK8urdN/ZVKV1dJAz5ii2X7u678n48IZ5dC', 'admin', '1', '2024-08-25 21:00:03'),
(2, 'operator-1', '$2y$10$6aGWsmJ3WMR2Q9lmlXeFw.QPduWBGlhXWdveBL22KRVobBE0rOoom', 'operator', '1', '2024-08-25 21:09:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`arsip_id`),
  ADD KEY `arsip_jenis_id_foreign` (`jenis_id`),
  ADD KEY `arsip_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`jenis_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`operator_id`),
  ADD KEY `operator_unit_id_foreign` (`unit_id`),
  ADD KEY `operator_user_id_foreign` (`user_id`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`pinjam_id`),
  ADD KEY `pinjam_unit_id_foreign` (`unit_id`),
  ADD KEY `pinjam_arsip_id_foreign` (`arsip_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip`
--
ALTER TABLE `arsip`
  MODIFY `arsip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `jenis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `operator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `pinjam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `arsip_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`jenis_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arsip_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `operator`
--
ALTER TABLE `operator`
  ADD CONSTRAINT `operator_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operator_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_arsip_id_foreign` FOREIGN KEY (`arsip_id`) REFERENCES `arsip` (`arsip_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
