-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 02 Jun 2021 pada 22.53
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventarisbmn_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_barang`
--

CREATE TABLE `aplikasi_admin_barang` (
  `id` bigint(20) NOT NULL,
  `kode_barang` varchar(200) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `merk` varchar(200) NOT NULL,
  `stock` int(11) NOT NULL,
  `bast_perolehan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_barang`
--

INSERT INTO `aplikasi_admin_barang` (`id`, `kode_barang`, `nama_barang`, `merk`, `stock`, `bast_perolehan`) VALUES
(3, 'ATK678', 'Papan Tulis', 'Snowman', 98, 'aplikasi_admin/bast_perolehan/unnamed.png'),
(4, 'ATK900', 'Kursi', 'Chair', 497, 'aplikasi_admin/bast_perolehan/main.pngcompresstrue.png'),
(5, 'ATK666', 'Meja', 'Table', 246, 'aplikasi_admin/bast_perolehan/file_1944135.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_gedung`
--

CREATE TABLE `aplikasi_admin_gedung` (
  `id` bigint(20) NOT NULL,
  `gedung` varchar(200) NOT NULL,
  `mg_gedung` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_gedung`
--

INSERT INTO `aplikasi_admin_gedung` (`id`, `gedung`, `mg_gedung`) VALUES
(4, 'GEDUNG A', 'Ahmad'),
(5, 'GEDUNG B', 'Budi'),
(6, 'GEDUNG C', 'Candi'),
(7, 'GEDUNG D', 'Defan'),
(8, 'GEDUNG E', 'Eufoni'),
(9, 'GEDUNG F', 'Fathur'),
(10, 'GKU', 'Hakim'),
(11, 'LABTEK', 'Ihsan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_pegawai`
--

CREATE TABLE `aplikasi_admin_pegawai` (
  `id` bigint(20) NOT NULL,
  `nip_nrk` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telp` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_pegawai`
--

INSERT INTO `aplikasi_admin_pegawai` (`id`, `nip_nrk`, `alamat`, `telp`, `role`, `user_id`, `nama_pegawai`) VALUES
(1, '653722344', '', '', 'PEGAWAI', 4, 'Normal Person'),
(2, '34253546524', '', '', 'PEGAWAI', 5, 'aan ganteng'),
(3, '2423545141', '', '', 'PEGAWAI', 7, 'aan cakep');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_peminjaman`
--

CREATE TABLE `aplikasi_admin_peminjaman` (
  `id` bigint(20) NOT NULL,
  `no_peminjaman` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `bast_disposisi` varchar(200) NOT NULL,
  `pegawai_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_peminjaman`
--

INSERT INTO `aplikasi_admin_peminjaman` (`id`, `no_peminjaman`, `tgl_pinjam`, `tgl_kembali`, `bast_disposisi`, `pegawai_id`) VALUES
(1, '02062021684', '2021-06-03', '2021-06-18', '/upload/Laporan%20(7).pdf', 1),
(2, '02062021361', '2021-06-04', '2021-06-03', '/upload/Laporan%20(5).pdf', 1),
(3, '02062021843', '2021-06-18', '2021-06-16', '/upload/ruangan.svg', 1),
(4, '02062021717', '2021-06-01', '2021-06-23', '/upload/178-1783922_interesting-emoji-sad-happy-sadboihours-freetoedit-inside-sad.png', 2),
(5, '02062021511', '2021-06-01', '2021-06-30', '/upload/unnamed.png', 2),
(6, '02062021340', '2021-06-01', '2021-06-29', '/upload/file_1944165_128x128.png_128x128.png', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_peminjamandetail`
--

CREATE TABLE `aplikasi_admin_peminjamandetail` (
  `id` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `barang_id` bigint(20) DEFAULT NULL,
  `gedung_id` bigint(20) DEFAULT NULL,
  `peminjaman_id` bigint(20) DEFAULT NULL,
  `ruang_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_peminjamandetail`
--

INSERT INTO `aplikasi_admin_peminjamandetail` (`id`, `jumlah`, `barang_id`, `gedung_id`, `peminjaman_id`, `ruang_id`) VALUES
(4, 2, 3, 5, 4, 7),
(5, 3, 4, 6, 5, 8),
(6, 4, 5, 10, 6, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_admin_ruang`
--

CREATE TABLE `aplikasi_admin_ruang` (
  `id` bigint(20) NOT NULL,
  `ruang` varchar(200) NOT NULL,
  `pj_ruang` varchar(200) NOT NULL,
  `gedung_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aplikasi_admin_ruang`
--

INSERT INTO `aplikasi_admin_ruang` (`id`, `ruang`, `pj_ruang`, `gedung_id`) VALUES
(6, 'A01', 'Andri', 4),
(7, 'B03', 'Benny', 5),
(8, 'C11', 'Caca', 6),
(9, 'D05', 'David', 7),
(10, 'E03', 'Elsa', 8),
(11, 'F21', 'Fikri', 9),
(12, 'GK02', 'Hanin', 10),
(13, 'Lab Fisika', 'Indah', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'PEGAWAI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_permission`
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
(25, 'Can add gedung', 7, 'add_gedung'),
(26, 'Can change gedung', 7, 'change_gedung'),
(27, 'Can delete gedung', 7, 'delete_gedung'),
(28, 'Can view gedung', 7, 'view_gedung'),
(29, 'Can add ruang', 8, 'add_ruang'),
(30, 'Can change ruang', 8, 'change_ruang'),
(31, 'Can delete ruang', 8, 'delete_ruang'),
(32, 'Can view ruang', 8, 'view_ruang'),
(33, 'Can add barang', 9, 'add_barang'),
(34, 'Can change barang', 9, 'change_barang'),
(35, 'Can delete barang', 9, 'delete_barang'),
(36, 'Can view barang', 9, 'view_barang'),
(37, 'Can add pegawai', 10, 'add_pegawai'),
(38, 'Can change pegawai', 10, 'change_pegawai'),
(39, 'Can delete pegawai', 10, 'delete_pegawai'),
(40, 'Can view pegawai', 10, 'view_pegawai'),
(41, 'Can add peminjaman', 11, 'add_peminjaman'),
(42, 'Can change peminjaman', 11, 'change_peminjaman'),
(43, 'Can delete peminjaman', 11, 'delete_peminjaman'),
(44, 'Can view peminjaman', 11, 'view_peminjaman'),
(45, 'Can add peminjaman detail', 12, 'add_peminjamandetail'),
(46, 'Can change peminjaman detail', 12, 'change_peminjamandetail'),
(47, 'Can delete peminjaman detail', 12, 'delete_peminjamandetail'),
(48, 'Can view peminjaman detail', 12, 'view_peminjamandetail');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
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
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$6KVHJL0uMnfERHVH402Qmc$8isSv393JRM/7//HmpfjImgx8lfP+JvVI8XeLSNURTo=', '2021-06-02 20:50:58.739858', 1, 'superadmin', '', '', 'admin@inventarisbmn.com', 1, 1, '2021-06-01 23:16:53.000000'),
(4, 'pbkdf2_sha256$260000$ZThy5k3sMusAp5wo1RZxys$4GMzJlUP7YH+YzzlWuFwR+jaix/+YQdr/IsuyKzIlUY=', '2021-06-02 00:05:22.842213', 0, 'pegawai', '', '', '', 0, 1, '2021-06-01 23:32:14.385410'),
(5, 'pbkdf2_sha256$260000$TcyYb1IvcSgE05jsp3MZM5$claxhKLi5XVBntEOgoq7NdCJa8LvqpNFfNBIXOWC10I=', '2021-06-02 20:49:31.429058', 0, 'farhanbe', '', '', '', 0, 1, '2021-06-02 17:31:22.615278'),
(6, 'pbkdf2_sha256$260000$fsNWSP6yaPdqc1PrOZGRsG$bKVjRExgaMM6gGz0QM7wV9lkBKzpm5lvZkGWzqDsJKQ=', '2021-06-02 20:32:21.311237', 0, 'aanbaru', '', '', '', 0, 1, '2021-06-02 17:47:56.817402'),
(7, 'pbkdf2_sha256$260000$H9Zltnh1IGE9kFNInhpfS7$kSgvwSKH8vGdcg0Uh93n7LIoZHc0l69oocGP78Qym9Y=', '2021-06-02 20:50:23.788625', 0, 'aanlama', '', '', '', 0, 1, '2021-06-02 18:01:31.957544');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 4, 2),
(3, 5, 2),
(4, 7, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
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
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-06-01 23:17:27.834944', '1', 'ADMIN', 1, '[{\"added\": {}}]', 3, 1),
(2, '2021-06-01 23:17:36.617419', '2', 'OPERATOR BMN', 1, '[{\"added\": {}}]', 3, 1),
(3, '2021-06-01 23:17:49.927050', '1', 'admininventaris', 2, '[]', 4, 1),
(4, '2021-06-01 23:21:20.589301', '1', 'admininventaris', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(5, '2021-06-01 23:31:21.656516', '2', 'pegawaioperator', 3, '', 4, 1),
(6, '2021-06-01 23:32:12.437718', '3', 'pegawaioperator', 3, '', 4, 1),
(7, '2021-06-01 23:57:32.007045', '4', 'pegawaioperator', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'aplikasi_admin', 'barang'),
(7, 'aplikasi_admin', 'gedung'),
(10, 'aplikasi_admin', 'pegawai'),
(11, 'aplikasi_admin', 'peminjaman'),
(12, 'aplikasi_admin', 'peminjamandetail'),
(8, 'aplikasi_admin', 'ruang'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-01 23:16:06.421679'),
(2, 'auth', '0001_initial', '2021-06-01 23:16:07.268640'),
(3, 'admin', '0001_initial', '2021-06-01 23:16:07.452481'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-06-01 23:16:07.468474'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-01 23:16:07.482465'),
(6, 'aplikasi_admin', '0001_initial', '2021-06-01 23:16:07.625470'),
(7, 'aplikasi_admin', '0002_barang', '2021-06-01 23:16:07.683635'),
(8, 'aplikasi_admin', '0003_pegawai_peminjaman_peminjamandetail', '2021-06-01 23:16:08.339614'),
(9, 'aplikasi_admin', '0004_pegawai_nama_pegawai', '2021-06-01 23:16:08.373309'),
(10, 'contenttypes', '0002_remove_content_type_name', '2021-06-01 23:16:08.477107'),
(11, 'auth', '0002_alter_permission_name_max_length', '2021-06-01 23:16:08.587146'),
(12, 'auth', '0003_alter_user_email_max_length', '2021-06-01 23:16:08.621199'),
(13, 'auth', '0004_alter_user_username_opts', '2021-06-01 23:16:08.640189'),
(14, 'auth', '0005_alter_user_last_login_null', '2021-06-01 23:16:08.707100'),
(15, 'auth', '0006_require_contenttypes_0002', '2021-06-01 23:16:08.714158'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2021-06-01 23:16:08.733121'),
(17, 'auth', '0008_alter_user_username_max_length', '2021-06-01 23:16:08.763081'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2021-06-01 23:16:08.792087'),
(19, 'auth', '0010_alter_group_name_max_length', '2021-06-01 23:16:08.831760'),
(20, 'auth', '0011_update_proxy_permissions', '2021-06-01 23:16:08.854783'),
(21, 'auth', '0012_alter_user_first_name_max_length', '2021-06-01 23:16:08.888944'),
(22, 'sessions', '0001_initial', '2021-06-01 23:16:08.949233'),
(23, 'aplikasi_admin', '0005_alter_peminjaman_bast_disposisi', '2021-06-01 23:47:05.601204'),
(24, 'aplikasi_admin', '0006_alter_peminjaman_bast_disposisi', '2021-06-01 23:51:27.306762');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4ir14l7ayl3exrromssj11nfslduakd9', '.eJxVjMsOwiAQRf-FtSFAebp07zcQZhikaiAp7cr479qkC93ec859sZi2tcZt0BLnzM5MstPvBgkf1HaQ76ndOsfe1mUGviv8oINfe6bn5XD_Dmoa9VsHo5xGaaWbSkYqJWhnjS_ZyuCogCMzEShFGoSHADgRekVCohGIQrL3B-d7ODw:1loEPk:aO-Tuf-aQAcwJk71A3WrSHkPL5FCedrZqNv4T-N6eCw', '2021-06-16 00:07:16.336343'),
('kqd8vz6fjced1kkgbe351i3k1vwlf6mv', '.eJxVjMsOwiAQRf-FtSFAebp07zcQZhikaiAp7cr479qkC93ec859sZi2tcZt0BLnzM5MstPvBgkf1HaQ76ndOsfe1mUGviv8oINfe6bn5XD_Dmoa9VsHo5xGaaWbSkYqJWhnjS_ZyuCogCMzEShFGoSHADgRekVCohGIQrL3B-d7ODw:1loXpK:vUFgmp-4mbAXp_Odwp-8vJyWjGWrMOv5CUuR-1psjYA', '2021-06-16 20:50:58.920503');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aplikasi_admin_barang`
--
ALTER TABLE `aplikasi_admin_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `aplikasi_admin_gedung`
--
ALTER TABLE `aplikasi_admin_gedung`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `aplikasi_admin_pegawai`
--
ALTER TABLE `aplikasi_admin_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `aplikasi_admin_peminjaman`
--
ALTER TABLE `aplikasi_admin_peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aplikasi_admin_pemin_pegawai_id_a8e88491_fk_aplikasi_` (`pegawai_id`);

--
-- Indeks untuk tabel `aplikasi_admin_peminjamandetail`
--
ALTER TABLE `aplikasi_admin_peminjamandetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peminjaman_id` (`peminjaman_id`),
  ADD KEY `aplikasi_admin_pemin_barang_id_87ee5bc9_fk_aplikasi_` (`barang_id`),
  ADD KEY `aplikasi_admin_pemin_gedung_id_9065e9a4_fk_aplikasi_` (`gedung_id`),
  ADD KEY `aplikasi_admin_pemin_ruang_id_93420038_fk_aplikasi_` (`ruang_id`);

--
-- Indeks untuk tabel `aplikasi_admin_ruang`
--
ALTER TABLE `aplikasi_admin_ruang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aplikasi_admin_ruang_gedung_id_b412f196_fk_aplikasi_` (`gedung_id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_barang`
--
ALTER TABLE `aplikasi_admin_barang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_gedung`
--
ALTER TABLE `aplikasi_admin_gedung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_pegawai`
--
ALTER TABLE `aplikasi_admin_pegawai`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_peminjaman`
--
ALTER TABLE `aplikasi_admin_peminjaman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_peminjamandetail`
--
ALTER TABLE `aplikasi_admin_peminjamandetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `aplikasi_admin_ruang`
--
ALTER TABLE `aplikasi_admin_ruang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `aplikasi_admin_pegawai`
--
ALTER TABLE `aplikasi_admin_pegawai`
  ADD CONSTRAINT `aplikasi_admin_pegawai_user_id_f8f00db7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `aplikasi_admin_peminjaman`
--
ALTER TABLE `aplikasi_admin_peminjaman`
  ADD CONSTRAINT `aplikasi_admin_pemin_pegawai_id_a8e88491_fk_aplikasi_` FOREIGN KEY (`pegawai_id`) REFERENCES `aplikasi_admin_pegawai` (`id`);

--
-- Ketidakleluasaan untuk tabel `aplikasi_admin_peminjamandetail`
--
ALTER TABLE `aplikasi_admin_peminjamandetail`
  ADD CONSTRAINT `aplikasi_admin_pemin_barang_id_87ee5bc9_fk_aplikasi_` FOREIGN KEY (`barang_id`) REFERENCES `aplikasi_admin_barang` (`id`),
  ADD CONSTRAINT `aplikasi_admin_pemin_gedung_id_9065e9a4_fk_aplikasi_` FOREIGN KEY (`gedung_id`) REFERENCES `aplikasi_admin_gedung` (`id`),
  ADD CONSTRAINT `aplikasi_admin_pemin_peminjaman_id_3e319afc_fk_aplikasi_` FOREIGN KEY (`peminjaman_id`) REFERENCES `aplikasi_admin_peminjaman` (`id`),
  ADD CONSTRAINT `aplikasi_admin_pemin_ruang_id_93420038_fk_aplikasi_` FOREIGN KEY (`ruang_id`) REFERENCES `aplikasi_admin_ruang` (`id`);

--
-- Ketidakleluasaan untuk tabel `aplikasi_admin_ruang`
--
ALTER TABLE `aplikasi_admin_ruang`
  ADD CONSTRAINT `aplikasi_admin_ruang_gedung_id_b412f196_fk_aplikasi_` FOREIGN KEY (`gedung_id`) REFERENCES `aplikasi_admin_gedung` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
