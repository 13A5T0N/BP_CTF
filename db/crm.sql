-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 12, 2020 at 12:13 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `client` ()  begin
	select * from crm.client order by client_id desc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `invoice` ()  begin
	select client_name as client,invoice_id,status ,total 
    from crm.invoice,crm.client 
    where 
    client_id = client
    order by invoice_id desc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `roles` ()  BEGIN
	SELECT *  FROM crm.roles order by role_id desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users` ()  begin
	select * from crm.users order by user_id desc;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_contact` varchar(50) DEFAULT NULL,
  `client_phone` varchar(20) DEFAULT NULL,
  `client_email` varchar(50) DEFAULT NULL,
  `client_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `client_name`, `client_contact`, `client_phone`, `client_email`, `client_address`) VALUES
(1, 'client 1', NULL, NULL, NULL, ''),
(2, 'client 2', NULL, NULL, NULL, ''),
(3, 'client 3', NULL, NULL, NULL, ''),
(4, 'client 4', NULL, NULL, NULL, ''),
(5, 'client 5', NULL, NULL, NULL, ''),
(6, 'client 6', NULL, NULL, NULL, ''),
(7, 'client 7', NULL, NULL, NULL, ''),
(8, 'a', NULL, NULL, NULL, ''),
(9, 'b', NULL, NULL, NULL, ''),
(10, 'c', NULL, NULL, NULL, ''),
(11, 'd', NULL, NULL, NULL, ''),
(12, 'e', NULL, NULL, NULL, ''),
(13, 'f', NULL, NULL, NULL, ''),
(14, 'g', NULL, NULL, NULL, ''),
(15, 'h', NULL, NULL, NULL, ''),
(16, 'i', NULL, NULL, NULL, ''),
(17, 'j', NULL, NULL, NULL, ''),
(18, 'k', NULL, NULL, NULL, ''),
(19, 'l', NULL, NULL, NULL, ''),
(20, 'm', NULL, NULL, NULL, ''),
(21, 'n', NULL, NULL, NULL, ''),
(22, 'o', NULL, NULL, NULL, ''),
(23, 'p', NULL, NULL, NULL, ''),
(24, 'q', NULL, NULL, NULL, ''),
(25, 'r', NULL, NULL, NULL, ''),
(26, 's', NULL, NULL, NULL, ''),
(29, 'test', 'john', '555', '2@2', 'adss'),
(30, 'tesy', '', '', '', ''),
(31, 'test2', '', '', '', ''),
(32, 'test3', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `client` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'sold',
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `client`, `status`, `total`) VALUES
(1, 1, 'pending ', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_product`
--

CREATE TABLE `invoice_product` (
  `invoice_product_id` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_size` tinytext DEFAULT NULL,
  `product_color` varchar(30) DEFAULT NULL,
  `product_material` varchar(50) DEFAULT NULL,
  `product_amount` int(11) DEFAULT 0,
  `product_price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_size`, `product_color`, `product_material`, `product_amount`, `product_price`) VALUES
(1, 'product', 'M', 'red', 'metal', 10, 150),
(2, 'test product', 'M', 'red', 'steal', 20, 200),
(3, 'product 2', 'M', 'red', 'steal', 20, 500),
(4, 'REHL7', '3 GB', 'red', 'software', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_disc`
--

CREATE TABLE `product_disc` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_size` tinytext DEFAULT NULL,
  `product_color` varchar(30) DEFAULT NULL,
  `product_material` varchar(50) DEFAULT NULL,
  `product_amount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `request_type` int(11) DEFAULT NULL,
  `request_desc` text DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_type`
--

CREATE TABLE `request_type` (
  `request_type_id` int(11) NOT NULL,
  `request_type_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  `user_password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_phone`, `user_role`, `user_password`) VALUES
(1, 'kate', NULL, NULL, '$2y$10$el.SnWOQMdC/K5VZKxd2O.mNREW.PW3vyAqafalLjVoqdCeOhrc4i'),
(2, 'user', NULL, NULL, '$2y$10$MQsNw7uhT1PSsHJCFoODTeZgjmYS6GPIkAyKG0aAfJH4Agf1KQ1fC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`,`client_name`),
  ADD KEY `client_index` (`client_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `FK_invoice_client` (`client`);

--
-- Indexes for table `invoice_product`
--
ALTER TABLE `invoice_product`
  ADD PRIMARY KEY (`invoice_product_id`),
  ADD KEY `FK_invoice` (`invoice`),
  ADD KEY `FK_invoice_product` (`product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`,`product_name`),
  ADD UNIQUE KEY `product_index` (`product_id`);

--
-- Indexes for table `product_disc`
--
ALTER TABLE `product_disc`
  ADD PRIMARY KEY (`product_id`,`product_name`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `FK_request_user` (`user`);

--
-- Indexes for table `request_type`
--
ALTER TABLE `request_type`
  ADD PRIMARY KEY (`request_type_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_index` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`,`user_name`),
  ADD KEY `FK_usr_role` (`user_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_product`
--
ALTER TABLE `invoice_product`
  MODIFY `invoice_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_disc`
--
ALTER TABLE `product_disc`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_type`
--
ALTER TABLE `request_type`
  MODIFY `request_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK_invoice_client` FOREIGN KEY (`client`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `invoice_product`
--
ALTER TABLE `invoice_product`
  ADD CONSTRAINT `FK_invoice` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `FK_invoice_product` FOREIGN KEY (`product`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `FK_request_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_usr_role` FOREIGN KEY (`user_role`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
