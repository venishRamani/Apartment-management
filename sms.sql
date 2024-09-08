-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 05:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `C_ID` int(11) NOT NULL,
  `C_DATE` date NOT NULL,
  `C_SUBJECT` varchar(256) NOT NULL,
  `C_DETAILS` varchar(256) NOT NULL,
  `C_STATUS` varchar(45) NOT NULL,
  `MEMBER_M_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`C_ID`, `C_DATE`, `C_SUBJECT`, `C_DETAILS`, `C_STATUS`, `MEMBER_M_ID`) VALUES
(8, '2023-02-06', 'elecrticity problem', 'Electricity problem at my floor, please solve asap!', 'Inprogress', 2),
(9, '2023-02-06', 'Noise and Disturbance', 'Noise levels caused by other members or outside vendors including loud music, construction noise, and similar disturbances', 'Solved', 2),
(10, '2023-02-06', 'Parking Space', 'Limited space for parking and outsiders park their vehicle in allotted spots.', 'Pending', 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `EVENT_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `E_ID` int(11) NOT NULL,
  `E_DATE` date NOT NULL DEFAULT current_timestamp(),
  `E_SUBJECT` varchar(45) NOT NULL,
  `E_AMOUNT` int(11) NOT NULL,
  `E_TOWHOME` varchar(45) NOT NULL,
  `SOCIETY_S_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`E_ID`, `E_DATE`, `E_SUBJECT`, `E_AMOUNT`, `E_TOWHOME`, `SOCIETY_S_ID`) VALUES
(1, '2023-03-03', 'Water pipeline leakage', 2000, 'plumber', 1),
(2, '2023-01-28', 'navratri celebration', 2000, 'decorater', 1),
(3, '2023-01-28', 'navratri celebration', 7800, 'decorater', 1),
(4, '2023-01-30', 'navratri celebration', 500, 'decorater', 1),
(5, '2023-02-07', 'navratri celebration', 2000, 'decorater', 1);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `G_ID` int(11) NOT NULL,
  `G_NO` int(11) NOT NULL,
  `G_NAME` varchar(45) NOT NULL,
  `G_ARRIVAL` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `G_CONTACT` decimal(10,0) NOT NULL,
  `G_STATUS` varchar(20) NOT NULL,
  `G_TYPE` varchar(20) NOT NULL,
  `HOUSE_H_ID` int(20) DEFAULT NULL,
  `SP_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`G_ID`, `G_NO`, `G_NAME`, `G_ARRIVAL`, `G_CONTACT`, `G_STATUS`, `G_TYPE`, `HOUSE_H_ID`, `SP_ID`) VALUES
