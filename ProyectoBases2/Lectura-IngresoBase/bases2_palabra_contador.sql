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
-- Table structure for table `palabra_contador`
--

DROP TABLE IF EXISTS `palabra_contador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palabra_contador` (
  `idPalabra_Contador` int(11) NOT NULL AUTO_INCREMENT,
  `Palabra` varchar(150) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idPalabra_Contador`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palabra_contador`
--

LOCK TABLES `palabra_contador` WRITE;
/*!40000 ALTER TABLE `palabra_contador` DISABLE KEYS */;
INSERT INTO `palabra_contador` VALUES (363,'﻿-',4),(364,'2017',2),(365,'Account',1),(366,'Blogger',1),(367,'Búsqueda',3),(368,'Calendario',1),(369,'Condiciones',3),(370,'Configuración',2),(371,'Documentos',1),(372,'Drive',1),(373,'Empresariales',1),(374,'EmpresarialesTodo',1),(375,'English',2),(376,'English©',1),(377,'Fotos',1),(378,'Gmail',1),(379,'Google',2),(380,'Google.com',1),(381,'GoogleGoogle.com',1),(382,'Herramientas',1),(383,'Historial',1),(384,'Imágenes',1),(385,'Iniciar',1),(386,'Libros',1),(387,'Maps',1),(388,'Más',1),(389,'MásLibrosBloggerFotosVideosDocumentosTodavía',1),(390,'Options',1),(391,'Play',1),(392,'Privacidad',3),(393,'Programas',2),(394,'Soluciones',1),(395,'Todavía',1),(396,'Todo',1),(397,'Traductor',1),(398,'Videos',1),(399,'acerca',2),(400,'avanzada',1),(401,'avanzadaHerramientas',2),(402,'búsqueda',1),(403,'búsquedaHistorial',1),(404,'de',9),(405,'idioma',3),(406,'in',2),(407,'más',2),(408,'publicidad',1),(409,'publicidadSoluciones',1),(410,'sesión',1),(411,'web',2),(412,'Búsqueda',1),(413,'©',1),(414,'»',2);
/*!40000 ALTER TABLE `palabra_contador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-26 16:53:57
