-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2023 at 02:31 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mja`
--

-- --------------------------------------------------------

--
-- Table structure for table `akuns`
--

CREATE TABLE `akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_akun` int(10) NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kas & Bank',
  `saldo_awal` double NOT NULL DEFAULT 0,
  `saldo_normal` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `saldo` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akuns`
--

INSERT INTO `akuns` (`id`, `kode_akun`, `nama`, `kategori`, `saldo_awal`, `saldo_normal`, `saldo`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1101, 'Kas', 'Kas & Bank', 0, 'D', 73993750, 'Active', '2023-02-14 13:49:31', '2023-02-22 16:41:34'),
(2, 1102, 'Kas di BCA', 'Kas & Bank', 0, 'D', 1315000000, 'Active', '2023-02-14 13:49:48', '2023-02-22 16:22:48'),
(3, 1103, 'Kas di Tempat Bos', 'Kas & Bank', 0, 'D', -18120750, 'Active', '2023-02-14 13:50:32', '2023-02-16 14:31:37'),
(5, 1201, 'Piutang Usaha', 'Piutang Usaha', 0, 'D', 9990000, 'Active', '2023-02-14 14:03:42', '2023-02-20 10:38:07'),
(6, 1301, 'Perlengkapan Kantor', 'Perlengkapan', 0, 'D', 0, 'Active', '2023-02-14 14:05:15', '2023-02-14 14:07:22'),
(7, 1401, 'Sewa Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:05:31', '2023-02-14 14:05:31'),
(8, 1501, 'Tanah dan Bangunan', 'Aset Tetap', 0, 'D', 0, 'Active', '2023-02-14 14:06:46', '2023-02-14 14:06:46'),
(9, 1402, 'Asuransi Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:06:58', '2023-02-14 14:06:58'),
(10, 1403, 'Pengeluaran Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:07:14', '2023-02-14 14:07:14'),
(11, 1502, 'Kendaraan', 'Aset Tetap', 0, 'D', 0, 'Active', '2023-02-14 14:07:49', '2023-02-14 14:07:49'),
(12, 1601, 'Aset Lancar', 'Aset Lancar', 0, 'D', 0, 'Active', '2023-02-14 14:08:01', '2023-02-14 14:08:01'),
(13, 1701, 'Aset Lainnya', 'Aset Lainnya', 0, 'D', 0, 'Active', '2023-02-14 14:08:12', '2023-02-14 14:08:12'),
(14, 1801, 'Akumulasi Penyusutan Tanah dan Bangunan', 'Akumulasi Penyusutan', 0, 'K', 0, 'Active', '2023-02-14 14:08:38', '2023-02-14 14:08:38'),
(15, 1802, 'Akumulasi Penyusutan Kendaraan', 'Akumulasi Penyusutan', 0, 'K', 0, 'Active', '2023-02-14 14:08:51', '2023-02-14 14:08:51'),
(16, 2101, 'Utang Usaha / Dagang', 'Utang Usaha', 0, 'K', 3787500, 'Active', '2023-02-14 14:09:31', '2023-02-17 01:28:32'),
(17, 2201, 'Utang Gaji Karyawan', 'Liabilitas Jangka Pendek', 0, 'K', 0, 'Active', '2023-02-14 14:11:05', '2023-02-14 14:11:05'),
(18, 2301, 'Utang Bank', 'Liabilitas Jangka Panjang', 0, 'K', 1000000000, 'Active', '2023-02-14 14:11:21', '2023-02-16 09:50:23'),
(19, 3101, 'Modal Pemilik', 'Modal', 0, 'K', 0, 'Active', '2023-02-14 14:11:38', '2023-02-14 14:11:38'),
(20, 3102, 'Prive', 'Modal', 0, 'D', 0, 'Active', '2023-02-14 14:12:48', '2023-02-14 14:12:48'),
(21, 3201, 'Laba / Rugi Ditahan', 'Laba / Rugi Ditahan', 0, 'K', 0, 'Active', '2023-02-14 14:12:58', '2023-02-14 14:12:58'),
(22, 4101, 'Penjualan', 'Pendapatan', 0, 'K', 15500000, 'Active', '2023-02-14 14:13:29', '2023-02-20 10:38:07'),
(23, 4102, 'Retur Penjualan', 'Pendapatan', 0, 'D', 0, 'Active', '2023-02-14 14:13:44', '2023-02-14 14:13:44'),
(24, 4103, 'Potongan Penjualan', 'Pendapatan', 0, 'D', 0, 'Active', '2023-02-14 14:13:58', '2023-02-18 12:17:57'),
(25, 5101, 'Pembelian', 'Pembelian', 0, 'D', 20187500, 'Active', '2023-02-14 14:14:10', '2023-02-17 15:00:30'),
(26, 5102, 'Potongan Pembelian', 'Pembelian', 0, 'K', 100000, 'Active', '2023-02-14 14:14:30', '2023-02-16 12:50:42'),
(27, 6101, 'Beban Utilitas', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:15:33', '2023-02-19 13:24:46'),
(28, 6201, 'Beban Lainnya', 'Beban Lainnya', 0, 'D', 0, 'Active', '2023-02-14 14:15:44', '2023-02-14 14:15:44'),
(29, 7101, 'Pendapatan Lainnya', 'Pendapatan Lainnya', 0, 'K', 0, 'Active', '2023-02-14 14:15:57', '2023-02-20 12:33:00'),
(30, 6102, 'Beban Gaji Karyawan', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:17:35', '2023-02-19 13:24:13'),
(31, 6103, 'Beban Administrasi Bank', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:18:07', '2023-02-14 14:18:07'),
(32, 6104, 'Upah Buruh', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:19:27', '2023-02-14 14:19:27'),
(33, 6105, 'Upah Lembur Buruh', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:19:51', '2023-02-14 14:20:25'),
(34, 6106, 'Upah Lembur Buruh Besi', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:20:03', '2023-02-14 14:20:03'),
(35, 6107, 'Upah Lembur Buruh Logam', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:20:18', '2023-02-14 14:20:18'),
(36, 7102, 'Pendapatan Sewa', 'Pendapatan Lainnya', 0, 'K', 0, 'Active', '2023-02-16 00:12:06', '2023-02-20 12:30:23'),
(37, 7103, 'Pendapatan Bunga', 'Pendapatan Lainnya', 0, 'K', 500000000, 'Active', '2023-02-16 00:12:18', '2023-02-20 12:33:55'),
(38, 2102, 'Utang Kepada Konsumen', 'Utang Usaha', 0, 'K', 0, 'Active', '2023-02-16 00:36:47', '2023-02-21 16:57:57'),
(39, 2401, 'PPN Masukan (Pembelian)', 'Liabilitas Jangka Pendek', 0, 'D', 1837000, 'Active', '2023-02-16 03:42:11', '2023-02-17 01:28:32'),
(40, 2501, 'PPN Keluaran (Penjualan)', 'Liabilitas Jangka Pendek', 0, 'K', 1650000, 'Active', '2023-02-16 03:42:49', '2023-02-20 10:38:07'),
(41, 5103, 'Biaya Tambahan Pembelian', 'Pembelian', 0, 'D', 500000, 'Active', '2023-02-16 04:41:01', '2023-02-17 01:28:32'),
(42, 4104, 'Biaya Tambahan Penjualan', 'Pendapatan', 0, 'K', 0, 'Active', '2023-02-18 11:20:08', '2023-02-18 12:17:57'),
(43, 4201, 'Pendapatan Dropshipper Kontainer', 'Pendapatan', 0, 'K', 128000000, 'Active', '2023-02-21 11:30:23', '2023-02-22 16:41:34'),
(44, 2103, 'Utang Penampung', 'Utang Usaha', 0, 'K', -55000000, 'Active', '2023-02-21 11:32:30', '2023-02-22 16:22:48'),
(45, 4202, 'Beban Tambahan Dropshipper Kontainer', 'Pendapatan', 0, 'D', 650000, 'Active', '2023-02-22 15:47:30', '2023-02-22 16:41:34'),
(46, 5201, 'Pembelian Dropshipper Kontainer', 'Pembelian', 0, 'D', 120000000, 'Active', '2023-02-22 15:47:57', '2023-02-22 16:22:48'),
(47, 5202, 'Biaya Tambahan Pembelian Dropshipper Kontainer', 'Pembelian', 0, 'D', 10000000, 'Active', '2023-02-22 15:48:28', '2023-02-22 16:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `barang_belis`
--

CREATE TABLE `barang_belis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double NOT NULL DEFAULT 0,
  `stok` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_belis`
--

INSERT INTO `barang_belis` (`id`, `id_kategori`, `kode`, `nama`, `harga`, `stok`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'BS01', 'KEROMPONG', 700, -480, '-', 'Active', '2023-02-05 17:30:46', '2023-02-20 10:38:02'),
(2, 1, 'BS02', 'SENG', 1700, -1120, '-', 'Active', '2023-02-05 17:31:59', '2023-02-20 10:38:02'),
(3, 1, 'BS03', 'KARATAN', 500, 0, '-', 'Active', '2023-02-05 17:32:14', '2023-02-05 17:32:14'),
(4, 1, 'BS04', 'BESI PADAT', 700, 0, '-', 'Active', '2023-02-05 17:32:37', '2023-02-20 10:45:21'),
(5, 1, 'BS05', 'BESI CAMPUR', 3500, 0, '-', 'Active', '2023-02-05 17:32:51', '2023-02-20 10:45:21'),
(6, 1, 'BS06', 'KWH', 5000, 0, '-', 'Active', '2023-02-05 17:33:13', '2023-02-05 17:33:13'),
(7, 1, 'BS07', 'DINAMO', 6000, 0, '-', 'Active', '2023-02-05 17:33:28', '2023-02-16 12:38:08'),
(8, 1, 'BS08', 'BESI BAHAN', 6000, 0, '-', 'Active', '2023-02-05 17:34:06', '2023-02-05 17:34:06'),
(9, 1, 'BS09', 'BESI CACING', 4200, 0, '-', 'Active', '2023-02-05 17:34:20', '2023-02-05 17:34:20'),
(10, 1, 'BS10', 'FILTER OLI', 4000, 0, '-', 'Active', '2023-02-05 17:34:37', '2023-02-05 17:34:37'),
(11, 1, 'BS11', 'KALENG', 2800, 0, '-', 'Active', '2023-02-05 17:34:51', '2023-02-05 17:34:51'),
(12, 1, 'BS12', 'BESI SUPER', 4300, 0, '-', 'Active', '2023-02-05 17:35:04', '2023-02-05 17:35:04'),
(13, 1, 'BS13', 'BESI PRES', 3400, 0, '-', 'Active', '2023-02-05 17:35:17', '2023-02-05 17:35:17'),
(14, 1, 'BS14', 'SENG METAL', 3200, 0, '-', 'Active', '2023-02-05 17:35:35', '2023-02-05 17:35:35'),
(15, 1, 'BS15', 'SPRING BED', 1500, 0, '-', 'Active', '2023-02-05 17:35:53', '2023-02-05 17:35:53'),
(16, 3, 'KT01', 'KARDUS', 100, 0, '-', 'Active', '2023-02-05 17:36:40', '2023-02-05 17:36:40'),
(17, 3, 'KT02', 'KERTAS / SWL', 200, 0, '-', 'Active', '2023-02-05 17:37:00', '2023-02-05 17:37:00'),
(18, 3, 'KT03', 'BURAM', 300, 0, '-', 'Active', '2023-02-05 17:37:13', '2023-02-05 17:37:13'),
(19, 3, 'KT04', 'KORAN A', 400, 0, '-', 'Active', '2023-02-05 17:37:24', '2023-02-05 17:37:24'),
(20, 3, 'KT05', 'DUPLEX (DP)', 500, 0, '-', 'Active', '2023-02-05 17:37:41', '2023-02-05 17:37:41'),
(21, 3, 'KT06', 'BUKU CAMPUR', 1200, 0, '-', 'Active', '2023-02-05 17:37:58', '2023-02-05 17:37:58'),
(22, 3, 'KT07', 'KARDUS BASAH', 2300, 0, '-', 'Active', '2023-02-05 17:38:14', '2023-02-05 17:38:14'),
(23, 3, 'KT08', 'SWL KARUNGAN', 1700, 0, '-', 'Active', '2023-02-05 17:38:30', '2023-02-05 17:38:30'),
(24, 5, 'LG01', 'ALUMINIUM KALENG', 7000, 1260, '-', 'Active', '2023-02-05 17:39:25', '2023-02-17 15:00:24'),
(25, 5, 'LG02', 'ALUMINIUM PANCI', 7500, 645, '-', 'Active', '2023-02-05 17:39:41', '2023-02-17 00:58:45'),
(26, 5, 'LG03', 'ALUMINIUM TEBAL', 15000, 400, '-', 'Active', '2023-02-05 17:40:02', '2023-02-16 12:42:00'),
(27, 5, 'LG04', 'BABET', 10000, 50, '-', 'Active', '2023-02-05 17:40:18', '2023-02-16 12:50:27'),
(28, 5, 'LG05', 'TEMBAGA TA', 7500, 0, '-', 'Active', '2023-02-05 17:40:40', '2023-02-05 17:40:40'),
(29, 5, 'LG06', 'TEMBAGA TB', 7000, 0, '-', 'Active', '2023-02-05 17:40:55', '2023-02-18 10:47:57'),
(30, 5, 'LG07', 'TEMBAGA TM', 700, 0, '-', 'Active', '2023-02-05 17:41:09', '2023-02-05 17:41:09'),
(31, 5, 'LG08', 'ALUMINIUM KUALI', 500, 0, '-', 'Active', '2023-02-05 17:41:21', '2023-02-05 17:41:21'),
(32, 5, 'LG09', 'AKI', 7500, 0, '-', 'Active', '2023-02-05 17:41:33', '2023-02-05 17:41:33'),
(33, 5, 'LG10', 'RADIATOR KN', 7500, 0, '-', 'Active', '2023-02-05 17:41:58', '2023-02-05 17:41:58'),
(34, 5, 'LG11', 'KUSEN', 15000, 0, '-', 'Active', '2023-02-05 17:42:23', '2023-02-05 17:42:23'),
(35, 5, 'LG12', 'LELEHAN ALUMINIUM', 1, 0, '-', 'Active', '2023-02-05 17:42:35', '2023-02-05 17:42:35'),
(36, 5, 'LG13', 'KUNINGAN', 1, 0, '-', 'Active', '2023-02-05 17:42:47', '2023-02-05 17:42:47'),
(37, 5, 'LG14', 'STAINLESS', 10000, 0, '-', 'Active', '2023-02-05 17:43:16', '2023-02-05 17:43:16'),
(38, 5, 'LG15', 'ALUMINIUM KAMPAS', 11500, 0, 'ALUMINIUM KAMPAS', 'Active', '2023-02-05 17:43:37', '2023-02-05 17:43:37'),
(39, 5, 'LG16', 'ALUMINIUM KAWAT', 18000, 0, '-', 'Active', '2023-02-05 17:44:00', '2023-02-05 17:44:00'),
(40, 5, 'LG17', 'TIMAH', 19000, 0, '-', 'Active', '2023-02-05 17:44:17', '2023-02-05 17:44:17'),
(41, 5, 'LG18', 'AL. PLAT KORAN', 17250, 0, '-', 'Active', '2023-02-05 17:44:38', '2023-02-05 17:44:38'),
(42, 5, 'LG19', 'ALUMINIUM CAMPUR', 3000, 0, '-', 'Active', '2023-02-05 17:44:57', '2023-02-05 17:44:57'),
(43, 5, 'LG20', 'AL TEBAL KOTOR', 0, 0, '-', 'Active', '2023-02-05 17:45:09', '2023-02-05 17:45:09'),
(44, 5, 'LG21', 'TM 2', 0, 0, '-', 'Active', '2023-02-05 17:45:23', '2023-02-05 17:45:23'),
(45, 5, 'LG22', 'SENG ALUMINIUM', 15000, 0, '-', 'Active', '2023-02-05 17:45:39', '2023-02-05 17:45:39'),
(46, 5, 'LG23', 'TB PIPA', 69000, 0, '-', 'Active', '2023-02-05 17:45:58', '2023-02-05 17:45:58'),
(47, 5, 'LG24', 'AL SIKU B', 16000, 0, '-', 'Active', '2023-02-05 17:46:16', '2023-02-05 17:46:16'),
(48, 5, 'LG25', 'BC', 0, 0, '-', 'Active', '2023-02-05 17:46:26', '2023-02-05 17:46:26'),
(49, 5, 'LG26', 'ELEMEN', 5000, 0, '-', 'Active', '2023-02-05 17:46:39', '2023-02-05 17:46:39'),
(50, 5, 'LG27', 'FORFUM', 15000, 0, '-', 'Active', '2023-02-05 17:46:51', '2023-02-05 17:46:51'),
(51, 5, 'LG29', 'GRAM', 0, 0, '-', 'Active', '2023-02-05 17:47:30', '2023-02-05 17:47:30'),
(52, 5, 'LG30', 'PLAT PANCI', 0, 0, '-', 'Active', '2023-02-05 17:47:40', '2023-02-05 17:47:40'),
(53, 5, 'LG31', 'PISTON', 0, 0, '-', 'Active', '2023-02-05 17:47:51', '2023-02-05 17:47:51'),
(54, 5, 'LG32', 'VELG', 0, 0, '-', 'Active', '2023-02-05 17:48:00', '2023-02-05 17:48:00'),
(55, 5, 'LG33', 'AL SIKU A', 0, 0, '-', 'Active', '2023-02-05 17:48:12', '2023-02-05 17:48:12'),
(56, 5, 'LG34', 'KAMPAS KOPLING', 7000, 0, '-', 'Active', '2023-02-05 17:48:25', '2023-02-05 17:48:25'),
(57, 5, 'LG35', 'KEPALA RADIATOR', 0, 0, '-', 'Active', '2023-02-05 17:48:39', '2023-02-05 17:48:39'),
(58, 5, 'LG36', 'DINAMO', 5500, 0, '-', 'Active', '2023-02-05 17:48:55', '2023-02-05 17:48:55'),
(59, 5, 'LG37', 'BERING', 0, 0, '-', 'Active', '2023-02-05 17:49:10', '2023-02-05 17:49:10'),
(60, 5, 'LG38', 'ALUMINIUM RADIATOR', 17000, 0, '-', 'Active', '2023-02-05 17:49:31', '2023-02-05 17:49:31'),
(61, 6, 'LN01', 'KARUNG BESAR', 1500, 0, '-', 'Active', '2023-02-05 17:49:56', '2023-02-05 17:49:56'),
(62, 6, 'LN02', 'KARUNG KECIL', 1000, 0, '-', 'Active', '2023-02-05 17:50:10', '2023-02-05 17:50:10'),
(63, 6, 'LN04', 'BOTOL KECAP', 600, 0, '-', 'Active', '2023-02-05 17:50:32', '2023-02-05 17:50:32'),
(64, 6, 'LN05', 'BOTOL BIR', 600, 0, '-', 'Active', '2023-02-05 17:50:46', '2023-02-05 17:50:46'),
(65, 6, 'LN06', 'BOTOL OLI', 2000, 0, '-', 'Active', '2023-02-05 17:51:02', '2023-02-05 17:51:02'),
(66, 6, 'LN07', 'AC', 5750, 0, '-', 'Active', '2023-02-05 17:51:18', '2023-02-05 17:51:18'),
(67, 6, 'LN08', 'PLASTIK', 1300, 0, '-', 'Active', '2023-02-05 17:51:32', '2023-02-05 17:51:32'),
(68, 6, 'LN09', 'UPS', 4100, 0, '-', 'Active', '2023-02-05 17:51:52', '2023-02-05 17:51:52'),
(69, 6, 'LN10', 'MAINBOARD', 45000, 0, '-', 'Active', '2023-02-05 17:52:11', '2023-02-05 17:52:11'),
(70, 6, 'LN11', 'SEPATU BOOT', 3000, 0, 'SEPATU BOOT', 'Active', '2023-02-05 17:52:31', '2023-02-05 17:52:31'),
(71, 6, 'LN12', 'KABEL TLP', 3200, 0, '-', 'Active', '2023-02-05 17:52:46', '2023-02-05 17:52:46'),
(72, 6, 'LN14', 'AC', 0, 0, '-', 'Active', '2023-02-05 17:53:02', '2023-02-05 17:53:02'),
(73, 6, 'LN15', 'KARUNG BONCOS', 1500, 0, '-', 'Active', '2023-02-05 17:53:16', '2023-02-05 17:53:16'),
(74, 6, 'LN16', 'KAIN MAJUN', 8500, 0, '-', 'Active', '2023-02-05 17:53:34', '2023-02-05 17:53:34'),
(75, 6, 'LN17', 'PET PUTIH', 5000, 0, '-', 'Active', '2023-02-05 17:53:48', '2023-02-05 17:53:48'),
(76, 6, 'LN18', 'PET WARNA', 1500, 0, '-', 'Active', '2023-02-05 17:54:02', '2023-02-05 17:54:02'),
(77, 6, 'LN19', 'PET B', 4000, 0, '-', 'Active', '2023-02-05 17:54:14', '2023-02-05 17:54:14'),
(78, 7, 'UM01', 'UMUM', 0, 0, '-', 'Active', '2023-02-05 17:54:24', '2023-02-05 17:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `barang_juals`
--

CREATE TABLE `barang_juals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_juals`
--

INSERT INTO `barang_juals` (`id`, `id_kategori`, `kode`, `nama`, `harga`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'JBS01', 'BESI BAHAN', 0, 'BESI BAHAN', 'Active', '2023-02-08 12:50:31', '2023-02-08 12:50:31'),
(2, 1, 'JBS02', 'SENG', 333, 'SENG BEKAS', 'Active', '2023-02-08 12:53:39', '2023-02-08 12:53:39'),
(3, 1, 'JBS03', 'BESI CAMPUR', 0, '-', 'Active', '2023-02-08 12:53:56', '2023-02-08 12:53:56'),
(4, 1, 'JBS04', 'BESI 16 POLOS', 110000, '-', 'Active', '2023-02-08 12:54:13', '2023-02-08 12:54:13'),
(5, 1, 'JBS05', 'KEROMPONG', 0, '-', 'Active', '2023-02-08 12:54:30', '2023-02-08 12:54:30'),
(6, 1, 'JBS06', 'BESI PADAT', 0, '-', 'Active', '2023-02-08 12:54:40', '2023-02-08 12:54:40'),
(7, 1, 'JBS07', 'RADIATOR', 0, '-', 'Active', '2023-02-08 12:54:50', '2023-02-08 12:54:50'),
(8, 1, 'JBS08', 'KWH', 8000, '-', 'Active', '2023-02-08 12:55:08', '2023-02-08 12:55:08'),
(9, 1, 'JBS09', 'CALVANIS', 0, '-', 'Active', '2023-02-08 12:55:24', '2023-02-08 12:55:24'),
(10, 1, 'JBS10', 'BESI PLAT', 0, '-', 'Active', '2023-02-08 12:55:39', '2023-02-08 12:55:39'),
(11, 2, 'JJASA01', 'JASA TIMBANG', 35000, 'JASA PENIMBANGAN', 'Active', '2023-02-08 12:56:03', '2023-02-08 12:56:03'),
(12, 3, 'JKT01', 'KARDUS', 0, 'KARDUS', 'Active', '2023-02-08 12:56:26', '2023-02-08 12:56:26'),
(13, 3, 'JKT02', 'KARDUS ROKOK', 5000, 'HARGA PER BIJI', 'Active', '2023-02-08 12:56:44', '2023-02-08 12:56:44'),
(14, 3, 'JKT03', 'KARDUS INDOMIE', 750, 'HARGA PER BIJI', 'Active', '2023-02-08 12:57:01', '2023-02-08 12:57:01'),
(15, 3, 'JKT04', 'SWL', 0, '-', 'Active', '2023-02-08 12:57:10', '2023-02-08 12:57:10'),
(16, 3, 'JKT05', 'KORAN', 3650, '-', 'Active', '2023-02-08 12:57:26', '2023-02-08 12:57:26'),
(17, 3, 'JKT06', 'DUPLEK', 0, '-', 'Active', '2023-02-08 12:57:38', '2023-02-08 12:57:38'),
(18, 5, 'JLG01', 'AKI', 0, '-', 'Active', '2023-02-08 12:58:02', '2023-02-08 12:58:02'),
(19, 5, 'JLG02', 'AL. KALENG', 0, '-', 'Active', '2023-02-08 12:58:11', '2023-02-08 12:58:11'),
(20, 5, 'JLG03', 'AL. KAMPAS', 0, '-', 'Active', '2023-02-08 12:58:26', '2023-02-08 12:58:26'),
(21, 5, 'JLG04', 'AL. KAWAT', 0, '-', 'Active', '2023-02-08 12:58:35', '2023-02-08 12:58:35'),
(22, 5, 'JLG05', 'AL. KUALI', 0, '-', 'Active', '2023-02-08 12:58:48', '2023-02-08 12:58:48'),
(23, 5, 'JLG06', 'AL. PLAT KORAN', 0, '-', 'Active', '2023-02-08 12:59:04', '2023-02-08 12:59:04'),
(24, 5, 'JLG07', 'AL. SIKU', 0, '-', 'Active', '2023-02-08 12:59:21', '2023-02-08 12:59:21'),
(25, 5, 'JLG08', 'AL. TEBAL', 0, '-', 'Active', '2023-02-08 12:59:31', '2023-02-08 12:59:31'),
(26, 5, 'JLG09', 'BABET', 0, '-', 'Active', '2023-02-08 12:59:48', '2023-02-08 12:59:48'),
(27, 5, 'JLG10', 'ELEMENT', 0, '-', 'Active', '2023-02-08 13:00:17', '2023-02-08 13:00:17'),
(28, 5, 'JLG11', 'GRAM', 0, '-', 'Active', '2023-02-08 13:00:28', '2023-02-08 13:00:28'),
(29, 5, 'JLG12', 'KUNINGAN', 0, '-', 'Active', '2023-02-08 13:00:37', '2023-02-08 13:00:37'),
(30, 5, 'JLG13', 'RADIATOR KN', 0, '-', 'Active', '2023-02-08 13:00:49', '2023-02-08 13:00:49'),
(31, 5, 'JLG14', 'STAINLESS', 0, '-', 'Active', '2023-02-08 13:01:01', '2023-02-08 13:01:01'),
(32, 5, 'JLG15', 'TEMBAGA A', 0, '-', 'Active', '2023-02-08 13:01:11', '2023-02-08 13:01:11'),
(33, 5, 'JLG16', 'TEMBAGA B', 0, '-', 'Active', '2023-02-08 13:01:21', '2023-02-08 13:01:21'),
(34, 5, 'JLG17', 'TIMAH', 0, '-', 'Active', '2023-02-08 13:01:31', '2023-02-08 13:01:31'),
(35, 5, 'JLG18', 'AL. PLAT', 0, '-', 'Active', '2023-02-08 13:01:41', '2023-02-08 13:01:41'),
(36, 5, 'JLG19', 'AL. PANCI', 0, '-', 'Active', '2023-02-08 13:01:52', '2023-02-08 13:01:52'),
(37, 5, 'JLG20', 'BERING', 12500, '-', 'Active', '2023-02-08 13:02:10', '2023-02-08 13:02:10'),
(38, 6, 'JLN01', 'KARUNG', 2500, '-', 'Active', '2023-02-08 13:02:35', '2023-02-08 13:02:35'),
(39, 6, 'JLN02', 'SEPATU BOT', 3500, '-', 'Active', '2023-02-08 13:02:50', '2023-02-08 13:02:50'),
(40, 6, 'JLN03', 'PLASTIK', 3000, '-', 'Active', '2023-02-08 13:03:06', '2023-02-08 13:03:06'),
(41, 6, 'JLN04', 'TABUNG', 110000, '-', 'Active', '2023-02-08 13:03:21', '2023-02-08 13:03:21'),
(42, 6, 'JLN05', 'KAIN MAJUN', 8500, '-', 'Active', '2023-02-08 13:03:53', '2023-02-08 13:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `barang_jual_details`
--

CREATE TABLE `barang_jual_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang_juals` int(10) NOT NULL DEFAULT 0,
  `id_barang_belis` int(10) NOT NULL,
  `persentase` double DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_jual_details`
--

INSERT INTO `barang_jual_details` (`id`, `id_barang_juals`, `id_barang_belis`, `persentase`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 50, 'Active', '2023-02-08 14:01:56', '2023-02-08 14:01:56'),
(2, 1, 5, 50, 'Active', '2023-02-08 14:03:53', '2023-02-08 14:03:53'),
(4, 2, 2, 50, 'Active', '2023-02-08 14:08:11', '2023-02-08 14:08:11'),
(6, 2, 1, 50, 'Active', '2023-02-08 14:08:36', '2023-02-08 14:08:36'),
(10, 18, 1, 30, 'Active', '2023-02-18 10:09:22', '2023-02-18 10:09:22'),
(11, 18, 2, 70, 'Active', '2023-02-18 10:09:27', '2023-02-18 10:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_hutangs`
--

CREATE TABLE `bayar_hutangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pembelians` int(10) NOT NULL DEFAULT 0,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `kode_akun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bayar_hutangs`
--

INSERT INTO `bayar_hutangs` (`id`, `id_pembelians`, `id_users`, `nominal`, `kode_akun`, `created_at`, `updated_at`) VALUES
(2, 11, 0, 416250, '1101', '2023-02-16 14:46:47', '2023-02-16 14:46:47'),
(3, 10, 0, 10905750, '1103', '2023-02-16 14:46:47', '2023-02-16 14:46:47'),
(4, 11, 0, 7215000, '1103', '2023-02-16 14:46:47', '2023-02-16 14:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_piutangs`
--

CREATE TABLE `bayar_piutangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `kode_akun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bayar_piutangs`
--

INSERT INTO `bayar_piutangs` (`id`, `id_penjualans`, `id_users`, `nominal`, `kode_akun`, `created_at`, `updated_at`) VALUES
(1, 3, 0, 500000, '1101', '2023-02-18 12:42:32', '2023-02-18 12:42:32');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_freelancers`
--

CREATE TABLE `bidang_freelancers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bidang_freelancers`
--

INSERT INTO `bidang_freelancers` (`id`, `nama`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Desain Grafis', 'Active', '2022-03-20 12:06:36', '2022-03-20 12:06:36'),
(2, 'Content Creator', 'Active', '2022-03-20 12:06:52', '2022-03-20 12:06:52'),
(3, 'Videography', 'Active', '2022-04-08 06:03:29', '2022-04-08 06:03:29'),
(4, 'Photography', 'Active', '2022-04-08 06:03:37', '2022-04-08 06:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bidang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nama`, `alamat`, `no_hp`, `pic`, `no_hp_pic`, `bidang`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Ligo Mitra', 'jh', 'lkjl', 'kjlk', 'jl', 'jl', 'Active', '2022-06-08 05:23:04', '2022-06-08 05:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `dp_konsumens`
--

CREATE TABLE `dp_konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_konsumens` int(10) NOT NULL,
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `sisa` double NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dp_konsumens`
--

INSERT INTO `dp_konsumens` (`id`, `id_users`, `id_konsumens`, `kode_akun`, `kode`, `keterangan`, `nominal`, `sisa`, `tanggal`, `created_at`, `updated_at`) VALUES
(2, 0, 4, '1101', 'DP/2023/02/0001', 'Sudah acc', 30000000, 30000000, '2023-02-16', '2023-02-19 11:24:17', '2023-02-19 11:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `dp_penampungs`
--

CREATE TABLE `dp_penampungs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_penampungs` int(10) NOT NULL,
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dp_penampungs`
--

INSERT INTO `dp_penampungs` (`id`, `id_users`, `id_penampungs`, `kode_akun`, `kode`, `keterangan`, `nominal`, `tanggal`, `created_at`, `updated_at`) VALUES
(2, 0, 2, '1102', 'DP/2023/02/0001', 'sdsdsd', 70000000, '2023-02-24', '2023-02-21 17:04:25', '2023-02-21 17:06:48'),
(3, 0, 3, '1102', 'DP/2023/02/0002', 'DP buat beli barang', 100000000, '2023-02-21', '2023-02-22 15:12:39', '2023-02-22 15:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `dropshippers`
--

CREATE TABLE `dropshippers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `id_penampungs` int(10) NOT NULL DEFAULT 0,
  `kode_akun_pembelian` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode_akun_penjualan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_kontainer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_segel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_nota` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `dp` double NOT NULL DEFAULT 0,
  `qty` double NOT NULL DEFAULT 0,
  `harga_beli` double NOT NULL DEFAULT 0,
  `total_beli` double NOT NULL DEFAULT 0,
  `harga_jual` double NOT NULL DEFAULT 0,
  `total_jual` double NOT NULL DEFAULT 0,
  `potongan` double NOT NULL DEFAULT 0,
  `sisa_bayar` double NOT NULL DEFAULT 0,
  `laba` double NOT NULL DEFAULT 0,
  `bayar_pembelian` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `bayar_penjualan` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dropshippers`
--

INSERT INTO `dropshippers` (`id`, `id_users`, `id_penampungs`, `kode_akun_pembelian`, `kode_akun_penjualan`, `kode`, `no_kontainer`, `no_segel`, `no_nota`, `tanggal`, `keterangan`, `biaya_tambahan`, `dp`, `qty`, `harga_beli`, `total_beli`, `harga_jual`, `total_jual`, `potongan`, `sisa_bayar`, `laba`, `bayar_pembelian`, `bayar_penjualan`, `created_at`, `updated_at`) VALUES
(2, 0, 1, '1102', '1101', 'JD/2023/02/0002', NULL, NULL, NULL, '2023-02-23', 'asdf sdf', 0, 100000000, 0, 0, 0, 0, 0, 0, 0, 0, 'N', 'N', '2023-02-21 11:44:31', '2023-02-21 11:44:31'),
(4, 0, 2, '1101', '1101', 'JD/2023/02/0003', 'SDF 12312 123', '13412441 23', '123123 123', '2023-02-25', 'asdfadsfasdf 123', 3000123, 40000000, 25123, 5100, 128127300, 5300, 133151900, 1000123, 85127177, 4024477, 'N', 'N', '2023-02-22 02:20:57', '2023-02-22 11:42:20'),
(5, 0, 1, '1101', '1101', 'JD/2023/02/0004', 'SDFW 132312', '54235432', '44545096', '2023-02-23', 'ASD', 500000, 0, 5000, 10000, 50000000, 12000, 60000000, 1000000, 49500000, 9000000, 'N', 'N', '2023-02-22 02:25:01', '2023-02-22 02:25:01'),
(6, 0, 2, '1102', '1101', 'JD/2023/02/0005', 'JDFHU 10920', '01fsdo029', '0910j2', '2023-02-23', '-', 5000000, 30000000, 10000, 4000, 40000000, 4200, 42000000, 150000, 5000000, 1850000, 'Y', 'Y', '2023-02-22 12:18:12', '2023-02-22 16:41:34'),
(7, 0, 3, '1102', '1101', 'JD/2023/02/0006', 'KDFJI 102920', '09213430', '0924-1849230', '2023-02-24', '-', 5000000, 100000000, 40000, 2000, 80000000, 2150, 86000000, 500000, -25000000, 5500000, 'Y', 'Y', '2023-02-22 15:17:26', '2023-02-22 16:39:50');

-- --------------------------------------------------------

--
-- Table structure for table `freelancers`
--

CREATE TABLE `freelancers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_bidang_freelancers` int(10) NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `norek` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `tempatlahir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggallahir` date DEFAULT NULL,
  `tanggalmulai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harga_belis`
--

CREATE TABLE `harga_belis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga_belis`
--

INSERT INTO `harga_belis` (`id`, `kategori`, `kode`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(3, 'Umum', 'H01', 'UMUM / PENGAMPAS', 'Active', '2023-02-07 17:03:26', '2023-02-07 17:24:04'),
(4, 'Umum', 'H02', 'DALAM KOTA JEMPUT', 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(5, 'Umum', 'H03', 'HARGA LUAR KOTA', 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(6, 'Umum', 'H04', 'JEMPUT / GONOK / ADIT / ARMA', 'Active', '2023-02-07 17:22:31', '2023-02-07 17:23:57'),
(7, 'Umum', 'H05', 'ASAM / YANTO APEL / ASUAN', 'Active', '2023-02-07 17:22:48', '2023-02-07 17:23:46'),
(8, 'Umum', 'H06', 'ALFAMART / STEAD FAST / BESI HERMAN', 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:39'),
(9, 'Umum', 'H07', 'PAK NICO / HAJI JUHRI / MITRA ANDA', 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(10, 'Umum', 'H08', 'CASH 01', 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(11, 'Umum', 'H09', 'PENAMPUNG DALAM KOTA', 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(12, 'Umum', 'H10', 'INDOMARET / WBA / PT CMA', 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(13, 'Umum', 'H11', 'NARKO / XING MART / CAREFUR / PAK ANGO', 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(14, 'Umum', 'H13', 'HAJI SULI / SIM JAYA', 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(15, 'Umum', 'H14', 'TRANSMART / HYPERMART', 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(16, 'Umum', 'H15', 'INDOGROSIR', 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(17, 'Umum', 'H16', 'KOTEK', 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(18, 'Umum', 'H17', 'MJA SKW', 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(19, 'Logam', 'L01', '', 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(20, 'Logam', 'L03', 'ASAM', 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(21, 'Logam', 'L04', 'PENGAMPAS', 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(22, 'Logam', 'L05', 'HARGA LUAR KOTA', 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(23, 'Logam', 'L07', 'UMAR / MJA', 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(24, 'Logam', 'L08', 'CHAS T', 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(25, 'Logam', 'L09', 'BORONGAN', 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(26, 'Logam', 'L10', '', 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(27, 'Logam', 'L11', 'CABANG LUAR KOTA', 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(28, 'Logam', 'L12', '', 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `harga_beli_details`
--

CREATE TABLE `harga_beli_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_harga_belis` int(10) NOT NULL DEFAULT 0,
  `id_barang_belis` int(10) NOT NULL DEFAULT 0,
  `harga` double DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga_beli_details`
--

INSERT INTO `harga_beli_details` (`id`, `id_harga_belis`, `id_barang_belis`, `harga`, `aktif`, `created_at`, `updated_at`) VALUES
(78, 3, 1, 4700, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:18:11'),
(79, 3, 2, 2800, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:19:52'),
(80, 3, 3, 1500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:20:00'),
(81, 3, 4, 5900, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:20:07'),
(82, 3, 5, 5300, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:21:20'),
(83, 3, 6, 5000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(84, 3, 7, 6000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(85, 3, 8, 6000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(86, 3, 9, 4200, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(87, 3, 10, 4000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(88, 3, 11, 2800, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(89, 3, 12, 4300, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(90, 3, 13, 3400, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(91, 3, 14, 3200, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(92, 3, 15, 1500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(93, 3, 16, 100, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(94, 3, 17, 200, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(95, 3, 18, 300, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(96, 3, 19, 400, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(97, 3, 20, 500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(98, 3, 21, 1200, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(99, 3, 22, 2300, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(100, 3, 23, 1700, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(101, 3, 61, 1500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(102, 3, 62, 1000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(103, 3, 63, 600, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(104, 3, 64, 600, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(105, 3, 65, 2000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(106, 3, 66, 5750, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(107, 3, 67, 1300, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(108, 3, 68, 4100, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(109, 3, 69, 45000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(110, 3, 70, 3000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(111, 3, 71, 3200, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(112, 3, 72, 0, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(113, 3, 73, 1500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(114, 3, 74, 8500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(115, 3, 75, 5000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(116, 3, 76, 1500, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(117, 3, 77, 4000, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(118, 3, 78, 0, 'Active', '2023-02-07 17:03:26', '2023-02-07 17:03:26'),
(119, 4, 1, 700, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(120, 4, 2, 1700, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(121, 4, 3, 500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(122, 4, 4, 700, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(123, 4, 5, 3500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(124, 4, 6, 5000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(125, 4, 7, 6000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(126, 4, 8, 6000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(127, 4, 9, 4200, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(128, 4, 10, 4000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(129, 4, 11, 2800, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(130, 4, 12, 4300, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(131, 4, 13, 3400, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(132, 4, 14, 3200, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(133, 4, 15, 1500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(134, 4, 16, 100, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(135, 4, 17, 200, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(136, 4, 18, 300, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(137, 4, 19, 400, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(138, 4, 20, 500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(139, 4, 21, 1200, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(140, 4, 22, 2300, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(141, 4, 23, 1700, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(142, 4, 61, 1500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(143, 4, 62, 1000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(144, 4, 63, 600, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(145, 4, 64, 600, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(146, 4, 65, 2000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(147, 4, 66, 5750, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(148, 4, 67, 1300, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(149, 4, 68, 4100, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(150, 4, 69, 45000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(151, 4, 70, 3000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(152, 4, 71, 3200, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(153, 4, 72, 0, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(154, 4, 73, 1500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(155, 4, 74, 8500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(156, 4, 75, 5000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(157, 4, 76, 1500, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(158, 4, 77, 4000, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(159, 4, 78, 0, 'Active', '2023-02-07 17:21:55', '2023-02-07 17:21:55'),
(160, 5, 1, 700, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(161, 5, 2, 1700, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(162, 5, 3, 500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(163, 5, 4, 700, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(164, 5, 5, 3500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(165, 5, 6, 5000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(166, 5, 7, 6000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(167, 5, 8, 6000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(168, 5, 9, 4200, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(169, 5, 10, 4000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(170, 5, 11, 2800, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(171, 5, 12, 4300, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(172, 5, 13, 3400, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(173, 5, 14, 3200, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(174, 5, 15, 1500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(175, 5, 16, 100, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(176, 5, 17, 200, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(177, 5, 18, 300, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(178, 5, 19, 400, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(179, 5, 20, 500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(180, 5, 21, 1200, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(181, 5, 22, 2300, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(182, 5, 23, 1700, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(183, 5, 61, 1500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(184, 5, 62, 1000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(185, 5, 63, 600, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(186, 5, 64, 600, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(187, 5, 65, 2000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(188, 5, 66, 5750, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(189, 5, 67, 1300, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(190, 5, 68, 4100, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(191, 5, 69, 45000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(192, 5, 70, 3000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(193, 5, 71, 3200, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(194, 5, 72, 0, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(195, 5, 73, 1500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(196, 5, 74, 8500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(197, 5, 75, 5000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(198, 5, 76, 1500, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(199, 5, 77, 4000, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(200, 5, 78, 0, 'Active', '2023-02-07 17:22:16', '2023-02-07 17:22:16'),
(201, 6, 1, 700, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(202, 6, 2, 1700, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(203, 6, 3, 500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(204, 6, 4, 700, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(205, 6, 5, 3500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(206, 6, 6, 5000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(207, 6, 7, 6000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(208, 6, 8, 6000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(209, 6, 9, 4200, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(210, 6, 10, 4000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(211, 6, 11, 2800, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(212, 6, 12, 4300, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(213, 6, 13, 3400, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(214, 6, 14, 3200, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(215, 6, 15, 1500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(216, 6, 16, 100, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(217, 6, 17, 200, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(218, 6, 18, 300, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(219, 6, 19, 400, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(220, 6, 20, 500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(221, 6, 21, 1200, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(222, 6, 22, 2300, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(223, 6, 23, 1700, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(224, 6, 61, 1500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(225, 6, 62, 1000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(226, 6, 63, 600, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(227, 6, 64, 600, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(228, 6, 65, 2000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(229, 6, 66, 5750, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(230, 6, 67, 1300, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(231, 6, 68, 4100, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(232, 6, 69, 45000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(233, 6, 70, 3000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(234, 6, 71, 3200, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(235, 6, 72, 0, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(236, 6, 73, 1500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(237, 6, 74, 8500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(238, 6, 75, 5000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(239, 6, 76, 1500, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(240, 6, 77, 4000, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(241, 6, 78, 0, 'Active', '2023-02-07 17:22:31', '2023-02-07 17:22:31'),
(242, 7, 1, 700, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(243, 7, 2, 1700, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(244, 7, 3, 500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(245, 7, 4, 700, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(246, 7, 5, 3500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(247, 7, 6, 5000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(248, 7, 7, 6000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(249, 7, 8, 6000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(250, 7, 9, 4200, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(251, 7, 10, 4000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(252, 7, 11, 2800, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(253, 7, 12, 4300, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(254, 7, 13, 3400, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(255, 7, 14, 3200, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(256, 7, 15, 1500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(257, 7, 16, 100, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(258, 7, 17, 200, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(259, 7, 18, 300, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(260, 7, 19, 400, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(261, 7, 20, 500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(262, 7, 21, 1200, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(263, 7, 22, 2300, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(264, 7, 23, 1700, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(265, 7, 61, 1500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(266, 7, 62, 1000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(267, 7, 63, 600, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(268, 7, 64, 600, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(269, 7, 65, 2000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(270, 7, 66, 5750, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(271, 7, 67, 1300, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(272, 7, 68, 4100, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(273, 7, 69, 45000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(274, 7, 70, 3000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(275, 7, 71, 3200, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(276, 7, 72, 0, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(277, 7, 73, 1500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(278, 7, 74, 8500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(279, 7, 75, 5000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(280, 7, 76, 1500, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(281, 7, 77, 4000, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(282, 7, 78, 0, 'Active', '2023-02-07 17:22:48', '2023-02-07 17:22:48'),
(283, 8, 1, 700, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(284, 8, 2, 1700, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(285, 8, 3, 500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(286, 8, 4, 700, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(287, 8, 5, 3500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(288, 8, 6, 5000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(289, 8, 7, 6000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(290, 8, 8, 6000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(291, 8, 9, 4200, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(292, 8, 10, 4000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(293, 8, 11, 2800, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(294, 8, 12, 4300, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(295, 8, 13, 3400, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(296, 8, 14, 3200, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(297, 8, 15, 1500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(298, 8, 16, 100, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(299, 8, 17, 200, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(300, 8, 18, 300, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(301, 8, 19, 400, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(302, 8, 20, 500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(303, 8, 21, 1200, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(304, 8, 22, 2300, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(305, 8, 23, 1700, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(306, 8, 61, 1500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(307, 8, 62, 1000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(308, 8, 63, 600, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(309, 8, 64, 600, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(310, 8, 65, 2000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(311, 8, 66, 5750, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(312, 8, 67, 1300, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(313, 8, 68, 4100, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(314, 8, 69, 45000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(315, 8, 70, 3000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(316, 8, 71, 3200, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(317, 8, 72, 0, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(318, 8, 73, 1500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(319, 8, 74, 8500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(320, 8, 75, 5000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(321, 8, 76, 1500, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(322, 8, 77, 4000, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(323, 8, 78, 0, 'Active', '2023-02-07 17:23:10', '2023-02-07 17:23:10'),
(324, 9, 1, 700, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(325, 9, 2, 1700, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(326, 9, 3, 500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(327, 9, 4, 700, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(328, 9, 5, 3500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(329, 9, 6, 5000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(330, 9, 7, 6000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(331, 9, 8, 6000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(332, 9, 9, 4200, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(333, 9, 10, 4000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(334, 9, 11, 2800, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(335, 9, 12, 4300, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(336, 9, 13, 3400, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(337, 9, 14, 3200, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(338, 9, 15, 1500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(339, 9, 16, 100, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(340, 9, 17, 200, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(341, 9, 18, 300, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(342, 9, 19, 400, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(343, 9, 20, 500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(344, 9, 21, 1200, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(345, 9, 22, 2300, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(346, 9, 23, 1700, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(347, 9, 61, 1500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(348, 9, 62, 1000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(349, 9, 63, 600, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(350, 9, 64, 600, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(351, 9, 65, 2000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(352, 9, 66, 5750, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(353, 9, 67, 1300, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(354, 9, 68, 4100, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(355, 9, 69, 45000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(356, 9, 70, 3000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(357, 9, 71, 3200, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(358, 9, 72, 0, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(359, 9, 73, 1500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(360, 9, 74, 8500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(361, 9, 75, 5000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(362, 9, 76, 1500, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(363, 9, 77, 4000, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(364, 9, 78, 0, 'Active', '2023-02-07 17:23:31', '2023-02-07 17:23:31'),
(365, 10, 1, 700, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(366, 10, 2, 1700, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(367, 10, 3, 500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(368, 10, 4, 700, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(369, 10, 5, 3500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(370, 10, 6, 5000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(371, 10, 7, 6000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(372, 10, 8, 6000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(373, 10, 9, 4200, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(374, 10, 10, 4000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(375, 10, 11, 2800, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(376, 10, 12, 4300, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(377, 10, 13, 3400, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(378, 10, 14, 3200, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(379, 10, 15, 1500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(380, 10, 16, 100, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(381, 10, 17, 200, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(382, 10, 18, 300, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(383, 10, 19, 400, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(384, 10, 20, 500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(385, 10, 21, 1200, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(386, 10, 22, 2300, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(387, 10, 23, 1700, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(388, 10, 61, 1500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(389, 10, 62, 1000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(390, 10, 63, 600, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(391, 10, 64, 600, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(392, 10, 65, 2000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(393, 10, 66, 5750, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(394, 10, 67, 1300, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(395, 10, 68, 4100, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(396, 10, 69, 45000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(397, 10, 70, 3000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(398, 10, 71, 3200, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(399, 10, 72, 0, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(400, 10, 73, 1500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(401, 10, 74, 8500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(402, 10, 75, 5000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(403, 10, 76, 1500, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(404, 10, 77, 4000, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(405, 10, 78, 0, 'Active', '2023-02-07 17:24:17', '2023-02-07 17:24:17'),
(406, 11, 1, 700, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(407, 11, 2, 1700, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(408, 11, 3, 500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(409, 11, 4, 700, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(410, 11, 5, 3500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(411, 11, 6, 5000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(412, 11, 7, 6000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(413, 11, 8, 6000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(414, 11, 9, 4200, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(415, 11, 10, 4000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(416, 11, 11, 2800, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(417, 11, 12, 4300, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(418, 11, 13, 3400, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(419, 11, 14, 3200, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(420, 11, 15, 1500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(421, 11, 16, 100, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(422, 11, 17, 200, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(423, 11, 18, 300, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(424, 11, 19, 400, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(425, 11, 20, 500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(426, 11, 21, 1200, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(427, 11, 22, 2300, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(428, 11, 23, 1700, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(429, 11, 61, 1500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(430, 11, 62, 1000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(431, 11, 63, 600, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(432, 11, 64, 600, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(433, 11, 65, 2000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(434, 11, 66, 5750, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(435, 11, 67, 1300, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(436, 11, 68, 4100, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(437, 11, 69, 45000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(438, 11, 70, 3000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(439, 11, 71, 3200, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(440, 11, 72, 0, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(441, 11, 73, 1500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(442, 11, 74, 8500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(443, 11, 75, 5000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(444, 11, 76, 1500, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(445, 11, 77, 4000, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(446, 11, 78, 0, 'Active', '2023-02-07 17:24:28', '2023-02-07 17:24:28'),
(447, 12, 1, 700, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(448, 12, 2, 1700, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(449, 12, 3, 500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(450, 12, 4, 700, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(451, 12, 5, 3500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(452, 12, 6, 5000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(453, 12, 7, 6000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(454, 12, 8, 6000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(455, 12, 9, 4200, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(456, 12, 10, 4000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(457, 12, 11, 2800, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(458, 12, 12, 4300, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(459, 12, 13, 3400, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(460, 12, 14, 3200, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(461, 12, 15, 1500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(462, 12, 16, 100, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(463, 12, 17, 200, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(464, 12, 18, 300, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(465, 12, 19, 400, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(466, 12, 20, 500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(467, 12, 21, 1200, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(468, 12, 22, 2300, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(469, 12, 23, 1700, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(470, 12, 61, 1500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(471, 12, 62, 1000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(472, 12, 63, 600, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(473, 12, 64, 600, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(474, 12, 65, 2000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(475, 12, 66, 5750, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(476, 12, 67, 1300, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(477, 12, 68, 4100, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(478, 12, 69, 45000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(479, 12, 70, 3000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(480, 12, 71, 3200, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(481, 12, 72, 0, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(482, 12, 73, 1500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(483, 12, 74, 8500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(484, 12, 75, 5000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(485, 12, 76, 1500, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(486, 12, 77, 4000, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(487, 12, 78, 0, 'Active', '2023-02-07 17:24:41', '2023-02-07 17:24:41'),
(488, 13, 1, 700, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(489, 13, 2, 1700, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(490, 13, 3, 500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(491, 13, 4, 700, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(492, 13, 5, 3500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(493, 13, 6, 5000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(494, 13, 7, 6000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(495, 13, 8, 6000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(496, 13, 9, 4200, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(497, 13, 10, 4000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(498, 13, 11, 2800, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(499, 13, 12, 4300, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(500, 13, 13, 3400, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(501, 13, 14, 3200, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(502, 13, 15, 1500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(503, 13, 16, 100, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(504, 13, 17, 200, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(505, 13, 18, 300, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(506, 13, 19, 400, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(507, 13, 20, 500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(508, 13, 21, 1200, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(509, 13, 22, 2300, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(510, 13, 23, 1700, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(511, 13, 61, 1500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(512, 13, 62, 1000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(513, 13, 63, 600, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(514, 13, 64, 600, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(515, 13, 65, 2000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(516, 13, 66, 5750, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(517, 13, 67, 1300, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(518, 13, 68, 4100, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(519, 13, 69, 45000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(520, 13, 70, 3000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(521, 13, 71, 3200, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(522, 13, 72, 0, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(523, 13, 73, 1500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(524, 13, 74, 8500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(525, 13, 75, 5000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(526, 13, 76, 1500, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(527, 13, 77, 4000, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(528, 13, 78, 0, 'Active', '2023-02-07 17:24:59', '2023-02-07 17:24:59'),
(529, 14, 1, 700, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(530, 14, 2, 1700, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(531, 14, 3, 500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(532, 14, 4, 700, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(533, 14, 5, 3500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(534, 14, 6, 5000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(535, 14, 7, 6000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(536, 14, 8, 6000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(537, 14, 9, 4200, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(538, 14, 10, 4000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(539, 14, 11, 2800, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(540, 14, 12, 4300, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(541, 14, 13, 3400, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(542, 14, 14, 3200, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(543, 14, 15, 1500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(544, 14, 16, 100, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(545, 14, 17, 200, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(546, 14, 18, 300, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(547, 14, 19, 400, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(548, 14, 20, 500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(549, 14, 21, 1200, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(550, 14, 22, 2300, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(551, 14, 23, 1700, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(552, 14, 61, 1500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(553, 14, 62, 1000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(554, 14, 63, 600, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(555, 14, 64, 600, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(556, 14, 65, 2000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(557, 14, 66, 5750, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(558, 14, 67, 1300, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(559, 14, 68, 4100, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(560, 14, 69, 45000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(561, 14, 70, 3000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(562, 14, 71, 3200, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(563, 14, 72, 0, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(564, 14, 73, 1500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(565, 14, 74, 8500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(566, 14, 75, 5000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(567, 14, 76, 1500, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(568, 14, 77, 4000, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(569, 14, 78, 0, 'Active', '2023-02-07 17:25:19', '2023-02-07 17:25:19'),
(570, 15, 1, 700, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(571, 15, 2, 1700, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(572, 15, 3, 500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(573, 15, 4, 700, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(574, 15, 5, 3500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(575, 15, 6, 5000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(576, 15, 7, 6000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(577, 15, 8, 6000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(578, 15, 9, 4200, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(579, 15, 10, 4000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(580, 15, 11, 2800, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(581, 15, 12, 4300, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(582, 15, 13, 3400, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(583, 15, 14, 3200, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(584, 15, 15, 1500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(585, 15, 16, 100, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(586, 15, 17, 200, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(587, 15, 18, 300, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(588, 15, 19, 400, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(589, 15, 20, 500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(590, 15, 21, 1200, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(591, 15, 22, 2300, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(592, 15, 23, 1700, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(593, 15, 61, 1500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(594, 15, 62, 1000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(595, 15, 63, 600, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(596, 15, 64, 600, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(597, 15, 65, 2000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(598, 15, 66, 5750, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(599, 15, 67, 1300, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(600, 15, 68, 4100, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(601, 15, 69, 45000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(602, 15, 70, 3000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(603, 15, 71, 3200, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(604, 15, 72, 0, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(605, 15, 73, 1500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(606, 15, 74, 8500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(607, 15, 75, 5000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(608, 15, 76, 1500, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(609, 15, 77, 4000, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(610, 15, 78, 0, 'Active', '2023-02-07 17:25:34', '2023-02-07 17:25:34'),
(611, 16, 1, 700, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(612, 16, 2, 1700, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(613, 16, 3, 500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(614, 16, 4, 700, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(615, 16, 5, 3500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(616, 16, 6, 5000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(617, 16, 7, 6000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(618, 16, 8, 6000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(619, 16, 9, 4200, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(620, 16, 10, 4000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(621, 16, 11, 2800, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(622, 16, 12, 4300, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(623, 16, 13, 3400, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(624, 16, 14, 3200, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(625, 16, 15, 1500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(626, 16, 16, 100, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(627, 16, 17, 200, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(628, 16, 18, 300, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(629, 16, 19, 400, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(630, 16, 20, 500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(631, 16, 21, 1200, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(632, 16, 22, 2300, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(633, 16, 23, 1700, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(634, 16, 61, 1500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(635, 16, 62, 1000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(636, 16, 63, 600, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(637, 16, 64, 600, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(638, 16, 65, 2000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(639, 16, 66, 5750, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(640, 16, 67, 1300, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(641, 16, 68, 4100, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(642, 16, 69, 45000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(643, 16, 70, 3000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(644, 16, 71, 3200, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(645, 16, 72, 0, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(646, 16, 73, 1500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(647, 16, 74, 8500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(648, 16, 75, 5000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(649, 16, 76, 1500, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(650, 16, 77, 4000, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(651, 16, 78, 0, 'Active', '2023-02-07 17:25:45', '2023-02-07 17:25:45'),
(652, 17, 1, 700, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(653, 17, 2, 1700, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(654, 17, 3, 500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(655, 17, 4, 700, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(656, 17, 5, 3500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(657, 17, 6, 5000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(658, 17, 7, 6000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(659, 17, 8, 6000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(660, 17, 9, 4200, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(661, 17, 10, 4000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(662, 17, 11, 2800, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(663, 17, 12, 4300, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(664, 17, 13, 3400, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(665, 17, 14, 3200, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(666, 17, 15, 1500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(667, 17, 16, 100, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(668, 17, 17, 200, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(669, 17, 18, 300, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(670, 17, 19, 400, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(671, 17, 20, 500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(672, 17, 21, 1200, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(673, 17, 22, 2300, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(674, 17, 23, 1700, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(675, 17, 61, 1500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(676, 17, 62, 1000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(677, 17, 63, 600, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(678, 17, 64, 600, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(679, 17, 65, 2000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(680, 17, 66, 5750, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(681, 17, 67, 1300, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(682, 17, 68, 4100, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(683, 17, 69, 45000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(684, 17, 70, 3000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(685, 17, 71, 3200, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(686, 17, 72, 0, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(687, 17, 73, 1500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(688, 17, 74, 8500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(689, 17, 75, 5000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(690, 17, 76, 1500, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(691, 17, 77, 4000, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(692, 17, 78, 0, 'Active', '2023-02-07 17:25:53', '2023-02-07 17:25:53'),
(693, 18, 1, 700, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(694, 18, 2, 1700, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(695, 18, 3, 500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(696, 18, 4, 700, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(697, 18, 5, 3500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(698, 18, 6, 5000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(699, 18, 7, 6000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(700, 18, 8, 6000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(701, 18, 9, 4200, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(702, 18, 10, 4000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(703, 18, 11, 2800, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(704, 18, 12, 4300, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(705, 18, 13, 3400, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(706, 18, 14, 3200, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(707, 18, 15, 1500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(708, 18, 16, 100, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(709, 18, 17, 200, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(710, 18, 18, 300, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(711, 18, 19, 400, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(712, 18, 20, 500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(713, 18, 21, 1200, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(714, 18, 22, 2300, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(715, 18, 23, 1700, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(716, 18, 61, 1500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(717, 18, 62, 1000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(718, 18, 63, 600, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(719, 18, 64, 600, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(720, 18, 65, 2000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(721, 18, 66, 5750, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(722, 18, 67, 1300, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(723, 18, 68, 4100, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(724, 18, 69, 45000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(725, 18, 70, 3000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(726, 18, 71, 3200, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(727, 18, 72, 0, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(728, 18, 73, 1500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(729, 18, 74, 8500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(730, 18, 75, 5000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(731, 18, 76, 1500, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(732, 18, 77, 4000, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(733, 18, 78, 0, 'Active', '2023-02-07 17:25:59', '2023-02-07 17:25:59'),
(734, 19, 24, 7000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(735, 19, 25, 7500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(736, 19, 26, 15000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(737, 19, 27, 10000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(738, 19, 28, 7500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(739, 19, 29, 7000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(740, 19, 30, 700, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(741, 19, 31, 500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(742, 19, 32, 7500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(743, 19, 33, 7500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(744, 19, 34, 15000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(745, 19, 35, 1, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(746, 19, 36, 1, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(747, 19, 37, 10000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(748, 19, 38, 11500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(749, 19, 39, 18000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(750, 19, 40, 19000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(751, 19, 41, 17250, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09');
INSERT INTO `harga_beli_details` (`id`, `id_harga_belis`, `id_barang_belis`, `harga`, `aktif`, `created_at`, `updated_at`) VALUES
(752, 19, 42, 3000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(753, 19, 43, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(754, 19, 44, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(755, 19, 45, 15000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(756, 19, 46, 69000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(757, 19, 47, 16000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(758, 19, 48, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(759, 19, 49, 5000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(760, 19, 50, 15000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(761, 19, 51, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(762, 19, 52, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(763, 19, 53, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(764, 19, 54, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(765, 19, 55, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(766, 19, 56, 7000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(767, 19, 57, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(768, 19, 58, 5500, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(769, 19, 59, 0, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(770, 19, 60, 17000, 'Active', '2023-02-07 17:26:09', '2023-02-07 17:26:09'),
(771, 20, 24, 7000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(772, 20, 25, 7500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(773, 20, 26, 15000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(774, 20, 27, 10000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(775, 20, 28, 7500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(776, 20, 29, 7000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(777, 20, 30, 700, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(778, 20, 31, 500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(779, 20, 32, 7500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(780, 20, 33, 7500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(781, 20, 34, 15000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(782, 20, 35, 1, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(783, 20, 36, 1, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(784, 20, 37, 10000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(785, 20, 38, 11500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(786, 20, 39, 18000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(787, 20, 40, 19000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(788, 20, 41, 17250, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(789, 20, 42, 3000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(790, 20, 43, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(791, 20, 44, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(792, 20, 45, 15000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(793, 20, 46, 69000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(794, 20, 47, 16000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(795, 20, 48, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(796, 20, 49, 5000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(797, 20, 50, 15000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(798, 20, 51, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(799, 20, 52, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(800, 20, 53, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(801, 20, 54, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(802, 20, 55, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(803, 20, 56, 7000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(804, 20, 57, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(805, 20, 58, 5500, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(806, 20, 59, 0, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(807, 20, 60, 17000, 'Active', '2023-02-07 17:26:42', '2023-02-07 17:26:42'),
(808, 21, 24, 7000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(809, 21, 25, 7500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(810, 21, 26, 15000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(811, 21, 27, 10000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(812, 21, 28, 7500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(813, 21, 29, 7000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(814, 21, 30, 700, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(815, 21, 31, 500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(816, 21, 32, 7500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(817, 21, 33, 7500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(818, 21, 34, 15000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(819, 21, 35, 1, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(820, 21, 36, 1, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(821, 21, 37, 10000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(822, 21, 38, 11500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(823, 21, 39, 18000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(824, 21, 40, 19000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(825, 21, 41, 17250, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(826, 21, 42, 3000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(827, 21, 43, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(828, 21, 44, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(829, 21, 45, 15000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(830, 21, 46, 69000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(831, 21, 47, 16000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(832, 21, 48, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(833, 21, 49, 5000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(834, 21, 50, 15000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(835, 21, 51, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(836, 21, 52, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(837, 21, 53, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(838, 21, 54, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(839, 21, 55, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(840, 21, 56, 7000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(841, 21, 57, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(842, 21, 58, 5500, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(843, 21, 59, 0, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(844, 21, 60, 17000, 'Active', '2023-02-07 17:26:59', '2023-02-07 17:26:59'),
(845, 22, 24, 7000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(846, 22, 25, 7500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(847, 22, 26, 15000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(848, 22, 27, 10000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(849, 22, 28, 7500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(850, 22, 29, 7000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(851, 22, 30, 700, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(852, 22, 31, 500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(853, 22, 32, 7500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(854, 22, 33, 7500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(855, 22, 34, 15000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(856, 22, 35, 1, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(857, 22, 36, 1, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(858, 22, 37, 10000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(859, 22, 38, 11500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(860, 22, 39, 18000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(861, 22, 40, 19000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(862, 22, 41, 17250, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(863, 22, 42, 3000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(864, 22, 43, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(865, 22, 44, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(866, 22, 45, 15000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(867, 22, 46, 69000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(868, 22, 47, 16000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(869, 22, 48, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(870, 22, 49, 5000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(871, 22, 50, 15000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(872, 22, 51, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(873, 22, 52, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(874, 22, 53, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(875, 22, 54, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(876, 22, 55, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(877, 22, 56, 7000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(878, 22, 57, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(879, 22, 58, 5500, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(880, 22, 59, 0, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(881, 22, 60, 17000, 'Active', '2023-02-07 17:27:29', '2023-02-07 17:27:29'),
(882, 23, 24, 7000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(883, 23, 25, 7500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(884, 23, 26, 15000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(885, 23, 27, 10000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(886, 23, 28, 7500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(887, 23, 29, 7000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(888, 23, 30, 700, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(889, 23, 31, 500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(890, 23, 32, 7500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(891, 23, 33, 7500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(892, 23, 34, 15000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(893, 23, 35, 1, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(894, 23, 36, 1, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(895, 23, 37, 10000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(896, 23, 38, 11500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(897, 23, 39, 18000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(898, 23, 40, 19000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(899, 23, 41, 17250, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(900, 23, 42, 3000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(901, 23, 43, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(902, 23, 44, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(903, 23, 45, 15000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(904, 23, 46, 69000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(905, 23, 47, 16000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(906, 23, 48, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(907, 23, 49, 5000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(908, 23, 50, 15000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(909, 23, 51, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(910, 23, 52, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(911, 23, 53, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(912, 23, 54, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(913, 23, 55, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(914, 23, 56, 7000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(915, 23, 57, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(916, 23, 58, 5500, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(917, 23, 59, 0, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(918, 23, 60, 17000, 'Active', '2023-02-07 17:27:42', '2023-02-07 17:27:42'),
(919, 24, 24, 7500, 'Active', '2023-02-07 17:27:54', '2023-02-11 05:18:27'),
(920, 24, 25, 7500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(921, 24, 26, 15000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(922, 24, 27, 10000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(923, 24, 28, 7500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(924, 24, 29, 7000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(925, 24, 30, 700, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(926, 24, 31, 500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(927, 24, 32, 7500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(928, 24, 33, 7500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(929, 24, 34, 15000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(930, 24, 35, 1, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(931, 24, 36, 1, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(932, 24, 37, 10000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(933, 24, 38, 11500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(934, 24, 39, 18000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(935, 24, 40, 19000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(936, 24, 41, 17250, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(937, 24, 42, 3000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(938, 24, 43, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(939, 24, 44, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(940, 24, 45, 15000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(941, 24, 46, 69000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(942, 24, 47, 16000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(943, 24, 48, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(944, 24, 49, 5000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(945, 24, 50, 15000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(946, 24, 51, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(947, 24, 52, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(948, 24, 53, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(949, 24, 54, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(950, 24, 55, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(951, 24, 56, 7000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(952, 24, 57, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(953, 24, 58, 5500, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(954, 24, 59, 0, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(955, 24, 60, 17000, 'Active', '2023-02-07 17:27:54', '2023-02-07 17:27:54'),
(956, 25, 24, 7000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(957, 25, 25, 7500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(958, 25, 26, 15000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(959, 25, 27, 10000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(960, 25, 28, 7500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(961, 25, 29, 7000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(962, 25, 30, 700, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(963, 25, 31, 500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(964, 25, 32, 7500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(965, 25, 33, 7500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(966, 25, 34, 15000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(967, 25, 35, 1, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(968, 25, 36, 1, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(969, 25, 37, 10000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(970, 25, 38, 11500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(971, 25, 39, 18000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(972, 25, 40, 19000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(973, 25, 41, 17250, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(974, 25, 42, 3000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(975, 25, 43, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(976, 25, 44, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(977, 25, 45, 15000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(978, 25, 46, 69000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(979, 25, 47, 16000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(980, 25, 48, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(981, 25, 49, 5000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(982, 25, 50, 15000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(983, 25, 51, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(984, 25, 52, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(985, 25, 53, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(986, 25, 54, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(987, 25, 55, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(988, 25, 56, 7000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(989, 25, 57, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(990, 25, 58, 5500, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(991, 25, 59, 0, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(992, 25, 60, 17000, 'Active', '2023-02-07 17:28:03', '2023-02-07 17:28:03'),
(993, 26, 24, 7000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(994, 26, 25, 7500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(995, 26, 26, 15000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(996, 26, 27, 10000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(997, 26, 28, 7500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(998, 26, 29, 7000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(999, 26, 30, 700, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1000, 26, 31, 500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1001, 26, 32, 7500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1002, 26, 33, 7500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1003, 26, 34, 15000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1004, 26, 35, 1, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1005, 26, 36, 1, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1006, 26, 37, 10000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1007, 26, 38, 11500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1008, 26, 39, 18000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1009, 26, 40, 19000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1010, 26, 41, 17250, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1011, 26, 42, 3000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1012, 26, 43, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1013, 26, 44, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1014, 26, 45, 15000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1015, 26, 46, 69000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1016, 26, 47, 16000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1017, 26, 48, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1018, 26, 49, 5000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1019, 26, 50, 15000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1020, 26, 51, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1021, 26, 52, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1022, 26, 53, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1023, 26, 54, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1024, 26, 55, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1025, 26, 56, 7000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1026, 26, 57, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1027, 26, 58, 5500, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1028, 26, 59, 0, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1029, 26, 60, 17000, 'Active', '2023-02-07 17:28:12', '2023-02-07 17:28:12'),
(1030, 27, 24, 7000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1031, 27, 25, 7500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1032, 27, 26, 15000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1033, 27, 27, 10000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1034, 27, 28, 7500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1035, 27, 29, 7000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1036, 27, 30, 700, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1037, 27, 31, 500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1038, 27, 32, 7500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1039, 27, 33, 7500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1040, 27, 34, 15000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1041, 27, 35, 1, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1042, 27, 36, 1, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1043, 27, 37, 10000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1044, 27, 38, 11500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1045, 27, 39, 18000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1046, 27, 40, 19000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1047, 27, 41, 17250, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1048, 27, 42, 3000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1049, 27, 43, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1050, 27, 44, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1051, 27, 45, 15000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1052, 27, 46, 69000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1053, 27, 47, 16000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1054, 27, 48, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1055, 27, 49, 5000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1056, 27, 50, 15000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1057, 27, 51, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1058, 27, 52, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1059, 27, 53, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1060, 27, 54, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1061, 27, 55, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1062, 27, 56, 7000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1063, 27, 57, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1064, 27, 58, 5500, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1065, 27, 59, 0, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1066, 27, 60, 17000, 'Active', '2023-02-07 17:28:21', '2023-02-07 17:28:21'),
(1067, 28, 24, 7000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1068, 28, 25, 7500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1069, 28, 26, 15000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1070, 28, 27, 10000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1071, 28, 28, 7500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1072, 28, 29, 7000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1073, 28, 30, 700, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1074, 28, 31, 500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1075, 28, 32, 7500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1076, 28, 33, 7500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1077, 28, 34, 15000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1078, 28, 35, 1, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1079, 28, 36, 1, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1080, 28, 37, 10000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1081, 28, 38, 11500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1082, 28, 39, 18000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1083, 28, 40, 19000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1084, 28, 41, 17250, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1085, 28, 42, 3000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1086, 28, 43, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1087, 28, 44, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1088, 28, 45, 15000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1089, 28, 46, 69000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1090, 28, 47, 16000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1091, 28, 48, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1092, 28, 49, 5000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1093, 28, 50, 15000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1094, 28, 51, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1095, 28, 52, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1096, 28, 53, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1097, 28, 54, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1098, 28, 55, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1099, 28, 56, 7000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1100, 28, 57, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1101, 28, 58, 5500, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1102, 28, 59, 0, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28'),
(1103, 28, 60, 17000, 'Active', '2023-02-07 17:28:28', '2023-02-07 17:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `harga_juals`
--

CREATE TABLE `harga_juals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga_juals`
--

INSERT INTO `harga_juals` (`id`, `kode`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'HJ01', 'UMUM', 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(2, 'HJ02', '-', 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(3, 'HJ03', '-', 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(4, 'HJ04', '-', 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(5, 'HJ05', '-', 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(6, 'HJ06', 'HARGA KHUSUS', 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(7, 'HJ07', '-', 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(8, 'HJ08', '-', 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(9, 'HJ09', '-', 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(10, 'HJ10', '-', 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(11, 'HJ11', '-', 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(12, 'HJ12', '-', 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(13, 'HJ13', '-', 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(14, 'HJ14', '-', 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `harga_jual_details`
--

CREATE TABLE `harga_jual_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_harga_juals` int(10) NOT NULL DEFAULT 0,
  `id_barang_juals` int(10) NOT NULL DEFAULT 0,
  `harga` double DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `harga_jual_details`
--

INSERT INTO `harga_jual_details` (`id`, `id_harga_juals`, `id_barang_juals`, `harga`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:58'),
(2, 1, 2, 4500, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:15:10'),
(3, 1, 3, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(4, 1, 4, 110000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(5, 1, 5, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(6, 1, 6, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(7, 1, 7, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(8, 1, 8, 8000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(9, 1, 9, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(10, 1, 10, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(11, 1, 11, 35000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(12, 1, 12, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(13, 1, 13, 5000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(14, 1, 14, 750, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(15, 1, 15, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(16, 1, 16, 3650, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(17, 1, 17, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(18, 1, 18, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(19, 1, 19, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(20, 1, 20, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(21, 1, 21, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(22, 1, 22, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(23, 1, 23, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(24, 1, 24, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(25, 1, 25, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(26, 1, 26, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(27, 1, 27, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(28, 1, 28, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(29, 1, 29, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(30, 1, 30, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(31, 1, 31, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(32, 1, 32, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(33, 1, 33, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(34, 1, 34, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(35, 1, 35, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(36, 1, 36, 0, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(37, 1, 37, 12500, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(38, 1, 38, 2500, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(39, 1, 39, 3500, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(40, 1, 40, 3000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(41, 1, 41, 110000, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(42, 1, 42, 8500, 'Active', '2023-02-08 14:14:43', '2023-02-08 14:14:43'),
(43, 2, 1, 12000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:35'),
(44, 2, 2, 333, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(45, 2, 3, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(46, 2, 4, 110000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(47, 2, 5, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(48, 2, 6, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(49, 2, 7, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(50, 2, 8, 8000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(51, 2, 9, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(52, 2, 10, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(53, 2, 11, 35000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(54, 2, 12, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(55, 2, 13, 5000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(56, 2, 14, 750, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(57, 2, 15, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(58, 2, 16, 3650, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(59, 2, 17, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(60, 2, 18, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(61, 2, 19, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(62, 2, 20, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(63, 2, 21, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(64, 2, 22, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(65, 2, 23, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(66, 2, 24, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(67, 2, 25, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(68, 2, 26, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(69, 2, 27, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(70, 2, 28, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(71, 2, 29, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(72, 2, 30, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(73, 2, 31, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(74, 2, 32, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(75, 2, 33, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(76, 2, 34, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(77, 2, 35, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(78, 2, 36, 0, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(79, 2, 37, 12500, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(80, 2, 38, 2500, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(81, 2, 39, 3500, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(82, 2, 40, 3000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(83, 2, 41, 110000, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(84, 2, 42, 8500, 'Active', '2023-02-08 14:15:27', '2023-02-08 14:15:27'),
(85, 3, 1, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(86, 3, 2, 333, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(87, 3, 3, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(88, 3, 4, 110000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(89, 3, 5, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(90, 3, 6, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(91, 3, 7, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(92, 3, 8, 8000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(93, 3, 9, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(94, 3, 10, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(95, 3, 11, 35000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(96, 3, 12, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(97, 3, 13, 5000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(98, 3, 14, 750, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(99, 3, 15, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(100, 3, 16, 3650, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(101, 3, 17, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(102, 3, 18, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(103, 3, 19, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(104, 3, 20, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(105, 3, 21, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(106, 3, 22, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(107, 3, 23, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(108, 3, 24, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(109, 3, 25, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(110, 3, 26, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(111, 3, 27, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(112, 3, 28, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(113, 3, 29, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(114, 3, 30, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(115, 3, 31, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(116, 3, 32, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(117, 3, 33, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(118, 3, 34, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(119, 3, 35, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(120, 3, 36, 0, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(121, 3, 37, 12500, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(122, 3, 38, 2500, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(123, 3, 39, 3500, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(124, 3, 40, 3000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(125, 3, 41, 110000, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(126, 3, 42, 8500, 'Active', '2023-02-08 14:15:51', '2023-02-08 14:15:51'),
(127, 4, 1, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(128, 4, 2, 333, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(129, 4, 3, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(130, 4, 4, 110000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(131, 4, 5, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(132, 4, 6, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(133, 4, 7, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(134, 4, 8, 8000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(135, 4, 9, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(136, 4, 10, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(137, 4, 11, 35000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(138, 4, 12, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(139, 4, 13, 5000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(140, 4, 14, 750, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(141, 4, 15, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(142, 4, 16, 3650, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(143, 4, 17, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(144, 4, 18, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(145, 4, 19, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(146, 4, 20, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(147, 4, 21, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(148, 4, 22, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(149, 4, 23, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(150, 4, 24, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(151, 4, 25, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(152, 4, 26, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(153, 4, 27, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(154, 4, 28, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(155, 4, 29, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(156, 4, 30, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(157, 4, 31, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(158, 4, 32, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(159, 4, 33, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(160, 4, 34, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(161, 4, 35, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(162, 4, 36, 0, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(163, 4, 37, 12500, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(164, 4, 38, 2500, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(165, 4, 39, 3500, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(166, 4, 40, 3000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(167, 4, 41, 110000, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(168, 4, 42, 8500, 'Active', '2023-02-08 14:15:59', '2023-02-08 14:15:59'),
(169, 5, 1, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(170, 5, 2, 333, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(171, 5, 3, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(172, 5, 4, 110000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(173, 5, 5, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(174, 5, 6, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(175, 5, 7, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(176, 5, 8, 8000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(177, 5, 9, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(178, 5, 10, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(179, 5, 11, 35000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(180, 5, 12, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(181, 5, 13, 5000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(182, 5, 14, 750, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(183, 5, 15, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(184, 5, 16, 3650, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(185, 5, 17, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(186, 5, 18, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(187, 5, 19, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(188, 5, 20, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(189, 5, 21, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(190, 5, 22, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(191, 5, 23, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(192, 5, 24, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(193, 5, 25, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(194, 5, 26, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(195, 5, 27, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(196, 5, 28, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(197, 5, 29, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(198, 5, 30, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(199, 5, 31, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(200, 5, 32, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(201, 5, 33, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(202, 5, 34, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(203, 5, 35, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(204, 5, 36, 0, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(205, 5, 37, 12500, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(206, 5, 38, 2500, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(207, 5, 39, 3500, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(208, 5, 40, 3000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(209, 5, 41, 110000, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(210, 5, 42, 8500, 'Active', '2023-02-08 14:16:07', '2023-02-08 14:16:07'),
(211, 6, 1, 8200, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:17:33'),
(212, 6, 2, 6000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:17:39'),
(213, 6, 3, 7000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:17:46'),
(214, 6, 4, 110000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(215, 6, 5, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(216, 6, 6, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(217, 6, 7, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(218, 6, 8, 8000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(219, 6, 9, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(220, 6, 10, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(221, 6, 11, 35000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(222, 6, 12, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(223, 6, 13, 5000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(224, 6, 14, 750, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(225, 6, 15, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(226, 6, 16, 3650, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(227, 6, 17, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(228, 6, 18, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(229, 6, 19, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(230, 6, 20, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(231, 6, 21, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(232, 6, 22, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(233, 6, 23, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(234, 6, 24, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(235, 6, 25, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(236, 6, 26, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(237, 6, 27, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(238, 6, 28, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(239, 6, 29, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(240, 6, 30, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(241, 6, 31, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(242, 6, 32, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(243, 6, 33, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(244, 6, 34, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(245, 6, 35, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(246, 6, 36, 0, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(247, 6, 37, 12500, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(248, 6, 38, 2500, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(249, 6, 39, 3500, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(250, 6, 40, 3000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(251, 6, 41, 110000, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(252, 6, 42, 8500, 'Active', '2023-02-08 14:16:21', '2023-02-08 14:16:21'),
(253, 7, 1, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(254, 7, 2, 333, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(255, 7, 3, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(256, 7, 4, 110000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(257, 7, 5, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(258, 7, 6, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(259, 7, 7, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(260, 7, 8, 8000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(261, 7, 9, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(262, 7, 10, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(263, 7, 11, 35000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(264, 7, 12, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(265, 7, 13, 5000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(266, 7, 14, 750, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(267, 7, 15, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(268, 7, 16, 3650, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(269, 7, 17, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(270, 7, 18, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(271, 7, 19, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(272, 7, 20, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(273, 7, 21, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(274, 7, 22, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(275, 7, 23, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(276, 7, 24, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(277, 7, 25, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(278, 7, 26, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(279, 7, 27, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(280, 7, 28, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(281, 7, 29, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(282, 7, 30, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(283, 7, 31, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(284, 7, 32, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(285, 7, 33, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(286, 7, 34, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(287, 7, 35, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(288, 7, 36, 0, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(289, 7, 37, 12500, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(290, 7, 38, 2500, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(291, 7, 39, 3500, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(292, 7, 40, 3000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(293, 7, 41, 110000, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(294, 7, 42, 8500, 'Active', '2023-02-08 14:16:31', '2023-02-08 14:16:31'),
(295, 8, 1, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(296, 8, 2, 333, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(297, 8, 3, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(298, 8, 4, 110000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(299, 8, 5, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(300, 8, 6, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(301, 8, 7, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(302, 8, 8, 8000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(303, 8, 9, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(304, 8, 10, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(305, 8, 11, 35000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(306, 8, 12, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(307, 8, 13, 5000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(308, 8, 14, 750, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(309, 8, 15, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(310, 8, 16, 3650, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(311, 8, 17, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(312, 8, 18, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(313, 8, 19, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(314, 8, 20, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(315, 8, 21, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(316, 8, 22, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(317, 8, 23, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(318, 8, 24, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(319, 8, 25, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(320, 8, 26, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(321, 8, 27, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(322, 8, 28, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(323, 8, 29, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(324, 8, 30, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(325, 8, 31, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(326, 8, 32, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(327, 8, 33, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(328, 8, 34, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(329, 8, 35, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(330, 8, 36, 0, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(331, 8, 37, 12500, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(332, 8, 38, 2500, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(333, 8, 39, 3500, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(334, 8, 40, 3000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(335, 8, 41, 110000, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(336, 8, 42, 8500, 'Active', '2023-02-08 14:16:37', '2023-02-08 14:16:37'),
(337, 9, 1, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(338, 9, 2, 333, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(339, 9, 3, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(340, 9, 4, 110000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(341, 9, 5, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(342, 9, 6, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(343, 9, 7, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(344, 9, 8, 8000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(345, 9, 9, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(346, 9, 10, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(347, 9, 11, 35000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(348, 9, 12, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(349, 9, 13, 5000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(350, 9, 14, 750, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(351, 9, 15, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(352, 9, 16, 3650, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(353, 9, 17, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(354, 9, 18, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(355, 9, 19, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(356, 9, 20, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(357, 9, 21, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(358, 9, 22, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(359, 9, 23, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(360, 9, 24, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(361, 9, 25, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(362, 9, 26, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(363, 9, 27, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(364, 9, 28, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(365, 9, 29, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(366, 9, 30, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(367, 9, 31, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(368, 9, 32, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(369, 9, 33, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(370, 9, 34, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(371, 9, 35, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(372, 9, 36, 0, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(373, 9, 37, 12500, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(374, 9, 38, 2500, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(375, 9, 39, 3500, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(376, 9, 40, 3000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(377, 9, 41, 110000, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(378, 9, 42, 8500, 'Active', '2023-02-08 14:16:42', '2023-02-08 14:16:42'),
(379, 10, 1, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(380, 10, 2, 333, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(381, 10, 3, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(382, 10, 4, 110000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(383, 10, 5, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(384, 10, 6, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(385, 10, 7, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(386, 10, 8, 8000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(387, 10, 9, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(388, 10, 10, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(389, 10, 11, 35000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(390, 10, 12, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(391, 10, 13, 5000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(392, 10, 14, 750, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(393, 10, 15, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(394, 10, 16, 3650, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(395, 10, 17, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(396, 10, 18, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(397, 10, 19, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(398, 10, 20, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(399, 10, 21, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(400, 10, 22, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(401, 10, 23, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(402, 10, 24, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(403, 10, 25, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(404, 10, 26, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(405, 10, 27, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(406, 10, 28, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(407, 10, 29, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(408, 10, 30, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(409, 10, 31, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(410, 10, 32, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(411, 10, 33, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(412, 10, 34, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(413, 10, 35, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(414, 10, 36, 0, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(415, 10, 37, 12500, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(416, 10, 38, 2500, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(417, 10, 39, 3500, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(418, 10, 40, 3000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(419, 10, 41, 110000, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(420, 10, 42, 8500, 'Active', '2023-02-08 14:16:52', '2023-02-08 14:16:52'),
(421, 11, 1, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(422, 11, 2, 333, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(423, 11, 3, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(424, 11, 4, 110000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(425, 11, 5, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(426, 11, 6, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(427, 11, 7, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(428, 11, 8, 8000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(429, 11, 9, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(430, 11, 10, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(431, 11, 11, 35000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(432, 11, 12, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(433, 11, 13, 5000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(434, 11, 14, 750, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(435, 11, 15, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(436, 11, 16, 3650, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(437, 11, 17, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(438, 11, 18, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(439, 11, 19, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(440, 11, 20, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(441, 11, 21, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(442, 11, 22, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(443, 11, 23, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(444, 11, 24, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(445, 11, 25, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(446, 11, 26, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(447, 11, 27, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(448, 11, 28, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(449, 11, 29, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(450, 11, 30, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(451, 11, 31, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(452, 11, 32, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(453, 11, 33, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(454, 11, 34, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(455, 11, 35, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(456, 11, 36, 0, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(457, 11, 37, 12500, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(458, 11, 38, 2500, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(459, 11, 39, 3500, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(460, 11, 40, 3000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(461, 11, 41, 110000, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(462, 11, 42, 8500, 'Active', '2023-02-08 14:16:56', '2023-02-08 14:16:56'),
(463, 12, 1, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(464, 12, 2, 333, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(465, 12, 3, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(466, 12, 4, 110000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(467, 12, 5, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(468, 12, 6, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(469, 12, 7, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(470, 12, 8, 8000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(471, 12, 9, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(472, 12, 10, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(473, 12, 11, 35000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(474, 12, 12, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(475, 12, 13, 5000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(476, 12, 14, 750, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(477, 12, 15, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(478, 12, 16, 3650, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(479, 12, 17, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(480, 12, 18, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(481, 12, 19, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(482, 12, 20, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(483, 12, 21, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(484, 12, 22, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(485, 12, 23, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(486, 12, 24, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(487, 12, 25, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(488, 12, 26, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(489, 12, 27, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(490, 12, 28, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(491, 12, 29, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(492, 12, 30, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(493, 12, 31, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(494, 12, 32, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(495, 12, 33, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(496, 12, 34, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(497, 12, 35, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(498, 12, 36, 0, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(499, 12, 37, 12500, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(500, 12, 38, 2500, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(501, 12, 39, 3500, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(502, 12, 40, 3000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(503, 12, 41, 110000, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(504, 12, 42, 8500, 'Active', '2023-02-08 14:17:06', '2023-02-08 14:17:06'),
(505, 13, 1, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(506, 13, 2, 333, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(507, 13, 3, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(508, 13, 4, 110000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(509, 13, 5, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(510, 13, 6, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(511, 13, 7, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(512, 13, 8, 8000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(513, 13, 9, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(514, 13, 10, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(515, 13, 11, 35000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(516, 13, 12, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(517, 13, 13, 5000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(518, 13, 14, 750, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(519, 13, 15, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(520, 13, 16, 3650, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(521, 13, 17, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(522, 13, 18, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(523, 13, 19, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(524, 13, 20, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(525, 13, 21, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(526, 13, 22, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(527, 13, 23, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(528, 13, 24, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(529, 13, 25, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(530, 13, 26, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(531, 13, 27, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(532, 13, 28, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(533, 13, 29, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(534, 13, 30, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(535, 13, 31, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(536, 13, 32, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(537, 13, 33, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(538, 13, 34, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(539, 13, 35, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(540, 13, 36, 0, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(541, 13, 37, 12500, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(542, 13, 38, 2500, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(543, 13, 39, 3500, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(544, 13, 40, 3000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(545, 13, 41, 110000, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(546, 13, 42, 8500, 'Active', '2023-02-08 14:17:10', '2023-02-08 14:17:10'),
(547, 14, 1, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(548, 14, 2, 333, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(549, 14, 3, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(550, 14, 4, 110000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(551, 14, 5, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(552, 14, 6, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(553, 14, 7, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(554, 14, 8, 8000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(555, 14, 9, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(556, 14, 10, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(557, 14, 11, 35000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(558, 14, 12, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(559, 14, 13, 5000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(560, 14, 14, 750, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(561, 14, 15, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(562, 14, 16, 3650, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(563, 14, 17, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(564, 14, 18, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(565, 14, 19, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(566, 14, 20, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(567, 14, 21, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(568, 14, 22, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(569, 14, 23, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(570, 14, 24, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(571, 14, 25, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(572, 14, 26, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(573, 14, 27, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(574, 14, 28, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(575, 14, 29, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(576, 14, 30, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(577, 14, 31, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(578, 14, 32, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(579, 14, 33, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(580, 14, 34, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(581, 14, 35, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(582, 14, 36, 0, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(583, 14, 37, 12500, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(584, 14, 38, 2500, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(585, 14, 39, 3500, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(586, 14, 40, 3000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(587, 14, 41, 110000, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15'),
(588, 14, 42, 8500, 'Active', '2023-02-08 14:17:15', '2023-02-08 14:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `paket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fotographer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `tipe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Foto',
  `selesai1` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `selesai2` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_users`, `kode`, `customer`, `keterangan`, `paket`, `fotographer`, `nominal`, `tanggal`, `tipe`, `selesai1`, `selesai2`, `created_at`, `updated_at`) VALUES
(3, 0, 'SIMP/2023/01/0001', 'Welly', '19 Orang', 'Fairytale', 'Sulex', 3300000, '2023-01-21', 'Foto', 'Yes', 'No', '2023-01-15 14:14:05', '2023-01-18 16:13:34'),
(4, 0, 'SIMP/2023/01/0002', 'Ming & Ling', 'Aston Riverside', 'Tulip', 'Engagement', 18000000, '2023-01-14', 'Dekorasi', 'Yes', 'No', '2023-01-15 15:22:17', '2023-01-31 05:36:20'),
(5, 0, 'SIMP/2023/11/0001', 'Jay & Olivia', 'Rumah, Tambah videographer 3 juta', 'Jasmine Package Custom', 'Engagement', 15300000, '2023-11-18', 'Dekorasi', 'No', 'No', '2023-01-31 05:19:49', '2023-01-31 05:20:54'),
(6, 0, 'SIMP/2023/01/0003', 'SHINTA', '18 orang', 'Fairytale', 'Deni', 3300000, '2023-01-25', 'Foto', 'Yes', 'Yes', '2023-01-31 05:57:21', '2023-01-31 05:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `jurnals`
--

CREATE TABLE `jurnals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tipe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurnals`
--

INSERT INTO `jurnals` (`id`, `kode`, `keterangan`, `tanggal`, `tipe`, `created_at`, `updated_at`) VALUES
(15, 'JU-0223/0001', 'Pinjaman Bank BCA', '2023-02-01', 'Manual', '2023-02-16 09:50:23', '2023-02-16 09:50:23'),
(22, 'JO-BMJA2302-0-0002', 'Jurnal pembelian dengan Kode Transaksi BMJA2302-0-0002', '2023-02-16', 'Otomatis', '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(24, 'JO-PU-', 'Jurnal pelunasan Utang untuk Kode Transaksi BMJA2302-0-0002', '2023-02-16', 'Otomatis', '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(25, 'JO-PU-', 'Jurnal pelunasan Utang untuk Kode Transaksi BMJA2302-0-0003', '2023-02-16', 'Otomatis', '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(26, 'JO-BMJA2302-0-0003', 'Jurnal pembelian dengan Kode Transaksi BMJA2302-0-0003', '2023-02-16', 'Otomatis', '2023-02-16 14:46:08', '2023-02-16 14:46:08'),
(27, 'JO-PU-BMJA2302-0-0003', 'Jurnal pelunasan Utang untuk Kode Transaksi BMJA2302-0-0003', '2023-02-16', 'Otomatis', '2023-02-16 14:46:47', '2023-02-16 14:46:47'),
(29, 'JO-BKMJA2302-0-0001', 'Jurnal pembelian dengan Kode Transaksi BKMJA2302-0-0001', '2023-02-17', 'Otomatis', '2023-02-17 01:28:32', '2023-02-17 01:28:32'),
(33, 'JO-BKLMJA2302-0-0001', 'Jurnal pembelian dengan Kode Transaksi BKLMJA2302-0-0001', '2023-02-17', 'Otomatis', '2023-02-17 15:00:30', '2023-02-17 15:00:30'),
(36, 'JO-JMJA2302-0-0001', 'Jurnal penjualan dengan Kode Transaksi JMJA2302-0-0001', '2023-02-18', 'Otomatis', '2023-02-18 12:31:13', '2023-02-18 12:31:13'),
(37, 'JO-JMJA2302-0-0002', 'Jurnal penjualan dengan Kode Transaksi JMJA2302-0-0002', '2023-02-18', 'Otomatis', '2023-02-18 12:34:58', '2023-02-18 12:34:58'),
(38, 'JO-PP-JMJA2302-0-0002', 'Jurnal pelunasan Piutang untuk Kode Transaksi JMJA2302-0-0002', '2023-02-18', 'Otomatis', '2023-02-18 12:42:32', '2023-02-18 12:42:32'),
(43, 'JO-JKMJA2302-0-0001', 'Jurnal penjualan dengan Kode Transaksi JKMJA2302-0-0001', '2023-02-20', 'Otomatis', '2023-02-20 10:38:07', '2023-02-20 10:38:07'),
(47, 'JO-KM/2023/02/0001', 'Jurnal Pendapatan Lain Lain dengan kode KM/2023/02/0001', '2023-02-17', 'Otomatis', '2023-02-20 12:33:55', '2023-02-20 12:33:55'),
(48, 'JO-JD/2023/02/0001', 'Jurnal DP Penampung (Dropshipper Kontainer) dengan kode JD/2023/02/0001', '2023-02-22', 'Otomatis', '2023-02-21 11:42:40', '2023-02-21 11:42:40'),
(49, 'JO-JD/2023/02/0002', 'Jurnal DP Penampung (Dropshipper Kontainer) dengan kode JD/2023/02/0002', '2023-02-23', 'Otomatis', '2023-02-21 11:44:31', '2023-02-21 11:44:31'),
(58, 'JO-DP/2023/02/0001', 'Jurnal DP Penampung dengan kode DP/2023/02/0001', '2023-02-24', 'Otomatis', '2023-02-21 17:06:48', '2023-02-21 17:06:48'),
(59, 'JO-DP/2023/02/0002', 'Jurnal DP Penampung dengan kode DP/2023/02/0002', '2023-02-21', 'Otomatis', '2023-02-22 15:12:39', '2023-02-22 15:12:39'),
(63, 'JO-BP-JD/2023/02/0006', 'Jurnal Pelunasan Pembelian Kontainer dengan Kode Transaksi JD/2023/02/0006', '2023-02-22', 'Otomatis', '2023-02-22 16:20:34', '2023-02-22 16:20:34'),
(64, 'JO-BP-JD/2023/02/0005', 'Jurnal Pelunasan Pembelian Kontainer dengan Kode Transaksi JD/2023/02/0005', '2023-02-22', 'Otomatis', '2023-02-22 16:22:48', '2023-02-22 16:22:48'),
(65, 'JO-JP-JD/2023/02/0006', 'Jurnal Pelunasan Penjualan Dropshipper Kontainer dengan Kode Transaksi JD/2023/02/0006', '2023-02-22', 'Otomatis', '2023-02-22 16:39:50', '2023-02-22 16:39:50'),
(66, 'JO-JP-JD/2023/02/0005', 'Jurnal Pelunasan Penjualan Dropshipper Kontainer dengan Kode Transaksi JD/2023/02/0005', '2023-02-22', 'Otomatis', '2023-02-22 16:41:34', '2023-02-22 16:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_detils`
--

CREATE TABLE `jurnal_detils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_jurnals` int(10) NOT NULL DEFAULT 0,
  `kode_akun` int(10) NOT NULL DEFAULT 1101,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `nominal` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurnal_detils`
--

INSERT INTO `jurnal_detils` (`id`, `id_jurnals`, `kode_akun`, `keterangan`, `tipe`, `nominal`, `created_at`, `updated_at`) VALUES
(39, 15, 1102, NULL, 'D', 1000000000, '2023-02-16 09:50:23', '2023-02-16 09:50:23'),
(40, 15, 2301, NULL, 'K', 1000000000, '2023-02-16 09:50:23', '2023-02-16 09:50:23'),
(62, 22, 5101, 'Transaksi Pembelian BMJA2302-0-0002', 'D', 9725000, '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(63, 22, 5103, 'Transaksi Pembelian BMJA2302-0-0002', 'D', 200000, '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(64, 22, 2401, 'Transaksi Pembelian BMJA2302-0-0002', 'D', 1080750, '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(65, 22, 2101, 'Transaksi Pembelian BMJA2302-0-0002', 'K', 10905750, '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(66, 22, 5102, 'Transaksi Pembelian BMJA2302-0-0002', 'K', 100000, '2023-02-16 12:50:42', '2023-02-16 12:50:42'),
(71, 24, 2101, 'Pelunasan Utang Pembelian BMJA2302-0-0002', 'D', 10905750, '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(72, 24, 1103, 'Pelunasan Utang Pembelian BMJA2302-0-0002', 'K', 10905750, '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(73, 25, 2101, 'Pelunasan Utang Pembelian BMJA2302-0-0003', 'D', 7215000, '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(74, 25, 1103, 'Pelunasan Utang Pembelian BMJA2302-0-0003', 'K', 7215000, '2023-02-16 14:31:37', '2023-02-16 14:31:37'),
(75, 26, 5101, 'Transaksi Pembelian BMJA2302-0-0003', 'D', 6675000, '2023-02-16 14:46:08', '2023-02-16 14:46:08'),
(76, 26, 5103, 'Transaksi Pembelian BMJA2302-0-0003', 'D', 200000, '2023-02-16 14:46:08', '2023-02-16 14:46:08'),
(77, 26, 2401, 'Transaksi Pembelian BMJA2302-0-0003', 'D', 756250, '2023-02-16 14:46:08', '2023-02-16 14:46:08'),
(78, 26, 2101, 'Transaksi Pembelian BMJA2302-0-0003', 'K', 7631250, '2023-02-16 14:46:08', '2023-02-16 14:46:08'),
(79, 27, 2101, 'Pelunasan Utang Pembelian BMJA2302-0-0003', 'D', 416250, '2023-02-16 14:46:47', '2023-02-16 14:46:47'),
(80, 27, 1101, 'Pelunasan Utang Pembelian BMJA2302-0-0003', 'K', 416250, '2023-02-16 14:46:47', '2023-02-16 14:46:47'),
(85, 29, 5101, 'Transaksi Pembelian BKMJA2302-0-0001', 'D', 3687500, '2023-02-17 01:28:32', '2023-02-17 01:28:32'),
(86, 29, 5103, 'Transaksi Pembelian BKMJA2302-0-0001', 'D', 100000, '2023-02-17 01:28:32', '2023-02-17 01:28:32'),
(87, 29, 2101, 'Transaksi Pembelian BKMJA2302-0-0001', 'K', 3787500, '2023-02-17 01:28:32', '2023-02-17 01:28:32'),
(90, 33, 5101, 'Transaksi Pembelian BKLMJA2302-0-0001', 'D', 100000, '2023-02-17 15:00:30', '2023-02-17 15:00:30'),
(91, 33, 1101, 'Transaksi Pembelian BKLMJA2302-0-0001', 'K', 100000, '2023-02-17 15:00:30', '2023-02-17 15:00:30'),
(99, 36, 4101, 'Transaksi Penjualan JMJA2302-0-0001', 'K', 6000000, '2023-02-18 12:31:13', '2023-02-18 12:31:13'),
(100, 36, 2501, 'Transaksi Penjualan JMJA2302-0-0001', 'K', 660000, '2023-02-18 12:31:13', '2023-02-18 12:31:13'),
(101, 36, 1101, 'Transaksi Penjualan JMJA2302-0-0001', 'D', 6660000, '2023-02-18 12:31:13', '2023-02-18 12:31:13'),
(102, 37, 4101, 'Transaksi Penjualan JMJA2302-0-0002', 'K', 500000, '2023-02-18 12:34:58', '2023-02-18 12:34:58'),
(103, 37, 1201, 'Transaksi Penjualan JMJA2302-0-0002', 'D', 500000, '2023-02-18 12:34:58', '2023-02-18 12:34:58'),
(104, 38, 1201, 'Pelunasan Utang Pembelian JMJA2302-0-0002', 'K', 500000, '2023-02-18 12:42:32', '2023-02-18 12:42:32'),
(105, 38, 1101, 'Pelunasan Utang Pembelian JMJA2302-0-0002', 'D', 500000, '2023-02-18 12:42:32', '2023-02-18 12:42:32'),
(114, 43, 4101, 'Transaksi Penjualan JKMJA2302-0-0001', 'K', 9000000, '2023-02-20 10:38:07', '2023-02-20 10:38:07'),
(115, 43, 2501, 'Transaksi Penjualan JKMJA2302-0-0001', 'K', 990000, '2023-02-20 10:38:07', '2023-02-20 10:38:07'),
(116, 43, 1201, 'Transaksi Penjualan JKMJA2302-0-0001', 'D', 9990000, '2023-02-20 10:38:07', '2023-02-20 10:38:07'),
(123, 47, 1102, 'Pendapatan Lain Lain dengan kode ', 'D', 500000000, '2023-02-20 12:33:55', '2023-02-20 12:33:55'),
(124, 47, 7103, 'Pendapatan Lain Lain dengan kode ', 'K', 500000000, '2023-02-20 12:33:55', '2023-02-20 12:33:55'),
(125, 48, 2103, 'DP Penampung (Dropshipper Kontainer) dengan kode ', 'D', 60000000, '2023-02-21 11:42:40', '2023-02-21 11:42:40'),
(126, 48, 1101, 'DP Penampung (Dropshipper Kontainer) dengan kode ', 'K', 60000000, '2023-02-21 11:42:40', '2023-02-21 11:42:40'),
(127, 49, 2103, 'DP Penampung (Dropshipper Kontainer) dengan kode ', 'D', 100000000, '2023-02-21 11:44:31', '2023-02-21 11:44:31'),
(128, 49, 1102, 'DP Penampung (Dropshipper Kontainer) dengan kode ', 'K', 100000000, '2023-02-21 11:44:31', '2023-02-21 11:44:31'),
(145, 58, 1102, 'DP Penampung DP/2023/02/0001', 'K', 70000000, '2023-02-21 17:06:48', '2023-02-21 17:06:48'),
(146, 58, 2103, 'DP Penampung DP/2023/02/0001', 'D', 70000000, '2023-02-21 17:06:48', '2023-02-21 17:06:48'),
(147, 59, 1102, 'DP Penampung DP/2023/02/0002', 'K', 100000000, '2023-02-22 15:12:39', '2023-02-22 15:12:39'),
(148, 59, 2103, 'DP Penampung DP/2023/02/0002', 'D', 100000000, '2023-02-22 15:12:39', '2023-02-22 15:12:39'),
(161, 63, 5201, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0006', 'D', 80000000, '2023-02-22 16:20:34', '2023-02-22 16:20:34'),
(162, 63, 5202, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0006', 'D', 5000000, '2023-02-22 16:20:34', '2023-02-22 16:20:34'),
(163, 63, 2103, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0006', 'K', 100000000, '2023-02-22 16:20:34', '2023-02-22 16:20:34'),
(164, 63, 2103, 'Penambahan Utang (Beli Rugi) Pelunasan Pembelian Kontainer  JD/2023/02/0006', 'D', 15000000, '2023-02-22 16:20:34', '2023-02-22 16:20:34'),
(165, 64, 5201, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0005', 'D', 40000000, '2023-02-22 16:22:48', '2023-02-22 16:22:48'),
(166, 64, 5202, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0005', 'D', 5000000, '2023-02-22 16:22:48', '2023-02-22 16:22:48'),
(167, 64, 2103, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0005', 'K', 30000000, '2023-02-22 16:22:48', '2023-02-22 16:22:48'),
(168, 64, 1102, 'Transaksi Pelunasan Pembelian Kontainer  JD/2023/02/0005', 'K', 15000000, '2023-02-22 16:22:48', '2023-02-22 16:22:48'),
(169, 65, 1101, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0006', 'D', 85500000, '2023-02-22 16:39:50', '2023-02-22 16:39:50'),
(170, 65, 4202, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0006', 'D', 500000, '2023-02-22 16:39:50', '2023-02-22 16:39:50'),
(171, 65, 4201, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0006', 'K', 86000000, '2023-02-22 16:39:50', '2023-02-22 16:39:50'),
(172, 66, 1101, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0005', 'D', 41850000, '2023-02-22 16:41:34', '2023-02-22 16:41:34'),
(173, 66, 4202, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0005', 'D', 150000, '2023-02-22 16:41:34', '2023-02-22 16:41:34'),
(174, 66, 4201, 'Transaksi Pelunasan Penjualan Kontainer  JD/2023/02/0005', 'K', 42000000, '2023-02-22 16:41:34', '2023-02-22 16:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_detils_temp`
--

CREATE TABLE `jurnal_detils_temp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `kode_akun` int(10) NOT NULL DEFAULT 1101,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `nominal` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barangs`
--

CREATE TABLE `kategori_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_barangs`
--

INSERT INTO `kategori_barangs` (`id`, `kode`, `nama`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'BS', 'BESI', 'BESI', 'Active', '2023-02-05 10:50:36', '2023-02-05 10:50:36'),
(2, 'JASA', 'JASA', 'JASA', 'Active', '2023-02-05 10:50:44', '2023-02-05 10:50:44'),
(3, 'KT', 'KERTAS', 'KERTAS', 'Active', '2023-02-05 10:50:54', '2023-02-05 10:50:54'),
(4, 'KU', 'KUNINGAN', 'KUNINGAN', 'Active', '2023-02-05 10:51:04', '2023-02-05 10:51:04'),
(5, 'LG', 'LOGAM', 'LOGAM', 'Active', '2023-02-05 10:51:13', '2023-02-05 10:51:13'),
(6, 'LN', 'LAIN-LAIN', 'LAIN-LAIN', 'Active', '2023-02-05 10:51:25', '2023-02-05 10:51:25'),
(7, 'UM', 'UMUM', '-', 'Active', '2023-02-05 10:51:34', '2023-02-05 10:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pengeluarans`
--

CREATE TABLE `kategori_pengeluarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_pengeluarans`
--

INSERT INTO `kategori_pengeluarans` (`id`, `nama`, `aktif`, `created_at`, `updated_at`) VALUES
(0, 'Pembayaran Upah Freelancer', 'Active', '2022-04-08 06:03:54', '2022-04-08 06:03:54'),
(1, 'Pembayaran Utilitas', 'Active', '2022-03-20 12:06:36', '2022-03-20 12:06:36'),
(2, 'Pembayaran Gaji', 'Active', '2022-03-20 12:06:52', '2022-03-20 12:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `konsumens`
--

CREATE TABLE `konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsumens`
--

INSERT INTO `konsumens` (`id`, `kode`, `nama`, `alamat`, `no_hp`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'ACE', 'ACE SIANTAN', '-', '0', '-', 'Active', '2023-02-08 14:34:42', '2023-02-08 14:35:26'),
(2, 'AGUS', 'AGUS', '-', '0', '-', 'Active', '2023-02-08 14:34:54', '2023-02-08 14:34:54'),
(3, 'AHON', 'PAK AHON', '-', '0', '-', 'Active', '2023-02-08 14:35:02', '2023-02-08 14:35:02'),
(4, 'ASTER', 'ASTERIUS ARIFIANTO', '-', '0', '-', 'Active', '2023-02-08 14:35:13', '2023-02-08 14:35:13'),
(5, 'CASH', 'CASH', '-', '0', '-', 'Active', '2023-02-18 05:51:36', '2023-02-18 05:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_clients` int(10) NOT NULL,
  `no_inv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `tanggal_pelunasan` date DEFAULT NULL,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `terbayar` double DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-paid',
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Foto',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `id_clients`, `no_inv`, `tanggal`, `jatuh_tempo`, `tanggal_pelunasan`, `subtotal`, `diskon`, `pajak`, `total`, `terbayar`, `status`, `foto`, `tipe`, `created_at`, `updated_at`) VALUES
(33, 3, 'INV-23/01-0-0001', '2023-01-19', '2023-01-21', '2023-01-19', 200000, 0, 0, 200000, 200000, 'paid', NULL, 'Foto', '2023-01-16 16:44:35', '2023-01-18 18:00:39'),
(34, 3, 'INV-23/01-0-0002', '2023-01-14', '2023-01-22', '2023-01-17', 200000, 0, 0, 200000, 200000, 'paid', NULL, 'Foto', '2023-01-16 16:44:48', '2023-01-16 17:00:26'),
(35, 4, 'INV-23/01-0-0003', '2023-01-16', '2023-01-23', '2023-01-19', 200000, 0, 0, 200000, 200000, 'paid', NULL, 'Dekorasi', '2023-01-16 17:00:02', '2023-01-18 17:34:08'),
(36, 4, 'INV-23/01-0-0004', '2023-01-11', '2023-01-25', '2023-01-19', 15000000, 0, 0, 15000000, 15000000, 'paid', NULL, 'Dekorasi', '2023-01-18 17:35:09', '2023-01-18 17:35:19'),
(37, 5, 'INV-23/01-0-0005', '2023-01-31', '2023-02-07', NULL, 6250000, 0, 0, 6250000, 0, 'not-paid', NULL, 'Dekorasi', '2023-01-31 05:24:26', '2023-01-31 05:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_payments` int(10) NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL DEFAULT 0,
  `qty` double NOT NULL DEFAULT 1,
  `total` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `id_payments`, `nama`, `nominal`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(3, 2, 'Biaya Pendaftaran Awal - Khusus', 250000, 1, 0, '2022-04-02 11:08:36', '2022-04-02 11:08:36'),
(4, 2, 'Biaya Buku', 150000, 1, 0, '2022-04-02 11:08:36', '2022-04-02 11:08:36'),
(5, 3, 'Biaya Pendaftaran Awal', 200000, 1, 0, '2022-04-02 12:08:10', '2022-04-02 12:08:10'),
(10, 20, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-03 12:41:41', '2022-04-03 12:41:41'),
(11, 21, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-03 12:41:41', '2022-04-03 12:41:41'),
(13, 23, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-03 12:41:41', '2022-04-03 12:41:41'),
(14, 24, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-03 13:12:44', '2022-04-03 13:12:44'),
(16, 26, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-03 13:12:44', '2022-04-03 13:12:44'),
(20, 28, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-06 03:40:31', '2022-04-06 03:40:31'),
(21, 29, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-06 03:40:32', '2022-04-06 03:40:32'),
(22, 30, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-06 03:40:32', '2022-04-06 03:40:32'),
(23, 31, 'Biaya SPP Bulanan', 500000, 1, 0, '2022-04-06 03:40:32', '2022-04-06 03:40:32'),
(24, 30, 'Biaya Buku', 150000, 1, 0, '2022-04-06 03:40:44', '2022-04-06 03:40:44'),
(25, 32, 'Biaya Design', 100000, 3, 300000, '2022-06-08 05:40:56', '2022-06-08 05:40:56'),
(26, 32, 'Biaya Take & Edit Video', 200000, 5, 1000000, '2022-06-08 05:40:56', '2022-06-08 06:06:34'),
(27, 32, 'Brand Media Advertising Bulan', 3500000, 1, 3500000, '2022-06-08 06:05:09', '2022-06-08 06:06:27'),
(28, 32, 'Biaya Design', 100000, 1, 100000, '2022-06-08 06:08:38', '2022-06-08 06:08:38'),
(29, 33, 'Biaya Take & Edit Video', 200000, 1, 200000, '2023-01-16 16:44:35', '2023-01-16 16:44:35'),
(30, 34, 'Biaya Take & Edit Video', 200000, 1, 200000, '2023-01-16 16:44:48', '2023-01-16 16:44:48'),
(31, 35, 'Biaya Take & Edit Video', 200000, 1, 200000, '2023-01-16 17:00:02', '2023-01-16 17:00:02'),
(32, 36, 'Pelunasan Dekorasi', 15000000, 1, 15000000, '2023-01-18 17:35:09', '2023-01-18 17:35:09'),
(33, 37, 'DP', 6250000, 1, 6250000, '2023-01-31 05:24:26', '2023-01-31 05:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details_temp`
--

CREATE TABLE `payment_details_temp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_inv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL DEFAULT 0,
  `qty` double NOT NULL DEFAULT 1,
  `total` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukans`
--

CREATE TABLE `pemasukans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `akun_kas` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `akun_pendapatan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '7101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemasukans`
--

INSERT INTO `pemasukans` (`id`, `id_users`, `akun_kas`, `akun_pendapatan`, `kode`, `keterangan`, `nominal`, `tanggal`, `created_at`, `updated_at`) VALUES
(2, 0, '1102', '7103', 'KM/2023/02/0001', 'Pendapatan', 500000000, '2023-02-17', '2023-02-20 12:33:37', '2023-02-20 12:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_freelancers`
--

CREATE TABLE `pembayaran_freelancers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_user_pelunasan` int(10) DEFAULT NULL,
  `id_kategori_pengeluarans` int(10) NOT NULL,
  `id_freelancers` int(10) DEFAULT NULL,
  `id_clients` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-paid',
  `tanggal_pelunasan` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelians`
--

CREATE TABLE `pembelians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penampungs` int(10) NOT NULL DEFAULT 0,
  `tipe_pembelian` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode_harga_belis` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_plat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sopir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `bruto` double NOT NULL DEFAULT 0,
  `tara` double NOT NULL DEFAULT 0,
  `netto` double NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `uang_pegangan` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelians`
--

INSERT INTO `pembelians` (`id`, `id_penampungs`, `tipe_pembelian`, `kode_harga_belis`, `kode_akun`, `kode`, `no_plat`, `sopir`, `kategori`, `tanggal`, `pembayaran`, `jatuh_tempo`, `keterangan`, `biaya_tambahan`, `subtotal`, `diskon`, `pajak`, `grandtotal`, `bruto`, `tara`, `netto`, `status`, `sisa`, `uang_pegangan`, `created_at`, `updated_at`) VALUES
(9, 2, 'Umum', 'L05', '1101', 'BMJA2302-0-0001', 'KB 1231 XY', 'UUS', 'Logam', '2023-02-16', 'Cash', NULL, '-', 0, 0, 0, 0, 0, 0, 0, 0, 'Belum Selesai', 0, 0, '2023-02-16 12:40:55', '2023-02-16 12:40:55'),
(10, 1, 'Umum', 'L08', '2101', 'BMJA2302-0-0002', 'KB 9182 IC', 'AAN', 'Logam', '2023-02-16', 'Credit', NULL, '-', 200000, 9725000, 100000, 1080750, 10905750, 1000, 100, 900, 'Selesai', 0, 0, '2023-02-16 12:41:24', '2023-02-16 14:31:37'),
(11, 1, 'Umum', 'L08', '2101', 'BMJA2302-0-0003', 'KB 1028 AS', 'AAN', 'Logam', '2023-02-16', 'Credit', NULL, '-', 200000, 6675000, 0, 756250, 7631250, 1000, 50, 950, 'Selesai', 0, 0, '2023-02-16 12:52:20', '2023-02-16 14:46:47'),
(12, 2, 'Khusus', 'L05', '2101', 'BKMJA2302-0-0001', 'KB 1028 KB', 'AAN', 'Logam', '2023-02-17', 'Credit', NULL, '-', 100000, 3687500, 0, 0, 3787500, 500, 0, 500, 'Selesai', 3787500, 0, '2023-02-17 00:34:02', '2023-02-17 01:28:32'),
(15, 2, 'Keliling', 'L05', '1101', 'BKLMJA2302-0-0001', 'KB 8287 KI', 'AGUS', 'Logam', '2023-02-17', 'Cash', NULL, '-', 0, 100000, 0, 0, 100000, 300, 290, 10, 'Selesai', 0, 500000, '2023-02-17 14:34:57', '2023-02-17 15:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_details`
--

CREATE TABLE `pembelian_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pembelians` int(10) NOT NULL DEFAULT 0,
  `id_barang_belis` int(10) NOT NULL DEFAULT 0,
  `bruto` double NOT NULL DEFAULT 0,
  `waktu_timbang_bruto` timestamp NULL DEFAULT NULL,
  `tara` double NOT NULL DEFAULT 0,
  `waktu_timbang_tara` timestamp NULL DEFAULT NULL,
  `netto` double NOT NULL DEFAULT 0,
  `potongan` double NOT NULL DEFAULT 0,
  `total_beli` double NOT NULL DEFAULT 0,
  `harga` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capture1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capture2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian_details`
--

INSERT INTO `pembelian_details` (`id`, `id_pembelians`, `id_barang_belis`, `bruto`, `waktu_timbang_bruto`, `tara`, `waktu_timbang_tara`, `netto`, `potongan`, `total_beli`, `harga`, `subtotal`, `catatan`, `capture1`, `capture2`, `aktif`, `created_at`, `updated_at`) VALUES
(35, 10, 26, 1000, '2023-02-16 12:41:41', 600, '2023-02-16 12:41:48', 400, 0, 400, 15000, 6000000, NULL, NULL, NULL, 'Active', '2023-02-16 12:41:41', '2023-02-16 12:42:00'),
(36, 10, 24, 600, '2023-02-16 12:42:10', 300, '2023-02-16 12:42:19', 300, 0, 300, 7000, 2100000, NULL, NULL, NULL, 'Active', '2023-02-16 12:42:10', '2023-02-16 12:42:19'),
(37, 10, 25, 300, '2023-02-16 12:49:15', 150, '2023-02-16 12:49:21', 150, 0, 150, 7500, 1125000, NULL, NULL, NULL, 'Active', '2023-02-16 12:49:15', '2023-02-16 12:49:21'),
(38, 10, 27, 150, '2023-02-16 12:50:21', 100, '2023-02-16 12:50:27', 50, 0, 50, 10000, 500000, NULL, NULL, NULL, 'Active', '2023-02-16 12:50:21', '2023-02-16 12:50:27'),
(39, 11, 24, 1000, '2023-02-16 12:52:41', 100, '2023-02-16 12:52:46', 900, 0, 900, 7000, 6300000, NULL, NULL, NULL, 'Active', '2023-02-16 12:52:41', '2023-02-16 12:52:46'),
(40, 11, 25, 100, '2023-02-16 14:45:59', 50, '2023-02-16 14:46:04', 50, 0, 50, 7500, 375000, NULL, NULL, NULL, 'Active', '2023-02-16 14:45:59', '2023-02-16 14:46:04'),
(41, 12, 25, 500, '2023-02-17 00:58:37', 50, '2023-02-17 00:58:45', 450, 5, 445, 7500, 3337500, NULL, NULL, NULL, 'Active', '2023-02-17 00:58:37', '2023-02-17 00:58:45'),
(42, 12, 24, 50, '2023-02-17 01:28:22', 0, '2023-02-17 01:28:26', 50, 0, 50, 7000, 350000, NULL, NULL, NULL, 'Active', '2023-02-17 01:28:22', '2023-02-17 01:28:26'),
(43, 15, 24, 300, '2023-02-17 15:00:17', 290, '2023-02-17 15:00:24', 10, 0, 10, 10000, 100000, NULL, NULL, NULL, 'Active', '2023-02-17 15:00:17', '2023-02-17 15:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `penampungs`
--

CREATE TABLE `penampungs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_harga_umum` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_harga_logam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utang_dp` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penampungs`
--

INSERT INTO `penampungs` (`id`, `kode_harga_umum`, `kode_harga_logam`, `kode`, `nama`, `alamat`, `no_hp`, `keterangan`, `utang_dp`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'H02', 'L08', 'AAN PEKAP', 'AAN PEKAP', '-', '0', '-', 0, 'Active', '2023-02-22 02:25:01', '2023-02-08 12:26:48'),
(2, 'H03', 'L05', 'AAN SAMARINDA', 'AAN SAMARINDA', '-', '0', '-', 0, 'Active', '2023-02-22 12:18:12', '2023-02-08 12:36:53'),
(3, 'H03', 'L05', 'ABAN', 'ABAN', '-', '0', '-', 15000000, 'Active', '2023-02-22 16:20:34', '2023-02-08 12:37:26'),
(4, 'H03', 'L05', 'ABAN TERENTANG', 'ABAN TERENTANG', '-', '0', '-', 0, 'Active', '2023-02-08 12:37:52', '2023-02-08 12:37:52'),
(5, 'H02', 'L08', 'ABAS KAPAL', 'ABAS KAPAL', '-', '0', '-', 0, 'Active', '2023-02-08 12:38:17', '2023-02-08 12:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluarans`
--

CREATE TABLE `pengeluarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_kategori_pengeluarans` int(10) NOT NULL,
  `akun_kas` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `akun_beban` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengeluarans`
--

INSERT INTO `pengeluarans` (`id`, `id_users`, `id_kategori_pengeluarans`, `akun_kas`, `akun_beban`, `kode`, `keterangan`, `nominal`, `tanggal`, `created_at`, `updated_at`) VALUES
(2, 0, 2, '1101', '6101', 'KK/2023/01/0001', 'Bayar Gaji Karyawan', 10000000, '2023-01-05', '2023-01-18 17:18:09', '2023-01-18 17:18:09'),
(3, 0, 1, '1101', '6101', 'KK/2023/01/0002', 'Beli Token Listrik', 500000, '2023-01-22', '2023-01-18 17:19:03', '2023-01-18 17:19:03'),
(4, 0, 2, '1101', '6101', 'KK/2023/01/0003', 'gaji welly', 1500000, '2023-01-31', '2023-01-31 05:44:30', '2023-01-31 05:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_projects`
--

CREATE TABLE `pengeluaran_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_jadwals` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengeluaran_projects`
--

INSERT INTO `pengeluaran_projects` (`id`, `id_users`, `id_jadwals`, `kode`, `keterangan`, `nominal`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 0, 4, 'KKP/2023/01/0001', 'Beli Bunga', 500000, '2023-01-17', '2023-01-16 17:35:11', '2023-01-16 17:35:11'),
(2, 0, 3, 'KKP/2023/01/0002', 'Beli Cat', 100000, '2023-01-17', '2023-01-16 17:35:29', '2023-01-16 17:35:29'),
(3, 0, 5, 'KKP/2023/01/0003', 'beli bunga baru', 10000000, '2023-01-31', '2023-01-31 05:46:17', '2023-01-31 05:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `penjualans`
--

CREATE TABLE `penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `tipe_penjualan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode_harga_juals` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_plat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sopir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `bruto` double NOT NULL DEFAULT 0,
  `tara` double NOT NULL DEFAULT 0,
  `netto` double NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualans`
--

INSERT INTO `penjualans` (`id`, `id_konsumens`, `tipe_penjualan`, `kode_harga_juals`, `kode_akun`, `kode`, `no_plat`, `sopir`, `kategori`, `tanggal`, `pembayaran`, `jatuh_tempo`, `keterangan`, `biaya_tambahan`, `subtotal`, `diskon`, `pajak`, `grandtotal`, `bruto`, `tara`, `netto`, `status`, `sisa`, `created_at`, `updated_at`) VALUES
(2, 4, 'Umum', 'HJ01', '1101', 'JMJA2302-0-0001', 'KB 2948 KG', 'AAN', 'Logam', '2023-02-18', 'Cash', NULL, '-', 0, 6000000, 0, 660000, 6660000, 700, 190, 510, 'Selesai', 0, '2023-02-18 12:19:07', '2023-02-18 12:31:13'),
(3, 3, 'Umum', 'HJ03', '1201', 'JMJA2302-0-0002', 'KB 9103 IB', 'AHON', 'Logam', '2023-02-18', 'Credit', NULL, '-', 0, 500000, 0, 0, 500000, 400, 300, 100, 'Selesai', 0, '2023-02-18 12:33:19', '2023-02-18 12:42:32'),
(4, 3, 'Kontainer', 'HJ06', '1201', 'JKMJA2302-0-0001', 'SPNU 2794790', '920384', 'Logam', '2023-02-20', 'Credit', NULL, 'MJA SKW', 0, 9000000, 0, 990000, 9990000, 1000, 0, 1000, 'Selesai', 9990000, '2023-02-19 22:52:30', '2023-02-20 10:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_details`
--

CREATE TABLE `penjualan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_barang_juals` int(10) NOT NULL DEFAULT 0,
  `bruto` double NOT NULL DEFAULT 0,
  `waktu_timbang_bruto` timestamp NULL DEFAULT NULL,
  `tara` double NOT NULL DEFAULT 0,
  `waktu_timbang_tara` timestamp NULL DEFAULT NULL,
  `netto` double NOT NULL DEFAULT 0,
  `potongan` double NOT NULL DEFAULT 0,
  `total_jual` double NOT NULL DEFAULT 0,
  `harga` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capture1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capture2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_details`
--

INSERT INTO `penjualan_details` (`id`, `id_penjualans`, `id_barang_juals`, `bruto`, `waktu_timbang_bruto`, `tara`, `waktu_timbang_tara`, `netto`, `potongan`, `total_jual`, `harga`, `subtotal`, `catatan`, `capture1`, `capture2`, `aktif`, `created_at`, `updated_at`) VALUES
(4, 2, 18, 700, '2023-02-18 12:19:22', 190, '2023-02-18 12:19:31', 510, 10, 500, 12000, 6000000, NULL, NULL, NULL, 'Active', '2023-02-18 12:19:22', '2023-02-18 12:29:53'),
(5, 3, 18, 400, '2023-02-18 12:34:07', 300, '2023-02-18 12:34:14', 100, 0, 100, 5000, 500000, NULL, NULL, NULL, 'Active', '2023-02-18 12:34:07', '2023-02-18 12:34:14'),
(6, 4, 18, 1000, '2023-02-19 23:20:29', 0, '2023-02-19 23:20:38', 1000, 0, 1000, 9000, 9000000, NULL, NULL, NULL, 'Active', '2023-02-19 23:20:29', '2023-02-20 10:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `tagihans`
--

CREATE TABLE `tagihans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihans`
--

INSERT INTO `tagihans` (`id`, `nama`, `nominal`, `aktif`, `created_at`, `updated_at`) VALUES
(2, 'DP / FP Pembuatan Website', 3000000, 'Active', '2022-03-20 08:51:24', '2022-06-08 05:04:36'),
(3, 'Biaya Design', 100000, 'Active', '2022-03-20 08:51:33', '2022-06-08 05:04:22'),
(4, 'Brand Media Advertising Bulan', 3500000, 'Active', '2022-03-20 08:51:43', '2022-06-08 05:04:59'),
(5, 'Biaya Take & Edit Video', 200000, 'Active', '2022-06-08 05:05:21', '2022-06-08 05:05:21'),
(6, 'DP Fairytale', 990000, 'Active', '2023-01-31 05:23:59', '2023-01-31 05:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `tagihans_dekorasi`
--

CREATE TABLE `tagihans_dekorasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihans_dekorasi`
--

INSERT INTO `tagihans_dekorasi` (`id`, `nama`, `nominal`, `aktif`, `created_at`, `updated_at`) VALUES
(6, 'White Lily', 5500000, 'Active', '2023-01-15 14:00:56', '2023-01-15 15:04:01'),
(7, 'Tulip', 18000000, 'Active', '2023-01-15 14:01:06', '2023-01-15 15:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `tagihans_studio`
--

CREATE TABLE `tagihans_studio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihans_studio`
--

INSERT INTO `tagihans_studio` (`id`, `nama`, `nominal`, `aktif`, `created_at`, `updated_at`) VALUES
(6, 'Fairytale', 3300000, 'Active', '2023-01-15 14:00:56', '2023-01-15 14:00:56'),
(7, 'Timeless', 4500000, 'Active', '2023-01-15 14:01:06', '2023-01-15 14:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `uec_classes`
--

CREATE TABLE `uec_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_lectures` int(10) NOT NULL,
  `id_levels` int(10) NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jam` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Open',
  `tanggalmulai` date DEFAULT NULL,
  `tanggalselesai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_classes`
--

INSERT INTO `uec_classes` (`id`, `id_lectures`, `id_levels`, `nama`, `hari`, `jam`, `status`, `tanggalmulai`, `tanggalselesai`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 'hfgdh', 'asdf', '12:31 - 23:23', 'Selesai', '2022-03-02', '2022-03-31', '2022-03-29 09:54:16', '2022-03-29 15:44:07'),
(2, 1, 19, 'Coba Kelas123', NULL, NULL, 'Open', '2022-03-01', '2022-03-10', '2022-03-29 10:00:14', '2022-03-29 15:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `uec_class_pelajarans`
--

CREATE TABLE `uec_class_pelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_classes` int(10) NOT NULL,
  `id_pelajarans` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_class_pelajarans`
--

INSERT INTO `uec_class_pelajarans` (`id`, `id_classes`, `id_pelajarans`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2022-03-29 11:42:15', '2022-03-29 11:42:15'),
(2, 2, 1, '2022-03-29 11:44:40', '2022-03-29 11:44:40'),
(4, 2, 2, '2022-03-29 11:46:41', '2022-03-29 11:46:41'),
(5, 1, 1, '2022-03-29 12:29:48', '2022-03-29 12:29:48'),
(6, 1, 2, '2022-03-29 12:29:51', '2022-03-29 12:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `uec_class_students`
--

CREATE TABLE `uec_class_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_classes` int(10) NOT NULL,
  `id_students` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_class_students`
--

INSERT INTO `uec_class_students` (`id`, `id_classes`, `id_students`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2022-03-29 11:57:12', '2022-03-29 11:57:12'),
(3, 1, 4, '2022-03-29 12:29:56', '2022-03-29 12:29:56'),
(4, 1, 2, '2022-03-29 14:48:17', '2022-03-29 14:48:17'),
(5, 1, 5, '2022-03-29 14:48:20', '2022-03-29 14:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `uec_lectures`
--

CREATE TABLE `uec_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `tempatlahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggallahir` date NOT NULL,
  `tanggalmulai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_lectures`
--

INSERT INTO `uec_lectures` (`id`, `nama`, `jk`, `nohp`, `email`, `alamat`, `aktif`, `tempatlahir`, `tanggallahir`, `tanggalmulai`, `created_at`, `updated_at`) VALUES
(1, 'asdf123', 'Laki-Laki', '0816-5111-23', 'asdf123', 'asdf123', 'Active', 'asdf123', '2022-01-05', '2021-11-18', '2022-03-20 09:50:36', '2022-03-20 09:50:57'),
(2, 'qewr', 'Laki-Laki', '0819-2312-3123', 'wellygusnaidi@gmail.com', 'Jln. asdf', 'Active', 'Pontianak', '2022-04-13', '2022-04-23', '2022-04-07 09:37:37', '2022-04-07 09:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `uec_levels`
--

CREATE TABLE `uec_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_levels`
--

INSERT INTO `uec_levels` (`id`, `nama`, `aktif`, `created_at`, `updated_at`) VALUES
(0, 'Wait-List', 'Active', NULL, NULL),
(1, 'K2', 'Active', '2022-03-20 08:58:06', '2022-03-20 09:01:37'),
(2, 'Pre-Elementary 1\r\n', 'Active', '2022-03-20 08:58:03', '2022-03-20 08:58:03'),
(4, 'Pre-Elementary 1+', 'Active', '2022-03-20 09:03:18', '2022-03-20 09:03:18'),
(5, 'Pre-Elementary 2', 'Active', '2022-03-20 09:03:27', '2022-03-20 09:03:27'),
(6, 'Pre-Elementary 2+', 'Active', '2022-03-20 09:03:31', '2022-03-20 09:03:31'),
(7, 'Pre-Elementary 3', 'Active', '2022-03-20 09:03:36', '2022-03-20 09:03:36'),
(8, 'Pre-Elementary 3+', 'Active', '2022-03-20 09:03:46', '2022-03-20 09:03:46'),
(9, 'Pre-Elementary 4', 'Active', '2022-03-20 09:03:51', '2022-03-20 09:03:51'),
(10, 'Pre-Elementary 4+', 'Active', '2022-03-20 09:03:56', '2022-03-20 09:03:56'),
(11, 'Elementary 1', 'Active', '2022-03-20 09:04:09', '2022-03-20 09:04:09'),
(12, 'Elementary 1+', 'Active', '2022-03-20 09:04:13', '2022-03-20 09:04:13'),
(13, 'Elementary 2', 'Active', '2022-03-20 09:04:17', '2022-03-20 09:04:17'),
(14, 'Elementary 2+', 'Active', '2022-03-20 09:04:21', '2022-03-20 09:04:21'),
(15, 'Pre-Intermediate 1', 'Active', '2022-03-20 09:04:29', '2022-03-20 09:04:29'),
(16, 'Pre-Intermediate 2', 'Active', '2022-03-20 09:04:34', '2022-03-20 09:04:34'),
(17, 'Intermediate 1', 'Active', '2022-03-20 09:04:41', '2022-03-20 09:04:41'),
(18, 'Intermediate 2', 'Active', '2022-03-20 09:04:45', '2022-03-20 09:04:45'),
(19, 'Advanced 1', 'Active', '2022-03-20 09:04:51', '2022-03-20 09:04:51'),
(20, 'Advanced 2', 'Active', '2022-03-20 09:04:56', '2022-03-20 09:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `uec_log_students`
--

CREATE TABLE `uec_log_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_students` int(10) NOT NULL,
  `status_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_log_students`
--

INSERT INTO `uec_log_students` (`id`, `id_students`, `status_from`, `status_to`, `created_at`, `updated_at`) VALUES
(1, 1, 'Wait-List', 'Student', '2022-03-26 12:35:51', '2022-03-26 12:35:51'),
(2, 2, 'Wait-List', 'Student', '2022-03-26 12:37:06', '2022-03-26 12:37:06'),
(3, 2, 'Student', 'Off', '2022-03-26 12:37:25', '2022-03-26 12:37:25'),
(4, 2, 'Off', 'Reactive', '2022-03-26 12:37:45', '2022-03-26 12:37:45'),
(5, 4, 'Cuti', 'Off', '2022-03-26 12:38:28', '2022-03-26 12:38:28'),
(6, 4, 'Off', 'Reactive', '2022-03-26 12:38:48', '2022-03-26 12:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `uec_parents`
--

CREATE TABLE `uec_parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_parents`
--

INSERT INTO `uec_parents` (`id`, `nama`, `nohp`, `email`, `alamat`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'asdf123', '1231-2312-31890', 'asdf123', 'asdf123', 'Active', '2022-03-20 07:44:49', '2022-03-20 07:49:13'),
(2, 'Welly', '0819-3196-9698', 'wellygusnaidi@gmail.com', 'Jln. H.O.S Cokroaminoto Gg. Bungur No. 18E', 'Active', '2022-03-20 07:54:51', '2022-03-20 07:54:51'),
(3, 'asdf', 'adsfasdfasdf', 'asdf', 'asdf', 'Active', '2022-03-20 07:57:35', '2022-03-20 07:57:35'),
(4, '123', '123', '123', '123', 'Active', '2022-03-20 08:16:47', '2022-03-20 08:16:47'),
(5, '234', '234', '234', '234', 'Active', '2022-03-20 08:17:08', '2022-03-20 08:17:08'),
(6, 'zxcv', 'qer', 'azcv', 'zcvzcxv', 'Active', '2022-03-20 08:18:20', '2022-03-20 08:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `uec_pelajarans`
--

CREATE TABLE `uec_pelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_pelajarans`
--

INSERT INTO `uec_pelajarans` (`id`, `nama`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'CONVERSATION', 'Active', '2022-03-20 09:08:40', '2022-03-20 09:10:48'),
(2, 'LISTENING', 'Active', '2022-03-20 09:08:46', '2022-03-20 09:10:35'),
(3, 'COMPOSITION', 'Active', '2022-03-20 09:08:51', '2022-03-20 09:11:16'),
(4, 'DICTATION', 'Active', '2022-03-20 09:08:56', '2022-03-20 09:10:20'),
(5, 'STRUCTURE AND VOCABULARY', 'Active', '2022-03-20 09:09:34', '2022-03-20 09:09:34'),
(6, 'READING ALOUD / READING COMPREHENSION', 'Active', '2022-03-20 09:10:07', '2022-03-20 09:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `uec_reports`
--

CREATE TABLE `uec_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_students` int(10) NOT NULL,
  `id_classes` int(10) NOT NULL,
  `id_pelajarans` int(10) NOT NULL,
  `nilai` int(10) NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_reports`
--

INSERT INTO `uec_reports` (`id`, `id_students`, `id_classes`, `id_pelajarans`, `nilai`, `keterangan`, `created_at`, `updated_at`) VALUES
(6, 1, 2, 1, 90, '', '2022-03-29 14:48:49', '2022-03-30 03:17:39'),
(7, 1, 2, 2, 50, '', '2022-03-29 14:48:49', '2022-03-29 15:44:32'),
(8, 1, 2, 4, 90, '', '2022-03-29 14:48:49', '2022-03-29 15:44:34'),
(9, 3, 1, 5, 50, NULL, '2022-03-29 14:48:56', '2022-03-29 15:31:05'),
(10, 3, 1, 6, 80, '50', '2022-03-29 14:48:56', '2022-03-29 15:31:00'),
(11, 4, 1, 5, 80, NULL, '2022-03-29 14:48:56', '2022-03-29 15:31:08'),
(12, 4, 1, 6, 90, '', '2022-03-29 14:48:56', '2022-03-29 15:31:09'),
(13, 5, 1, 5, 50, '', '2022-03-29 14:48:56', '2022-03-29 15:31:11'),
(14, 5, 1, 6, 60, '', '2022-03-29 14:48:56', '2022-03-29 15:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `uec_students`
--

CREATE TABLE `uec_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_parents` int(10) NOT NULL,
  `id_levels` int(10) NOT NULL DEFAULT 0,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Wait-List',
  `tempatlahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggallahir` date NOT NULL,
  `tanggalmulai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uec_students`
--

INSERT INTO `uec_students` (`id`, `id_parents`, `id_levels`, `nama`, `jk`, `nohp`, `email`, `alamat`, `status`, `tempatlahir`, `tanggallahir`, `tanggalmulai`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'adsf', 'Perempuan', '1231-2312-123123', 'wellygusnaidi@gmail.com', 'asdf', 'Student', 'asdf', '2022-03-17', NULL, '2022-03-20 08:27:14', '2022-03-26 12:35:51'),
(2, 2, 15, 'asdfasdf', 'Laki-Laki', '0819-6398-4896', 'wellygusnaidi@gmail.com', 'Jln. H.O.S Cokroaminoto Gg. Bungur No. 18E', 'Wait-List', 'Pontianak', '2000-08-11', '2022-03-26', '2022-03-21 13:14:43', '2022-03-26 12:37:45'),
(3, 2, 15, 'Off', 'Laki-Laki', '0819-6398-4896', 'wellygusnaidi@gmail.com', 'Jln. H.O.S Cokroaminoto Gg. Bungur No. 18E', 'Off', 'Pontianak', '2000-08-11', '2017-03-08', '2022-03-21 13:14:43', '2022-03-21 13:14:43'),
(4, 2, 15, 'Cuti', 'Laki-Laki', '0819-6398-4896', 'wellygusnaidi@gmail.com', 'Jln. H.O.S Cokroaminoto Gg. Bungur No. 18E', 'Student', 'Pontianak', '2000-08-11', '2017-03-08', '2022-03-21 13:14:43', '2022-03-26 12:38:48'),
(5, 2, 15, 'Student', 'Laki-Laki', '0819-6398-4896', 'wellygusnaidi@gmail.com', 'Jln. H.O.S Cokroaminoto Gg. Bungur No. 18E', 'Student', 'Pontianak', '2000-08-11', '2017-03-08', '2022-03-21 13:14:43', '2022-03-21 13:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT current_timestamp(),
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `status`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(0, 'Super Admin', 'Super Admin', 'welly', '$2y$10$gAsv3zQMmUyPF9vAGj3kEu70SDXNKPuy4yihZxdVWyyj0M10WjQOO', NULL, NULL, '2021-12-04 04:10:38'),
(16, 'Septyan', 'Owner', 'septyan', '$2y$10$uZwHLpDR7vJb2XYCP1s8be7hgUKqJwUEPaSkykOblltnXepQ4pCo2', NULL, '2022-04-08 06:04:13', '2022-04-08 06:04:13'),
(17, 'William', 'Owner', 'william', '$2y$10$c4sVFyIsKdBKx9.PLjwAwOLJjuN7D6E9H/TUvdvz9ViGRGL4AzVV6', NULL, '2022-04-08 06:04:26', '2022-04-08 06:04:26'),
(18, 'Jason', 'Owner', 'jason', '$2y$10$5rsNSw9XwA6Ps7u3D9nF1OGVPsgZZJ9f1w4mAoq1Oafar18z0z56K', NULL, '2022-04-08 06:04:35', '2022-04-08 06:04:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akuns`
--
ALTER TABLE `akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_belis`
--
ALTER TABLE `barang_belis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_juals`
--
ALTER TABLE `barang_juals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_jual_details`
--
ALTER TABLE `barang_jual_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bayar_hutangs`
--
ALTER TABLE `bayar_hutangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bayar_piutangs`
--
ALTER TABLE `bayar_piutangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidang_freelancers`
--
ALTER TABLE `bidang_freelancers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_konsumens`
--
ALTER TABLE `dp_konsumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_penampungs`
--
ALTER TABLE `dp_penampungs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dropshippers`
--
ALTER TABLE `dropshippers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancers`
--
ALTER TABLE `freelancers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_belis`
--
ALTER TABLE `harga_belis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_beli_details`
--
ALTER TABLE `harga_beli_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_juals`
--
ALTER TABLE `harga_juals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_jual_details`
--
ALTER TABLE `harga_jual_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnals`
--
ALTER TABLE `jurnals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_detils`
--
ALTER TABLE `jurnal_detils`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_detils_temp`
--
ALTER TABLE `jurnal_detils_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_pengeluarans`
--
ALTER TABLE `kategori_pengeluarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsumens`
--
ALTER TABLE `konsumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details_temp`
--
ALTER TABLE `payment_details_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemasukans`
--
ALTER TABLE `pemasukans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_freelancers`
--
ALTER TABLE `pembayaran_freelancers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelians`
--
ALTER TABLE `pembelians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_details`
--
ALTER TABLE `pembelian_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penampungs`
--
ALTER TABLE `penampungs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluarans`
--
ALTER TABLE `pengeluarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran_projects`
--
ALTER TABLE `pengeluaran_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_details`
--
ALTER TABLE `penjualan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihans_dekorasi`
--
ALTER TABLE `tagihans_dekorasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihans_studio`
--
ALTER TABLE `tagihans_studio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_classes`
--
ALTER TABLE `uec_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_class_pelajarans`
--
ALTER TABLE `uec_class_pelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_class_students`
--
ALTER TABLE `uec_class_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_lectures`
--
ALTER TABLE `uec_lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_levels`
--
ALTER TABLE `uec_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_log_students`
--
ALTER TABLE `uec_log_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_parents`
--
ALTER TABLE `uec_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_pelajarans`
--
ALTER TABLE `uec_pelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_reports`
--
ALTER TABLE `uec_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uec_students`
--
ALTER TABLE `uec_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akuns`
--
ALTER TABLE `akuns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `barang_belis`
--
ALTER TABLE `barang_belis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `barang_juals`
--
ALTER TABLE `barang_juals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `barang_jual_details`
--
ALTER TABLE `barang_jual_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bayar_hutangs`
--
ALTER TABLE `bayar_hutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bayar_piutangs`
--
ALTER TABLE `bayar_piutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bidang_freelancers`
--
ALTER TABLE `bidang_freelancers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dp_konsumens`
--
ALTER TABLE `dp_konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dp_penampungs`
--
ALTER TABLE `dp_penampungs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dropshippers`
--
ALTER TABLE `dropshippers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `freelancers`
--
ALTER TABLE `freelancers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `harga_belis`
--
ALTER TABLE `harga_belis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `harga_beli_details`
--
ALTER TABLE `harga_beli_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1104;

--
-- AUTO_INCREMENT for table `harga_juals`
--
ALTER TABLE `harga_juals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `harga_jual_details`
--
ALTER TABLE `harga_jual_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jurnals`
--
ALTER TABLE `jurnals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `jurnal_detils`
--
ALTER TABLE `jurnal_detils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `jurnal_detils_temp`
--
ALTER TABLE `jurnal_detils_temp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori_pengeluarans`
--
ALTER TABLE `kategori_pengeluarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konsumens`
--
ALTER TABLE `konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `payment_details_temp`
--
ALTER TABLE `payment_details_temp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pemasukans`
--
ALTER TABLE `pemasukans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran_freelancers`
--
ALTER TABLE `pembayaran_freelancers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelians`
--
ALTER TABLE `pembelians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pembelian_details`
--
ALTER TABLE `pembelian_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `penampungs`
--
ALTER TABLE `penampungs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengeluarans`
--
ALTER TABLE `pengeluarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengeluaran_projects`
--
ALTER TABLE `pengeluaran_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan_details`
--
ALTER TABLE `penjualan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tagihans`
--
ALTER TABLE `tagihans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tagihans_dekorasi`
--
ALTER TABLE `tagihans_dekorasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tagihans_studio`
--
ALTER TABLE `tagihans_studio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `uec_classes`
--
ALTER TABLE `uec_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uec_class_pelajarans`
--
ALTER TABLE `uec_class_pelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uec_class_students`
--
ALTER TABLE `uec_class_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uec_lectures`
--
ALTER TABLE `uec_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uec_levels`
--
ALTER TABLE `uec_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `uec_log_students`
--
ALTER TABLE `uec_log_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uec_parents`
--
ALTER TABLE `uec_parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uec_pelajarans`
--
ALTER TABLE `uec_pelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uec_reports`
--
ALTER TABLE `uec_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `uec_students`
--
ALTER TABLE `uec_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