(1, 6, 'Rahul Tripathi', '2023-02-22 08:42:31.463193', '7878945612', 'Allowed', 'Normal', 1, 1),
(8, 2, 'yash bhadani', '2023-01-31 21:56:00.000000', '9023964738', 'Denied', 'Pre-Invited', 1, 1),
(11, 2, 'yash bhadani', '2023-01-31 17:23:00.000000', '9487845211', 'Allowed', 'Pre-Invited', 1, 1),
(12, 2, 'yash bhadani', '2022-12-31 22:35:00.000000', '9487845211', 'Allowed', 'Pre-Invited', 1, 6),
(13, 3, 'bhaumik', '2023-01-31 17:43:10.000000', '9487845211', 'Allowed', 'Normal', 4, 1),
(14, 4, 'Bhaumik Dobariya', '2023-02-07 11:41:00.000000', '9023964738', 'Pending', 'Pre-Invited', 1, NULL),
(15, 2, 'Keyur Patel', '2023-02-06 17:48:00.000000', '9023964738', 'Pending', 'Pre-Invited', 1, NULL),
(16, 3, 'Yash Bhadani', '2023-02-06 12:08:23.000000', '9487845211', 'Allowed', 'Normal', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `H_ID` int(11) NOT NULL,
  `H_NO` int(11) NOT NULL,
  `H_TYPE` varchar(10) NOT NULL,
  `H_CHARGE` int(10) NOT NULL,
  `SOCIETY_S_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`H_ID`, `H_NO`, `H_TYPE`, `H_CHARGE`, `SOCIETY_S_ID`) VALUES
(1, 101, '2BHK', 2000, 1),
(4, 102, '2bhk', 2000, 1),
(5, 201, '3bhk', 3000, 1),
(6, 204, '3bhk', 3000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `IMG_ID` int(11) NOT NULL,
  `IMG_PATH` varchar(45) NOT NULL,
  `SOCIETY_S_ID` int(11) NOT NULL,
  `EVENT_EVENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `M_ID` int(11) NOT NULL,
  `M_F_NAME` varchar(45) NOT NULL,
  `M_USERNAME` varchar(45) NOT NULL,
  `M_PASSWORD` varchar(45) NOT NULL,
  `M_EMAIL` varchar(45) DEFAULT NULL,
  `M_PHONE` decimal(10,0) NOT NULL,
  `M_GENDER` varchar(10) NOT NULL,
  `M_IMG` varchar(100) DEFAULT NULL,
  `M_TOTAL` int(10) DEFAULT NULL,
  `HOUSE_H_ID` int(11) DEFAULT NULL,
  `ROLE_ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`M_ID`, `M_F_NAME`, `M_USERNAME`, `M_PASSWORD`, `M_EMAIL`, `M_PHONE`, `M_GENDER`, `M_IMG`, `M_TOTAL`, `HOUSE_H_ID`, `ROLE_ROLE_ID`) VALUES
(2, 'member', 'member', 'member', 'ybhadani66@gmail.com', '9484541083', 'male', 'LogoSample_ByTailorBrands.jpg', 3, 1, 2),
(57, 'Arpit Patel', 'arpit123', 'Arpit@123', 'ybhadani66@gmail.com', '9487845211', 'male', NULL, NULL, NULL, 2),
(58, 'Milan Patel', 'milan90', 'Milan@1234', 'milan54@gmail.com', '9023964738', 'male', NULL, 6, 6, 2),
(59, 'Ramesh Patel', 'ramesh123', 'Ramesh@1234', 'ybhadani66@gmail.com', '8708799099', 'male', NULL, 3, 5, 2),
(60, 'Arpit', 'admin145', 'Yash@1234', 'ybhadani66@gmail.com', '9484587456', '', NULL, 7, 4, 1),
(61, 'Milan Patel', 'bhaumikdobariya', 'Yash@1234', 'ybhadani66@gmail.com', '8708799099', 'male', NULL, 4, 4, 2),
(62, 'Arpit Sakariya', 'arpitsakariya7', 'Arpit@1234', 'arpitsakariya6@gmail.com', '9484541083', 'male', NULL, 8, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `member_has_notification`
--

CREATE TABLE `member_has_notification` (
  `MEMBER_M_ID` int(11) NOT NULL,
  `NOTIFICATION_N_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `NOTICE_ID` int(11) NOT NULL,
  `NOTICE_SUBJECT` varchar(50) NOT NULL,
  `NOTICE_DATE` date NOT NULL,
  `NOTICE_DESCRIPTION` varchar(256) NOT NULL,
  `MEMBER_M_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`NOTICE_ID`, `NOTICE_SUBJECT`, `NOTICE_DATE`, `NOTICE_DESCRIPTION`, `MEMBER_M_ID`) VALUES
(4, 'Water Supply', '2023-02-06', 'This notice is to inform all the residents regarding the suspension of water supply for 8 hours. It is being done to clean the water tank. The details are as follows:\r\nDATE- Feb 6\r\nTIME- 10am – 6 pm\r\nThus, we request you to store the required amount of wat', NULL),
(6, 'Lost Bag', '2023-01-25', 'This is to inform all the readers that a plastic bag has been found in the neighbourhood park. It has a few documents and some cash in it. The plastic bag is red in colour and is medium-sized. It was found on Jan 27, at around 6pm near the fountain in the ', NULL),
(7, 'navratri celebration', '2023-02-06', 'notice regarding festival', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification1`
--

CREATE TABLE `notification1` (
  `N_ID` int(11) NOT NULL,
  `N_DATE` date NOT NULL,
  `N_DESC` varchar(45) NOT NULL,
  `MEMBER_M_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification1`
--

INSERT INTO `notification1` (`N_ID`, `N_DATE`, `N_DESC`, `MEMBER_M_ID`) VALUES
(20, '2023-02-10', 'Hello', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `P_ID` int(11) NOT NULL,
  `PAYMENT_ID` varchar(20) NOT NULL,
  `P_DATE` date NOT NULL,
  `P_TYPE` varchar(45) NOT NULL,
  `P_AMOUNT` int(11) NOT NULL,
  `MEMBER_M_ID` int(11) NOT NULL,
  `HOUSE_H_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`P_ID`, `PAYMENT_ID`, `P_DATE`, `P_TYPE`, `P_AMOUNT`, `MEMBER_M_ID`, `HOUSE_H_ID`) VALUES
(12, 'pay_LGyxrvVNCAMlqP', '2023-02-16', 'Maintenance', 2000, 2, 1),
(13, 'pay_LGz3MgWtxNYEQg', '2023-02-16', 'Maintenance', 2000, 2, 1),
(14, 'pay_LGz4TbNvDpkIje', '2023-02-16', 'Society Transfer Fee', 2000, 2, 1),
(16, 'pay_LHMjtNRaNdr0o5', '2023-02-17', 'Maintenance', 2000, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reply_complaint`
--

CREATE TABLE `reply_complaint` (
  `RC_ID` int(11) NOT NULL,
  `RC_DATE` date DEFAULT NULL,
  `RC_DESC` varchar(512) NOT NULL,
  `COMPLAINT_C_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reply_complaint`
--

INSERT INTO `reply_complaint` (`RC_ID`, `RC_DATE`, `RC_DESC`, `COMPLAINT_C_ID`) VALUES
(9, '2023-02-06', 'We will look into this.', 8),
(10, '2023-02-06', 'Solved by staff in shortly!', 9);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `R_ID` int(11) NOT NULL,
  `R_DESC` varchar(45) NOT NULL,
  `MEMBER_M_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ROLE_ID`, `ROLE_NAME`) VALUES
(1, 'Admin'),
(2, 'Member'),
(3, 'Security Person');

-- --------------------------------------------------------

--
-- Table structure for table `security_person`
--

CREATE TABLE `security_person` (
  `S_ID` int(11) NOT NULL,
  `S_F_NAME` varchar(45) NOT NULL,
  `S_USERNAME` varchar(45) NOT NULL,
  `S_PASSWORD` varchar(45) NOT NULL,
  `S_EMAIL` varchar(45) NOT NULL,
  `S_CONTACT` decimal(10,0) NOT NULL,
  `S_IMG` longblob DEFAULT NULL,
  `GUEST_G_ID` int(11) DEFAULT NULL,
  `ROLE_ROLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_person`
--

INSERT INTO `security_person` (`S_ID`, `S_F_NAME`, `S_USERNAME`, `S_PASSWORD`, `S_EMAIL`, `S_CONTACT`, `S_IMG`, `GUEST_G_ID`, `ROLE_ROLE_ID`) VALUES
(1, 'Harshil Prajapati', 'sp', 'sp', 'yashbhadani077@gmail.com', '9485678914', 0x5942202833292e6a7067, 1, 3),
(6, 'Yash Bhadani', 'yash', 'yash', 'logoy45529@lubde.com', '9487845211', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

CREATE TABLE `society` (
  `S_ID` int(11) NOT NULL,
  `S_NAME` varchar(45) NOT NULL,
  `ADDRESS` varchar(200) NOT NULL,
  `CITY` varchar(45) NOT NULL,
  `PINCODE` int(11) NOT NULL,
  `NO_HOUSE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`S_ID`, `S_NAME`, `ADDRESS`, `CITY`, `PINCODE`, `NO_HOUSE`) VALUES
(1, 'Karnavati Society', 'Sola Road, Near Paras Nagar,\r\nNaranpura, Ahmedabad.', 'Ahmedabad', 380063, 200);

-- --------------------------------------------------------

--
-- Table structure for table `timestamps`
--

CREATE TABLE `timestamps` (
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `G_DATE/TIME` datetime NOT NULL,
  `HOUSE_H_ID` int(11) NOT NULL,
  `GUEST_G_ID` int(11) NOT NULL,
  `SECURITY_PERSON_S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`C_ID`),
  ADD KEY `fk_COMPLAINTS_MEMBER1_idx` (`MEMBER_M_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EVENT_ID`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`E_ID`),
  ADD KEY `fk_EXPENSE_SOCIETY1_idx` (`SOCIETY_S_ID`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`G_ID`),
  ADD KEY `HOUSE_H_ID` (`HOUSE_H_ID`),
  ADD KEY `SP_ID` (`SP_ID`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`H_ID`),
  ADD UNIQUE KEY `H_NO` (`H_NO`),
  ADD KEY `fk_HOUSE_SOCIETY1_idx` (`SOCIETY_S_ID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`IMG_ID`),
  ADD KEY `fk_IMAGES_SOCIETY1_idx` (`SOCIETY_S_ID`),
  ADD KEY `fk_IMAGES_EVENT1_idx` (`EVENT_EVENT_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`M_ID`),
  ADD UNIQUE KEY `M_USERNAME_UNIQUE` (`M_USERNAME`),
  ADD KEY `fk_MEMBER_HOUSE1_idx` (`HOUSE_H_ID`),
  ADD KEY `fk_MEMBER_ROLE1_idx` (`ROLE_ROLE_ID`);

--
-- Indexes for table `member_has_notification`
--
ALTER TABLE `member_has_notification`
  ADD PRIMARY KEY (`MEMBER_M_ID`,`NOTIFICATION_N_ID`),
  ADD KEY `fk_MEMBER_has_NOTIFICATION_NOTIFICATION1_idx` (`NOTIFICATION_N_ID`),
  ADD KEY `fk_MEMBER_has_NOTIFICATION_MEMBER1_idx` (`MEMBER_M_ID`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`NOTICE_ID`),
  ADD KEY `fk_NOTICE_MEMBER1_idx` (`MEMBER_M_ID`);

--
-- Indexes for table `notification1`
--
ALTER TABLE `notification1`
  ADD PRIMARY KEY (`N_ID`),
  ADD KEY `MEMBER_M_ID` (`MEMBER_M_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `fk_PAYMENT_HOUSE1_idx` (`HOUSE_H_ID`),
  ADD KEY `fk_PAYMENT_MEMBER1_idx` (`MEMBER_M_ID`);

--
-- Indexes for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD PRIMARY KEY (`RC_ID`),
  ADD KEY `fk_REPLY_COMPLIANT_COMPLAINT1_idx` (`COMPLAINT_C_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `fk_REVIEW_MEMBER1_idx` (`MEMBER_M_ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `security_person`
--
ALTER TABLE `security_person`
  ADD PRIMARY KEY (`S_ID`),
  ADD UNIQUE KEY `S_USERNAME_UNIQUE` (`S_USERNAME`),
  ADD KEY `fk_SECURITY_PERSON_GUEST1_idx` (`GUEST_G_ID`),
  ADD KEY `fk_SECURITY_PERSON_ROLE1_idx` (`ROLE_ROLE_ID`);

--
-- Indexes for table `society`
--
ALTER TABLE `society`
  ADD PRIMARY KEY (`S_ID`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`HOUSE_H_ID`,`GUEST_G_ID`,`SECURITY_PERSON_S_ID`),
  ADD KEY `fk_HOUSE_has_GUEST_GUEST1_idx` (`GUEST_G_ID`),
  ADD KEY `fk_HOUSE_has_GUEST_HOUSE1_idx` (`HOUSE_H_ID`),
  ADD KEY `fk_HOUSE_has_GUEST_SECURITY_PERSON1_idx` (`SECURITY_PERSON_S_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `E_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `G_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `H_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `IMG_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `M_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `NOTICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notification1`
--
ALTER TABLE `notification1`
  MODIFY `N_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  MODIFY `RC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `security_person`
--
ALTER TABLE `security_person`
  MODIFY `S_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_COMPLAINTS_MEMBER1` FOREIGN KEY (`MEMBER_M_ID`) REFERENCES `member` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `fk_EXPENSE_SOCIETY1` FOREIGN KEY (`SOCIETY_S_ID`) REFERENCES `society` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`HOUSE_H_ID`) REFERENCES `house` (`H_ID`),
  ADD CONSTRAINT `guest_ibfk_2` FOREIGN KEY (`SP_ID`) REFERENCES `security_person` (`S_ID`);

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `fk_HOUSE_SOCIETY1` FOREIGN KEY (`SOCIETY_S_ID`) REFERENCES `society` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_IMAGES_EVENT1` FOREIGN KEY (`EVENT_EVENT_ID`) REFERENCES `event` (`EVENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IMAGES_SOCIETY1` FOREIGN KEY (`SOCIETY_S_ID`) REFERENCES `society` (`S_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_MEMBER_HOUSE1` FOREIGN KEY (`HOUSE_H_ID`) REFERENCES `house` (`H_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MEMBER_ROLE1` FOREIGN KEY (`ROLE_ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member_has_notification`
--
ALTER TABLE `member_has_notification`
  ADD CONSTRAINT `fk_MEMBER_has_NOTIFICATION_MEMBER1` FOREIGN KEY (`MEMBER_M_ID`) REFERENCES `member` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MEMBER_has_NOTIFICATION_NOTIFICATION1` FOREIGN KEY (`NOTIFICATION_N_ID`) REFERENCES `notification1` (`N_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notice`
--
ALTER TABLE `notice`
  ADD CONSTRAINT `fk_NOTICE_MEMBER1` FOREIGN KEY (`MEMBER_M_ID`) REFERENCES `member` (`M_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification1`
--
ALTER TABLE `notification1`
  ADD CONSTRAINT `notification1_ibfk_1` FOREIGN KEY (`MEMBER_M_ID`) REFERENCES `member` (`M_ID`);

--
-- Constraints for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD CONSTRAINT `fk_REPLY_COMPLIANT_COMPLAINT1` FOREIGN KEY (`COMPLAINT_C_ID`) REFERENCES `complaint` (`C_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
