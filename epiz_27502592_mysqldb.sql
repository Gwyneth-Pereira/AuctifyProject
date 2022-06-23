-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql306.byetcluster.com
-- Generation Time: Apr 03, 2021 at 03:32 PM
-- Server version: 5.6.48-88.0
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_27502592_mysqldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `id` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `product` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `startprice` float NOT NULL,
  `bid` float DEFAULT NULL,
  `bidder` varchar(30) DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `owner`, `product`, `start`, `end`, `startprice`, `bid`, `bidder`, `status`) VALUES
(9, 'faisal123', 9, '2020-12-20 14:26:47', '2020-12-21 10:15:00', 3000, 3300, 'haSaleh', 'pending'),
(8, 'faisal123', 8, '2020-12-20 14:26:47', '2020-12-23 09:30:00', 10, 32.5, 'ibrahim1234', 'failed'),
(7, 'SMousa45', 7, '2020-12-20 14:21:52', '2020-12-24 00:00:00', 12, 14, 'ibrahim1234', 'pending'),
(6, 'SMousa45', 6, '2020-12-20 14:21:52', '2020-12-21 00:00:00', 10, 30, 'ibrahim1234', 'pending'),
(10, 'faisal123', 10, '2020-12-20 14:26:47', '2020-12-22 00:00:00', 35, NULL, NULL, 'noparticipation'),
(11, 'haSaleh', 11, '2020-12-20 14:26:47', '2020-12-21 21:30:00', 2, 3, 'jasmine', 'pending'),
(12, 'haSaleh', 12, '2020-12-20 14:26:47', '2020-12-24 20:00:00', 5, NULL, NULL, 'noparticipation'),
(13, 'abdullah98', 13, '2020-12-20 14:26:47', '2020-12-24 20:00:00', 70, NULL, NULL, 'noparticipation'),
(14, 'SMousa45', 14, '2020-12-20 14:26:47', '2020-12-24 20:00:00', 6000, NULL, NULL, 'noparticipation'),
(15, 'abdullah98', 15, '2020-12-20 14:26:47', '2020-12-24 20:00:00', 12, 16, 'adarsh', 'pending'),
(5, 'haSaleh', 5, '2020-12-20 13:00:00', '2020-12-31 00:00:00', 100, 150, 'faisal123', 'pending'),
(3, 'abdullah98', 3, '2020-12-20 13:00:00', '2020-12-26 00:00:00', 4, NULL, NULL, 'noparticipation'),
(2, 'haSaleh', 2, '2020-12-20 13:00:00', '2020-12-25 00:00:00', 400, NULL, NULL, 'noparticipation'),
(1, 'SMousa45', 1, '2020-12-20 13:00:00', '2020-12-31 00:00:00', 1000, 1200, 'Haitham', 'pending'),
(24, 'materwelon', 26, '2020-12-23 17:15:00', '2020-12-29 01:14:23', 5, 495, 'Ashraf', 'pending'),
(25, 'tony', 27, '2020-12-23 17:28:41', '2020-12-24 02:27:35', 500, 600, 'materwelon', 'pending'),
(26, 'Gwen', 28, '2021-02-12 06:09:29', '2021-05-25 20:10:10', 250, 300, 'ibrahimkubaisy', 'active'),
(27, 'Gwen', 29, '2021-02-12 06:15:12', '2021-02-15 18:14:23', 70.99, 71, 'ibrahimkubaisy', 'pending'),
(28, 'Gwen', 30, '2021-02-12 06:17:49', '2021-02-13 14:17:12', 5, 8.5, 'ibrahimkubaisy', 'pending'),
(29, 'Gwen', 31, '2021-02-12 06:22:45', '2021-02-13 08:22:05', 10.99, 21.99, 'ibrahimkubaisy', 'successful'),
(30, 'Gwen', 32, '2021-02-12 06:35:36', '2021-02-12 21:34:54', 100.99, NULL, NULL, 'noparticipation'),
(31, 'ellord', 33, '2021-02-21 15:10:46', '2021-02-24 13:10:28', 200, NULL, NULL, 'noparticipation');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `auction` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `message` varchar(200) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `product`, `picture`) VALUES
(37, 28, 'images/products/pic16131281731395611403602661ed2395d.jpg'),
(36, 28, 'images/products/pic1613128173321945863602661ed214bd.jpg'),
(33, 1, 'images/products/pic16085806061200963175fe0fdfe48540.jpg'),
(34, 26, 'images/products/pic16087616971964577065fe3c161c54b9.jpg'),
(35, 27, 'images/products/pic16087625259551166505fe3c49dc07f9.jpg'),
(41, 29, 'images/products/pic16131285057554875216026633997b6e.jpg'),
(40, 29, 'images/products/pic161312850515161635136026633997922.jpg'),
(39, 29, 'images/products/pic16131285051157440413602663399714c.jpg'),
(38, 28, 'images/products/pic16131281731828155262602661ed23c08.jpg'),
(32, 5, 'images/products/pic160858047214303567875fe0fd78c64e2.jpg'),
(31, 5, 'images/products/pic16085804728878189145fe0fd78c5498.jpg'),
(14, 7, 'images/products/pic160849275811581265765fdfa6d6c9ca1.jpeg'),
(15, 7, 'images/products/pic16084927583120427845fdfa6d6e91bd.jpeg'),
(23, 10, 'images/products/pic160849293714523669375fdfa78951a3f.jpeg'),
(22, 9, 'images/products/pic160849291614116219685fdfa77482103.jpeg'),
(21, 8, 'images/products/pic16084928841155167665fdfa7543f512.jpeg'),
(20, 8, 'images/products/pic160849288417783242795fdfa7543eda2.jpeg'),
(24, 11, 'images/products/pic16084929649735591905fdfa7a412d32.jpeg'),
(25, 11, 'images/products/pic160849296419104001825fdfa7a413238.jpeg'),
(26, 12, 'images/products/pic16084929789060823165fdfa7b227e4a.jpeg'),
(27, 13, 'images/products/pic16084930004945564265fdfa7c845fc6.jpeg'),
(28, 13, 'images/products/pic160849300011070017165fdfa7c84639a.jpeg'),
(29, 14, 'images/products/pic160849306216551565305fdfa8067da5a.jpeg'),
(30, 15, 'images/products/pic16084930822896503405fdfa81a40503.jpeg'),
(42, 29, 'images/products/pic16131285057486701786026633997db1.jpg'),
(43, 30, 'images/products/pic16131286561475817641602663d0a8c98.jpg'),
(44, 32, 'images/products/pic16131297271098734447602667ff7f6dc.jpg'),
(45, 32, 'images/products/pic161312972754032529602667ff7fdc4.jpg'),
(46, 33, 'images/products/pic161393823411062281356032be3a380aa.ico');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `category`) VALUES
(1, 'Ancient painting', 'Ancient French painting from WW2 1941', 'Art'),
(2, 'Brand new iPhone 12', 'iPhone 12 red color 256GB', 'Electronics'),
(3, 'Yellow Fluffy Duck', 'exciting bed time stories for kids of age 5-8 years', 'Books'),
(5, 'Ralph Lauren sweater', 'New Ralph Lauren sweater... red color', 'Clothings'),
(6, 'Hoodie', 'Hoodie of multiple sizes and colors', 'clothing'),
(7, 'Eyeshadow', 'Urban Decay “Born To Run” eyeshadow palette. Unused.', 'health&beauty'),
(8, 'Wireless charger', 'Portable wireless charger from Apple.', 'Electronics'),
(9, 'Honda accord', '2017 model of a Honda Accord. Good condition. 40000km mileage.', 'Vehicles'),
(10, 'Bluetooth earphones', 'Wireless earphones. Small and compact.', 'Electronics'),
(11, 'Children notebooks', 'a pack of 5 pink notebooks with different designs.', 'Books'),
(12, 'Writing book', 'A book that teaches descriptive writing.', 'Books'),
(13, 'Thermometer', 'Take your temperature at the comfort of your own home.', 'health&beauty'),
(14, 'DongFeng E70', 'Chinese electrical car. Brand new 2020 model. 0 mileage.', 'Vehicles'),
(15, 'Glucose meter', 'Device for the diabetic to measure glucose level.', 'health&beauty'),
(31, 'The Four Winds', 'Book by Kristin Hannah\r\n#1 NEW YORK TIMES BESTSELLER\r\n#1 USA TODAY BESTSELLER\r\n#1 INDIE BESTSELLER', 'Books'),
(30, ' Mascara', 'essence | Lash Princess False Lash Effect Mascara | Gluten & Cruelty Free', 'Health and Beauty'),
(29, 'Nintendo Switch', 'Nintendo, Switch V2 32GB Handheld Gaming Console With Extended Battery, Black', 'Video Games'),
(28, 'HP Pavilion x360', 'HP Pavilion x360, Core i7, 14 Inch, 8GB RAM, 512GB SSD, Windows 10 Home 64-Bit, Mineral Silver', 'Electronics'),
(27, 'Cheetah Brothers', 'awesome youtube channel with 25K subscribers.', 'Other'),
(26, 'MASK', 'rare unused mask ', 'Health and Beauty'),
(32, 'Brother Sewing and Quilting Machine', 'Brother Sewing and Quilting Machine, CS6000i, 60 Built-in Stitches, 2.0\" LCD Display, Wide Table, 9 Included Sewing Feet', 'Electronics'),
(33, 'dog', 'Shiba inu 8 months old. Well trained', 'Pets');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `question` varchar(300) NOT NULL,
  `asker` varchar(150) NOT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `questiondate` datetime NOT NULL,
  `answerdate` datetime DEFAULT NULL,
  `owner` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `product`, `question`, `asker`, `answer`, `questiondate`, `answerdate`, `owner`) VALUES
