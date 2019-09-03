-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2019 at 02:37 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_illegal_trade`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `last_loggedin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`username`, `password`, `nama`, `last_loggedin`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', '2019-08-10 08:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `anggota_tim`
--

CREATE TABLE `anggota_tim` (
  `id` int(11) NOT NULL,
  `nama_anggota` varchar(100) NOT NULL,
  `survey_id` binary(16) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `identitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota_tim`
--

INSERT INTO `anggota_tim` (`id`, `nama_anggota`, `survey_id`, `contact`, `identitas`) VALUES
(1, 'SIGIT SURYONO', 0x30393332396339302d626231642d3131, '085201461240', 'PELAJAR'),
(2, 'LINA H', 0x30393332396339302d626231642d3131, '08139633254', 'PELAJAR');

-- --------------------------------------------------------

--
-- Table structure for table `location_trace`
--

CREATE TABLE `location_trace` (
  `id` int(11) NOT NULL,
  `survey_id` binary(16) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `survey_id` binary(16) NOT NULL,
  `nama_satwa` varchar(200) NOT NULL,
  `jumlah_satwa` int(11) NOT NULL,
  `kriteria_pelanggaran` varchar(100) NOT NULL,
  `nama_pemburu` varchar(200) NOT NULL,
  `alamat_pemburu` text NOT NULL,
  `contact_pemburu` varchar(100) NOT NULL,
  `foto_pemburu` varchar(200) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `survey_id`, `nama_satwa`, `jumlah_satwa`, `kriteria_pelanggaran`, `nama_pemburu`, `alamat_pemburu`, `contact_pemburu`, `foto_pemburu`, `lat`, `lon`) VALUES
(1, 0x30393332396339302d626231642d3131, 'Cendrawasih', 1, 'perburuan', 'Faruq Amin', 'KUSUMANEGARA', '085346888469', '', -7.802188699999999, 110.3962144);

-- --------------------------------------------------------

--
-- Table structure for table `survey_header`
--

CREATE TABLE `survey_header` (
  `survey_id` binary(16) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `ketua_tim` varchar(100) NOT NULL,
  `kontak_ketua` varchar(20) NOT NULL,
  `waktu_survey` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wilayah` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_header`
--

INSERT INTO `survey_header` (`survey_id`, `judul`, `ketua_tim`, `kontak_ketua`, `waktu_survey`, `wilayah`, `alamat`) VALUES
(0x30393332396339302d626231642d3131, 'Test Survey', 'Febriani Riwis Sari', '08513465974411', '2019-08-09 17:00:00', 'MANOKWARI', 'MANOKWARI');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `terdaftar_pada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `konfirmasi` char(1) NOT NULL DEFAULT 'N',
  `uuid` varchar(100) NOT NULL,
  `link_request` datetime NOT NULL,
  `link_expired` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `nama`, `password`, `terdaftar_pada`, `konfirmasi`, `uuid`, `link_request`, `link_expired`) VALUES
('sigitharsy25@gmail.com', 'Sigit Suryono', '7aed7057b04e79ed1dcecb4679d17406', '2019-08-25 02:36:38', 'Y', '6a5cea63-37ba-40fa-a6bf-f8ad0a266f12', '2019-08-25 09:36:38', '2019-08-25 11:36:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `anggota_tim`
--
ALTER TABLE `anggota_tim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_trace`
--
ALTER TABLE `location_trace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `survey_header`
--
ALTER TABLE `survey_header`
  ADD PRIMARY KEY (`survey_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota_tim`
--
ALTER TABLE `anggota_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `location_trace`
--
ALTER TABLE `location_trace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_header` (`survey_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
