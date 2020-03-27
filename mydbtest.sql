-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Feb 2020 um 19:51
-- Server-Version: 10.1.40-MariaDB
-- PHP-Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mydbtest`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adresse`
--

CREATE TABLE `adresse` (
  `adresseid` bigint(20) NOT NULL,
  `kundeid` bigint(20) NOT NULL,
  `adressenr` int(11) NOT NULL,
  `strasse` varchar(255) NOT NULL,
  `hausnummer` varchar(10) NOT NULL,
  `adresszusatz` varchar(255) DEFAULT NULL,
  `plz` varchar(10) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `land` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bankverbindung`
--

CREATE TABLE `bankverbindung` (
  `bankverbindungid` bigint(20) NOT NULL,
  `kundeid` bigint(20) NOT NULL,
  `bankverbindungnr` int(11) NOT NULL,
  `iban` varchar(30) NOT NULL,
  `bic` varchar(15) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kontoinhaber` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gebuehr`
--

CREATE TABLE `gebuehr` (
  `gebuehrid` bigint(20) NOT NULL,
  `grundgebuehr` int(11) NOT NULL,
  `einsatzprotipp` int(11) NOT NULL,
  `einsatzspiel77` int(11) NOT NULL,
  `einsatzsuper6` int(11) NOT NULL,
  `gueltigab` datetime DEFAULT NULL,
  `gueltigbis` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gewinnklasse`
--

CREATE TABLE `gewinnklasse` (
  `gewinnklasseid` bigint(20) NOT NULL,
  `spielid` bigint(20) NOT NULL,
  `gewinnklassenr` int(11) NOT NULL,
  `bezeichnunglatein` varchar(5) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `isabsolut` tinyint(1) NOT NULL,
  `betrag` bigint(20) DEFAULT NULL,
  `gueltigab` datetime DEFAULT NULL,
  `gueltigbis` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gewinnklasseziehungquote`
--

CREATE TABLE `gewinnklasseziehungquote` (
  `gewinnklasseziehungquoteid` bigint(20) NOT NULL,
  `anzahlgewinner` int(11) NOT NULL,
  `gewinnklasseid` bigint(20) NOT NULL,
  `ziehungid` bigint(20) NOT NULL,
  `quote` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `group_desc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jackpot`
--

CREATE TABLE `jackpot` (
  `jackpotid` bigint(20) NOT NULL,
  `ziehungid` bigint(20) NOT NULL,
  `anzahlziehungen` int(11) NOT NULL,
  `betrag` bigint(20) NOT NULL,
  `gewinnklasseid` bigint(20) NOT NULL,
  `betragkumuliert` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `kundeid` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `vorname` varchar(255) DEFAULT NULL,
  `guthaben` bigint(20) DEFAULT NULL,
  `dispo` bigint(20) DEFAULT NULL,
  `gesperrt` datetime DEFAULT NULL,
  `isannahmestelle` tinyint(1) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lottoschein`
--

CREATE TABLE `lottoschein` (
  `lottoscheinid` bigint(20) NOT NULL,
  `belegnummer` bigint(20) DEFAULT NULL,
  `losnummer` int(11) NOT NULL,
  `kundeid` bigint(20) NOT NULL,
  `isspiel77` tinyint(1) DEFAULT NULL,
  `issuper6` tinyint(1) DEFAULT NULL,
  `ismittwoch` tinyint(1) DEFAULT NULL,
  `issamstag` tinyint(1) DEFAULT NULL,
  `laufzeit` int(11) DEFAULT NULL,
  `tipps` varbinary(96) DEFAULT NULL,
  `isabgeschlossen` tinyint(1) DEFAULT NULL,
  `abgabedatum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kosten` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lottoscheinziehung`
--

CREATE TABLE `lottoscheinziehung` (
  `lottoscheinziehungid` bigint(20) NOT NULL,
  `lottoscheinid` bigint(20) NOT NULL,
  `ziehungnr` int(11) NOT NULL,
  `ziehungid` bigint(20) NOT NULL,
  `gewinnklasseidspiel77` bigint(20) DEFAULT NULL,
  `gewinnklasseidsuper6` bigint(20) DEFAULT NULL,
  `isabgeschlossen` tinyint(1) DEFAULT NULL,
  `isletzteziehung` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `gewinnspiel77` bigint(20) DEFAULT NULL,
  `gewinnsuper6` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lottoscheinziehung6aus49`
--

CREATE TABLE `lottoscheinziehung6aus49` (
  `lottoscheinziehung6aus49id` bigint(20) NOT NULL,
  `lottoscheinziehungid` bigint(20) NOT NULL,
  `tippnr` int(11) NOT NULL,
  `gewinnklasseid` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `gewinn` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `spiel`
--

CREATE TABLE `spiel` (
  `spielid` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` varchar(1023) NOT NULL,
  `pfadanleitung` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `password` char(64) NOT NULL,
  `kundeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_groups`
--

CREATE TABLE `user_groups` (
  `user_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ziehung`
--

CREATE TABLE `ziehung` (
  `ziehungid` bigint(20) NOT NULL,
  `ziehungsdatum` date NOT NULL,
  `zahlenalsbits` bigint(20) DEFAULT NULL,
  `superzahl` int(11) DEFAULT NULL,
  `spiel77` int(11) DEFAULT NULL,
  `super6` int(11) DEFAULT NULL,
  `einsatzlotto` bigint(20) DEFAULT NULL,
  `einsatzspiel77` bigint(20) DEFAULT NULL,
  `einsatzsuper6` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`adresseid`),
  ADD UNIQUE KEY `uq_kundeid_adressnr` (`kundeid`,`adressenr`),
  ADD KEY `idx_fk_adresse_kunde` (`kundeid`);

--
-- Indizes für die Tabelle `bankverbindung`
--
ALTER TABLE `bankverbindung`
  ADD PRIMARY KEY (`bankverbindungid`),
  ADD UNIQUE KEY `uq_kundeid_bankverbindungnr` (`kundeid`,`bankverbindungnr`),
  ADD KEY `idx_fk_bankverbindung_kunde` (`kundeid`);

--
-- Indizes für die Tabelle `gebuehr`
--
ALTER TABLE `gebuehr`
  ADD PRIMARY KEY (`gebuehrid`);

--
-- Indizes für die Tabelle `gewinnklasse`
--
ALTER TABLE `gewinnklasse`
  ADD PRIMARY KEY (`gewinnklasseid`),
  ADD KEY `idx_fk_gewinnklasse_spiel` (`spielid`);

--
-- Indizes für die Tabelle `gewinnklasseziehungquote`
--
ALTER TABLE `gewinnklasseziehungquote`
  ADD PRIMARY KEY (`gewinnklasseziehungquoteid`),
  ADD UNIQUE KEY `uq_gewinnklasseid_ziehungid` (`gewinnklasseid`,`ziehungid`),
  ADD KEY `idx_fk_gewinnklasseziehungquote_ziehung` (`ziehungid`),
  ADD KEY `idx_fk_gewinnklasseziehungquote_gewinnklasse` (`gewinnklasseid`);

--
-- Indizes für die Tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indizes für die Tabelle `jackpot`
--
ALTER TABLE `jackpot`
  ADD PRIMARY KEY (`jackpotid`),
  ADD UNIQUE KEY `uq_gewinnklasseid_ziehungid` (`gewinnklasseid`,`ziehungid`),
  ADD KEY `idx_fk_jackpot_ziehung` (`ziehungid`),
  ADD KEY `idx_fk_jackpot_gewinnklasse` (`gewinnklasseid`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`kundeid`);

--
-- Indizes für die Tabelle `lottoschein`
--
ALTER TABLE `lottoschein`
  ADD PRIMARY KEY (`lottoscheinid`),
  ADD UNIQUE KEY `uq_belegnummer` (`belegnummer`),
  ADD KEY `idx_fk_lottoschein_kunde` (`kundeid`);

--
-- Indizes für die Tabelle `lottoscheinziehung`
--
ALTER TABLE `lottoscheinziehung`
  ADD PRIMARY KEY (`lottoscheinziehungid`),
  ADD UNIQUE KEY `uq_lottoscheinid_ziehungnr` (`lottoscheinid`,`ziehungnr`),
  ADD KEY `idx_fk_lottoscheinziehung_lottoschein` (`lottoscheinid`),
  ADD KEY `idx_fk_lottoscheinziehung_ziehung` (`ziehungid`),
  ADD KEY `idx_fk_lottoscheinziehung_gewinnklasse_spiel77` (`gewinnklasseidspiel77`),
  ADD KEY `idx_fk_lottoscheinziehung_gewinnklasse_super6` (`gewinnklasseidsuper6`);

--
-- Indizes für die Tabelle `lottoscheinziehung6aus49`
--
ALTER TABLE `lottoscheinziehung6aus49`
  ADD PRIMARY KEY (`lottoscheinziehung6aus49id`),
  ADD UNIQUE KEY `uq_lottoscheinziehungid_tippnr` (`lottoscheinziehungid`,`tippnr`),
  ADD KEY `idx_fk_lottoscheinziehung6aus49_gewinnklasse` (`gewinnklasseid`),
  ADD KEY `idx_fk_lottoscheinziehung6aus49_lottoscheinziehung` (`lottoscheinziehungid`);

--
-- Indizes für die Tabelle `spiel`
--
ALTER TABLE `spiel`
  ADD PRIMARY KEY (`spielid`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `kundeid` (`kundeid`),
  ADD UNIQUE KEY `kundeid_2` (`kundeid`);

--
-- Indizes für die Tabelle `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `fk_users_has_groups_groups1` (`group_id`),
  ADD KEY `fk_users_has_groups_users` (`user_id`);

--
-- Indizes für die Tabelle `ziehung`
--
ALTER TABLE `ziehung`
  ADD PRIMARY KEY (`ziehungid`),
  ADD UNIQUE KEY `uq_ziehungsdatum` (`ziehungsdatum`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adresse`
--
ALTER TABLE `adresse`
  MODIFY `adresseid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bankverbindung`
--
ALTER TABLE `bankverbindung`
  MODIFY `bankverbindungid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gebuehr`
--
ALTER TABLE `gebuehr`
  MODIFY `gebuehrid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gewinnklasse`
--
ALTER TABLE `gewinnklasse`
  MODIFY `gewinnklasseid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gewinnklasseziehungquote`
--
ALTER TABLE `gewinnklasseziehungquote`
  MODIFY `gewinnklasseziehungquoteid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `jackpot`
--
ALTER TABLE `jackpot`
  MODIFY `jackpotid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `kundeid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lottoschein`
--
ALTER TABLE `lottoschein`
  MODIFY `lottoscheinid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lottoscheinziehung`
--
ALTER TABLE `lottoscheinziehung`
  MODIFY `lottoscheinziehungid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lottoscheinziehung6aus49`
--
ALTER TABLE `lottoscheinziehung6aus49`
  MODIFY `lottoscheinziehung6aus49id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `spiel`
--
ALTER TABLE `spiel`
  MODIFY `spielid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ziehung`
--
ALTER TABLE `ziehung`
  MODIFY `ziehungid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_kunde` FOREIGN KEY (`kundeid`) REFERENCES `kunde` (`kundeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `bankverbindung`
--
ALTER TABLE `bankverbindung`
  ADD CONSTRAINT `fk_bankverbindung_kunde` FOREIGN KEY (`kundeid`) REFERENCES `kunde` (`kundeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `gewinnklasse`
--
ALTER TABLE `gewinnklasse`
  ADD CONSTRAINT `fk_gewinnklasse_spiel` FOREIGN KEY (`spielid`) REFERENCES `spiel` (`spielid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `gewinnklasseziehungquote`
--
ALTER TABLE `gewinnklasseziehungquote`
  ADD CONSTRAINT `fk_gewinnklasseziehungquote_gewinnklasse` FOREIGN KEY (`gewinnklasseid`) REFERENCES `gewinnklasse` (`gewinnklasseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gewinnklasseziehungquote_ziehung` FOREIGN KEY (`ziehungid`) REFERENCES `ziehung` (`ziehungid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `jackpot`
--
ALTER TABLE `jackpot`
  ADD CONSTRAINT `fk_jackpot_gewinnklasse` FOREIGN KEY (`gewinnklasseid`) REFERENCES `gewinnklasse` (`gewinnklasseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jackpot_ziehung` FOREIGN KEY (`ziehungid`) REFERENCES `ziehung` (`ziehungid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `lottoschein`
--
ALTER TABLE `lottoschein`
  ADD CONSTRAINT `fk_lottoschein_kunde` FOREIGN KEY (`kundeid`) REFERENCES `kunde` (`kundeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `lottoscheinziehung`
--
ALTER TABLE `lottoscheinziehung`
  ADD CONSTRAINT `fk_lottoscheinziehung_gewinnklasse_spiel77` FOREIGN KEY (`gewinnklasseidspiel77`) REFERENCES `gewinnklasse` (`gewinnklasseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lottoscheinziehung_gewinnklasse_super6` FOREIGN KEY (`gewinnklasseidsuper6`) REFERENCES `gewinnklasse` (`gewinnklasseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lottoscheinziehung_lottoschein` FOREIGN KEY (`lottoscheinid`) REFERENCES `lottoschein` (`lottoscheinid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lottoscheinziehung_ziehung` FOREIGN KEY (`ziehungid`) REFERENCES `ziehung` (`ziehungid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `lottoscheinziehung6aus49`
--
ALTER TABLE `lottoscheinziehung6aus49`
  ADD CONSTRAINT `fk_lottoscheinziehung6aus49_gewinnklasse` FOREIGN KEY (`gewinnklasseid`) REFERENCES `gewinnklasse` (`gewinnklasseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lottoscheinziehung6aus49_lottoscheinziehung` FOREIGN KEY (`lottoscheinziehungid`) REFERENCES `lottoscheinziehung` (`lottoscheinziehungid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_kunde` FOREIGN KEY (`kundeid`) REFERENCES `kunde` (`kundeid`);

--
-- Constraints der Tabelle `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `fk_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
