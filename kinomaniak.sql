CREATE DATABASE  IF NOT EXISTS `kinomaniak` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kinomaniak`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kinomaniak
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dyskusja`
--

DROP TABLE IF EXISTS `dyskusja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dyskusja` (
  `id_dyskusja` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_dyskusja`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dyskusja`
--

LOCK TABLES `dyskusja` WRITE;
/*!40000 ALTER TABLE `dyskusja` DISABLE KEYS */;
INSERT INTO `dyskusja` VALUES (1,'Hubert bardziej zawodowiec?');
/*!40000 ALTER TABLE `dyskusja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `tytul_oryginalny` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `rok_produkcji` int(11) NOT NULL,
  `czas_trwania` int(11) NOT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Leon',1994,110),(2,'Angel-A',2005,90),(3,'Amelia',2001,129);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_gatunek`
--

DROP TABLE IF EXISTS `film_gatunek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_gatunek` (
  `id_film_gatunek` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_gatunek` int(11) NOT NULL,
  PRIMARY KEY (`id_film_gatunek`),
  KEY `id_film` (`id_film`,`id_gatunek`),
  KEY `id_film_2` (`id_film`),
  KEY `id_gatunek` (`id_gatunek`),
  CONSTRAINT `film_gatunek_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_gatunek_ibfk_2` FOREIGN KEY (`id_gatunek`) REFERENCES `gatunek` (`id_gatunek`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_gatunek`
--

LOCK TABLES `film_gatunek` WRITE;
/*!40000 ALTER TABLE `film_gatunek` DISABLE KEYS */;
INSERT INTO `film_gatunek` VALUES (1,1,1),(2,1,4),(3,1,5),(4,2,1),(5,2,3),(6,3,2);
/*!40000 ALTER TABLE `film_gatunek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_jezyk_tytul`
--

DROP TABLE IF EXISTS `film_jezyk_tytul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_jezyk_tytul` (
  `id_film_jezyk_tytul` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_jezyk` int(11) NOT NULL,
  `tytul` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_film_jezyk_tytul`),
  KEY `id_film` (`id_film`),
  KEY `id_jezyk` (`id_jezyk`),
  KEY `id_jezyk_2` (`id_jezyk`),
  CONSTRAINT `film_jezyk_tytul_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_jezyk_tytul_ibfk_2` FOREIGN KEY (`id_jezyk`) REFERENCES `jezyk` (`id_jezyk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_jezyk_tytul`
--

LOCK TABLES `film_jezyk_tytul` WRITE;
/*!40000 ALTER TABLE `film_jezyk_tytul` DISABLE KEYS */;
INSERT INTO `film_jezyk_tytul` VALUES (1,1,1,'Leon Zawodowiec');
/*!40000 ALTER TABLE `film_jezyk_tytul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_kraj`
--

DROP TABLE IF EXISTS `film_kraj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_kraj` (
  `id_film_kraj` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_kraj` int(11) NOT NULL,
  PRIMARY KEY (`id_film_kraj`),
  KEY `id_film` (`id_film`),
  KEY `id_film_2` (`id_film`),
  KEY `id_kraj` (`id_kraj`),
  CONSTRAINT `film_kraj_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_kraj_ibfk_2` FOREIGN KEY (`id_kraj`) REFERENCES `kraj` (`id_kraj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_kraj`
--

LOCK TABLES `film_kraj` WRITE;
/*!40000 ALTER TABLE `film_kraj` DISABLE KEYS */;
INSERT INTO `film_kraj` VALUES (1,1,1),(2,1,2),(3,2,1),(4,3,1);
/*!40000 ALTER TABLE `film_kraj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_osoba_funkcja`
--

DROP TABLE IF EXISTS `film_osoba_funkcja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_osoba_funkcja` (
  `id_film_osoba_funkcja` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_osoba` int(11) NOT NULL,
  `id_funkcja` int(11) NOT NULL,
  PRIMARY KEY (`id_film_osoba_funkcja`),
  KEY `id_film` (`id_film`,`id_osoba`,`id_funkcja`),
  KEY `id_osoba` (`id_osoba`),
  KEY `id_funkcja` (`id_funkcja`),
  CONSTRAINT `film_osoba_funkcja_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_osoba_funkcja_ibfk_2` FOREIGN KEY (`id_osoba`) REFERENCES `osoba` (`id_osoba`),
  CONSTRAINT `film_osoba_funkcja_ibfk_3` FOREIGN KEY (`id_funkcja`) REFERENCES `funkcja` (`id_funkcja`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_osoba_funkcja`
--

LOCK TABLES `film_osoba_funkcja` WRITE;
/*!40000 ALTER TABLE `film_osoba_funkcja` DISABLE KEYS */;
INSERT INTO `film_osoba_funkcja` VALUES (1,1,1,1),(3,1,1,2),(2,2,1,1),(4,3,3,1),(5,3,3,2);
/*!40000 ALTER TABLE `film_osoba_funkcja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_osoba_rola`
--

DROP TABLE IF EXISTS `film_osoba_rola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_osoba_rola` (
  `id_film_osoba_rola` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_osoba` int(11) NOT NULL,
  `rola` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_film_osoba_rola`),
  KEY `id_film` (`id_film`),
  KEY `id_osoba` (`id_osoba`),
  CONSTRAINT `film_osoba_rola_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_osoba_rola_ibfk_2` FOREIGN KEY (`id_osoba`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_osoba_rola`
--

LOCK TABLES `film_osoba_rola` WRITE;
/*!40000 ALTER TABLE `film_osoba_rola` DISABLE KEYS */;
INSERT INTO `film_osoba_rola` VALUES (1,2,2,'André Moussah'),(2,3,2,'Lucien'),(3,3,4,'Amelia Poulain');
/*!40000 ALTER TABLE `film_osoba_rola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_uzytkownik_dyskusja_komentarz`
--

DROP TABLE IF EXISTS `film_uzytkownik_dyskusja_komentarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_uzytkownik_dyskusja_komentarz` (
  `id_film_uzytkownik_dyskusja_komentarz` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `id_dyskusja` int(11) NOT NULL,
  `komentarz` text COLLATE utf8_polish_ci NOT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_film_uzytkownik_dyskusja_komentarz`),
  KEY `id_film` (`id_film`),
  KEY `id_uzytkownik` (`id_uzytkownik`),
  KEY `id_dyskusja` (`id_dyskusja`),
  CONSTRAINT `film_uzytkownik_dyskusja_komentarz_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_uzytkownik_dyskusja_komentarz_ibfk_2` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`),
  CONSTRAINT `film_uzytkownik_dyskusja_komentarz_ibfk_3` FOREIGN KEY (`id_dyskusja`) REFERENCES `dyskusja` (`id_dyskusja`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_uzytkownik_dyskusja_komentarz`
--

LOCK TABLES `film_uzytkownik_dyskusja_komentarz` WRITE;
/*!40000 ALTER TABLE `film_uzytkownik_dyskusja_komentarz` DISABLE KEYS */;
INSERT INTO `film_uzytkownik_dyskusja_komentarz` VALUES (1,1,1,1,'Który był większym wymiataczem?','2014-02-08 11:41:08'),(2,1,2,1,'Ten co miał większą miotłę.','2014-02-08 11:41:34');
/*!40000 ALTER TABLE `film_uzytkownik_dyskusja_komentarz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_uzytkownik_ocena`
--

DROP TABLE IF EXISTS `film_uzytkownik_ocena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_uzytkownik_ocena` (
  `id_film_uzytkownik_ocena` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `ocena` int(11) NOT NULL,
  PRIMARY KEY (`id_film_uzytkownik_ocena`),
  KEY `id_film` (`id_film`),
  KEY `id_uzytkownik` (`id_uzytkownik`),
  CONSTRAINT `film_uzytkownik_ocena_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_uzytkownik_ocena_ibfk_2` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_uzytkownik_ocena`
--

LOCK TABLES `film_uzytkownik_ocena` WRITE;
/*!40000 ALTER TABLE `film_uzytkownik_ocena` DISABLE KEYS */;
INSERT INTO `film_uzytkownik_ocena` VALUES (1,1,2,8),(2,2,1,6),(3,3,1,7),(4,3,2,8);
/*!40000 ALTER TABLE `film_uzytkownik_ocena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_uzytkownik_recenzja`
--

DROP TABLE IF EXISTS `film_uzytkownik_recenzja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_uzytkownik_recenzja` (
  `id_film_uzytkownik_recenzja` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_uzytkownik` int(11) NOT NULL,
  `tytul` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `lead` text COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_film_uzytkownik_recenzja`),
  KEY `id_film` (`id_film`),
  KEY `id_uzytkownik` (`id_uzytkownik`),
  CONSTRAINT `film_uzytkownik_recenzja_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `film_uzytkownik_recenzja_ibfk_2` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id_uzytkownik`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_uzytkownik_recenzja`
--

LOCK TABLES `film_uzytkownik_recenzja` WRITE;
/*!40000 ALTER TABLE `film_uzytkownik_recenzja` DISABLE KEYS */;
INSERT INTO `film_uzytkownik_recenzja` VALUES (1,3,2,'Amelia - złodziejka krasnali','Po co kraść krasnale z ogródka?','Czy można działanie Ameli potraktować jako rodzaj psychoterapii?');
/*!40000 ALTER TABLE `film_uzytkownik_recenzja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funkcja`
--

DROP TABLE IF EXISTS `funkcja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funkcja` (
  `id_funkcja` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_funkcja`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funkcja`
--

LOCK TABLES `funkcja` WRITE;
/*!40000 ALTER TABLE `funkcja` DISABLE KEYS */;
INSERT INTO `funkcja` VALUES (1,'reżyseria'),(2,'scenariusz');
/*!40000 ALTER TABLE `funkcja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatunek`
--

DROP TABLE IF EXISTS `gatunek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatunek` (
  `id_gatunek` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_gatunek`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatunek`
--

LOCK TABLES `gatunek` WRITE;
/*!40000 ALTER TABLE `gatunek` DISABLE KEYS */;
INSERT INTO `gatunek` VALUES (1,'dramat'),(2,'komedia'),(3,'fantasy'),(4,'kryminal'),(5,'sensacja');
/*!40000 ALTER TABLE `gatunek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jezyk`
--

DROP TABLE IF EXISTS `jezyk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jezyk` (
  `id_jezyk` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_jezyk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jezyk`
--

LOCK TABLES `jezyk` WRITE;
/*!40000 ALTER TABLE `jezyk` DISABLE KEYS */;
INSERT INTO `jezyk` VALUES (1,'polski'),(2,'angielski'),(3,'francuski');
/*!40000 ALTER TABLE `jezyk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraj`
--

DROP TABLE IF EXISTS `kraj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraj` (
  `id_kraj` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(16) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_kraj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraj`
--

LOCK TABLES `kraj` WRITE;
/*!40000 ALTER TABLE `kraj` DISABLE KEYS */;
INSERT INTO `kraj` VALUES (1,'Francja'),(2,'USA');
/*!40000 ALTER TABLE `kraj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osoba` (
  `id_osoba` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (1,'Luc','Besson'),(2,'Jamel','Debbouze'),(3,'Jean-Pierre','Jeunet'),(4,' Audrey',' Tautou ');
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik` (
  `id_uzytkownik` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `login` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id_uzytkownik`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik`
--

LOCK TABLES `uzytkownik` WRITE;
/*!40000 ALTER TABLE `uzytkownik` DISABLE KEYS */;
INSERT INTO `uzytkownik` VALUES (1,'Jan','Kowalski','jkowal','112233','jkowal@google.com'),(2,'Zenobiusz','Zygzag','zyzy','112233','zyzy@wp.pl');
/*!40000 ALTER TABLE `uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-03  9:33:44
