-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 10:31 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Dress'),
(2, 'Shoes'),
(3, 'Books'),
(4, 'Food'),
(5, 'Watch'),
(6, 'Electronics'),
(7, 'Chair'),
(8, 'Table'),
(9, 'Mouse'),
(10, 'Motercycle'),
(11, 'rose'),
(12, 'solar'),
(13, 'latest');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'failed',
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total`, `status`, `order_date`) VALUES
(2, 11, 1000, 'failed', '2023-08-07 15:19:10'),
(3, 10, 800, 'paid', '2023-08-07 15:19:10'),
(4, 11, 800, 'paid', '2023-08-07 15:19:10'),
(5, 11, 600, 'paid', '2023-08-07 16:24:40'),
(6, 11, 2000, 'failed', '2023-08-22 14:35:01'),
(7, 11, 3000, 'failed', '2023-08-23 14:14:17'),
(8, 11, 5000, 'failed', '2023-08-24 14:10:44'),
(9, 11, 5000, 'failed', '2023-08-24 14:12:49'),
(10, 11, 5000, 'failed', '2023-08-24 14:14:13'),
(11, 11, 5000, 'paid', '2023-08-24 14:16:17'),
(12, 11, 0, 'failed', '2023-08-25 13:45:49'),
(13, 12, 2000, 'failed', '2023-08-27 14:44:32'),
(14, 12, 5000, 'failed', '2023-08-27 14:46:55'),
(15, 12, 2000, 'failed', '2023-08-28 13:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `line_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `product_id`, `order_id`, `quantity`, `line_total`) VALUES
(9, 19, 6, 1, 2000),
(10, 20, 7, 1, 3000),
(11, 19, 8, 1, 2000),
(12, 20, 8, 1, 3000),
(13, 19, 9, 1, 2000),
(14, 20, 9, 1, 3000),
(15, 19, 10, 1, 2000),
(16, 20, 10, 1, 3000),
(17, 19, 11, 1, 2000),
(18, 20, 11, 1, 3000),
(19, 19, 13, 1, 2000),
(20, 19, 14, 1, 2000),
(21, 20, 14, 1, 3000),
(22, 19, 15, 1, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `other_data` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `order_id`, `amount`, `other_data`) VALUES
(3, 10, 3, 800, 'this is test'),
(4, 11, 4, 100, 'PaymentSuccessModel{idx: wQZJFfmCJRaq2cPXWWihDR, amount: 10000, mobile: 98XXXXX177, productIdentity: 4, productName: Payment for order, token: jAS5fSj2jZS8t44QLnd9zG, additionalData: {}}'),
(5, 11, 5, 100, 'PaymentSuccessModel{idx: vZvhfTCVRZgemRqLuqy76g, amount: 10000, mobile: 98XXXXX177, productIdentity: 5, productName: Payment for order, token: 9FvbaWYW5Wq34WzC2i64Ud, additionalData: {}}'),
(7, 11, 11, 10, 'PaymentSuccessModel{idx: 2x7rZfpPmKAak3ZqLMDiRj, amount: 1000, mobile: 98XXXXX177, productIdentity: 11, productName: My Product, token: eVjKHxDxrJe3xf4iEWkzFc, additionalData: {}}');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_token`
--

CREATE TABLE `personal_access_token` (
  `token_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_access_token`
--

INSERT INTO `personal_access_token` (`token_id`, `token`, `user_id`) VALUES
(16, '8aec9cfe13be147648b8b48ce6fa37f3', 10),
(17, '1d9cae5d83d32fddaed5f0cef737d5be', 10),
(18, '0299b1ffa80d66e2be22c8ca86b0dfa6', 10),
(19, '4ee669150501dbd4bab8fceb67e91890', 10),
(20, '098fcaa7b0265a34cacbfd47ffedba0d', 10),
(21, 'b3b82b66b67d15fa160cfef72aea2883', 10),
(22, '5b5497dcda42bbd57adc6bd5eda125c2', 10),
(23, '8258f32609b1a3dfe0116f560b8cfdcd', 10),
(24, 'd3b40c0a1f90f67c863a4e4acb5c58e8', 10),
(25, 'e4e294f03611dcca0c2cff7ad596fa2b', 10),
(26, '67acd80739584d8ae176bab3fb21e6b3', 11),
(27, '07fe946fe66a9b41f37e10111adee5aa', 11),
(28, 'e65e82ca14c4e89174c91416b7951ed7', 11),
(29, '50b0af2eb6ba2837d09fbf24742c72a9', 10),
(30, '780446675cb7dbb62d8a9a547c90e16d', 10),
(31, 'f66f1cf1c9874ea2e7f49baf22c4c5ca', 10),
(32, '6b6bf07465f42a2bf651d4341ef35621', 10),
(33, '204f1eef21a2f0b445d155151eb23a0a', 10),
(34, 'af0400bc33aa4ce704ae718a89674cd3', 10),
(35, '56edf010bbcb6b7891dee0e7110eea0b', 10),
(36, '3c73d7a1363f28a5459443ef5b6ce85d', 10),
(37, '4a6ce35511307d01fce464ecf6ac1e92', 10),
(38, '8de016b73f02cf8f427925dbc34447d8', 10),
(39, '363433edd9a55b260da64aecc5c06cf5', 10),
(40, 'c9c65191489fde3e8d0d94122ec94269', 10),
(41, '34788adf2d06762cb37c528417af01e1', 10),
(42, '56e457c8c9b977e26b664dffc379800a', 11),
(43, '39594f2307f036a7edfd1088a1892ae0', 11),
(44, 'd35ac306599276871be3072bcee77cc5', 11),
(45, '32ed24482aa50e8b8c5b52c931736c65', 10),
(46, 'c51e416c237fdc3e88d7ee9749bdf42f', 10),
(47, 'ad1a46f68e008bc4609ac61dffab2d4e', 11),
(48, 'b2dcc43a7e009d274f9a127913917c25', 10),
(49, 'c906e66db2f524a80dd513447da60dc3', 10),
(50, 'aa958f4e8e41d9a7b01e2403550f8c93', 11),
(51, 'b591e6afb23d690121ce594ca5b9c2fb', 10),
(52, '73b29ec2364d371441dc69462656d839', 11),
(53, 'caaa1706af276860ead23c2f79e07999', 10),
(54, '3c3627887776b13a89cd116cf6bcaf1c', 11),
(55, '6c2f1d9403fc1af89f0a1fd64be10375', 10),
(56, 'b382f476b560f953e00023a0514076b4', 10),
(57, '4fac340013affd9ed686dd7751fb83d5', 11),
(58, '7ca8603abc2ad4de803f3d271ac04b1c', 11),
(59, '663577fac9e0226e557cebc8edabc8b5', 11),
(60, '1f21ce307f06a324ec90b8ab0f9e0bb4', 10),
(61, '94ae3697dc462e3371fa6a467ae5fe99', 11),
(62, 'bad38c055f92e1ad429cea0f05182c43', 11),
(63, '03d2bb035745a157a65b165a8ad77db0', 11),
(64, '5c3aea98dd8852502c2bb8069ef79f62', 10),
(65, '586f4f100f4a22e778524e9296bdd04c', 11),
(66, '8f0aea2e4e86606288b796e58f8d3bd7', 10),
(67, 'cb5631f06c6c02906f649833d09d5b4b', 10),
(68, 'bc8f18f23dce8ca58a12c5b02e79ecd7', 11),
(69, 'dfcc06e5343689aeb28ff00efcff159c', 10),
(70, '92d1af15d9d374c95e6d6204cdf1f4eb', 12),
(71, '1821309fd8a8fefe7b776e3de1346fed', 12),
(72, 'bf24da479f4fcc10f82d8b134ca4683e', 10),
(73, '58c3d102dca4bd68cb7fd79d9dd52751', 11),
(74, 'b205c41e487a8bb34b71c8635c090f98', 10),
(75, '91dbbc97fda29a477f69c221d9dc917d', 11),
(76, 'df8526169e1f49393c1c69bab3eb17c7', 10),
(77, 'a898033af0c0a97cb2eb8316a8dd8060', 11),
(78, '53dfda89e7d020eed901a0508d31e83a', 10),
(79, '8a1bef9dfe88b7304c7cdb29d009dffd', 11),
(80, 'c193bb89004573e77ddc12ea358f60a6', 10),
(81, '497046bdb7dc145e11e55c82011be51b', 11),
(82, 'a9d8298a18d7b4fcb0f8e692fc475d45', 10),
(83, '762587b70b1b4a8336a18f1324062cc8', 11),
(84, 'd1c2e20cd36fd62eff51eb9254c673b7', 10),
(85, '381a8b93075ca6bc510672f299dc624a', 11),
(86, 'a04db9dc7f76cb44dca9285472c75b70', 11),
(87, 'a73abf7385beac7bcc14d0965ff8ed87', 10),
(88, 'd2ae68db5049beebb013750405347296', 11);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `title`, `description`, `category_id`, `image_url`, `is_available`, `price`) VALUES
(19, 'red Nike shoes', 'good for sport', 2, 'images/1691657911_photo-1542291026-7eec264c27ff.jpg', 1, 2000),
(20, 'white sneaker', 'very good for football', 2, 'images/1691913850_6-tm-12-6-trm-white-original-imagjqyzz8z9jrgf.jpg', 1, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `password`, `email`, `role`) VALUES
(10, 'Suraj Suebdi', '$2y$10$.DrH0biyNorOyJoEfk/v4evvD8mkqKLV8n8mnA0ftJyKMxaee3Esy', 'admin@gmail.com', 'admin'),
(11, 'Suraj Subedi', '$2y$10$.DrH0biyNorOyJoEfk/v4evvD8mkqKLV8n8mnA0ftJyKMxaee3Esy', 'suraj@gmail.com', 'user'),
(12, 'Aabhan', '$2y$10$ap3Ss4JPQ9VDtTE45LBby.SJcCw3U6J40rfLjDrMZTghk3Jq9HmBy', 'aabhan@gmail.com', 'user'),
(13, 'dipesh', '$2y$10$fNAUv5ZPKNAOoet4mdfeTOuc.m4qOQcUBVXZ6yt5EEDqFsXYay5Na', 'dipesh', 'admin'),
(14, 'ram', '$2y$10$uNe/jO5C5M8r7n2GvMKA0O5lAQboh07wIX/6Q8cPCxelh.45O9mky', 'ram@gmail.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `personal_access_token`
--
ALTER TABLE `personal_access_token`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_token`
--
ALTER TABLE `personal_access_token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `personal_access_token`
--
ALTER TABLE `personal_access_token`
  ADD CONSTRAINT `personal_access_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
