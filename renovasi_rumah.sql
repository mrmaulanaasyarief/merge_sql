-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 04:14 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `renovasi_rumah`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` varchar(50) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `pwd`, `last_login`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', '2021-01-27 18:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `alamat`, `no_hp`) VALUES
(1, 'krisna', 'bandung', '89697113656'),
(2, 'asep', 'sukabumi', '0555646464'),
(3, 'ujang', 'surabaya', '6468986'),
(5, 'julio', 'lembang', '65849661'),
(6, 'ananda', 'sukabumi', '2899'),
(7, 'genus', 'surabaya', '0555646464656'),
(9, 'hani', 'tangerang', '08936556');

-- --------------------------------------------------------

--
-- Table structure for table `detail_trans_supplier`
--

CREATE TABLE `detail_trans_supplier` (
  `id_detail_trans` varchar(15) NOT NULL,
  `id_transaksi` varchar(15) NOT NULL,
  `id_supplier` varchar(15) NOT NULL,
  `harga` int(11) NOT NULL,
  `total_diskon` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jasa_desain`
--

CREATE TABLE `jasa_desain` (
  `id_jasa_desain` int(11) NOT NULL,
  `jenis_jasa_desain` varchar(100) NOT NULL,
  `tipe_desain` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jasa_desain`
--

INSERT INTO `jasa_desain` (`id_jasa_desain`, `jenis_jasa_desain`, `tipe_desain`) VALUES
(8, 'Walpaper', 'Vintage'),
(9, 'Langit Langit', 'Vintage'),
(10, 'Pintu', 'Bohemian'),
(12, 'lantai', 'Bohemian');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_material` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id_material`, `nama`, `jenis_material`, `satuan`, `harga`) VALUES
(1, 'Semen', 'Bahan', 'Kg', 500000),
(5, 'Obeng', 'Alat', 'cm', 35000),
(6, 'pasir', 'Bahan', 'Kg', 300000),
(8, 'Batu bata', 'Bahan', 'Kg', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(15) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `alamat_pegawai` varchar(100) NOT NULL,
  `telp_pegawai` varchar(13) NOT NULL,
  `jenis_pegawai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `alamat_pegawai`, `telp_pegawai`, `jenis_pegawai`) VALUES
(10, 'amelia getty', 'bandung', '08211706368', 'tukang cat'),
(11, 'ingka novita', 'jakarta', '08211706321', 'tukang keramik'),
(13, 'regina', 'serang', '082117063456', 'tukang las'),
(14, 'dara', 'Bali', '08211706366', 'tukang cat'),
(15, 'vanya', 'Bandung', '082117063457', 'mandor'),
(16, 'Mince', 'Semarang', '082117064567', 'tukang semen'),
(17, 'Desta', 'Depok', '081224411447', 'mandor');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_jasa_desain`
--

CREATE TABLE `pembayaran_jasa_desain` (
  `id_pembayaran_jasa` int(11) NOT NULL,
  `id_trans_jasa_desain` int(11) NOT NULL,
  `no_kuitansi` varchar(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `besar_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_jasa_desain`
--

CREATE TABLE `pemesanan_jasa_desain` (
  `id_pesan` int(11) NOT NULL,
  `id_jasa_desain` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `status_bayar` varchar(100) NOT NULL,
  `harga_deal` int(11) NOT NULL,
  `tgl_desain` date NOT NULL,
  `status_desain` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan_jasa_desain`
--

