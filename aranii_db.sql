-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 16, 2017 at 06:34 AM
-- Server version: 5.6.35-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aranii_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '785ead6d57ad');

-- --------------------------------------------------------

--
-- Table structure for table `crimes`
--

CREATE TABLE IF NOT EXISTS `crimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `crimes`
--

INSERT INTO `crimes` (`id`, `name`, `city`, `description`) VALUES
(1, 'ravi', 'Jaipur', 'Under Wold drug sumglling'),
(2, 'sai', 'nskak', 'Bank Roberry'),
(3, 'aditya', 'Jaipur', 'Pick Pocket'),
(4, 'lokesh', 'Jaipur', 'illigal export'),
(5, 'deepak', 'jaipur', 'cheating');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE IF NOT EXISTS `donation` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `name`, `phone`, `email`, `address`, `description`, `date`) VALUES
(7, 'Neeraj Kumar', '9541247896', 'sandy123@xyz.com', 'Chhapra Bihar', 'I want to donate 1lakh rupees ! Call me ', '0000-00-00 00:00:00'),
(8, 'Ashu Bhardwaj', '0993925563', 'sandy123@xyz.com', 'MNIT', 'hello !!!!!!', '2016-12-21 05:02:56'),
(9, 'Nidhi Soni', '9939255638', 'iamvermaabhishek@gmail.com', 'C/O Sushila Bahvan ,near Transformer, Immamganj', 'Strong Youth is a promise to our stronger future so we promise to transform the generation nowâ€™ to be better skilled, better trained with the best of capabilities in their respective disciplines.\r\n\r', '2016-12-21 05:41:58'),
(10, 'Deepesh', '9888888888', 'rahulkumar2410rj@gmail.com', 'hostel 1, MNIT jaipur', 'YoOOOO!!!!!!!!!!!!!!!!11', '2017-01-17 07:31:24'),
(11, 'XXXXX XXXXX', '9999999999', 'XXXXX@gmail.com', 'XXXXXXXXXX', 'XXXXXXXXXXX', '2017-01-17 08:31:36'),
(12, 'asd', '8745', 'adsf@m.com', 'afsdg', 'fsdghfds', '2017-01-17 09:53:20'),
(13, 'Rohit singh', '9672421899', '2014ucp1641@mnit.ac.in', 'Hostel 3 MNIT', 'I want to donate 2lacs rupees ! Contact me', '2017-01-17 09:55:45'),
(14, 'Bbbb', '888888888', 'bbb@bb.com', 'Bbbb', 'Bbbbbbn', '2017-01-22 03:09:27'),
(15, 'preeti', '9898989898', 'ppppp@jjj.com', 'ppppppppppp', 'ppppppppppppppppp', '2017-01-22 04:37:14'),
(16, 'ZZZZZZZZZZZ', '9898989898', 'ZZZZZZZZ@Z.com', 'ZZZZZZZZZ', 'ZZZZZZZZZZZZ', '2017-01-22 05:25:48'),
(17, 'CCCCCCCCC', '9854789658', 'CCC@c.com', 'CCCCCCC', 'CCCCCCCCCCC', '2017-01-22 06:07:04'),
(18, 'Vijay', '957485478', 'vj@ggg.com', 'MNIT hostel 2', 'I want to donate old clothes', '2017-01-22 06:30:08'),
(19, 'Manish Patki', '9766612938', 'manishpatki007@gmail.com', 'MNIT hostel 5', 'Hello World !', '2017-01-23 01:56:28'),
(20, 'DROP tables donation', '123', 'a@b.com', 'blah', 'test', '2017-04-26 13:15:14'),
(22, 'Raushan', '8874512547', 'kk@gm.com', 'MNIT', 'i want to donate clothes', '2017-04-26 13:18:46'),
(23, 'cjbscjbsc', '9844578458', 'aajcbaj@hdguw.chjwd', 'kjckwe', 'bwbkwbckwje', '2017-04-26 13:22:58'),
(24, 'cjbscjbscd jdbj', '9844578458', 'aajcbaj@hdguw.chjwd', 'kjckwebjdbkwdj', 'AAAAAAAAAAAAAAA', '2017-04-26 13:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `journey`
--

CREATE TABLE IF NOT EXISTS `journey` (
  `source` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `day` varchar(50) NOT NULL,
  `departure` varchar(50) NOT NULL,
  `arrival` varchar(50) NOT NULL,
  KEY `source` (`source`),
  KEY `destination` (`destination`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journey`
