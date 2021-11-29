-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Lis 2021, 22:05
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rental`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `archive`
--

CREATE TABLE `archive` (
  `ID` int(11) NOT NULL,
  `car_ID` int(11) NOT NULL,
  `client_ID` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` enum('IN_PROCESS','ACCEPTED','REJECTED','') COLLATE utf8_polish_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `archive`
--

INSERT INTO `archive` (`ID`, `car_ID`, `client_ID`, `start_time`, `end_time`, `status`, `timestamp`) VALUES
(1, 1, 1, '2021-11-29 19:35:36', '2021-11-30 19:35:36', 'ACCEPTED', '2021-11-28 18:36:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars`
--

CREATE TABLE `cars` (
  `ID` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `year` int(11) NOT NULL,
  `condition` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `mileage` float NOT NULL,
  `vin_num` varchar(17) COLLATE utf8_polish_ci NOT NULL,
  `register_num` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `cars`
--

INSERT INTO `cars` (`ID`, `brand`, `model`, `year`, `condition`, `mileage`, `vin_num`, `register_num`, `color`, `img`, `price`) VALUES
(1, 'Opel', 'Astra', 2002, 'used', 200000, 'WVGZZZ5NZ8W031284', 'G0 ABEX', 'red', 'https://img.chceauto.pl/opel/astra/opel_astra_sedan_242_231_v1.jpg', 75),
(3, 'Skoda', 'Octavia', 2021, 'new', 5, 'WBGZZA52Z8W031284', 'KR ABED', 'black', 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6Imxscm9pOWQ2Z3h3MS1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.u1I7Gct-egUX9kjAhQj-NwEgeheZTlEz1wqGf6Mdxhw/image;s=1080x720', 200),
(4, 'BMW', 'E46', 2007, 'used', 40000, 'ABCZZA52Z8W031284', 'KR KOXU', 'silver', 'https://www.wyborkierowcow.pl/wp-content/uploads/2020/05/BMW-serii-3-E46-20.jpg', 150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservations`
--

CREATE TABLE `reservations` (
  `ID` int(11) NOT NULL,
  `car_ID` int(11) NOT NULL,
  `client_ID` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` enum('IN_PROCESS','ACCEPTED','REJECTED','') COLLATE utf8_polish_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `reservations`
--

INSERT INTO `reservations` (`ID`, `car_ID`, `client_ID`, `start_time`, `end_time`, `status`, `timestamp`) VALUES
(2, 1, 13, '2021-11-30 10:00:00', '2021-12-01 15:00:00', 'ACCEPTED', '2021-11-29 21:02:23'),
(3, 3, 14, '2021-12-15 22:02:32', '2021-11-17 10:00:00', 'IN_PROCESS', '2021-11-29 21:04:08');

--
-- Wyzwalacze `reservations`
--
DELIMITER $$
CREATE TRIGGER `ARCHIVE` AFTER DELETE ON `reservations` FOR EACH ROW INSERT INTO archive (car_ID, client_ID, start_time, end_time, status, timestamp) VALUES (old.car_ID, old.client_ID, old.start_time, old.end_time, old.status, old.timestamp)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `ID` int(1) NOT NULL,
  `role` varchar(32) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`ID`, `role`) VALUES
(0, 'client'),
(1, 'moderator'),
(2, 'administrator');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `login` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `role` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`ID`, `login`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$Rvgl6mrQ.uQ8t9Ako7xT8.M4xF8X7OuM2rni2oKnnBihUOlVS4cju', 2),
(13, 'test1', '$2y$10$wTkMRF01zr/AixONkLSjP.6Z6nNMDR/54ygw10Omez4/9r4lalwXu', 0),
(14, 'test2', '$2y$10$PzVHFx0ggZBZM0iUDv49J.tkvW6c1HVjBOBJzTqd6kCKz6JJubHtu', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `timestamp` (`timestamp`),
  ADD UNIQUE KEY `status` (`status`),
  ADD KEY `car_KEY` (`car_ID`),
  ADD KEY `client_KEY` (`client_ID`),
  ADD KEY `end_time` (`end_time`);

--
-- Indeksy dla tabeli `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `register_num` (`register_num`) USING BTREE,
  ADD UNIQUE KEY `vin_num` (`vin_num`) USING BTREE,
  ADD KEY `brand` (`brand`),
  ADD KEY `state` (`condition`) USING BTREE;

--
-- Indeksy dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `timestamp` (`timestamp`),
  ADD UNIQUE KEY `status` (`status`),
  ADD KEY `car_KEY` (`car_ID`),
  ADD KEY `client_KEY` (`client_ID`),
  ADD KEY `end_time` (`end_time`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `role` (`role`),
  ADD KEY `login` (`login`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `archive`
--
ALTER TABLE `archive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `cars`
--
ALTER TABLE `cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

DELIMITER $$
--
-- Zdarzenia
--
CREATE DEFINER=`root`@`localhost` EVENT `UPDATE_RESERVATIONS` ON SCHEDULE EVERY 15 MINUTE STARTS '2021-11-28 19:07:31' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM reservations WHERE reservations.end_time < now()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
