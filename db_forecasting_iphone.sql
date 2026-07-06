-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2026 at 06:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_forecasting_iphone`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_penjualan`
--

CREATE TABLE `data_penjualan` (
  `id_penjualan` varchar(50) NOT NULL,
  `id_iphone` varchar(50) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_penjualan`
--

INSERT INTO `data_penjualan` (`id_penjualan`, `id_iphone`, `tanggal_transaksi`, `jumlah_terjual`, `created_at`, `id_user`) VALUES
('PJ001', 'IP15', '2024-01-15', 42, '2026-07-06 04:41:49', 1),
('PJ002', 'IP15', '2024-02-15', 38, '2026-07-06 04:41:49', 1),
('PJ003', 'IP15', '2024-03-15', 55, '2026-07-06 04:41:49', 1),
('PJ004', 'IP15', '2024-04-15', 70, '2026-07-06 04:41:49', 1),
('PJ005', 'IP15', '2024-05-15', 45, '2026-07-06 04:41:49', 1),
('PJ006', 'IP15', '2024-06-15', 40, '2026-07-06 04:41:49', 1),
('PJ007', 'IP15', '2024-07-15', 48, '2026-07-06 04:41:49', 1),
('PJ008', 'IP15', '2024-08-15', 52, '2026-07-06 04:41:49', 1),
('PJ009', 'IP15', '2024-09-15', 58, '2026-07-06 04:41:49', 1),
('PJ010', 'IP15', '2024-10-15', 62, '2026-07-06 04:41:49', 1),
('PJ011', 'IP15', '2024-11-15', 75, '2026-07-06 04:41:49', 1),
('PJ012', 'IP15', '2024-12-15', 80, '2026-07-06 04:41:49', 1),
('PJ013', 'IP16', '2024-01-15', 50, '2026-07-06 04:41:49', 1),
('PJ014', 'IP16', '2024-02-15', 48, '2026-07-06 04:41:49', 1),
('PJ015', 'IP16', '2024-03-15', 60, '2026-07-06 04:41:49', 1),
('PJ016', 'IP16', '2024-04-15', 85, '2026-07-06 04:41:49', 1),
('PJ017', 'IP16', '2024-05-15', 55, '2026-07-06 04:41:49', 1),
('PJ018', 'IP16', '2024-06-15', 50, '2026-07-06 04:41:49', 1),
('PJ019', 'IP16', '2024-07-15', 58, '2026-07-06 04:41:49', 1),
('PJ020', 'IP16', '2024-08-15', 65, '2026-07-06 04:41:49', 1),
('PJ021', 'IP16', '2024-09-15', 70, '2026-07-06 04:41:49', 1),
('PJ022', 'IP16', '2024-10-15', 75, '2026-07-06 04:41:49', 1),
('PJ023', 'IP16', '2024-11-15', 90, '2026-07-06 04:41:49', 1),
('PJ024', 'IP16', '2024-12-15', 95, '2026-07-06 04:41:49', 1),
('PJ025', 'IP14', '2024-01-15', 20, '2026-07-06 04:41:49', 1),
('PJ026', 'IP14', '2024-02-15', 18, '2026-07-06 04:41:49', 1),
('PJ027', 'IP14', '2024-03-15', 25, '2026-07-06 04:41:49', 1),
('PJ028', 'IP14', '2024-04-15', 30, '2026-07-06 04:41:49', 1),
('PJ029', 'IP14', '2024-05-15', 22, '2026-07-06 04:41:49', 1),
('PJ030', 'IP14', '2024-06-15', 15, '2026-07-06 04:41:49', 1),
('PJ031', 'IP14', '2024-07-15', 19, '2026-07-06 04:41:49', 1),
('PJ032', 'IP14', '2024-08-15', 21, '2026-07-06 04:41:49', 1),
('PJ033', 'IP14', '2024-09-15', 24, '2026-07-06 04:41:49', 1),
('PJ034', 'IP14', '2024-10-15', 26, '2026-07-06 04:41:49', 1),
('PJ035', 'IP14', '2024-11-15', 32, '2026-07-06 04:41:49', 1),
('PJ036', 'IP14', '2024-12-15', 35, '2026-07-06 04:41:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iphone`
--

CREATE TABLE `iphone` (
  `id_iphone` varchar(50) NOT NULL,
  `nama_tipe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iphone`
--

INSERT INTO `iphone` (`id_iphone`, `nama_tipe`) VALUES
('IP14', 'iPhone 14'),
('IP15', 'iPhone 15'),
('IP16', 'iPhone 16');

-- --------------------------------------------------------

--
-- Table structure for table `prediksi`
--

CREATE TABLE `prediksi` (
  `id_prediksi` int(11) NOT NULL,
  `id_iphone` varchar(50) NOT NULL,
  `periode_n` tinyint(4) NOT NULL,
  `nilai_sma` decimal(10,2) NOT NULL,
  `nilai_mape` decimal(5,2) NOT NULL,
  `bulan_prediksi` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prediksi`
--

INSERT INTO `prediksi` (`id_prediksi`, `id_iphone`, `periode_n`, `nilai_sma`, `nilai_mape`, `bulan_prediksi`, `created_at`, `id_user`) VALUES
(43, 'IP14', 3, 25.92, 25.54, '2025-01', '2026-07-06 15:54:29', 1),
(44, 'IP15', 3, 54.82, 21.93, '2025-01', '2026-07-06 15:54:29', 1),
(45, 'IP16', 3, 64.92, 20.62, '2025-01', '2026-07-06 15:54:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi`
--

CREATE TABLE `rekomendasi` (
  `id_rekomendasi` int(11) NOT NULL,
  `id_prediksi` int(11) NOT NULL,
  `peringkat` tinyint(4) NOT NULL,
  `saran_stok` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rekomendasi`
--

INSERT INTO `rekomendasi` (`id_rekomendasi`, `id_prediksi`, `peringkat`, `saran_stok`, `keterangan`) VALUES
(85, 45, 1, 107, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(86, 44, 2, 93, 'Tren penjualan naik sebesar 37.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(87, 43, 3, 44, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(15) NOT NULL DEFAULT 'karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `created_at`, `role`) VALUES
(1, 'admin', '$2y$12$0mb3dCq8rqPdRWlUsUBkOuxx8LXL16sIEHPwGxqnIfFQKVEnaowk2', '2026-07-06 04:41:49', 'admin'),
(3, 'karyawan', '$2y$10$v9XnBgIZnN2TjHTDv6UhaOH4HvGvadS21zD4rBfr1w9xsFp7pRrjy', '2026-07-06 11:32:38', 'karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_iphone` (`id_iphone`),
  ADD KEY `fk_penjualan_user` (`id_user`);

--
-- Indexes for table `iphone`
--
ALTER TABLE `iphone`
  ADD PRIMARY KEY (`id_iphone`);

--
-- Indexes for table `prediksi`
--
ALTER TABLE `prediksi`
  ADD PRIMARY KEY (`id_prediksi`),
  ADD KEY `id_iphone` (`id_iphone`),
  ADD KEY `fk_prediksi_user` (`id_user`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id_rekomendasi`),
  ADD KEY `id_prediksi` (`id_prediksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prediksi`
--
ALTER TABLE `prediksi`
  MODIFY `id_prediksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  MODIFY `id_rekomendasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD CONSTRAINT `data_penjualan_ibfk_1` FOREIGN KEY (`id_iphone`) REFERENCES `iphone` (`id_iphone`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_penjualan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prediksi`
--
ALTER TABLE `prediksi`
  ADD CONSTRAINT `fk_prediksi_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prediksi_ibfk_1` FOREIGN KEY (`id_iphone`) REFERENCES `iphone` (`id_iphone`) ON DELETE CASCADE;

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_ibfk_1` FOREIGN KEY (`id_prediksi`) REFERENCES `prediksi` (`id_prediksi`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