--

INSERT INTO `journey` (`source`, `destination`, `tid`, `distance`, `day`, `departure`, `arrival`) VALUES
(0, 2, 501, 900, 'monday', '10:30', '23:50'),
(0, 3, 500, 1600, 'monday', '1:30', '14:30'),
(1, 3, 504, 600, 'saturday', '15:00', '22:00'),
(3, 0, 503, 750, 'friday', '6:00', '20:00'),
(3, 2, 503, 700, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `password`) VALUES
(8, 'ravi', 'ravi'),
(11, 'manoj', 'manoj'),
(12, 'aneesh', 'aneesh'),
(13, 'sgupta', 'sgupta'),
(14, 'siva', 'siva');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `ans` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `ans`, `video_id`) VALUES
(26, 'Who is PM of india?', 'Narendra Modi', 'Manmohan singh', 'Pranav Mukherjeeâ€‹', 'None', 1, 17),
(9, '1. What was the name of the king?', 'Somavarma', 'Somnath', 'Tejsingh', 'Veerpratab', 1, 22),
(10, 'Whom did the minister set free?', 'Bear', 'Deer', 'Elephant', 'Horse', 2, 22),
(11, 'Where did the deer go?', 'In search of food\r\n', 'In jungle', 'In search of water', 'In cave', 3, 22),
(12, 'What did the minister fed the deer?', 'Apple', 'Salt\r\n', 'Banana', 'Sugar', 2, 22),
(13, 'The king was _______________.\r\n\r\n\r\n', 'Drunk', 'Hungry', 'Familiar', 'Thirsty', 4, 22),
(14, '9. The minister was not ____________ with the forest.\r\n\r\n', 'Caught', 'Wisdom', 'Marvellous ', 'Familiar', 4, 22),
(15, 'The king got __________.', 'Shelter', 'Milk\r\n', 'Water', 'Food', 3, 22),
(16, '1. Who did not like Ritu?\r\n\r\n\r\n', 'Seema', 'Seema’s father', 'Villagers', 'None', 1, 21),
(17, '2. Where did Seema take her cows and buffaloes?', 'Farm', 'Jungle', 'River side', 'Home\r\n', 2, 21),
(18, '3. What attacked Seema?\r\n\r\n\r\n', 'Ritu', 'Tiger\r\n', 'Wolf', 'Python', 4, 21),
(19, '4. Who saved Seema?', 'Cow\r\n', 'Ritu', 'Father\r\n', 'Mother', 2, 21),
(20, '5. What award did Ritu get?\r\n\r\n\r\n\r\n', 'Dance ', 'Best friend', 'Bravery', 'None', 3, 21),
(21, 'Why were there tears in Seema’s eyes?\r\n', 'She was happy', 'She was sorry', 'She was sad', 'She was hurt', 2, 21),
(22, '7. Don’t ____________ I am always with you.\r\n', 'Worry\r\n', 'Fight', 'Fast ', 'Sorry\r\n', 1, 21),
(23, 'Maharana Pratap is known for his ____________ all over the country.\r\n\r\n\r\n\r\n', 'Power', 'bravery', 'Army', 'None', 2, 21),
(24, 'Saroj got an __________ in the drawing competition in our school.\r\n\r\n\r\n\r\n', 'Award', 'Flower', 'Box', 'Chocolate', 1, 21),
(25, 'Choose the correct option by arranging the jumbled letters: aawy.\r\n\r\n', 'Waya', 'Yaaw\r\n', 'Away\r\n', 'Waaay', 3, 21);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `video_id` varchar(20) NOT NULL,
  `video_name` varchar(20) NOT NULL,
  `score` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`int`, `student_id`, `video_id`, `video_name`, `score`, `total`) VALUES
