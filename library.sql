-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:15
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `isbn` int(11) DEFAULT NULL,
  `author_list_ID` int(11) DEFAULT NULL,
  `article_list_id` int(11) DEFAULT NULL,
  `article_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_list`
--

CREATE TABLE `article_list` (
  `article_list_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `referenced_article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_list_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_list`
--

CREATE TABLE `author_list` (
  `author_list_id` int(11) NOT NULL,
  `isbn` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `isbn` int(11) NOT NULL,
  `shelf_nr` int(11) DEFAULT NULL,
  `author_list_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `copies` int(11) DEFAULT NULL,
  `stock_nr` int(11) DEFAULT NULL,
  `translation_template` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `borrowing`
--

CREATE TABLE `borrowing` (
  `borrowing_nr` int(11) NOT NULL,
  `isbn` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date_lending` date DEFAULT NULL,
  `date_return` date DEFAULT NULL,
  `employee_lending` int(11) DEFAULT NULL,
  `employee_return` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `personal_id` int(11) NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `bank_information` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `isbn` int(11) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `shelf_nr` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `issue` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keyword` varchar(32) NOT NULL,
  `subject_area_ID` int(11) DEFAULT NULL,
  `relevance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishing_house`
--

CREATE TABLE `publishing_house` (
  `publisher_id` int(11) NOT NULL,
  `companyName` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_nr` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `loan` double DEFAULT NULL,
  `reservation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelf`
--

CREATE TABLE `shelf` (
  `shelf_nr` int(11) NOT NULL,
  `subject_area_id` int(11) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` int(11) NOT NULL,
  `keyword` varchar(32) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `synonym_list`
--

CREATE TABLE `synonym_list` (
  `keyword` varchar(32) NOT NULL,
  `synonym` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `author_list_ID` (`author_list_ID`),
  ADD KEY `article_list_id` (`article_list_id`);

--
-- Indizes für die Tabelle `article_list`
--
ALTER TABLE `article_list`
  ADD PRIMARY KEY (`article_list_id`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `author_list_id` (`author_list_id`);

--
-- Indizes für die Tabelle `author_list`
--
ALTER TABLE `author_list`
  ADD PRIMARY KEY (`author_list_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `shelf_nr` (`shelf_nr`),
  ADD KEY `author_list_id` (`author_list_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indizes für die Tabelle `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`borrowing_nr`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_lending` (`employee_lending`),
  ADD KEY `employee_return` (`employee_return`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`personal_id`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `shelf_nr` (`shelf_nr`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword`),
  ADD KEY `subject_area_ID` (`subject_area_ID`);

--
-- Indizes für die Tabelle `publishing_house`
--
ALTER TABLE `publishing_house`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_nr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `isbn` (`isbn`);

--
-- Indizes für die Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_nr`),
  ADD KEY `subject_area_id` (`subject_area_id`);

--
-- Indizes für die Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`);

--
-- Indizes für die Tabelle `synonym_list`
--
ALTER TABLE `synonym_list`
  ADD PRIMARY KEY (`keyword`,`synonym`),
  ADD KEY `synonym` (`synonym`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `journal` (`isbn`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`author_list_ID`) REFERENCES `author_list` (`author_list_id`),
  ADD CONSTRAINT `article_ibfk_3` FOREIGN KEY (`article_list_id`) REFERENCES `article_list` (`article_list_id`);

--
-- Constraints der Tabelle `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`author_list_id`) REFERENCES `author_list` (`author_list_id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`shelf_nr`) REFERENCES `shelf` (`shelf_nr`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`author_list_id`) REFERENCES `author_list` (`author_list_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publishing_house` (`publisher_id`);

--
-- Constraints der Tabelle `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `borrowing_ibfk_3` FOREIGN KEY (`employee_lending`) REFERENCES `employee` (`personal_id`),
  ADD CONSTRAINT `borrowing_ibfk_4` FOREIGN KEY (`employee_return`) REFERENCES `employee` (`personal_id`);

--
-- Constraints der Tabelle `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishing_house` (`publisher_id`),
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`shelf_nr`) REFERENCES `shelf` (`shelf_nr`);

--
-- Constraints der Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`subject_area_ID`) REFERENCES `subject_area` (`subject_area_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`);

--
-- Constraints der Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD CONSTRAINT `shelf_ibfk_1` FOREIGN KEY (`subject_area_id`) REFERENCES `subject_area` (`subject_area_id`);

--
-- Constraints der Tabelle `synonym_list`
--
ALTER TABLE `synonym_list`
  ADD CONSTRAINT `synonym_list_ibfk_1` FOREIGN KEY (`keyword`) REFERENCES `keyword` (`keyword`),
  ADD CONSTRAINT `synonym_list_ibfk_2` FOREIGN KEY (`synonym`) REFERENCES `keyword` (`keyword`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
