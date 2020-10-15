-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Okt 2020 pada 16.07
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `kode_agama` int(11) UNSIGNED NOT NULL,
  `agama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hobi`
--

CREATE TABLE `hobi` (
  `kode_hobi` int(11) UNSIGNED NOT NULL,
  `hobi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hobi_mahasiswa`
--

CREATE TABLE `hobi_mahasiswa` (
  `kode_hobi_mahasiswa` int(11) UNSIGNED NOT NULL,
  `kode_hobi` int(11) UNSIGNED NOT NULL,
  `nim` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(9) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL DEFAULT 'Pria',
  `kode_agama` int(11) UNSIGNED NOT NULL,
  `alamat` text NOT NULL,
  `foto` text NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-10-02-124234', 'App\\Database\\Migrations\\Prodi', 'default', 'App', 1601818079, 1),
(2, '2020-10-02-130000', 'App\\Database\\Migrations\\Agama', 'default', 'App', 1601818079, 1),
(3, '2020-10-02-130803', 'App\\Database\\Migrations\\Mahasiswa', 'default', 'App', 1601818080, 1),
(4, '2020-10-02-133535', 'App\\Database\\Migrations\\Hobi', 'default', 'App', 1601818080, 1),
(5, '2020-10-02-134105', 'App\\Database\\Migrations\\HobiMahasiswa', 'default', 'App', 1601818081, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `kode_prodi` varchar(1) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `ketua_prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`kode_prodi`, `nama_prodi`, `ketua_prodi`) VALUES
('A', 'Komunikasi', 'Djarot Sulaiman'),
('B', 'Ekowisata', 'Rudi Situmorang'),
('C', 'Manajemen Informatika', 'Sofiyanti Indriasari'),
('D', 'Teknik Komputer', 'Shelvie Nidya Neyman'),
('V', 'Desain Komunikasi Visual', 'Galih Wisnu Priambudi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`kode_agama`);

--
-- Indeks untuk tabel `hobi`
--
ALTER TABLE `hobi`
  ADD PRIMARY KEY (`kode_hobi`);

--
-- Indeks untuk tabel `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  ADD PRIMARY KEY (`kode_hobi_mahasiswa`),
  ADD KEY `hobi_mahasiswa_kode_hobi_foreign` (`kode_hobi`),
  ADD KEY `hobi_mahasiswa_nim_foreign` (`nim`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `mahasiswa_kode_agama_foreign` (`kode_agama`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kode_prodi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `kode_agama` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hobi`
--
ALTER TABLE `hobi`
  MODIFY `kode_hobi` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  MODIFY `kode_hobi_mahasiswa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  ADD CONSTRAINT `hobi_mahasiswa_kode_hobi_foreign` FOREIGN KEY (`kode_hobi`) REFERENCES `hobi` (`kode_hobi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hobi_mahasiswa_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_kode_agama_foreign` FOREIGN KEY (`kode_agama`) REFERENCES `agama` (`kode_agama`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
