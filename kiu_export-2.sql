-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2024 at 03:54 PM
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
-- Database: `kiu_export`
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
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `harga` double NOT NULL DEFAULT 0,
  `stok` double NOT NULL DEFAULT 0,
  `gudang` double NOT NULL DEFAULT 0,
  `gudang_2` double NOT NULL DEFAULT 0,
  `gudang_3` double NOT NULL DEFAULT 0,
  `gudang_4` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `id_kategori`, `kode`, `nama`, `satuan`, `harga`, `stok`, `gudang`, `gudang_2`, `gudang_3`, `gudang_4`, `keterangan`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG-0001', 'KANTONG PLASTIK PP 00275/6/9', 'KG', 0, -35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-06 23:04:14'),
(2, 1, 'BRG-0002', 'KANTONG PLASTIK PP 00275/6/10', 'KG', 0, 110, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(3, 1, 'BRG-0003', 'KANTONG PLASTIK PP 00275/7/10', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(4, 1, 'BRG-0004', 'KANTONG PLASTIK PP 00275/7/12', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(5, 1, 'BRG-0005', 'KANTONG PLASTIK PP 00275/8/13', 'KG', 0, 130, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(6, 1, 'BRG-0006', 'KANTONG PLASTIK PP 00275/8/15', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(7, 1, 'BRG-0007', 'KANTONG PLASTIK PP 00275/8/18', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(8, 1, 'BRG-0008', 'KANTONG PLASTIK PP 003/9/15', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(9, 1, 'BRG-0009', 'KANTONG PLASTIK PP 003/9/18', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(10, 1, 'BRG-0010', 'KANTONG PLASTIK PP 003/10/15', 'KG', 0, 120, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(11, 1, 'BRG-0011', 'KANTONG PLASTIK PP 003/10/18', 'KG', 0, 50, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(12, 1, 'BRG-0012', 'KANTONG PLASTIK PP 003/10/20', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(13, 1, 'BRG-0013', 'KANTONG PLASTIK PP 003/11/23', 'KG', 0, 50, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(14, 1, 'BRG-0014', 'KANTONG PLASTIK PP 003/11/23 TK', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(15, 1, 'BRG-0015', 'KANTONG PLASTIK PP 003/12/20', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(16, 1, 'BRG-0016', 'KANTONG PLASTIK PP 003/12/24', 'KG', 0, 98, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2024-01-05 15:32:39'),
(17, 1, 'BRG-0017', 'KANTONG PLASTIK PP 003/12/25', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(18, 1, 'BRG-0018', 'KANTONG PLASTIK PP 003/13/20', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(19, 1, 'BRG-0019', 'KANTONG PLASTIK PP 003/13/25', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(20, 1, 'BRG-0020', 'KANTONG PLASTIK PP 003/14/20', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(21, 1, 'BRG-0021', 'KANTONG PLASTIK PP 003/14/25', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(22, 1, 'BRG-0022', 'KANTONG PLASTIK PP 003/15/20', 'KG', 0, 120, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(33, 1, 'BRG-0033', 'KANTONG PLASTIK PP 003/20/35', 'KG', 0, 80, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(34, 1, 'BRG-0034', 'KANTONG PLASTIK PP 003/20/40', 'KG', 0, 80, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(35, 1, 'BRG-0035', 'KANTONG PLASTIK PP 003/23/36', 'KG', 0, 120, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(36, 1, 'BRG-0036', 'KANTONG PLASTIK PP 003/23/40', 'KG', 0, 85, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(37, 1, 'BRG-0037', 'KANTONG PLASTIK PP 003/23/46', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(38, 1, 'BRG-0038', 'KANTONG PLASTIK PP 003/25/35', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(39, 1, 'BRG-0039', 'KANTONG PLASTIK PP 003/25/40', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(40, 1, 'BRG-0040', 'KANTONG PLASTIK PP 003/25/45', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(41, 1, 'BRG-0041', 'KANTONG PLASTIK PP 003/25/50', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(42, 1, 'BRG-0042', 'KANTONG PLASTIK PP 003/40/60', 'KG', 0, 200, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(43, 1, 'BRG-0043', 'KANTONG PLASTIK PP 003/40/65', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(44, 1, 'BRG-0044', 'KANTONG PLASTIK PP 003/50/80', 'KG', 0, 125, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(45, 1, 'BRG-0045', 'KANTONG PLASTIK PP 003/55/90', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(46, 1, 'BRG-0046', 'KANTONG PLASTIK PP 003/60/100', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(47, 1, 'BRG-0047', 'KANTONG PLASTIK PP 004/30/50', 'KG', 0, 35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(48, 1, 'BRG-0048', 'KANTONG PLASTIK PP 004/35/50', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(49, 1, 'BRG-0049', 'KANTONG PLASTIK PP 004/35/55', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(50, 1, 'BRG-0050', 'KANTONG PLASTIK PP 006/9/15', 'KG', 0, 65, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(51, 1, 'BRG-0051', 'KANTONG PLASTIK PP 006/10/15', 'KG', 0, 115, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(52, 1, 'BRG-0052', 'KANTONG PLASTIK PP 006/10/16', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(53, 1, 'BRG-0053', 'KANTONG PLASTIK PP 006/12/20', 'KG', 0, 55, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(54, 1, 'BRG-0054', 'KANTONG PLASTIK PP 006/12/24', 'KG', 0, 35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(55, 1, 'BRG-0055', 'KANTONG PLASTIK PP 006/15/20', 'KG', 0, 150, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(56, 1, 'BRG-0056', 'KANTONG PLASTIK PP 006/15/25', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(57, 1, 'BRG-0057', 'KANTONG PLASTIK PP 006/15/30', 'KG', 0, 190, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(58, 1, 'BRG-0058', 'KANTONG PLASTIK PP 006/40/60', 'KG', 0, 250, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(59, 1, 'BRG-0059', 'KANTONG PLASTIK PP 006/40/65', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(60, 1, 'BRG-0060', 'KANTONG PLASTIK PP 006/50/80', 'KG', 0, 155, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(61, 1, 'BRG-0061', 'KANTONG PLASTIK PP 007/17/25', 'KG', 0, 130, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(62, 1, 'BRG-0062', 'KANTONG PLASTIK PP 007/17/30', 'KG', 0, 150, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(63, 1, 'BRG-0063', 'KANTONG PLASTIK PP 007/17/35', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(64, 1, 'BRG-0064', 'KANTONG PLASTIK PP 007/17/40', 'KG', 0, 135, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(65, 1, 'BRG-0065', 'KANTONG PLASTIK PP 007/20/30', 'KG', 0, 280, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(66, 1, 'BRG-0066', 'KANTONG PLASTIK PP 007/20/35', 'KG', 0, 45, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(67, 1, 'BRG-0067', 'KANTONG PLASTIK PP 007/20/40', 'KG', 0, 105, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(68, 1, 'BRG-0068', 'KANTONG PLASTIK PP 007/25/40', 'KG', 0, 50, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(69, 1, 'BRG-0069', 'PLASTIK PP ROLL 003/9', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(70, 1, 'BRG-0070', 'PLASTIK PP ROLL 003/10', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(71, 1, 'BRG-0071', 'PLASTIK PP ROLL 00275/6', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(72, 1, 'BRG-0072', 'PLASTIK PP ROLL 00275/7', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(73, 1, 'BRG-0073', 'PLASTIK PP ROLL 00275/8', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(74, 1, 'BRG-0074', 'KANTONG PLASTIK PE 009/30/38', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(75, 1, 'BRG-0075', 'KANTONG PLASTIK PE 003/40/60', 'KG', 0, 10, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(76, 1, 'BRG-0076', 'KANTONG PLASTIK PE 006/40/65', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(77, 1, 'BRG-0077', 'KANTONG PLASTIK PE 006/40/60', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(78, 1, 'BRG-0078', 'KANTONG PLASTIK PE 006/50/80', 'KG', 0, 285, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(79, 1, 'BRG-0079', 'KANTONG PLASTIK PE 003/60/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(80, 1, 'BRG-0080', 'KANTONG PLASTIK PE 80/120 HITAM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(81, 1, 'BRG-0081', 'KANTONG PLASTIK PE 80/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(82, 1, 'BRG-0082', 'KANTONG PLASTIK PE 006/80/130 POLOS', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(83, 1, 'BRG-0083', 'KANTONG PLASTIK PE 005/80/130 HITAM', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(84, 1, 'BRG-0084', 'KANTONG PLASTIK PE 90/120 HITAM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(85, 1, 'BRG-0085', 'KANTONG PLASTIK PE 004/100', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(86, 1, 'BRG-0086', 'KANTONG PLASTIK LLDPE 9/15', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(87, 1, 'BRG-0087', 'KANTONG PLASTIK LLDPE 10/18', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(88, 1, 'BRG-0088', 'KANTONG PLASTIK LLDPE 10/20', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(89, 1, 'BRG-0089', 'KANTONG PLASTIK LLDPE 12/25', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(90, 1, 'BRG-0090', 'KANTONG PLASTIK LLDPE 15/30', 'BKS', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(91, 1, 'BRG-0091', 'KANTONG PLASTIK LLDPE 15/35', 'BKS', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(92, 1, 'BRG-0092', 'KANTONG PLASTIK LLDPE 17/40', 'BKS', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(93, 1, 'BRG-0093', 'KANTONG PLASTIK LLDPE 30/50', 'BKS', 0, 5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(94, 1, 'BRG-0094', 'KANTONG PLASTIK LLDPE 40/65', 'BKS', 0, 425, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(95, 1, 'BRG-0095', 'KANTONG PLASTIK LLDPE 50/80', 'BKS', 0, 140, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(96, 1, 'BRG-0096', 'KANTONG PLASTIK LLDPE 007/80/130', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(97, 1, 'BRG-0097', 'KANTONG PLASTIK LLDPE 008/40/80', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(98, 1, 'BRG-0098', 'KANTONG PLASTIK LLDPE 014/38/90', 'KG', 0, 100, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(99, 1, 'BRG-0099', 'KANTONG PLASTIK LLDPE 80/130', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(100, 1, 'BRG-0100', 'KANTONG SAMPAH HITAM MINI', 'BKS', 0, 126, 120, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(101, 1, 'BRG-0101', 'KANTONG SAMPAH HITAM SMALL', 'BKS', 0, 444, 360, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(102, 1, 'BRG-0102', 'KANTONG SAMPAH HITAM MEDIUM', 'BKS', 0, 426, 240, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(103, 1, 'BRG-0103', 'KANTONG SAMPAH HITAM LARGE', 'BKS', 0, 72, 60, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(104, 1, 'BRG-0104', 'KANTONG SAMPAH HITAM EXTRA LARGE', 'BKS', 0, 216, 180, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(118, 1, 'BRG-0118', 'SEDOTAN MINI KIUPLAS', 'BAL', 0, 176, 126, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(119, 1, 'BRG-0119', 'SEDOTAN KIUPLAS GARIS MERAH', 'BAL', 0, 60, 51, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(120, 1, 'BRG-0120', 'SEDOTAN MINI ARWANA', 'BAL', 0, 110, 92, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(121, 1, 'BRG-0121', 'SEDOTAN BESAR ARWANA TBK', 'BAL', 0, 110, 39, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(122, 1, 'BRG-0122', 'SEDOTAN MINI SINGA', 'BAL', 0, 52, 51, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(123, 1, 'BRG-0123', 'SEDOTAN KECIL SINGA', 'BAL', 0, 107, 71, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(124, 1, 'BRG-0124', 'SEDOTAN BESAR SINGA', 'BAL', 0, 32, 29, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(125, 1, 'BRG-0125', 'SEDOTAN BESAR SINGA TBK', 'BAL', 0, 39, 29, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(126, 1, 'BRG-0126', 'SEDOTAN SEDANG SINGA', 'BAL', 0, 75, 24, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(127, 1, 'BRG-0127', 'SEDOTAN MINI DINO', 'BAL', 0, 173, 173, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(128, 1, 'BRG-0128', 'SEDOTAN MINI BENGKOK PUTIH', 'BAL', 0, 2, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(129, 1, 'BRG-0129', 'SEDOTAN MINI BENGKOK HITAM', 'BAL', 0, 25, 24, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(130, 1, 'BRG-0130', 'SEDOTAN BESAR BENGKOK PUTIH', 'BAL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(131, 1, 'BRG-0131', 'SEDOTAN BESAR BENGKOK HITAM', 'BAL', 0, 5, 1, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(132, 1, 'BRG-0132', 'SEDOTAN MINI DIAMOND', 'BAL', 0, 72, 68, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(133, 1, 'BRG-0133', 'SEDOTAN MINI JUMBO 8MM', 'BAL', 0, 4, 4, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(134, 1, 'BRG-0134', 'SEDOTAN MINI JUMBO 12MM', 'BAL', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(135, 1, 'BRG-0135', 'SEDOTAN BESAR DIAMOND', 'BAL', 0, 100, 74, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(136, 1, 'BRG-0136', 'SEDOTAN BESAR DIAMOND TBK', 'BAL', 0, 52, 38, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(137, 1, 'BRG-0137', 'SEDOTAN BESAR DIAMOND TBK PUTIH', 'BAL', 0, 66, 47, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(138, 1, 'BRG-0138', 'SEDOTAN BESAR JUMBO 8MM', 'BAL', 0, 1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(139, 1, 'BRG-0139', 'SEDOTAN BESAR JUMBO 12MM', 'BAL', 0, 1, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(140, 1, 'BRG-0140', 'SEDOTAN SEDANG DIAMOND', 'BAL', 0, 17, 17, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(141, 1, 'BRG-0141', 'SEDOTAN BESAR JUMBO STERIL', 'BAL', 0, 93, 92, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(142, 1, 'BRG-0142', 'SEDOTAN BESAR BENGKOK STERIL', 'BAL', 0, 3, 1, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(143, 1, 'BRG-0143', 'KANTONG PLASTIK PE TU 10/30 BIRU MUDA', 'KG', 0, 12, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(144, 1, 'BRG-0144', 'KANTONG PLASTIK PE TU 15/33 BIRU MUDA', 'KG', 0, 15.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(145, 1, 'BRG-0145', 'KANTONG PLASTIK PE TO 17/26 BIRU MUDA', 'KG', 0, 13, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(146, 1, 'BRG-0146', 'KANTONG PLASTIK PE TU 20/36 BIRU MUDA', 'KG', 0, 11, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(147, 1, 'BRG-0147', 'KANTONG PLASTIK PE TU 22/40 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(148, 1, 'BRG-0148', 'KANTONG PLASTIK PE TO 23/32 BIRU MUDA', 'KG', 0, 14, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(149, 1, 'BRG-0149', 'KANTONG PLASTIK PE TU 25/43 BIRU MUDA', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(150, 1, 'BRG-0150', 'KANTONG PLASTIK PE TO 27/37 BIRU MUDA', 'KG', 0, 51, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(151, 1, 'BRG-0151', 'KANTONG PLASTIK PE TU 27/50 BIRU MUDA', 'KG', 0, 30, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(152, 1, 'BRG-0152', 'KANTONG PLASTIK PE TO 30/40 BIRU MUDA', 'KG', 0, 58, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(153, 1, 'BRG-0153', 'KANTONG PLASTIK PE TU 30/60 BIRU MUDA', 'KG', 0, 20, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(154, 1, 'BRG-0154', 'KANTONG PLASTIK PE TU 30/65 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(155, 1, 'BRG-0155', 'KANTONG PLASTIK PE TO 33/50 BIRU MUDA', 'KG', 0, 60, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(156, 1, 'BRG-0156', 'KANTONG PLASTIK PE TU 37/65 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(157, 1, 'BRG-0157', 'KANTONG PLASTIK PE TU 45/75 BIRU MUDA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(158, 1, 'BRG-0158', 'KANTONG PLASTIK PE TU 10/30 HIJAU MUDA', 'KG', 0, 12.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(159, 1, 'BRG-0159', 'KANTONG PLASTIK PE TU 15/33 HIJAU MUDA', 'KG', 0, 41, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(160, 1, 'BRG-0160', 'KANTONG PLASTIK PE TO 17/26 HIJAU MUDA', 'KG', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(161, 1, 'BRG-0161', 'KANTONG PLASTIK PE TU 20/36 HIJAU MUDA', 'KG', 0, 15, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(162, 1, 'BRG-0162', 'KANTONG PLASTIK PE TU 22/40 HIJAU MUDA', 'KG', 0, 34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(163, 1, 'BRG-0163', 'KANTONG PLASTIK PE TO 23/32 HIJAU MUDA', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(164, 1, 'BRG-0164', 'KANTONG PLASTIK PE TU 25/43 HIJAU MUDA', 'KG', 0, 32, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(165, 1, 'BRG-0165', 'KANTONG PLASTIK PE TO 27/37 HIJAU MUDA', 'KG', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(166, 1, 'BRG-0166', 'KANTONG PLASTIK PE TU 27/50 HIJAU MUDA', 'KG', 0, 48, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(167, 1, 'BRG-0167', 'KANTONG PLASTIK PE TO 30/40 HIJAU MUDA', 'KG', 0, 78, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(168, 1, 'BRG-0168', 'KANTONG PLASTIK PE TU 30/60 HIJAU MUDA', 'KG', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(169, 1, 'BRG-0169', 'KANTONG PLASTIK PE TU 30/65 HIJAU MUDA', 'KG', 0, 66, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(170, 1, 'BRG-0170', 'KANTONG PLASTIK PE TO 33/50 HIJAU MUDA', 'KG', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(171, 1, 'BRG-0171', 'KANTONG PLASTIK PE TU 37/65 HIJAU MUDA', 'KG', 0, 36, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(172, 1, 'BRG-0172', 'KANTONG PLASTIK PE TU 45/75 HIJAU MUDA', 'KG', 0, 10, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(173, 1, 'BRG-0173', 'KANTONG PLASTIK PE TU 10/30 DADU', 'KG', 0, 27, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(174, 1, 'BRG-0174', 'KANTONG PLASTIK PE TU 15/33 DADU', 'KG', 0, 1.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(175, 1, 'BRG-0175', 'KANTONG PLASTIK PE TO 17/26 DADU', 'KG', 0, 13, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(176, 1, 'BRG-0176', 'KANTONG PLASTIK PE TU 20/36 DADU', 'KG', 0, 19, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(177, 1, 'BRG-0177', 'KANTONG PLASTIK PE TU 22/40 DADU', 'KG', 0, 92, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(178, 1, 'BRG-0178', 'KANTONG PLASTIK PE TO 23/32 DADU', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(179, 1, 'BRG-0179', 'KANTONG PLASTIK PE TU 25/43 DADU', 'KG', 0, 103, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(180, 1, 'BRG-0180', 'KANTONG PLASTIK PE TO 27/37 DADU', 'KG', 0, 47, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(181, 1, 'BRG-0181', 'KANTONG PLASTIK PE TU 27/50 DADU', 'KG', 0, 97, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(182, 1, 'BRG-0182', 'KANTONG PLASTIK PE TO 30/40 DADU', 'KG', 0, 6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(183, 1, 'BRG-0183', 'KANTONG PLASTIK PE TU 30/60 DADU', 'KG', 0, 6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(184, 1, 'BRG-0184', 'KANTONG PLASTIK PE TU 30/65 DADU', 'KG', 0, 32, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(185, 1, 'BRG-0185', 'KANTONG PLASTIK PE TO 33/50 DADU', 'KG', 0, 40, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(186, 1, 'BRG-0186', 'KANTONG PLASTIK PE TU 37/65 DADU', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(187, 1, 'BRG-0187', 'KANTONG PLASTIK PE TU 45/75 DADU', 'KG', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(205, 1, 'BRG-0205', 'KANTONG PLASTIK PE TO 17/26 KUNING', 'KG', 0, 8, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(206, 1, 'BRG-0206', 'KANTONG PLASTIK PE TU 20/36 KUNING', 'KG', 0, 43, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(207, 1, 'BRG-0207', 'KANTONG PLASTIK PE TU 22/40 KUNING', 'KG', 0, 25, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(208, 1, 'BRG-0208', 'KANTONG PLASTIK PE TO 23/32 KUNING', 'KG', 0, 21, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(209, 1, 'BRG-0209', 'KANTONG PLASTIK PE TU 25/43 KUNING', 'KG', 0, 87, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(210, 1, 'BRG-0210', 'KANTONG PLASTIK PE TO 27/37 KUNING', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(211, 1, 'BRG-0211', 'KANTONG PLASTIK PE TU 27/50 KUNING', 'KG', 0, 87, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(222, 1, 'BRG-0222', 'KANTONG PLASTIK PE TU 22/40 ORANGE', 'KG', 0, 17, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(237, 1, 'BRG-0237', 'KANTONG PLASTIK PE TU 22/40 UNGU', 'KG', 0, 21, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(238, 1, 'BRG-0238', 'KANTONG PLASTIK PE TO 23/32 UNGU', 'KG', 0, 35, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(255, 1, 'BRG-0255', 'KANTONG PLASTIK PE TO 27/37 MERAH', 'KG', 0, 48, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(256, 1, 'BRG-0256', 'KANTONG PLASTIK PE TU 27/50 MERAH', 'KG', 0, 89, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(257, 1, 'BRG-0257', 'KANTONG PLASTIK PE TO 30/40 MERAH', 'KG', 0, 46, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(258, 1, 'BRG-0258', 'KANTONG PLASTIK PE TU 30/50 MERAH', 'KG', 0, 6, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(259, 1, 'BRG-0259', 'KANTONG PLASTIK PE TU 30/60 MERAH', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(260, 1, 'BRG-0260', 'KANTONG PLASTIK PE TU 30/65 MERAH', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(261, 1, 'BRG-0261', 'KANTONG PLASTIK PE TO 33/50 MERAH', 'KG', 0, 34, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(262, 1, 'BRG-0262', 'KANTONG PLASTIK PE TU 37/65 MERAH', 'KG', 0, 56, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(263, 1, 'BRG-0263', 'KANTONG PLASTIK PE TU 45/75 MERAH', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(264, 1, 'BRG-0264', 'KANTONG PLASTIK PE TU 10/30 PUTIH', 'KG', 0, 18, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(265, 1, 'BRG-0265', 'KANTONG PLASTIK PE TU 15/33 PUTIH', 'KG', 0, 8.5, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(266, 1, 'BRG-0266', 'KANTONG PLASTIK PE TO 17/26 PUTIH', 'KG', 0, 37, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(267, 1, 'BRG-0267', 'KANTONG PLASTIK PE TU 20/36 PUTIH', 'KG', 0, 28, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(268, 1, 'BRG-0268', 'KANTONG PLASTIK PE TU 22/40 PUTIH', 'KG', 0, 92, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(269, 1, 'BRG-0269', 'KANTONG PLASTIK PE TO 23/32 PUTIH', 'KG', 0, 75, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(270, 1, 'BRG-0270', 'KANTONG PLASTIK PE TU 25/43 PUTIH', 'KG', 0, 115, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(271, 1, 'BRG-0271', 'KANTONG PLASTIK PE TO 27/37 PUTIH', 'KG', 0, 70, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(272, 1, 'BRG-0272', 'KANTONG PLASTIK PE TU 27/50 PUTIH', 'KG', 0, 97, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(273, 1, 'BRG-0273', 'KANTONG PLASTIK PE TO 30/40 PUTIH', 'KG', 0, 90, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(274, 1, 'BRG-0274', 'KANTONG PLASTIK PE TU 30/60 PUTIH', 'KG', 0, 68, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(275, 1, 'BRG-0275', 'KANTONG PLASTIK PE TU 30/65 PUTIH', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(276, 1, 'BRG-0276', 'KANTONG PLASTIK PE TO 33/50 PUTIH', 'KG', 0, 62, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(277, 1, 'BRG-0277', 'KANTONG PLASTIK PE TU 37/65 PUTIH', 'KG', 0, 28, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(278, 1, 'BRG-0278', 'KANTONG PLASTIK PE TU 45/75 PUTIH', 'KG', 0, 44, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(307, 1, 'BRG-0307', 'POLYBAG BABY', 'BKS', 0, 18, 432, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(308, 1, 'BRG-0308', 'POLYBAG MINI', 'BKS', 0, 90, 252, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(309, 1, 'BRG-0309', 'POLYBAG EXTRA SMALL', 'BKS', 0, 90, 1008, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(310, 1, 'BRG-0310', 'POLYBAG SMALL', 'BKS', 0, 60, 360, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(311, 1, 'BRG-0311', 'POLYBAG MEDIUM', 'BKS', 0, 102, 144, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(312, 1, 'BRG-0312', 'POLYBAG LARGE', 'BKS', 0, 84, 540, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(313, 1, 'BRG-0313', 'POLYBAG EXTRA LARGE', 'BKS', 0, 42, 216, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(314, 1, 'BRG-0314', 'POLYBAG JUMBO', 'BKS', 0, 12, 108, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(315, 1, 'BRG-0315', 'LARGE POLYBAG SUPER MURNI 0,15 MM X 20/40 CM X 50 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(316, 1, 'BRG-0316', 'LARGE POLYBAG 0,15 MM X 20/40 CM X 50 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(317, 1, 'BRG-0317', 'LARGE POLYBAG 0,15 MM X 40 CM X 50 CM LAY FLAT', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(318, 1, 'BRG-0318', 'BABY POLYBAG 0,10 MM X 7,5/15 CM X 23 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(319, 1, 'BRG-0319', 'BABY POLYBAG 0,07 MM X 7,5/15 CM X 23 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(320, 1, 'BRG-0320', 'BABY POLYBAG 0,10 MM X 7/14 CM X 22 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(321, 1, 'BRG-0321', 'BABY POLYBAG 0,08 MM X 7,5/15 CM X 20 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(322, 1, 'BRG-0322', 'BABY POLYBAG 0,075 MM X 15 CM X 23 CM LAY FLAT', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(323, 1, 'BRG-0323', 'JUMBO POLYBAG SUPER MURNI 0,15 MM X 25/50 CM X 60 CM', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(324, 1, 'BRG-0324', 'kantong AAA', 'KG', 0, 0, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(325, 1, 'BRG-0325', 'BUBBLE WRAP HITAM GRADE B', 'ROLL', 0, 31, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(326, 1, 'BRG-0326', 'BUBBLE WRAP HITAM GRADE C', 'ROLL', 0, 4, 0, 0, 0, 0, NULL, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_piutangs`
--

CREATE TABLE `bayar_piutangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `id_users` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paid',
  `pelunasan_konsumen` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bayar_piutang_konsumens`
--

CREATE TABLE `bayar_piutang_konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `kodepelunasan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_users` int(10) NOT NULL DEFAULT 0,
  `id_konsumens` int(10) NOT NULL DEFAULT 0,
  `nominal` double DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `jenis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Giro',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT '',
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
  `kode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tipe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manual',
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
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
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
(1, 'UM', 'UMUM', '-', 'Active', '2023-02-05 10:51:34', '2023-02-05 10:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `konsumens`
--

CREATE TABLE `konsumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_konsumen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_npwp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rekening` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termin` int(10) NOT NULL DEFAULT 30,
  `limit_piutang` double DEFAULT 0,
  `piutang` double NOT NULL DEFAULT 0,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsumens`
--

INSERT INTO `konsumens` (`id`, `kode`, `nama`, `tipe_konsumen`, `alamat`, `contact_person`, `no_hp`, `npwp`, `alamat_npwp`, `nama_group`, `no_rekening`, `keterangan`, `termin`, `limit_piutang`, `piutang`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'CUST-0001', 'A AN SM', 'Umum', '-', '-', '0', '-', '-', '', '', '', 30, 10000000, -800000, 'Active', '2023-12-29 02:12:08', '2024-01-06 23:11:52'),
(2, 'CUST-0002', 'A BIE RB', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(3, 'CUST-0003', 'A BIE RT', 'Umum', '-', '-', '0', '-', '-', '', '', '-', 30, 100000000, 1200000, 'Active', '2023-12-28 15:45:58', '2024-01-07 06:49:19'),
(4, 'CUST-0004', 'A BUN ', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(5, 'CUST-0005', 'A CHAI / KWETIAW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(6, 'CUST-0006', 'A CHAN LEMBAH MURAI', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(7, 'CUST-0007', 'A CONG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(8, 'CUST-0008', 'A FU', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(9, 'CUST-0009', 'A HENG', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(413, 'CUST-0413', 'MIE MIE / AMUK SKW', 'Umum', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(697, 'CUST-0697', 'PT. TH INDO PLANTATION ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'KPN GROUP (NINIK)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(710, 'CUST-0710', 'PT. ADIJAYA MULIA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'DRM GROUP (PAK DODY)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(728, 'CUST-0728', 'PT. GLOBAL KALIMANTAN MAKMUR ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(729, 'CUST-0729', 'PT. KIARA SAWIT ABADI ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(730, 'CUST-0730', 'PT. PENITI SUNGAI PURUN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HARTONO PLANTATION INDONESIA (TRIONO)', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(731, 'CUST-0731', 'GARUDA MITRA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(732, 'CUST-0732', 'PT. ADILMART', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(733, 'CUST-0733', 'PT. HARUM MANIS PERMAI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(734, 'CUST-0734', 'PT. KAISAR BAKERI PERDANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(735, 'CUST-0735', 'PT. KAISAR PERDANA MAKMUR', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(736, 'CUST-0736', 'PT. LIGO MITRA JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(737, 'CUST-0737', 'PT. MITRA RITELINDO LESTARI', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(738, 'CUST-0738', 'PT. SIANTAN MAHKOTA JAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'SUPERMARKET', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(739, 'CUST-0739', 'PT. FAJAR AGRO KALIMANTAN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'FKK GROUP', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(778, 'CUST-0778', 'CV. DOLPHIN ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'LAIN-LAIN', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(806, 'CUST-0806', 'PT. JOSH & TASANI LESTARI / MERCURE', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, 'HOTEL', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(866, 'CUST-0866', 'PT. KAPUAS ARMADA SARANA ', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(892, 'CUST-0892', 'PT. HOK TONG', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(893, 'CUST-0893', 'PT. INDOJAVA RUBBER PLANTING CO.', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(894, 'CUST-0894', 'PT. KINTAP JAYA WATTINDO', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(895, 'CUST-0895', 'PT. KIRANA PRIMA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(896, 'CUST-0896', 'PT. KOTA NIAGA RAYA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(897, 'CUST-0897', 'PT. MULTI KARET SEJAHTERA', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(898, 'CUST-0898', 'PT. NEW KALBAR PROCESSORS', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(899, 'CUST-0899', 'PT. STAR RUBBER', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
(900, 'CUST-0900', 'PT. SUMBER ALAM', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58'),
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
(1004, 'CUST-1004', 'YOGA SYAMSUDIN', 'Perusahaan', NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, 30, 0, 0, 'Active', '2023-12-28 15:45:58', '2023-12-28 15:45:58');

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
-- Table structure for table `mutasi_gudang_tokos`
--

CREATE TABLE `mutasi_gudang_tokos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_keluar_barangs`
--

CREATE TABLE `mutasi_keluar_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_masuk_barangs`
--

CREATE TABLE `mutasi_masuk_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_toko_gudangs`
--

CREATE TABLE `mutasi_toko_gudangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) DEFAULT 0,
  `id_barangs` int(10) NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `pengeluarans`
--

CREATE TABLE `pengeluarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` int(10) NOT NULL,
  `id_kategori_pengeluarans` int(10) NOT NULL,
  `akun_kas` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `akun_beban` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6101',
  `divisi` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT '',
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
  `tipe_penjualan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_sj` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_inv` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `tanggal_sj` date DEFAULT NULL,
  `tanggal_inv` date DEFAULT NULL,
  `pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `dp` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `termin` int(10) NOT NULL DEFAULT 30,
  `ekspedisi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_sj` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_inv` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akses_edit` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_passwords`
--

CREATE TABLE `penjualan_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_penjualans` int(10) NOT NULL DEFAULT 0,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BN5JV9DU',
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
  `kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_plat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `nama_konsumen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
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
  `tipe_penjualan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `kode_akun` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1101',
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_sj` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_inv` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Umum',
  `tanggal` date NOT NULL,
  `pembayaran` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `jatuh_tempo` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `biaya_tambahan` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `grandtotal` double NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Selesai',
  `sisa` double DEFAULT 0,
  `termin` int(10) NOT NULL DEFAULT 30,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akses_edit` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(23, 'Owner', 'Owner', 'owner', '$2y$10$c9DHoDlh0UrI2tYZkQDbfePQFKcpuIePVJWYdam3oj7QrGqP7bMf6', NULL, '2023-03-11 16:49:14', '2023-03-11 16:49:14'),
(36, 'Kasir', 'Kasir', 'kasir', '$2y$10$EcAz9qkpHKvLljDT1OUKFu3WyaSyo.A2re5923dbeuzE3fomzUORO', NULL, '2023-11-10 07:00:46', '2023-11-13 12:36:59'),
(37, 'Staff', 'Staff', 'staff', '$2y$10$CZF8oCN5WEHF1VaYeFCngOljY5ooTD2lpwIxqflZcgxUWO.K1.mcC', NULL, '2023-11-10 07:00:57', '2023-11-10 07:00:57'),
(38, 'Supervisor', 'Supervisor', 'supervisor', '$2y$10$CjiEwRcT/EKHKFdn0VDqvO6nF9wKgcI5V9pPVoXLiKYy4e9X2lfji', NULL, '2023-11-10 07:01:10', '2023-11-10 07:01:10');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `bayar_piutangs`
--
ALTER TABLE `bayar_piutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bayar_piutang_konsumens`
--
ALTER TABLE `bayar_piutang_konsumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancel_bayar_piutangs`
--
ALTER TABLE `cancel_bayar_piutangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_gudang_tokos`
--
ALTER TABLE `mutasi_gudang_tokos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_keluar_barangs`
--
ALTER TABLE `mutasi_keluar_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_masuk_barangs`
--
ALTER TABLE `mutasi_masuk_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_toko_gudangs`
--
ALTER TABLE `mutasi_toko_gudangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_details`
--
ALTER TABLE `penjualan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_passwords`
--
ALTER TABLE `penjualan_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `surat_jalan_penjualans`
--
ALTER TABLE `surat_jalan_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trash_penjualans`
--
ALTER TABLE `trash_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trash_penjualan_details`
--
ALTER TABLE `trash_penjualan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