(1, 7, '123456', 'hello', 5, 10),
(2, 7, '1234567', 'hello2', 7, 10),
(3, 7, '1', 'TEST 1', 2, 6),
(4, 1, '17', 'CH04', 1, 2),
(5, 1, '22', 'CH03', 5, 7),
(6, 28, '22', 'CH03', 6, 7),
(7, 28, '16', 'CH04', 0, 0),
(8, 28, '17', 'CH04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`sid`, `sname`) VALUES
(0, 'delhi'),
(1, 'mumbai'),
(2, 'jaipur'),
(3, 'kolkata');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fathername` varchar(50) NOT NULL,
  `standard` int(11) NOT NULL,
  `roll` varchar(20) NOT NULL,
  `dob` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `fathername`, `standard`, `roll`, `dob`) VALUES
(1, 'Rohit Kumar', 'Devendra ram', 3, '11', '11/04/1996'),
(4, 'siva', 'dad', 6, 'jakak', '26/07/1996'),
(3, 'sai', 'dad', 6, 'kakak', '646644'),
(5, 'adi', 'dad', 5, 'jajaj', '56/85/8663'),
(18, 'Abhishek', 'Sri Ram', 6, '32', '24/04/12'),
(7, 'Aditya', 'siva', 3, '5nj', '11/02/1996'),
(8, 'siva', 'dad', 6, 'text', ''),
(9, 'siva', 'dad', 5, 'jaja', '12/32/85'),
(10, 'll', 'll', 2, '12', '12'),
(11, 'Bala pavan', 'Murali', 12, 'Sc80901509542', '10/02/1997'),
(13, 'slakk', 'jsjwi', 6, '65', '12/85/84'),
(14, 'rohit', 'kkkkk', 5, '142', '11/04/96'),
(15, 'siva', 'nsnajja', 5, '76', '12/12/15'),
(2, 'Abhishek', 'Laxman Das', 4, '8', '4/4/2005'),
(28, 'Ajay meena', 'Hari Prasad Meena', 3, '20', '10/02/2010'),
(24, 'Rohit kumar', 'Neeraj Yadav', 4, '17', '12/05/2012'),
(25, 'Neha Kumari', 'Jai Sharma', 4, '18', '11/02/2012');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `standard` int(10) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `standard`, `teacher_id`) VALUES
(1, 'Hindi', 3, 19),
(2, 'hindi', 4, 11),
(3, 'hindi', 5, 21),
(7, 'english', 3, 17),
(8, 'english', 4, 18),
(9, 'english', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `standard` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `standard`) VALUES
(17, 'Shiv Kumar', 3),
(18, 'Girdhari Singh', 4),
(19, 'Sunil Sharma', 3),
(20, 'Vinita gupta', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Token` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `Token`) VALUES
(7, 'dEm0mCx1aCg:APA91bEsWMfCn5PAklSuPk1zMDCXkONdKfXp8Z5IaoyCi23WFIBK4Xh4pOPAgtX_8sHNPjGMKLO0EKpZmOj5TX4B8GXmW9TVzz7zocizR_rXLuzj_zLnrGIOcMUpjkvYrcqu2_cQhWpb'),
(6, 'c1ube6DBYFE:APA91bEG6MDAjyf72jMDMreSD_f-eZq_zTuBOgdwF3cM0Gx5nPgTj8D54oKA9t1a7bBSPS2YQEcGlGez8rbzHq2FLPCWPSBNT45cQQWFuLT3emHTaHU4aTWslHf1VOwaBpdrN4o9YUCr'),
(8, 'cN7H4RTzSsk:APA91bFWB6lNmFpt5INdEo_CyxF_ZFiIy41nzxbfEYDu48aNC5KUkin_egoG8D-fcCmlNGujyTJk1fEH_MLCo2aDZmQpZwUl85Rdc9Z8mJgnNBXePtW74j8lW0yjPNbpuz2lx_tFicq5'),
(9, 'djLXgw44YhE:APA91bGPfhYIFQz0r5HZ4uhvfl5j-31xkQLqwr4FP5e238C4vzf7gpNLPkB7VS98osxVXWrbhdyEINW2Vg8gKFNNYnuHdct5j8IziwcsY6ya1G9jyhnQHC77l0ZWPFS8fgEtwerBUkMX'),
(10, 'dO42k_OmzBw:APA91bF8DRon1Hcoml4GYVD_I-pUgwt-UmDNwf1ikZd7YZIv1j9w14ZIbyr_7U1LEvhLSmlfK5rNRXw115BDxr5sUQ7yw61uXs-f8yqQF0oLHh8CGMOqqnZAa1LM_1bCdSwecAG-K-bP'),
(11, 'eDicnLtX3o0:APA91bF_lnZc7PxYm2-YHlXS1e6iTyZiJ1_w5nayarSLBT-xQtkOmeg8hcCxHAErsZ-uYm15pDLvZVBn_r7Ey09ysgHXtQioEtKrQB-LDBHLVGZ-hdnFzRqTvpn_MGbWqAlHCa7Y5y8S'),
(12, 'ebVCxkIg3ic:APA91bF7O6181a46Ar8xhK6hOMI_5rDaaz7pVMv4QE9CYMjucsMoFl8dQcMuU2QHDH8n1dpOYEkb7V92_mYoqStpsQ88nXms_mTc6RNV6uKw0RErjYhhlnU6_f9Tv2o51nAsLasTw0Os'),
(13, 'eX3MNuV5f-c:APA91bFHtaWXg3mIASsX09pX4tUO5h4w9w0TAJay9zmv9HodQvaNi76igbWCMu_WPrGUVWwP0caTIhPeYNb_VgcixoKk7V3entd_qAZBST_RZStzRhxmXz_-Lnuz-GKsCenjKEkAr431'),
(14, 'eUagw6MBYY8:APA91bHpLV3jpbBh6XF6KbJ-1DmH0HAtbG9LUozvRD6dhBz1GT6IUpeYv-psjYm3UFjMxWSC1rbrwq4-wx3bwKWmHNuxFwLkIzDlBdnyG-qzZ7VLc2uTJMPg-MGOedyfTAn-8CCrUCHB'),
(15, 'fLaEzfwtO0g:APA91bFMXrDqx0uxM3yx2AvUZAtFEY94OkZrDCySFFk45d8XcOSG9h5WJXNHe3bRd3hGFjLRhf-rfE1cSYh7jAId3Tdf6Y5E8RpuvV4Rqbh-DsnWGVCinUpB1ZoXXEVGFIKCWPD0ybRG'),
(16, 'fRq5Xwldt-8:APA91bEVL-7mYr4TkIzEX8Ob_2IESTaRJStSKrj7KC-Nl6e8o2PxKToVKZXCtsPmHmVRyk8VUkZ8w83kqQWa9ONHx-4iWHH2WrKYKKVAWrMzSU1P2kg0t3UBsowun3CniZxHI1kf4JxB'),
(17, 'eIiWO36AnwE:APA91bFcBu1Vv5xRkapa6zvSsEjIi1QmnVPjkmFX9eWzlkh9uX5ZTpUKPWCyQQBTc3dKKVehpvBqg9d6l700Af8EtiHJ5kPthn_zp1pn40IFAg-EsRAbWaH9plfo7PSZwJgn6Keox4-l'),
(18, 'enLFGkrtqS4:APA91bHsroFaFm0RRNMP2_6LXFbqlRDeA5zDYqsndFrYz_EsbgGGrMzW44GZ9RkrrmC6AyQ4Ek-2gnM4jjQc22Y8ghMCUWctmikTMKHaWBRPQxskjp8cL5Dnp6FRWILtyLAu71IBKnx-'),
(19, 'c6VdG-11aDk:APA91bGFSqWPVjLpK4_0Ep2LrSUjknc48T8Q5peblCa2R7FDZ3Qh1yMx4qt4nl2P3GGHVonusIZH57JC0S-rFQmy25VdJhVUIdC1HUDir8l7Hu5pG6kZotHt1TNnTRgrjL9Sie94U5gw'),
(20, 'c75IC_jlnTk:APA91bHofBks3y8LmxrVZd9K4lYTZo0Hlv5EZVC2gQcsJfSi76OgpSffhjW2gJBQxhCqMEK6s3xvr-IZ9FMm8bDtT83bSAmzn7LCszy_Ray3Wna-ZbJ8pQhXBsixUo630KubQbNlop_C'),
(21, 'fFNFsCCbeCA:APA91bEtFAPDWERq6Q9ly3q_Q7f30KlX_EtULDRQHoTvuOuwTa-ADyw3eDMFJpkFAr97xqtuq68730UwCKeY9aeaBFg0-lu00P_3qI2IWjcfmGfGikKOFCyb-HbAYYpIeGqwxjiwI6xa'),
(22, 'fzyEKLvSeqI:APA91bGdPi399YkF21wRduktJnv7eMQPcKkge8Cm1wu_dzd1a-kXe3XdBFMiLynmKVRjFTtIBdkTuGc2w_kGd5oSYlPnhuI6Dcoxdva0jnOzpy6RZyBPC-H1get5XkSlmJ_sVVpaNKYO'),
(23, 'c5siaMws7uM:APA91bEwHwu9xvyyuNjW10a5Cfm0zaBHOmex8Xv2fuq4g7W67qvzjnXpeeN_bKVqS61YyzU6ryQBOJdaFxCNPWGZU8FuLmiXcEXJE188AV8R3qPRBs9l_2qI_1GVJWPrq3-XCBgbiIr6'),
(24, 'ch4wHE8Gr-s:APA91bEt-s0qEAQcvn-YCmansOd0IQSgUHJ2nZmxjUHKRkbAotrTOPYeyklOkolsY21Hy9yqnf4fZDJDaWgenBurvOn3FqAj89dkeM8WomENPS0Rk9P-R-HFdwPLi3e_S2P292cWXgWK'),
(25, 'doDftIBY1e4:APA91bE0EIUBscP5BjlMCRr-BJRgglu485NiZgdhvqs_KHfm9UZFWAC1T6LrlEN8kENyz7vdbKWs4dzOnoB6Vei_9T4-ATDEpNolgxWnu4qhJj9AbaYQXzfz6KPXlfNw0KHUdI-72eXl'),
(26, 'eiHN4CzTCb8:APA91bHpGtaOJWu-re-Gmrc3f27WugXiv13nL-kVTlUojWXRgoms-1s-dFPbOAtNgeIONO4bpsrMzWZE7ActvcmbaTIgg4EuU19RulCe-WkT_jW-ahaAHcLEyRN5gAtfu_FWZuaU0P8L');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE IF NOT EXISTS `train` (
  `tid` int(11) NOT NULL,
  `tname` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`tid`, `tname`) VALUES