(1, 1, 'Is the product in a good condition?', 'user', NULL, '2020-12-20 20:26:59', NULL, 'admin'),
(2, 5, 'What size is the sweater?', 'Haitham', NULL, '2020-12-21 22:42:13', NULL, 'haSaleh'),
(3, 26, 'Can i change my bidding amount . I gave one 0 more', 'tony', 'you gave one less 0', '2020-12-24 01:21:09', '2020-12-24 01:26:01', 'materwelon'),
(4, 2, 'what does the iphone look like?', 'materwelon', NULL, '2020-12-24 01:24:31', NULL, 'haSaleh'),
(5, 29, 'Does it come with any extra games?!', 'ibrahimkubaisy', NULL, '2021-02-13 06:27:16', NULL, 'Gwen');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `auctionid` int(11) NOT NULL,
  `buyerRating` float DEFAULT NULL,
  `sellerRating` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`auctionid`, `buyerRating`, `sellerRating`) VALUES
(2, 1, 3),
(8, 1, 3),
(11, 3, 5),
(12, 4, 1),
(13, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `auction` int(11) NOT NULL,
  `number` int(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `name`, `auction`, `number`, `email`, `address`) VALUES
(1, 'Ibrahim Kubaisy', 29, 33268888, 'ibrahim.alkubaisy@gmail.com', 'Hidd, Bahrain.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `picture` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `picture`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin full new', 'admin@admin.net', NULL),
(2, 'user', '12dea96fec20593566ab75692c9949596833adc9', 'user', 'user@user.user', NULL),
(3, 'faisal123', '64779dc7899f847409456c0a138ad232bbd18b88', 'Faisal Mahdi', 'fas@gmail.com', NULL),
(4, 'haSaleh', 'c55eb61d90655d928f283bd973d2b9d8740db4bb', 'Hamed Saleh', 'hami@gmail.com', NULL),
(5, 'ibrahim1234', 'e23554d9c124e13cdb1802311e162b4872908940', 'Ibrahim Al-Kubaisy', 'ibrahim.alkubaisy@gmail.com', NULL),
(6, 'abdullah98', '080dffa2ab5ed57b4e26bb4faa4d2a1021aabc6f', 'Abdullah Ahmed', 'abahmed@gmail.com', NULL),
(7, 'SMousa45', 'f3473b77df8c737bc06708df60ffe92ae894520d', 'Sara Mousa', 'samo@gmail.com', NULL),
(8, 'Gwynnneth', '807d8dbb54e7a6a7f3a60be59535bb077c7b2e18', 'Gwen Paltrow', 'gwenp@gmail.com', NULL),
(9, 'Jasmine', '07569151540a4cf1fb7a209d0e280b2203a2ebf4', 'Yasmeen Adam', 'jazz@gmail.com', NULL),
(10, 'Haitham', '371326137f2cb6471d9fd7a36d27e5c6284a32bc', 'Haitham Fathi', 'haitham@gmail.com', NULL),
(11, 'materwelon', '342be24af3b29a786b10500e8c4aa22abc6efd30', 'return monke', 'elonmusket@spacex.com', NULL),
(12, 'tony', '3f08b47db77bcf5119991ea51c7ab2a2ea7f068b', 'Tony Stark', 'tonystarkisthelegend@gmail.com', NULL),
(13, 'adarsh', '98b1a25a923329b82be71d626a14b7c6ad1569ed', 'Adarsh Chandran', 'adarsh@example.com', NULL),
(14, 'Samif', '4ea7cd63b477d30869b9a5c441e8b980a634896e', 'Sami Falah', 'ibrahim.alkubaisy200@gmail.com', NULL),
(15, 'faisal', 'b44dda1dadd351948fcace1856ed97366e679239', 'faisal faisal', 'faisalalqaed@gmail.com', NULL),
(16, 'Abdaal', 'cc9f816a42431cf852cdc7a3fad42a6f65ffce24', 'Abdaal zulfi', 'abdaalzulfiqar@gmail.com', NULL),
(17, 'Gwen', '37f359f0f09d406b3a16c9f666c246dc9d444d77', 'Gwyneth Pereira', 'Gwenap1997@gmail.com', NULL),
(18, 'ibrahimkubaisy', '783b85faa0d44fec3334d32b4a4c84a3007f9492', 'Ibrahim Kubaisy', 'ibrahim.alkubaisy@yahoo.com', NULL),
(19, 'ellord', '832d771de6e273b352efeb0acbe92c6813bd1583', 'ellord frukwan', 'mazin3212@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `product` (`product`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auction` (`auction`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `asker` (`asker`),
  ADD KEY `prodowner` (`owner`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`auctionid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auction` (`auction`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `auctionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
