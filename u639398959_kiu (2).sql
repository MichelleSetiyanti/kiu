-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 29, 2024 at 04:05 AM
-- Server version: 10.11.6-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u639398959_kiu`
--

-- --------------------------------------------------------

--
-- Table structure for table `akuns`
--

CREATE TABLE `akuns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_akun` int(10) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `kategori` varchar(191) NOT NULL DEFAULT 'Kas & Bank',
  `saldo_awal` double NOT NULL DEFAULT 0,
  `saldo_normal` varchar(1) NOT NULL DEFAULT 'D',
  `saldo` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akuns`
--

INSERT INTO `akuns` (`id`, `kode_akun`, `nama`, `kategori`, `saldo_awal`, `saldo_normal`, `saldo`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1101, 'Kas', 'Kas & Bank', 0, 'D', 364308137, 'Active', '2023-02-14 13:49:31', '2023-12-06 04:24:19'),
(2, 1102, 'Kas di Bank LINDA 91', 'Kas & Bank', 0, 'D', -87494079, 'Active', '2023-02-14 13:49:48', '2023-12-03 16:23:42'),
(5, 1201, 'Piutang Usaha', 'Piutang Usaha', 0, 'D', 1000000, 'Active', '2023-02-14 14:03:42', '2023-11-14 16:08:18'),
(6, 1301, 'Perlengkapan Kantor', 'Perlengkapan', 0, 'D', 0, 'Active', '2023-02-14 14:05:15', '2023-02-14 14:07:22'),
(7, 1401, 'Sewa Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:05:31', '2023-02-14 14:05:31'),
(8, 1501, 'Tanah dan Bangunan', 'Aset Tetap', 0, 'D', 100000, 'Active', '2023-02-14 14:06:46', '2023-11-19 14:48:29'),
(9, 1402, 'Asuransi Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:06:58', '2023-02-14 14:06:58'),
(10, 1403, 'Pengeluaran Dibayar Dimuka', 'Biaya Dibayar Dimuka', 0, 'D', 0, 'Active', '2023-02-14 14:07:14', '2023-02-14 14:07:14'),
(11, 1502, 'Kendaraan', 'Aset Tetap', 0, 'D', 0, 'Active', '2023-02-14 14:07:49', '2023-10-03 01:40:56'),
(12, 1601, 'Aset Lancar', 'Aset Lancar', 0, 'D', 0, 'Active', '2023-02-14 14:08:01', '2023-02-14 14:08:01'),
(13, 1701, 'Aset Lainnya', 'Aset Lainnya', 0, 'D', 0, 'Active', '2023-02-14 14:08:12', '2023-02-14 14:08:12'),
(14, 1801, 'Akumulasi Penyusutan Tanah dan Bangunan', 'Akumulasi Penyusutan', 0, 'K', 0, 'Active', '2023-02-14 14:08:38', '2023-10-10 02:02:56'),
(15, 1802, 'Akumulasi Penyusutan Kendaraan', 'Akumulasi Penyusutan', 0, 'K', 0, 'Active', '2023-02-14 14:08:51', '2023-10-10 02:02:56'),
(16, 2101, 'Utang Usaha / Dagang', 'Utang Usaha', 0, 'K', 76430080, 'Active', '2023-02-14 14:09:31', '2023-12-03 16:22:06'),
(17, 2201, 'Utang Gaji Karyawan', 'Liabilitas Jangka Pendek', 0, 'K', 0, 'Active', '2023-02-14 14:11:05', '2023-02-14 14:11:05'),
(18, 2301, 'Utang Bank', 'Liabilitas Jangka Panjang', 0, 'K', 0, 'Active', '2023-02-14 14:11:21', '2023-02-16 09:50:23'),
(19, 3101, 'Modal Pemilik', 'Modal', 0, 'K', 2561498257, 'Active', '2023-02-14 14:11:38', '2023-11-13 07:52:42'),
(20, 3102, 'Prive', 'Modal', 0, 'D', 0, 'Active', '2023-02-14 14:12:48', '2023-02-14 14:12:48'),
(21, 3201, 'Laba / Rugi Ditahan', 'Laba / Rugi Ditahan', 0, 'K', 0, 'Active', '2023-02-14 14:12:58', '2023-02-14 14:12:58'),
(22, 4101, 'Penjualan', 'Pendapatan', 0, 'K', 1908193650, 'Active', '2023-02-14 14:13:29', '2023-11-26 00:37:02'),
(23, 4102, 'Retur Penjualan', 'Pendapatan', 0, 'D', 0, 'Active', '2023-02-14 14:13:44', '2023-02-14 14:13:44'),
(24, 4103, 'Potongan Penjualan', 'Pendapatan', 0, 'D', 42650, 'Active', '2023-02-14 14:13:58', '2023-11-14 14:29:16'),
(25, 5101, 'Pembelian', 'Pembelian', 0, 'D', 2052236528, 'Active', '2023-02-14 14:14:10', '2023-12-06 04:24:19'),
(26, 5102, 'Potongan Pembelian', 'Pembelian', 0, 'K', 300100, 'Active', '2023-02-14 14:14:30', '2023-11-16 01:54:23'),
(27, 6101, 'Beban Operasional', 'Beban', 0, 'D', 6710000, 'Active', '2023-02-14 14:15:33', '2023-11-14 17:16:21'),
(28, 6201, 'Beban Lainnya', 'Beban Lainnya', 0, 'D', 200000, 'Active', '2023-02-14 14:15:44', '2023-11-11 14:06:34'),
(29, 7101, 'Pendapatan Lainnya', 'Pendapatan Lainnya', 0, 'K', 82330000, 'Active', '2023-02-14 14:15:57', '2023-11-14 16:02:17'),
(30, 6102, 'Beban Gaji Karyawan', 'Beban', 0, 'D', 29763111, 'Active', '2023-02-14 14:17:35', '2023-11-19 15:04:20'),
(31, 6103, 'Beban Administrasi Bank', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:18:07', '2023-08-17 13:27:00'),
(32, 6104, 'Upah Buruh', 'Beban', 0, 'D', 35000, 'Active', '2023-02-14 14:19:27', '2023-11-13 17:14:09'),
(33, 6105, 'Upah Lembur Buruh', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:19:51', '2023-06-05 07:14:25'),
(34, 6106, 'Upah Lembur Buruh Besi', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:20:03', '2023-02-14 14:20:03'),
(35, 6107, 'Upah Lembur Buruh Logam', 'Beban', 0, 'D', 0, 'Active', '2023-02-14 14:20:18', '2023-02-14 14:20:18'),
(36, 7102, 'Pendapatan Sewa', 'Pendapatan Lainnya', 0, 'K', 750000, 'Active', '2023-02-16 00:12:06', '2023-11-13 17:39:50'),
(37, 7103, 'Pendapatan Bunga', 'Pendapatan Lainnya', 0, 'K', 0, 'Active', '2023-02-16 00:12:18', '2023-07-01 17:12:51'),
(38, 2102, 'Utang Konsumen', 'Utang Usaha', 0, 'K', 0, 'Active', '2023-02-16 00:36:47', '2023-08-20 13:20:09'),
(39, 2401, 'PPN Masukan (Pembelian)', 'Liabilitas Jangka Pendek', 0, 'D', 3182003, 'Active', '2023-02-16 03:42:11', '2023-11-16 01:54:23'),
(40, 2501, 'PPN Keluaran (Penjualan)', 'Liabilitas Jangka Pendek', 0, 'K', 72032292.09, 'Active', '2023-02-16 03:42:49', '2023-11-14 10:30:08'),
(41, 5103, 'Biaya Tambahan Pembelian', 'Pembelian', 0, 'D', 126324209, 'Active', '2023-02-16 04:41:01', '2023-11-16 01:54:23'),
(42, 4104, 'Biaya Tambahan Penjualan', 'Pendapatan', 0, 'K', 4311000, 'Active', '2023-02-18 11:20:08', '2023-11-14 16:43:04'),
(43, 4201, 'Pendapatan Dropshipper Kontainer', 'Pendapatan', 0, 'K', 568541500, 'Active', '2023-02-21 11:30:23', '2023-12-03 16:11:34'),
(44, 2103, 'Utang Penampung', 'Utang Usaha', 0, 'K', -12251061637, 'Active', '2023-02-21 11:32:30', '2023-12-03 16:23:42'),
(45, 4202, 'Beban Tambahan Dropshipper Kontainer', 'Pendapatan', 0, 'D', 0, 'Active', '2023-02-22 15:47:30', '2023-12-03 16:11:34'),
(46, 5201, 'Pembelian Dropshipper Kontainer', 'Pembelian', 0, 'D', 570337500, 'Active', '2023-02-22 15:47:57', '2023-12-03 16:14:20'),
(47, 5202, 'Biaya Tambahan Pembelian Dropshipper Kontainer', 'Pembelian', 0, 'D', 18750000, 'Active', '2023-02-22 15:48:28', '2023-11-14 09:20:45'),
(48, 6108, 'Beban Konsumsi', 'Beban', 0, 'D', 815000, 'Active', '2023-03-04 11:34:05', '2023-11-14 16:20:16'),
(49, 4203, 'Komisi Dropshipper', 'Pendapatan', 0, 'K', 0, 'Active', '2023-04-19 05:51:18', '2023-04-19 06:46:37'),
(50, 1103, 'Kas di Bank ASROJI', 'Kas & Bank', 0, 'D', 6317819, 'Active', '2023-05-14 22:17:17', '2023-12-03 16:19:29'),
(51, 6109, 'BEBAN PERLENGKAPAN GUDANG', 'Beban', 0, 'D', 71421319, 'Active', '2023-05-16 09:35:44', '2023-11-14 13:16:42'),
(52, 6110, 'BEBAN PERLENGKAPAN KANTOR', 'Beban', 0, 'D', 0, 'Active', '2023-05-16 09:36:19', '2023-10-03 02:54:50'),
(53, 6111, 'BEBAN PENGIRIMAN BARANG', 'Beban', 0, 'D', 112930811, 'Active', '2023-05-16 09:41:08', '2023-11-14 15:28:13'),
(54, 6112, 'BEBAN PERALATAN KANTOR', 'Beban', 0, 'D', 0, 'Active', '2023-05-16 14:44:30', '2023-07-01 16:53:16'),
(55, 1104, 'Kas di Bank NISA', 'Kas & Bank', 0, 'D', 13256087, 'Active', '2023-05-20 09:15:49', '2023-11-20 13:18:53'),
(56, 1105, 'Kas di Bank MANDIRI NISA', 'Kas & Bank', 0, 'D', 11707940, 'Active', '2023-05-29 15:00:48', '2023-11-14 16:56:50'),
(57, 1503, 'Mesin', 'Aset Tetap', 0, 'D', 0, 'Active', '2023-06-03 00:19:14', '2023-06-03 00:20:17'),
(58, 6113, 'Beban Sewa', 'Beban', 0, 'D', 0, 'Active', '2023-06-03 00:21:55', '2023-06-03 00:40:22'),
(59, 6114, 'Beban Transport', 'Beban', 0, 'D', 6798000, 'Active', '2023-06-03 00:33:58', '2023-11-14 15:20:16'),
(60, 4105, 'Potongan Biaya Penjualan', 'Pendapatan', 0, 'D', 2712720, 'Active', '2023-06-10 10:35:37', '2023-11-13 11:28:57'),
(61, 2104, 'Pendapatan Diterima Dimuka', 'Liabilitas Jangka Pendek', 0, 'K', 0, 'Active', '2023-07-23 06:40:48', '2023-11-13 09:47:59'),
(62, 1202, 'Piutang Karyawan', 'Piutang Usaha', 0, 'D', 640739394, 'Active', '2023-08-18 13:48:58', '2023-11-17 00:46:17'),
(63, 1803, 'Akumulasi Penyusutan Mesin', 'Akumulasi Penyusutan', 0, 'K', 0, 'Active', '2023-10-06 02:24:56', '2023-10-06 02:24:56'),
(64, 6301, 'Beban Penyusutan Tanah dan Bangunan', 'Beban Penyusutan', 0, 'D', 0, 'Active', '2023-10-06 02:26:02', '2023-10-06 02:26:02'),
(65, 6302, 'Beban Penyusutan Kendaraan', 'Beban Penyusutan', 0, 'D', 0, 'Active', '2023-10-06 02:26:18', '2023-10-10 02:02:56'),
(66, 6303, 'Beban Penyusutan Mesin', 'Beban Penyusutan', 0, 'D', 0, 'Active', '2023-10-06 02:26:36', '2023-10-06 02:26:36'),
(67, 1199, 'Kas Lain-Lain', 'Kas & Bank', 0, 'D', -12643350180, 'Active', '2023-11-09 14:00:03', '2023-11-14 08:11:07'),
(68, 1106, 'Kas di Bank AMMAH', 'Kas & Bank', 0, 'D', 17516815, 'Active', '2023-11-09 14:01:42', '2023-11-20 13:28:59'),
(69, 1107, 'Kas di Bank EDY', 'Kas & Bank', 0, 'D', 13030000, 'Active', '2023-11-09 14:01:54', '2023-11-14 15:24:55'),
(70, 1108, 'Kas di Bank KERTASINDO', 'Kas & Bank', 0, 'D', 22549393.09, 'Active', '2023-11-09 14:02:28', '2023-11-14 13:16:42'),
(71, 1109, 'Kas di Bank JAS', 'Kas & Bank', 0, 'D', 1428518907, 'Active', '2023-11-09 14:02:37', '2023-11-14 16:16:29'),
(72, 1110, 'Kas Akun BOS', 'Kas & Bank', 0, 'D', 207487720, 'Active', '2023-11-10 12:38:30', '2023-11-14 17:28:06'),
(73, 6115, 'BEBAN UTILIYTAS', 'Beban', 0, 'D', 30000, 'Active', '2023-11-10 14:10:42', '2023-11-10 14:17:38'),
(74, 1111, 'Kas di Plastik', 'Kas & Bank', 0, 'D', 58430838, 'Active', '2023-11-11 10:43:33', '2023-11-11 14:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(10) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `satuan` varchar(191) NOT NULL DEFAULT 'kg',
  `harga` double NOT NULL DEFAULT 0,
  `stok` double NOT NULL DEFAULT 0,
  `gudang` double NOT NULL DEFAULT 0,
  `gudang_2` double NOT NULL DEFAULT 0,
  `gudang_3` double NOT NULL DEFAULT 0,
  `gudang_4` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) DEFAULT NULL,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `id_kategori`, `kode`, `nama`, `satuan`, `harga`, `stok`, `gudang`, `gudang_2`, `gudang_3`, `gudang_4`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG-0001', 'PP 00275/6/9', 'KG', 0, -3010.32, 196, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-27 11:07:31'),
(2, 1, 'BRG-0002', 'PP 00275/6/10', 'KG', 0, -535.55, 300, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-25 14:06:46'),
(3, 1, 'BRG-0003', 'KANTONG PP 00275/7/10', 'KG', 0, -1594, -10, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-27 13:17:21'),
(4, 1, 'BRG-0004', 'KANTONG  PP 00275/7/12', 'KG', 0, 43.5, 150, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-26 08:45:58'),
(5, 1, 'BRG-0005', 'KANTONG PLASTIK PP 00275/8/13', 'KG', 0, 87.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:00:46'),
(6, 1, 'BRG-0006', 'KANTONG PLASTIK PP 00275/8/15', 'KG', 0, -980, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 14:04:05'),
(7, 1, 'BRG-0007', 'KANTONG PLASTIK PP 00275/8/18', 'KG', 0, -883, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 09:45:47'),
(8, 1, 'BRG-0008', 'KANTONG PLASTIK PP 003/9/15', 'KG', 0, 225, 740, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 08:06:40'),
(9, 1, 'BRG-0009', 'KANTONG PLASTIK PP 003/9/18', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 08:34:56'),
(10, 1, 'BRG-0010', 'KANTONG PLASTIK PP 003/10/15', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-19 12:11:29'),
(11, 1, 'BRG-0011', 'KANTONG PLASTIK PP 003/10/18', 'KG', 0, 50, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(12, 1, 'BRG-0012', 'KANTONG PLASTIK PP 003/10/20', 'KG', 0, -155, 100, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 08:06:40'),
(13, 1, 'BRG-0013', 'KANTONG PLASTIK PP 003/11/23', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 14:48:41'),
(14, 1, 'BRG-0014', 'KANTONG PLASTIK PP 003/11/23 TK', 'KG', 0, 150, 850, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-09 13:53:22'),
(15, 1, 'BRG-0015', 'KANTONG PLASTIK PP 003/12/20', 'KG', 0, -55, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 13:14:25'),
(16, 1, 'BRG-0016', 'KANTONG PLASTIK PP 003/12/24', 'KG', 0, 98, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-05 15:32:39'),
(17, 1, 'BRG-0017', 'KANTONG PLASTIK PP 003/12/25', 'KG', 0, -15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 07:59:47'),
(18, 1, 'BRG-0018', 'KANTONG PLASTIK PP 003/13/20', 'KG', 0, -25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 13:56:53'),
(19, 1, 'BRG-0019', 'KANTONG PLASTIK PP 003/13/25', 'KG', 0, 5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-17 08:57:09'),
(20, 1, 'BRG-0020', 'KANTONG PLASTIK PP 003/14/20', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(21, 1, 'BRG-0021', 'KANTONG PLASTIK PP 003/14/25', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(22, 1, 'BRG-0022', 'KANTONG PLASTIK PP 003/15/20', 'KG', 0, -29880, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 14:01:22'),
(23, 1, 'BRG-0023', 'KANTONG PLASTIK PP 003/15/25', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(24, 1, 'BRG-0024', 'KANTONG PLASTIK PP 003/15/30', 'KG', 0, 135, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(25, 1, 'BRG-0025', 'KANTONG PLASTIK PP 003/15/30 TK', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(26, 1, 'BRG-0026', 'KANTONG PLASTIK PP 003/15/35', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(27, 1, 'BRG-0027', 'KANTONG PLASTIK PP 003/16/22', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(28, 1, 'BRG-0028', 'KANTONG PLASTIK PP 003/17/25', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(29, 1, 'BRG-0029', 'KANTONG PLASTIK PP 003/17/30', 'KG', 0, 15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(30, 1, 'BRG-0030', 'KANTONG PLASTIK PP 003/17/35', 'KG', 0, 90, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(31, 1, 'BRG-0031', 'KANTONG PLASTIK PP 003/17/40', 'KG', 0, 145, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(32, 1, 'BRG-0032', 'KANTONG PLASTIK PP 003/20/30', 'KG', 0, 80, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(33, 1, 'BRG-0033', 'KANTONG PLASTIK PP 003/20/35', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:45:26'),
(34, 1, 'BRG-0034', 'KANTONG PLASTIK PP 003/20/40', 'KG', 0, 80, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(35, 1, 'BRG-0035', 'KANTONG PLASTIK PP 003/23/36', 'KG', 0, 120, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(36, 1, 'BRG-0036', 'KANTONG PLASTIK PP 003/23/40', 'KG', 0, 85, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(37, 1, 'BRG-0037', 'KANTONG PLASTIK PP 003/23/46', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(38, 1, 'BRG-0038', 'KANTONG PLASTIK PP 003/25/35', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(39, 1, 'BRG-0039', 'KANTONG PLASTIK PP 003/25/40', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(40, 1, 'BRG-0040', 'KANTONG PLASTIK PP 003/25/45', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 12:08:06'),
(41, 1, 'BRG-0041', 'KANTONG PLASTIK PP 003/25/50', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(42, 1, 'BRG-0042', 'KANTONG PLASTIK PP 003/40/60', 'KG', 0, 200, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(43, 1, 'BRG-0043', 'KANTONG PLASTIK PP 003/40/65', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(44, 1, 'BRG-0044', 'KANTONG PLASTIK PP 003/50/80', 'KG', 0, 115, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 08:06:40'),
(45, 1, 'BRG-0045', 'KANTONG PLASTIK PP 003/55/90', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(46, 1, 'BRG-0046', 'KANTONG PLASTIK PP 003/60/100', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(47, 1, 'BRG-0047', 'KANTONG PLASTIK PP 004/30/50', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 12:08:06'),
(48, 1, 'BRG-0048', 'KANTONG PLASTIK PP 004/35/50', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(49, 1, 'BRG-0049', 'KANTONG PLASTIK PP 004/35/55', 'KG', 0, 50, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 12:08:06'),
(50, 1, 'BRG-0050', 'KANTONG PLASTIK PP 006/9/15', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(51, 1, 'BRG-0051', 'KANTONG PLASTIK PP 006/10/15', 'KG', 0, 115, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(52, 1, 'BRG-0052', 'KANTONG PLASTIK PP 006/10/16', 'KG', 0, -280, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-27 11:12:34'),
(53, 1, 'BRG-0053', 'KANTONG PLASTIK PP 006/12/20', 'KG', 0, 55, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(54, 1, 'BRG-0054', 'KANTONG PLASTIK PP 006/12/24', 'KG', 0, -45, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:54:20'),
(55, 1, 'BRG-0055', 'KANTONG PLASTIK PP 006/15/20', 'KG', 0, 150, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(56, 1, 'BRG-0056', 'KANTONG PLASTIK PP 006/15/25', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(57, 1, 'BRG-0057', 'KANTONG PLASTIK PP 006/15/30', 'KG', 0, 190, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(58, 1, 'BRG-0058', 'KANTONG PLASTIK PP 006/40/60', 'KG', 0, 250, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(59, 1, 'BRG-0059', 'KANTONG PLASTIK PP 006/40/65', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(60, 1, 'BRG-0060', 'KANTONG PLASTIK PP 006/50/80', 'KG', 0, 155, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(61, 1, 'BRG-0061', 'KANTONG PLASTIK PP 007/17/25', 'KG', 0, 125, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:57:30'),
(62, 1, 'BRG-0062', 'KANTONG PLASTIK PP 007/17/30', 'KG', 0, 130, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-27 14:45:41'),
(63, 1, 'BRG-0063', 'KANTONG PLASTIK PP 007/17/35', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(64, 1, 'BRG-0064', 'KANTONG PLASTIK PP 007/17/40', 'KG', 0, 135, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(65, 1, 'BRG-0065', 'KANTONG PLASTIK PP 007/20/30', 'KG', 0, 240, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 09:02:20'),
(66, 1, 'BRG-0066', 'KANTONG PLASTIK PP 007/20/35', 'KG', 0, 45, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(67, 1, 'BRG-0067', 'KANTONG PLASTIK PP 007/20/40', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(68, 1, 'BRG-0068', 'KANTONG PLASTIK PP 007/25/40', 'KG', 0, -213.3, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 09:25:26'),
(69, 1, 'BRG-0069', 'PLASTIK PP ROLL 003/9', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(70, 1, 'BRG-0070', 'PLASTIK PP ROLL 003/10', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(71, 1, 'BRG-0071', 'PLASTIK PP ROLL 00275/6', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(72, 1, 'BRG-0072', 'PLASTIK PP ROLL 00275/7', 'KG', 0, -15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-19 12:11:36'),
(73, 1, 'BRG-0073', 'PLASTIK PP ROLL 00275/8', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(74, 1, 'BRG-0074', 'KANTONG PLASTIK PE 009/30/38', 'KG', 0, -40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-27 11:12:34'),
(75, 1, 'BRG-0075', 'KANTONG PE 003/40/60', 'KG', 0, -15, 0, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-24 13:09:54'),
(76, 1, 'BRG-0076', 'KANTONG PE 006/40/65', 'KG', 0, 100, 0, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-24 13:08:12'),
(77, 1, 'BRG-0077', 'KANTONG PLASTIK PE 006/40/60', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(78, 1, 'BRG-0078', 'KANTONG PLASTIK PE 006/50/80', 'KG', 0, 285, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(79, 1, 'BRG-0079', 'KANTONG PLASTIK PE 003/60/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(80, 1, 'BRG-0080', 'KANTONG PLASTIK PE 80/120 HITAM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(81, 1, 'BRG-0081', 'KANTONG PLASTIK PE 80/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(82, 1, 'BRG-0082', 'KANTONG PLASTIK PE 006/80/130 POLOS', 'KG', 0, -139.1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:14:53'),
(83, 1, 'BRG-0083', 'KANTONG PLASTIK PE 005/80/130 HITAM', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(84, 1, 'BRG-0084', 'KANTONG PLASTIK PE 90/120 HITAM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(85, 1, 'BRG-0085', 'KANTONG PLASTIK PE 004/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(86, 1, 'BRG-0086', 'KANTONG PLASTIK LLDPE 9/15', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(87, 1, 'BRG-0087', 'KANTONG PLASTIK LLDPE 10/18', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(88, 1, 'BRG-0088', 'KANTONG PLASTIK LLDPE 10/20', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(89, 1, 'BRG-0089', 'KANTONG PLASTIK LLDPE 12/25', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(90, 1, 'BRG-0090', 'KANTONG PLASTIK LLDPE 15/30', 'BKS', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(91, 1, 'BRG-0091', 'KANTONG PLASTIK LLDPE 15/35', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(92, 1, 'BRG-0092', 'KANTONG PLASTIK LLDPE 17/40', 'BKS', 0, -100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:54:52'),
(93, 1, 'BRG-0093', 'KANTONG PLASTIK LLDPE 30/50', 'BKS', 0, 5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(94, 1, 'BRG-0094', 'KANTONG PLASTIK LLDPE 40/65', 'BKS', 0, 425, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(95, 1, 'BRG-0095', 'KANTONG PLASTIK LLDPE 50/80', 'BKS', 0, 140, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(96, 1, 'BRG-0096', 'KANTONG PLASTIK LLDPE 007/80/130', 'KG', 0, -15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 07:59:47'),
(97, 1, 'BRG-0097', 'KANTONG PLASTIK LLDPE 008/40/80', 'KG', 0, -2120, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:51:00'),
(98, 1, 'BRG-0098', 'KANTONG PLASTIK LLDPE 014/38/90', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(99, 1, 'BRG-0099', 'KANTONG PLASTIK LLDPE 80/130', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(100, 1, 'BRG-0100', 'KANTONG SAMPAH HITAM MINI', 'BKS', 0, 126, 120, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(101, 1, 'BRG-0101', 'KANTONG SAMPAH HITAM SMALL', 'BKS', 0, 384, 360, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 10:20:50'),
(102, 1, 'BRG-0102', 'KANTONG SAMPAH HITAM MEDIUM', 'BKS', 0, 426, 240, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(103, 1, 'BRG-0103', 'KANTONG SAMPAH HITAM LARGE', 'BKS', 0, 72, 60, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(104, 1, 'BRG-0104', 'KANTONG SAMPAH HITAM EXTRA LARGE', 'BKS', 0, 186, 180, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 13:56:53'),
(105, 1, 'BRG-0105', 'KANTONG SAMPAH KUNING MINI', 'BKS', 0, 270, 180, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(106, 1, 'BRG-0106', 'KANTONG SAMPAH KUNING SMALL', 'BKS', 0, 672, 600, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(107, 1, 'BRG-0107', 'KANTONG SAMPAH KUNING MEDIUM', 'BKS', 0, 720, 660, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(108, 1, 'BRG-0108', 'KANTONG SAMPAH KUNING LARGE', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(109, 1, 'BRG-0109', 'KANTONG SAMPAH KUNING EXTRA LARGE', 'BKS', 0, 546, 420, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(110, 1, 'BRG-0110', 'KANTONG KLIP POLOS 5 X 3 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(111, 1, 'BRG-0111', 'KANTONG KLIP POLOS 8 X 5 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(112, 1, 'BRG-0112', 'KANTONG KLIP POLOS 10 X 7 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(113, 1, 'BRG-0113', 'KANTONG KLIP POLOS 15 X 10 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(114, 1, 'BRG-0114', 'KANTONG KLIP POLOS 25 X 16 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(115, 1, 'BRG-0115', 'KANTONG KLIP POLOS  30 X 20 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(116, 1, 'BRG-0116', 'KANTONG KLIP POLOS 35 X 25 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(117, 1, 'BRG-0117', 'KANTONG KLIP POLOS 40 X 30 CM', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(118, 1, 'BRG-0118', 'SEDOTAN MINI KIUPLAS', 'BAL', 0, -824, 126, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-19 10:00:14'),
(119, 1, 'BRG-0119', 'SEDOTAN KIUPLAS GARIS MERAH', 'BAL', 0, 60, 51, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(120, 1, 'BRG-0120', 'SEDOTAN MINI ARWANA', 'BAL', 0, 0, 92, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 13:28:50'),
(121, 1, 'BRG-0121', 'SEDOTAN BESAR ARWANA TBK', 'BAL', 0, 110, 39, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(122, 1, 'BRG-0122', 'SEDOTAN MINI SINGA', 'BAL', 0, 52, 51, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(123, 1, 'BRG-0123', 'SEDOTAN KECIL SINGA', 'BAL', 0, 82, 71, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 15:12:31'),
(124, 1, 'BRG-0124', 'SEDOTAN BESAR SINGA', 'BAL', 0, 22, 29, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:51:10'),
(125, 1, 'BRG-0125', 'SEDOTAN BESAR SINGA TBK', 'BAL', 0, 39, 29, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(126, 1, 'BRG-0126', 'SEDOTAN SEDANG SINGA', 'BAL', 0, 45, 24, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-15 11:30:56'),
(127, 1, 'BRG-0127', 'SEDOTAN MINI DINO', 'BAL', 0, 148, 173, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 12:12:03'),
(128, 1, 'BRG-0128', 'SEDOTAN MINI BENGKOK PUTIH', 'BAL', 0, 2, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(129, 1, 'BRG-0129', 'SEDOTAN MINI BENGKOK HITAM', 'BAL', 0, 25, 24, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(130, 1, 'BRG-0130', 'SEDOTAN BESAR BENGKOK PUTIH', 'BAL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(131, 1, 'BRG-0131', 'SEDOTAN BESAR BENGKOK HITAM', 'BAL', 0, 5, 1, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(132, 1, 'BRG-0132', 'SEDOTAN MINI DIAMOND', 'BAL', 0, 72, 68, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(133, 1, 'BRG-0133', 'SEDOTAN MINI JUMBO 8MM', 'BAL', 0, 4, 4, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(134, 1, 'BRG-0134', 'SEDOTAN MINI JUMBO 12MM', 'BAL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(135, 1, 'BRG-0135', 'SEDOTAN BESAR DIAMOND', 'BAL', 0, 95, 74, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 15:15:33'),
(136, 1, 'BRG-0136', 'SEDOTAN BESAR DIAMOND TBK', 'BAL', 0, 52, 38, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(137, 1, 'BRG-0137', 'SEDOTAN BESAR DIAMOND TBK PUTIH', 'BAL', 0, 64, 47, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 13:28:50'),
(138, 1, 'BRG-0138', 'SEDOTAN BESAR JUMBO 8MM', 'BAL', 0, 1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(139, 1, 'BRG-0139', 'SEDOTAN BESAR JUMBO 12MM', 'BAL', 0, 1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(140, 1, 'BRG-0140', 'SEDOTAN SEDANG DIAMOND', 'BAL', 0, -163, 17, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-27 10:10:48'),
(141, 1, 'BRG-0141', 'SEDOTAN BESAR JUMBO STERIL', 'BAL', 0, 93, 92, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(142, 1, 'BRG-0142', 'SEDOTAN BESAR BENGKOK STERIL', 'BAL', 0, -147, 1, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-15 15:04:34'),
(143, 1, 'BRG-0143', 'KANTONG PLASTIK PE TU 10/30 BIRU MUDA', 'KG', 0, 12, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(144, 1, 'BRG-0144', 'PE TU 15/33 BIRU MUDA', 'KG', 0, -544.5, 0, 0, 0, 0, '', 'Active', '2023-12-28 15:45:58', '2024-01-25 13:34:02'),
(145, 1, 'BRG-0145', 'KANTONG PLASTIK PE TO 17/26 BIRU MUDA', 'KG', 0, 13, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(146, 1, 'BRG-0146', 'KANTONG PLASTIK PE TU 20/36 BIRU MUDA', 'KG', 0, 11, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(147, 1, 'BRG-0147', 'KANTONG PLASTIK PE TU 22/40 BIRU MUDA', 'KG', 0, -10, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 14:55:57'),
(148, 1, 'BRG-0148', 'KANTONG PLASTIK PE TO 23/32 BIRU MUDA', 'KG', 0, -16, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 12:12:03'),
(149, 1, 'BRG-0149', 'KANTONG PLASTIK PE TU 25/43 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 15:00:15'),
(150, 1, 'BRG-0150', 'KANTONG PLASTIK PE TO 27/37 BIRU MUDA', 'KG', 0, 51, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(151, 1, 'BRG-0151', 'KANTONG PLASTIK PE TU 27/50 BIRU MUDA', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-19 10:03:52'),
(152, 1, 'BRG-0152', 'KANTONG PLASTIK PE TO 30/40 BIRU MUDA', 'KG', 0, 58, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(153, 1, 'BRG-0153', 'KANTONG PLASTIK PE TU 30/60 BIRU MUDA', 'KG', 0, -60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 15:00:15'),
(154, 1, 'BRG-0154', 'KANTONG PLASTIK PE TU 30/65 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(155, 1, 'BRG-0155', 'KANTONG PLASTIK PE TO 33/50 BIRU MUDA', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(156, 1, 'BRG-0156', 'KANTONG PLASTIK PE TU 37/65 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(157, 1, 'BRG-0157', 'KANTONG PLASTIK PE TU 45/75 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(158, 1, 'BRG-0158', 'KANTONG PLASTIK PE TU 10/30 HIJAU MUDA', 'KG', 0, 12.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(159, 1, 'BRG-0159', 'KANTONG PLASTIK PE TU 15/33 HIJAU MUDA', 'KG', 0, 41, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(160, 1, 'BRG-0160', 'KANTONG PLASTIK PE TO 17/26 HIJAU MUDA', 'KG', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(161, 1, 'BRG-0161', 'KANTONG PLASTIK PE TU 20/36 HIJAU MUDA', 'KG', 0, 15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(162, 1, 'BRG-0162', 'KANTONG PLASTIK PE TU 22/40 HIJAU MUDA', 'KG', 0, -26, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:54:52'),
(163, 1, 'BRG-0163', 'KANTONG PLASTIK PE TO 23/32 HIJAU MUDA', 'KG', 0, 7, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 13:56:53'),
(164, 1, 'BRG-0164', 'KANTONG PLASTIK PE TU 25/43 HIJAU MUDA', 'KG', 0, 32, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(165, 1, 'BRG-0165', 'KANTONG PLASTIK PE TO 27/37 HIJAU MUDA', 'KG', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(166, 1, 'BRG-0166', 'KANTONG PLASTIK PE TU 27/50 HIJAU MUDA', 'KG', 0, 38, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 14:55:57'),
(167, 1, 'BRG-0167', 'KANTONG PLASTIK PE TO 30/40 HIJAU MUDA', 'KG', 0, 58, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 15:13:16'),
(168, 1, 'BRG-0168', 'KANTONG PLASTIK PE TU 30/60 HIJAU MUDA', 'KG', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(169, 1, 'BRG-0169', 'KANTONG PLASTIK PE TU 30/65 HIJAU MUDA', 'KG', 0, 66, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(170, 1, 'BRG-0170', 'KANTONG PLASTIK PE TO 33/50 HIJAU MUDA', 'KG', 0, -6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 15:03:33'),
(171, 1, 'BRG-0171', 'KANTONG PLASTIK PE TU 37/65 HIJAU MUDA', 'KG', 0, -4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 15:00:15'),
(172, 1, 'BRG-0172', 'KANTONG PLASTIK PE TU 45/75 HIJAU MUDA', 'KG', 0, 10, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(173, 1, 'BRG-0173', 'KANTONG PLASTIK PE TU 10/30 DADU', 'KG', 0, 27, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(174, 1, 'BRG-0174', 'KANTONG PLASTIK PE TU 15/33 DADU', 'KG', 0, 1.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(175, 1, 'BRG-0175', 'KANTONG PLASTIK PE TO 17/26 DADU', 'KG', 0, 13, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(176, 1, 'BRG-0176', 'KANTONG PLASTIK PE TU 20/36 DADU', 'KG', 0, 19, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(177, 1, 'BRG-0177', 'KANTONG PLASTIK PE TU 22/40 DADU', 'KG', 0, 77, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 14:55:57'),
(178, 1, 'BRG-0178', 'KANTONG PLASTIK PE TO 23/32 DADU', 'KG', 0, -29970, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 14:06:46'),
(179, 1, 'BRG-0179', 'KANTONG PLASTIK PE TU 25/43 DADU', 'KG', 0, 63, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:54:52'),
(180, 1, 'BRG-0180', 'KANTONG PLASTIK PE TO 27/37 DADU', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:28:35'),
(181, 1, 'BRG-0181', 'KANTONG PLASTIK PE TU 27/50 DADU', 'KG', 0, 72, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 07:59:47'),
(182, 1, 'BRG-0182', 'KANTONG PLASTIK PE TO 30/40 DADU', 'KG', 0, -4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 15:00:20'),
(183, 1, 'BRG-0183', 'KANTONG PLASTIK PE TU 30/60 DADU', 'KG', 0, -34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:54:52'),
(184, 1, 'BRG-0184', 'KANTONG PLASTIK PE TU 30/65 DADU', 'KG', 0, 32, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(185, 1, 'BRG-0185', 'KANTONG PLASTIK PE TO 33/50 DADU', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(186, 1, 'BRG-0186', 'KANTONG PLASTIK PE TU 37/65 DADU', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(187, 1, 'BRG-0187', 'KANTONG PLASTIK PE TU 45/75 DADU', 'KG', 0, -6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 15:03:33'),
(188, 1, 'BRG-0188', 'KANTONG PLASTIK PE TU 10/30 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(189, 1, 'BRG-0189', 'KANTONG PLASTIK PE TU 15/33 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(190, 1, 'BRG-0190', 'KANTONG PLASTIK PE TO 17/26 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(191, 1, 'BRG-0191', 'KANTONG PLASTIK PE TU 20/36 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(192, 1, 'BRG-0192', 'KANTONG PLASTIK PE TU 22/40 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(193, 1, 'BRG-0193', 'KANTONG PLASTIK PE TO 23/32 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(194, 1, 'BRG-0194', 'KANTONG PLASTIK PE TU 25/43 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(195, 1, 'BRG-0195', 'KANTONG PLASTIK PE TO 27/37 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(196, 1, 'BRG-0196', 'KANTONG PLASTIK PE TU 27/50 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(197, 1, 'BRG-0197', 'KANTONG PLASTIK PE TO 30/40 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(198, 1, 'BRG-0198', 'KANTONG PLASTIK PE TU 30/60 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(199, 1, 'BRG-0199', 'KANTONG PLASTIK PE TU 30/65 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(200, 1, 'BRG-0200', 'KANTONG PLASTIK PE TO 33/50 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(201, 1, 'BRG-0201', 'KANTONG PLASTIK PE TU 37/65 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(202, 1, 'BRG-0202', 'KANTONG PLASTIK PE TU 45/75 BIRU TUA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(203, 1, 'BRG-0203', 'KANTONG PLASTIK PE TU 10/30 KUNING', 'KG', 0, 12.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(204, 1, 'BRG-0204', 'KANTONG PLASTIK PE TU 15/33 KUNING', 'KG', 0, 199, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(205, 1, 'BRG-0205', 'KANTONG PLASTIK PE TO 17/26 KUNING', 'KG', 0, -2, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-25 13:27:43'),
(206, 1, 'BRG-0206', 'KANTONG PLASTIK PE TU 20/36 KUNING', 'KG', 0, 43, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(207, 1, 'BRG-0207', 'KANTONG PLASTIK PE TU 22/40 KUNING', 'KG', 0, -35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:54:52'),
(208, 1, 'BRG-0208', 'KANTONG PLASTIK PE TO 23/32 KUNING', 'KG', 0, 21, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(209, 1, 'BRG-0209', 'KANTONG PLASTIK PE TU 25/43 KUNING', 'KG', 0, 87, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(210, 1, 'BRG-0210', 'KANTONG PLASTIK PE TO 27/37 KUNING', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(211, 1, 'BRG-0211', 'KANTONG PLASTIK PE TU 27/50 KUNING', 'KG', 0, -213, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-11 11:47:14'),
(212, 1, 'BRG-0212', 'KANTONG PLASTIK PE TO 30/40 KUNING', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(213, 1, 'BRG-0213', 'KANTONG PLASTIK PE TU 30/60 KUNING', 'KG', 0, 46, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(214, 1, 'BRG-0214', 'KANTONG PLASTIK PE TU 30/65 KUNING', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(215, 1, 'BRG-0215', 'KANTONG PLASTIK PE TO 33/50 KUNING', 'KG', 0, 94, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(216, 1, 'BRG-0216', 'KANTONG PLASTIK PE TU 37/65 KUNING', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(217, 1, 'BRG-0217', 'KANTONG PLASTIK PE TU 45/75 KUNING', 'KG', 0, 38, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(218, 1, 'BRG-0218', 'KANTONG PLASTIK PE TU 10/30 ORANGE', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(219, 1, 'BRG-0219', 'KANTONG PLASTIK PE TU 15/33 ORANGE', 'KG', 0, 72.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(220, 1, 'BRG-0220', 'KANTONG PLASTIK PE TO 17/26 ORANGE', 'KG', 0, 46, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(221, 1, 'BRG-0221', 'KANTONG PLASTIK PE TU 20/36 ORANGE', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(222, 1, 'BRG-0222', 'KANTONG PLASTIK PE TU 22/40 ORANGE', 'KG', 0, -13, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:51:00'),
(223, 1, 'BRG-0223', 'KANTONG PLASTIK PE TO 23/32 ORANGE', 'KG', 0, 35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(224, 1, 'BRG-0224', 'KANTONG PLASTIK PE TU 25/43 ORANGE', 'KG', 0, 38, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(225, 1, 'BRG-0225', 'KANTONG PLASTIK PE TO 27/37 ORANGE', 'KG', 0, 3, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(226, 1, 'BRG-0226', 'KANTONG PLASTIK PE TU 27/50 ORANGE', 'KG', 0, 68, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(227, 1, 'BRG-0227', 'KANTONG PLASTIK PE TO 30/40 ORANGE', 'KG', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(228, 1, 'BRG-0228', 'KANTONG PLASTIK PE TU 30/60 ORANGE', 'KG', 0, 94, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(229, 1, 'BRG-0229', 'KANTONG PLASTIK PE TU 30/65 ORANGE', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(230, 1, 'BRG-0230', 'KANTONG PLASTIK PE TO 33/50 ORANGE', 'KG', 0, 42, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(231, 1, 'BRG-0231', 'KANTONG PLASTIK PE TU 37/65 ORANGE', 'KG', 0, 42, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(232, 1, 'BRG-0232', 'KANTONG PLASTIK PE TU 45/75 ORANGE', 'KG', 0, 48, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(233, 1, 'BRG-0233', 'KANTONG PLASTIK PE TU 10/30 UNGU', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(234, 1, 'BRG-0234', 'KANTONG PLASTIK PE TU 15/33 UNGU', 'KG', 0, 27.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(235, 1, 'BRG-0235', 'KANTONG PLASTIK PE TO 17/26 UNGU', 'KG', 0, 17, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(236, 1, 'BRG-0236', 'KANTONG PLASTIK PE TU 20/36 UNGU', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(237, 1, 'BRG-0237', 'KANTONG PLASTIK PE TU 22/40 UNGU', 'KG', 0, -9, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:51:00'),
(238, 1, 'BRG-0238', 'KANTONG PLASTIK PE TO 23/32 UNGU', 'KG', 0, -31965, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 09:56:49'),
(239, 1, 'BRG-0239', 'KANTONG PLASTIK PE TU 25/43 UNGU', 'KG', 0, 16, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(240, 1, 'BRG-0240', 'KANTONG PLASTIK PE TO 27/37 UNGU', 'KG', 0, 53, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(241, 1, 'BRG-0241', 'KANTONG PLASTIK PE TU 27/50 UNGU', 'KG', 0, 8, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(242, 1, 'BRG-0242', 'KANTONG PLASTIK PE TO 30/40 UNGU', 'KG', 0, 22, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(243, 1, 'BRG-0243', 'KANTONG PLASTIK PE TU 30/60 UNGU', 'KG', 0, 74, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(244, 1, 'BRG-0244', 'KANTONG PLASTIK PE TU 30/65 UNGU', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(245, 1, 'BRG-0245', 'KANTONG PLASTIK PE TO 33/50 UNGU', 'KG', 0, 34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(246, 1, 'BRG-0246', 'KANTONG PLASTIK PE TU 37/65 UNGU', 'KG', 0, 42, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(247, 1, 'BRG-0247', 'KANTONG PLASTIK PE TU 45/75 UNGU', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(248, 1, 'BRG-0248', 'KANTONG PLASTIK PE TU 10/30 MERAH', 'KG', 0, 7.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(249, 1, 'BRG-0249', 'KANTONG PLASTIK PE TU 15/33 MERAH', 'KG', 0, 66, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(250, 1, 'BRG-0250', 'KANTONG PLASTIK PE TO 17/26 MERAH', 'KG', 0, 36, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(251, 1, 'BRG-0251', 'KANTONG PLASTIK PE TU 20/36 MERAH', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(252, 1, 'BRG-0252', 'KANTONG PLASTIK PE TU 22/40 MERAH', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(253, 1, 'BRG-0253', 'KANTONG PLASTIK PE TO 23/32 MERAH', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(254, 1, 'BRG-0254', 'KANTONG PLASTIK PE TU 25/43 MERAH', 'KG', 0, 78, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(255, 1, 'BRG-0255', 'KANTONG PLASTIK PE TO 27/37 MERAH', 'KG', 0, 38, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-26 09:56:49'),
(256, 1, 'BRG-0256', 'KANTONG PLASTIK PE TU 27/50 MERAH', 'KG', 0, 89, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(257, 1, 'BRG-0257', 'KANTONG PLASTIK PE TO 30/40 MERAH', 'KG', 0, 46, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(258, 1, 'BRG-0258', 'KANTONG PLASTIK PE TU 30/50 MERAH', 'KG', 0, 6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(259, 1, 'BRG-0259', 'KANTONG PLASTIK PE TU 30/60 MERAH', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(260, 1, 'BRG-0260', 'KANTONG PLASTIK PE TU 30/65 MERAH', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(261, 1, 'BRG-0261', 'KANTONG PLASTIK PE TO 33/50 MERAH', 'KG', 0, 34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(262, 1, 'BRG-0262', 'KANTONG PLASTIK PE TU 37/65 MERAH', 'KG', 0, 56, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(263, 1, 'BRG-0263', 'KANTONG PLASTIK PE TU 45/75 MERAH', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(264, 1, 'BRG-0264', 'KANTONG PLASTIK PE TU 10/30 PUTIH', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(265, 1, 'BRG-0265', 'KANTONG PLASTIK PE TU 15/33 PUTIH', 'KG', 0, 3.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-27 13:17:21'),
(266, 1, 'BRG-0266', 'KANTONG PLASTIK PE TO 17/26 PUTIH', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(267, 1, 'BRG-0267', 'KANTONG PLASTIK PE TU 20/36 PUTIH', 'KG', 0, 28, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(268, 1, 'BRG-0268', 'KANTONG PLASTIK PE TU 22/40 PUTIH', 'KG', 0, 62, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-20 14:51:00'),
(269, 1, 'BRG-0269', 'KANTONG PLASTIK PE TO 23/32 PUTIH', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(270, 1, 'BRG-0270', 'KANTONG PLASTIK PE TU 25/43 PUTIH', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-16 14:55:57'),
(271, 1, 'BRG-0271', 'KANTONG PLASTIK PE TO 27/37 PUTIH', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 12:08:06'),
(272, 1, 'BRG-0272', 'KANTONG PLASTIK PE TU 27/50 PUTIH', 'KG', 0, 97, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(273, 1, 'BRG-0273', 'KANTONG PLASTIK PE TO 30/40 PUTIH', 'KG', 0, 90, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(274, 1, 'BRG-0274', 'KANTONG PLASTIK PE TU 30/60 PUTIH', 'KG', 0, 68, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(275, 1, 'BRG-0275', 'KANTONG PLASTIK PE TU 30/65 PUTIH', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(276, 1, 'BRG-0276', 'KANTONG PLASTIK PE TO 33/50 PUTIH', 'KG', 0, 62, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(277, 1, 'BRG-0277', 'KANTONG PLASTIK PE TU 37/65 PUTIH', 'KG', 0, 28, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(278, 1, 'BRG-0278', 'KANTONG PLASTIK PE TU 45/75 PUTIH', 'KG', 0, 24, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 12:08:06'),
(279, 1, 'BRG-0279', 'KANTONG PLASTIK PE TU 15/33 HITAM', 'KG', 0, 67.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(280, 1, 'BRG-0280', 'KANTONG PLASTIK PE TU 20/36 HITAM', 'KG', 0, 1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(281, 1, 'BRG-0281', 'KANTONG PLASTIK PE TU 22/40 HITAM', 'KG', 0, 80, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(282, 1, 'BRG-0282', 'KANTONG PLASTIK PE TU 25/43 HITAM', 'KG', 0, 132, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(283, 1, 'BRG-0283', 'KANTONG PLASTIK PE TU 27/50 HITAM', 'KG', 0, 61, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(284, 1, 'BRG-0284', 'KANTONG PLASTIK PE TU 30/60 HITAM', 'KG', 0, 10, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(285, 1, 'BRG-0285', 'KANTONG PLASTIK PE TU 30/65 HITAM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(286, 1, 'BRG-0286', 'KANTONG PLASTIK PE TU 37/65 HITAM', 'KG', 0, 48, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(287, 1, 'BRG-0287', 'KANTONG PLASTIK PE TU 45/75 HITAM', 'KG', 0, 6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(288, 1, 'BRG-0288', 'KANTONG PLASTIK PE TU 10/30 BENING', 'KG', 0, 1.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(289, 1, 'BRG-0289', 'KANTONG PLASTIK PE TU 10/38 BENING', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(290, 1, 'BRG-0290', 'KANTONG PLASTIK PE TU 15/33 BENING', 'KG', 0, 33, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(291, 1, 'BRG-0291', 'KANTONG PLASTIK PE TU 20/36 BENING', 'KG', 0, 41, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(292, 1, 'BRG-0292', 'KANTONG PLASTIK PE TU 20/38 BENING', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(293, 1, 'BRG-0293', 'KANTONG PLASTIK PE TU 22/40 BENING', 'KG', 0, 12, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(294, 1, 'BRG-0294', 'KANTONG PLASTIK PE TU 25/43 BENING', 'KG', 0, 34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(295, 1, 'BRG-0295', 'KANTONG PLASTIK PE TU 27/50 BENING', 'KG', 0, 53, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(296, 1, 'BRG-0296', 'KANTONG PLASTIK PE TU 30/50 BENING', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(297, 1, 'BRG-0297', 'KANTONG PLASTIK PE TU 30/60 BENING', 'KG', 0, 24, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(298, 1, 'BRG-0298', 'KANTONG PLASTIK PE TU 37/65 BENING', 'KG', 0, 26, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(299, 1, 'BRG-0299', 'KANTONG PLASTIK PE TU 45/75 BENING', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(300, 1, 'BRG-0300', 'MULSA 035/60xRoll', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(301, 1, 'BRG-0301', 'KARUNG PLASTIK 60/100', 'LBR', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(302, 1, 'BRG-0302', 'KANSUI', 'ROLL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(303, 1, 'BRG-0303', 'STRAPPING BAND PUTIH', 'ROLL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(304, 1, 'BRG-0304', 'STRAPPING BAND HIJAU', 'ROLL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(305, 1, 'BRG-0305', 'BUBBLE WRAP BENING GRADE B', 'BAL', 0, 44, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(306, 1, 'BRG-0306', 'BUBBLE WRAP BENING GRADE C', 'BAL', 0, 14, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(307, 1, 'BRG-0307', 'POLYBAG BABY', 'BKS', 0, 12, 432, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 11:35:33'),
(308, 1, 'BRG-0308', 'POLYBAG MINI', 'BKS', 0, -169, 252, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:57:30'),
(309, 1, 'BRG-0309', 'POLYBAG EXTRA SMALL', 'BKS', 0, 90, 1008, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(310, 1, 'BRG-0310', 'POLYBAG SMALL', 'BKS', 0, 60, 360, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(311, 1, 'BRG-0311', 'POLYBAG MEDIUM', 'BKS', 0, 96, 144, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:57:30'),
(312, 1, 'BRG-0312', 'POLYBAG LARGE', 'BKS', 0, 78, 540, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:57:30'),
(313, 1, 'BRG-0313', 'POLYBAG EXTRA LARGE', 'BKS', 0, 42, 216, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(314, 1, 'BRG-0314', 'POLYBAG JUMBO', 'BKS', 0, 6, 100, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 11:58:46'),
(315, 1, 'BRG-0315', 'LARGE POLYBAG SUPER MURNI 0,15 MM X 20/40 CM X 50 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(316, 1, 'BRG-0316', 'LARGE POLYBAG 0,15 MM X 20/40 CM X 50 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(317, 1, 'BRG-0317', 'LARGE POLYBAG 0,15 MM X 40 CM X 50 CM LAY FLAT', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(318, 1, 'BRG-0318', 'BABY POLYBAG 0,10 MM X 7,5/15 CM X 23 CM', 'KG', 0, -3000, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 08:19:00'),
(319, 1, 'BRG-0319', 'BABY POLYBAG 0,07 MM X 7,5/15 CM X 23 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(320, 1, 'BRG-0320', 'BABY POLYBAG 0,10 MM X 7/14 CM X 22 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(321, 1, 'BRG-0321', 'BABY POLYBAG 0,08 MM X 7,5/15 CM X 20 CM', 'KG', 0, -2536, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-24 09:22:12'),
(322, 1, 'BRG-0322', 'BABY POLYBAG 0,075 MM X 15 CM X 23 CM LAY FLAT', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(323, 1, 'BRG-0323', 'JUMBO POLYBAG SUPER MURNI 0,15 MM X 25/50 CM X 60 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(324, 1, 'BRG-0324', 'kantong AAA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(325, 1, 'BRG-0325', 'BUBBLE WRAP HITAM GRADE B', 'ROLL', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(326, 1, 'BRG-0326', 'BUBBLE WRAP HITAM GRADE C', 'ROLL', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(327, 1, 'BRG-0327', 'SEDOTAN DINOSAU', 'BAL', 20000, 50, 0, 0, 0, 0, '-', 'Active', '2024-01-11 10:28:16', '2024-01-11 10:39:46'),
(328, 1, 'BRG-0328', 'POLYBAG 013/13/26', 'KG', 0, -2792.9, 0, 0, 0, 0, '-', 'Active', '2024-01-17 10:50:45', '2024-01-25 13:54:40'),
(329, 1, 'BRG-0329', 'POLYBAG 010/12/25', 'KG', 0, -3047.1, 0, 0, 0, 0, '-', 'Active', '2024-01-17 10:51:07', '2024-01-29 08:20:28'),
(330, 1, 'BRG-0330', 'POLYBAG 012/15/30', 'KG', 0, -12323, 0, 0, 0, 0, '', 'Active', '2024-01-17 10:53:51', '2024-01-24 09:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_piutangs`
--

CREATE TABLE `bayar_piutangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'Paid',
  `pelunasan_konsumen` varchar(10) NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bayar_piutangs`
--

INSERT INTO `bayar_piutangs` (`id`, `id_penjualans`, `id_users`, `nominal`, `status`, `pelunasan_konsumen`, `created_at`, `updated_at`) VALUES
(1, 3, 23, 20000, 'Paid', 'Y', '2024-01-08 15:43:16', '2024-01-08 15:43:16'),
(2, 11, 23, 20500, 'Paid', 'Y', '2024-01-09 13:04:29', '2024-01-09 13:04:29'),
(3, 17, 23, 4000000, 'Paid', 'Y', '2024-01-09 13:27:52', '2024-01-09 13:27:52'),
(4, 27, 23, 333000, 'Paid', 'Y', '2024-01-09 14:34:04', '2024-01-09 14:34:04'),
(5, 26, 23, 255300, 'Paid', 'Y', '2024-01-09 14:34:04', '2024-01-09 14:34:04'),
(6, 25, 23, 6776550, 'Paid', 'Y', '2024-01-09 14:34:04', '2024-01-09 14:34:04'),
(7, 31, 23, 252000, 'Paid', 'Y', '2024-01-09 14:47:02', '2024-01-09 14:47:02'),
(8, 30, 23, 266400, 'Paid', 'Y', '2024-01-09 14:47:02', '2024-01-09 14:47:02'),
(9, 23, 23, 2700000, 'Paid', 'Y', '2024-01-09 15:16:18', '2024-01-09 15:16:18'),
(10, 43, 23, 1000000, 'Paid', 'Y', '2024-01-12 14:49:28', '2024-01-12 14:49:28'),
(11, 50, 23, 652125, 'Paid', 'Y', '2024-01-15 10:56:41', '2024-01-15 10:56:41'),
(12, 60, 23, 3379950, 'Paid', 'Y', '2024-01-15 12:26:12', '2024-01-15 12:26:12'),
(13, 63, 45, 240000, 'Cancel', 'Y', '2024-01-16 13:14:10', '2024-01-16 13:14:31'),
(14, 63, 45, 240000, 'Cancel', 'Y', '2024-01-16 13:14:56', '2024-01-16 13:15:05'),
(15, 63, 45, 240000, 'Cancel', 'Y', '2024-01-16 13:15:48', '2024-01-16 13:16:04'),
(16, 63, 45, 240000, 'Cancel', 'Y', '2024-01-16 13:19:30', '2024-01-16 13:22:49'),
(17, 65, 45, 2313000, 'Cancel', 'Y', '2024-01-16 13:30:52', '2024-01-16 13:38:04'),
(18, 65, 45, 2313000, 'Paid', 'Y', '2024-01-16 13:41:37', '2024-01-16 13:41:37'),
(19, 63, 45, 240000, 'Paid', 'Y', '2024-01-16 13:44:54', '2024-01-16 13:44:54'),
(20, 64, 45, 750000, 'Cancel', 'Y', '2024-01-16 14:06:12', '2024-01-16 14:08:55'),
(21, 67, 45, 4440000, 'Cancel', 'Y', '2024-01-16 14:12:34', '2024-01-16 14:15:13'),
(22, 69, 23, 29970000, 'Cancel', 'Y', '2024-01-16 14:12:50', '2024-01-16 14:13:33'),
(23, 68, 23, 26640000, 'Cancel', 'Y', '2024-01-16 14:12:50', '2024-01-16 14:13:33'),
(24, 67, 23, 0, 'Cancel', 'Y', '2024-01-16 14:12:50', '2024-01-16 14:13:33'),
(25, 70, 23, 244200, 'Paid', 'Y', '2024-01-16 14:44:56', '2024-01-16 14:44:56'),
(26, 71, 23, 244200, 'Paid', 'Y', '2024-01-16 14:44:56', '2024-01-16 14:44:56'),
(27, 72, 23, 255300, 'Paid', 'Y', '2024-01-19 12:12:21', '2024-01-19 12:12:21'),
(28, 73, 23, 3318900, 'Paid', 'Y', '2024-01-19 12:12:21', '2024-01-19 12:12:21'),
(29, 74, 23, 2170050, 'Paid', 'Y', '2024-01-19 12:12:21', '2024-01-19 12:12:21'),
(30, 75, 23, 765900, 'Paid', 'Y', '2024-01-19 12:12:21', '2024-01-19 12:12:21'),
(31, 97, 23, 2833830, 'Paid', 'Y', '2024-01-19 12:52:30', '2024-01-19 12:52:30'),
(32, 99, 23, 1148850, 'Paid', 'Y', '2024-01-19 13:08:17', '2024-01-19 13:08:17'),
(33, 98, 23, 255300, 'Paid', 'Y', '2024-01-19 13:08:17', '2024-01-19 13:08:17'),
(34, 68, 23, 26640000, 'Paid', 'Y', '2024-01-19 13:10:07', '2024-01-19 13:10:07'),
(35, 69, 23, 29970000, 'Paid', 'Y', '2024-01-19 13:10:07', '2024-01-19 13:10:07'),
(36, 67, 23, 4440000, 'Paid', 'Y', '2024-01-19 13:10:07', '2024-01-19 13:10:07'),
(37, 102, 23, 4440000, 'Paid', 'Y', '2024-01-20 12:00:06', '2024-01-20 12:00:06'),
(38, 81, 23, 320780, 'Paid', 'Y', '2024-01-20 12:00:06', '2024-01-20 12:00:06'),
(39, 64, 23, 750000, 'Paid', 'Y', '2024-01-20 13:05:55', '2024-01-20 13:05:55'),
(40, 119, 23, 55500, 'Paid', 'Y', '2024-01-22 09:35:37', '2024-01-22 09:35:37'),
(41, 123, 23, 2894325, 'Paid', 'Y', '2024-01-24 08:34:24', '2024-01-24 08:34:24'),
(42, 128, 23, 391275, 'Paid', 'Y', '2024-01-24 08:34:24', '2024-01-24 08:34:24'),
(43, 136, 23, 391275, 'Paid', 'Y', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(44, 135, 23, 391275, 'Paid', 'Y', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(45, 137, 23, 391275, 'Paid', 'Y', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(46, 138, 23, 391275, 'Paid', 'Y', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(47, 140, 23, 391275, 'Paid', 'Y', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(48, 141, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(49, 142, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(50, 144, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(51, 145, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(52, 146, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(53, 148, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(54, 149, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(55, 151, 23, 391275, 'Paid', 'Y', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(56, 156, 23, 1948050, 'Paid', 'Y', '2024-01-25 08:00:56', '2024-01-25 08:00:56'),
(57, 22, 23, 606000, 'Paid', 'Y', '2024-01-25 08:29:18', '2024-01-25 08:29:18'),
(58, 121, 45, 2490840, 'Cancel', 'Y', '2024-01-26 08:06:56', '2024-01-26 09:04:38'),
(59, 121, 23, 2490840, 'Cancel', 'Y', '2024-01-26 09:04:46', '2024-01-27 11:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_piutang_konsumens`
--

CREATE TABLE `bayar_piutang_konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) NOT NULL DEFAULT '-',
  `kodepelunasan` varchar(191) NOT NULL DEFAULT '0',
  `id_users` int(10) NOT NULL DEFAULT 0,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'Paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bayar_piutang_konsumens`
--

INSERT INTO `bayar_piutang_konsumens` (`id`, `kode`, `kodepelunasan`, `id_users`, `id_konsumens`, `nominal`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PPK/2024/01/0001', '1,', 23, 1, 20000, 'Paid', '2024-01-08 15:43:16', '2024-01-08 15:43:16'),
(2, 'PPK/2024/01/0002', '2,', 23, 1, 20500, 'Paid', '2024-01-09 13:04:29', '2024-01-09 13:04:29'),
(3, 'PPK/2024/01/0003', '3,', 23, 710, 4000000, 'Paid', '2024-01-09 13:27:52', '2024-01-09 13:27:52'),
(4, 'PPK/2024/01/0004', '4,5,6,', 23, 733, 7364850, 'Paid', '2024-01-09 14:34:04', '2024-01-09 14:34:04'),
(5, 'PPK/2024/01/0005', '7,8,', 23, 733, 518400, 'Paid', '2024-01-09 14:47:02', '2024-01-09 14:47:02'),
(6, 'PPK/2024/01/0006', '9,', 23, 1, 2700000, 'Paid', '2024-01-09 15:16:18', '2024-01-09 15:16:18'),
(7, 'K-24-0001', '10,', 23, 1, 1000000, 'Paid', '2024-01-12 14:49:28', '2024-01-12 14:49:28'),
(8, 'K-24-0002', '11,', 23, 733, 652125, 'Paid', '2024-01-15 10:56:41', '2024-01-15 10:56:41'),
(9, 'K-24-0003', '12,', 23, 1, 3379950, 'Paid', '2024-01-15 12:26:12', '2024-01-15 12:26:12'),
(10, 'K-24-0004', '13,', 45, 1, 240000, 'Cancel', '2024-01-16 13:14:10', '2024-01-16 13:14:31'),
(11, 'K-24-0005', '14,', 45, 1, 240000, 'Cancel', '2024-01-16 13:14:56', '2024-01-16 13:15:05'),
(12, 'K-24-0006', '15,', 45, 1, 240000, 'Cancel', '2024-01-16 13:15:48', '2024-01-16 13:16:04'),
(13, 'K-24-0007', '16,', 45, 1, 240000, 'Cancel', '2024-01-16 13:19:30', '2024-01-16 13:22:49'),
(14, 'K-24-0008', '17,', 45, 8, 2313000, 'Cancel', '2024-01-16 13:30:52', '2024-01-16 13:38:04'),
(15, 'K-24-0009', '18,', 45, 8, 2313000, 'Paid', '2024-01-16 13:41:37', '2024-01-16 13:41:37'),
(16, 'K-24-0010', '19,', 45, 1, 240000, 'Paid', '2024-01-16 13:44:54', '2024-01-16 13:44:54'),
(17, 'K-24-0011', '20,', 45, 2, 750000, 'Cancel', '2024-01-16 14:06:12', '2024-01-16 14:08:55'),
(18, 'K-24-0012', '21,', 45, 1, 4440000, 'Cancel', '2024-01-16 14:12:34', '2024-01-16 14:15:13'),
(19, 'K-24-0013', '22,23,24,', 23, 1, 56610000, 'Cancel', '2024-01-16 14:12:50', '2024-01-16 14:13:33'),
(20, 'K-24-0014', '25,26,', 23, 733, 488400, 'Paid', '2024-01-16 14:44:56', '2024-01-16 14:44:56'),
(21, 'K-24-0015', '27,28,29,30,', 23, 733, 6510150, 'Paid', '2024-01-19 12:12:21', '2024-01-19 12:12:21'),
(22, 'K-24-0016', '31,', 23, 697, 2833830, 'Paid', '2024-01-19 12:52:30', '2024-01-19 12:52:30'),
(23, 'K-24-0017', '32,33,', 23, 900, 1404150, 'Paid', '2024-01-19 13:08:17', '2024-01-19 13:08:17'),
(24, 'K-24-0018', '34,35,36,', 23, 1, 61050000, 'Paid', '2024-01-19 13:10:07', '2024-01-19 13:10:07'),
(25, 'K-24-0019', '37,38,', 23, 1, 4760780, 'Paid', '2024-01-20 12:00:06', '2024-01-20 12:00:06'),
(26, 'K-24-0020', '39,', 23, 2, 750000, 'Paid', '2024-01-20 13:05:55', '2024-01-20 13:05:55'),
(27, 'K-24-0021', '40,', 23, 1, 55500, 'Paid', '2024-01-22 09:35:37', '2024-01-22 09:35:37'),
(28, 'K-24-0022', '41,42,', 23, 733, 3285600, 'Paid', '2024-01-24 08:34:24', '2024-01-24 08:34:24'),
(29, 'K-24-0023', '43,44,45,46,47,', 23, 733, 1956375, 'Paid', '2024-01-24 08:48:38', '2024-01-24 08:48:38'),
(30, 'K-24-0024', '48,49,50,51,52,53,54,55,', 23, 733, 3130200, 'Paid', '2024-01-24 08:57:19', '2024-01-24 08:57:19'),
(31, 'K-24-0025', '56,', 23, 733, 1948050, 'Paid', '2024-01-25 08:00:56', '2024-01-25 08:00:56'),
(32, 'K-24-0026', '57,', 23, 710, 606000, 'Paid', '2024-01-25 08:29:18', '2024-01-25 08:29:18'),
(33, 'K-24-0027', '58,', 45, 1, 2490840, 'Cancel', '2024-01-26 08:06:56', '2024-01-26 09:04:38'),
(34, 'K-24-0028', '59,', 23, 1, 2490840, 'Cancel', '2024-01-26 09:04:46', '2024-01-27 11:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_bayar_piutangs`
--

CREATE TABLE `cancel_bayar_piutangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancel_bayar_piutangs`
--

INSERT INTO `cancel_bayar_piutangs` (`id`, `id_penjualans`, `id_users`, `nominal`, `created_at`, `updated_at`) VALUES
(1, 63, 45, 240000, '2024-01-16 13:14:31', '2024-01-16 13:14:31'),
(2, 63, 45, 240000, '2024-01-16 13:15:05', '2024-01-16 13:15:05'),
(3, 63, 45, 240000, '2024-01-16 13:16:04', '2024-01-16 13:16:04'),
(4, 63, 45, 240000, '2024-01-16 13:22:49', '2024-01-16 13:22:49'),
(5, 65, 45, 2313000, '2024-01-16 13:38:04', '2024-01-16 13:38:04'),
(6, 64, 45, 750000, '2024-01-16 14:08:55', '2024-01-16 14:08:55'),
(7, 69, 23, 29970000, '2024-01-16 14:13:33', '2024-01-16 14:13:33'),
(8, 68, 23, 26640000, '2024-01-16 14:13:33', '2024-01-16 14:13:33'),
(9, 67, 23, 0, '2024-01-16 14:13:33', '2024-01-16 14:13:33'),
(10, 67, 45, 4440000, '2024-01-16 14:15:13', '2024-01-16 14:15:13'),
(11, 121, 23, 2490840, '2024-01-26 09:04:38', '2024-01-26 09:04:38'),
(12, 121, 23, 2490840, '2024-01-27 11:15:46', '2024-01-27 11:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `dp_konsumens`
--

CREATE TABLE `dp_konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_konsumens` int(10) NOT NULL,
  `kode_akun` varchar(10) NOT NULL DEFAULT '1101',
  `kode` varchar(191) NOT NULL,
  `keterangan` varchar(191) NOT NULL DEFAULT '',
  `nominal` int(10) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giros`
--

CREATE TABLE `giros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `jenis` varchar(191) NOT NULL DEFAULT 'Giro',
  `kode` varchar(191) NOT NULL,
  `keterangan` text DEFAULT '',
  `nominal` double NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `tanggal_cair` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnals`
--

CREATE TABLE `jurnals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(100) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL,
  `tipe` varchar(20) NOT NULL DEFAULT 'Manual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_detils`
--

CREATE TABLE `jurnal_detils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_jurnals` int(10) NOT NULL DEFAULT 0,
  `kode_akun` int(10) NOT NULL DEFAULT 1101,
  `keterangan` text DEFAULT NULL,
  `tipe` varchar(1) NOT NULL DEFAULT 'D',
  `nominal` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_detils_temp`
--

CREATE TABLE `jurnal_detils_temp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` varchar(100) NOT NULL DEFAULT '0',
  `kode_akun` int(10) NOT NULL DEFAULT 1101,
  `keterangan` varchar(191) DEFAULT NULL,
  `tipe` varchar(1) NOT NULL DEFAULT 'D',
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
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `keterangan` varchar(191) DEFAULT NULL,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_barangs`
--

INSERT INTO `kategori_barangs` (`id`, `kode`, `nama`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'UM', 'UMUM', '-', 'Active', '2023-02-05 10:51:34', '2023-02-05 10:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `konsumens`
--

CREATE TABLE `konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `tipe_konsumen` varchar(191) NOT NULL DEFAULT 'Umum',
  `alamat` text DEFAULT NULL,
  `contact_person` varchar(191) DEFAULT NULL,
  `no_hp` varchar(191) DEFAULT NULL,
  `npwp` varchar(191) DEFAULT NULL,
  `alamat_npwp` text DEFAULT NULL,
  `nama_group` varchar(191) DEFAULT NULL,
  `no_rekening` varchar(191) DEFAULT NULL,
  `keterangan` varchar(191) DEFAULT NULL,
  `termin` int(10) NOT NULL DEFAULT 30,
  `limit_piutang` double DEFAULT 0,
  `piutang` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsumens`
--

INSERT INTO `konsumens` (`id`, `kode`, `nama`, `tipe_konsumen`, `alamat`, `contact_person`, `no_hp`, `npwp`, `alamat_npwp`, `nama_group`, `no_rekening`, `keterangan`, `termin`, `limit_piutang`, `piutang`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'CUST-0001', 'A AN SM', 'Umum', '-', '-', '0', '-', '-', '', '', '', 30, 1000000000, 1700840, 'Active', '2024-01-27 11:15:46', '2024-01-26 09:04:46'),
(2, 'CUST-0002', 'A BIE RB', 'Umum', '-', '0', '0', '0', '-', '', '', '-', 30, 1000000000, 0, 'Active', '2024-01-16 14:08:55', '2024-01-20 13:05:55'),
(3, 'CUST-0003', 'A BIE RT', 'Umum', '-', '-', '0', '-', '-', '', '', '-', 30, 100000000, 2448000, 'Active', '2023-12-28 15:45:58', '2024-01-15 11:01:22'),
(4, 'CUST-0004', 'A BUN ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(5, 'CUST-0005', 'A CHAI / KWETIAW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(6, 'CUST-0006', 'A CHAN LEMBAH MURAI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(7, 'CUST-0007', 'A CONG', 'Umum', '-', '-', '0', '0', '-', '', '', '', 30, 1000000, 42180, 'Active', '2023-12-28 15:45:58', '2024-01-24 11:21:07'),
(8, 'CUST-0008', 'A FU', 'Umum', '-', '-', '0', '-', '-', '', '', '-', 30, 5000000, 0, 'Active', '2024-01-16 13:38:04', '2024-01-16 13:41:37'),
(9, 'CUST-0009', 'A HENG', 'Umum', '-', '0', '0', '-', '-', '', '', 'p', 30, 1000000000, 856903, 'Active', '2023-12-28 15:45:58', '2024-01-13 10:45:52'),
(10, 'CUST-0010', 'A HIAN 100', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(11, 'CUST-0011', 'A HIAN 91', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(12, 'CUST-0012', 'A HIAN PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(13, 'CUST-0013', 'A HIE KB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(14, 'CUST-0014', 'A HIN SOSOK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(15, 'CUST-0015', 'A HONG / SERDAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(16, 'CUST-0016', 'A HONG / TOKO KACANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(17, 'CUST-0017', 'A HUAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(18, 'CUST-0018', 'A HUI / PENITI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(19, 'CUST-0019', 'A HUI KUD', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(20, 'CUST-0020', 'A KHIM / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(21, 'CUST-0021', 'A KIAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(22, 'CUST-0022', 'A KUET', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(23, 'CUST-0023', 'A LAK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(24, 'CUST-0024', 'A LUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(25, 'CUST-0025', 'A MENG FJP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(26, 'CUST-0026', 'A MENG HB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(27, 'CUST-0027', 'A PUE / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(28, 'CUST-0028', 'A SANG / JL.SIAK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(29, 'CUST-0029', 'A SAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(30, 'CUST-0030', 'A SIEN MANDOR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(31, 'CUST-0031', 'A THAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(32, 'CUST-0032', 'A TOI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(33, 'CUST-0033', 'ABU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(34, 'CUST-0034', 'ABUN GAMA 1', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(35, 'CUST-0035', 'ACHUAN / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(36, 'CUST-0036', 'ACI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(37, 'CUST-0037', 'ACUN MS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(38, 'CUST-0038', 'ADI KASEN / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(39, 'CUST-0039', 'ADI SE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(40, 'CUST-0040', 'ADITYA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(41, 'CUST-0041', 'AGNES / OBOR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(42, 'CUST-0042', 'AGUNG / JAWI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(43, 'CUST-0043', 'AGUNG / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(44, 'CUST-0044', 'AHANG CI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(45, 'CUST-0045', 'AHENG / PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(46, 'CUST-0046', 'AHIAN / MELIAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(47, 'CUST-0047', 'AHIAN BAKMI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(48, 'CUST-0048', 'AHIAN / PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(49, 'CUST-0049', 'AHIE / FAMILY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(50, 'CUST-0050', 'AHIE MM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(51, 'CUST-0051', 'AHIE M. SOHOR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(52, 'CUST-0052', 'AHONG HEPIO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(53, 'CUST-0053', 'AHONG HUMOK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(54, 'CUST-0054', 'AHONG / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(55, 'CUST-0055', 'AHONG / WAHIDIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(56, 'CUST-0056', 'AHUA BAHAGIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(57, 'CUST-0057', 'AHUA CAMAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(58, 'CUST-0058', 'AHUA DK ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(59, 'CUST-0059', 'AHUA JOHAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(60, 'CUST-0060', 'AHUA SB / SERDAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(61, 'CUST-0061', 'AHUANG SUJ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(62, 'CUST-0062', 'AHUAT GP / GALAXY PONSEL ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(63, 'CUST-0063', 'AHUN / DHARMA BAKTI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(64, 'CUST-0064', 'AI LING', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(65, 'CUST-0065', 'AJI SAPUTRA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(66, 'CUST-0066', 'AJU  ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(67, 'CUST-0067', 'AJUN / SANGGAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(68, 'CUST-0068', 'AKANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(69, 'CUST-0069', 'AKHIANG / AMBAWANG ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(70, 'CUST-0070', 'AKHIN / AYANI 2', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(71, 'CUST-0071', 'AKHIONG / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(72, 'CUST-0072', 'AKHONG / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(73, 'CUST-0073', 'AKIAN GM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(74, 'CUST-0074', 'AKUAN / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(75, 'CUST-0075', 'AKUANG / PAL 5', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(76, 'CUST-0076', 'AKUANG NA ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(77, 'CUST-0077', 'AKUN AI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(78, 'CUST-0078', 'ALAN / JAWI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(79, 'CUST-0079', 'ALEK / SKW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(80, 'CUST-0080', 'ALENG / JL. SIAM ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(81, 'CUST-0081', 'ALI NURDIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(82, 'CUST-0082', 'ALI PERUM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(83, 'CUST-0083', 'ALI PM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(84, 'CUST-0084', 'ALIANG HM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(85, 'CUST-0085', 'ALIANG / P.MELATI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(86, 'CUST-0086', 'ALIANG PNM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(87, 'CUST-0087', 'ALIANG / TANPUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(88, 'CUST-0088', 'ALING TCS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(89, 'CUST-0089', 'ALIONG / JL. PUYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(90, 'CUST-0090', 'ALU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(91, 'CUST-0091', 'ALUAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(92, 'CUST-0092', 'AMAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(93, 'CUST-0093', 'AMENG BAKSO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(94, 'CUST-0094', 'AMENG EKO ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(95, 'CUST-0095', 'AMENG LILIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(96, 'CUST-0096', 'AMENG / MARTADINATA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(97, 'CUST-0097', 'AMENG SM / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(98, 'CUST-0098', 'AMENG TK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(99, 'CUST-0099', 'AMI KANTIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(100, 'CUST-0100', 'AMIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(101, 'CUST-0101', 'AMING WK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(102, 'CUST-0102', 'AMOI SOSIS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(103, 'CUST-0103', 'AMONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(104, 'CUST-0104', 'AMUI / SETIA BUDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(105, 'CUST-0105', 'AMUN MT / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(106, 'CUST-0106', 'AMUNG / SUI PINYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(107, 'CUST-0107', 'ANA / ALIANYANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(108, 'CUST-0108', 'ANA SM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(109, 'CUST-0109', 'ANDARIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(110, 'CUST-0110', 'ANDI / AON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(111, 'CUST-0111', 'ANDI KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(112, 'CUST-0112', 'ANDI SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(113, 'CUST-0113', 'ANDREAS EKO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(114, 'CUST-0114', 'ANDREAS GAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(115, 'CUST-0115', 'ANDRI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(116, 'CUST-0116', 'ANEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(117, 'CUST-0117', 'ANEN / SANGGAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(118, 'CUST-0118', 'ANGIE ES KRIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(119, 'CUST-0119', 'ANGO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(120, 'CUST-0120', 'ANGUAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(121, 'CUST-0121', 'ANGUAN SC', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(122, 'CUST-0122', 'ANI GFK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(123, 'CUST-0123', 'ANI PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(124, 'CUST-0124', 'ANITA INTI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(125, 'CUST-0125', 'ANTON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(126, 'CUST-0126', 'ANTON / PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(127, 'CUST-0127', 'ANTONIE DF', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(128, 'CUST-0128', 'ANTONIUS SUSANTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(129, 'CUST-0129', 'ANYIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(130, 'CUST-0130', 'ANYIT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(131, 'CUST-0131', 'APHENG / SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(132, 'CUST-0132', 'APHIN / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(133, 'CUST-0133', 'APHIN / PANGLIMA AIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(134, 'CUST-0134', 'APHIN / SMPNG CHAI PHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(135, 'CUST-0135', 'APHUI / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(136, 'CUST-0136', 'APIT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(137, 'CUST-0137', 'APIU / PARWASAL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(138, 'CUST-0138', 'APIU / SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(139, 'CUST-0139', 'APO 166 ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(140, 'CUST-0140', 'APO DARMADI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(141, 'CUST-0141', 'ARIPEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(142, 'CUST-0142', 'ASAN / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(143, 'CUST-0143', 'ASE / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(144, 'CUST-0144', 'ASEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(145, 'CUST-0145', 'ASEN / TANHUL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(146, 'CUST-0146', 'ASENG FK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(147, 'CUST-0147', 'ASENG HARMONI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(148, 'CUST-0148', 'ASENG SJ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(149, 'CUST-0149', 'ASIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(150, 'CUST-0150', 'ASIA 12', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(151, 'CUST-0151', 'ASIA / MERANTI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(152, 'CUST-0152', 'ASIA / TANJUNG SARI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(153, 'CUST-0153', 'ASIANG A.L', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(154, 'CUST-0154', 'ASIANG HE MUE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(155, 'CUST-0155', 'ASIANG ROTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(156, 'CUST-0156', 'ASIANG TM /TOTAL MOTOR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(157, 'CUST-0157', 'ASIAU AB / ANEKA BUSANA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(158, 'CUST-0158', 'ASIEN PERINTIS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(159, 'CUST-0159', 'ASIN / GG.AREN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(160, 'CUST-0160', 'ASNA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(161, 'CUST-0161', 'ASONG SJ / TANPUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(162, 'CUST-0162', 'ASUAN / MELIAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(163, 'CUST-0163', 'ASUAN / PARIT PANGERAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(164, 'CUST-0164', 'ASUN / JAWI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(165, 'CUST-0165', 'ATEK UMUT TARIP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(166, 'CUST-0166', 'ATHENG / SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(167, 'CUST-0167', 'ATHON / SEI DURI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(168, 'CUST-0168', 'ATHONG KT ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(169, 'CUST-0169', 'ATI BB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(170, 'CUST-0170', 'ATI PK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(171, 'CUST-0171', 'ATIAN / JAWI ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(172, 'CUST-0172', 'ATIE / DPN HOTEL PEONY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(173, 'CUST-0173', 'ATIE ASAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(174, 'CUST-0174', 'ATIE TJ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(175, 'CUST-0175', 'AU HARAPAN / FLAMBOYAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(176, 'CUST-0176', 'AWANNI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(177, 'CUST-0177', 'AWI / GG.BUSRI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(178, 'CUST-0178', 'AWI MU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(179, 'CUST-0179', 'AYANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(180, 'CUST-0180', 'AYAU ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(181, 'CUST-0181', 'BADAR ALMAL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(182, 'CUST-0182', 'BAK HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(183, 'CUST-0183', 'BAKMIE JUHUI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(184, 'CUST-0184', 'BAMBANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(185, 'CUST-0185', 'BAMBANG / JERUJU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(186, 'CUST-0186', 'BAN SIONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(187, 'CUST-0187', 'BASIL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(188, 'CUST-0188', 'BENNY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(189, 'CUST-0189', 'BIE CHUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(190, 'CUST-0190', 'BOBBY DARMAWAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(191, 'CUST-0191', 'BOBBY ML', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(192, 'CUST-0192', 'BONG KET PHIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(193, 'CUST-0193', 'BU ANWAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(194, 'CUST-0194', 'BUDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(195, 'CUST-0195', 'BUDI / JL.MELIAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(196, 'CUST-0196', 'BUDI / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(197, 'CUST-0197', 'BUDI / SINGKAWANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(198, 'CUST-0198', 'BUDIANTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(199, 'CUST-0199', 'BUN HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(200, 'CUST-0200', 'BUN HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(201, 'CUST-0201', 'BUN KUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(202, 'CUST-0202', 'CAM JUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(203, 'CUST-0203', 'CANDRA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(204, 'CUST-0204', 'CE AN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(205, 'CUST-0205', 'CE HAK PK ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(206, 'CUST-0206', 'CENG KHIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(207, 'CUST-0207', 'CENG LUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(208, 'CUST-0208', 'CENG SIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(209, 'CUST-0209', 'CHAI PHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(210, 'CUST-0210', 'CHAI SUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(211, 'CUST-0211', 'CHANG HO KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(212, 'CUST-0212', 'CHEN FEI FEI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(213, 'CUST-0213', 'CHRISTIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(214, 'CUST-0214', 'CHUN MOU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(215, 'CUST-0215', 'CHUN NEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(216, 'CUST-0216', 'CIN SUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(217, 'CUST-0217', 'CUN HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(218, 'CUST-0218', 'CUN KHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(219, 'CUST-0219', 'DANNY KR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(220, 'CUST-0220', 'DANNY VISTA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(221, 'CUST-0221', 'DEA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(222, 'CUST-0222', 'DEDEK MUJIANTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(223, 'CUST-0223', 'DELLA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(224, 'CUST-0224', 'DENI / ADISUCIPTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(225, 'CUST-0225', 'DENNY TANPUR ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(226, 'CUST-0226', 'DESI CHRISTINE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(227, 'CUST-0227', 'DESI FRANSISCA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(228, 'CUST-0228', 'DIAN / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(229, 'CUST-0229', 'DINA / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(230, 'CUST-0230', 'DJONO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(231, 'CUST-0231', 'DR.ROSE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(232, 'CUST-0232', 'DWI SO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(233, 'CUST-0233', 'EDDY COM ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(234, 'CUST-0234', 'EDDY PNM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(235, 'CUST-0235', 'EDDY / SINTANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(236, 'CUST-0236', 'EDWIN / SOEPRAPTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(237, 'CUST-0237', 'EDY LT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(238, 'CUST-0238', 'EFFENDY TJHANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(239, 'CUST-0239', 'ELLYANTI AP.G', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(240, 'CUST-0240', 'ENG UI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(241, 'CUST-0241', 'EPY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(242, 'CUST-0242', 'ERIC', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(243, 'CUST-0243', 'ERISMAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(244, 'CUST-0244', 'ERLINA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(245, 'CUST-0245', 'ERNA / GG.KUINI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(246, 'CUST-0246', 'ERWAN / IMBON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(247, 'CUST-0247', 'ERWIN PERDANA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(248, 'CUST-0248', 'ERWIN / SETIA BUDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(249, 'CUST-0249', 'ERWIN WO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(250, 'CUST-0250', 'EVI MULIANTI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(251, 'CUST-0251', 'FANY JP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(252, 'CUST-0252', 'FELIX / PUTUSSIBAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(253, 'CUST-0253', 'FENDI FM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(254, 'CUST-0254', 'FENDI KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(255, 'CUST-0255', 'FENDI MN / MITRA NELAYAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(256, 'CUST-0256', 'FENDY HANS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(257, 'CUST-0257', 'FENDY PARIS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(258, 'CUST-0258', 'FENDY WONGSO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(259, 'CUST-0259', 'FIE FEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(260, 'CUST-0260', 'FITRI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(261, 'CUST-0261', 'FO KU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(262, 'CUST-0262', 'FO YAU HUAT / KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(263, 'CUST-0263', 'FUI JAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(264, 'CUST-0264', 'GLORY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(265, 'CUST-0265', 'GOI KHENG COK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(266, 'CUST-0266', 'GRACE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(267, 'CUST-0267', 'GUNAWAN / FLAMBOYAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(268, 'CUST-0268', 'GUNAWAN / VILLA CERIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(269, 'CUST-0269', 'GWEK HUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(270, 'CUST-0270', 'HADI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(271, 'CUST-0271', 'HAJI SALIMIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(272, 'CUST-0272', 'HAK HIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(273, 'CUST-0273', 'HAN LIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(274, 'CUST-0274', 'HANS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(275, 'CUST-0275', 'HAPPY / PONTIANAK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(276, 'CUST-0276', 'HAPPY / TANPUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(277, 'CUST-0277', 'HARYANSYAH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(278, 'CUST-0278', 'HENDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(279, 'CUST-0279', 'HENDRA / KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(280, 'CUST-0280', 'HENDRA HB / SERDAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(281, 'CUST-0281', 'HENDRIMIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(282, 'CUST-0282', 'HENDRO / ANTASARI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(283, 'CUST-0283', 'HENDY CC9', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(284, 'CUST-0284', 'HENG HANG CHIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(285, 'CUST-0285', 'HENGKY / JERUJU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(286, 'CUST-0286', 'HENGKY STM ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(287, 'CUST-0287', 'HERMANTO / IMBON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(288, 'CUST-0288', 'HERO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(289, 'CUST-0289', 'HERRY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(290, 'CUST-0290', 'HERRY / SUI RAYA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(291, 'CUST-0291', 'HERY BERTUS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(292, 'CUST-0292', 'HERY / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(293, 'CUST-0293', 'HO CHIANG / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(294, 'CUST-0294', 'HON FIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(295, 'CUST-0295', 'HONG HAK / GAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(296, 'CUST-0296', 'HONG HAK / STM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(297, 'CUST-0297', 'HONG SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(298, 'CUST-0298', 'HONGGO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(299, 'CUST-0299', 'HUA KHIANG / BATU AMPAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(300, 'CUST-0300', 'HUI CHUAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(301, 'CUST-0301', 'HUI HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(302, 'CUST-0302', 'HUI SUAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(303, 'CUST-0303', 'I LENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(304, 'CUST-0304', 'IAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(305, 'CUST-0305', 'IBU ANI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(306, 'CUST-0306', 'IBU AGUSTIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(307, 'CUST-0307', 'IBU HERMAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(308, 'CUST-0308', 'IBU NATALRIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(309, 'CUST-0309', 'IBU YANI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(310, 'CUST-0310', 'INDRA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(311, 'CUST-0311', 'ISKANDAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(312, 'CUST-0312', 'ISKANDAR HALIM / LIGA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(313, 'CUST-0313', 'IVAN / PARIT PANGERAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(314, 'CUST-0314', 'IVINA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(315, 'CUST-0315', 'IYAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(316, 'CUST-0316', 'IYAN YMS ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(317, 'CUST-0317', 'JAINUDDIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(318, 'CUST-0318', 'JAJANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(319, 'CUST-0319', 'JAKE SONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(320, 'CUST-0320', 'JAN KHIONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(321, 'CUST-0321', 'JAYDEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(322, 'CUST-0322', 'JIN HOK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(323, 'CUST-0323', 'JIN KUI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(324, 'CUST-0324', 'JIN UI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(325, 'CUST-0325', 'JODY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(326, 'CUST-0326', 'JOHAN / JAWI SQ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58');
INSERT INTO `konsumens` (`id`, `kode`, `nama`, `tipe_konsumen`, `alamat`, `contact_person`, `no_hp`, `npwp`, `alamat_npwp`, `nama_group`, `no_rekening`, `keterangan`, `termin`, `limit_piutang`, `piutang`, `aktif`, `created_at`, `updated_at`) VALUES
(327, 'CUST-0327', 'JOHAN ASAHAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(328, 'CUST-0328', 'JOHAN GG BANGAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(329, 'CUST-0329', 'JONI / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(330, 'CUST-0330', 'JONI DANSEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(331, 'CUST-0331', 'JOSEPH SE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(332, 'CUST-0332', 'JU SONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(333, 'CUST-0333', 'JUNAIDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(334, 'CUST-0334', 'JUNG NEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(335, 'CUST-0335', 'JUN FONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(336, 'CUST-0336', 'JUN LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(337, 'CUST-0337', 'JUTOLI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(338, 'CUST-0338', 'KANG MENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(339, 'CUST-0339', 'KHIOK MENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(340, 'CUST-0340', 'KHOU BUN HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(341, 'CUST-0341', 'KHOU HUI HONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(342, 'CUST-0342', 'KHUI PHENG / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(343, 'CUST-0343', 'KHUN KIAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(344, 'CUST-0344', 'KHUN NAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(345, 'CUST-0345', 'KIKI HT / HASIL TANI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(346, 'CUST-0346', 'KIKY / GALAXI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(347, 'CUST-0347', 'KIM IE / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(348, 'CUST-0348', 'KIM SIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(349, 'CUST-0349', 'KUANG SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(350, 'CUST-0350', 'KUANG TIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(351, 'CUST-0351', 'KUI CHIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(352, 'CUST-0352', 'KWEK CHUAN / KETAPANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(353, 'CUST-0353', 'LAU KIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(354, 'CUST-0354', 'LAY KIM NEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(355, 'CUST-0355', 'LENG SIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(356, 'CUST-0356', 'LESTARI ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(357, 'CUST-0357', 'LIAK KUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(358, 'CUST-0358', 'LIANG KUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(359, 'CUST-0359', 'LIANTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(360, 'CUST-0360', 'LIAU HI JUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(361, 'CUST-0361', 'LIBRA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(362, 'CUST-0362', 'LIK KI / SUI PINYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(363, 'CUST-0363', 'LIDAYYAH NIKMATAKA SARI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(364, 'CUST-0364', 'LILIS / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(365, 'CUST-0365', 'LIE HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(366, 'CUST-0366', 'LILY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(367, 'CUST-0367', 'LILY SANTI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(368, 'CUST-0368', 'LIM BUN HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(369, 'CUST-0369', 'LIM CHAI HUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(370, 'CUST-0370', 'LIM CIAP KIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(371, 'CUST-0371', 'LIM GEK PHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(372, 'CUST-0372', 'LIM HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(373, 'CUST-0373', 'LIM HUI KENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(374, 'CUST-0374', 'LIM JAK WENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(375, 'CUST-0375', 'LIM JU CHIAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(376, 'CUST-0376', 'LIM KAW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(377, 'CUST-0377', 'LIM LIE HUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(378, 'CUST-0378', 'LIM SOK YONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(379, 'CUST-0379', 'LIM TAU SE / JERUJU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(380, 'CUST-0380', 'LIM TEK HIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(381, 'CUST-0381', 'LIM TET SIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(382, 'CUST-0382', 'LIM TONG TIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(383, 'CUST-0383', 'LIM YAK NGOU / TOKO KITA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(384, 'CUST-0384', 'LINA / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(385, 'CUST-0385', 'LINA GAMA20', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(386, 'CUST-0386', 'LINA PJ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(387, 'CUST-0387', 'LINA PNM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(388, 'CUST-0388', 'LINDA JOHAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(389, 'CUST-0389', 'LINDA SUPRAPTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(390, 'CUST-0390', 'LIP TIE / SERDAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(391, 'CUST-0391', 'LITA KP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(392, 'CUST-0392', 'LIUNG JIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(393, 'CUST-0393', 'LO FU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(394, 'CUST-0394', 'LONG HONG ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(395, 'CUST-0395', 'LONG THAI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(396, 'CUST-0396', 'LUCKY PETSHOP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(397, 'CUST-0397', 'LUCKY JAYA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(398, 'CUST-0398', 'LUKITO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(399, 'CUST-0399', 'LULU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(400, 'CUST-0400', 'M. JAMIUN ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(401, 'CUST-0401', 'MAHMUD KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(402, 'CUST-0402', 'M. TAMRIN / KIU ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(403, 'CUST-0403', 'M. WAHYUDI GS ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(404, 'CUST-0404', 'MARLINA / SUI PINYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(405, 'CUST-0405', 'MARTINI / SEMITAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(406, 'CUST-0406', 'MELOHERLINA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(407, 'CUST-0407', 'MENG JU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(408, 'CUST-0408', 'MERRY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(409, 'CUST-0409', 'MERRY KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(410, 'CUST-0410', 'MERRY / KARYA BARU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(411, 'CUST-0411', 'MI CIN / SUI PINYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(412, 'CUST-0412', 'MIAU TONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(413, 'CUST-0413', 'MIE MIE ', 'Umum', '-', '-', '0', '-', '-', '', '', '', 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2024-01-16 13:08:12'),
(414, 'CUST-0414', 'MIN CIT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(415, 'CUST-0415', 'MIMI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(416, 'CUST-0416', 'MONICA ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(417, 'CUST-0417', 'MOU CHIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(418, 'CUST-0418', 'MU DJI PHIAU / KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(419, 'CUST-0419', 'MUI LAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(420, 'CUST-0420', 'MUI SEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(421, 'CUST-0421', 'MULYADI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(422, 'CUST-0422', 'NAI BU HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(423, 'CUST-0423', 'NAM HUAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(424, 'CUST-0424', 'NAM KIT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(425, 'CUST-0425', 'NATUNA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(426, 'CUST-0426', 'NELLY SURIYANI / SERDADU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(427, 'CUST-0427', 'NGAK LIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(428, 'CUST-0428', 'NIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(429, 'CUST-0429', 'NICOL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(430, 'CUST-0430', 'NIKEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(431, 'CUST-0431', 'NINGSIH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(432, 'CUST-0432', 'NORDU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(433, 'CUST-0433', 'NOVITA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(434, 'CUST-0434', 'NOVITA / ST. M', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(435, 'CUST-0435', 'NURUL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(436, 'CUST-0436', 'NY. SAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(437, 'CUST-0437', 'NYIT SIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(438, 'CUST-0438', 'NYUK KHIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(439, 'CUST-0439', 'OEI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(440, 'CUST-0440', 'OI CU / SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(441, 'CUST-0441', 'OKTA / AP.MERDEKA TIMUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(442, 'CUST-0442', 'OM JACK / PODOMORO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(443, 'CUST-0443', 'OU KIE SUDIRMAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(444, 'CUST-0444', 'OU KIE TANPUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(445, 'CUST-0445', 'PAK ABAS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(446, 'CUST-0446', 'PAK AKON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(447, 'CUST-0447', 'PAK AMAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(448, 'CUST-0448', 'PAK AYUB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(449, 'CUST-0449', 'PAK CHAI PNM ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(450, 'CUST-0450', 'PAK CHEE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(451, 'CUST-0451', 'PAK DANAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(452, 'CUST-0452', 'PAK HENDRA / SLT PANJANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(453, 'CUST-0453', 'PAK HOLDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(454, 'CUST-0454', 'PAK JAHRONI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(455, 'CUST-0455', 'PAK JAMIL ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(456, 'CUST-0456', 'PAK KHUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(457, 'CUST-0457', 'PAK MARZUKI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(458, 'CUST-0458', 'PAK NGUAN CUA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(459, 'CUST-0459', 'PAK SITO ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(460, 'CUST-0460', 'PAK TEGUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(461, 'CUST-0461', 'PATHOR ROZI KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(462, 'CUST-0462', 'PENG HUI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(463, 'CUST-0463', 'PENG KUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(464, 'CUST-0464', 'PENG SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(465, 'CUST-0465', 'PETRUS TONI / SANGGAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(466, 'CUST-0466', 'PHE IE MOUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(467, 'CUST-0467', 'PHENG UI AS', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(468, 'CUST-0468', 'PHENG YAU / JAWI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(469, 'CUST-0469', 'PHILIP', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(470, 'CUST-0470', 'PIA NAI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(471, 'CUST-0471', 'PIAK HONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(472, 'CUST-0472', 'PIT JUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(473, 'CUST-0473', 'PO LIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(474, 'CUST-0474', 'PO SIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(475, 'CUST-0475', 'PUE MENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(476, 'CUST-0476', 'PUI KIAN LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(477, 'CUST-0477', 'RAHMAT / AMPERA RAYA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(478, 'CUST-0478', 'RATNA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(479, 'CUST-0479', 'RENY MARGILAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(480, 'CUST-0480', 'RIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(481, 'CUST-0481', 'RIAN WK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(482, 'CUST-0482', 'RIEN / RS SUDARSO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(483, 'CUST-0483', 'RICKY / SABLON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(484, 'CUST-0484', 'RIRIN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(485, 'CUST-0485', 'ROBERT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(486, 'CUST-0486', 'ROMMY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(487, 'CUST-0487', 'ROSA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(488, 'CUST-0488', 'ROY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(489, 'CUST-0489', 'RUDY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(490, 'CUST-0490', 'RUSIAH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(491, 'CUST-0491', 'RYCO SM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(492, 'CUST-0492', 'SA KIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(493, 'CUST-0493', 'SABASTINUS LINDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(494, 'CUST-0494', 'SAN SAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(495, 'CUST-0495', 'SANDY  KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(496, 'CUST-0496', 'SANTI / AYAM INTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(497, 'CUST-0497', 'SANTI / PURNAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(498, 'CUST-0498', 'SANTI WK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(499, 'CUST-0499', 'SANTO / PAL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(500, 'CUST-0500', 'SE FONG / SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(501, 'CUST-0501', 'SE HIOK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(502, 'CUST-0502', 'SE KU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(503, 'CUST-0503', 'SE LU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(504, 'CUST-0504', 'SELVIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(505, 'CUST-0505', 'SELY / AP.AGUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(506, 'CUST-0506', 'SENG HUAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(507, 'CUST-0507', 'SENG MUI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(508, 'CUST-0508', 'SHOKEH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(509, 'CUST-0509', 'SIANG HAK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(510, 'CUST-0510', 'SIAU HIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(511, 'CUST-0511', 'SILVI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(512, 'CUST-0512', 'SIN LAI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(513, 'CUST-0513', 'SIN LUK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(514, 'CUST-0514', 'SISKA / JL.SIAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(515, 'CUST-0515', 'SIU LAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(516, 'CUST-0516', 'SIU LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(517, 'CUST-0517', 'SOFIATI / KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(518, 'CUST-0518', 'SOI YONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(519, 'CUST-0519', 'SONG KHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(520, 'CUST-0520', 'SONG LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(521, 'CUST-0521', 'SONG MENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(522, 'CUST-0522', 'SRI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(523, 'CUST-0523', 'SRI DEVIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(524, 'CUST-0524', 'SRI FITRIANA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(525, 'CUST-0525', 'SRIMARIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(526, 'CUST-0526', 'SRIWALITA KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(527, 'CUST-0527', 'SRIWARA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(528, 'CUST-0528', 'SRIWATI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(529, 'CUST-0529', 'STEVANIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(530, 'CUST-0530', 'SU HIOK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(531, 'CUST-0531', 'SU KANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(532, 'CUST-0532', 'SU PHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(533, 'CUST-0533', 'SUI BUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(534, 'CUST-0534', 'SUI HIAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(535, 'CUST-0535', 'SUI HUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(536, 'CUST-0536', 'SUI JUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(537, 'CUST-0537', 'SUN HIEN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(538, 'CUST-0538', 'SUN HIONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(539, 'CUST-0539', 'SUN LENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(540, 'CUST-0540', 'SUNARYO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(541, 'CUST-0541', 'SUN MENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(542, 'CUST-0542', 'SUNNY SOON', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(543, 'CUST-0543', 'SURIPTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(544, 'CUST-0544', 'SUTANTO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(545, 'CUST-0545', 'SWAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(546, 'CUST-0546', 'TAN CIE PHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(547, 'CUST-0547', 'TAN KIANG SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(548, 'CUST-0548', 'TAN NYIAP SONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(549, 'CUST-0549', 'TAN TOU BUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(550, 'CUST-0550', 'TAU HUAT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(551, 'CUST-0551', 'TEDDY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(552, 'CUST-0552', 'TEDDY TANDRA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(553, 'CUST-0553', 'TEGUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(554, 'CUST-0554', 'TEK LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(555, 'CUST-0555', 'THAI LIE / KB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(556, 'CUST-0556', 'THAI LIE / SD', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(557, 'CUST-0557', 'THE A TANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(558, 'CUST-0558', 'THEN MUI PO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(559, 'CUST-0559', 'THIAN CHAI / GAMA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(560, 'CUST-0560', 'THIAM MENG PNM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(561, 'CUST-0561', 'THIAN MENG / SKW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(562, 'CUST-0562', 'THUNG MUK KHIONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(563, 'CUST-0563', 'TIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(564, 'CUST-0564', 'TIARA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(565, 'CUST-0565', 'TIE KIANG / SEGEDONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(566, 'CUST-0566', 'TIO KHUN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(567, 'CUST-0567', 'TIO PO AN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(568, 'CUST-0568', 'TIO PUE HUANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(569, 'CUST-0569', 'TIO SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(570, 'CUST-0570', 'TITA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(571, 'CUST-0571', 'TITI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(572, 'CUST-0572', 'TJHIA MUI LIE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(573, 'CUST-0573', 'TJHIN FA KHIONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(574, 'CUST-0574', 'TJIO HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(575, 'CUST-0575', 'TOHAK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(576, 'CUST-0576', 'TOMI JAWI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(577, 'CUST-0577', 'TONG SENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(578, 'CUST-0578', 'TONI / CENTRAL', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(579, 'CUST-0579', 'TONO S.PANJNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(580, 'CUST-0580', 'TRI / KOBAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(581, 'CUST-0581', 'TRI HUSADA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(582, 'CUST-0582', 'TRI NOVIYANTI / AP.MERDEKA TIMUR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(583, 'CUST-0583', 'TUA LAU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(584, 'CUST-0584', 'TUNG TUNG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(585, 'CUST-0585', 'U LIANG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(586, 'CUST-0586', 'UMAS KANDAR', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(587, 'CUST-0587', 'UMI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(588, 'CUST-0588', 'URAY KIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(589, 'CUST-0589', 'VERONIKA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(590, 'CUST-0590', 'VENI ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(591, 'CUST-0591', 'VIANNA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(592, 'CUST-0592', 'VICTOR WIJAYA SJ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(593, 'CUST-0593', 'VILOCI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(594, 'CUST-0594', 'VINA ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(595, 'CUST-0595', 'VINA / PARIT PEKONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(596, 'CUST-0596', 'VINCENT', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(597, 'CUST-0597', 'VIVI / NUSA INDAH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(598, 'CUST-0598', 'VIVI YULIANA ( TODDIE )', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(599, 'CUST-0599', 'WAHYU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(600, 'CUST-0600', 'WANG ASONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(601, 'CUST-0601', 'WEDY', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(602, 'CUST-0602', 'WELSA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(603, 'CUST-0603', 'WENDY / MENARA PLASTIK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(604, 'CUST-0604', 'WENDY LO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(605, 'CUST-0605', 'WENG LONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(606, 'CUST-0606', 'WIDYA DK', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(607, 'CUST-0607', 'WILLIAM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(608, 'CUST-0608', 'WILLIAN / AP.ANDALAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(609, 'CUST-0609', 'WILLYONO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(610, 'CUST-0610', 'WIWI LO ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(611, 'CUST-0611', 'YANTI CIPTA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(612, 'CUST-0612', 'YANTI SIANTAN', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(613, 'CUST-0613', 'YANTO HALIM', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(614, 'CUST-0614', 'YANTO S.PINYUH', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(615, 'CUST-0615', 'YAU KHENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(616, 'CUST-0616', 'YO HUAN KHIU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(617, 'CUST-0617', 'YOHANES TF', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(618, 'CUST-0618', 'YONG CHE', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(619, 'CUST-0619', 'YONO', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(620, 'CUST-0620', 'YUDI NARDI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(621, 'CUST-0621', 'YULIA', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(622, 'CUST-0622', 'YULI HF', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(623, 'CUST-0623', 'PT. AGRO LESTARI MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(624, 'CUST-0624', 'PT. AGRO LESTARI SENTOSA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(625, 'CUST-0625', 'PT. BANGUN NUSA MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(626, 'CUST-0626', 'PT. BINASAWIT ABADIPRATAMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(627, 'CUST-0627', 'PT. BUANA WIRALESTARI MAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(628, 'CUST-0628', 'PT. BUMI PERMAI LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(629, 'CUST-0629', 'PT. BUMI SAWIT PERMAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(630, 'CUST-0630', 'PT. DJUANDA SAWIT LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(631, 'CUST-0631', 'PT. IVOMAS TUNGGAL ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(632, 'CUST-0632', 'PT. KENCANA GRAHA PERMAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(633, 'CUST-0633', 'PT. KRESNA DUTA AGROINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(634, 'CUST-0634', 'PT. PARAMITRA INTERNUSA PRATAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(635, 'CUST-0635', 'PT. PRISMA CIPTA MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(636, 'CUST-0636', 'PT. RAMAJAYA PRAMUKTI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(637, 'CUST-0637', 'PT. SAWIT MAS SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(638, 'CUST-0638', 'PT. SINAR KENCANA INTI PERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(639, 'CUST-0639', 'PT. SINAR MAS AGRO RESOURCES AND TECHNOLOGY TBK ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(640, 'CUST-0640', 'PT. SUMBER INDAH PERKASA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(641, 'CUST-0641', 'PT. TAPIAN NADENGGAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SMART', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(642, 'CUST-0642', 'KOP. PERKEBUNAN KELAPA SAWIT MITRA P.K', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(643, 'CUST-0643', 'KOP. PKS MITRA GAGA BEGULAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(644, 'CUST-0644', 'KOP. PKS MITRA GEREMPUNG KITAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(645, 'CUST-0645', 'KOPSA MITRA KENCANA SEHATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(646, 'CUST-0646', 'PT. ADINUSA CAKRA MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(647, 'CUST-0647', 'PT. ANUGERAH MAKMUR SEJATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(648, 'CUST-0648', 'PT. BUANA TUNAS SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58');
INSERT INTO `konsumens` (`id`, `kode`, `nama`, `tipe_konsumen`, `alamat`, `contact_person`, `no_hp`, `npwp`, `alamat_npwp`, `nama_group`, `no_rekening`, `keterangan`, `termin`, `limit_piutang`, `piutang`, `aktif`, `created_at`, `updated_at`) VALUES
(649, 'CUST-0649', 'PT. CAHAYA UNGGUL PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(650, 'CUST-0650', 'PT. CAKRADAYA SUKSES ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(651, 'CUST-0651', 'PT. DINAMIKA MULTI PRAKARSA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(652, 'CUST-0652', 'PT. DUTANUSA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(653, 'CUST-0653', 'PT. GADING TIRTA MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(654, 'CUST-0654', 'PT. KAPUASINDO PALM INDUSTRY', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(655, 'CUST-0655', 'PT. PERKASAMAS LANGGENG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(656, 'CUST-0656', 'PT. PRIMANUSA MITRASERASI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(657, 'CUST-0657', 'PT. SENTRAKARYA MANUNGGAL', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KENCANA', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(658, 'CUST-0658', 'PT.ERNA DJULIAWATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LYMAN GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(659, 'CUST-0659', 'PT. BUMI SUBUR LESTARI TANI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BRU GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(660, 'CUST-0660', 'PT. LINGGA TEJAWANA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BRU GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(661, 'CUST-0661', 'PT. PRAKARSA TANI SEJATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BRU GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(662, 'CUST-0662', 'PT. RESOURCES ALAM INDONESIA TBK.', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BRU GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(663, 'CUST-0663', 'PT. AEK TARUM', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(664, 'CUST-0664', 'PT. BINASAWIT MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(665, 'CUST-0665', 'PT. HUTAN KETAPANG INDUSTRY ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(666, 'CUST-0666', 'PT. LANANG AGRO BERSATU', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(667, 'CUST-0667', 'PT. SAWIT SELATAN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(668, 'CUST-0668', 'PT. TELAGA HIKMAH', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SAMPOERNA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(669, 'CUST-0669', 'PT. BHUMI SIMANGGARIS INDAH', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(670, 'CUST-0670', 'PT. BULUNGAN HIJAU PERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(671, 'CUST-0671', 'PT. KARANGJUANG HIJAU LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(672, 'CUST-0672', 'PT. TIRTA MADU SAWIT JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(673, 'CUST-0673', 'PT. BORNEO BHAKTI SEJAHTERA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(674, 'CUST-0674', 'PT. KETAPANG HIJAU LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(675, 'CUST-0675', 'PT. MARSAM CITRA ADIPERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(676, 'CUST-0676', 'PT. SETIA AGRO UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FAP GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(677, 'CUST-0677', 'PT. CITRA AGRO KENCANA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FRG GROUP / FIRST RESOURCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(678, 'CUST-0678', 'PT. KETAPANG AGRO LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FRG GROUP / FIRST RESOURCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(679, 'CUST-0679', 'PT. MAHA KARYA BERSAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FRG GROUP / FIRST RESOURCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(680, 'CUST-0680', 'PT. CITRA PALMA PERTIWI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BORNEO GROUP / FISRT RESORCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(681, 'CUST-0681', 'PT. KALIMANTAN AGRO MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BORNEO GROUP / FISRT RESORCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(682, 'CUST-0682', 'PT. SETIA AGRO ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BORNEO GROUP / FISRT RESORCES', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(683, 'CUST-0683', 'PT. BORNEO DAMAI LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(684, 'CUST-0684', 'PT. FALCON AGRI PERSADA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(685, 'CUST-0685', 'PT. LIMPAH SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(686, 'CUST-0686', 'PT. MITRA KARYA SENTOSA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(687, 'CUST-0687', 'PT. PALMDALE AGROASIA LESTARI MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(688, 'CUST-0688', 'PT. SWADAYA MUKTI PRAKARSA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(689, 'CUST-0689', 'PT. UMEKAH SARI PRATAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FANGIONO GROUP PONTIANAK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(690, 'CUST-0690', 'PT. AGRINUSA PERSADA MULIA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(691, 'CUST-0691', 'PT. AGRIPRIMA CIPTA PERSADA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(692, 'CUST-0692', 'PT. BERKAT SAWIT UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(693, 'CUST-0693', 'PT. CITRA MAHKOTA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(694, 'CUST-0694', 'PT. GRAHA AGRO NUSANTARA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(695, 'CUST-0695', 'PT. JATIM JAYA PERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(696, 'CUST-0696', 'PT. SWADAYA INDOPALMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(697, 'CUST-0697', 'PT. TH INDO PLANTATION ', 'Umum', '-', '-', '0', '-', '-', 'KPN GROUP (NINIK)', '', '-', 30, 5000000000, 2170050, 'Active', '2023-12-28 15:45:58', '2024-01-19 12:52:30'),
(698, 'CUST-0698', 'PT. ANUGERAH AGUNG PRIMA ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(699, 'CUST-0699', 'PT. BHRAMA BINABAKTI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(700, 'CUST-0700', 'PT. DWIWIRA LESTARI JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(701, 'CUST-0701', 'PT. ETAM BERSAMA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(702, 'CUST-0702', 'PT. FIRST LAMANDAU TIMBER INTERNATIONAL', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(703, 'CUST-0703', 'PT. GAWI BAHANDEP SAWIT MEKAR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(704, 'CUST-0704', 'PT. GENERAL AURA SEMARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(705, 'CUST-0705', 'PT. NATURA PASIFIC NUSANTARA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(706, 'CUST-0706', 'PT. SUKSES KARYA MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(707, 'CUST-0707', 'PT. TRIEKA AGRO NUSANTARA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(708, 'CUST-0708', 'PT. YUDHA WAHANA ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'TAP GROUP (VANY GRACIA)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(709, 'CUST-0709', 'PT. SUMBER KAPUAS SEJAHTERA ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(710, 'CUST-0710', 'PT. ADIJAYA MULIA', 'Perusahaan', '-', '0', '0', '0', 'a', 'DRM GROUP (PAK DODY)', '', '', 30, 1000000000, 606000, 'Active', '2023-12-28 15:45:58', '2024-01-25 08:29:18'),
(711, 'CUST-0711', 'PT. BORNEO KHATULISTIWA PRATAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(712, 'CUST-0712', 'PT. DUTA RENDRA MULYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(713, 'CUST-0713', 'PT. PERDANA SAWIT PLANTATION', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(714, 'CUST-0714', 'PT. RIMBUN SAWIT PAPUA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(715, 'CUST-0715', 'PT. SAWIT KHATULISTIWA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(716, 'CUST-0716', 'PT. AGRO BUMI KALTIM', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'PSG GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(717, 'CUST-0717', 'PT. ANUGERAH ENERGITAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'PSG GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(718, 'CUST-0718', 'PT. GLOBAL PRIMATAMA MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'PSG GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(719, 'CUST-0719', 'PT. ADITYA AGROINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(720, 'CUST-0720', 'PT. ALAM LESTARI INDAH', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(721, 'CUST-0721', 'PT. ARCHIPELAGO TIMUR ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(722, 'CUST-0722', 'PT. KARYA DEWI PUTRA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(723, 'CUST-0723', 'PT. LAHAN AGRO INTI KETAPANG  ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(724, 'CUST-0724', 'PT. PALMA ADINUSA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(725, 'CUST-0725', 'PT. PERMATA LESTARI JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'ADITYA GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(726, 'CUST-0726', 'PT. BUANA HIJAU ABADI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(727, 'CUST-0727', 'PT. DUTA AGRO PRIMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(728, 'CUST-0728', 'PT. GLOBAL KALIMANTAN MAKMUR ', 'Perusahaan', '-', '-', '0', '-', '-', 'HARTONO PLANTATION INDONESIA (TRIONO)', '-', '-', 30, 15000000000, 1434675, 'Active', '2023-12-28 15:45:58', '2024-01-26 08:07:48'),
(729, 'CUST-0729', 'PT. KIARA SAWIT ABADI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(730, 'CUST-0730', 'PT. PENITI SUNGAI PURUN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(731, 'CUST-0731', 'GARUDA MITRA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(732, 'CUST-0732', 'PT. ADILMART', 'Perusahaan', 'i', '0', '0', '0', 'i', 'SUPERMARKET', '', '', 30, 2000000000, 9146680, 'Active', '2023-12-28 15:45:58', '2024-01-17 09:07:20'),
(733, 'CUST-0733', 'PT. HARUM MANIS PERMAI', 'Perusahaan', '-', '-', '0', '-', '-', 'SUPERMARKET', '', '', 30, 100000000, 391275, 'Active', '2023-12-28 15:45:58', '2024-01-26 13:04:08'),
(734, 'CUST-0734', 'PT. KAISAR BAKERI PERDANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(735, 'CUST-0735', 'PT. KAISAR PERDANA MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(736, 'CUST-0736', 'PT. LIGO MITRA JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(737, 'CUST-0737', 'PT. MITRA RITELINDO LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(738, 'CUST-0738', 'PT. SIANTAN MAHKOTA JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(739, 'CUST-0739', 'PT. FAJAR AGRO KALIMANTAN', 'Perusahaan', '-', '-', '0', '-', '-', 'FKK GROUP', '-', '-', 30, 1000000000, 1959705, 'Active', '2023-12-28 15:45:58', '2024-01-25 14:05:59'),
(740, 'CUST-0740', 'PT. FAJAR BAHARI NUSANTARA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(741, 'CUST-0741', 'PT. FAJAR SAUDARA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(742, 'CUST-0742', 'PT. FAJAR TIRTA NATURAL', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(743, 'CUST-0743', 'PT. KALIMANTAN SAWIT KUSUMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(744, 'CUST-0744', 'PT. MITRA SAUDARA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(745, 'CUST-0745', 'PT. AGRINDO PRIMA NIAGA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(746, 'CUST-0746', 'PT. AGRO CIPTA PERSADA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(747, 'CUST-0747', 'PT. AGRO SUKSES LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(748, 'CUST-0748', 'PT. BUMI SENTOSA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(749, 'CUST-0749', 'PT. MAKMUR AGRO LESTARI   ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(750, 'CUST-0750', 'PT. BINTARA TANI NUSANTARA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(751, 'CUST-0751', 'PT. MEGASAWINDO PERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(752, 'CUST-0752', 'PT. MULTI JAYA PERKASA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(753, 'CUST-0753', 'PT. SUMATERA MAKMUR LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(754, 'CUST-0754', 'PT. SUMATERAJAYA AGRO LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SML GROUP / GUNAS GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(755, 'CUST-0755', 'PT. AGRONUSA INVESTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'WILMAR GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(756, 'CUST-0756', 'PT. BUMI PRATAMA KHATULISTIWA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'WILMAR GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(757, 'CUST-0757', 'PT. PERMATA HIJAU SARANA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'MPE GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(758, 'CUST-0758', 'PT. SINTANG AGRO MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'MPE GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(759, 'CUST-0759', 'BANK BRI SYARIAH', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(760, 'CUST-0760', 'BANK NEGARA INDONESIA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(761, 'CUST-0761', 'BANK SINARMAS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(762, 'CUST-0762', 'PT. BANK BUKOPIN CAB. PONTIANAK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(763, 'CUST-0763', 'PT. BANK CENTRAL ASIA TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(764, 'CUST-0764', 'PT. BANK CHINA CONSTRUCTION BANK INDONESIA TBK.', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(765, 'CUST-0765', 'PT. BANK CIMB NIAGA TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(766, 'CUST-0766', 'PT. BANK INDEX SELINDO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(767, 'CUST-0767', 'PT. BANK MANDIRI (PERSERO)', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(768, 'CUST-0768', 'PT. BANK MAYBANK INDONESIA TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(769, 'CUST-0769', 'PT. BANK MULTIARTA SENTOSA TBK.', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(770, 'CUST-0770', 'PT. BANK NATIONAL NOBU TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(771, 'CUST-0771', 'PT. BANK OCBC NISP TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(772, 'CUST-0772', 'PT. BANK PAN INDONESIA CAB. PTK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(773, 'CUST-0773', 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN BARAT', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(774, 'CUST-0774', 'PT. BANK RAKYAT INDONESIA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'BANK', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(775, 'CUST-0775', 'PT. REZEKI KENCANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'JULONG GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(776, 'CUST-0776', 'PT. WAHANA PLANTATION AND PRODUCTS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'JULONG GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(777, 'CUST-0777', 'CV. BUANA AGRO MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(778, 'CUST-0778', 'CV. DOLPHIN ', 'Perusahaan', '-', '-', '0', '-', '-', 'LAIN-LAIN', '-', '-', 60, 500000000000, 391275, 'Active', '2023-12-28 15:45:58', '2024-01-26 12:30:23'),
(779, 'CUST-0779', 'PT. AGRO ANUGERAH LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(780, 'CUST-0780', 'PT. AGROTUNAS MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(781, 'CUST-0781', 'PT. BINA SARANA SAWIT UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(782, 'CUST-0782', 'PT. BINTANG HARAPAN DESA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(783, 'CUST-0783', 'PT. BORNEO SAWIT PERDANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(784, 'CUST-0784', 'PT. HILTON DUTA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(785, 'CUST-0785', 'PT. INDOFOOD CBP SUKSES MAKMUR TBK', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(786, 'CUST-0786', 'PT. KALIMANTAN AGRO PUSAKA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(787, 'CUST-0787', 'PT. KALIMANTAN BINA PERMAI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(788, 'CUST-0788', 'PT. KANDELIA ALAM ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(789, 'CUST-0789', 'PT. KARYA CITRA NASINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(790, 'CUST-0790', 'PT. KARYA RIMBA RAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(791, 'CUST-0791', 'PT. KARYASUKSES UTAMAPRIMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(792, 'CUST-0792', 'PT. MANDIRI INTI PERKASA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(793, 'CUST-0793', 'PT. MITRA KHATULISTIWA MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(794, 'CUST-0794', 'PT. PANCA BHAKTI RAYA UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(795, 'CUST-0795', 'PT. PERMATA SAWIT MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(796, 'CUST-0796', 'PT. PINANG WITMAS ABADI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(797, 'CUST-0797', 'PT. PRAKARSA KARYA SEJATI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(798, 'CUST-0798', 'PT. PRASETYA MITRA MUDA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(799, 'CUST-0799', 'PT. SANTOSA MITRA KALINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(800, 'CUST-0800', 'PT. SARANA BINATU MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(801, 'CUST-0801', 'PT. SERASAN SEKUNDANG SAWITMAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(802, 'CUST-0802', 'PT. SUMBER BATU LAYANG INDAH ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(803, 'CUST-0803', 'PT. UTAMA AGRINDO MAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(804, 'CUST-0804', 'PT. WAY KANAN SAWITINDO MAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(805, 'CUST-0805', 'PT. BINTANG SURYA PRIMA (STAR)', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(806, 'CUST-0806', 'PT. JOSH & TASANI LESTARI / MERCURE', 'Umum', '-', '-', '0', '-', '-', 'HOTEL', '', '-', 0, 50000000, 19880378, 'Active', '2023-12-28 15:45:58', '2024-01-27 11:09:14'),
(807, 'CUST-0807', 'PT. KARYA INVESTAMA NUSA INDAH (KINI)', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(808, 'CUST-0808', 'PT. PONTI GAJAHMADA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(809, 'CUST-0809', 'PT. TAPAZ NUSANTARA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(810, 'CUST-0810', 'PT. TRANSERA PUTRA KHATULISTIWA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(811, 'CUST-0811', 'PT. KAPUAS PERMAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(812, 'CUST-0812', 'CV. ADI BUANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(813, 'CUST-0813', 'CV. AGRO SENTOSA JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(814, 'CUST-0814', 'CV. ANEKA BINTANG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(815, 'CUST-0815', 'CV. ANEKA MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(816, 'CUST-0816', 'CV. APOTIK MAKMUR DUA (II) ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(817, 'CUST-0817', 'CV. BINTANG REZEKI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(818, 'CUST-0818', 'CV. BORNEO RESOURCES CARGO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(819, 'CUST-0819', 'CV. BORNEOFOOD INDOTAMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(820, 'CUST-0820', 'CV. BUDIMAS EKA SENTRATAMA SEJAHTERA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(821, 'CUST-0821', 'CV. CAHAYA ABDA SENTOSA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(822, 'CUST-0822', 'CV. CAMALINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(823, 'CUST-0823', 'CV. CENTRUM ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(824, 'CUST-0824', 'CV. CITRA MUSI LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(825, 'CUST-0825', 'CV. CITRA SWALAYAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(826, 'CUST-0826', 'CV. COMCOW CENTRANUSA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(827, 'CUST-0827', 'CV. DUTA BORNEO BRILIAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(828, 'CUST-0828', 'CV. EDIMAR RITELINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(829, 'CUST-0829', 'CV. GEMILANG ABADI SENTRAL ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(830, 'CUST-0830', 'CV. GOSINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(831, 'CUST-0831', 'CV. INDOMAS JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(832, 'CUST-0832', 'CV. INTI JAYA BERSAMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(833, 'CUST-0833', 'CV. INTI PERMATA KHATULISTIWA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(834, 'CUST-0834', 'CV. KARYA SUKSES MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(835, 'CUST-0835', 'CV. KULINA MAJU BERSAMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(836, 'CUST-0836', 'CV. MAHAJAYA GOLDEN OCEAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(837, 'CUST-0837', 'CV. MITRA JAYA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(838, 'CUST-0838', 'CV. MITRA UTAMA SERDAM ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(839, 'CUST-0839', 'CV. NEW BORN BORNEO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(840, 'CUST-0840', 'CV. POPULAR TRADING ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(841, 'CUST-0841', 'CV. PROPALM ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(842, 'CUST-0842', 'CV. PROTEINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(843, 'CUST-0843', 'CV. SARI PASIFIK ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(844, 'CUST-0844', 'CV. SINAR JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(845, 'CUST-0845', 'CV. SUKSES MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(846, 'CUST-0846', 'CV. TELADAN ANEKA NUSANTARA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(847, 'CUST-0847', 'DINAS KESEHATAN KOTA PONTIANAK ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(848, 'CUST-0848', 'DINAS KESEHATAN KUBU RAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(849, 'CUST-0849', 'JASA USAHA MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(850, 'CUST-0850', 'PT. ANINDYA WIRAPUTRA KONSULT ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(851, 'CUST-0851', 'PT. ANUGERAH SENTOSA BARU ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(852, 'CUST-0852', 'PT. ANUGERAH SUKSES KHATULISTIWA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(853, 'CUST-0853', 'PT. BAJASARANA SEJAHTERA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(854, 'CUST-0854', 'PT. CAHAYA KUBU RAYA LESTARI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(855, 'CUST-0855', 'PT. DINAMIKA SEJAHTERA MANDIRI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(856, 'CUST-0856', 'PT. DWICENTRA CAHAYA WIGUNA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(857, 'CUST-0857', 'PT. EMLI GARMINDO SUKSES ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(858, 'CUST-0858', 'PT. FRESHMART INDOBEST ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(859, 'CUST-0859', 'PT. GRAHA CITRA UTAMA RAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(860, 'CUST-0860', 'PT. HEXA DAYA MEDIKA  ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(861, 'CUST-0861', 'PT. INDUSTRI PERIKANAN SUKADANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(862, 'CUST-0862', 'PT. INKANA JAYA MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(863, 'CUST-0863', 'PT. INSIGHT MEDICA FAME ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(864, 'CUST-0864', 'PT. JAGAAMAN SARANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(865, 'CUST-0865', 'PT. JALIN VANEO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(866, 'CUST-0866', 'PT. KAPUAS ARMADA SARANA ', 'Perusahaan', '-', '-', '0', '-', '-', '-', '', '', 30, 5000000000, 2292150, 'Active', '2023-12-28 15:45:58', '2024-01-15 10:27:30'),
(867, 'CUST-0867', 'PT. KARYA SEPAKAT MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(868, 'CUST-0868', 'PT. KUMAI USAHA MARINA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(869, 'CUST-0869', 'PT. MAHKOTA RIMBA UTAMA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(870, 'CUST-0870', 'PT. NAUBIL BERKAH ABADI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(871, 'CUST-0871', 'PT. PAKITA JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(872, 'CUST-0872', 'PT. PARIT PADANG GLOBAL ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(873, 'CUST-0873', 'PT. PENERBIT BUKU ERLANGGA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(874, 'CUST-0874', 'PT. PRO MEDIKA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(875, 'CUST-0875', 'PT. PUNCAK BORNEO JAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(876, 'CUST-0876', 'PT. PUSAKA JAMAN RAJA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(877, 'CUST-0877', 'PT. RAXSASA KHATULISTIWA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(878, 'CUST-0878', 'PT. REZEKI LAHAN KHATULISTIWA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(879, 'CUST-0879', 'PT. ROYAL HARAPAN CITRA RITELINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(880, 'CUST-0880', 'PT. SATRIA MULTI SUKSES ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(881, 'CUST-0881', 'PT. SMART RETAIL PERKASA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(882, 'CUST-0882', 'PT. SURYA EKLEKTIS VENTURA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(883, 'CUST-0883', 'PT. TRI MEDIKA DJAYA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(884, 'CUST-0884', 'PT. USAHA GAS ELPINDO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(885, 'CUST-0885', 'YAY. KHARITAS BHAKTI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(886, 'CUST-0886', 'YAY. YP HARAPAN BERSAMA PONTIANAK ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(887, 'CUST-0887', 'YAYASAN PENGABDI UNTUK SESAMA MANUSIA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(888, 'CUST-0888', 'YAYASAN RUMAH SAKIT ISLAM YARSI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(889, 'CUST-0889', 'PT. BINTANG BORNEO PERSADA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(890, 'CUST-0890', 'PT. GIAT USAHA DIENG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(891, 'CUST-0891', 'PT. GMG SENTOSA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(892, 'CUST-0892', 'PT. HOK TONG', 'Umum', '-', '-', '0', '-', '-', '-', '', '', 30, 5000000000, 352500, 'Active', '2023-12-28 15:45:58', '2024-01-15 10:13:28'),
(893, 'CUST-0893', 'PT. INDOJAVA RUBBER PLANTING CO.', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(894, 'CUST-0894', 'PT. KINTAP JAYA WATTINDO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(895, 'CUST-0895', 'PT. KIRANA PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(896, 'CUST-0896', 'PT. KOTA NIAGA RAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(897, 'CUST-0897', 'PT. MULTI KARET SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(898, 'CUST-0898', 'PT. NEW KALBAR PROCESSORS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(899, 'CUST-0899', 'PT. STAR RUBBER', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(900, 'CUST-0900', 'PT. SUMBER ALAM', 'Umum', '-', '-', '0', '-', '-', '-', '', '-', 30, 50000000, 0, 'Active', '2023-12-28 15:45:58', '2024-01-19 13:08:17'),
(901, 'CUST-0901', 'PT. SUMBER DJANTIN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(902, 'CUST-0902', 'PT. SUMBER DJANTIN SAMBAS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(903, 'CUST-0903', 'CV. APOTIK MAKMUR II', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(904, 'CUST-0904', 'CV. ASTERINDO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(905, 'CUST-0905', 'CV. CENTRUM', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(906, 'CUST-0906', 'CV. MITRA JAYA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(907, 'CUST-0907', 'KOP. PERKEBUNAN KELAPA SAWIT MITRA GAGA BEGULAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(908, 'CUST-0908', 'KOP. PKS MITRA PELANGI KAPUAS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(909, 'CUST-0909', 'PT. AGRIPLUS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(910, 'CUST-0910', 'PT. AGRO SEJAHTERA MANUNGGAL', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(911, 'CUST-0911', 'PT. BUANA HIJAU ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(912, 'CUST-0912', 'PT. BUKIT HIJAU LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(913, 'CUST-0913', 'PT. BUMISUBUR LESTARITANI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(914, 'CUST-0914', 'PT. DINAMIKA SEJAHTERA MANDIRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(915, 'CUST-0915', 'PT. DUTA AGRO PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(916, 'CUST-0916', 'PT. DUTANUSA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(917, 'CUST-0917', 'PT. FAJAR KITA KUSUMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(918, 'CUST-0918', 'PT. FAJAR SAUDARA KUSUMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(919, 'CUST-0919', 'PT. GAPURA ALAS MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(920, 'CUST-0920', 'PT. GEMILANG MAKMUR SUBUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(921, 'CUST-0921', 'PT. GUNAJAYA KARYA GEMILANG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(922, 'CUST-0922', 'PT. GUNAJAYA KETAPANG SENTOSA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(923, 'CUST-0923', 'PT. INSIGHT MEDICA FAME', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58');
INSERT INTO `konsumens` (`id`, `kode`, `nama`, `tipe_konsumen`, `alamat`, `contact_person`, `no_hp`, `npwp`, `alamat_npwp`, `nama_group`, `no_rekening`, `keterangan`, `termin`, `limit_piutang`, `piutang`, `aktif`, `created_at`, `updated_at`) VALUES
(924, 'CUST-0924', 'PT. INTI CAKRAWALA CITRA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(925, 'CUST-0925', 'PT. KALIMANTAN AGRO PUSAKA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(926, 'CUST-0926', 'PT. KAPUAS INTAN UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(927, 'CUST-0927', 'PT. KAPUAS RIMBA SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(928, 'CUST-0928', 'PT. KARYA BAKTI AGRO SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(929, 'CUST-0929', 'PT. KARYA SUKSES UTAMA PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(930, 'CUST-0930', 'PT. KARYA TERANG UTAMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(931, 'CUST-0931', 'PT. KEBUN GANDA PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(932, 'CUST-0932', 'PT. KIARA SAWIT ABADI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(933, 'CUST-0933', 'PT. LADANG SAWIT MAS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(934, 'CUST-0934', 'PT. LONG FORTUNE INDUSTRI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(935, 'CUST-0935', 'PT. MANDALA INTAN JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(936, 'CUST-0936', 'PT. MITRA SAUDARA LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(937, 'CUST-0937', 'PT. PAKITA JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(938, 'CUST-0938', 'PT. PALMA ASRI SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(939, 'CUST-0939', 'PT. PALMA MEGAH MULIA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(940, 'CUST-0940', 'PT. PARIT PADANG GLOBAL', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(941, 'CUST-0941', 'PT. PATIWARE', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(942, 'CUST-0942', 'PT. PENITI SUNGAI PURUN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(943, 'CUST-0943', 'PT. PRAKARSA KARYA SEJATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(944, 'CUST-0944', 'PT. PUNCAK BORNEO JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(945, 'CUST-0945', 'PT. PUSAKA JAMAN RAJA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(946, 'CUST-0946', 'PT. REZEKI KENCANA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(947, 'CUST-0947', 'PT. RIAU AGROTAMA PLANTATION', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(948, 'CUST-0948', 'PT. SAWIT KAPUAS KENCANA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(949, 'CUST-0949', 'PT. SEJAHTERA SAWIT LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(950, 'CUST-0950', 'PT. SEMAI LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(951, 'CUST-0951', 'PT. SINAR SAWIT SENTOSA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(952, 'CUST-0952', 'PT. SUMATERAJAYA AGROLESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(953, 'CUST-0953', 'ABUN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(954, 'CUST-0954', 'ASWANTO,SP.,M.SI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(955, 'CUST-0955', 'BATOO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(956, 'CUST-0956', 'BUDI PRANOTO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(957, 'CUST-0957', 'DIANA FITRIYAH ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(958, 'CUST-0958', 'DIYAN PUTRI RAHMADEWI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(959, 'CUST-0959', 'ELIAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(960, 'CUST-0960', 'GOEI LILI SUNAWATI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(961, 'CUST-0961', 'HERMANTO ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(962, 'CUST-0962', 'ISKANDAR HM. SAID ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(963, 'CUST-0963', 'JOHAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(964, 'CUST-0964', 'KURNIAWAN TANTRA / T. LIANG KUI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(965, 'CUST-0965', 'LIM TET SIAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(966, 'CUST-0966', 'MARTIN GUNAWAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(967, 'CUST-0967', 'MUSAFA ADDAR RAMDHANI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(968, 'CUST-0968', 'NURHADIJAH ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(969, 'CUST-0969', 'SISWOYO SITUMORANG ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(970, 'CUST-0970', 'STEPHANIE MERLYN DJOHAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(971, 'CUST-0971', 'SUSANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(972, 'CUST-0972', 'TAN SUN LIE / RUSTANDIE ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(973, 'CUST-0973', 'TJUA MENG HUI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(974, 'CUST-0974', 'TJHANG EFFENDY', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(975, 'CUST-0975', 'VALERIA JUNIARTI CHRISTI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(976, 'CUST-0976', 'VITO TANOF ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(977, 'CUST-0977', 'YOGA SYAMSUDIN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(978, 'CUST-0978', 'BENNY DWINARTO PURWANTA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(979, 'CUST-0979', 'NILA HERLINA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(980, 'CUST-0980', 'VICTOR SAMPURNA DJOHAN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(981, 'CUST-0981', 'FERRY ANTONI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(982, 'CUST-0982', 'ENDANG LAHMUDIN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(983, 'CUST-0983', 'ELIANTI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(984, 'CUST-0984', 'YOGO BAMBANG PAMUNGKAS ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(985, 'CUST-0985', 'SAIFUDIN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(986, 'CUST-0986', 'AYU SRI RAHAYU', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(987, 'CUST-0987', 'BENNY DWINARTO PURWANTA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(988, 'CUST-0988', 'ENDANG LAHMUDIN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(989, 'CUST-0989', 'GOEI LILI SUNAWATI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(990, 'CUST-0990', 'H. NURSALAM, SE,MM', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(991, 'CUST-0991', 'HERMANTO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(992, 'CUST-0992', 'IRCHAM SYAHBANDI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(993, 'CUST-0993', 'ISKANDAR HM. SAID', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(994, 'CUST-0994', 'KURNIAWAN TANTRA / T. LIANG KUI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(995, 'CUST-0995', 'LIM TET SIAN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(996, 'CUST-0996', 'MARTIN GUNAWAN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(997, 'CUST-0997', 'RUDI PAULUS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(998, 'CUST-0998', 'SAIFUDIN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(999, 'CUST-0999', 'SISWOYO SITUMORANG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1000, 'CUST-1000', 'SUDIANTO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1001, 'CUST-1001', 'SUMARNI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1002, 'CUST-1002', 'TAN SUN LIE / RUSTANDIE', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1003, 'CUST-1003', 'TJUA MENG HUI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1004, 'CUST-1004', 'YOGA SYAMSUDIN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(1005, 'CUST-1005', '`CASH', 'Umum', '-', '-', '0', '-', '-', '', '', '-', 0, 0, 0, 'Active', '2024-01-20 13:54:14', '2024-01-20 14:10:05'),
(1006, 'CUST-1006', 'cash1', 'Umum', '-', '-', '0', '0', '-', '', '', '-', 0, 100000000, 10000000, 'Active', '2024-01-24 08:35:25', '2024-01-24 08:41:15'),
(1007, 'CUST-1007', 'METRO BUSANA ', 'Umum', '-', '-', '0', '-', '-', '', '', '', 0, 0, 0, 'Active', '2024-01-26 10:06:07', '2024-01-26 10:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_gudang_tokos`
--

CREATE TABLE `mutasi_gudang_tokos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_gudang_tokos`
--

INSERT INTO `mutasi_gudang_tokos` (`id`, `id_users`, `id_barangs`, `kode`, `qty`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 23, 4, 'MTGT/2024/01/0001', 100, 'aa', '2024-01-09 13:33:43', '2024-01-09 13:33:43'),
(2, 23, 2, 'MTGT/2024/01/0002', 200, 'a', '2024-01-09 13:43:35', '2024-01-09 13:43:35'),
(3, 23, 12, 'MTGT/2024/01/0003', 200, 'a', '2024-01-09 13:48:46', '2024-01-09 13:48:46'),
(4, 23, 12, 'MTGT/2024/01/0004', 200, 'a', '2024-01-09 13:49:10', '2024-01-09 13:49:10'),
(5, 23, 14, 'MTGT/2024/01/0005', 200, 'a', '2024-01-09 13:52:51', '2024-01-09 13:52:51'),
(6, 23, 1, 'MTGT/2024/01/0006', 10, 'a', '2024-01-10 17:28:08', '2024-01-10 17:28:08'),
(7, 23, 8, 'MTGT/2024/01/0007', 200, 'stok toko', '2024-01-11 10:20:10', '2024-01-11 10:20:10'),
(8, 44, 327, 'MTGT/2024/01/0008', 50, 'motor air', '2024-01-11 10:39:46', '2024-01-11 10:39:46'),
(9, 23, 1, 'MTGT/2024/01/0009', 20, 'BG 201', '2024-01-13 10:21:03', '2024-01-13 10:21:03'),
(10, 45, 3, 'MTGT/2024/01/0010', 20, '-', '2024-01-15 09:37:42', '2024-01-15 09:37:42'),
(11, 45, 3, 'MTGT/2024/01/0011', 10, '123', '2024-01-15 09:46:06', '2024-01-15 09:46:06'),
(12, 23, 314, 'MTGT/2024/01/0012', 8, '-', '2024-01-24 11:50:06', '2024-01-24 11:50:06'),
(13, 45, 4, 'MTGT/2024/01/0013', 50, '0112', '2024-01-26 08:45:58', '2024-01-26 08:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_keluar_barangs`
--

CREATE TABLE `mutasi_keluar_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_keluar_barangs`
--

INSERT INTO `mutasi_keluar_barangs` (`id`, `id_users`, `id_barangs`, `kode`, `qty`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 23, 1, 'MTSK/2024/01/0001', 90, 'a', '2024-01-10 17:24:50', '2024-01-10 17:24:50'),
(2, 23, 8, 'MTSK/2024/01/0002', 100, 'salah produksi', '2024-01-11 10:18:38', '2024-01-11 10:18:38'),
(3, 45, 9, 'MTSK/2024/01/0003', 10, '1622', '2024-01-26 08:32:12', '2024-01-26 08:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_masuk_barangs`
--

CREATE TABLE `mutasi_masuk_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_masuk_barangs`
--

INSERT INTO `mutasi_masuk_barangs` (`id`, `id_users`, `id_barangs`, `kode`, `qty`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 23, 4, 'MTSM/2024/01/0001', 100, 'produksi pabrik', '2024-01-09 13:32:52', '2024-01-09 13:32:52'),
(2, 23, 2, 'MTSM/2024/01/0002', 500, 'a', '2024-01-09 13:43:10', '2024-01-09 13:43:10'),
(3, 23, 12, 'MTSM/2024/01/0003', 500, 'a', '2024-01-09 13:48:25', '2024-01-09 13:48:25'),
(4, 23, 14, 'MTSM/2024/01/0004', 1000, 'a', '2024-01-09 13:52:31', '2024-01-09 13:52:31'),
(5, 23, 8, 'MTSM/2024/01/0005', 1000, 'produksi pabrik', '2024-01-11 10:16:55', '2024-01-11 10:16:55'),
(6, 44, 327, 'MTSM/2024/01/0006', 50, 'misna', '2024-01-11 10:37:42', '2024-01-11 10:37:42'),
(7, 44, 8, 'MTSM/2024/01/0007', 40, '-', '2024-01-11 10:38:27', '2024-01-11 10:38:27'),
(8, 45, 3, 'MTSM/2024/01/0008', 20, '-', '2024-01-15 09:36:50', '2024-01-15 09:36:50'),
(9, 23, 1, 'MTSM/2024/01/0009', 256, 'BG 001 ', '2024-01-17 09:46:41', '2024-01-17 09:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_toko_gudangs`
--

CREATE TABLE `mutasi_toko_gudangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_toko_gudangs`
--

INSERT INTO `mutasi_toko_gudangs` (`id`, `id_users`, `id_barangs`, `kode`, `qty`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 23, 4, 'MTTG/2024/01/0001', 200, 'a', '2024-01-09 13:34:25', '2024-01-09 13:34:25'),
(2, 23, 14, 'MTTG/2024/01/0002', 50, 'a', '2024-01-09 13:53:22', '2024-01-09 13:53:22'),
(3, 45, 1, 'MTTG/2024/01/0003', 40, '-', '2024-01-15 09:31:19', '2024-01-15 09:31:19'),
(4, 45, 1, 'MTTG/2024/01/0004', 20, '-', '2024-01-15 09:55:32', '2024-01-15 09:55:32'),
(5, 45, 9, 'MTTG/2024/01/0005', 10, '1622', '2024-01-26 08:34:56', '2024-01-26 08:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
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
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
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
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluarans`
--

CREATE TABLE `pengeluarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_kategori_pengeluarans` int(10) NOT NULL,
  `akun_kas` varchar(10) NOT NULL DEFAULT '1101',
  `akun_beban` varchar(10) NOT NULL DEFAULT '6101',
  `divisi` varchar(190) NOT NULL DEFAULT 'Umum',
  `kode` varchar(191) NOT NULL,
  `keterangan` text DEFAULT '',
  `nominal` double NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualans`
--

CREATE TABLE `penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `tipe_penjualan` varchar(10) NOT NULL DEFAULT 'Umum',
  `kode_akun` varchar(10) NOT NULL DEFAULT '1101',
  `kode` varchar(191) NOT NULL,
  `kode_sj` varchar(191) DEFAULT NULL,
  `kode_inv` varchar(191) DEFAULT NULL,
  `kategori` varchar(191) NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `tanggal_sj` date DEFAULT NULL,
  `tanggal_inv` date DEFAULT NULL,
  `pembayaran` varchar(191) NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `catatan_nama` varchar(191) NOT NULL DEFAULT '-',
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `dp` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `termin` int(10) NOT NULL DEFAULT 30,
  `ekspedisi` varchar(191) DEFAULT NULL,
  `alamat_sj` text DEFAULT NULL,
  `alamat_inv` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akses_edit` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualans`
--

INSERT INTO `penjualans` (`id`, `id_konsumens`, `tipe_penjualan`, `kode_akun`, `kode`, `kode_sj`, `kode_inv`, `kategori`, `tanggal`, `tanggal_sj`, `tanggal_inv`, `pembayaran`, `jatuh_tempo`, `keterangan`, `catatan_nama`, `biaya_tambahan`, `subtotal`, `diskon`, `pajak`, `dp`, `grandtotal`, `status`, `sisa`, `termin`, `ekspedisi`, `alamat_sj`, `alamat_inv`, `created_at`, `updated_at`, `akses_edit`) VALUES
(1, 1, 'Manual', '1101', 'SO2401-23-0001', 'SJ-N-2401-23-0001', 'INV-N-2401-23-0001', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, 'abb', 'a', NULL, '2024-01-08 13:24:40', '2024-01-08 13:26:50', 'N'),
(2, 2, 'Manual', '1201', 'SO2401-23-0002', NULL, NULL, 'Umum', '2024-01-08', NULL, NULL, 'Credit', NULL, NULL, '-', 0, 5500000, 0, 0, 0, 5500000, 'Selesai', 5500000, 30, NULL, NULL, NULL, '2024-01-08 13:40:57', '2024-01-08 13:41:08', 'N'),
(3, 1, 'Manual', '1201', 'SO2401-23-0003', NULL, 'INV-N-2401-23-0002', 'Umum', '2024-01-08', NULL, '2024-01-08', 'Credit', '2024-02-07', NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-08 13:41:58', '2024-01-08 15:43:16', 'N'),
(4, 1, 'Manual', '1101', 'SO2401-23-0004', 'SJ-N-2401-23-0002', 'INV-N-2401-23-0003', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, NULL, '-', 0, 75000, 0, 0, 0, 75000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-08 15:42:38', '2024-01-08 15:43:55', 'N'),
(5, 1, 'Manual', '1101', 'SO2401-23-0005', 'SJ-N-2401-23-0003', 'INV-N-2401-23-0004', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, 'keterangan general', '-', 0, 526000, 0, 0, 0, 526000, 'Selesai', 0, 30, 'ekpedisi', 'alamat konsumen', NULL, '2024-01-08 15:45:12', '2024-01-08 15:46:17', 'N'),
(6, 1, 'Manual', '1101', 'SO2401-23-0006', 'SJ-N-2401-23-0004', 'INV-N-2401-23-0005', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, NULL, '-', 0, 210000, 0, 0, 100000, 210000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-08 15:47:43', '2024-01-08 15:55:18', 'N'),
(7, 1, 'Manual', '1101', 'SO2401-23-0007', 'SJ-N-2401-23-0006', 'INV-N-2401-23-0006', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, NULL, '-', 0, 4000, 0, 0, 0, 4000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-08 20:05:59', '2024-01-08 20:10:27', 'N'),
(8, 2, 'Manual', '1101', 'SO2401-23-0008', 'SJ-N-2401-23-0005', 'INV-N-2401-23-0006', 'Umum', '2024-01-08', '2024-01-08', '2024-01-08', 'Cash', NULL, 'a', '-', 0, 2000, 0, 0, 0, 2000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-08 20:06:18', '2024-01-08 20:08:42', 'N'),
(9, 1, 'Manual', '1101', 'SO2401-23-0009', 'SJ-N-2401-23-0007', 'INV-N-2401-23-0007', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 11:21:49', '2024-01-09 11:22:50', 'N'),
(10, 3, 'Manual', '1101', 'SO2401-23-0010', 'SJ-N-2401-23-0009', NULL, 'Umum', '2024-01-09', '2024-01-09', NULL, 'Cash', NULL, NULL, '-', 0, 3005000, 0, 0, 0, 3005000, 'Selesai', 0, 30, 'aaaa', 'purwosari', NULL, '2024-01-09 13:01:11', '2024-01-09 13:01:47', 'N'),
(11, 1, 'Manual', '1201', 'SO2401-23-0011', 'SJ-N-2401-23-0010', 'INV-N-2401-23-0008', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 20500, 0, 0, 0, 20500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 13:03:33', '2024-01-09 13:04:29', 'N'),
(12, 2, 'Manual', '1101', 'SO2401-23-0012', 'SJ-N-2401-23-0011', 'INV-N-2401-23-0009', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, 'keterangan general', '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, 'ab', 'asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd', NULL, '2024-01-09 13:08:37', '2024-01-09 13:10:38', 'N'),
(13, 4, 'Manual', '1101', 'SO2401-23-0013', 'SJ-N-2401-23-0012', 'INV-N-2401-23-0010', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, NULL, '-', 0, 400000, 0, 0, 200000, 400000, 'Selesai', 0, 30, 'asdasd', 'asdasda', NULL, '2024-01-09 13:11:17', '2024-01-09 13:11:57', 'N'),
(14, 5, 'Manual', '1101', 'SO2401-23-0014', 'SJ-N-2401-23-0013', 'INV-N-2401-23-0011', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, NULL, '-', 0, 383620, 0, 0, 0, 383620, 'Selesai', 0, 30, NULL, NULL, 'aaaaaaaaaaaa', '2024-01-09 13:12:40', '2024-01-09 13:15:19', 'N'),
(15, 2, 'Manual', '1101', 'SO2401-23-0015', 'SJ-N-2401-23-0015', 'INV-N-2401-23-0012', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, 'aaaaa', '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 13:16:15', '2024-01-09 13:17:38', 'N'),
(16, 2, 'Manual', '1101', 'SO2401-23-0016', 'SJ-N-2401-23-0014', 'INV-N-2401-23-0012', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, NULL, '-', 0, 500000, 0, 0, 0, 500000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 13:16:36', '2024-01-09 13:17:21', 'N'),
(17, 710, 'Manual', '1201', 'SO2401-23-0017', 'SJ-N-2401-23-0017', 'INV-N-2401-23-0014', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 4000000, 0, 0, 0, 4000000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 13:23:30', '2024-01-09 13:27:52', 'N'),
(18, 732, 'Manual', '1201', 'SO2401-23-0018', 'SJ-N-2401-23-0016', 'INV-N-2401-23-0013', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 2000000, 0, 0, 0, 2000000, 'Selesai', 2000000, 30, NULL, NULL, NULL, '2024-01-09 13:23:58', '2024-01-09 13:24:32', 'N'),
(19, 2, 'Manual', '1101', 'SO2401-23-0019', NULL, 'INV-N-2401-23-0015', 'Umum', '2024-01-09', NULL, '2024-01-09', 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 13:36:46', '2024-01-09 13:37:16', 'N'),
(20, 1, 'Manual', '1101', 'SO2401-23-0020', 'SJ-N-2401-23-0018', NULL, 'Umum', '2024-01-09', '2024-01-09', NULL, 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:11:23', '2024-01-09 14:11:42', 'N'),
(21, 1, 'Manual', '1101', 'SO2401-23-0021', 'SJ-N-2401-23-0019', 'INV-N-2401-0-0020', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:11:53', '2024-01-09 15:28:19', 'N'),
(22, 710, 'Manual', '1201', 'SO2401-23-0022', 'SJ-N-2401-23-0020', 'INV-N-2401-23-0017', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-03-09', 'PO NO. 7000', '-', 0, 606000, 0, 0, 0, 606000, 'Selesai', 0, 60, NULL, 'JALAN WONOBARU\nKAPTEN MARSEN\nNO HP 0852 45552', 'KAWASAN BERIKAT', '2024-01-09 14:14:43', '2024-01-25 08:29:18', 'N'),
(23, 1, 'Manual', '1201', 'SO2401-23-0023', 'SJ-N-2401-23-0021', 'INV-N-2401-23-0018', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 2700000, 0, 0, 0, 2700000, 'Selesai', 0, 30, 'ASAAA', 'WONOBARU', 'KOPERASI JASA USAHA MANDIRI\nJL. ABDUL RAHMAN SALEH \nKOMP. CITRA GRAHA INDAH NO. 10\nPENERIMA : 082150100583 / \n081255415822 (SABIRIN)', '2024-01-09 14:20:06', '2024-01-09 15:16:18', 'N'),
(24, 732, 'Manual', '1201', 'SO2401-23-0024', 'SJ-P-2401-23-0001', 'INV-P-2401-23-0001', 'Umum', '2024-01-09', '2024-01-09', '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 2700000, 0, 297000, 0, 2997000, 'Selesai', 2997000, 30, NULL, NULL, NULL, '2024-01-09 14:22:44', '2024-01-09 14:23:50', 'N'),
(25, 733, 'Manual', '1201', 'SO2401-23-0025', 'S-24-0029', 'INV-P-2401-23-0003', 'Umum', '2024-01-09', '2024-01-20', '2024-01-09', 'Credit', '2024-02-08', '-', '-', 0, 6105000, 0, 671550, 0, 6776550, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:24:30', '2024-01-20 11:28:42', 'N'),
(26, 733, 'Manual', '1201', 'SO2401-23-0026', NULL, 'INV-P-2401-23-0002', 'Umum', '2024-01-09', NULL, '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 230000, 0, 25300, 0, 255300, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:26:01', '2024-01-09 14:34:04', 'N'),
(27, 733, 'Manual', '1201', 'SO2401-23-0027', NULL, 'INV-P-2401-23-0002', 'Umum', '2024-01-09', NULL, '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 300000, 0, 33000, 0, 333000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:31:15', '2024-01-09 14:34:04', 'N'),
(28, 658, 'Manual', '1201', 'SO2401-23-0028', 'SJ-N-2401-23-0022', NULL, 'Umum', '2024-01-09', '2024-01-09', NULL, 'Credit', NULL, 'PO NO. 870000', '-', 0, 2100000, 0, 0, 0, 2100000, 'Selesai', 2100000, 30, 'VIA. MANDIRI', 'JALAN WONOBARU', NULL, '2024-01-09 14:35:37', '2024-01-09 14:37:04', 'N'),
(29, 658, 'Manual', '1201', 'SO2401-23-0029', 'SJ-P-2401-23-0003', NULL, 'Umum', '2024-01-09', '2024-01-09', NULL, 'Credit', NULL, 'PO NO . 870000', '-', 0, 2000000, 0, 220000, 0, 2220000, 'Selesai', 2220000, 30, 'JALAN VIA MANDIRI', 'JAJLALLA', NULL, '2024-01-09 14:37:39', '2024-01-09 14:41:04', 'N'),
(30, 733, 'Manual', '1201', 'SO2401-23-0030', NULL, 'INV-P-2401-23-0004', 'Umum', '2023-12-22', NULL, '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 240000, 0, 26400, 0, 266400, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:43:03', '2024-01-09 14:47:02', 'N'),
(31, 733, 'Manual', '1201', 'SO2401-23-0031', NULL, 'INV-N-2401-23-0019', 'Umum', '2024-01-01', NULL, '2024-01-09', 'Credit', '2024-02-08', NULL, '-', 0, 252000, 0, 0, 0, 252000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 14:43:04', '2024-01-09 14:47:02', 'N'),
(32, 1, 'Manual', '1101', 'SO2401-0-0032', NULL, NULL, 'Umum', '2024-01-09', NULL, NULL, 'Cash', NULL, NULL, '-', 0, 18681, 0, 0, 0, 18681, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-09 15:21:58', '2024-01-10 09:41:19', 'N'),
(33, 1, 'Manual', '1101', 'SO2401-23-0033', 'SJ-N-2401-23-0023', 'INV-N-2401-23-0021', 'Umum', '2024-01-10', '2024-01-10', '2024-01-10', 'Cash', NULL, NULL, '-', 0, 36362, 0, 0, 0, 36362, 'Selesai', 0, 30, 'kaltim express', 'Gedung Karingau KM 5 (Gudang No 4) \nJln. Projokal RT 048 Kel Graha Indah\nKec. Balikpapan Utara 76127 KALTIM UP. \nBP Mirwansyah (0852 4763 9275)\nBP Suherwin (0853 1117 8968)', 'Gedung Karingau KM 5 (Gudang No 4)\nJln. Projokal RT 048 Kel Graha Indah\nKec. Balikpapan Utara 76127 KALTIM UP.\nBP Mirwansyah (0852 4763 9275)\nBP Suherwin (0853 1117 8968)', '2024-01-10 09:42:05', '2024-01-10 09:46:59', 'N'),
(34, 1, 'Manual', '1101', 'SO2401-23-0034', 'SJ-P-2401-23-0004', 'INV-P-2401-23-0004', 'Umum', '2024-01-10', '2024-01-10', '2024-01-10', 'Cash', NULL, NULL, '-', 0, 1005064, 0, 110557, 0, 1115621, 'Selesai', 0, 30, NULL, 'Gedung Karingau KM 5 (Gudang No 4)\nJln. Projokal RT 048 Kel Graha Indah\nKec. Balikpapan Utara 76127 KALTIM UP.\nBP Mirwansyah (0852 4763 9275)\nBP Suherwin (0853 1117 8968)', 'Gedung Karingau KM 5 (Gudang No 4)\nJln. Projokal RT 048 Kel Graha Indah\nKec. Balikpapan Utara 76127 KALTIM UP.\nBP Mirwansyah (0852 4763 9275)\nBP Suherwin (0853 1117 8968)', '2024-01-10 09:48:45', '2024-01-10 09:49:53', 'N'),
(35, 1, 'Manual', '1101', 'SO2401-23-0035', 'SJ-P-2401-23-0005', 'INV-P-2401-23-0005', 'Umum', '2024-01-10', '2024-01-10', '2024-01-10', 'Cash', NULL, NULL, '-', 0, 1507056, 0, 165776, 0, 1672832, 'Selesai', 0, 30, NULL, NULL, 'Gedung Karingau KM 5 (Gudang No 4)\nJln. Projokal RT 048 Kel Graha Indah\nKec. Balikpapan Utara 76127 KALTIM UP.\nBP Mirwansyah (0852 4763 9275)\nBP Suherwin (0853 1117 8968)', '2024-01-10 09:50:40', '2024-01-10 09:51:15', 'N'),
(36, 1, 'Manual', '1101', 'SO2401-23-0036', 'SJ-N-2401-23-0024', NULL, 'Umum', '2024-01-11', '2024-01-11', NULL, 'Cash', NULL, NULL, '-', 0, 50000, 0, 0, 0, 50000, 'Selesai', 0, 30, 'aaa', 'apasdasdasdasd\nasdasdasdadasda\nasdasdasdasdasdasd', NULL, '2024-01-11 09:54:29', '2024-01-11 10:07:48', 'N'),
(37, 9, 'Manual', '1201', 'SO2401-23-0037', 'SJ-N-2401-23-0025', 'FTS-24-0003', 'Umum', '2024-01-11', '2024-01-11', '2024-01-13', 'Credit', '2024-02-12', 'PO 00888/122312/12131', '-', 0, 856903, 0, 0, 0, 856903, 'Selesai', 856903, 30, 'KIU', 'Gedung Karingau KM 5 (Gudang no 4)\nJln Projakal RT 048 GRAHA INDAH\nKEC BALIK PAPAN UTARA 76127 KALTIM\nCP 081231231231 (DIAN)\nBP 1231231231', 'HkaDHAKFASMFNdjshfSDEGF\nJFLSGJLKGJVLD,RF\nDLS;FJAGAGH', '2024-01-11 10:23:50', '2024-01-13 10:45:52', 'N'),
(38, 1, 'Manual', '1101', 'SO2401-23-0038', 'SJ-N-2401-23-0026', NULL, 'Umum', '2024-01-11', '2024-01-11', NULL, 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, 'a', 'qq', NULL, '2024-01-11 10:44:36', '2024-01-11 10:45:18', 'N'),
(39, 866, 'Manual', '1201', 'SO2401-23-0039', 'SJ-P-2401-23-0007', NULL, 'Umum', '2024-01-11', '2024-01-11', NULL, 'Credit', NULL, 'PO NO. 870000', '-', 0, 24153158, 0, 2656847, 0, 26810005, 'Selesai', 26810005, 30, 'asdf', 'JLN ayani no afassadasdasdasdasasdaasdasaas\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', NULL, '2024-01-11 11:36:56', '2024-01-11 11:47:14', 'N'),
(40, 1, 'Manual', '1101', 'SO2401-23-0040', 'SJS-24-0001', 'FTS-24-0001', 'Umum', '2024-01-12', '2024-01-12', '2024-01-12', 'Cash', NULL, NULL, '-', 0, 40000, 0, 0, 0, 40000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-12 12:22:12', '2024-01-12 12:25:41', 'N'),
(42, 3, 'Manual', '1101', 'SO2401-23-0041', 'S-24-0001', 'F-24-0001', 'Umum', '2024-01-12', '2024-01-12', '2024-01-12', 'Cash', NULL, NULL, '-', 0, 4000000, 0, 440000, 0, 4440000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-12 12:27:08', '2024-01-12 14:47:27', 'N'),
(43, 1, 'Manual', '1201', 'SO2401-23-0042', 'SJS-24-0002', 'FTS-24-0002', 'Umum', '2024-01-12', '2024-01-12', '2024-01-12', 'Credit', '2024-02-11', 'a', '-', 0, 1000000, 0, 0, 0, 1000000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-12 14:48:48', '2024-01-12 14:49:28', 'N'),
(44, 1, 'Manual', '1101', 'SO2401-23-0043', NULL, 'FCS-24-0001', 'Umum', '2024-01-13', NULL, '2024-01-13', 'Cash', NULL, NULL, '-', 0, 0, 0, 0, 0, 0, 'Selesai', 0, 30, NULL, NULL, 'JALAN SULTAN MUHAMMD NO 194', '2024-01-13 10:21:44', '2024-01-13 10:23:25', 'N'),
(45, 1, 'Manual', '1101', 'SO2401-23-0044', 'SJS-24-0003', 'FCS-24-0002', 'Umum', '2024-01-13', '2024-01-13', '2024-01-13', 'Cash', NULL, NULL, '-', 0, 150000, 0, 0, 0, 150000, 'Selesai', 0, 30, 'MJS', 'JALNA SULYANNAMANA;LA\nDHASHFSKDGFJDS', NULL, '2024-01-13 10:24:16', '2024-01-13 10:41:53', 'N'),
(46, 7, 'Manual', '1101', 'SO2401-46-0045', 'SJS-24-0004', 'FTS-24-0004', 'Umum', '2024-01-15', '2024-01-20', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 60000, 0, 0, 0, 60000, 'Selesai', 0, 30, NULL, 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', '2024-01-15 09:46:21', '2024-01-15 09:53:39', 'N'),
(47, 2, 'Manual', '1101', 'SO2401-46-0046', 'SJS-24-0005', 'FTS-24-0005', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 20000, 0, 0, 0, 20000, 'Selesai', 0, 30, NULL, NULL, 'LLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', '2024-01-15 09:54:18', '2024-01-15 09:55:58', 'N'),
(48, 892, 'Manual', '1201', 'SO2401-23-0047', 'SJS-24-0006', 'FTS-24-0006', 'Umum', '2024-01-16', '2024-01-15', '2024-01-15', 'Credit', '2024-02-14', 'PO NO. 8700000', '-', 0, 352500, 0, 0, 0, 352500, 'Selesai', 352500, 30, 'MAHAJAYA GOLEDEN JAYA', 'JALAN WONOBARU NO 36\nKATAMSO 36', 'JALAN WONOBARU\n00', '2024-01-15 10:02:27', '2024-01-15 10:13:28', 'N'),
(49, 866, 'Manual', '1201', 'SO2401-23-0048', NULL, 'F-24-0002', 'Umum', '2024-01-15', NULL, '2024-01-15', 'Credit', '2024-02-14', '-', '-', 0, 2065000, 0, 227150, 0, 2292150, 'Selesai', 2292150, 30, NULL, NULL, NULL, '2024-01-15 10:22:07', '2024-01-15 10:27:30', 'N'),
(50, 733, 'Manual', '1201', 'SO2401-23-0049', NULL, 'F-24-0003', 'Umum', '2024-01-15', NULL, '2024-01-15', 'Credit', '2024-02-14', '-', '-', 0, 587500, 0, 64625, 0, 652125, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-15 10:33:42', '2024-01-15 10:56:41', 'N'),
(51, 1, 'Manual', '1101', 'SO2401-46-0050', 'SJS-24-0007', NULL, 'Umum', '2024-01-15', '2024-01-15', NULL, 'Cash', NULL, NULL, '-', 0, 339000, 0, 0, 0, 339000, 'Selesai', 0, 30, NULL, 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL', NULL, '2024-01-15 10:36:27', '2024-01-15 10:38:59', 'N'),
(52, 3, 'Manual', '1201', 'SO2401-46-0051', 'SJS-24-0009', 'FTS-24-0007', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Credit', '2024-02-14', NULL, '-', 0, 1248000, 0, 0, 0, 1248000, 'Selesai', 1248000, 30, 'VIA: BALI JAYA EXPRESS', 'JL. IMAM BONJOL NO. 33\nKEL. DARAT SEKIP \nPONTIANAK BARAT\n12345', NULL, '2024-01-15 10:57:16', '2024-01-15 11:01:22', 'N'),
(53, 3, 'Manual', '1101', 'SO2401-46-0052', 'SJS-24-0010', 'FTS-24-0008', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 5604000, 0, 0, 0, 5604000, 'Selesai', 0, 30, 'BALI JAYA EXPRESS', 'ADSFASDFADSFASDFASFASDFADSFASDFAS\nASDFASDFFFFFFFFFFFFFFFFFFFFFFFFFFF\nFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', NULL, '2024-01-15 11:07:00', '2024-01-15 11:30:56', 'N'),
(54, 1, 'Manual', '1201', 'SO2401-23-0053', NULL, NULL, 'Umum', '2024-01-15', NULL, NULL, 'Credit', NULL, NULL, '-', 0, 1430000, 0, 157300, 0, 1587300, 'Selesai', 1587300, 30, NULL, NULL, NULL, '2024-01-15 11:29:22', '2024-01-15 11:30:03', 'N'),
(55, 1, 'Manual', '1101', 'SO2401-23-0054', 'S-24-0002', NULL, 'Umum', '2024-01-15', '2024-01-15', NULL, 'Cash', NULL, NULL, '-', 0, 1000000, 0, 110000, 0, 1110000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-15 11:34:33', '2024-01-15 11:46:28', 'N'),
(56, 1, 'Manual', '1101', 'SO2401-23-0055', 'S-24-0003', 'F-24-0004', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 1040000, 0, 114400, 0, 1154400, 'Selesai', 0, 30, 'BALI EXPRESS JSAYA', 'JALAN AYANI 2 KOMPLEK PERTAMA SARI \nPONTIANAK BARAT', 'JALAN AHMAD YANI 2 NO 20 \nPONTIANAK BARAT \nTIMUR', '2024-01-15 11:51:26', '2024-01-15 11:55:15', 'N'),
(57, 1, 'Manual', '1101', 'SO2401-23-0056', NULL, NULL, 'Umum', '2024-01-15', NULL, NULL, 'Cash', NULL, NULL, '-', 0, 600000, 0, 0, 0, 600000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-15 12:12:54', '2024-01-15 12:13:09', 'N'),
(58, 1, 'Manual', '1101', 'SO2401-23-0057', 'S-24-0004', 'F-24-0005', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 406000, 0, 44660, 0, 450660, 'Selesai', 0, 30, 'BBBB', 'UJGVHKBJHB', 'ASFDGASDFASDF', '2024-01-15 12:13:57', '2024-01-15 12:17:00', 'N'),
(59, 1, 'Manual', '1101', 'SO2401-23-0058', 'S-24-0005', 'F-24-0005', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, NULL, '-', 0, 1006000, 0, 110660, 0, 1116660, 'Selesai', 0, 30, 'ASDA', 'ASDASDASDASD', 'ASDFASDFADSF', '2024-01-15 12:14:41', '2024-01-15 12:17:25', 'N'),
(60, 1, 'Manual', '1201', 'SO2401-23-0059', 'S-24-0006', 'F-24-0006', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Credit', '2024-02-14', NULL, '-', 0, 3045000, 0, 334950, 0, 3379950, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-15 12:24:42', '2024-01-15 12:26:12', 'N'),
(61, 413, 'Manual', '1101', 'SO2401-46-0060', 'SJS-24-0011', 'FTS-24-0009', 'Umum', '2024-01-15', '2024-01-15', '2024-01-15', 'Cash', NULL, '100 BAL @ 1,5 KG', '-', 0, 4875000, 0, 0, 0, 4875000, 'Selesai', 0, 30, 'MITRA TAXI', 'SINGKAWANG', NULL, '2024-01-15 15:00:58', '2024-01-15 15:05:53', 'N'),
(62, 1, 'Manual', '1101', 'SO2401-46-0061', 'SJS-24-0016', 'FCS-24-0003', 'Umum', '2024-01-16', '2024-01-17', '2024-01-16', 'Cash', NULL, NULL, '-', 0, 560000, 0, 0, 0, 560000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 12:49:44', '2024-01-17 09:33:46', 'N'),
(63, 1, 'Manual', '1201', 'SO2401-23-0062', 'SJS-24-0013', 'FTS-24-0011', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 240000, 0, 0, 0, 240000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 13:10:07', '2024-01-16 13:44:54', 'N'),
(64, 2, 'Manual', '1201', 'SO2401-23-0063', 'SJS-24-0012', 'FTS-24-0010', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 750000, 0, 0, 0, 750000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 13:11:48', '2024-01-20 13:05:55', 'N'),
(65, 8, 'Manual', '1201', 'SO2401-46-0064', 'SJS-24-0014', 'FTS-24-0012', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 2313000, 0, 0, 0, 2313000, 'Selesai', 0, 30, NULL, 'JL. GAJAHMADA', 'JL. GAJAHMADA', '2024-01-16 13:27:02', '2024-01-16 13:41:37', 'N'),
(67, 1, 'Manual', '1201', 'SO2401-47-0066', 'S-24-0007', 'F-24-0007', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 4000000, 0, 440000, 0, 4440000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 13:55:45', '2024-01-19 13:10:07', 'N'),
(68, 1, 'Manual', '1201', 'SO2401-47-0067', 'S-24-0008', 'F-24-0007', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 24000000, 0, 2640000, 0, 26640000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 13:56:13', '2024-01-19 13:10:07', 'N'),
(69, 1, 'Manual', '1201', 'SO2401-47-0068', 'S-24-0009', 'F-24-0007', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 27000000, 0, 2970000, 0, 29970000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 13:57:41', '2024-01-19 13:10:07', 'N'),
(70, 733, 'Manual', '1201', 'SO2401-23-0069', 'S-24-0010', 'F-24-0008', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 220000, 0, 24200, 0, 244200, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:25:50', '2024-01-16 14:44:56', 'N'),
(71, 733, 'Manual', '1201', 'SO2401-23-0070', 'S-24-0011', 'F-24-0009', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 220000, 0, 24200, 0, 244200, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:41:16', '2024-01-16 14:44:56', 'N'),
(72, 733, 'Manual', '1201', 'SO2401-23-0071', 'S-24-0012', 'F-24-0010', 'Umum', '2024-01-18', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 230000, 0, 25300, 0, 255300, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:47:49', '2024-01-19 12:12:21', 'N'),
(73, 733, 'Manual', '1201', 'SO2401-23-0072', 'S-24-0013', 'F-24-0011', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 2990000, 0, 328900, 0, 3318900, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:50:50', '2024-01-19 12:12:21', 'N'),
(74, 733, 'Manual', '1201', 'SO2401-23-0073', 'S-24-0014', 'F-24-0012', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 1955000, 0, 215050, 0, 2170050, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:53:21', '2024-01-19 12:12:21', 'N'),
(75, 733, 'Manual', '1201', 'SO2401-23-0074', 'S-24-0015', 'F-24-0013', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Credit', '2024-02-15', NULL, '-', 0, 690000, 0, 75900, 0, 765900, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 14:59:00', '2024-01-19 12:12:21', 'N'),
(76, 733, 'Manual', '1101', 'SO2401-23-0075', 'S-24-0016', 'F-24-0014', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Cash', NULL, NULL, '-', 0, 690000, 0, 75900, 0, 765900, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 15:02:26', '2024-01-16 15:03:45', 'N'),
(77, 733, 'Manual', '1101', 'SO2401-23-0076', 'S-24-0017', 'F-24-0015', 'Umum', '2024-01-16', '2024-01-16', '2024-01-16', 'Cash', NULL, NULL, '-', 0, 2760000, 0, 303600, 0, 3063600, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-16 15:11:37', '2024-01-16 15:13:48', 'N'),
(78, 733, 'Manual', '1201', 'SO2401-23-0077', 'S-24-0020', NULL, 'Umum', '2024-01-19', '2024-01-19', NULL, 'Credit', NULL, NULL, '-', 0, 705000, 0, 77550, 0, 782550, 'Selesai', 782550, 30, NULL, NULL, NULL, '2024-01-16 15:11:39', '2024-01-19 12:11:29', 'N'),
(79, 732, 'Manual', '1201', 'SO2401-23-0078', 'SJS-24-0015', 'FTS-24-0013', 'Umum', '2024-01-17', '2024-01-17', '2024-01-17', 'Credit', '2024-01-31', 'PO NO. 123456', '-', 0, 2067000, 13000, 0, 500000, 2054000, 'Selesai', 1554000, 14, 'cv abc', 'jalan sultan muiyhamma kdsofsdn\nasjfierhgmjn\nsfjoregtjrlesbh', NULL, '2024-01-17 08:12:41', '2024-01-17 08:57:09', 'N'),
(80, 732, 'Manual', '1201', 'SO2401-23-0079', 'S-24-0019', 'FCS-24-0004', 'Umum', '2024-01-17', '2024-01-17', '2024-01-17', 'Credit', '2024-02-16', 'PO ABCD', '-', 0, 1888000, 0, 207680, 0, 2095680, 'Selesai', 2095680, 30, NULL, NULL, 'JAKSADKMNSFCJMHFN\nKSFJHORESGJP;RLE,H;/RE,\nLKSFJOREIGPHL\'RTHL;R,H;LUTR', '2024-01-17 09:00:37', '2024-01-17 09:33:18', 'N'),
(81, 1, 'Manual', '1201', 'SO2401-23-0080', 'S-24-0018', 'FCS-24-0005', 'Umum', '2024-01-17', '2024-01-17', '2024-01-17', 'Credit', '2024-02-16', 'PO 123', '-', 0, 298000, 0, 32780, 10000, 330780, 'Selesai', 0, 30, 'ABC', 'A;LKP;FAMJ\nLKJVFDGKIP;L\nLKFJPOGRTHHH', NULL, '2024-01-17 09:12:50', '2024-01-20 12:00:06', 'N'),
(82, 1, 'Manual', '1101', 'SO2401-46-0081', NULL, 'FTS-24-0014', 'Umum', '2024-01-17', NULL, '2024-01-17', 'Cash', NULL, NULL, '-', 0, 64750000, 0, 0, 0, 64750000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-17 10:00:57', '2024-01-17 10:03:05', 'N'),
(83, 169, 'Manual', '1101', 'SO2401-46-0082', NULL, 'FTS-24-0015', 'Umum', '2024-01-17', NULL, '2024-01-17', 'Cash', NULL, NULL, '-', 0, 1074000, 0, 0, 0, 1074000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-17 10:30:34', '2024-01-17 10:34:27', 'N'),
(84, 321, 'Manual', '1101', 'SO2401-46-0083', NULL, 'FTS-24-0016', 'Umum', '2024-01-17', NULL, '2024-01-17', 'Cash', NULL, 'isi apa y', '-', 0, 3146000, 0, 0, 0, 3146000, 'Selesai', 0, 30, NULL, NULL, 'TANRAY', '2024-01-17 10:37:33', '2024-01-17 10:43:35', 'N'),
(85, 192, 'Manual', '1101', 'SO2401-46-0084', 'SJS-24-0017', 'FTS-24-0017', 'Umum', '2024-01-17', '2024-01-17', '2024-01-17', 'Cash', NULL, NULL, '-', 0, 73640000, 0, 0, 0, 73640000, 'Selesai', 0, 30, 'VIA MITRA TAXI', 'SINGKAWANG', 'SINGKAWANG', '2024-01-17 10:45:38', '2024-01-17 11:00:13', 'N'),
(86, 192, 'Manual', '1101', 'SO2401-46-0085', 'SJS-24-0018', NULL, 'Umum', '2024-01-17', '2024-01-17', NULL, 'Cash', NULL, NULL, '-', 0, 70000000, 0, 0, 0, 70000000, 'Selesai', 0, 30, 'VIA: MITRA TAXI', 'SINGKAWANG', NULL, '2024-01-17 12:03:43', '2024-01-17 12:05:50', 'N'),
(87, 7, 'Manual', '1101', 'SO2401-23-0086', 'SJS-24-0019', 'FTS-24-0018', 'Umum', '2024-01-17', '2024-01-17', '2024-01-17', 'Cash', NULL, NULL, '-', 0, 3560000, 0, 0, 0, 3560000, 'Selesai', 0, 30, 'aaa', 'aa', 'aaaaa', '2024-01-17 15:28:14', '2024-01-17 15:32:46', 'N'),
(88, 1, 'Manual', '1201', 'SO2401-46-0087', 'SJS-24-0020', NULL, 'Umum', '2024-01-19', '2024-01-19', NULL, 'Credit', NULL, 'DIKIRIM UNTUK: TOKO CAHAYA GEMILANG\nSINTANG', '-', 0, 2250000, 0, 0, 0, 2250000, 'Selesai', 2250000, 30, 'VIA: MARSELLA', NULL, NULL, '2024-01-19 09:44:56', '2024-01-19 09:47:26', 'N'),
(89, 112, 'Manual', '1101', 'SO2401-46-0088', 'SJS-24-0021', 'FTS-24-0019', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Cash', NULL, '5 KRG @ 40 KG + 1 KRG @ 14,6 KG', '-', 0, 3120000, 0, 0, 0, 3120000, 'Selesai', 0, 30, 'KENDARAAN AHUA', 'JL. SIAM', 'SEGEDONG', '2024-01-19 09:54:27', '2024-01-19 09:57:07', 'N'),
(90, 614, 'Manual', '1101', 'SO2401-46-0089', 'SJS-24-0022', 'FTS-24-0025', 'Umum', '2024-01-19', '2024-01-19', '2024-01-20', 'Cash', NULL, 'DIKIRIM UNTUK TOKO JAYA, BENGKAYANG', '-', 0, 73000000, 0, 0, 0, 73000000, 'Selesai', 0, 30, 'MITRA TAXI', NULL, 'SP 0036', '2024-01-19 09:58:01', '2024-01-20 15:16:57', 'N'),
(91, 1, 'Manual', '1101', 'SO2401-46-0090', 'SJS-24-0023', 'FTS-24-0020', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Cash', NULL, 'DIKIRIM UNTUK TOKO CAHAYA, SANGGAU', '-', 0, 308000, 0, 0, 0, 308000, 'Selesai', 0, 30, 'VIA: LINTAS AGUNG', NULL, 'JL. JOHAR', '2024-01-19 10:01:16', '2024-01-19 10:05:08', 'N'),
(92, 733, 'Manual', '1201', 'SO2401-23-0091', 'S-24-0021', NULL, 'Umum', '2024-01-19', '2024-01-19', NULL, 'Credit', NULL, NULL, '-', 0, 690000, 0, 75900, 0, 765900, 'Selesai', 765900, 30, NULL, NULL, NULL, '2024-01-19 12:09:44', '2024-01-19 12:11:36', 'N'),
(93, 697, 'Manual', '1201', 'SO2401-23-0092', 'S-24-0022', 'FCS-24-0006', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 230000, 0, 25300, 0, 255300, 'Selesai', 255300, 30, NULL, NULL, NULL, '2024-01-19 12:30:21', '2024-01-19 12:38:03', 'N'),
(94, 697, 'Manual', '1201', 'SO2401-23-0093', 'S-24-0023', 'F-24-0016', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 1150000, 0, 126500, 0, 1276500, 'Selesai', 1276500, 30, NULL, NULL, NULL, '2024-01-19 12:31:31', '2024-01-19 12:45:52', 'N'),
(95, 697, 'Manual', '1201', 'SO2401-23-0094', 'S-24-0024', 'FCS-24-0006', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 345000, 0, 37950, 0, 382950, 'Selesai', 382950, 30, NULL, NULL, NULL, '2024-01-19 12:41:39', '2024-01-19 12:45:38', 'N'),
(96, 697, 'Manual', '1201', 'SO2401-23-0095', 'S-24-0025', 'F-24-0017', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 230000, 0, 25300, 0, 255300, 'Selesai', 255300, 30, NULL, NULL, NULL, '2024-01-19 12:47:01', '2024-01-19 12:50:38', 'N'),
(97, 697, 'Manual', '1201', 'SO2401-23-0096', 'S-24-0026', 'F-24-0017', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 2553000, 0, 280830, 0, 2833830, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-19 12:47:56', '2024-01-19 12:52:30', 'N'),
(98, 900, 'Manual', '1201', 'SO2401-23-0097', 'S-24-0027', 'F-24-0018', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 230000, 0, 25300, 0, 255300, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-19 12:57:43', '2024-01-19 13:08:17', 'N'),
(99, 900, 'Manual', '1201', 'SO2401-23-0098', 'S-24-0028', 'F-24-0018', 'Umum', '2024-01-19', '2024-01-19', '2024-01-19', 'Credit', '2024-02-18', NULL, '-', 0, 1035000, 0, 113850, 0, 1148850, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-19 12:59:05', '2024-01-19 13:08:17', 'N'),
(100, 3, 'Manual', '1101', 'SO2401-23-0099', 'SJS-24-0024', 'FCS-24-0007', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, '-', '-', 0, 392000, 0, 0, 0, 392000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 11:20:51', '2024-01-20 11:22:09', 'N'),
(101, 1, 'Manual', '1101', 'SO2401-48-0100', 'S-24-0033', NULL, 'Umum', '2024-01-20', '2024-01-20', NULL, 'Cash', NULL, NULL, '-', 0, 6835000, 0, 751850, 0, 7586850, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 11:28:17', '2024-01-20 13:14:25', 'N'),
(102, 1, 'Manual', '1201', 'SO2401-23-0101', 'S-24-0030', 'F-24-0019', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Credit', '2024-02-19', '-', '-', 0, 4000000, 0, 440000, 0, 4440000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 11:40:00', '2024-01-20 12:00:06', 'N'),
(103, 733, 'Manual', '1201', 'SO2401-23-0102', 'S-24-0031', NULL, 'Umum', '2024-01-20', '2024-01-20', NULL, 'Credit', NULL, NULL, '-', 0, 2645000, 0, 290950, 0, 2935950, 'Selesai', 2935950, 30, 'via sawit selatan', 'jalan sa\naaa\na\n\na\n\na', NULL, '2024-01-20 11:54:19', '2024-01-20 11:55:13', 'N'),
(104, 2, 'Manual', '1201', 'SO2401-23-0103', 'S-24-0032', NULL, 'Umum', '2024-01-20', '2024-01-20', NULL, 'Credit', NULL, NULL, '-', 0, 345000, 0, 37950, 0, 382950, 'Selesai', 382950, 30, 'mandir haya', 'hallll\nkakkkk\nkakka', NULL, '2024-01-20 11:55:49', '2024-01-20 11:57:51', 'N'),
(105, 219, 'Manual', '1101', 'SO2401-46-0104', 'SJS-24-0025', 'FTS-24-0021', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, 'SP NO 001', '-', 0, 2804000, 0, 0, 0, 2804000, 'Selesai', 0, 30, 'VIA: SMART', 'DIKIRIM UNTUK TOKO CAHAYA, SANGGAU', NULL, '2024-01-20 12:08:26', '2024-01-20 12:13:20', 'N'),
(106, 1005, 'Manual', '1101', 'SO2401-48-0105', 'SJS-24-0026', 'FCS-24-0008', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 274000, 0, 0, 0, 274000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 13:55:10', '2024-01-20 13:58:51', 'N'),
(107, 1005, 'Manual', '1101', 'SO2401-48-0106', 'SJS-24-0027', 'FCS-24-0009', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 554000, 0, 0, 0, 554000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 13:56:54', '2024-01-20 14:01:23', 'N'),
(108, 1005, 'Manual', '1101', 'SO2401-48-0107', 'SJS-24-0028', 'FCS-24-0013', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 298000, 0, 0, 0, 298000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 14:02:06', '2024-01-20 14:16:30', 'N'),
(109, 1005, 'Manual', '1101', 'SO2401-48-0108', 'SJS-24-0029', 'FCS-24-0012', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 198000, 0, 0, 0, 198000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 14:09:39', '2024-01-20 14:16:24', 'N'),
(110, 1005, 'Manual', '1101', 'SO2401-48-0109', 'SJS-24-0030', 'FCS-24-0010', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 298000, 0, 0, 0, 298000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 14:11:25', '2024-01-20 14:12:29', 'N'),
(111, 1005, 'Manual', '1101', 'SO2401-48-0110', 'SJS-24-0031', 'FCS-24-0011', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 278000, 0, 0, 0, 278000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 14:14:57', '2024-01-20 14:15:41', 'N'),
(112, 491, 'Manual', '1201', 'SO2401-46-0111', 'SJS-24-0032', NULL, 'Umum', '2024-01-20', '2024-01-20', NULL, 'Credit', NULL, 'SUI RAYA \nSP NO 0012 A', '-', 0, 7584000, 0, 0, 0, 7584000, 'Selesai', 7584000, 30, NULL, NULL, NULL, '2024-01-20 14:46:25', '2024-01-20 14:51:00', 'N'),
(113, 491, 'Manual', '1201', 'SO2401-46-0112', 'SJS-24-0033', NULL, 'Umum', '2024-01-20', '2024-01-20', NULL, 'Credit', NULL, NULL, '-', 0, 7867000, 0, 0, 0, 7867000, 'Selesai', 7867000, 30, NULL, 'SP NO 0012 A', NULL, '2024-01-20 14:51:34', '2024-01-20 14:54:52', 'N'),
(114, 601, 'Manual', '1101', 'SO2401-46-0113', 'SJS-24-0034', 'FTS-24-0022', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 9693000, 0, 0, 0, 9693000, 'Selesai', 0, 30, NULL, 'SEI RAYA', 'SP NO 0012 A', '2024-01-20 14:57:48', '2024-01-20 15:01:50', 'N'),
(115, 91, 'Manual', '1101', 'SO2401-46-0114', 'SJS-24-0035', 'FTS-24-0023', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 1350000, 0, 0, 0, 1350000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-20 15:11:31', '2024-01-20 15:12:54', 'N'),
(116, 216, 'Manual', '1101', 'SO2401-46-0115', 'SJS-24-0036', 'FTS-24-0024', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 745000, 0, 0, 0, 745000, 'Selesai', 0, 30, 'VIA: KM SAHABAT', 'DIKIRIM UNTUK TOKO LANI\nPADANG TIKAR', 'SP 0036', '2024-01-20 15:14:16', '2024-01-20 15:16:02', 'N'),
(117, 125, 'Manual', '1101', 'SO2401-46-0116', 'SJS-24-0037', 'FTS-24-0026', 'Umum', '2024-01-20', '2024-01-20', '2024-01-20', 'Cash', NULL, NULL, '-', 0, 11100000, 0, 0, 0, 11100000, 'Selesai', 0, 30, 'VIA: BALI JAYA EXPRESS', 'DIKIRIM UNTUK TOKO SEJAHTERA\nSINTANG', 'SP NO 0037', '2024-01-20 15:17:36', '2024-01-20 15:19:34', 'N'),
(118, 1, 'Manual', '1101', 'SO2401-23-0117', 'SJS-24-0038', 'FTS-24-0027', 'Umum', '2024-01-22', '2024-01-22', '2024-01-22', 'Cash', NULL, NULL, '-', 0, 50000, 0, 0, 0, 50000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-22 09:22:41', '2024-01-22 09:29:02', 'N'),
(119, 1, 'Manual', '1201', 'SO2401-23-0118', 'S-24-0034', 'F-24-0020', 'Umum', '2024-01-22', '2024-01-22', '2024-01-22', 'Credit', '2024-02-21', NULL, '-', 0, 50000, 0, 5500, 0, 55500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-22 09:31:16', '2024-01-22 09:35:37', 'N'),
(120, 1005, 'Manual', '1101', 'SO2401-23-0119', 'SJS-24-0039', 'FTS-24-0028', 'Umum', '2024-01-23', '2024-01-23', '2024-01-23', 'Cash', NULL, NULL, '-', 0, 234000, 0, 0, 0, 234000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-23 13:23:38', '2024-01-23 13:25:05', 'N'),
(121, 1, 'Manual', '1201', 'SO2401-23-0120', 'S-24-0035', 'F-24-0021', 'Umum', '2024-01-23', '2024-01-23', '2024-01-23', 'Credit', '2024-02-22', NULL, '-', 0, 2244000, 0, 246840, 0, 2490840, 'Selesai', 2490840, 30, 'asdasd', 'asdasdadsdsad', 'asdasdasa', '2024-01-23 13:26:26', '2024-01-27 11:15:46', 'N'),
(122, 2, 'Manual', '1101', 'SO2401-23-0121', 'S-24-0036', 'F-24-0022', 'Umum', '2024-01-23', '2024-01-23', '2024-01-23', 'Cash', NULL, NULL, '-', 0, 390000, 0, 42900, 0, 432900, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-23 13:36:37', '2024-01-23 13:40:20', 'N'),
(123, 733, 'Manual', '1201', 'SO2401-23-0122', 'S-24-0037', 'F-24-0023', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 2607500, 0, 286825, 0, 2894325, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 07:57:07', '2024-01-24 08:34:24', 'N'),
(124, 93, 'Manual', '1201', 'SO2401-46-0123', 'SJS-24-0040', NULL, 'Umum', '2024-01-24', '2024-01-24', NULL, 'Credit', NULL, NULL, '-', 0, 6423000, 0, 0, 3000000, 6423000, 'Selesai', 3423000, 30, NULL, NULL, NULL, '2024-01-24 08:12:03', '2024-01-24 08:14:53', 'N'),
(125, 508, 'Manual', '1101', 'SO2401-46-0124', 'SJS-24-0041', 'FTS-24-0029', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 85365000, 0, 0, 3000000, 85365000, 'Selesai', 0, 30, 'VIA: KAPAL BAHARI', 'SENGHIE', NULL, '2024-01-24 08:16:04', '2024-01-24 08:19:36', 'N'),
(126, 1005, 'Manual', '1101', 'SO2401-48-0125', 'SJS-24-0043', 'FCS-24-0015', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 600000, 0, 0, 0, 600000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:21:25', '2024-01-24 08:29:01', 'N'),
(127, 1005, 'Manual', '1101', 'SO2401-48-0126', 'SJS-24-0042', 'FCS-24-0014', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 300000, 0, 0, 0, 300000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:24:18', '2024-01-24 08:26:03', 'N'),
(128, 733, 'Manual', '1201', 'SO2401-47-0127', 'S-24-0038', 'F-24-0024', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:29:11', '2024-01-24 08:34:24', 'N'),
(129, 1005, 'Manual', '1101', 'SO2401-48-0128', 'SJS-24-0044', 'FCS-24-0016', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 6000000, 0, 0, 2500000, 6000000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:29:55', '2024-01-24 08:30:57', 'N'),
(130, 1005, 'Manual', '1101', 'SO2401-48-0129', 'SJS-24-0045', 'FCS-24-0017', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 6000000, 0, 0, 2500000, 6000000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:31:59', '2024-01-24 08:33:16', 'N'),
(131, 192, 'Manual', '1101', 'SO2401-46-0130', 'SJS-24-0046', 'FTS-24-0030', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 95696500, 0, 0, 15000000, 95696500, 'Selesai', 0, 30, 'VIA: KB 8927 CA', NULL, 'SINGKAWANG', '2024-01-24 08:34:44', '2024-01-24 08:41:09', 'N'),
(132, 1006, 'Manual', '1201', 'SO2401-48-0131', 'SJS-24-0047', 'FCS-24-0018', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 6000000, 0, 0, 2000000, 6000000, 'Selesai', 4000000, 30, NULL, NULL, NULL, '2024-01-24 08:35:51', '2024-01-24 08:38:53', 'N'),
(133, 1006, 'Manual', '1201', 'SO2401-48-0132', NULL, 'FCS-24-0019', 'Umum', '2024-01-24', NULL, '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 6000000, 2000000, 0, 0, 4000000, 'Selesai', 4000000, 30, NULL, NULL, NULL, '2024-01-24 08:39:44', '2024-01-24 08:41:15', 'N'),
(134, 733, 'Manual', '1201', 'SO2401-23-0133', 'SJS-24-0048', 'FTS-24-0031', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 0, 0, 0, 0, 0, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:42:54', '2024-01-24 08:46:16', 'N'),
(135, 733, 'Manual', '1201', 'SO2401-23-0134', 'S-24-0039', 'F-24-0026', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:43:33', '2024-01-24 08:48:38', 'N'),
(136, 733, 'Manual', '1201', 'SO2401-23-0135', NULL, 'F-24-0025', 'Umum', '2024-01-24', NULL, '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:44:26', '2024-01-24 08:48:38', 'N'),
(137, 733, 'Manual', '1201', 'SO2401-23-0136', 'S-24-0040', 'F-24-0027', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:45:04', '2024-01-24 08:48:38', 'N'),
(138, 733, 'Manual', '1201', 'SO2401-23-0137', 'S-24-0041', 'F-24-0028', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:45:40', '2024-01-24 08:48:38', 'N'),
(139, 117, 'Manual', '1101', 'SO2401-46-0138', 'SJS-24-0049', 'FTS-24-0032', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 6615000, 0, 0, 0, 6615000, 'Selesai', 0, 30, 'VIA: LINTAS AGUNG', 'SANGGAU', NULL, '2024-01-24 08:46:40', '2024-01-24 08:49:14', 'N'),
(140, 733, 'Manual', '1201', 'SO2401-23-0139', 'S-24-0042', 'F-24-0029', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:47:08', '2024-01-24 08:48:38', 'N'),
(141, 733, 'Manual', '1201', 'SO2401-23-0140', 'S-24-0043', 'F-24-0030', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:48:56', '2024-01-24 08:57:19', 'N'),
(142, 733, 'Manual', '1201', 'SO2401-23-0141', 'S-24-0044', 'F-24-0031', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:49:44', '2024-01-24 08:57:19', 'N'),
(143, 216, 'Manual', '1101', 'SO2401-46-0142', 'SJS-24-0050', 'FTS-24-0033', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 1240000, 0, 0, 0, 1240000, 'Selesai', 0, 30, 'VIA: KAPAL BAHARI', 'DIKIRIM UNTUK TOKO JAYA\nPURUN', 'SP NO 0050', '2024-01-24 08:50:02', '2024-01-24 08:51:29', 'N'),
(144, 733, 'Manual', '1201', 'SO2401-23-0143', 'S-24-0045', 'F-24-0032', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:50:26', '2024-01-24 08:57:19', 'N'),
(145, 733, 'Manual', '1201', 'SO2401-23-0144', 'S-24-0046', 'F-24-0033', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:51:33', '2024-01-24 08:57:19', 'N'),
(146, 733, 'Manual', '1201', 'SO2401-23-0145', 'S-24-0047', 'F-24-0034', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:52:49', '2024-01-24 08:57:19', 'N'),
(147, 299, 'Manual', '1101', 'SO2401-46-0146', 'SJS-24-0051', 'FTS-24-0034', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 2544000, 0, 0, 0, 2544000, 'Selesai', 0, 30, 'VIA: KAPAL BERSAHAJAYA', NULL, 'SP NO 0051', '2024-01-24 08:53:10', '2024-01-24 08:54:43', 'N'),
(148, 733, 'Manual', '1201', 'SO2401-23-0147', 'S-24-0048', 'F-24-0035', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:53:30', '2024-01-24 08:57:19', 'N'),
(149, 733, 'Manual', '1201', 'SO2401-23-0148', 'S-24-0049', 'F-24-0036', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:54:43', '2024-01-24 08:57:19', 'N'),
(150, 112, 'Manual', '1101', 'SO2401-46-0149', 'SJS-24-0052', 'FTS-24-0035', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, 'DIMUAT DALAM 1 KRG', '-', 0, 636000, 0, 0, 0, 636000, 'Selesai', 0, 30, 'KENDARAAN AHUA', NULL, NULL, '2024-01-24 08:55:49', '2024-01-24 08:58:13', 'N'),
(151, 733, 'Manual', '1201', 'SO2401-23-0150', 'S-24-0050', 'F-24-0037', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 08:56:23', '2024-01-24 08:57:19', 'N'),
(152, 81, 'Manual', '1101', 'SO2401-46-0151', 'SJS-24-0053', 'FTS-24-0036', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, 'TOTAL 61 KRG', '-', 0, 27522000, 0, 0, 10000000, 27522000, 'Selesai', 0, 30, 'MARSELLA', NULL, 'SP NO 0053', '2024-01-24 09:00:17', '2024-01-24 09:03:33', 'N'),
(153, 1, 'Manual', '1101', 'SO2401-46-0152', 'SJS-24-0054', 'FTS-24-0037', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 49291100, 100, 0, 0, 49291100, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 09:11:22', '2024-01-24 09:19:10', 'N'),
(154, 269, 'Manual', '1101', 'SO2401-46-0153', 'SJS-24-0055', 'FTS-24-0038', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 46916000, 6000, 0, 15000000, 46910000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 09:20:38', '2024-01-24 09:22:20', 'N'),
(155, 46, 'Manual', '1101', 'SO2401-46-0154', 'SJS-24-0056', 'FTS-24-0039', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 2152200, 200, 0, 0, 2152200, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 09:22:49', '2024-01-24 09:25:36', 'N'),
(156, 733, 'Manual', '1201', 'SO2401-23-0155', 'S-24-0051', 'F-24-0038', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 1755000, 0, 193050, 0, 1948050, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 09:44:24', '2024-01-25 08:00:56', 'N'),
(157, 3, 'Manual', '1101', 'SO2401-23-0156', 'SJS-24-0057', 'FTS-24-0040', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 107994, 200, 0, 50, 107794, 'Selesai', 0, 30, NULL, 'Jl. Suka Mulia No. 8 Kec. Pontianak Kota, \nKota Pontianak\nkalimantannnnnnnnnnnnnnnnnnnn', 'Jl. Suka Mulia No. 8 Kec. Pontianak Kota, \nKota Pontianak, Kalimantan Barat \nJALAN MITRA PERDANA NO 34 YYYYYYYYYYYYY', '2024-01-24 10:44:15', '2024-01-24 10:50:57', 'N'),
(158, 4, 'Manual', '1101', 'SO2401-23-0157', 'S-24-0052', 'F-24-0039', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 100000, 0, 11000, 0, 111000, 'Selesai', 0, 30, NULL, NULL, 'Jl. Suka Mulia No. 8 Kec. Pontianak Kota, Kota Pontianak, Kalimantan Barat', '2024-01-24 11:04:44', '2024-01-24 11:07:24', 'N'),
(159, 7, 'Manual', '1201', 'SO2401-23-0158', NULL, 'F-24-0040', 'Umum', '2024-01-24', NULL, '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 18000, 0, 1980, 0, 19980, 'Selesai', 19980, 30, NULL, NULL, NULL, '2024-01-24 11:16:56', '2024-01-24 11:21:07', 'N'),
(160, 7, 'Manual', '1201', 'SO2401-23-0159', NULL, 'F-24-0040', 'Umum', '2024-01-24', NULL, '2024-01-24', 'Credit', '2024-02-23', NULL, '-', 0, 20000, 0, 2200, 0, 22200, 'Selesai', 22200, 30, NULL, NULL, NULL, '2024-01-24 11:18:43', '2024-01-24 11:20:53', 'N'),
(161, 1005, 'Manual', '1101', 'SO2401-48-0160', 'SJS-24-0058', 'FCS-24-0021', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 0, 0, 0, 0, 0, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:22:50', '2024-01-24 11:29:53', 'N'),
(162, 1005, 'Manual', '1101', 'SO2401-23-0161', 'SJS-24-0059', 'FCS-24-0022', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 112500, 0, 0, 0, 112500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:33:11', '2024-01-24 11:34:05', 'N'),
(163, 1005, 'Manual', '1101', 'SO2401-23-0162', 'SJS-24-0060', 'FCS-24-0023', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 0, 0, 0, 0, 0, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:34:31', '2024-01-24 11:35:43', 'N'),
(164, 1005, 'Manual', '1101', 'SO2401-23-0163', 'SJS-24-0061', 'FCS-24-0024', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 225000, 0, 0, 0, 225000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:50:08', '2024-01-24 11:50:59', 'N'),
(165, 1005, 'Manual', '1101', 'SO2401-23-0164', 'SJS-24-0062', 'FCS-24-0025', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, -112500, 0, 0, 0, -112500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:51:14', '2024-01-24 11:52:05', 'N'),
(166, 1005, 'Manual', '1101', 'SO2401-23-0165', 'SJS-24-0063', 'FCS-24-0026', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 75000, 0, 0, 0, 75000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:53:19', '2024-01-24 11:54:08', 'N'),
(167, 1005, 'Manual', '1101', 'SO2401-23-0166', 'SJS-24-0064', NULL, 'Umum', '2024-01-24', '2024-01-24', NULL, 'Cash', NULL, NULL, '-', 0, 112500, 0, 0, 0, 112500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:56:08', '2024-01-24 11:56:34', 'N'),
(168, 1005, 'Manual', '1101', 'SO2401-23-0167', 'SJS-24-0065', NULL, 'Umum', '2024-01-24', '2024-01-24', NULL, 'Cash', NULL, NULL, '-', 0, -37500, 0, 0, 0, -37500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 11:58:05', '2024-01-24 11:58:46', 'N'),
(169, 269, 'Manual', '1101', 'SO2401-46-0168', 'SJS-24-0066', 'FTS-24-0041', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 9250000, 5000, 0, 5000000, 9245000, 'Selesai', 0, 30, 'BERKAT', 'DIKIRIM UNTUK TOKP SANJAYA', 'SP NO 0066', '2024-01-24 12:02:41', '2024-01-24 12:04:50', 'N'),
(170, 359, 'Manual', '1101', 'SO2401-46-0169', 'SJS-24-0067', 'FTS-24-0042', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 1406000, 0, 0, 0, 1406000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 12:05:59', '2024-01-24 12:09:17', 'N'),
(171, 368, 'Manual', '1101', 'SO2401-46-0170', 'SJS-24-0068', 'FTS-24-0043', 'Umum', '2024-01-24', '2024-01-24', '2024-01-24', 'Cash', NULL, NULL, '-', 0, 1078000, 0, 0, 0, 1078000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-24 13:09:03', '2024-01-24 13:10:51', 'N');
INSERT INTO `penjualans` (`id`, `id_konsumens`, `tipe_penjualan`, `kode_akun`, `kode`, `kode_sj`, `kode_inv`, `kategori`, `tanggal`, `tanggal_sj`, `tanggal_inv`, `pembayaran`, `jatuh_tempo`, `keterangan`, `catatan_nama`, `biaya_tambahan`, `subtotal`, `diskon`, `pajak`, `dp`, `grandtotal`, `status`, `sisa`, `termin`, `ekspedisi`, `alamat_sj`, `alamat_inv`, `created_at`, `updated_at`, `akses_edit`) VALUES
(172, 397, 'Manual', '1101', 'SO2401-46-0171', NULL, NULL, 'Umum', '2024-01-25', NULL, NULL, 'Cash', NULL, NULL, '-', 0, 1642500, 0, 0, 0, 1642500, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-25 10:14:40', '2024-01-25 10:17:03', 'N'),
(173, 397, 'Manual', '1101', 'SO2401-46-0172', 'SJS-24-0069', 'FTS-24-0044', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 11819000, 0, 0, 0, 11819000, 'Selesai', 0, 30, 'LINTAS AGUNG', NULL, 'SP NO 0069', '2024-01-25 10:17:13', '2024-01-25 10:21:22', 'N'),
(174, 545, 'Manual', '1101', 'SO2401-46-0173', 'SJS-24-0070', 'FTS-24-0045', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 485500, 0, 0, 200000, 485500, 'Selesai', 0, 30, 'BALI JAYA EXPRESS', 'JL. NUSA INDAH NO. 1, RT 001 RW 002\nKELURAHAN DARAT SEKIP\n0813111222333\nPONTIANAK SELATAN', 'SP NO 0070', '2024-01-25 13:24:56', '2024-01-25 13:30:47', 'N'),
(175, 604, 'Manual', '1101', 'SO2401-46-0174', 'SJS-24-0071', 'FTS-24-0046', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 17435000, 0, 0, 3000000, 17435000, 'Selesai', 0, 30, NULL, NULL, 'JERUJU\n\nSP NO 0071', '2024-01-25 13:32:18', '2024-01-25 13:34:28', 'N'),
(176, 269, 'Manual', '1101', 'SO2401-46-0175', 'SJS-24-0072', 'FTS-24-0047', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 10582000, 0, 0, 0, 10582000, 'Selesai', 0, 30, NULL, 'JL. SULTAN MUHAMMAD NO. 1\nRT 001 RW 002, KEL. MARINA LAUT\nPONTIANAK KOTA\n78123\n\nVIA : BALI JAYA EXPRESS', NULL, '2024-01-25 13:51:43', '2024-01-25 13:56:26', 'N'),
(177, 739, 'Manual', '1201', 'SO2401-23-0176', 'S-24-0053', 'F-24-0041', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Credit', '2024-02-24', NULL, '-', 0, 1765500, 0, 194205, 0, 1959705, 'Selesai', 1959705, 30, NULL, NULL, NULL, '2024-01-25 13:54:59', '2024-01-25 14:05:59', 'N'),
(178, 1005, 'Manual', '1101', 'SO2401-48-0177', 'SJS-24-0073', 'FCS-24-0027', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 300000, 0, 0, 0, 300000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-25 14:00:12', '2024-01-25 14:01:42', 'N'),
(179, 1005, 'Manual', '1101', 'SO2401-48-0178', 'SJS-24-0074', 'FCS-24-0028', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 298000, 0, 0, 0, 298000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-25 14:02:52', '2024-01-25 14:04:28', 'N'),
(180, 1005, 'Manual', '1101', 'SO2401-48-0179', 'SJS-24-0075', 'FCS-24-0029', 'Umum', '2024-01-25', '2024-01-25', '2024-01-25', 'Cash', NULL, NULL, '-', 0, 600300, 0, 0, 0, 600300, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-25 14:05:07', '2024-01-25 14:06:59', 'N'),
(181, 728, 'Manual', '1201', 'SO2401-23-0180', 'S-24-0054', 'F-24-0042', 'Umum', '2024-01-26', '2024-01-26', '2024-01-26', 'Credit', '2024-02-25', NULL, '-', 0, 1292500, 0, 142175, 0, 1434675, 'Selesai', 1434675, 30, NULL, NULL, NULL, '2024-01-26 08:05:21', '2024-01-26 08:07:48', 'N'),
(182, 1005, 'Manual', '1101', 'SO2401-48-0181', 'SJS-24-0076', NULL, 'Umum', '2024-01-26', '2024-01-26', NULL, 'Cash', NULL, NULL, '-', 0, 630000, 0, 0, 0, 630000, 'Selesai', 0, 30, NULL, 'JL. JALAN NO. NOMOR \nSINTANG \n\nVIA: MARSELLA', NULL, '2024-01-26 09:51:30', '2024-01-26 09:56:49', 'N'),
(183, 1007, 'Manual', '1101', 'SO2401-48-0182', NULL, 'FCS-24-0030', 'Umum', '2024-01-26', NULL, '2024-01-26', 'Cash', NULL, NULL, '-', 0, 630000, 0, 0, 0, 630000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-26 10:06:26', '2024-01-26 10:08:04', 'N'),
(184, 778, 'Manual', '1201', 'SO2401-23-0183', 'S-24-0055', 'F-24-0043', 'Umum', '2024-01-26', '2024-01-26', '2024-01-26', 'Credit', '2024-02-25', 'po no. 250', '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 391275, 30, 'cahaya selatan', 'jalann\njajaj\namma', NULL, '2024-01-26 12:27:49', '2024-01-26 12:30:23', 'N'),
(185, 806, 'Manual', '1201', 'SO2401-23-0184', 'S-24-0056', NULL, 'Umum', '2024-01-26', '2024-01-26', NULL, 'Credit', NULL, 'PO NO. 0251', '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 391275, 30, NULL, NULL, NULL, '2024-01-26 12:38:18', '2024-01-26 12:39:29', 'N'),
(186, 733, 'Manual', '1201', 'SO2401-23-0185', 'S-24-0057', 'F-24-0044', 'Umum', '2024-01-26', '2024-01-26', '2024-01-26', 'Credit', '2024-02-25', 'po no., 258000', '-', 0, 352500, 0, 38775, 0, 391275, 'Selesai', 391275, 30, 'cahaya pelita', 'jala harium manis\ns\ns\na', 'sp no. 0057', '2024-01-26 13:03:09', '2024-01-26 13:04:08', 'N'),
(187, 25, 'Manual', '1101', 'SO2401-46-0186', 'SJS-24-0077', 'FTS-24-0048', 'Umum', '2024-01-27', '2024-01-27', '2024-01-27', 'Cash', NULL, NULL, '-', 0, 6525000, 0, 0, 0, 6525000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-27 10:09:15', '2024-01-27 10:11:02', 'N'),
(188, 806, 'Manual', '1201', 'SO2401-23-0187', 'S-24-0058', 'F-24-0045', 'Umum', '2024-01-27', '2024-01-27', '2024-01-27', 'Credit', '2024-02-26', 'PO NO. 87500', '-', 0, 17910250, 0, 1970128, 0, 19880378, 'Selesai', 19880378, 30, NULL, NULL, NULL, '2024-01-27 11:05:22', '2024-01-27 11:09:14', 'N'),
(189, 520, 'Manual', '1101', 'SO2401-46-0188', 'SJS-24-0078', 'FTS-24-0049', 'Umum', '2024-01-27', '2024-01-27', '2024-01-27', 'Cash', NULL, NULL, '-', 0, 10144000, 0, 0, 0, 10144000, 'Selesai', 0, 30, NULL, 'VIA MITRA TAXI', 'SP NO 0078', '2024-01-27 11:11:31', '2024-01-27 11:12:52', 'N'),
(190, 187, 'Manual', '1101', 'SO2401-46-0189', 'SJS-24-0079', 'FTS-24-0050', 'Umum', '2024-01-27', '2024-01-27', '2024-01-27', 'Cash', NULL, NULL, '-', 0, 1824000, 0, 0, 0, 1824000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-27 13:15:51', '2024-01-27 13:17:33', 'N'),
(191, 471, 'Manual', '1101', 'SO2401-46-0190', 'SJS-24-0080', 'FTS-24-0051', 'Umum', '2024-01-27', '2024-01-27', '2024-01-27', 'Cash', NULL, NULL, '-', 0, 636000, 0, 0, 0, 636000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-27 14:45:14', '2024-01-27 14:45:51', 'N'),
(192, 269, 'Manual', '1101', 'SO2401-46-0191', 'SJS-24-0081', 'FTS-24-0052', 'Umum', '2024-01-29', '2024-01-29', '2024-01-29', 'Cash', NULL, NULL, '-', 0, 9250000, 0, 0, 0, 9250000, 'Selesai', 0, 30, NULL, NULL, NULL, '2024-01-29 08:19:32', '2024-01-29 08:20:42', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_details`
--

CREATE TABLE `penjualan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_barangs` int(10) NOT NULL DEFAULT 0,
  `total_jual` double NOT NULL DEFAULT 0,
  `harga` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `diskon_paket` double NOT NULL DEFAULT 0,
  `diskon_extra` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_details`
--

INSERT INTO `penjualan_details` (`id`, `id_penjualans`, `id_barangs`, `total_jual`, `harga`, `diskon`, `diskon_paket`, `diskon_extra`, `subtotal`, `catatan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-08 13:24:47', '2024-01-08 13:24:47'),
(2, 2, 1, 110, 50000, 0, 0, 0, 5500000, NULL, 'Active', '2024-01-08 13:41:06', '2024-01-08 13:41:06'),
(3, 3, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-08 13:42:11', '2024-01-08 13:42:11'),
(4, 4, 1, 1.5, 50000, 0, 0, 0, 75000, NULL, 'Active', '2024-01-08 15:42:49', '2024-01-08 15:42:49'),
(5, 5, 1, 10.52, 50000, 0, 0, 0, 526000, 'catatan produk', 'Active', '2024-01-08 15:45:34', '2024-01-08 15:45:45'),
(6, 6, 1, 10.5, 20000, 0, 0, 0, 210000, NULL, 'Active', '2024-01-08 15:54:36', '2024-01-08 15:54:36'),
(7, 7, 1, 2, 2000, 0, 0, 0, 4000, NULL, 'Active', '2024-01-08 20:06:07', '2024-01-08 20:06:07'),
(8, 8, 1, 1, 2000, 0, 0, 0, 2000, NULL, 'Active', '2024-01-08 20:06:26', '2024-01-08 20:06:26'),
(9, 9, 2, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 11:21:56', '2024-01-09 11:21:56'),
(10, 10, 2, 150.25, 20000, 0, 0, 0, 3005000, NULL, 'Active', '2024-01-09 13:01:23', '2024-01-09 13:01:23'),
(11, 11, 2, 10.25, 2000, 0, 0, 0, 20500, NULL, 'Active', '2024-01-09 13:03:45', '2024-01-09 13:03:45'),
(12, 12, 2, 1, 20000, 0, 0, 0, 20000, 'catatan per produk', 'Active', '2024-01-09 13:08:44', '2024-01-09 13:08:57'),
(13, 13, 2, 20, 20000, 0, 0, 0, 400000, NULL, 'Active', '2024-01-09 13:11:30', '2024-01-09 13:11:30'),
(14, 14, 2, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 13:12:46', '2024-01-09 13:12:46'),
(15, 14, 5, 20, 18181, 0, 0, 0, 363620, NULL, 'Active', '2024-01-09 13:13:13', '2024-01-09 13:14:03'),
(16, 15, 2, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 13:16:26', '2024-01-09 13:16:26'),
(17, 16, 3, 1, 500000, 0, 0, 0, 500000, NULL, 'Active', '2024-01-09 13:16:48', '2024-01-09 13:16:48'),
(18, 17, 1, 20, 200000, 0, 0, 0, 4000000, NULL, 'Active', '2024-01-09 13:23:41', '2024-01-09 13:23:41'),
(19, 18, 1, 20, 100000, 0, 0, 0, 2000000, NULL, 'Active', '2024-01-09 13:24:09', '2024-01-09 13:24:09'),
(20, 19, 4, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 13:36:59', '2024-01-09 13:36:59'),
(21, 20, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 14:11:32', '2024-01-09 14:11:32'),
(22, 21, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-09 14:12:03', '2024-01-09 14:12:03'),
(23, 22, 308, 18, 17000, 0, 0, 0, 306000, '4 KRG @ 25 KG', 'Active', '2024-01-09 14:15:08', '2024-01-09 14:15:57'),
(24, 22, 1, 15, 20000, 0, 0, 0, 300000, '4 KRG @ 25 KG', 'Active', '2024-01-09 14:15:39', '2024-01-09 14:15:47'),
(25, 23, 1, 15, 180000, 0, 0, 0, 2700000, NULL, 'Active', '2024-01-09 14:20:18', '2024-01-09 14:20:18'),
(26, 24, 1, 15, 180000, 0, 0, 0, 2700000, NULL, 'Active', '2024-01-09 14:22:59', '2024-01-09 14:22:59'),
(27, 25, 1, 25, 235000, 0, 0, 0, 5875000, NULL, 'Active', '2024-01-09 14:25:01', '2024-01-09 14:25:01'),
(28, 25, 1, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-09 14:25:25', '2024-01-09 14:25:25'),
(29, 26, 307, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-09 14:26:33', '2024-01-09 14:26:33'),
(30, 27, 1, 15, 20000, 0, 0, 0, 300000, NULL, 'Active', '2024-01-09 14:31:34', '2024-01-09 14:31:34'),
(31, 28, 1, 100, 21000, 0, 0, 0, 2100000, NULL, 'Active', '2024-01-09 14:36:17', '2024-01-09 14:36:17'),
(32, 29, 1, 10, 200000, 0, 0, 0, 2000000, '27,5 / 27,5 / 28,5 / 28,5 / 29 / 29 / 28 / 30 / 25 / 25 / 25 / 25 / 25 / 35 / 25 / 2 5 / 25 / 25 / 28 /25 / 25 / 2 5 / 25 / 30 / 25 / 25 / 20 / 25 / 25 / 25 / 25 / 25 / 25', 'Active', '2024-01-09 14:40:38', '2024-01-09 14:40:38'),
(33, 30, 6, 12, 20000, 0, 0, 0, 240000, NULL, 'Active', '2024-01-09 14:44:21', '2024-01-09 14:44:21'),
(34, 31, 1, 12, 21000, 0, 0, 0, 252000, NULL, 'Active', '2024-01-09 14:44:59', '2024-01-09 14:44:59'),
(35, 32, 1, 1, 500.7, 0, 0, 0, 500.7, NULL, 'Active', '2024-01-09 15:22:24', '2024-01-09 15:22:24'),
(36, 32, 3, 1, 18181.23, 0, 0, 0, 18181.23, NULL, 'Active', '2024-01-10 09:41:11', '2024-01-10 09:41:11'),
(37, 33, 1, 2, 18181.18, 0, 0, 0, 36362.36, NULL, 'Active', '2024-01-10 09:42:21', '2024-01-10 09:42:21'),
(38, 34, 1, 20, 50253.23, 0, 0, 0, 1005064.6, NULL, 'Active', '2024-01-10 09:48:57', '2024-01-10 09:48:57'),
(39, 35, 1, 30, 50235.23, 0, 0, 0, 1507056.9, NULL, 'Active', '2024-01-10 09:50:50', '2024-01-10 09:50:50'),
(40, 36, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-11 09:55:02', '2024-01-11 09:55:02'),
(41, 36, 4, 1.5, 20000, 0, 0, 0, 30000, NULL, 'Active', '2024-01-11 10:06:53', '2024-01-11 10:06:53'),
(42, 37, 1, 20, 12000.32, 0, 0, 0, 240006.4, NULL, 'Active', '2024-01-11 10:25:30', '2024-01-11 10:25:30'),
(43, 37, 9, 30, 20563.25, 0, 0, 0, 616897.5, NULL, 'Active', '2024-01-11 10:25:54', '2024-01-11 10:25:54'),
(44, 38, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-11 10:44:47', '2024-01-11 10:44:47'),
(45, 39, 97, 1000, 16126.13, 0, 0, 0, 16126130, NULL, 'Active', '2024-01-11 11:37:31', '2024-01-11 11:38:12'),
(46, 39, 12, 300, 26756.76, 0, 0, 0, 8027028, NULL, 'Active', '2024-01-11 11:44:30', '2024-01-11 11:48:56'),
(47, 39, 211, 150, 25855.86, 0, 0, 0, 3878379, NULL, 'Active', '2024-01-11 11:45:36', '2024-01-11 11:49:09'),
(48, 40, 1, 1, 40000, 0, 0, 0, 40000, NULL, 'Active', '2024-01-12 12:22:25', '2024-01-12 12:22:25'),
(50, 42, 2, 20, 200000, 0, 0, 0, 4000000, NULL, 'Active', '2024-01-12 14:46:57', '2024-01-12 14:46:57'),
(51, 43, 2, 20, 50000, 0, 0, 0, 1000000, NULL, 'Active', '2024-01-12 14:49:02', '2024-01-12 14:49:02'),
(52, 45, 1, 5, 30000, 0, 0, 0, 150000, NULL, 'Active', '2024-01-13 10:40:31', '2024-01-13 10:40:31'),
(53, 46, 1, 1, 10000, 0, 0, 0, 10000, NULL, 'Active', '2024-01-15 09:47:12', '2024-01-15 09:47:12'),
(54, 46, 2, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-15 09:47:22', '2024-01-15 09:47:22'),
(55, 46, 3, 1, 5000, 0, 0, 0, 5000, NULL, 'Active', '2024-01-15 09:48:21', '2024-01-15 09:48:21'),
(56, 46, 5, 2.5, 10000, 0, 0, 0, 25000, NULL, 'Active', '2024-01-15 09:48:49', '2024-01-15 09:48:49'),
(57, 47, 1, 1, 20000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-15 09:54:25', '2024-01-15 09:54:25'),
(58, 48, 1, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-15 10:03:13', '2024-01-15 10:03:13'),
(59, 49, 181, 30, 29500, 0, 0, 0, 885000, NULL, 'Active', '2024-01-15 10:22:42', '2024-01-15 10:22:42'),
(60, 49, 183, 40, 29500, 0, 0, 0, 1180000, NULL, 'Active', '2024-01-15 10:23:36', '2024-01-15 10:23:36'),
(61, 50, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-15 10:35:05', '2024-01-15 10:35:05'),
(62, 50, 2, 10, 23500, 0, 0, 0, 235000, NULL, 'Active', '2024-01-15 10:35:26', '2024-01-15 10:35:26'),
(63, 51, 1, 1.2, 10000, 0, 0, 0, 12000, NULL, 'Active', '2024-01-15 10:36:39', '2024-01-15 10:36:39'),
(64, 51, 1, 2.3, 20000, 0, 0, 0, 46000, NULL, 'Active', '2024-01-15 10:36:48', '2024-01-15 10:36:48'),
(65, 51, 1, 4.6, 10000, 0, 0, 0, 46000, NULL, 'Active', '2024-01-15 10:36:59', '2024-01-15 10:36:59'),
(66, 51, 1, 7.8, 5000, 0, 0, 0, 39000, NULL, 'Active', '2024-01-15 10:37:12', '2024-01-15 10:37:12'),
(67, 51, 2, 9.8, 20000, 0, 0, 0, 196000, NULL, 'Active', '2024-01-15 10:37:27', '2024-01-15 10:37:27'),
(68, 52, 1, 40, 32000, 800, 0, 0, 1248000, NULL, 'Active', '2024-01-15 10:57:51', '2024-01-15 10:57:51'),
(69, 52, 120, 50, 75000, 25000, 25000, 25000, 0, NULL, 'Active', '2024-01-15 10:58:22', '2024-01-15 11:03:28'),
(70, 53, 1, 5, 32000, 200, 0, 0, 159000, NULL, 'Active', '2024-01-15 11:07:53', '2024-01-15 11:09:56'),
(71, 53, 126, 30, 186000, 1500, 1500, 1500, 5445000, NULL, 'Active', '2024-01-15 11:10:39', '2024-01-15 11:10:39'),
(72, 54, 1, 20, 50000, 0, 0, 0, 1000000, NULL, 'Active', '2024-01-15 11:29:34', '2024-01-15 11:29:34'),
(73, 54, 2, 1.5, 20000, 0, 0, 0, 30000, NULL, 'Active', '2024-01-15 11:29:42', '2024-01-15 11:29:42'),
(74, 54, 3, 20, 20000, 0, 0, 0, 400000, NULL, 'Active', '2024-01-15 11:29:51', '2024-01-15 11:29:51'),
(75, 55, 2, 50, 20000, 0, 0, 0, 1000000, NULL, 'Active', '2024-01-15 11:45:51', '2024-01-15 11:45:51'),
(76, 56, 1, 20, 32000, 0, 0, 0, 640000, NULL, 'Active', '2024-01-15 11:51:36', '2024-01-15 11:51:36'),
(77, 56, 3, 20, 20000, 0, 0, 0, 400000, NULL, 'Active', '2024-01-15 11:51:43', '2024-01-15 11:51:43'),
(78, 57, 1, 50, 12000, 0, 0, 0, 600000, NULL, 'Active', '2024-01-15 12:13:06', '2024-01-15 12:13:06'),
(79, 58, 1, 20.3, 20000, 0, 0, 0, 406000, NULL, 'Active', '2024-01-15 12:14:13', '2024-01-15 12:14:13'),
(80, 59, 1, 50.3, 20000, 0, 0, 0, 1006000, NULL, 'Active', '2024-01-15 12:14:55', '2024-01-15 12:14:55'),
(81, 60, 1, 20.3, 150000, 0, 0, 0, 3045000, NULL, 'Active', '2024-01-15 12:24:54', '2024-01-15 12:24:54'),
(82, 61, 142, 150, 32500, 0, 0, 0, 4875000, NULL, 'Active', '2024-01-15 15:02:27', '2024-01-15 15:02:27'),
(83, 62, 1, 10, 28000, 0, 0, 0, 280000, '4 KRG @ 25 KG', 'Active', '2024-01-16 12:51:32', '2024-01-16 12:52:40'),
(85, 62, 2, 10, 28000, 0, 0, 0, 280000, NULL, 'Active', '2024-01-16 12:53:27', '2024-01-16 12:53:27'),
(86, 63, 1, 12, 20000, 0, 0, 0, 240000, NULL, 'Active', '2024-01-16 13:10:23', '2024-01-16 13:10:23'),
(87, 64, 2, 15, 50000, 0, 0, 0, 750000, NULL, 'Active', '2024-01-16 13:12:00', '2024-01-16 13:12:00'),
(88, 65, 15, 40, 32000, 200, 0, 0, 1272000, NULL, 'Active', '2024-01-16 13:27:27', '2024-01-16 13:27:27'),
(89, 65, 120, 10, 75000, 500, 0, 0, 745000, NULL, 'Active', '2024-01-16 13:27:43', '2024-01-16 13:27:43'),
(90, 65, 137, 2, 149000, 1000, 0, 0, 296000, NULL, 'Active', '2024-01-16 13:28:26', '2024-01-16 13:28:26'),
(92, 67, 6, 200, 20000, 0, 0, 0, 4000000, NULL, 'Active', '2024-01-16 13:55:59', '2024-01-16 13:55:59'),
(93, 68, 6, 500, 20000, 0, 0, 0, 10000000, NULL, 'Active', '2024-01-16 13:56:58', '2024-01-16 13:56:58'),
(94, 68, 7, 200, 70000, 0, 0, 0, 14000000, NULL, 'Active', '2024-01-16 13:57:14', '2024-01-16 13:57:14'),
(95, 69, 6, 300, 20000, 0, 0, 0, 6000000, NULL, 'Active', '2024-01-16 13:57:51', '2024-01-16 13:58:19'),
(96, 69, 7, 300, 70000, 0, 0, 0, 21000000, NULL, 'Active', '2024-01-16 13:58:07', '2024-01-16 13:58:07'),
(97, 70, 1, 10, 22000, 0, 0, 0, 220000, NULL, 'Active', '2024-01-16 14:26:15', '2024-01-16 14:26:15'),
(98, 71, 3, 10, 22000, 0, 0, 0, 220000, NULL, 'Active', '2024-01-16 14:41:32', '2024-01-16 14:41:32'),
(99, 72, 13, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:48:12', '2024-01-16 14:48:12'),
(100, 73, 3, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-16 14:51:13', '2024-01-16 14:51:13'),
(101, 73, 308, 115, 23000, 0, 0, 0, 2645000, NULL, 'Active', '2024-01-16 14:51:32', '2024-01-16 14:51:32'),
(102, 74, 177, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-16 14:53:42', '2024-01-16 14:53:42'),
(103, 74, 179, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:54:04', '2024-01-16 14:54:04'),
(104, 74, 166, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:54:16', '2024-01-16 14:54:16'),
(105, 74, 1, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:54:29', '2024-01-16 14:54:29'),
(106, 74, 1, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:54:41', '2024-01-16 14:54:41'),
(107, 74, 270, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:54:57', '2024-01-16 14:54:57'),
(108, 74, 147, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:55:15', '2024-01-16 14:55:15'),
(109, 74, 167, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:55:31', '2024-01-16 14:55:31'),
(110, 75, 3, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:59:26', '2024-01-16 14:59:26'),
(111, 75, 3, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:59:38', '2024-01-16 14:59:38'),
(112, 75, 182, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 14:59:52', '2024-01-16 14:59:52'),
(113, 76, 170, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 15:02:56', '2024-01-16 15:02:56'),
(114, 76, 3, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 15:03:08', '2024-01-16 15:03:08'),
(115, 76, 187, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 15:03:18', '2024-01-16 15:03:18'),
(116, 77, 8, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 15:12:07', '2024-01-16 15:12:07'),
(117, 77, 1, 10, 230000, 0, 0, 0, 2300000, NULL, 'Active', '2024-01-16 15:12:20', '2024-01-16 15:12:20'),
(118, 77, 167, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-16 15:12:35', '2024-01-16 15:12:35'),
(119, 79, 19, 65, 32000, 200, 0, 0, 2067000, 'PO NO. 123456', 'Active', '2024-01-17 08:14:37', '2024-01-17 08:14:37'),
(120, 80, 1, 50, 32000, 200, 0, 0, 1590000, '5 krg @ 40kg', 'Active', '2024-01-17 09:02:55', '2024-01-17 09:05:50'),
(121, 80, 5, 10, 30000, 200, 0, 0, 298000, '2 IKAT', 'Active', '2024-01-17 09:06:17', '2024-01-17 09:06:17'),
(122, 81, 1, 10, 30000, 200, 0, 0, 298000, NULL, 'Active', '2024-01-17 09:13:19', '2024-01-17 09:13:19'),
(123, 82, 308, 3500, 18500, 0, 0, 0, 64750000, NULL, 'Active', '2024-01-17 10:01:21', '2024-01-17 10:01:21'),
(124, 83, 174, 6, 32000, 0, 0, 0, 192000, NULL, 'Active', '2024-01-17 10:31:32', '2024-01-17 10:31:32'),
(125, 83, 176, 6, 32000, 0, 0, 0, 192000, NULL, 'Active', '2024-01-17 10:31:53', '2024-01-17 10:31:53'),
(126, 83, 177, 6, 32000, 0, 0, 0, 192000, NULL, 'Active', '2024-01-17 10:32:16', '2024-01-17 10:32:16'),
(127, 83, 179, 6, 31000, 0, 0, 0, 186000, NULL, 'Active', '2024-01-17 10:32:38', '2024-01-17 10:32:38'),
(128, 83, 181, 6, 31000, 0, 0, 0, 186000, NULL, 'Active', '2024-01-17 10:32:54', '2024-01-17 10:32:54'),
(129, 83, 183, 4, 31500, 0, 0, 0, 126000, NULL, 'Active', '2024-01-17 10:33:10', '2024-01-17 10:33:10'),
(130, 84, 310, 12, 26000, 0, 0, 0, 312000, NULL, 'Active', '2024-01-17 10:39:17', '2024-01-17 10:39:17'),
(131, 84, 312, 12, 26000, 0, 0, 0, 312000, NULL, 'Active', '2024-01-17 10:39:40', '2024-01-17 10:39:40'),
(132, 84, 313, 12, 26000, 0, 0, 0, 312000, NULL, 'Active', '2024-01-17 10:40:20', '2024-01-17 10:40:20'),
(133, 84, 121, 5, 146000, 1000, 0, 0, 725000, NULL, 'Active', '2024-01-17 10:40:58', '2024-01-17 10:40:58'),
(134, 84, 127, 10, 75000, 500, 0, 0, 745000, NULL, 'Active', '2024-01-17 10:41:19', '2024-01-17 10:42:19'),
(135, 84, 137, 5, 149000, 1000, 0, 0, 740000, NULL, 'Active', '2024-01-17 10:41:44', '2024-01-17 10:41:44'),
(136, 85, 328, 2160.9, 17500, 0, 0, 0, 37815750, 'LIPAT 6,5CM (013/26/26), 86 KRG @ 25 KG + 1 KRG @ 10,9 KG', 'Active', '2024-01-17 10:55:57', '2024-01-17 10:57:07'),
(137, 85, 329, 2047.1, 17500, 0, 0, 0, 35824250, 'LIPAT 6 CM (010/24/25), 81 KRG @ 25 KG + 1 KRG 22,1 KG', 'Active', '2024-01-17 10:58:22', '2024-01-17 10:58:22'),
(138, 86, 330, 4000, 17500, 0, 0, 0, 70000000, NULL, 'Active', '2024-01-17 12:04:13', '2024-01-17 12:04:13'),
(139, 87, 1, 200, 20000, 1500, 500, 200, 3560000, NULL, 'Active', '2024-01-17 15:29:45', '2024-01-17 15:30:29'),
(140, 78, 3, 200, 0, 0, 0, 0, 0, NULL, 'Active', '2024-01-18 14:36:21', '2024-01-18 14:36:21'),
(141, 88, 140, 10, 225000, 0, 0, 0, 2250000, NULL, 'Active', '2024-01-19 09:46:34', '2024-01-19 09:46:34'),
(142, 89, 308, 120, 26000, 0, 0, 0, 3120000, NULL, 'Active', '2024-01-19 09:55:52', '2024-01-19 09:55:52'),
(143, 90, 118, 1000, 73000, 0, 0, 0, 73000000, '100 KRG @ 10 BAL', 'Active', '2024-01-19 09:58:42', '2024-01-19 09:59:50'),
(144, 91, 151, 10, 31000, 200, 0, 0, 308000, '1 BKS @ 1 KG', 'Active', '2024-01-19 10:02:20', '2024-01-19 10:02:20'),
(145, 78, 1, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-19 12:10:12', '2024-01-19 12:10:12'),
(146, 78, 10, 15, 24000, 0, 0, 0, 360000, NULL, 'Active', '2024-01-19 12:10:23', '2024-01-19 12:10:23'),
(147, 92, 2, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-19 12:10:49', '2024-01-19 12:10:49'),
(148, 92, 72, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-19 12:11:01', '2024-01-19 12:11:01'),
(149, 93, 1, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-19 12:30:41', '2024-01-19 12:30:41'),
(150, 94, 1, 50, 23000, 0, 0, 0, 1150000, NULL, 'Active', '2024-01-19 12:31:46', '2024-01-19 12:31:46'),
(151, 95, 1, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-19 12:41:58', '2024-01-19 12:41:58'),
(152, 96, 2, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-19 12:47:22', '2024-01-19 12:47:22'),
(153, 97, 1, 111, 23000, 0, 0, 0, 2553000, NULL, 'Active', '2024-01-19 12:48:58', '2024-01-19 12:48:58'),
(154, 98, 1, 10, 23000, 0, 0, 0, 230000, NULL, 'Active', '2024-01-19 12:58:12', '2024-01-19 12:58:12'),
(155, 99, 1, 25, 23000, 0, 0, 0, 575000, NULL, 'Active', '2024-01-19 12:59:37', '2024-01-19 12:59:37'),
(156, 99, 3, 20, 23000, 0, 0, 0, 460000, NULL, 'Active', '2024-01-19 12:59:55', '2024-01-19 12:59:55'),
(157, 100, 1, 20, 20000, 100, 200, 100, 392000, NULL, 'Active', '2024-01-20 11:21:11', '2024-01-20 11:21:11'),
(159, 102, 1, 200, 20000, 0, 0, 0, 4000000, NULL, 'Active', '2024-01-20 11:40:21', '2024-01-20 11:40:21'),
(160, 103, 2, 115, 23000, 0, 0, 0, 2645000, NULL, 'Active', '2024-01-20 11:54:33', '2024-01-20 11:54:33'),
(161, 104, 3, 15, 23000, 0, 0, 0, 345000, '2 krg @ 30 kg || 4 krg @ 20 kg , 20 jrgf @ 30 kg', 'Active', '2024-01-20 11:57:22', '2024-01-20 11:57:22'),
(162, 105, 148, 30, 32000, 200, 0, 0, 954000, NULL, 'Active', '2024-01-20 12:09:47', '2024-01-20 12:09:47'),
(163, 105, 127, 25, 75000, 500, 500, 0, 1850000, '5 KRG @ 10 BAL', 'Active', '2024-01-20 12:11:10', '2024-01-20 12:11:10'),
(164, 101, 2, 15, 230000, 0, 0, 0, 3450000, '1 krg @ 40 kG , 4 Krg @ 30 KG', 'Active', '2024-01-20 13:12:11', '2024-01-20 13:12:11'),
(165, 101, 1, 10, 235000, 0, 0, 0, 2350000, '1 krg @ 30 kg, 1 krg @ 40 kg', 'Active', '2024-01-20 13:12:31', '2024-01-20 13:12:31'),
(166, 101, 1, 15, 23000, 0, 0, 0, 345000, '2 krg @ 23 Kg, 4 Krg @ 25Kg, 25 Krg @ 20 Kg', 'Active', '2024-01-20 13:13:01', '2024-01-20 13:13:01'),
(167, 101, 2, 15, 23000, 0, 0, 0, 345000, '1 krg @ 20 kg, 2 krg @ 25 Kg', 'Active', '2024-01-20 13:13:37', '2024-01-20 13:13:37'),
(168, 101, 15, 15, 23000, 0, 0, 0, 345000, '3 krg @ 25 kg, 2 krg @ 25 kg, 25 krg @ 25 kg', 'Active', '2024-01-20 13:14:08', '2024-01-20 13:14:08'),
(169, 106, 1, 10, 28000, 200, 200, 200, 274000, NULL, 'Active', '2024-01-20 13:55:58', '2024-01-20 13:55:58'),
(170, 107, 2, 10, 28000, 200, 200, 200, 274000, NULL, 'Active', '2024-01-20 13:57:08', '2024-01-20 13:57:08'),
(171, 107, 5, 10, 28000, 0, 0, 0, 280000, NULL, 'Active', '2024-01-20 13:59:37', '2024-01-20 13:59:37'),
(172, 108, 2, 10, 30000, 200, 0, 0, 298000, NULL, 'Active', '2024-01-20 14:02:37', '2024-01-20 14:02:37'),
(173, 109, 1, 11, 18000, 0, 0, 0, 198000, NULL, 'Active', '2024-01-20 14:10:56', '2024-01-20 14:10:56'),
(174, 110, 3, 10, 30000, 200, 0, 0, 298000, NULL, 'Active', '2024-01-20 14:11:51', '2024-01-20 14:11:51'),
(175, 111, 1, 10, 28000, 200, 0, 0, 278000, NULL, 'Active', '2024-01-20 14:15:10', '2024-01-20 14:15:10'),
(176, 112, 207, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:47:20', '2024-01-20 14:47:20'),
(177, 112, 222, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:47:56', '2024-01-20 14:47:56'),
(178, 112, 162, 30, 3100, 300, 0, 0, 84000, NULL, 'Active', '2024-01-20 14:48:18', '2024-01-20 14:48:18'),
(179, 112, 237, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:48:37', '2024-01-20 14:48:37'),
(180, 112, 268, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:49:19', '2024-01-20 14:49:19'),
(181, 112, 97, 120, 32000, 200, 0, 0, 3816000, '3 KRG @ 4 KG', 'Active', '2024-01-20 14:50:29', '2024-01-20 14:50:29'),
(182, 113, 162, 30, 32000, 300, 0, 0, 951000, NULL, 'Active', '2024-01-20 14:51:58', '2024-01-20 14:53:13'),
(183, 113, 207, 30, 32000, 300, 0, 0, 951000, NULL, 'Active', '2024-01-20 14:52:15', '2024-01-20 14:53:20'),
(184, 113, 179, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:53:39', '2024-01-20 14:53:39'),
(185, 113, 183, 40, 31000, 300, 0, 0, 1228000, NULL, 'Active', '2024-01-20 14:53:56', '2024-01-20 14:53:56'),
(186, 113, 92, 120, 32000, 200, 0, 0, 3816000, '3 KRG @ 40 KG', 'Active', '2024-01-20 14:54:31', '2024-01-20 14:54:31'),
(187, 114, 153, 80, 31000, 300, 0, 0, 2456000, '2 KRG @ 40 KG', 'Active', '2024-01-20 14:58:19', '2024-01-20 14:58:19'),
(188, 114, 149, 30, 31000, 300, 0, 0, 921000, NULL, 'Active', '2024-01-20 14:58:38', '2024-01-20 14:58:38'),
(189, 114, 171, 40, 31000, 300, 0, 0, 1228000, NULL, 'Active', '2024-01-20 14:58:58', '2024-01-20 14:58:58'),
(190, 114, 68, 120, 32000, 200, 0, 0, 3816000, '3 KRG @ 40 KG', 'Active', '2024-01-20 14:59:20', '2024-01-20 14:59:20'),
(191, 114, 18, 40, 32000, 200, 0, 0, 1272000, NULL, 'Active', '2024-01-20 14:59:49', '2024-01-20 14:59:49'),
(192, 115, 123, 25, 55000, 500, 500, 0, 1350000, NULL, 'Active', '2024-01-20 15:11:58', '2024-01-20 15:12:15'),
(193, 116, 135, 5, 150000, 1000, 0, 0, 745000, NULL, 'Active', '2024-01-20 15:14:47', '2024-01-20 15:14:47'),
(194, 117, 140, 50, 225000, 1500, 1500, 0, 11100000, '5 KRG @ 10 BAL', 'Active', '2024-01-20 15:18:23', '2024-01-20 15:18:23'),
(195, 118, 1, 10, 5000, 0, 0, 0, 50000, NULL, 'Active', '2024-01-22 09:22:51', '2024-01-22 09:22:51'),
(196, 119, 4, 10, 5000, 0, 0, 0, 50000, NULL, 'Active', '2024-01-22 09:31:31', '2024-01-22 09:31:31'),
(197, 120, 1, 12, 20000, 500, 0, 0, 234000, NULL, 'Active', '2024-01-23 13:24:27', '2024-01-23 13:24:35'),
(198, 121, 1, 15, 150000, 400, 0, 0, 2244000, NULL, 'Active', '2024-01-23 13:26:38', '2024-01-23 13:26:38'),
(199, 122, 2, 20, 20000, 500, 0, 0, 390000, NULL, 'Active', '2024-01-23 13:40:03', '2024-01-23 13:40:03'),
(200, 123, 181, 10, 23500, 0, 0, 0, 235000, NULL, 'Active', '2024-01-24 07:57:47', '2024-01-24 07:57:47'),
(201, 123, 181, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 07:58:00', '2024-01-24 07:58:00'),
(202, 123, 163, 15, 25000, 0, 0, 0, 375000, NULL, 'Active', '2024-01-24 07:58:19', '2024-01-24 07:58:19'),
(203, 123, 104, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 07:58:31', '2024-01-24 07:58:31'),
(204, 123, 96, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 07:58:47', '2024-01-24 07:58:47'),
(205, 123, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 07:59:00', '2024-01-24 07:59:00'),
(206, 123, 17, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 07:59:14', '2024-01-24 07:59:14'),
(207, 123, 8, 10, 23500, 0, 0, 0, 235000, NULL, 'Active', '2024-01-24 07:59:34', '2024-01-24 07:59:34'),
(208, 124, 82, 214.1, 30000, 0, 0, 0, 6423000, 'UM BCA', 'Active', '2024-01-24 08:14:12', '2024-01-24 08:14:12'),
(209, 125, 318, 3000, 17500, 0, 0, 0, 52500000, '120 KRG @ 25 KG', 'Active', '2024-01-24 08:17:03', '2024-01-24 08:17:03'),
(210, 125, 330, 1500, 17500, 0, 0, 0, 26250000, '60 KRG @ 25 KG', 'Active', '2024-01-24 08:17:46', '2024-01-24 08:17:46'),
(211, 125, 140, 30, 225000, 1500, 1500, 1500, 6615000, NULL, 'Active', '2024-01-24 08:18:11', '2024-01-24 08:18:11'),
(213, 126, 2, 10, 30000, 0, 0, 0, 300000, NULL, 'Active', '2024-01-24 08:22:22', '2024-01-24 08:22:22'),
(214, 127, 178, 30000, 10, 0, 0, 0, 300000, NULL, 'Active', '2024-01-24 08:25:02', '2024-01-24 08:25:02'),
(215, 126, 180, 10, 30000, 0, 0, 0, 300000, NULL, 'Active', '2024-01-24 08:27:25', '2024-01-24 08:27:25'),
(216, 128, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:29:25', '2024-01-24 08:29:25'),
(217, 129, 1, 200, 30000, 0, 0, 0, 6000000, NULL, 'Active', '2024-01-24 08:30:19', '2024-01-24 08:30:19'),
(218, 130, 1, 200, 30000, 0, 0, 0, 6000000, NULL, 'Active', '2024-01-24 08:32:12', '2024-01-24 08:32:12'),
(219, 131, 330, 4500, 17500, 0, 0, 0, 78750000, '180 KRG @ 25 KG', 'Active', '2024-01-24 08:35:33', '2024-01-24 08:35:33'),
(220, 132, 1, 200, 30000, 0, 0, 0, 6000000, NULL, 'Active', '2024-01-24 08:36:03', '2024-01-24 08:36:03'),
(221, 131, 330, 823, 17500, 0, 0, 0, 14402500, '32 KRG @ 25 KG + 1 KRG 23 KG', 'Active', '2024-01-24 08:36:39', '2024-01-24 08:36:39'),
(222, 131, 68, 80, 32000, 200, 0, 0, 2544000, '2 KRG @ 40 KG', 'Active', '2024-01-24 08:37:03', '2024-01-24 08:37:03'),
(223, 133, 1, 200, 30000, 0, 0, 0, 6000000, NULL, 'Active', '2024-01-24 08:40:12', '2024-01-24 08:40:12'),
(224, 135, 1, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:43:51', '2024-01-24 08:43:51'),
(225, 136, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:44:38', '2024-01-24 08:44:38'),
(226, 137, 33, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:45:18', '2024-01-24 08:45:18'),
(227, 138, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:45:52', '2024-01-24 08:45:52'),
(228, 139, 140, 30, 225000, 1500, 1500, 1500, 6615000, NULL, 'Active', '2024-01-24 08:47:10', '2024-01-24 08:47:10'),
(229, 140, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:47:20', '2024-01-24 08:47:20'),
(230, 141, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:49:09', '2024-01-24 08:49:09'),
(231, 142, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:49:56', '2024-01-24 08:49:56'),
(232, 143, 124, 10, 125000, 1000, 0, 0, 1240000, NULL, 'Active', '2024-01-24 08:50:20', '2024-01-24 08:50:20'),
(233, 144, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:50:38', '2024-01-24 08:50:38'),
(234, 145, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:51:46', '2024-01-24 08:51:46'),
(235, 146, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:52:59', '2024-01-24 08:52:59'),
(236, 148, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:53:42', '2024-01-24 08:53:42'),
(237, 147, 54, 80, 32000, 200, 0, 0, 2544000, NULL, 'Active', '2024-01-24 08:53:46', '2024-01-24 08:53:46'),
(238, 149, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:54:58', '2024-01-24 08:54:58'),
(239, 150, 308, 6, 26500, 0, 0, 0, 159000, NULL, 'Active', '2024-01-24 08:56:09', '2024-01-24 08:56:09'),
(240, 150, 311, 6, 26500, 0, 0, 0, 159000, NULL, 'Active', '2024-01-24 08:56:25', '2024-01-24 08:56:25'),
(241, 151, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 08:56:36', '2024-01-24 08:56:36'),
(242, 150, 312, 6, 26500, 0, 0, 0, 159000, NULL, 'Active', '2024-01-24 08:56:42', '2024-01-24 08:56:42'),
(243, 150, 61, 5, 32000, 200, 0, 0, 159000, NULL, 'Active', '2024-01-24 08:57:09', '2024-01-24 08:57:09'),
(244, 152, 330, 1500, 17500, 0, 0, 0, 26250000, '60 KRG @ 25 KG', 'Active', '2024-01-24 09:00:47', '2024-01-24 09:00:47'),
(245, 152, 65, 40, 32000, 200, 0, 0, 1272000, NULL, 'Active', '2024-01-24 09:01:23', '2024-01-24 09:01:23'),
(246, 153, 3, 1057, 32000, 0, 0, 0, 33824000, NULL, 'Active', '2024-01-24 09:18:08', '2024-01-24 09:18:08'),
(247, 153, 7, 473, 32700, 0, 0, 0, 15467100, NULL, 'Active', '2024-01-24 09:18:47', '2024-01-24 09:18:47'),
(248, 154, 321, 2536, 18500, 0, 0, 0, 46916000, '101 KRG @ 25 KG +  1 KRG 11 KG', 'Active', '2024-01-24 09:21:38', '2024-01-24 09:21:38'),
(249, 155, 68, 63.3, 34000, 0, 0, 0, 2152200, NULL, 'Active', '2024-01-24 09:24:58', '2024-01-24 09:24:58'),
(250, 156, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 09:44:35', '2024-01-24 09:44:35'),
(251, 156, 1, 15, 23000, 0, 0, 0, 345000, NULL, 'Active', '2024-01-24 09:44:46', '2024-01-24 09:44:46'),
(252, 156, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 09:44:53', '2024-01-24 09:44:53'),
(253, 156, 2, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 09:45:00', '2024-01-24 09:45:00'),
(254, 156, 7, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-24 09:45:09', '2024-01-24 09:45:09'),
(255, 157, 1, 2, 54000, 1, 1, 1, 107994, NULL, 'Active', '2024-01-24 10:44:39', '2024-01-24 10:44:39'),
(256, 158, 2, 20, 5000, 0, 0, 0, 100000, NULL, 'Active', '2024-01-24 11:04:59', '2024-01-24 11:04:59'),
(257, 159, 5, 2, 5000, 0, 0, 0, 10000, NULL, 'Active', '2024-01-24 11:18:16', '2024-01-24 11:18:16'),
(258, 159, 2, 2, 4000, 0, 0, 0, 8000, NULL, 'Active', '2024-01-24 11:18:26', '2024-01-24 11:18:26'),
(259, 160, 6, 4, 5000, 0, 0, 0, 20000, NULL, 'Active', '2024-01-24 11:18:58', '2024-01-24 11:18:58'),
(260, 161, 1, 5, 30000, 0, 0, 0, 150000, NULL, 'Active', '2024-01-24 11:23:02', '2024-01-24 11:28:58'),
(262, 161, 1, -5, 30000, 0, 0, 0, -150000, 'retur', 'Active', '2024-01-24 11:27:19', '2024-01-24 11:29:52'),
(263, 162, 314, 6, 18750, 0, 0, 0, 112500, NULL, 'Active', '2024-01-24 11:33:32', '2024-01-24 11:33:32'),
(264, 163, 314, -6, 18750, 0, 0, 0, -112500, NULL, 'Active', '2024-01-24 11:34:51', '2024-01-24 11:34:51'),
(265, 163, 307, 6, 18750, 0, 0, 0, 112500, NULL, 'Active', '2024-01-24 11:35:09', '2024-01-24 11:35:09'),
(266, 164, 314, 12, 18750, 0, 0, 0, 225000, NULL, 'Active', '2024-01-24 11:50:34', '2024-01-24 11:50:34'),
(267, 165, 314, -6, 18750, 0, 0, 0, -112500, NULL, 'Active', '2024-01-24 11:51:37', '2024-01-24 11:51:37'),
(268, 166, 314, 6, 18750, 0, 0, 0, 112500, NULL, 'Active', '2024-01-24 11:53:35', '2024-01-24 11:53:35'),
(269, 166, 314, -2, 18750, 0, 0, 0, -37500, NULL, 'Active', '2024-01-24 11:53:46', '2024-01-24 11:53:46'),
(270, 167, 314, 6, 18750, 0, 0, 0, 112500, NULL, 'Active', '2024-01-24 11:56:22', '2024-01-24 11:56:22'),
(271, 168, 314, -2, 18750, 0, 0, 0, -37500, NULL, 'Active', '2024-01-24 11:58:12', '2024-01-24 11:58:34'),
(272, 169, 329, 500, 18500, 0, 0, 0, 9250000, '20 KRG @ 25 KG', 'Active', '2024-01-24 12:03:29', '2024-01-24 12:03:29'),
(273, 170, 40, 5, 32000, 200, 0, 0, 159000, NULL, 'Active', '2024-01-24 12:06:28', '2024-01-24 12:06:28'),
(274, 170, 49, 10, 32000, 200, 0, 0, 318000, NULL, 'Active', '2024-01-24 12:07:05', '2024-01-24 12:07:05'),
(275, 170, 47, 5, 32000, 200, 0, 0, 159000, NULL, 'Active', '2024-01-24 12:07:22', '2024-01-24 12:07:22'),
(276, 170, 278, 20, 31000, 200, 0, 0, 616000, NULL, 'Active', '2024-01-24 12:07:37', '2024-01-24 12:07:37'),
(277, 170, 271, 5, 31000, 200, 0, 0, 154000, NULL, 'Active', '2024-01-24 12:07:47', '2024-01-24 12:07:47'),
(278, 171, 75, 25, 30000, 200, 0, 0, 745000, NULL, 'Active', '2024-01-24 13:09:27', '2024-01-24 13:09:27'),
(279, 171, 1, 10, 33500, 200, 0, 0, 333000, NULL, 'Active', '2024-01-24 13:09:41', '2024-01-24 13:09:41'),
(280, 172, 53, 5, 32000, 0, 0, 0, 160000, NULL, 'Active', '2024-01-25 10:14:56', '2024-01-25 10:14:56'),
(281, 172, 120, 5, 75000, 500, 0, 0, 372500, NULL, 'Active', '2024-01-25 10:15:14', '2024-01-25 10:15:14'),
(282, 172, 308, 6, 26500, 0, 0, 0, 159000, NULL, 'Active', '2024-01-25 10:15:35', '2024-01-25 10:15:35'),
(283, 172, 160, 30, 32000, 300, 0, 0, 951000, NULL, 'Active', '2024-01-25 10:16:10', '2024-01-25 10:16:10'),
(284, 173, 1, 40, 33500, 200, 0, 0, 1332000, NULL, 'Active', '2024-01-25 10:17:32', '2024-01-25 10:17:32'),
(285, 173, 140, 30, 225000, 1500, 1500, 1500, 6615000, NULL, 'Active', '2024-01-25 10:18:03', '2024-01-25 10:18:03'),
(286, 173, 328, 132, 18500, 0, 0, 0, 2442000, '5 KRG @ 25 KG + 1 KRG 7 KG', 'Active', '2024-01-25 10:18:48', '2024-01-25 10:18:48'),
(287, 173, 144, 10, 32000, 0, 0, 0, 320000, NULL, 'Active', '2024-01-25 10:19:59', '2024-01-25 10:19:59'),
(288, 173, 101, 60, 19000, 500, 0, 0, 1110000, NULL, 'Active', '2024-01-25 10:20:27', '2024-01-25 10:20:27'),
(289, 174, 205, 10, 32000, 200, 0, 0, 318000, NULL, 'Active', '2024-01-25 13:25:46', '2024-01-25 13:25:46'),
(290, 174, 2, 5, 33500, 0, 0, 0, 167500, NULL, 'Active', '2024-01-25 13:26:07', '2024-01-25 13:26:07'),
(291, 175, 144, 550, 32000, 300, 0, 0, 17435000, '18 KRG @ 30 KG + 1 KRG 10 KG', 'Active', '2024-01-25 13:33:00', '2024-01-25 13:33:46'),
(292, 176, 328, 500, 18500, 0, 0, 0, 9250000, '20 KRG @ 25 KG', 'Active', '2024-01-25 13:52:53', '2024-01-25 13:52:53'),
(293, 176, 2, 40, 33500, 200, 0, 0, 1332000, NULL, 'Active', '2024-01-25 13:53:12', '2024-01-25 13:53:12'),
(294, 177, 104, 15, 23700, 0, 0, 0, 355500, NULL, 'Active', '2024-01-25 13:55:19', '2024-01-25 13:55:19'),
(295, 177, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-25 13:55:27', '2024-01-25 13:55:27'),
(296, 177, 163, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-25 13:56:25', '2024-01-25 13:56:25'),
(297, 177, 1, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-25 13:56:34', '2024-01-25 13:56:34'),
(298, 177, 18, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-25 13:56:43', '2024-01-25 13:56:43'),
(299, 178, 22, 30000, 10, 0, 0, 0, 300000, NULL, 'Active', '2024-01-25 14:00:41', '2024-01-25 14:00:41'),
(300, 179, 6, 10, 30000, 200, 0, 0, 298000, NULL, 'Active', '2024-01-25 14:03:38', '2024-01-25 14:03:38'),
(301, 180, 8, 10, 30000, 0, 0, 0, 300000, NULL, 'Active', '2024-01-25 14:05:43', '2024-01-25 14:05:43'),
(302, 180, 2, 10, 30, 0, 0, 0, 300, NULL, 'Active', '2024-01-25 14:06:06', '2024-01-25 14:06:06'),
(303, 180, 178, 10, 30000, 0, 0, 0, 300000, NULL, 'Active', '2024-01-25 14:06:28', '2024-01-25 14:06:28'),
(304, 181, 3, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-26 08:05:37', '2024-01-26 08:05:37'),
(305, 181, 8, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-26 08:06:02', '2024-01-26 08:06:02'),
(306, 181, 44, 10, 23500, 0, 0, 0, 235000, NULL, 'Active', '2024-01-26 08:06:14', '2024-01-26 08:06:14'),
(307, 181, 12, 15, 23500, 0, 0, 0, 352500, NULL, 'Active', '2024-01-26 08:06:31', '2024-01-26 08:06:31'),
(308, 182, 255, 10, 31000, 0, 0, 0, 310000, NULL, 'Active', '2024-01-26 09:52:18', '2024-01-26 09:52:18'),
(309, 182, 238, 32000, 10, 0, 0, 0, 320000, NULL, 'Active', '2024-01-26 09:52:58', '2024-01-26 09:52:58'),
(310, 183, 255, 10, 31000, 0, 0, 0, 310000, NULL, 'Active', '2024-01-26 10:06:49', '2024-01-26 10:06:49'),
(311, 183, 238, 10, 32000, 0, 0, 0, 320000, NULL, 'Active', '2024-01-26 10:07:06', '2024-01-26 10:07:06'),
(312, 184, 1, 15, 23500, 0, 0, 0, 352500, '2 krg @ 25 kg', 'Active', '2024-01-26 12:28:25', '2024-01-26 12:28:25'),
(313, 185, 3, 15, 23500, 0, 0, 0, 352500, '2 krg 5 kg', 'Active', '2024-01-26 12:39:02', '2024-01-26 12:39:02'),
(314, 186, 3, 15, 23500, 0, 0, 0, 352500, '32 krg @ 25 kg', 'Active', '2024-01-26 13:03:31', '2024-01-26 13:03:31'),
(315, 187, 140, 30, 225000, 7500, 0, 0, 6525000, 'SISA 60 BAL', 'Active', '2024-01-27 10:10:33', '2024-01-27 10:10:33'),
(317, 188, 1, 775, 23110, 0, 0, 0, 17910250, NULL, 'Active', '2024-01-27 11:07:10', '2024-01-27 11:07:10'),
(318, 189, 52, 280, 32000, 200, 0, 100, 8876000, NULL, 'Active', '2024-01-27 11:12:01', '2024-01-27 11:12:01'),
(319, 189, 74, 40, 32000, 200, 0, 100, 1268000, NULL, 'Active', '2024-01-27 11:12:13', '2024-01-27 11:12:13'),
(320, 190, 265, 5, 32000, 200, 0, 0, 159000, NULL, 'Active', '2024-01-27 13:16:16', '2024-01-27 13:16:16'),
(321, 190, 3, 50, 33500, 200, 0, 0, 1665000, NULL, 'Active', '2024-01-27 13:16:49', '2024-01-27 13:16:49'),
(322, 191, 62, 20, 32000, 200, 0, 0, 636000, NULL, 'Active', '2024-01-27 14:45:33', '2024-01-27 14:45:33'),
(323, 192, 329, 500, 18500, 0, 0, 0, 9250000, '20 KRG @ 25 KG', 'Active', '2024-01-29 08:20:16', '2024-01-29 08:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_passwords`
--

CREATE TABLE `penjualan_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `password` varchar(20) NOT NULL DEFAULT 'BN5JV9DU',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_jalan_penjualans`
--

CREATE TABLE `surat_jalan_penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_penjualans` int(10) DEFAULT NULL,
  `kode` varchar(30) DEFAULT NULL,
  `nama` varchar(191) DEFAULT NULL,
  `keterangan` varchar(191) DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_plat` varchar(191) NOT NULL DEFAULT '-',
  `nama_konsumen` varchar(191) NOT NULL DEFAULT '-',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trash_penjualans`
--

CREATE TABLE `trash_penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `tipe_penjualan` varchar(10) NOT NULL DEFAULT 'Umum',
  `kode_akun` varchar(10) NOT NULL DEFAULT '1101',
  `kode` varchar(191) NOT NULL,
  `kode_sj` varchar(191) DEFAULT NULL,
  `kode_inv` varchar(191) DEFAULT NULL,
  `kategori` varchar(191) NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `pembayaran` varchar(191) NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `catatan_nama` varchar(191) NOT NULL DEFAULT '-',
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `termin` int(10) NOT NULL DEFAULT 30,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akses_edit` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trash_penjualans`
--

INSERT INTO `trash_penjualans` (`id`, `id_users`, `id_konsumens`, `tipe_penjualan`, `kode_akun`, `kode`, `kode_sj`, `kode_inv`, `kategori`, `tanggal`, `pembayaran`, `jatuh_tempo`, `keterangan`, `catatan_nama`, `biaya_tambahan`, `subtotal`, `diskon`, `pajak`, `grandtotal`, `status`, `sisa`, `termin`, `created_at`, `updated_at`, `akses_edit`) VALUES
(1, 23, 1, 'Manual', '1101', 'SO2401-23-0041', NULL, NULL, 'Umum', '2024-01-12', 'Cash', NULL, NULL, '-', 0, 40000, 0, 0, 40000, 'Selesai', 0, 30, '2024-01-12 12:26:58', '2024-01-12 12:26:58', 'N'),
(2, 47, 1, 'Manual', '1201', 'SO2401-47-0065', NULL, NULL, 'Umum', '2024-01-16', 'Credit', NULL, NULL, '-', 0, 2400000, 0, 264000, 2664000, 'Selesai', 2664000, 30, '2024-01-16 14:06:34', '2024-01-16 14:06:34', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `trash_penjualan_details`
--

CREATE TABLE `trash_penjualan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_barangs` int(10) NOT NULL DEFAULT 0,
  `total_jual` double NOT NULL DEFAULT 0,
  `harga` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `diskon_paket` double NOT NULL DEFAULT 0,
  `diskon_extra` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL,
  `aktif` varchar(191) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trash_penjualan_details`
--

INSERT INTO `trash_penjualan_details` (`id`, `id_penjualans`, `id_barangs`, `total_jual`, `harga`, `diskon`, `diskon_paket`, `diskon_extra`, `subtotal`, `catatan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 40000, 0, 0, 0, 40000, NULL, 'Active', '2024-01-12 12:26:58', '2024-01-12 12:26:58'),
(2, 2, 6, 120, 20000, 0, 0, 0, 2400000, NULL, 'Active', '2024-01-16 14:06:34', '2024-01-16 14:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL DEFAULT current_timestamp(),
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `status`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(0, 'Super Admin', 'Super Admin', 'welly', '$2y$10$gAsv3zQMmUyPF9vAGj3kEu70SDXNKPuy4yihZxdVWyyj0M10WjQOO', NULL, NULL, '2021-12-04 04:10:38'),
(23, 'Owner', 'Owner', 'owner', '$2y$10$c9DHoDlh0UrI2tYZkQDbfePQFKcpuIePVJWYdam3oj7QrGqP7bMf6', NULL, '2023-03-11 16:49:14', '2023-03-11 16:49:14'),
(36, 'Kasir', 'Kasir', 'kasir', '$2y$10$EcAz9qkpHKvLljDT1OUKFu3WyaSyo.A2re5923dbeuzE3fomzUORO', NULL, '2023-11-10 07:00:46', '2023-11-13 12:36:59'),
(37, 'Staff', 'Staff', 'staff', '$2y$10$CZF8oCN5WEHF1VaYeFCngOljY5ooTD2lpwIxqflZcgxUWO.K1.mcC', NULL, '2023-11-10 07:00:57', '2023-11-10 07:00:57'),
(38, 'Supervisor', 'Supervisor', 'supervisor', '$2y$10$CjiEwRcT/EKHKFdn0VDqvO6nF9wKgcI5V9pPVoXLiKYy4e9X2lfji', NULL, '2023-11-10 07:01:10', '2023-11-10 07:01:10'),
(43, 'Merry', 'Staff Pabrik', 'Merry', '$2y$10$WtDXLPHz6YB542d7IkV5FOA0oMLfFHLFbrXtTx.wXKuYDFlqGWjC2', NULL, '2024-01-11 09:40:05', '2024-01-11 09:40:05'),
(44, 'Hendra', 'Staff Pabrik', 'Hendra', '$2y$10$4fs/cQixbCQidLUm8OjdH.A.fffsV/l7UQkikad75YDcw.fK4TJba', NULL, '2024-01-11 09:40:51', '2024-01-11 09:40:51'),
(45, 'Dewi', 'Staff KB', 'Dewi123', '$2y$10$zWnTqc5bjFRiUN3Jo.ec3OjCKJSiA4WGPoSiOO7e2lodE6hPfxbfi', NULL, '2024-01-15 09:23:30', '2024-01-15 09:23:30'),
(46, 'Lili', 'Staff KA', 'Lili', '$2y$10$RewvNEpin4UB71Hy4iAnWuBvDrYbJD7FlvaWPVFTa.svSqJUN/nDW', NULL, '2024-01-15 09:45:14', '2024-01-19 09:39:37'),
(47, 'Hendro', 'Staff KA', 'Hendro', '$2y$10$zxkyxSty02OWkc077AOYSum79FZG0aXDVXv/WGMyml88AhbcjcSYi', NULL, '2024-01-16 13:52:40', '2024-01-16 13:52:40'),
(48, 'San', 'Staff KA', 'San', '$2y$10$Xu08a3r5oPUZpaqoZ1T5n.a80CcouDpE1jsdeOggbI/zRQNiW6fVS', NULL, '2024-01-16 13:54:45', '2024-01-20 11:26:32'),
(49, 'jinshun', 'Staff KA', 'jinshun', '$2y$10$R7HhVTCQiDXZKuyacxQRIOVRjyVv2ygiosHKh/hE95qG6E3b5E39a', NULL, '2024-01-24 08:17:35', '2024-01-24 08:17:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akuns`
--
ALTER TABLE `akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bayar_piutangs`
--
ALTER TABLE `bayar_piutangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bayar_piutang_konsumens`
--
ALTER TABLE `bayar_piutang_konsumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel_bayar_piutangs`
--
ALTER TABLE `cancel_bayar_piutangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_konsumens`
--
ALTER TABLE `dp_konsumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giros`
--
ALTER TABLE `giros`
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
-- Indexes for table `mutasi_gudang_tokos`
--
ALTER TABLE `mutasi_gudang_tokos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_keluar_barangs`
--
ALTER TABLE `mutasi_keluar_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_masuk_barangs`
--
ALTER TABLE `mutasi_masuk_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_toko_gudangs`
--
ALTER TABLE `mutasi_toko_gudangs`
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
-- Indexes for table `pengeluarans`
--
ALTER TABLE `pengeluarans`
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
-- Indexes for table `penjualan_passwords`
--
ALTER TABLE `penjualan_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_jalan_penjualans`
--
ALTER TABLE `surat_jalan_penjualans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trash_penjualans`
--
ALTER TABLE `trash_penjualans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trash_penjualan_details`
--
ALTER TABLE `trash_penjualan_details`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `bayar_piutangs`
--
ALTER TABLE `bayar_piutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `bayar_piutang_konsumens`
--
ALTER TABLE `bayar_piutang_konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cancel_bayar_piutangs`
--
ALTER TABLE `cancel_bayar_piutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dp_konsumens`
--
ALTER TABLE `dp_konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `giros`
--
ALTER TABLE `giros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurnals`
--
ALTER TABLE `jurnals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurnal_detils`
--
ALTER TABLE `jurnal_detils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurnal_detils_temp`
--
ALTER TABLE `jurnal_detils_temp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `konsumens`
--
ALTER TABLE `konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_gudang_tokos`
--
ALTER TABLE `mutasi_gudang_tokos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mutasi_keluar_barangs`
--
ALTER TABLE `mutasi_keluar_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mutasi_masuk_barangs`
--
ALTER TABLE `mutasi_masuk_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mutasi_toko_gudangs`
--
ALTER TABLE `mutasi_toko_gudangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `pengeluarans`
--
ALTER TABLE `pengeluarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `penjualan_details`
--
ALTER TABLE `penjualan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT for table `penjualan_passwords`
--
ALTER TABLE `penjualan_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `surat_jalan_penjualans`
--
ALTER TABLE `surat_jalan_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trash_penjualans`
--
ALTER TABLE `trash_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trash_penjualan_details`
--
ALTER TABLE `trash_penjualan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
