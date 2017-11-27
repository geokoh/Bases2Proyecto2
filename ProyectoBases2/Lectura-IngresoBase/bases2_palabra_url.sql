-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bases2
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `palabra_url`
--

DROP TABLE IF EXISTS `palabra_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palabra_url` (
  `idpalabra_url` int(11) NOT NULL AUTO_INCREMENT,
  `Link` varchar(150) NOT NULL,
  `PalabraID` int(11) NOT NULL,
  PRIMARY KEY (`idpalabra_url`),
  KEY `palabraXlink_idx` (`PalabraID`),
  CONSTRAINT `palabraXlink` FOREIGN KEY (`PalabraID`) REFERENCES `palabra_contador` (`idPalabra_Contador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1379 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palabra_url`
--

LOCK TABLES `palabra_url` WRITE;
/*!40000 ALTER TABLE `palabra_url` DISABLE KEYS */;
INSERT INTO `palabra_url` VALUES (1298,'http://www.google.com/',363),(1299,'http://www.google.com/',363),(1300,'http://www.google.com/',363),(1301,'http://www.google.com/',363),(1302,'http://www.google.com/',364),(1303,'http://www.google.com/',364),(1304,'http://www.google.com/',365),(1305,'http://www.google.com/',366),(1306,'http://www.google.com/',367),(1307,'http://www.google.com/',367),(1308,'http://www.google.com/',367),(1309,'http://www.google.com/',368),(1310,'http://www.google.com/',369),(1311,'http://www.google.com/',369),(1312,'http://www.google.com/',369),(1313,'http://www.google.com/',370),(1314,'http://www.google.com/',370),(1315,'http://www.google.com/',371),(1316,'http://www.google.com/',372),(1317,'http://www.google.com/',373),(1318,'http://www.google.com/',374),(1319,'http://www.google.com/',375),(1320,'http://www.google.com/',375),(1321,'http://www.google.com/',376),(1322,'http://www.google.com/',377),(1323,'http://www.google.com/',378),(1324,'http://www.google.com/',379),(1325,'http://www.google.com/',379),(1326,'http://www.google.com/',380),(1327,'http://www.google.com/',381),(1328,'http://www.google.com/',382),(1329,'http://www.google.com/',383),(1330,'http://www.google.com/',384),(1331,'http://www.google.com/',385),(1332,'http://www.google.com/',386),(1333,'http://www.google.com/',387),(1334,'http://www.google.com/',388),(1335,'http://www.google.com/',389),(1336,'http://www.google.com/',390),(1337,'http://www.google.com/',391),(1338,'http://www.google.com/',392),(1339,'http://www.google.com/',392),(1340,'http://www.google.com/',392),(1341,'http://www.google.com/',393),(1342,'http://www.google.com/',393),(1343,'http://www.google.com/',394),(1344,'http://www.google.com/',389),(1345,'http://www.google.com/',374),(1346,'http://www.google.com/',397),(1347,'http://www.google.com/',398),(1348,'http://www.google.com/',399),(1349,'http://www.google.com/',399),(1350,'http://www.google.com/',400),(1351,'http://www.google.com/',401),(1352,'http://www.google.com/',401),(1353,'http://www.google.com/',367),(1354,'http://www.google.com/',403),(1355,'http://www.google.com/',404),(1356,'http://www.google.com/',404),(1357,'http://www.google.com/',404),(1358,'http://www.google.com/',404),(1359,'http://www.google.com/',404),(1360,'http://www.google.com/',404),(1361,'http://www.google.com/',404),(1362,'http://www.google.com/',404),(1363,'http://www.google.com/',404),(1364,'http://www.google.com/',405),(1365,'http://www.google.com/',405),(1366,'http://www.google.com/',405),(1367,'http://www.google.com/',406),(1368,'http://www.google.com/',406),(1369,'http://www.google.com/',388),(1370,'http://www.google.com/',388),(1371,'http://www.google.com/',408),(1372,'http://www.google.com/',409),(1373,'http://www.google.com/',410),(1374,'http://www.google.com/',411),(1375,'http://www.google.com/',411),(1376,'http://www.google.com/',376),(1377,'http://www.google.com/',414),(1378,'http://www.google.com/',414);
/*!40000 ALTER TABLE `palabra_url` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-26 18:04:15
