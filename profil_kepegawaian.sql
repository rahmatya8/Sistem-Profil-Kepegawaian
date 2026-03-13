-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2026 at 06:22 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profil_kepegawaian`
--
CREATE DATABASE IF NOT EXISTS `profil_kepegawaian` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `profil_kepegawaian`;

-- --------------------------------------------------------

--
-- Table structure for table `master_agama`
--

CREATE TABLE `master_agama` (
  `id_agama` int UNSIGNED NOT NULL,
  `agama` varchar(100) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_agama`
--

INSERT INTO `master_agama` (`id_agama`, `agama`, `keterangan`) VALUES
(1, 'Islam', NULL),
(2, 'Kristen Protestan', NULL),
(3, 'Kristen Katolik', NULL),
(4, 'Hindu', NULL),
(5, 'Buddha', NULL),
(6, 'Konghucu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_diklat`
--

CREATE TABLE `master_diklat` (
  `id_jenis_diklat` int UNSIGNED NOT NULL,
  `jenis_diklat` varchar(100) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_diklat`
--

INSERT INTO `master_diklat` (`id_jenis_diklat`, `jenis_diklat`, `keterangan`) VALUES
(1, 'Diklat Prajabatan / Latsar CPNS', NULL),
(2, 'Diklat Kepemimpinan', NULL),
(3, 'Diklat Fungsional', NULL),
(4, 'Diklat Teknis', NULL),
(5, 'Workshop/Seminar/Sosialisi', NULL),
(6, 'Bimbingan Teknis (Bimtek)', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_golongan`
--

CREATE TABLE `master_golongan` (
  `id_gol` int UNSIGNED NOT NULL,
  `nama_pangkat` varchar(100) NOT NULL,
  `kode_gol` varchar(10) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_golongan`
--

INSERT INTO `master_golongan` (`id_gol`, `nama_pangkat`, `kode_gol`, `keterangan`) VALUES
(1, 'Juru Muda', 'I/a', NULL),
(2, 'Juru Muda Tingkat I', 'I/b', NULL),
(3, 'Juru', 'I/c', NULL),
(4, 'Juru Tingkat I', 'I/d', NULL),
(5, 'Pengatur Muda', 'II/a', NULL),
(6, 'Pengatur Muda Tingkat I', 'II/b', NULL),
(7, 'Pengatur', 'II/c', NULL),
(8, 'Pengatur Tingkat I', 'II/d', NULL),
(9, 'Penata Muda', 'III/a', NULL),
(10, 'Penata Muda Tingkat I', 'III/b', NULL),
(11, 'Penata', 'III/c', NULL),
(12, 'Penata Tingkat I', 'III/d', NULL),
(13, 'Pembina', 'IV/a', NULL),
(14, 'Pembina Tingkat I', 'IV/b', NULL),
(15, 'Pembina Utama Muda', 'IV/c', NULL),
(16, 'Pembina Utama Madya', 'IV/d', NULL),
(17, 'Pembina Utama', 'IV/e', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_hub_kel`
--

CREATE TABLE `master_hub_kel` (
  `id_hub_kel` int UNSIGNED NOT NULL,
  `hub_kel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_hub_kel`
--

INSERT INTO `master_hub_kel` (`id_hub_kel`, `hub_kel`, `keterangan`) VALUES
(1, 'Suami', ''),
(2, 'Istri', ''),
(3, 'Anak', '');

-- --------------------------------------------------------

--
-- Table structure for table `master_jabatan`
--

CREATE TABLE `master_jabatan` (
  `id_jabatan` int UNSIGNED NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `jenis_jabatan` varchar(100) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_jabatan`
--

INSERT INTO `master_jabatan` (`id_jabatan`, `nama_jabatan`, `jenis_jabatan`, `keterangan`) VALUES
(1, 'Struktural', 'Sekretaris', NULL),
(2, 'Fungsional Tertentu', 'Pranata Komputer', NULL),
(3, 'Fungsional Umum', 'Staf Subbagian KUL', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_jenis_kelamin`
--

CREATE TABLE `master_jenis_kelamin` (
  `id_jenis_kelamin` int UNSIGNED NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_jenis_kelamin`
--

INSERT INTO `master_jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`, `keterangan`) VALUES
(1, 'Perempuan', NULL),
(2, 'Laki-Laki', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_jenjang_pend`
--

CREATE TABLE `master_jenjang_pend` (
  `id_jenjang_pend` int UNSIGNED NOT NULL,
  `jenjang_pend` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_jenjang_pend`
--

INSERT INTO `master_jenjang_pend` (`id_jenjang_pend`, `jenjang_pend`, `keterangan`) VALUES
(1, 'SD/MI', NULL),
(2, 'SMP/MTS', NULL),
(3, 'SMA/SMK/MA', NULL),
(4, 'S1', NULL),
(5, 'D4', NULL),
(6, 'S2', NULL),
(7, 'S3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_predikat_skp`
--

CREATE TABLE `master_predikat_skp` (
  `id_predikat_skp` int UNSIGNED NOT NULL,
  `predikat_skp` varchar(100) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_predikat_skp`
--

INSERT INTO `master_predikat_skp` (`id_predikat_skp`, `predikat_skp`, `keterangan`) VALUES
(1, 'Sangat Baik', NULL),
(2, 'Baik', NULL),
(3, 'Cukup', NULL),
(4, 'Kurang', NULL),
(5, 'Sangat Kurang', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_status_perkawinan`
--

CREATE TABLE `master_status_perkawinan` (
  `id_status_perkawinan` int UNSIGNED NOT NULL,
  `status_perkawinan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_status_perkawinan`
--

INSERT INTO `master_status_perkawinan` (`id_status_perkawinan`, `status_perkawinan`, `keterangan`) VALUES
(1, 'Kawin', NULL),
(2, 'Belum Kawin', NULL),
(3, 'Cerai Mati', NULL),
(4, 'Cerai Hidup', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_unit/divsi`
--

CREATE TABLE `master_unit/divsi` (
  `id_unit_kerja` int UNSIGNED NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_unit/divsi`
--

INSERT INTO `master_unit/divsi` (`id_unit_kerja`, `unit_kerja`, `keterangan`) VALUES
(1, 'Sekretariat', NULL),
(2, 'Divisi Keuangan, Umum dan Logistik', NULL),
(3, 'Divisi Sosdiklih, Parmas dan SDM', NULL),
(4, 'Divisi Perencanaan, Data dan Informasi', NULL),
(5, 'Divisi Teknis Penyelenggaraan', NULL),
(6, 'Divisi Hukum dan Pengawasan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id_reset` int UNSIGNED NOT NULL,
  `id_user` int UNSIGNED NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_at` datetime NOT NULL,
  `used_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_pegawai` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tempat_lahir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tmt_cpns` date NOT NULL,
  `tmt_pns` date NOT NULL,
  `no_telp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_jenis_kelamin` int UNSIGNED NOT NULL,
  `id_agama` int UNSIGNED NOT NULL,
  `id_status_perkawinan` int UNSIGNED NOT NULL,
  `id_gol` int UNSIGNED NOT NULL,
  `id_unit_kerja` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_diklat`
--

CREATE TABLE `riwayat_diklat` (
  `id_riwayat_diklat` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `id_jenis_diklat` int UNSIGNED NOT NULL,
  `nama_diklat` varchar(100) NOT NULL,
  `tahun` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_golongan`
--

CREATE TABLE `riwayat_golongan` (
  `id_riwayat_gol` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `id_gol` int UNSIGNED NOT NULL,
  `tmt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_jabatan`
--

CREATE TABLE `riwayat_jabatan` (
  `id_riwayat_jabatan` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `id_jabatan` int UNSIGNED NOT NULL,
  `id_unit_kerja` int UNSIGNED NOT NULL,
  `status_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_kehormatan`
--

CREATE TABLE `riwayat_kehormatan` (
  `id_riwayat_kehormatan` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `nama_penghargaan` varchar(100) NOT NULL,
  `tahun` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_keluarga`
--

CREATE TABLE `riwayat_keluarga` (
  `id_riwayat_kel` int UNSIGNED NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_telp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nip` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_hub_kel` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pendidikan`
--

CREATE TABLE `riwayat_pendidikan` (
  `id_riwayat_pend` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `id_jenjang_pend` int UNSIGNED NOT NULL,
  `institusi` varchar(100) NOT NULL,
  `tahun_lulus` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_skp`
--

CREATE TABLE `riwayat_skp` (
  `id_riwayat_skp` int UNSIGNED NOT NULL,
  `nip` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_predikat_skp` int UNSIGNED NOT NULL,
  `rerata_nilai` int NOT NULL,
  `tahun` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int UNSIGNED NOT NULL,
  `nip` char(18) NOT NULL,
  `username` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` int NOT NULL,
  `role` enum('admin','pegawai') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pegawai',
  `last_login` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_agama`
--
ALTER TABLE `master_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `master_diklat`
--
ALTER TABLE `master_diklat`
  ADD PRIMARY KEY (`id_jenis_diklat`);

--
-- Indexes for table `master_golongan`
--
ALTER TABLE `master_golongan`
  ADD PRIMARY KEY (`id_gol`);

--
-- Indexes for table `master_hub_kel`
--
ALTER TABLE `master_hub_kel`
  ADD PRIMARY KEY (`id_hub_kel`);

--
-- Indexes for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `master_jenis_kelamin`
--
ALTER TABLE `master_jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `master_jenjang_pend`
--
ALTER TABLE `master_jenjang_pend`
  ADD PRIMARY KEY (`id_jenjang_pend`);

--
-- Indexes for table `master_predikat_skp`
--
ALTER TABLE `master_predikat_skp`
  ADD PRIMARY KEY (`id_predikat_skp`);

--
-- Indexes for table `master_status_perkawinan`
--
ALTER TABLE `master_status_perkawinan`
  ADD PRIMARY KEY (`id_status_perkawinan`);

--
-- Indexes for table `master_unit/divsi`
--
ALTER TABLE `master_unit/divsi`
  ADD PRIMARY KEY (`id_unit_kerja`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id_reset`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD UNIQUE KEY `UNIQUE` (`nip`) USING BTREE,
  ADD KEY `id_jenis_kelamin` (`id_jenis_kelamin`),
  ADD KEY `id_agama` (`id_agama`),
  ADD KEY `id_status_perkawinan` (`id_status_perkawinan`),
  ADD KEY `id_gol` (`id_gol`),
  ADD KEY `id_unit_kerja` (`id_unit_kerja`);

--
-- Indexes for table `riwayat_diklat`
--
ALTER TABLE `riwayat_diklat`
  ADD PRIMARY KEY (`id_riwayat_diklat`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_jenis_diklat` (`id_jenis_diklat`);

--
-- Indexes for table `riwayat_golongan`
--
ALTER TABLE `riwayat_golongan`
  ADD PRIMARY KEY (`id_riwayat_gol`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_gol` (`id_gol`);

--
-- Indexes for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  ADD PRIMARY KEY (`id_riwayat_jabatan`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `id_unit_kerja` (`id_unit_kerja`);

--
-- Indexes for table `riwayat_kehormatan`
--
ALTER TABLE `riwayat_kehormatan`
  ADD PRIMARY KEY (`id_riwayat_kehormatan`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `riwayat_keluarga`
--
ALTER TABLE `riwayat_keluarga`
  ADD PRIMARY KEY (`id_riwayat_kel`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_hub_kel` (`id_hub_kel`);

--
-- Indexes for table `riwayat_pendidikan`
--
ALTER TABLE `riwayat_pendidikan`
  ADD PRIMARY KEY (`id_riwayat_pend`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_jenjang_pend` (`id_jenjang_pend`);

--
-- Indexes for table `riwayat_skp`
--
ALTER TABLE `riwayat_skp`
  ADD PRIMARY KEY (`id_riwayat_skp`),
  ADD KEY `nip` (`nip`),
  ADD KEY `id_predikat_skp` (`id_predikat_skp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `UNIQUE` (`username`) USING BTREE,
  ADD UNIQUE KEY `UNIQUE1` (`email`) USING BTREE,
  ADD KEY `nip` (`nip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_agama`
--
ALTER TABLE `master_agama`
  MODIFY `id_agama` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_diklat`
--
ALTER TABLE `master_diklat`
  MODIFY `id_jenis_diklat` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_golongan`
--
ALTER TABLE `master_golongan`
  MODIFY `id_gol` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `master_hub_kel`
--
ALTER TABLE `master_hub_kel`
  MODIFY `id_hub_kel` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  MODIFY `id_jabatan` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_jenis_kelamin`
--
ALTER TABLE `master_jenis_kelamin`
  MODIFY `id_jenis_kelamin` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_jenjang_pend`
--
ALTER TABLE `master_jenjang_pend`
  MODIFY `id_jenjang_pend` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `master_predikat_skp`
--
ALTER TABLE `master_predikat_skp`
  MODIFY `id_predikat_skp` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_status_perkawinan`
--
ALTER TABLE `master_status_perkawinan`
  MODIFY `id_status_perkawinan` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_unit/divsi`
--
ALTER TABLE `master_unit/divsi`
  MODIFY `id_unit_kerja` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id_reset` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_diklat`
--
ALTER TABLE `riwayat_diklat`
  MODIFY `id_riwayat_diklat` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_golongan`
--
ALTER TABLE `riwayat_golongan`
  MODIFY `id_riwayat_gol` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  MODIFY `id_riwayat_jabatan` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_kehormatan`
--
ALTER TABLE `riwayat_kehormatan`
  MODIFY `id_riwayat_kehormatan` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_keluarga`
--
ALTER TABLE `riwayat_keluarga`
  MODIFY `id_riwayat_kel` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_pendidikan`
--
ALTER TABLE `riwayat_pendidikan`
  MODIFY `id_riwayat_pend` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_skp`
--
ALTER TABLE `riwayat_skp`
  MODIFY `id_riwayat_skp` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD CONSTRAINT `password_reset_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_jenis_kelamin`) REFERENCES `master_jenis_kelamin` (`id_jenis_kelamin`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`id_agama`) REFERENCES `master_agama` (`id_agama`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`id_status_perkawinan`) REFERENCES `master_status_perkawinan` (`id_status_perkawinan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pegawai_ibfk_4` FOREIGN KEY (`id_gol`) REFERENCES `master_golongan` (`id_gol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pegawai_ibfk_5` FOREIGN KEY (`id_unit_kerja`) REFERENCES `master_unit/divsi` (`id_unit_kerja`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_diklat`
--
ALTER TABLE `riwayat_diklat`
  ADD CONSTRAINT `riwayat_diklat_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_diklat_ibfk_2` FOREIGN KEY (`id_jenis_diklat`) REFERENCES `master_diklat` (`id_jenis_diklat`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_golongan`
--
ALTER TABLE `riwayat_golongan`
  ADD CONSTRAINT `riwayat_golongan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_golongan_ibfk_2` FOREIGN KEY (`id_gol`) REFERENCES `master_golongan` (`id_gol`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  ADD CONSTRAINT `riwayat_jabatan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_jabatan_ibfk_2` FOREIGN KEY (`id_jabatan`) REFERENCES `master_jabatan` (`id_jabatan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_jabatan_ibfk_3` FOREIGN KEY (`id_unit_kerja`) REFERENCES `master_unit/divsi` (`id_unit_kerja`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_kehormatan`
--
ALTER TABLE `riwayat_kehormatan`
  ADD CONSTRAINT `riwayat_kehormatan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_keluarga`
--
ALTER TABLE `riwayat_keluarga`
  ADD CONSTRAINT `riwayat_keluarga_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_keluarga_ibfk_2` FOREIGN KEY (`id_hub_kel`) REFERENCES `master_hub_kel` (`id_hub_kel`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_pendidikan`
--
ALTER TABLE `riwayat_pendidikan`
  ADD CONSTRAINT `riwayat_pendidikan_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_pendidikan_ibfk_2` FOREIGN KEY (`id_jenjang_pend`) REFERENCES `master_jenjang_pend` (`id_jenjang_pend`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `riwayat_skp`
--
ALTER TABLE `riwayat_skp`
  ADD CONSTRAINT `riwayat_skp_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riwayat_skp_ibfk_2` FOREIGN KEY (`id_predikat_skp`) REFERENCES `master_predikat_skp` (`id_predikat_skp`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
