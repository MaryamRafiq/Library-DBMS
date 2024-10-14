-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 12:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(255) NOT NULL,
  `Biography` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `AuthorName`, `Biography`) VALUES
(1, 'F. Scott Fitzgerald', 'American novelist and short story writer known for \"The Great Gatsby.\"'),
(2, 'George Orwell', 'English novelist and essayist, known for \"1984\" and \"Animal Farm.\"'),
(3, 'Jane Austen', 'English novelist known for works like \"Pride and Prejudice\" and \"Sense and Sensibility.\"');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `ISBN` varchar(13) NOT NULL,
  `PublishedYear` year(4) DEFAULT NULL,
  `CopiesAvailable` int(11) DEFAULT 0,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Title`, `AuthorID`, `ISBN`, `PublishedYear`, `CopiesAvailable`, `CategoryID`) VALUES
(11, 'The Great Gatsby', 1, '9780743273565', '1925', 5, 1),
(12, '1984', 2, '9780451524935', '1949', 3, 3),
(13, 'Pride and Prejudice', 3, '9780143106260', '0000', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(4, 'Fantasy'),
(1, 'Fiction'),
(5, 'Mystery'),
(2, 'Non-Fiction'),
(3, 'Science Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `FineID` int(11) NOT NULL,
  `LoanID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Paid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`FineID`, `LoanID`, `Amount`, `Paid`) VALUES
(10, 59, 10.00, 0),
(11, 78, 5.00, 0),
(12, 66, 15.00, 0),
(13, 61, 7.50, 0),
(14, 77, 12.00, 0),
(15, 71, 10.00, 0),
(16, 75, 5.00, 0),
(17, 63, 15.00, 0),
(18, 69, 7.50, 0),
(19, 72, 12.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `LoanID` int(11) NOT NULL,
  `BookID` int(11) DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `LoanDate` date DEFAULT curdate(),
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`LoanID`, `BookID`, `MemberID`, `LoanDate`, `ReturnDate`) VALUES
(59, 11, 1, '2024-01-10', '2024-10-14'),
(61, 13, 3, '2024-01-12', '2024-10-14'),
(63, 12, 5, '2024-01-14', '2024-10-14'),
(65, 12, 7, '2024-01-16', '2024-10-14'),
(66, 13, 8, '2024-01-17', '2024-10-14'),
(67, 11, 9, '2024-01-18', '2024-10-14'),
(68, 11, 10, '2024-01-19', '2024-10-14'),
(69, 11, 1, '2024-10-14', '2024-10-14'),
(70, 12, 2, '2024-10-14', '2024-10-14'),
(71, 13, 3, '2024-10-14', '2024-10-14'),
(72, 11, 4, '2024-10-14', '2024-10-14'),
(73, 13, 5, '2024-10-14', '2024-10-14'),
(74, 12, 6, '2024-10-14', '2024-10-14'),
(75, 12, 7, '2024-10-14', '2024-10-14'),
(76, 13, 8, '2024-10-14', '2024-10-14'),
(77, 11, 9, '2024-10-14', '2024-10-14'),
(78, 11, 10, '2024-10-14', '2024-10-14');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `JoinedDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`MemberID`, `Name`, `Email`, `Phone`, `JoinedDate`) VALUES
(1, 'Ali Raza', 'aliraza@gmail.com', '1234567890', '2023-01-15'),
(2, 'Sara Khan', 'sarakan@gmail.com', '2345678901', '2023-02-20'),
(3, 'Ayesha Malik', 'ayeshamalik@gmail.com', '3456789012', '2023-03-10'),
(4, 'Bilal Ahmed', 'bilalahmed@gmail.com', '4567890123', '2023-04-05'),
(5, 'Farah Iqbal', 'farahiqbal@gmail.com', '5678901234', '2023-05-15'),
(6, 'Omer Hussain', 'omerhussain@gmail.com', '6789012345', '2023-06-25'),
(7, 'Khadija Bibi', 'khadijabibi@gmail.com', '7890123456', '2023-07-30'),
(8, 'Usman Shah', 'usmanshah@gmail.com', '8901234567', '2023-08-18'),
(9, 'Tariq Javed', 'tariqjaved@gmail.com', '9012345678', '2023-09-12'),
(10, 'Nida Rehman', 'nidarehman@gmail.com', '0123456789', '2023-10-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`FineID`),
  ADD KEY `LoanID` (`LoanID`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `FineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `LoanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`LoanID`) REFERENCES `loans` (`LoanID`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
