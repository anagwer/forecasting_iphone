-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 11:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_penjualan`
--

INSERT INTO `data_penjualan` (`id_penjualan`, `id_iphone`, `tanggal_transaksi`, `jumlah_terjual`, `created_at`) VALUES
('PJ001', 'IP14PM', '2024-01-15', 42, '2026-07-06 04:41:49'),
('PJ002', 'IP14PM', '2024-02-15', 38, '2026-07-06 04:41:49'),
('PJ003', 'IP14PM', '2024-03-15', 55, '2026-07-06 04:41:49'),
('PJ004', 'IP14PM', '2024-04-15', 70, '2026-07-06 04:41:49'),
('PJ005', 'IP14PM', '2024-05-15', 45, '2026-07-06 04:41:49'),
('PJ006', 'IP14PM', '2024-06-15', 40, '2026-07-06 04:41:49'),
('PJ007', 'IP14PM', '2024-07-15', 48, '2026-07-06 04:41:49'),
('PJ008', 'IP14PM', '2024-08-15', 52, '2026-07-06 04:41:49'),
('PJ009', 'IP14PM', '2024-09-15', 58, '2026-07-06 04:41:49'),
('PJ010', 'IP14PM', '2024-10-15', 62, '2026-07-06 04:41:49'),
('PJ011', 'IP14PM', '2024-11-15', 75, '2026-07-06 04:41:49'),
('PJ012', 'IP14PM', '2024-12-15', 80, '2026-07-06 04:41:49'),
('PJ013', 'IP15P', '2024-01-15', 50, '2026-07-06 04:41:49'),
('PJ014', 'IP15P', '2024-02-15', 48, '2026-07-06 04:41:49'),
('PJ015', 'IP15P', '2024-03-15', 60, '2026-07-06 04:41:49'),
('PJ016', 'IP15P', '2024-04-15', 85, '2026-07-06 04:41:49'),
('PJ017', 'IP15P', '2024-05-15', 55, '2026-07-06 04:41:49'),
('PJ018', 'IP15P', '2024-06-15', 50, '2026-07-06 04:41:49'),
('PJ019', 'IP15P', '2024-07-15', 58, '2026-07-06 04:41:49'),
('PJ020', 'IP15P', '2024-08-15', 65, '2026-07-06 04:41:49'),
('PJ021', 'IP15P', '2024-09-15', 70, '2026-07-06 04:41:49'),
('PJ022', 'IP15P', '2024-10-15', 75, '2026-07-06 04:41:49'),
('PJ023', 'IP15P', '2024-11-15', 90, '2026-07-06 04:41:49'),
('PJ024', 'IP15P', '2024-12-15', 95, '2026-07-06 04:41:49'),
('PJ025', 'IP13', '2024-01-15', 20, '2026-07-06 04:41:49'),
('PJ026', 'IP13', '2024-02-15', 18, '2026-07-06 04:41:49'),
('PJ027', 'IP13', '2024-03-15', 25, '2026-07-06 04:41:49'),
('PJ028', 'IP13', '2024-04-15', 30, '2026-07-06 04:41:49'),
('PJ029', 'IP13', '2024-05-15', 22, '2026-07-06 04:41:49'),
('PJ030', 'IP13', '2024-06-15', 15, '2026-07-06 04:41:49'),
('PJ031', 'IP13', '2024-07-15', 19, '2026-07-06 04:41:49'),
('PJ032', 'IP13', '2024-08-15', 21, '2026-07-06 04:41:49'),
('PJ033', 'IP13', '2024-09-15', 24, '2026-07-06 04:41:49'),
('PJ034', 'IP13', '2024-10-15', 26, '2026-07-06 04:41:49'),
('PJ035', 'IP13', '2024-11-15', 32, '2026-07-06 04:41:49'),
('PJ036', 'IP13', '2024-12-15', 35, '2026-07-06 04:41:49');

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
('IP13', 'iPhone 14'),
('IP14PM', 'iPhone 15'),
('IP15P', 'iPhone 16');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prediksi`
--

INSERT INTO `prediksi` (`id_prediksi`, `id_iphone`, `periode_n`, `nilai_sma`, `nilai_mape`, `bulan_prediksi`, `created_at`) VALUES
(1, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 07:13:25'),
(2, 'IP14PM', 3, 54.82, 21.93, '2025-01', '2026-07-06 07:13:25'),
(3, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 07:13:25'),
(4, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:31:09'),
(5, 'IP14PM', 3, 53.81, 154.41, '2026-08', '2026-07-06 08:31:09'),
(6, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:31:09'),
(7, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:33:21'),
(8, 'IP14PM', 3, 53.81, 154.41, '2026-08', '2026-07-06 08:33:21'),
(9, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:33:21'),
(10, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:33:34'),
(11, 'IP14PM', 3, 53.81, 154.41, '2026-08', '2026-07-06 08:33:34'),
(12, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:33:34'),
(13, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:48:35'),
(14, 'IP14PM', 3, 54.32, 113.07, '2026-08', '2026-07-06 08:48:35'),
(15, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:48:35'),
(16, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:53:09'),
(17, 'IP14PM', 3, 54.32, 113.07, '2026-08', '2026-07-06 08:53:09'),
(18, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:53:09'),
(19, 'IP13', 3, 25.92, 25.54, '2025-01', '2026-07-06 08:53:25'),
(20, 'IP14PM', 3, 54.32, 113.07, '2026-08', '2026-07-06 08:53:25'),
(21, 'IP15P', 3, 64.92, 20.62, '2025-01', '2026-07-06 08:53:25');

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
(49, 3, 1, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(50, 6, 2, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(51, 9, 3, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(52, 12, 4, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(53, 15, 5, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(54, 18, 6, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(55, 21, 7, 111, 'Tren penjualan naik sebesar 34.7%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(56, 1, 8, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(57, 4, 9, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(58, 7, 10, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(59, 10, 11, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(60, 13, 12, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(61, 16, 13, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(62, 19, 14, 47, 'Tren penjualan naik sebesar 45.3%. Kondisi pasar cukup stabil. Direkomendasikan menyuplai 80% stok buffer.'),
(63, 2, 15, 106, 'Tren penjualan turun sebesar 5.8%. Akurasi peramalan rendah atau tren turun signifikan. Batasi stok untuk menghindari overstock.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2a$12$imBxdSstcGEUC5e6Ji6SnOEDYmLqJrtqeoGz7Wg1QCg/JRjiqBq/2', '2026-07-06 04:41:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_iphone` (`id_iphone`);

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
  ADD KEY `id_iphone` (`id_iphone`);

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
  MODIFY `id_prediksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  MODIFY `id_rekomendasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD CONSTRAINT `data_penjualan_ibfk_1` FOREIGN KEY (`id_iphone`) REFERENCES `iphone` (`id_iphone`) ON DELETE CASCADE;

--
-- Constraints for table `prediksi`
--
ALTER TABLE `prediksi`
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
