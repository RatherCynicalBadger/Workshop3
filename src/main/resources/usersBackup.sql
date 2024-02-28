-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: workshop2
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'troll@yahoo.com','Mr Troll','$2a$10$4zkzcDpiffvr5B8I57HMB.ZgPj.m7r9dVgWNl65Ab4GKf5dbjx3v6'),(2,'elf@yahoo.com','High Elf','$2a$10$MpEqCYGFn2c.2UsRiCpuqO3QsG1kGqgLzwwAt/u8euVqjdoUN6qSy'),(3,'dwarf@yahoo.com','Mr Dwarf','$2a$10$smK0C8Vpf0h9IS/SVrLN3OsBT2lyRowjGkBz6aoseKF0EfvZt2pzC'),(4,'hobbit@yahoo.com','Mr Took','$2a$10$YiUukIUsk8TOwAgRH1/zNuzhVplDS.E5fCMYWvr/a3/KLFGGkH7IS'),(5,'orc@yahoo.com','Mr Orc','$2a$10$U9ko8U/CAZuQCf1ZiEych.3e1nrsDd5gqBsHKn7DzIwR98NwOWhlC'),(6,'goblin@yahoo.com','Mr Goblin','$2a$10$PxyBnSdhEAKPr5Vd6uArRe5r3v3ljFJhSHAu.pWs6uAFMlI.0g5ty'),(7,'human@yahoo.com','Mr Human','$2a$10$BkcfQKvo0SviNlLkhtOZm.STu4j20qDo0XyuXT638F8yDNuxoiLpW'),(8,'dragon@yahoo.com','Mr Smaug','$2a$10$yt0Hm48XqH3BCwol7O79xumMC3PlDDcz8eDpPwcIRR2kMrWZoi2/y');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 21:18:52