INSERT INTO `pemesanan_jasa_desain` (`id_pesan`, `id_jasa_desain`, `tgl_pesan`, `status_bayar`, `harga_deal`, `tgl_desain`, `status_desain`) VALUES
(34, 8, '2021-05-30', 'Belum Lunas', 25000, '2021-05-31', ''),
(35, 9, '2021-05-09', 'Lunas', 100000, '2021-05-10', ''),
(36, 12, '2021-06-07', 'Belum Lunas', 150000, '2021-06-08', ''),
(37, 9, '2021-06-02', 'Belum Lunas', 200000, '2021-06-04', '');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_material`
--

CREATE TABLE `pemesanan_material` (
  `id_pesan` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `tanggal_ambil` date NOT NULL,
  `status_bayar` varchar(100) NOT NULL,
  `total_trans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan_material`
--

INSERT INTO `pemesanan_material` (`id_pesan`, `id_material`, `tanggal_pesan`, `tanggal_ambil`, `status_bayar`, `total_trans`) VALUES
(11, 1, '2021-04-19', '2021-04-26', 'Lunas', 450000),
(12, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(13, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(14, 6, '2021-04-12', '2021-04-19', 'Belum Lunas', 250000),
(15, 6, '2021-04-12', '2021-04-19', 'Belum Lunas', 250000),
(16, 8, '2021-04-19', '2021-04-12', 'Lunas', 900000),
(17, 8, '2021-04-19', '2021-04-12', 'Lunas', 900000),
(18, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(19, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(20, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(21, 5, '2021-04-19', '2021-04-26', 'Lunas', 30000),
(22, 1, '2021-04-19', '2021-04-19', 'Lunas', 500000),
(23, 1, '2021-04-19', '2021-04-26', 'Lunas', 450000),
(24, 6, '2021-04-19', '2021-04-26', 'Lunas', 250000),
(25, 1, '2021-04-13', '2021-04-26', 'Lunas', 450000),
(26, 1, '2021-04-19', '2021-04-26', 'Lunas', 400000),
(27, 6, '2021-04-13', '2021-04-13', 'Lunas', 250000),
(28, 1, '2021-04-13', '2021-04-20', 'Lunas', 400000),
(29, 5, '2021-04-13', '2021-04-20', 'Lunas', 30000),
(30, 8, '2021-04-03', '2021-04-10', 'Lunas', 900000),
(31, 1, '2021-04-17', '2021-04-21', 'Lunas', 450000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(15) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  `telepon_supplier` varchar(13) NOT NULL,
  `jenis_material` varchar(100) NOT NULL,
  `harga_material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telepon_supplier`, `jenis_material`, `harga_material`) VALUES
(7, 'Syafia', 'Ciracas', '081221065578', 'Batu granit', 0),
(8, 'Alyssa', 'Pabuaran', '08122106954', 'Keramik marbel', 0),
(9, 'Regina', 'Serang', '081221076646', 'cat', 0),
(10, 'Biyan', 'Ciceri', '081221076644', 'besi', 0),
(11, 'Doni', 'jakarta', '081221076645', 'baja', 0),
(12, 'Davin', 'Lontar', '081221067734', 'Kayu Jati', 0),
(13, 'Rege', 'Sukabirus', '082116574423', 'Kawat', 0),
(14, 'Jihan', 'Batam', '089441675529', 'Rumput', 0),
(16, 'getty', 'subang', '081221076646', 'cat tembok', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_material`
--

CREATE TABLE `transaksi_material` (
  `id_trans_material` varchar(15) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_bayar` int(100) NOT NULL,
  `total_beli` int(100) NOT NULL,
  `kembalian` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pegawai`
--

CREATE TABLE `transaksi_pegawai` (
  `id_trans_pegawai` varchar(15) NOT NULL,
  `jumlah_hari` int(11) NOT NULL,
  `gaji` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `id_pegawai` varchar(15) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_supplier`
--

CREATE TABLE `transaksi_supplier` (
  `id_trans_supplier` varchar(15) NOT NULL,
  `tanggal_trans_supplier` date NOT NULL,
  `diskon` decimal(10,0) NOT NULL,
  `ongkos_kirim` int(11) NOT NULL,
  `total_jual` int(11) NOT NULL,
  `posisi_dr_cr` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_trans_supplier`
--
ALTER TABLE `detail_trans_supplier`
  ADD PRIMARY KEY (`id_detail_trans`);

--
-- Indexes for table `jasa_desain`
--
ALTER TABLE `jasa_desain`
  ADD PRIMARY KEY (`id_jasa_desain`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pembayaran_jasa_desain`
--
ALTER TABLE `pembayaran_jasa_desain`
  ADD PRIMARY KEY (`id_pembayaran_jasa`);

--
-- Indexes for table `pemesanan_jasa_desain`
--
ALTER TABLE `pemesanan_jasa_desain`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `pemesanan_material`
--
ALTER TABLE `pemesanan_material`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi_customer`
--
ALTER TABLE `transaksi_customer`
  ADD PRIMARY KEY (`id_trans_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `transaksi_material`
--
ALTER TABLE `transaksi_material`
  ADD PRIMARY KEY (`id_trans_material`);

--
-- Indexes for table `transaksi_supplier`
--
ALTER TABLE `transaksi_supplier`
  ADD PRIMARY KEY (`id_trans_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jasa_desain`
--
ALTER TABLE `jasa_desain`
  MODIFY `id_jasa_desain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pembayaran_jasa_desain`
--
ALTER TABLE `pembayaran_jasa_desain`
  MODIFY `id_pembayaran_jasa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `transaksi_pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan_jasa_desain`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

--
-- AUTO_INCREMENT for table `pemesanan_material`
--
ALTER TABLE `pemesanan_material`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
