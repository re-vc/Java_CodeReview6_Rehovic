-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Dez 2020 um 23:41
-- Server-Version: 10.4.16-MariaDB
-- PHP-Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr7_peter`
--
CREATE DATABASE IF NOT EXISTS `cr7_peter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr7_peter`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `classes`
--

INSERT INTO `classes` (`id`, `name`) VALUES
(1, 'Mathematics'),
(2, 'Enlgish'),
(3, 'Physics'),
(4, 'History'),
(5, 'Sports');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `fk_student_id` int(11) NOT NULL,
  `fk_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `enrollment`
--

INSERT INTO `enrollment` (`id`, `fk_student_id`, `fk_class_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 3),
(5, 3, 2),
(6, 3, 1),
(7, 4, 2),
(8, 5, 2),
(9, 6, 2),
(10, 5, 2),
(11, 6, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `email`) VALUES
(1, 'A', 'Tom', 'Atom@gmail.com'),
(2, 'B', 'Ion', 'Bion@gmail.com'),
(3, 'C', 'Vee', 'Cvee@gmail.com'),
(4, 'D', 'Eo', 'Deo@gmail.com'),
(5, 'E', 'Lf', 'Elf@gmail.com'),
(6, 'F', 'Euer', 'Feuer@gmail.com'),
(7, 'G', 'Ans', 'Gans@gmail.com'),
(8, 'H', 'I', 'Hi@gmail.com'),
(9, 'I', 'Sland', 'Island@gmail.com'),
(10, 'J', 'Ulien', 'Julien@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `surname`, `email`) VALUES
(1, 'T-1', 'Weiss', 'weiss@gmail.com'),
(2, 'T-2', 'Schwarz', 'schwarz@gmail.com'),
(3, 'T-3', 'Baker', 'baker@gmail.com'),
(4, 'T-4', 'Smith', 'smith@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachersclassesrelation`
--

CREATE TABLE `teachersclassesrelation` (
  `id` int(11) NOT NULL,
  `fk_teacher_id` int(11) NOT NULL,
  `fk_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teachersclassesrelation`
--

INSERT INTO `teachersclassesrelation` (`id`, `fk_teacher_id`, `fk_class_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_id` (`fk_student_id`),
  ADD KEY `fk_class_id` (`fk_class_id`);

--
-- Indizes für die Tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_id` (`fk_teacher_id`),
  ADD KEY `fk_class_id` (`fk_class_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`fk_student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`fk_class_id`) REFERENCES `classes` (`id`);

--
-- Constraints der Tabelle `teachersclassesrelation`
--
ALTER TABLE `teachersclassesrelation`
  ADD CONSTRAINT `teachersclassesrelation_ibfk_1` FOREIGN KEY (`fk_teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `teachersclassesrelation_ibfk_2` FOREIGN KEY (`fk_class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