(500, 'rajdhani'),
(501, 'shatabdi'),
(503, 'vaishali_express'),
(504, 'toofan_express');

-- --------------------------------------------------------

--
-- Table structure for table `user2`
--

CREATE TABLE IF NOT EXISTS `user2` (
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `q1` varchar(255) NOT NULL,
  `q2` varchar(255) NOT NULL,
  `q3` varchar(255) NOT NULL,
  `q4` varchar(255) NOT NULL,
  `q5` varchar(255) NOT NULL,
  `q6` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`q1`, `q2`, `q3`, `q4`, `q5`, `q6`) VALUES
('men', 'ad', 'sa', 'adityagannavarapu.67@gmail.com', '2', '345'),
('men', 'as', 'as', 'adityagannavarapu.67@gmail.com', '12', '123456'),
('men', 'as', 'as', 'ssd.v@ds.vd', '22', '34'),
('men', 'a', 'a', 'adityagannavarapu.67@gmail.com', '1', '12345'),
('men', 'd', 'a', 'adityagannavarapu.67@gmail.com', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `watch_id` varchar(20) NOT NULL,
  `url` varchar(100) NOT NULL,
  `subject_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`, `watch_id`, `url`, `subject_id`) VALUES
(16, 'CH04', 'jIC3Gg63ouw', 'https://i.ytimg.com/vi/jIC3Gg63ouw/1.jpg', '7'),
(17, 'CH04', 'XUVXP5UUMLo', 'https://i.ytimg.com/vi/XUVXP5UUMLo/2.jpg', '1'),
(18, 'CH03', 'LtKces_48v0', 'https://i.ytimg.com/vi/LtKces_48v0/1.jpg', '1'),
(19, 'CH03', 'sRYW36mmLdM', 'https://i.ytimg.com/vi/sRYW36mmLdM/1.jpg', '2'),
(20, 'CH04', '14ZhZaDK9ok', 'https://i.ytimg.com/vi/14ZhZaDK9ok/1.jpg', '2'),
(21, 'CH03', 'RfPMA4eX1YY', 'https://i.ytimg.com/vi/RfPMA4eX1YY/2.jpg', '8'),
(22, 'CH03', 'Wvabmk71r3w', 'https://i.ytimg.com/vi/Wvabmk71r3w/2.jpg?time=1499626709694', '7');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journey`
--
ALTER TABLE `journey`
  ADD CONSTRAINT `journey_ibfk_1` FOREIGN KEY (`source`) REFERENCES `station` (`sid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `journey_ibfk_2` FOREIGN KEY (`destination`) REFERENCES `station` (`sid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `journey_ibfk_3` FOREIGN KEY (`tid`) REFERENCES `train` (`tid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
