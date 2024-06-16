-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2024 at 09:33 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasi_lapangan`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `tambah_data_booking` (`nik` VARCHAR(255), `nama` VARCHAR(255), `no_telp` VARCHAR(255), `email` VARCHAR(255), `jns_lapangan` VARCHAR(255), `tanggal_booking` DATE, `jam_mulai` TIME, `jam_selesai` TIME, `bukti_pembayaran` TEXT) RETURNS INT(11) BEGIN
    DECLARE harga INT;
    
    -- Hitung harga sesuai dengan logika Anda
    -- Misalnya, harga ditetapkan 100000 per jam
    SET harga = TIMESTAMPDIFF(HOUR, jam_mulai, jam_selesai) * 100000;
    
    -- Masukkan data ke dalam tabel booking
    INSERT INTO booking (tanggal_booking, jam_mulai, jam_selesai, harga)
    VALUES (tanggal_booking, jam_mulai, jam_selesai, harga);
    
    -- Masukkan data ke dalam tabel pembayaran
    INSERT INTO pembayaran (bukti_pembayaran)
    VALUES (bukti_pembayaran);
    
    -- Masukkan data ke dalam tabel pemesanan
    INSERT INTO pemesan (nik, nama, no_telp, email)
    VALUES (nik, nama, no_telp, email);
    
    -- Kembalikan ID pemesanan
    RETURN LAST_INSERT_ID();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `tanggal_booking` varchar(9) NOT NULL,
  `jam_mulai` varchar(5) NOT NULL,
  `jam_selesai` varchar(5) NOT NULL,
  `harga` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`tanggal_booking`, `jam_mulai`, `jam_selesai`, `harga`) VALUES
('25-06-202', '09.00', '11.00', '240000'),
('24-06-202', '14.00', '15.00', '120000'),
('23-06-202', '16.00', '17.00', '120000'),
('2024-06-1', '23:13', '00:29', '2300000'),
('2024-06-1', '23:55', '00:55', '2300000'),
('2024-06-1', '23:13', '00:29', '2300000'),
('2024-06-1', '23:13', '00:29', '2300000'),
('2024-06-1', '23:13', '00:29', '2300000'),
('2024-06-1', '00:44', '01:44', '100000'),
('2024-06-1', '00:44', '01:44', '100000'),
('2024-06-1', '01:47', '02:47', '100000'),
('2024-06-1', '00:49', '01:49', '100000'),
('2024-06-1', '01:53', '03:53', '200000'),
('2024-06-1', '20:56', '22:56', '200000'),
('2024-06-1', '00:58', '01:58', '100000'),
('2024-06-1', '03:58', '04:58', '100000'),
('2024-06-1', '02:04', '03:04', '100000'),
('2024-06-1', '01:04', '05:04', '400000'),
('2024-06-1', '01:04', '08:04', '700000'),
('2024-06-1', '03:12', '04:12', '100000'),
('2024-06-2', '03:15', '04:15', '100000'),
('2024-06-2', '01:16', '02:16', '100000'),
('2024-06-2', '00:18', '01:18', '100000'),
('2024-07-0', '01:19', '03:19', '200000'),
('2024-06-2', '00:21', '01:21', '100000'),
('2024-06-1', '18:13', '21:13', '300000'),
('2024-06-1', '16:16', '17:16', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `kode_lapangan` varchar(25) NOT NULL,
  `jns_lapangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`kode_lapangan`, `jns_lapangan`) VALUES
('a1', 'lapangan a'),
('a2', 'lapangan b'),
('a3', 'lapangan a'),
('a4', 'lapangan b');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `bukti_pembayaran` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `bukti_pembayaran`) VALUES
(1, 'C:xamppxampp	mpphpC878.tmp'),
(2, ''),
(3, 'C:xamppxampphtdocs\reservasi lapanganuktiPembayaranlapangan A.jpeg'),
(4, 'C:xamppxampphtdocs\reservasi lapanganuktiPembayaran2.png'),
(5, 'C:/xampp/xampp/htdocs/reservasi lapangan/buktiPembayaran/3.png'),
(6, 'C:/xampp/xampp/htdocs/reservasi lapangan/buktiPembayaran/1.png'),
(7, 'C:/xampp/xampp/htdocs/reservasi lapangan/buktiPembayaran/3.png');

-- --------------------------------------------------------

--
-- Table structure for table `pemesan`
--

CREATE TABLE `pemesan` (
  `nik` int(15) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesan`
--

INSERT INTO `pemesan` (`nik`, `nama`, `no_telp`, `email`) VALUES
(123, 'cape', '1233131', 'pengenbobo'),
(98767, 'asu', '3546786545', 'awwww'),
(123456, 'asas', '232332323', 'assas'),
(129291, 'awa', '0898989', 'ansns@kakka'),
(763178, 'anjrot', '478324623', 'aaaaaaaas'),
(888888, 'aduh', '06858585', 'ngantuk@asa'),
(909090, 'adi', '08986111', 'adi@gmail.com'),
(9009009, 'anjay', '09878683', 'andiaw'),
(22222222, 'udin', '09090999', 'udin@gmail.com'),
(23232323, 'wew', '090909', 'kjjiui'),
(23232424, 'cici', '08976899', 'cici@gmail.com'),
(35533532, 'wewasasas', '2342543637', 'pppppas@adsd'),
(123123123, 'adni', '082178829111', 'adni@gmial.com'),
(189898989, 'alopppp', '098089797', 'maspal@klk'),
(338492958, 'bobo+lah', '787878454', 'udahancaped'),
(1872109882, 'ini', '0821782222', 'naufalazharsyauqi@gmail.c'),
(2147483647, 'agil', '1211222222', 'asajsahh@itg.vvd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`kode_lapangan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesan`
--
ALTER TABLE `pemesan`
  ADD PRIMARY KEY (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
