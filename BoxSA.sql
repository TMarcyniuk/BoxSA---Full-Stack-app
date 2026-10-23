CREATE DATABASE  IF NOT EXISTS `boxsa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `boxsa`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: boxsa
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `idArticulo` int NOT NULL AUTO_INCREMENT,
  `codigoArticulo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `stockActual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stockMinimo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PPP` decimal(12,2) NOT NULL DEFAULT '0.00',
  `idTipArt` int NOT NULL,
  `idUnidad` int NOT NULL,
  `idUbicacion` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  `fechaAlta` date DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE KEY `codigoArticulo_UNIQUE` (`codigoArticulo`),
  KEY `idUnidad` (`idUnidad`),
  KEY `idUbicacion` (`idUbicacion`),
  KEY `idUsuario` (`idUsuario`),
  KEY `articulos_ibfk_1_idx` (`idTipArt`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`idTipArt`) REFERENCES `tipart` (`idTipArt`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUni`),
  CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicaciones` (`idUbicacion`),
  CONSTRAINT `articulos_ibfk_4` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'BC10038-25','Base Cerejeira 100x38x2,5',99.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(2,'BICAZ1','Birome BIC AZUL GRUESO',35.00,10.00,25.00,5,0,NULL,NULL,'A','2007-01-01'),(3,'BICNG1','Birome BIC NEGRO GRUESO',21.00,10.00,25.00,5,0,NULL,NULL,'A','2007-01-01'),(4,'BICRO1','Birome BIC ROJO GRUESO',18.00,10.00,25.00,5,0,NULL,NULL,'A','2007-01-01'),(5,'BOGLOGO','Logo Bogner',30.00,15.00,0.00,20,0,NULL,NULL,'A','2018-08-02'),(6,'BP10038-25','Base Pino 100x38x2,5',63.00,50.00,250.00,2,0,NULL,2,'A','2010-01-08'),(7,'BP11038-25','Base Pino 110x38x2,5',59.00,50.00,120.00,2,0,NULL,2,'A','2010-02-08'),(8,'BP12038-25','Base Pino 120x38x2,5',90.00,50.00,220.00,2,0,NULL,NULL,'A','2010-04-20'),(9,'CHAPF-P1000','Chapa Apoyo Sup. Fender P1000',100.00,50.00,380.00,21,0,NULL,NULL,'A','2010-04-10'),(10,'CHAPFDER-HR','Chapa Apoyo Sup. Fender HR',98.00,20.00,280.00,21,0,NULL,NULL,'A','2019-04-10'),(11,'CHAPMBHN','Chapa Apoyo Sup. MB Head - Negro',100.00,50.00,400.00,21,0,NULL,NULL,'A','2010-04-10'),(12,'COLA_MADERA','Cola Madera ',1600000.00,4000.00,90.00,3,0,NULL,NULL,'A','2013-02-08'),(13,'CUAD-ESPIRAL-CUA-80','CUADERNO Espiralado 80h Cuadriculado',12.00,30.00,80.00,5,0,NULL,NULL,'A','2018-08-08'),(14,'CUAD-ESPIRAL-RAY-80','CUADERNO Espiralado 80h Rayado',12.00,30.00,85.00,5,0,NULL,NULL,'A','2018-08-08'),(15,'CUEFDER-BK','Cuerina Fender Negro',169.70,30.00,150.00,16,0,NULL,2,'A','2010-11-03'),(16,'CUEMBC','Cuerina MB Caoba',138.50,30.00,320.00,16,0,NULL,NULL,'A','2010-03-08'),(17,'CUEMBCREAM','Cuerina MB Cream',145.00,30.00,350.00,16,0,NULL,NULL,'A','2010-10-02'),(18,'CUEMBN','Cuerina MB Negro',180.00,30.00,150.00,16,0,NULL,NULL,'A','2010-11-03'),(19,'CUEVIB SLO','Cuerina Vibora Soldano Custom 1',80.00,30.00,600.00,16,0,NULL,NULL,'A','2020-01-01'),(20,'ESQUIFDERA-BK','Esquinas Fender Acetato - Negro',82.00,50.00,60.00,10,0,NULL,2,'A','2018-08-04'),(21,'ESQUIMBAHN','Esquinas MB Acetato Head - Negro',100.00,50.00,600.00,10,0,NULL,NULL,'A','2018-08-04'),(22,'FC9520-25','Fondo Cerejerira 95x20x2,5',99.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(23,'FDERLOGO1','Logo Fender 1',130.00,50.00,0.00,20,0,NULL,NULL,'A','2018-08-02'),(24,'FDERLOGO2','Logo Fender 2',49.00,50.00,0.00,20,0,NULL,NULL,'A','2018-08-02'),(25,'FP10535-25','Fondo Pino 105x30x2,5',39.00,20.00,100.00,2,0,NULL,2,'A','2018-08-04'),(26,'FP11525-25','Fondo Pino 115x25x2,5',38.00,20.00,100.00,2,0,NULL,NULL,'A','2018-08-08'),(27,'FP1557225','Frente Pino 1x12 W 155x72x2,5',62.00,20.00,200.00,2,0,NULL,NULL,'A','2010-08-08'),(28,'FP9520-25','Fondo Pino 95x20x2,5',78.00,20.00,400.00,2,0,NULL,2,'A','2012-08-08'),(29,'FREZ1506N','Frezado 1,5x0,6 - Negro',90.00,150.00,0.30,1,0,NULL,NULL,'A','2012-08-08'),(30,'FREZ1506P','Frezado 1,5x0,6 - Plata',476.00,150.00,0.40,1,0,NULL,NULL,'A','2012-08-08'),(31,'FREZ206P','Frezado 2x0,6 - Plata',498.00,100.00,0.35,1,0,NULL,NULL,'A','2012-08-08'),(32,'FTEC9520-25','Frente Cerejerira 95x20x2,5',99.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(33,'FTEP1210545-25','Frente Pino 1x12 105x45x2,5',40.00,20.00,100.00,2,0,NULL,2,'A','2012-08-08'),(34,'FTEP1211550-25','Frente Pino 1x12 115x50x2,5',42.00,20.00,220.00,2,0,NULL,NULL,'A','2018-06-08'),(35,'FTEP9520-25','Frente Pino 95x20x2,5',17.00,20.00,130.00,2,0,NULL,2,'A','2010-07-08'),(36,'HP12A ','TONER 12A HP',5.00,2.00,3000.00,17,0,NULL,NULL,'A','2018-08-08'),(37,'HP78A ','TONER 78A HP',3.00,2.00,3000.00,17,0,NULL,NULL,'A','2021-10-08'),(38,'LACA-MR-BR','Laca Marina Brillante',40092.00,4000.00,205.00,14,0,NULL,NULL,'A','2019-08-05'),(39,'LACA-MR-SM','Laca Marina Semi-Mate',80000.00,4000.00,134.00,14,0,NULL,NULL,'A','2019-03-01'),(40,'LCD3840-25','Lateral Der Cerejeira Forma 38x40x2,5',99.00,20.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(41,'LCI3840-25','Lateral Izq Cerejerira Forma 38x40x2,5',99.00,20.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(42,'LPD3840-25','Lateral Der Pino Forma 38x40x2,5',18.00,20.00,370.00,2,0,NULL,2,'A','2010-08-08'),(43,'LPD3855-25','Lateral Der Pino Forma 38x55x2,5',18.00,20.00,300.00,2,0,NULL,2,'A','2010-09-08'),(44,'LPI3840-25','Lateral Izq Pino Forma 38x40x2,5',16.00,20.00,120.00,2,0,NULL,2,'A','2012-08-08'),(45,'LPI3855-25','Lateral Izq Pino Forma 38x55x2,5',21.00,20.00,140.00,2,0,NULL,2,'A','2012-08-08'),(46,'MANITFDER-BK','Manija Transp. Fender - Negro',56.00,20.00,140.00,8,0,NULL,2,'A','2018-08-08'),(47,'MANITMBCN','Manija Transp. Heavy MB - Negro',35.00,15.00,450.00,8,0,NULL,NULL,'A','2012-08-08'),(48,'MANITMBN','Manija Transp. MB - Negro',30.00,15.00,340.00,8,0,NULL,NULL,'A','2018-08-08'),(49,'MARLOGO','Logo Marshall',197.00,50.00,0.00,20,0,NULL,2,'A','2017-08-03'),(50,'MBLOGO1','Logo Boogie',20.00,20.00,0.00,20,0,NULL,NULL,'A','2018-02-06'),(51,'MBLOGO2','Logo Boogie Cream',150.00,30.00,0.00,20,0,NULL,NULL,'A','2013-02-08'),(52,'PARK205N','Parker 2x0,5 - Negro',204.00,100.00,400.00,1,0,NULL,2,'A','2013-08-08'),(53,'PARK2505N','Parker 2,5x0,5 - Negro',246.00,120.00,350.00,1,0,NULL,NULL,'A','2018-08-06'),(54,'PEGA-CTO','Pegamento de Contacto ',12000.00,2000.00,295.00,3,0,NULL,NULL,'A','2020-08-12'),(55,'PEGA-CTO_TR','Pegamento de Contacto Tranparente',20000.00,2000.00,290.00,3,0,NULL,NULL,'A','2020-10-03'),(56,'PLASTICOLA 200GRS','Plasticola 200 gramos blanca',12.00,10.00,145.00,5,0,NULL,NULL,'A','2019-08-08'),(57,'REGAFDERSTD-BKN','Regaton Fender STD - Negro',176.00,50.00,22.00,9,0,NULL,NULL,'A','2018-08-06'),(58,'REGAMBHN','Regaton MB Head - Negro',97.00,50.00,122.00,9,0,NULL,NULL,'A','2018-08-06'),(59,'REGUNV35','Regaton UNIV 35mm- Negro',638.00,100.00,75.00,9,0,NULL,2,'A','2018-08-06'),(60,'REGUNV40','Regaton UNIV 40mm- Negro',450.00,100.00,80.00,9,0,NULL,NULL,'A','2018-08-06'),(61,'RESMA-A4-75GR','Resma A4 500 x 75grs',25.00,20.00,455.00,5,0,NULL,NULL,'A','2020-08-08'),(62,'RESMA-CARTA-80GR','Resma CARTA 500 x 80grs',15.00,15.00,498.00,5,0,NULL,NULL,'A','2020-08-08'),(63,'RIVLOGO','Logo Rivera',100.00,30.00,0.00,20,0,NULL,NULL,'A','2020-10-03'),(64,'RUED 45-AZUL','Ruedas 45mm diam Azul',80.00,20.00,230.00,18,0,NULL,NULL,'A','2017-08-10'),(65,'RUED 60-BK','Ruedas 60mm diam Negra',120.00,20.00,270.00,18,0,NULL,4,'A','2017-08-10'),(66,'SLOLOGO','Logo Soldano',78.00,20.00,0.00,20,0,NULL,NULL,'A','2019-03-14'),(67,'TARM1020','Tarugos Mad. 10x20',373.00,150.00,8.00,19,0,NULL,2,'A','2014-02-05'),(68,'TARM1030','Tarugos Mad. 10x30',605.00,150.00,8.00,19,0,NULL,NULL,'A','2014-08-04'),(69,'TC10028-25','Tapa Cerejeira 100x28x2,5',99.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(70,'TELAFDER-BD','Tela Blues Deville Fender',100.00,40.00,125.80,13,0,NULL,NULL,'A','2019-08-02'),(71,'TOPFONC20-25x25','Tope Fondo Cerejerira 20x2,5x2,5',98.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(72,'TOPFONP20-25x25','Tope Fondo Pino 20x2,5x2,5',8.00,10.00,270.00,2,0,NULL,2,'A','2014-08-08'),(73,'TOPFONP25-25x25','Tope Fondo Pino 25x2,5x2,5',14.00,10.00,290.00,2,0,NULL,NULL,'A','2014-02-08'),(74,'TOPFONP30-25x25','Tope Fondo Pino 30x2,5x2,5',14.00,10.00,400.00,2,0,NULL,2,'A','2014-08-10'),(75,'TOPFREC20-25x25','Tope Frente Cerejerira 20x2,5x2,5',98.00,50.00,100.00,2,0,NULL,NULL,'A','2016-03-10'),(76,'TOPFREP20-25x25','Tope Frente Pino 20x2,5x2,5',8.00,10.00,300.00,2,0,NULL,2,'A','2014-08-10'),(77,'TOPFREP38-25x25','Tope Frente Pino 38x2,5x2,5',12.00,10.00,210.00,2,0,NULL,2,'A','2017-08-18'),(78,'TOPFREP50-25x25','Tope Frente Pino 50x2,5x2,5',16.00,15.00,125.00,2,0,NULL,NULL,'A','2017-08-10'),(79,'TP10028-25','Tapa Pino 100x28x2,5',22.00,15.00,189.00,2,0,NULL,2,'A','2017-08-04'),(80,'TP11028-25','Tapa Pino 110x28x2,5',22.00,15.00,167.00,2,0,NULL,2,'A','2017-08-03'),(81,'TP12038-25','Tapa Pino 120x38x2,5',22.00,15.00,380.00,2,0,NULL,NULL,'A','2017-08-03'),(82,'VINIL','Peg. Vinilico Contacto',3090.80,1500.00,124.00,12,0,NULL,NULL,'A','2018-08-02'),(83,'VINIL-ESP','Peg. Vinilico Contacto Especial',2500.30,5000.00,450.00,12,0,NULL,NULL,'A','2019-08-02'),(84,'VINIL-NG','Peg. Vinilico Contacto Negro',4090.00,5000.00,100.00,12,0,NULL,2,'A','2019-08-01'),(85,'FDERLOGO3','Logo Fender 3',1000.00,200.00,0.00,20,0,NULL,NULL,'A','2018-08-02'),(86,'RESMAA480G','Resma A4 80grs',25.00,15.00,90.00,5,0,NULL,NULL,'A','2021-10-10'),(87,'RESMALT80G','Resma LT 80grs',15.00,10.00,95.00,5,0,NULL,NULL,'A','2021-10-10'),(88,'BICTGAZUL','Bic trazo grueso Azul ',8.00,15.00,15.00,5,0,NULL,NULL,'A','2021-10-10'),(89,'BICTGNEGRA','Bic trazo grueso Negra',30.00,15.00,15.00,5,0,NULL,NULL,'A','2021-11-10'),(90,'BICTGROJO','Bic trazo grueso Rojo',55.00,15.00,15.00,5,0,NULL,NULL,'A','2021-10-10'),(91,'BROCHES10','Broches 10',5.00,5.00,11.00,5,0,NULL,NULL,'A','2021-11-10'),(92,'BROCHES15','Broches 15',16.00,5.00,11.80,5,0,NULL,NULL,'A','2021-10-20'),(93,'MECHAMAD4','Mecha madera 4mm',12.00,5.00,35.00,4,0,NULL,NULL,'A','2018-08-03'),(94,'MECHAMAD5','Mecha madera 5mm',8.00,5.00,35.00,4,0,NULL,NULL,'A','2018-01-12'),(95,'MECHAMAD6','Mecha madera 6mm',14.00,5.00,35.00,4,0,NULL,NULL,'A','2018-08-03'),(96,'MECHAMAD10','Mecha madera 10mm',3.00,5.00,45.00,4,0,NULL,NULL,'A','2018-01-10'),(97,'ENERGIA','Energía Electrica',0.00,0.00,1200.00,24,0,NULL,NULL,'A','2007-01-01'),(98,'GAS','Gas',0.00,0.00,900.00,25,0,NULL,NULL,'A','2007-01-01'),(99,'AGUA','Agua',0.00,0.00,100.00,25,0,NULL,NULL,'A','2007-01-01'),(100,'SEGURIDAD','Servicio de Seguridad',0.00,0.00,1050.00,25,0,NULL,NULL,'A','2007-01-01'),(101,'SEGUROS','Seguros',0.00,0.00,3000.00,25,0,NULL,NULL,'A','2007-01-01');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_INSERT` AFTER INSERT ON `articulos` FOR EACH ROW BEGIN
	call NuevoMov("Articulos", new.idUsuario, 1, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_UPDATE` AFTER UPDATE ON `articulos` FOR EACH ROW BEGIN
	call NuevoMov("Articulos", new.idUsuario, 3, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_DELETE` AFTER DELETE ON `articulos` FOR EACH ROW BEGIN
	call NuevoMov("Articulos", old.idUsuario, 2, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `idAudit` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de auditoría\\n',
  `Fecha` datetime NOT NULL COMMENT 'Fecha y hora del evento registrado\\n',
  `t_Afectada` varchar(45) DEFAULT NULL COMMENT 'Nombre de la tabla afectada por el movimiento\\n',
  `idUs` int DEFAULT NULL COMMENT 'ID del usuario que realizó la acción (referencia a usuarios)\\\\n',
  `idMov` int NOT NULL COMMENT 'ID del tipo de movimiento registrado (referencia a audmov)\\n',
  `detMov` varchar(100) DEFAULT NULL COMMENT 'Descripción detallada del movimiento\\n\\n',
  PRIMARY KEY (`idAudit`),
  KEY `idUsuario` (`idUs`),
  KEY `idMov` (`idMov`),
  CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`idUs`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `audit_ibfk_2` FOREIGN KEY (`idMov`) REFERENCES `audmov` (`idMov`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los eventos generales de auditoría del sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1,'2026-08-29 08:44:50','Articulos',4,3,NULL),(2,'2026-08-29 08:57:25','Productos',1,3,NULL),(3,'2026-08-29 08:57:25','Productos',5,3,NULL),(4,'2026-08-29 08:57:25','Productos',4,3,NULL),(5,'2026-08-29 08:57:25','Productos',3,3,NULL),(6,'2026-08-29 08:57:25','Productos',1,3,NULL),(7,'2026-08-29 08:57:30','Productos',4,3,NULL),(8,'2026-08-29 08:57:35','Productos',5,3,NULL),(9,'2026-08-29 08:58:29','Productos',5,3,NULL),(10,'2026-09-18 21:32:10','Facturas',5,1,NULL),(11,'2026-09-26 08:27:28','Remitos',5,1,NULL),(12,'2026-09-26 08:36:24','Orden Venta',5,1,NULL),(13,'2026-09-26 08:36:24','Remitos',5,1,NULL),(14,'2026-09-26 08:36:24','Facturas',5,1,NULL),(15,'2026-09-26 08:36:24','Orden Venta',4,1,NULL),(16,'2026-09-26 08:36:24','Remitos',4,1,NULL),(17,'2026-09-26 08:36:24','Facturas',4,1,NULL),(18,'2026-09-26 08:48:03','Remitos',5,2,NULL),(19,'2026-09-26 08:48:03','Remitos',5,1,NULL),(20,'2026-09-26 08:48:35','Remitos',5,2,NULL),(21,'2026-09-26 08:48:35','Remitos',5,1,NULL),(22,'2026-09-26 08:49:39','Remitos',5,2,NULL),(23,'2026-09-26 08:49:39','Remitos',5,1,NULL),(24,'2026-09-26 08:49:40','Remitos',5,2,NULL),(25,'2026-09-26 08:49:40','Remitos',5,1,NULL),(26,'2026-09-26 08:49:48','Remitos',5,2,NULL),(27,'2026-09-26 08:49:48','Remitos',5,1,NULL),(28,'2026-10-17 10:15:45','Orden Venta',5,1,NULL),(29,'2026-10-17 10:15:45','Orden Venta',5,1,NULL),(30,'2026-10-17 10:16:33','Facturas',4,1,NULL),(31,'2026-10-17 10:16:33','Facturas',5,1,NULL),(32,'2026-10-17 10:20:17','Remitos',4,1,NULL),(33,'2026-10-17 10:20:17','Remitos',5,1,NULL),(34,'2026-10-17 10:22:26','Orden Venta',5,1,NULL),(35,'2026-10-17 10:23:07','Orden Venta',5,3,NULL),(36,'2026-10-17 10:23:07','Orden Venta',5,3,NULL),(37,'2026-10-17 10:23:07','Orden Venta',5,3,NULL),(38,'2026-10-17 10:24:57','Orden Venta',1,3,NULL),(39,'2026-10-17 10:24:57','Orden Venta',5,3,NULL),(40,'2026-10-17 10:24:57','Orden Venta',4,3,NULL),(41,'2026-10-17 12:09:37','Orden Venta',1,3,NULL),(42,'2026-10-17 12:09:37','Orden Venta',5,3,NULL),(43,'2026-10-17 12:09:37','Orden Venta',4,3,NULL),(44,'2026-10-17 12:09:37','Orden Venta',5,3,NULL),(45,'2026-10-17 12:09:37','Orden Venta',5,3,NULL),(46,'2026-10-17 12:09:37','Orden Venta',5,3,NULL),(47,'2026-10-17 13:09:00','Productos',3,3,NULL),(48,'2026-10-17 13:09:00','Productos',4,3,NULL),(49,'2026-10-17 13:09:00','Productos',1,3,NULL),(50,'2026-10-17 13:09:00','Productos',6,3,NULL),(51,'2026-10-17 13:09:00','Productos',7,3,NULL),(52,'2026-10-17 13:09:00','Productos',2,3,NULL),(53,'2026-10-17 13:13:01','Productos',5,3,NULL),(54,'2026-10-17 13:13:01','Productos',3,3,NULL),(55,'2026-10-17 13:13:01','Productos',1,3,NULL),(56,'2026-10-17 13:13:01','Productos',3,3,NULL),(57,'2026-10-17 13:13:01','Productos',4,3,NULL),(58,'2026-10-17 13:13:01','Productos',1,3,NULL),(59,'2026-10-17 13:13:01','Productos',6,3,NULL),(60,'2026-10-17 13:13:01','Productos',7,3,NULL),(61,'2026-10-17 13:13:01','Productos',2,3,NULL),(62,'2026-10-17 13:25:27','Productos',5,3,NULL),(63,'2026-10-17 13:25:27','Productos',1,3,NULL),(64,'2026-10-17 13:25:27','Productos',1,3,NULL),(65,'2026-10-17 13:25:27','Productos',7,3,NULL),(66,'2026-10-17 13:25:27','Productos',2,3,NULL),(67,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(68,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(69,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(70,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(71,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(72,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(73,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(74,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(75,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(76,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(77,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(78,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(79,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(80,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(81,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(82,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(83,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(84,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(85,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(86,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(87,'2026-10-17 14:03:33','Articulos',NULL,3,NULL),(88,'2026-10-17 14:03:33','Orden Venta',5,1,NULL),(107,'2026-10-23 11:12:54','Articulos',NULL,3,NULL),(108,'2026-10-23 12:34:46','Articulos',6,3,NULL),(109,'2026-10-23 12:34:46','Articulos',6,3,NULL),(110,'2026-10-23 12:34:46','Articulos',6,3,NULL),(111,'2026-10-23 12:34:46','Articulos',6,3,NULL),(112,'2026-10-23 12:34:46','Articulos',6,3,NULL),(113,'2026-10-23 12:34:46','Articulos',6,3,NULL),(114,'2026-10-23 12:34:46','Articulos',6,3,NULL),(115,'2026-10-23 12:34:46','Articulos',6,3,NULL),(116,'2026-10-23 12:34:46','Articulos',6,3,NULL),(117,'2026-10-23 12:34:46','Articulos',6,3,NULL),(118,'2026-10-23 12:34:46','Articulos',6,3,NULL),(119,'2026-10-23 12:34:46','Articulos',6,3,NULL),(120,'2026-10-23 12:34:46','Articulos',6,3,NULL),(121,'2026-10-23 12:34:46','Articulos',6,3,NULL),(122,'2026-10-23 12:34:46','Articulos',6,3,NULL),(123,'2026-10-23 12:34:46','Articulos',6,3,NULL),(124,'2026-10-23 12:34:46','Orden Venta',6,1,NULL),(125,'2026-10-23 13:59:46','Facturas',5,2,NULL),(126,'2026-10-23 13:59:46','Facturas',4,2,NULL),(127,'2026-10-23 13:59:46','Facturas',4,2,NULL),(128,'2026-10-23 13:59:46','Facturas',5,2,NULL),(129,'2026-10-23 14:00:26','Remitos',5,2,NULL),(130,'2026-10-23 14:00:26','Remitos',4,2,NULL),(131,'2026-10-23 14:00:26','Remitos',4,2,NULL),(132,'2026-10-23 14:00:26','Remitos',5,2,NULL),(133,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(134,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(135,'2026-10-23 14:00:26','Orden Venta',4,3,NULL),(136,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(137,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(138,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(139,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(140,'2026-10-23 14:00:26','Orden Venta',4,3,NULL),(141,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(142,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(143,'2026-10-23 14:00:26','Orden Venta',5,3,NULL),(144,'2026-10-23 14:26:57','Articulos',2,3,NULL),(145,'2026-10-23 14:26:57','Articulos',2,3,NULL),(146,'2026-10-23 14:26:57','Articulos',2,3,NULL),(147,'2026-10-23 14:26:57','Articulos',2,3,NULL),(148,'2026-10-23 14:26:57','Articulos',2,3,NULL),(149,'2026-10-23 14:26:57','Articulos',2,3,NULL),(150,'2026-10-23 14:26:57','Articulos',2,3,NULL),(151,'2026-10-23 14:26:57','Articulos',2,3,NULL),(152,'2026-10-23 14:26:57','Articulos',2,3,NULL),(153,'2026-10-23 14:26:57','Articulos',2,3,NULL),(154,'2026-10-23 14:26:57','Articulos',2,3,NULL),(155,'2026-10-23 14:26:57','Articulos',2,3,NULL),(156,'2026-10-23 14:26:57','Articulos',2,3,NULL),(157,'2026-10-23 14:26:57','Articulos',2,3,NULL),(158,'2026-10-23 14:26:57','Articulos',2,3,NULL),(159,'2026-10-23 14:26:57','Articulos',2,3,NULL),(160,'2026-10-23 14:26:57','Orden Venta',2,1,NULL),(161,'2026-10-23 15:04:20','Articulos',2,3,NULL),(162,'2026-10-23 15:04:20','Articulos',2,3,NULL),(163,'2026-10-23 15:04:20','Articulos',2,3,NULL),(164,'2026-10-23 15:04:20','Articulos',2,3,NULL),(165,'2026-10-23 15:04:20','Articulos',2,3,NULL),(166,'2026-10-23 15:04:20','Articulos',2,3,NULL),(167,'2026-10-23 15:04:20','Articulos',2,3,NULL),(168,'2026-10-23 15:04:20','Articulos',2,3,NULL),(169,'2026-10-23 15:04:20','Articulos',2,3,NULL),(170,'2026-10-23 15:04:20','Articulos',2,3,NULL),(171,'2026-10-23 15:04:20','Articulos',2,3,NULL),(172,'2026-10-23 15:04:20','Articulos',2,3,NULL),(173,'2026-10-23 15:04:20','Articulos',2,3,NULL),(174,'2026-10-23 15:04:20','Articulos',2,3,NULL),(175,'2026-10-23 15:04:20','Articulos',2,3,NULL),(176,'2026-10-23 15:04:20','Articulos',2,3,NULL),(177,'2026-10-23 15:04:20','Articulos',2,3,NULL),(178,'2026-10-23 15:04:20','Articulos',2,3,NULL),(179,'2026-10-23 15:04:20','Articulos',2,3,NULL),(180,'2026-10-23 15:04:20','Articulos',2,3,NULL),(181,'2026-10-23 15:04:20','Articulos',2,3,NULL),(182,'2026-10-23 15:04:20','Articulos',2,3,NULL),(183,'2026-10-23 15:04:20','Articulos',2,3,NULL),(184,'2026-10-23 15:04:20','Articulos',2,3,NULL),(185,'2026-10-23 15:04:20','Articulos',2,3,NULL),(186,'2026-10-23 15:04:20','Articulos',2,3,NULL),(187,'2026-10-23 15:04:20','Articulos',2,3,NULL),(188,'2026-10-23 15:04:20','Articulos',2,3,NULL),(189,'2026-10-23 15:04:20','Articulos',2,3,NULL),(190,'2026-10-23 15:04:20','Articulos',2,3,NULL),(191,'2026-10-23 15:04:20','Articulos',2,3,NULL),(192,'2026-10-23 15:04:20','Articulos',2,3,NULL),(193,'2026-10-23 15:04:20','Orden Venta',2,3,NULL),(194,'2026-10-23 15:04:36','Articulos',2,3,NULL),(195,'2026-10-23 15:04:36','Articulos',2,3,NULL),(196,'2026-10-23 15:04:36','Articulos',2,3,NULL),(197,'2026-10-23 15:04:36','Articulos',2,3,NULL),(198,'2026-10-23 15:04:36','Articulos',2,3,NULL),(199,'2026-10-23 15:04:36','Articulos',2,3,NULL),(200,'2026-10-23 15:04:36','Articulos',2,3,NULL),(201,'2026-10-23 15:04:36','Articulos',2,3,NULL),(202,'2026-10-23 15:04:36','Articulos',2,3,NULL),(203,'2026-10-23 15:04:36','Articulos',2,3,NULL),(204,'2026-10-23 15:04:36','Articulos',2,3,NULL),(205,'2026-10-23 15:04:36','Articulos',2,3,NULL),(206,'2026-10-23 15:04:36','Articulos',2,3,NULL),(207,'2026-10-23 15:04:36','Articulos',2,3,NULL),(208,'2026-10-23 15:04:36','Articulos',2,3,NULL),(209,'2026-10-23 15:04:36','Articulos',2,3,NULL),(210,'2026-10-23 15:04:36','Orden Venta',2,2,NULL),(243,'2026-10-23 15:15:16','Articulos',2,3,NULL),(244,'2026-10-23 15:15:16','Articulos',2,3,NULL),(245,'2026-10-23 15:15:16','Articulos',2,3,NULL),(246,'2026-10-23 15:15:16','Articulos',2,3,NULL),(247,'2026-10-23 15:15:16','Articulos',2,3,NULL),(248,'2026-10-23 15:15:16','Articulos',2,3,NULL),(249,'2026-10-23 15:15:16','Articulos',2,3,NULL),(250,'2026-10-23 15:15:16','Articulos',2,3,NULL),(251,'2026-10-23 15:15:16','Articulos',2,3,NULL),(252,'2026-10-23 15:15:16','Articulos',2,3,NULL),(253,'2026-10-23 15:15:16','Articulos',2,3,NULL),(254,'2026-10-23 15:15:16','Articulos',2,3,NULL),(255,'2026-10-23 15:15:16','Articulos',2,3,NULL),(256,'2026-10-23 15:15:16','Articulos',2,3,NULL),(257,'2026-10-23 15:15:16','Articulos',2,3,NULL),(258,'2026-10-23 15:15:16','Articulos',2,3,NULL),(259,'2026-10-23 15:15:16','Articulos',2,3,NULL),(260,'2026-10-23 15:15:16','Articulos',2,3,NULL),(261,'2026-10-23 15:15:16','Articulos',2,3,NULL),(262,'2026-10-23 15:15:16','Articulos',2,3,NULL),(263,'2026-10-23 15:15:16','Articulos',2,3,NULL),(264,'2026-10-23 15:15:16','Articulos',2,3,NULL),(265,'2026-10-23 15:15:16','Articulos',2,3,NULL),(266,'2026-10-23 15:15:16','Articulos',2,3,NULL),(267,'2026-10-23 15:15:16','Articulos',2,3,NULL),(268,'2026-10-23 15:15:16','Articulos',2,3,NULL),(269,'2026-10-23 15:15:16','Articulos',2,3,NULL),(270,'2026-10-23 15:15:16','Articulos',2,3,NULL),(271,'2026-10-23 15:15:16','Articulos',2,3,NULL),(272,'2026-10-23 15:15:16','Articulos',2,3,NULL),(273,'2026-10-23 15:15:16','Articulos',2,3,NULL),(274,'2026-10-23 15:15:16','Articulos',2,3,NULL),(275,'2026-10-23 15:15:16','Articulos',2,3,NULL),(276,'2026-10-23 15:15:16','Articulos',2,3,NULL),(277,'2026-10-23 15:15:16','Articulos',2,3,NULL),(278,'2026-10-23 15:15:16','Articulos',2,3,NULL),(279,'2026-10-23 15:15:16','Articulos',2,3,NULL),(280,'2026-10-23 15:15:16','Articulos',2,3,NULL),(281,'2026-10-23 15:15:16','Articulos',2,3,NULL),(282,'2026-10-23 15:15:16','Articulos',2,3,NULL),(283,'2026-10-23 15:15:16','Articulos',2,3,NULL),(284,'2026-10-23 15:15:16','Articulos',2,3,NULL),(285,'2026-10-23 15:15:16','Articulos',2,3,NULL),(286,'2026-10-23 15:15:16','Articulos',2,3,NULL),(287,'2026-10-23 15:15:16','Articulos',2,3,NULL),(288,'2026-10-23 15:15:16','Articulos',2,3,NULL),(289,'2026-10-23 15:15:16','Articulos',2,3,NULL),(290,'2026-10-23 15:15:16','Articulos',2,3,NULL),(291,'2026-10-23 15:15:16','Orden Venta',6,3,NULL);
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audmov`
--

DROP TABLE IF EXISTS `audmov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audmov` (
  `idMov` int NOT NULL AUTO_INCREMENT COMMENT 'ID del tipo de movimiento de auditoría\\n',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de movimiento\\n\\n',
  PRIMARY KEY (`idMov`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena el detalle de los movimientos registrados en audit.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audmov`
--

LOCK TABLES `audmov` WRITE;
/*!40000 ALTER TABLE `audmov` DISABLE KEYS */;
INSERT INTO `audmov` VALUES (1,'ALTA'),(2,'BAJA'),(3,'MODIFICACION');
/*!40000 ALTER TABLE `audmov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc`
--

DROP TABLE IF EXISTS `cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc` (
  `idQC` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de control de calidad',
  `fecha` date NOT NULL COMMENT 'Fecha en que se realizó el control',
  `resultado` varchar(15) NOT NULL COMMENT 'Se detalla si se aprobó el control de calidad, escribiendo "Aprobado" cuando si, y "No aprobado" cuando no.',
  `motivo` varchar(100) DEFAULT NULL COMMENT 'motivo → Motivo del rechazo en caso de no aprobación',
  `idOV` int NOT NULL COMMENT 'ID de la orden de venta evaluada (referencia a ovcab)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que realizó el control (referencia a usuarios)',
  PRIMARY KEY (`idQC`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idOVFK_idx` (`idOV`),
  CONSTRAINT `idOVFK` FOREIGN KEY (`idOV`) REFERENCES `ovcab` (`idOV`),
  CONSTRAINT `idUsFK` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los resultados de las inspecciones realizadas sobre productos terminados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc`
--

LOCK TABLES `cc` WRITE;
/*!40000 ALTER TABLE `cc` DISABLE KEYS */;
INSERT INTO `cc` VALUES (1,'2026-08-27','Aprobado',NULL,1,1),(2,'2026-09-04','No aprobado','Falla en tapizado',2,2),(3,'2026-09-06','Aprobado',NULL,2,2),(4,'2026-09-09','Aprobado',NULL,3,3),(5,'2026-10-18','Aprobado',NULL,4,4);
/*!40000 ALTER TABLE `cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claseprov`
--

DROP TABLE IF EXISTS `claseprov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claseprov` (
  `idProClase` int NOT NULL,
  `idProv` int NOT NULL,
  `idTipArt` int NOT NULL,
  `clase` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProClase`),
  KEY `idProv` (`idProv`),
  KEY `idTipArt` (`idTipArt`),
  CONSTRAINT `claseprov_ibfk_1` FOREIGN KEY (`idProv`) REFERENCES `proveedores` (`idProv`),
  CONSTRAINT `claseprov_ibfk_2` FOREIGN KEY (`idTipArt`) REFERENCES `tipart` (`idTipArt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claseprov`
--

LOCK TABLES `claseprov` WRITE;
/*!40000 ALTER TABLE `claseprov` DISABLE KEYS */;
INSERT INTO `claseprov` VALUES (1,1,1,'TORNILLOS'),(2,1,7,'CLAVOS'),(3,1,19,'TARUGOS'),(4,2,2,'MADERAS'),(5,3,3,'PEGAMENTOS'),(6,4,4,'HERRAMIENTAS'),(7,5,5,'LIBRERIA'),(8,6,6,'MAQUINAS ELECT.'),(9,7,7,'CLAVOS'),(10,7,1,'TORNILLOS'),(11,8,8,'MANIJAS'),(12,9,9,'REGATONES'),(13,9,10,'ESQUINEROS'),(14,10,9,'REGATONES'),(15,10,10,'ESQUINEROS'),(16,11,11,'CUERINA'),(17,11,12,'VINILICOS'),(18,12,20,'LOGOS'),(19,13,13,'TELAS'),(20,14,20,'LOGOS'),(21,15,15,'PINTURAS'),(22,15,14,'LACAS'),(23,16,20,'LOGOS'),(24,17,17,'TONERS'),(25,18,18,'RUEDAS'),(26,19,18,'RUEDAS'),(27,20,5,'LIBRERIA'),(28,21,21,'CHAPA APOYO'),(29,22,16,'CUEROS'),(30,22,22,'CURTIEMBRE'),(31,23,23,'MADERA ESPECIAL'),(32,24,24,'ELECTRICIDAD'),(33,26,13,'TELAS'),(34,27,4,'HERRAMIENTAS'),(35,28,2,'MADERAS'),(36,29,20,'LOGOS');
/*!40000 ALTER TABLE `claseprov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) DEFAULT NULL,
  `razonSocial` varchar(150) NOT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `calleNro` int DEFAULT NULL,
  `codPos` int DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `idPcia` int DEFAULT NULL,
  `tel1` varchar(25) DEFAULT NULL,
  `tel2` varchar(25) DEFAULT NULL,
  `tel3` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecIng` date DEFAULT NULL,
  `ultTrx` int DEFAULT NULL,
  `idVendedor` int DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idPcia` (`idPcia`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idPcia`) REFERENCES `provincias` (`idPcia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fender','Fender LLC',NULL,'Fleming 1234','Fleming',1234,1234,'Florida',1,'1111-2222','1111-2223','1111-2224','fenderllc@fender.com','2015-01-01',NULL,4,'A'),(2,'Marshall','Marshall Inc',NULL,'Corrientes 2233','Corrientes',2233,1400,'CABA',1,'2222-1111','2222-1112','2222-1113','Marshall@marshall.com','2014-02-10',NULL,5,'A'),(3,'Mesa Boogie','Mesa LLC',NULL,'Larrea 2211','Larrea',2211,1405,'CABA',1,'3333-2211','3333-2222',NULL,'mesa@mesa.com','2014-01-08',NULL,4,'A'),(4,'Soldano','Soldano',NULL,'Mitre 4550','Mitre',4550,2020,'San Isidro',1,'1111-2254','1111-8989',NULL,'soldano@soldano.com','2019-10-10',NULL,5,'A'),(5,'Bogner','Bogner Amp Inc',NULL,'Cordoba 6080','Cordoba',6080,1300,'CABA',1,'2223-5454',NULL,NULL,'bogneramp@bogneramp.com','2018-09-10',NULL,4,'A'),(6,'Rivera','Rivera Music LLC',NULL,'Pasteur 1200','Pasteur',1200,1344,'CABA',1,'2233-4455','2233-5544',NULL,'riverainfo@rivera.com','2017-10-01',NULL,5,'A');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `idEntrega` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la modalidad de entrega',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción de la modalidad de entrega',
  PRIMARY KEY (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define las modalidades mediante las cuales los productos pueden ser enviados o retirados por los clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,'Retiro en Fábrica'),(2,'Envío por Correo Argentino'),(3,'Flete Privado'),(4,'Moto Mensajería');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `idEstado` int NOT NULL AUTO_INCREMENT COMMENT 'ID del estado',
  `tipo` varchar(15) NOT NULL COMMENT 'Tipo de entidad a la que aplica el estado (ej. OV, OC, OF)',
  `descripcion` varchar(50) DEFAULT NULL COMMENT 'Descripción del estado',
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='centraliza los distintos estados posibles de los documentos del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'OVP','PENDIENTE'),(2,'OVF','OV FINALIZADA'),(3,'FAC','FACTURADA'),(4,'REM','REMITIDA'),(5,'COB','COBRADA');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacab`
--

DROP TABLE IF EXISTS `facturacab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacab` (
  `idFactura` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la factura',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión de la factura',
  `numeroFactura` varchar(50) DEFAULT NULL COMMENT 'Número de comprobante de la factura',
  `subtotal` decimal(12,2) NOT NULL COMMENT 'Importe antes de impuestos, expresado en pesos',
  `total` decimal(12,2) DEFAULT NULL COMMENT 'Importe total con impuestos incluidos, expresado en pesos',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que se emite la factura (referencia a clientes)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idFactura`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `facturacab_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `facturacab_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las facturas emitidas a los clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacab`
--

LOCK TABLES `facturacab` WRITE;
/*!40000 ALTER TABLE `facturacab` DISABLE KEYS */;
INSERT INTO `facturacab` VALUES (1,'2026-09-01','2',26800.00,32428.00,1,5);
/*!40000 ALTER TABLE `facturacab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturacab_AFTER_INSERT` AFTER INSERT ON `facturacab` FOR EACH ROW BEGIN
	call NuevoMov("Facturas", new.idUsuario, 1, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturacab_AFTER_UPDATE` AFTER UPDATE ON `facturacab` FOR EACH ROW BEGIN
	call NuevoMov("Facturas", new.idUsuario, 3, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_facturacab_actualizar_estado` AFTER UPDATE ON `facturacab` FOR EACH ROW BEGIN CALL ActualizarOVDeFactura(NEW.idFactura); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facturacab_AFTER_DELETE` AFTER DELETE ON `facturacab` FOR EACH ROW BEGIN
	call NuevoMov("Facturas", old.idUsuario, 2, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturasdet`
--

DROP TABLE IF EXISTS `facturasdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturasdet` (
  `idFacturaDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de la factura',
  `cantidad` decimal(8,2) NOT NULL COMMENT 'Cantidad del producto facturado',
  `precioUnitario` decimal(10,2) NOT NULL COMMENT 'Precio unitario del producto facturado, expresado en pesos',
  `subtotal` decimal(8,2) NOT NULL COMMENT 'Subtotal del renglón (cantidad × precio unitario), expresado en pesos',
  `idFactura` int NOT NULL COMMENT 'ID de la factura cabecera (referencia a facturacab)',
  `idProducto` int NOT NULL COMMENT 'ID del producto facturado (referencia a productos)\\n',
  `detalleprod` varchar(150) DEFAULT NULL,
  `idRemito` int DEFAULT NULL,
  `idOVDet` int DEFAULT NULL,
  PRIMARY KEY (`idFacturaDet`),
  KEY `idFactura` (`idFactura`),
  KEY `idProducto` (`idProducto`),
  KEY `idRemitoFK_idx` (`idRemito`),
  KEY `fk_facturasdet_ovdet_reparacion` (`idOVDet`),
  CONSTRAINT `facturasdet_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `facturacab` (`idFactura`),
  CONSTRAINT `facturasdet_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_facturasdet_ovdet_reparacion` FOREIGN KEY (`idOVDet`) REFERENCES `ovdet` (`idOVDet`),
  CONSTRAINT `idRemitoFK` FOREIGN KEY (`idRemito`) REFERENCES `remitoscab` (`idRemito`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los productos incluidos en cada factura emitida a clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasdet`
--

LOCK TABLES `facturasdet` WRITE;
/*!40000 ALTER TABLE `facturasdet` DISABLE KEYS */;
INSERT INTO `facturasdet` VALUES (8,1.00,26800.00,26800.00,1,4,'Hot Rod Deluxe III',1,NULL);
/*!40000 ALTER TABLE `facturasdet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bi_facturasdet_validar_produccion` BEFORE INSERT ON `facturasdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    DECLARE v_total INT DEFAULT 0;
    DECLARE v_pendientes INT DEFAULT 0;

    IF NEW.idOVDet IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cada renglón de factura debe referenciar el ítem de la OV mediante idOVDet.';
    END IF;
    SET v_idOV = (SELECT d.idOV FROM ovdet d WHERE d.idOVDet = NEW.idOVDet LIMIT 1);
    IF v_idOV IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ítem asociado a la factura no existe.';
    END IF;

    SELECT COUNT(*) INTO v_total
    FROM ovdet d
    JOIN productos p ON p.idProducto = d.idProducto
    JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
    WHERE d.idOV = v_idOV AND (rp.idProceso <> 3 OR p.CC IS NOT NULL);

    SELECT COUNT(*) INTO v_pendientes
    FROM ovdet d
    JOIN productos p ON p.idProducto = d.idProducto
    JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
    LEFT JOIN (
        SELECT idOVDet, idPro, SUM(cantP) AS cantidad_producida
        FROM produccion GROUP BY idOVDet, idPro
    ) prod ON prod.idOVDet = d.idOVDet AND prod.idPro = rp.idProceso
    WHERE d.idOV = v_idOV
      AND (rp.idProceso <> 3 OR p.CC IS NOT NULL)
      AND COALESCE(prod.cantidad_producida, 0) < d.cantidad;

    IF v_total = 0 OR v_pendientes > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede facturar: la OV todavía tiene producción pendiente.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_facturasdet_actualizar_estado` AFTER INSERT ON `facturasdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    IF NEW.idOVDet IS NOT NULL THEN
        SET v_idOV = (SELECT d.idOV FROM ovdet d WHERE d.idOVDet = NEW.idOVDet LIMIT 1);
        IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_facturasdet_actualizar_estado` AFTER UPDATE ON `facturasdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    IF OLD.idOVDet IS NOT NULL THEN
        SET v_idOV = (SELECT d.idOV FROM ovdet d WHERE d.idOVDet = OLD.idOVDet LIMIT 1);
        IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
    END IF;
    IF NEW.idOVDet IS NOT NULL THEN
        SET v_idOV = (SELECT d.idOV FROM ovdet d WHERE d.idOVDet = NEW.idOVDet LIMIT 1);
        IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_facturasdet_actualizar_estado` AFTER DELETE ON `facturasdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    IF OLD.idOVDet IS NOT NULL THEN
        SET v_idOV = (SELECT d.idOV FROM ovdet d WHERE d.idOVDet = OLD.idOVDet LIMIT 1);
        IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturasprovcab`
--

DROP TABLE IF EXISTS `facturasprovcab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturasprovcab` (
  `idFacturaProv` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la factura del proveedor',
  `fecha` date NOT NULL COMMENT 'Fecha de recepción de la factura del proveedor',
  `numeroFactura` varchar(50) NOT NULL COMMENT 'Número de comprobante de la factura del proveedor',
  `importe` decimal(12,2) NOT NULL COMMENT 'Importe total de la factura, expresado en pesos',
  `idProveedor` int DEFAULT NULL COMMENT 'ID del proveedor que emitió la factura (referencia a proveedores)',
  `idOC` int DEFAULT NULL COMMENT 'ID de la orden de compra asociada (referencia a occab)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idFacturaProv`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idOC` (`idOC`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `facturasprovcab_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProv`),
  CONSTRAINT `facturasprovcab_ibfk_2` FOREIGN KEY (`idOC`) REFERENCES `occab` (`idOC`),
  CONSTRAINT `facturasprovcab_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las facturas emitidas por los proveedores una vez entregada la mercadería.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasprovcab`
--

LOCK TABLES `facturasprovcab` WRITE;
/*!40000 ALTER TABLE `facturasprovcab` DISABLE KEYS */;
INSERT INTO `facturasprovcab` VALUES (1,'2026-10-15','0001-00001234',25000.00,2,1,1),(2,'2026-10-20','0002-00005678',45000.00,12,3,3);
/*!40000 ALTER TABLE `facturasprovcab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occab`
--

DROP TABLE IF EXISTS `occab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occab` (
  `idOC` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la orden de compra',
  `fecha` date NOT NULL COMMENT 'Fecha de creación de la orden de compra',
  `total` decimal(12,2) NOT NULL COMMENT 'Importe total de la orden, expresado en pesos',
  `idProveedor` int NOT NULL COMMENT 'ID del proveedor al que se emite la orden (referencia a proveedores)',
  `idEstado` int NOT NULL COMMENT 'ID del estado actual de la orden de compra (referencia a estados)\\n',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idOC`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idEstado` (`idEstado`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `occab_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProv`),
  CONSTRAINT `occab_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  CONSTRAINT `occab_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa el documento formal de orden de compra emitido al proveedor seleccionado.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occab`
--

LOCK TABLES `occab` WRITE;
/*!40000 ALTER TABLE `occab` DISABLE KEYS */;
INSERT INTO `occab` VALUES (1,'2026-10-01',25000.00,2,2,1),(2,'2026-10-05',12000.00,3,1,2),(3,'2026-10-10',45000.00,12,2,3);
/*!40000 ALTER TABLE `occab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocdet`
--

DROP TABLE IF EXISTS `ocdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocdet` (
  `idOCDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de la orden de compra',
  `cantidad` decimal(8,2) NOT NULL COMMENT 'Cantidad del artículo solicitado',
  `precioUnitario` decimal(12,2) NOT NULL COMMENT 'Precio unitario del artículo, expresado en pesos',
  `subtotal` decimal(12,2) NOT NULL COMMENT 'Subtotal (cantidad × precio unitario), expresado en pesos\\n',
  `idOC` int NOT NULL COMMENT 'ID de la orden de compra cabecera (referencia a occab)',
  `idArticulo` int NOT NULL COMMENT 'ID del artículo solicitado (referencia a articulos)\\n',
  `idSolicitud` int NOT NULL,
  PRIMARY KEY (`idOCDet`),
  KEY `idOC` (`idOC`),
  KEY `idArticulo` (`idArticulo`),
  KEY `idSolicitudFK_idx` (`idSolicitud`),
  CONSTRAINT `idSolicitudFK` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudpedido` (`idSolicitud`),
  CONSTRAINT `ocdet_ibfk_1` FOREIGN KEY (`idOC`) REFERENCES `occab` (`idOC`),
  CONSTRAINT `ocdet_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los materiales solicitados al proveedor, incluyendo cantidades y precios acordados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocdet`
--

LOCK TABLES `ocdet` WRITE;
/*!40000 ALTER TABLE `ocdet` DISABLE KEYS */;
INSERT INTO `ocdet` VALUES (1,100.00,200.00,20000.00,1,6,1),(2,50.00,100.00,5000.00,1,22,1),(3,150.00,80.00,12000.00,2,12,2),(4,100.00,120.00,12000.00,3,23,3);
/*!40000 ALTER TABLE `ocdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovcab`
--

DROP TABLE IF EXISTS `ovcab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ovcab` (
  `idOV` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la orden de venta',
  `fCreacion` date NOT NULL COMMENT 'fecha de creacion',
  `fEntrega` date NOT NULL COMMENT 'Fecha estimada de entrega al cliente',
  `cant` int NOT NULL COMMENT 'Cantidad total de productos en la orden',
  `subtotal` decimal(12,2) DEFAULT NULL COMMENT 'Importe antes de impuestos, expresado en pesos',
  `total` decimal(12,2) DEFAULT NULL COMMENT 'Importe total con impuestos incluidos, expresado en pesos',
  `idEstado` int NOT NULL COMMENT 'ID del estado actual de la orden de venta (referencia a estados)',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que corresponde la orden (referencia a clientes)',
  `idVendedor` int NOT NULL COMMENT 'ID del vendedor que generó la orden (referencia a usuarios)',
  `idEntrega` int DEFAULT NULL COMMENT 'ID de la modalidad de entrega pactada (referencia a entregas)',
  `observaciones` varchar(50) DEFAULT NULL COMMENT 'Notas u observaciones adicionales sobre la orden',
  PRIMARY KEY (`idOV`),
  UNIQUE KEY `idOV_UNIQUE` (`idOV`),
  KEY `idCliente` (`idCliente`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idEstado` (`idEstado`),
  KEY `idEntrega` (`idEntrega`),
  CONSTRAINT `ovcab_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `ovcab_ibfk_2` FOREIGN KEY (`idVendedor`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `ovcab_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`),
  CONSTRAINT `ovcab_ibfk_4` FOREIGN KEY (`idEntrega`) REFERENCES `entregas` (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa el documento comercial generado cuando un cliente realiza un pedido.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovcab`
--

LOCK TABLES `ovcab` WRITE;
/*!40000 ALTER TABLE `ovcab` DISABLE KEYS */;
INSERT INTO `ovcab` VALUES (1,'2026-08-02','2026-08-28',10,12000.00,1452000.00,5,1,1,NULL,NULL),(2,'2026-08-10','2026-09-05',4,45000.00,54450.00,1,2,5,NULL,NULL),(3,'2026-08-15','2026-09-10',2,298017.90,360601.66,1,3,4,NULL,NULL),(4,'2026-10-01','2026-10-20',2,300000.00,363000.00,1,4,5,NULL,''),(5,'2026-10-05','2026-10-25',3,450000.00,544500.00,1,6,5,NULL,''),(6,'2026-09-20','2026-10-10',4,180000.00,217800.00,1,2,5,NULL,''),(7,'2026-10-17','2026-10-28',1,137242.08,166062.92,1,1,5,NULL,NULL),(8,'2026-10-23','2026-10-30',3,85677.19,103669.40,1,2,6,NULL,NULL);
/*!40000 ALTER TABLE `ovcab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ovcab_AFTER_INSERT` AFTER INSERT ON `ovcab` FOR EACH ROW BEGIN
	call NuevoMov("Orden Venta", new.idVendedor, 1, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ovcab_AFTER_UPDATE` AFTER UPDATE ON `ovcab` FOR EACH ROW BEGIN
	call NuevoMov("Orden Venta", new.idVendedor, 3, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ovcab_AFTER_DELETE` AFTER DELETE ON `ovcab` FOR EACH ROW BEGIN
	call NuevoMov("Orden Venta", old.idVendedor, 2, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ovdet`
--

DROP TABLE IF EXISTS `ovdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ovdet` (
  `idOVDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de la orden de venta',
  `nItem` int DEFAULT NULL,
  `cantidad` decimal(10,2) NOT NULL COMMENT 'Cantidad del producto en el renglón',
  `precioUnitario` decimal(12,2) NOT NULL COMMENT 'Precio unitario del producto, expresado en pesos',
  `subtotal` decimal(12,2) NOT NULL COMMENT 'Subtotal del renglón (cantidad × precio unitario), expresado en pesos',
  `idOV` int NOT NULL COMMENT 'ID de la orden de venta cabecera (referencia a ovcab)',
  `idProducto` int NOT NULL COMMENT 'ID del producto (referencia a productos)',
  PRIMARY KEY (`idOVDet`),
  KEY `idOV` (`idOV`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `ovdet_ibfk_1` FOREIGN KEY (`idOV`) REFERENCES `ovcab` (`idOV`),
  CONSTRAINT `ovdet_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los productos solicitados en cada orden de venta, junto con cantidades y precios acordados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovdet`
--

LOCK TABLES `ovdet` WRITE;
/*!40000 ALTER TABLE `ovdet` DISABLE KEYS */;
INSERT INTO `ovdet` VALUES (1,1,5.00,1200.00,1000.00,1,1),(2,2,2.00,1000.00,1000.00,1,3),(3,3,3.00,1900.00,1900.00,1,7),(4,1,4.00,11250.00,45000.00,2,5),(5,1,2.00,149008.95,298017.90,3,3),(6,1,2.00,150000.00,300000.00,4,11),(7,1,3.00,150000.00,450000.00,5,10),(8,1,4.00,45000.00,180000.00,6,8),(9,1,1.00,137242.08,137242.08,7,4),(13,1,2.00,17861.88,35723.76,8,5),(14,2,1.00,49953.43,49953.43,8,8);
/*!40000 ALTER TABLE `ovdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoprov`
--

DROP TABLE IF EXISTS `pagoprov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagoprov` (
  `idPagoProv` int NOT NULL AUTO_INCREMENT COMMENT 'ID del pago al proveedor',
  `fecha` date NOT NULL COMMENT 'Fecha en que se realizó el pago',
  `importe` decimal(12,2) NOT NULL COMMENT 'Importe pagado, expresado en pesos',
  `medioPago` varchar(50) NOT NULL COMMENT 'Medio de pago utilizado (ej. transferencia, cheque, efectivo)',
  `idFacturaProv` int NOT NULL COMMENT 'ID de la factura del proveedor que se cancela (referencia a facturasprovcab)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idPagoProv`),
  KEY `idFacturaProv` (`idFacturaProv`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `pagoprovcab_ibfk_1` FOREIGN KEY (`idFacturaProv`) REFERENCES `facturasprovcab` (`idFacturaProv`),
  CONSTRAINT `pagoprovcab_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa el documento mediante el cual Tesorería efectúa el pago a un proveedor.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoprov`
--

LOCK TABLES `pagoprov` WRITE;
/*!40000 ALTER TABLE `pagoprov` DISABLE KEYS */;
INSERT INTO `pagoprov` VALUES (1,'2026-10-18',25000.00,'Transferencia',1,1),(2,'2026-10-22',45000.00,'Cheque',2,3);
/*!40000 ALTER TABLE `pagoprov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `idProceso` int NOT NULL AUTO_INCREMENT,
  `codigoProceso` varchar(10) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `tiempoEstimadoBase` time DEFAULT NULL,
  `ordenProceso` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idProceso`),
  UNIQUE KEY `codigoProceso_UNIQUE` (`codigoProceso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES (1,'AC1','ACOPIO 1','00:35:00',1),(2,'AC2','ACOPIO 2','00:28:00',4),(3,'CC','CONTROL CALIDAD','00:25:00',7),(4,'EN1','ENSAMBLADO 1','01:20:00',2),(5,'EN2','ENSAMBLADO 2','00:45:00',5),(6,'LUS','LUSTRADO','04:00:00',6),(7,'PIN','PINTURA','06:00:00',3),(8,'TAP','TAPICERIA','02:30:00',3);
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `idProduccion` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de producción',
  `idOV` int NOT NULL COMMENT 'ID de la orden de fabricación ejecutada (referencia a ofcab)',
  `idPro` int NOT NULL COMMENT 'ID del proceso productivo realizado (referencia a procesos)',
  `idUs` int NOT NULL COMMENT 'ID del operario que realizó la producción (referencia a usuarios)',
  `hFin` datetime NOT NULL COMMENT 'Fecha y hora de finalización de la producción',
  `cantP` int NOT NULL COMMENT 'Cantidad producida',
  `idOVDet` int NOT NULL,
  PRIMARY KEY (`idProduccion`),
  UNIQUE KEY `idProduccion_UNIQUE` (`idProduccion`),
  KEY `idOV` (`idOV`),
  KEY `idProceso` (`idPro`),
  KEY `idUsuario` (`idUs`),
  KEY `produccion_ibfk_4_idx` (`idOVDet`),
  CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`idOV`) REFERENCES `ovcab` (`idOV`),
  CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`idPro`) REFERENCES `procesos` (`idProceso`),
  CONSTRAINT `produccion_ibfk_3` FOREIGN KEY (`idUs`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `produccion_ibfk_4` FOREIGN KEY (`idOVDet`) REFERENCES `ovdet` (`idOVDet`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra cada avance realizado durante el proceso productivo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,1,1,1,'2026-08-03 09:00:00',5,1),(2,1,4,3,'2026-08-04 11:00:00',5,1),(3,1,2,6,'2026-08-05 14:00:00',5,1),(4,1,8,7,'2026-08-06 16:30:00',5,1),(5,1,5,11,'2026-08-07 10:00:00',5,1),(6,1,3,4,'2026-08-08 12:00:00',5,1),(7,1,1,1,'2026-08-03 10:00:00',2,2),(8,1,4,3,'2026-08-04 12:00:00',2,2),(9,1,2,6,'2026-08-05 15:00:00',2,2),(10,1,8,7,'2026-08-06 17:00:00',2,2),(11,1,5,11,'2026-08-07 11:30:00',2,2),(12,1,3,4,'2026-08-08 13:00:00',2,2),(13,1,1,1,'2026-08-03 11:30:00',3,3),(14,1,4,3,'2026-08-04 14:00:00',3,3),(15,1,2,6,'2026-08-05 16:30:00',3,3),(16,1,8,7,'2026-08-07 09:00:00',3,3),(17,1,5,11,'2026-08-07 15:00:00',3,3),(18,1,3,4,'2026-08-08 14:30:00',3,3),(19,2,1,12,'2026-08-11 08:30:00',4,4),(20,2,4,13,'2026-08-12 11:00:00',4,4),(22,3,1,1,'2026-08-16 09:00:00',2,5),(23,3,4,3,'2026-08-17 11:30:00',2,5),(26,4,1,1,'2026-10-02 10:00:00',2,6),(27,4,4,4,'2026-10-03 15:30:00',2,6),(29,5,1,14,'2026-10-06 09:00:00',1,7),(30,6,1,1,'2026-09-22 10:00:00',4,8),(31,6,4,4,'2026-09-25 15:30:00',2,8);
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bi_validar_produccion_secuencial` BEFORE INSERT ON `produccion` FOR EACH ROW BEGIN
    DECLARE v_producto INT DEFAULT NULL;
    DECLARE v_cantidad DECIMAL(10,2) DEFAULT NULL;
    DECLARE v_orden INT DEFAULT NULL;
    DECLARE v_anterior INT DEFAULT NULL;
    DECLARE v_actual DECIMAL(12,2) DEFAULT 0;
    DECLARE v_anterior_cantidad DECIMAL(12,2) DEFAULT 0;

    SET v_producto = (SELECT d.idProducto FROM ovdet d
                      WHERE d.idOVDet = NEW.idOVDet AND d.idOV = NEW.idOV LIMIT 1);
    SET v_cantidad = (SELECT d.cantidad FROM ovdet d
                      WHERE d.idOVDet = NEW.idOVDet AND d.idOV = NEW.idOV LIMIT 1);
    IF v_producto IS NULL OR v_cantidad IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La producción no coincide con un ítem válido de la OV.';
    END IF;
    IF NEW.cantP <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad producida debe ser mayor que cero.';
    END IF;

    SET v_orden = (SELECT rp.ordenProceso FROM recprocesos rp
                   WHERE rp.idOV = NEW.idOV AND rp.idProducto = v_producto
                     AND rp.idProceso = NEW.idPro LIMIT 1);
    IF v_orden IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proceso no pertenece a la hoja de ruta de este producto.';
    END IF;

    SELECT COALESCE(SUM(p.cantP), 0) INTO v_actual
    FROM produccion p
    WHERE p.idOVDet = NEW.idOVDet AND p.idPro = NEW.idPro;
    IF v_actual + NEW.cantP > v_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La producción acumulada supera la cantidad solicitada.';
    END IF;

    SET v_anterior = (
        SELECT rp.idProceso
        FROM recprocesos rp
        WHERE rp.idOV = NEW.idOV AND rp.idProducto = v_producto
          AND rp.ordenProceso < v_orden
        ORDER BY rp.ordenProceso DESC
        LIMIT 1
    );
    IF v_anterior IS NOT NULL THEN
        SELECT COALESCE(SUM(p.cantP), 0) INTO v_anterior_cantidad
        FROM produccion p
        WHERE p.idOVDet = NEW.idOVDet AND p.idPro = v_anterior;
        IF v_anterior_cantidad < v_actual + NEW.cantP THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede producir esta cantidad: la etapa anterior no la completó.';
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_produccion_actualizar_estado` AFTER INSERT ON `produccion` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(NEW.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bu_validar_produccion_secuencial` BEFORE UPDATE ON `produccion` FOR EACH ROW BEGIN
    DECLARE v_producto INT DEFAULT NULL;
    DECLARE v_cantidad DECIMAL(10,2) DEFAULT NULL;
    DECLARE v_orden INT DEFAULT NULL;
    DECLARE v_anterior INT DEFAULT NULL;
    DECLARE v_actual DECIMAL(12,2) DEFAULT 0;
    DECLARE v_anterior_cantidad DECIMAL(12,2) DEFAULT 0;

    SET v_producto = (SELECT d.idProducto FROM ovdet d
                      WHERE d.idOVDet = NEW.idOVDet AND d.idOV = NEW.idOV LIMIT 1);
    SET v_cantidad = (SELECT d.cantidad FROM ovdet d
                      WHERE d.idOVDet = NEW.idOVDet AND d.idOV = NEW.idOV LIMIT 1);
    IF v_producto IS NULL OR v_cantidad IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La producción no coincide con un ítem válido de la OV.';
    END IF;
    IF NEW.cantP <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad producida debe ser mayor que cero.';
    END IF;

    SET v_orden = (SELECT rp.ordenProceso FROM recprocesos rp
                   WHERE rp.idOV = NEW.idOV AND rp.idProducto = v_producto
                     AND rp.idProceso = NEW.idPro LIMIT 1);
    IF v_orden IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proceso no pertenece a la hoja de ruta de este producto.';
    END IF;

    SELECT COALESCE(SUM(p.cantP), 0) INTO v_actual
    FROM produccion p
    WHERE p.idOVDet = NEW.idOVDet AND p.idPro = NEW.idPro
      AND p.idProduccion <> OLD.idProduccion;
    IF v_actual + NEW.cantP > v_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La producción acumulada supera la cantidad solicitada.';
    END IF;

    SET v_anterior = (
        SELECT rp.idProceso
        FROM recprocesos rp
        WHERE rp.idOV = NEW.idOV AND rp.idProducto = v_producto
          AND rp.ordenProceso < v_orden
        ORDER BY rp.ordenProceso DESC
        LIMIT 1
    );
    IF v_anterior IS NOT NULL THEN
        SELECT COALESCE(SUM(p.cantP), 0) INTO v_anterior_cantidad
        FROM produccion p
        WHERE p.idOVDet = NEW.idOVDet AND p.idPro = v_anterior
          AND p.idProduccion <> OLD.idProduccion;
        IF v_anterior_cantidad < v_actual + NEW.cantP THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede producir esta cantidad: la etapa anterior no la completó.';
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_produccion_actualizar_estado` AFTER UPDATE ON `produccion` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(OLD.idOV); CALL ActualizarEstadoOV(NEW.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_produccion_actualizar_estado` AFTER DELETE ON `produccion` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(OLD.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `CodProd` varchar(50) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `CC` int DEFAULT NULL,
  `P_Est` decimal(12,2) DEFAULT NULL,
  `idCli` int NOT NULL,
  `idTipProd` int NOT NULL,
  `costo` decimal(12,2) DEFAULT NULL,
  `margen` decimal(6,2) DEFAULT NULL,
  `pUnitario` decimal(12,2) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  `fechaAlta` date DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `codigoProducto_UNIQUE` (`CodProd`),
  KEY `idCliente` (`idCli`),
  KEY `idTipProd` (`idTipProd`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCli`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`idTipProd`) REFERENCES `tiprod` (`idTipProd`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'BLUED4X10','Blues Deville 4x10 Reissue',NULL,NULL,1,1,100865.00,38.00,139193.70,'A','2008-10-10',1),(2,'BOGECS-100','Bogner Ecstasy 100-watt Tube Head',NULL,NULL,5,2,77511.00,29.80,100609.28,'A','2011-10-10',5),(3,'CT1X12WIDE23','California Tweed1X12 CALIFORNIA TWEED 23',NULL,NULL,3,3,110377.00,35.00,149008.95,'A','2010-02-14',4),(4,'FHOTRODDX3','Hot Rod Deluxe III',NULL,NULL,1,1,100176.70,37.00,137242.08,'A','2018-12-08',3),(5,'MJCM900','JCM900 4100',NULL,NULL,2,2,12668.00,41.00,17861.88,'A','2008-03-17',1),(6,'MVCAB1+','MARK V+ - Head',NULL,NULL,3,2,79515.70,35.00,107346.20,'A','2012-04-03',3),(7,'MVCBO1','MARK V - Combo 1x12',NULL,NULL,3,1,119668.70,30.00,155569.31,'A','2012-04-03',4),(8,'MVS8080','Marshall Valvestate 8080',NULL,NULL,2,1,36866.00,35.50,49953.43,'A','2008-01-10',1),(9,'PERF1000','Performer 1000 - Black',NULL,NULL,1,1,108340.70,40.00,151676.98,'A','2009-08-14',6),(10,'RIV_VENUS 5x12H','Rivera Venus 5 1x12\" 35-watt Tube Combo Amp',NULL,NULL,6,2,107679.00,43.60,154627.04,'A','2015-09-15',7),(11,'SLO-100 SO','Soldano SLO-100 Super Lead Overdrive',NULL,NULL,4,2,112901.00,37.00,154674.37,'A','2010-12-18',2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
	call NuevoMov("Productos", new.idUsuario, 1, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
	call NuevoMov("Productos", new.idUsuario, 3, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_DELETE` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
	call NuevoMov("Productos", old.idUsuario, 2, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor_articulo`
--

DROP TABLE IF EXISTS `proveedor_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_articulo` (
  `idProveedor` int NOT NULL COMMENT 'ID del proveedor (PK y referencia a proveedores)',
  `idArticulo` int NOT NULL COMMENT 'ID del artículo que comercializa el proveedor (PK y referencia a articulos)',
  `precioReferencia` decimal(12,2) NOT NULL COMMENT 'Precio de referencia del artículo para ese proveedor, expresado en pesos',
  `plazoEntrega` date NOT NULL COMMENT 'Fecha estimada de entrega del artículo por parte del proveedor',
  PRIMARY KEY (`idProveedor`,`idArticulo`),
  KEY `idArticulo` (`idArticulo`),
  CONSTRAINT `proveedor_articulo_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProv`),
  CONSTRAINT `proveedor_articulo_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Resuelve la relación muchos a muchos entre proveedores y artículos, indicando precio de referencia y plazo de entrega.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_articulo`
--

LOCK TABLES `proveedor_articulo` WRITE;
/*!40000 ALTER TABLE `proveedor_articulo` DISABLE KEYS */;
INSERT INTO `proveedor_articulo` VALUES (2,6,200.00,'2026-11-05'),(3,12,80.00,'2026-11-02'),(12,23,120.00,'2026-11-10'),(14,49,180.00,'2026-11-15');
/*!40000 ALTER TABLE `proveedor_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProv` int NOT NULL AUTO_INCREMENT,
  `razSoc` varchar(150) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fAlta` date DEFAULT NULL,
  `Est` varchar(5) DEFAULT NULL,
  `codPos` int DEFAULT NULL,
  `Localidad` varchar(100) DEFAULT NULL,
  `idPcia` int DEFAULT NULL,
  `tel1` varchar(25) DEFAULT NULL,
  `tel_2` varchar(25) DEFAULT NULL,
  `tel_3` varchar(25) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProv`),
  KEY `idPcia` (`idPcia`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`idPcia`) REFERENCES `provincias` (`idPcia`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Lara SRL',NULL,'Mosconi 1234',NULL,'2005-02-01','A',1100,'CABA',1,'1111-2234',NULL,NULL,NULL),(2,'Madedera Lopez S.A.',NULL,'Rivadavia 4',NULL,'2011-02-01','A',1200,'CABA',1,'2111-2234',NULL,NULL,NULL),(3,'Pegote SRL',NULL,'Thames 1900',NULL,'2005-02-01','A',1400,'SAN ISIDRO',2,'2111-2255',NULL,NULL,NULL),(4,'BA Tools SA',NULL,'Belgrano 900',NULL,'2005-02-01','A',1870,'AVELLANEDA',2,'2111-1212',NULL,NULL,NULL),(5,'Librería El Arte SRL',NULL,'Cordoba 700',NULL,'2010-02-01','A',1101,'CABA',1,'3311-2234',NULL,NULL,NULL),(6,'Bosch SA',NULL,'Chacabuco 740',NULL,'2005-02-01','A',1302,'CABA',1,'4411-2234',NULL,NULL,NULL),(7,'Ferroso SRL',NULL,'Peru 4500',NULL,'2005-02-01','A',1302,'CABA',1,'2111-4321',NULL,NULL,NULL),(8,'Agarrate Bien SRL',NULL,'Mendoza 2345',NULL,'2010-02-01','A',1908,'LOMAS DE ZAMORA',2,'8989-2234',NULL,NULL,NULL),(9,'Herrajes Norte SA ',NULL,'Piedras 809',NULL,'2005-02-01','A',3322,'CORDOBA',6,'6776-2234',NULL,NULL,NULL),(10,'Herrajes Sur SRL',NULL,'Rocas 1221',NULL,'2005-02-01','A',2221,'NEUQUEN',15,'2112-2344',NULL,NULL,NULL),(11,'Eco Cueros SA',NULL,'Irigoyen 4330',NULL,'2005-02-01','A',1344,'LANUS',2,'2113-5534',NULL,NULL,NULL),(12,'Fender LLC',NULL,'Fleming 1234',NULL,'2008-02-01','A',1234,'FLORIDA',25,'4576-2234',NULL,NULL,NULL),(13,'ACME Textil SA',NULL,'Rocha 2509',NULL,'2005-02-01','A',2245,'VICENTE LOPEZ',2,'2910-2234',NULL,NULL,NULL),(14,'Marshall Co',NULL,'Corrientes 2233',NULL,'2005-02-01','A',1400,'CABA',1,'2111-1111',NULL,NULL,NULL),(15,'Plavicon SA',NULL,'Au Bs.As. Cañuelas KM 34',NULL,'2005-02-01','A',9000,'EZEIZA',2,'2111-2222',NULL,NULL,NULL),(16,'Mesa LLC',NULL,'Larrea 2211',NULL,'2005-02-01','A',1405,'CABA',1,'2111-3333',NULL,NULL,NULL),(17,'Insumos SRL',NULL,'Paraguay 800',NULL,'2006-02-01','A',1222,'CABA',1,'2111-4445',NULL,NULL,NULL),(18,'Rodanet SRL',NULL,'Heredia 1200',NULL,'2005-02-01','A',1870,'AVELLANEDA',2,'2111-4456',NULL,NULL,NULL),(19,'Ruedas SA',NULL,'Av. Calchaqui 3405',NULL,'2005-02-01','A',1978,'QUILMES',2,'3232-2234',NULL,NULL,NULL),(20,'Librería Maya SRL',NULL,'Larrzabal 789',NULL,'2008-02-01','A',2000,'CABA',1,'6018-2234',NULL,NULL,NULL),(21,'Chapas Floresta SRL',NULL,'Gutierrez 1304',NULL,'2005-02-01','A',2331,'CABA',1,'8755-2234',NULL,NULL,NULL),(22,'Cueros Vacunos SRL',NULL,'Arrollo 678',NULL,'2005-02-01','A',3332,'CORRIENTES',7,'9844-2234',NULL,NULL,NULL),(23,'Jacaranda SA',NULL,'Arredondo 3000',NULL,'2005-02-01','A',1890,'GERLI',2,'3244-2224',NULL,NULL,NULL),(24,'Electro Tucuman SA',NULL,'Tucuman 550',NULL,'2008-02-01','A',2001,'CABA',1,'2152-8900',NULL,NULL,NULL),(26,'Tolex SRL',NULL,'Yerbal 1700',NULL,'2011-02-01','A',2003,'CABA',1,'1001-2232',NULL,NULL,NULL),(27,'Todo Herramientas SRL',NULL,'Chacabuco 890',NULL,'2020-02-01','A',2008,'CABA',1,'4190-2211',NULL,NULL,NULL),(28,'Aserradero Pampa SA',NULL,'Cruce 1900',NULL,'2005-02-01','A',3400,'Gral Pico',11,'5066-1134',NULL,NULL,NULL),(29,'Bogner Amp Inc',NULL,'Cordoba 6080',NULL,'2011-02-01','A',1300,'CABA',1,'2390-2888',NULL,NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `idPcia` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPcia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Ciudad Autónoma de Buenos Aires'),(2,'Buenos Aires'),(3,'Catamarca'),(4,'Chaco'),(5,'Chubut'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucumán'),(25,'Exterior');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `idPuesto` int NOT NULL AUTO_INCREMENT COMMENT 'ID del puesto de trabajo\\n',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción del puesto de trabajo\\n\\n',
  PRIMARY KEY (`idPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los distintos cargos existentes dentro de la organización.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recmat`
--

DROP TABLE IF EXISTS `recmat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recmat` (
  `idRecMaterial` int NOT NULL AUTO_INCREMENT COMMENT ' ID del renglón de la receta de materiales\\n',
  `idProducto` int NOT NULL COMMENT ' ID del producto al que pertenece la receta (referencia a productos)',
  `idArticulo` int NOT NULL COMMENT 'ID del artículo o insumo requerido (referencia a articulos)',
  `secuencia` int NOT NULL COMMENT 'Orden de uso del artículo dentro de la receta',
  `cant` decimal(8,2) NOT NULL COMMENT 'Cantidad del artículo necesaria para fabricar el producto',
  `uniMed` varchar(3) NOT NULL COMMENT 'Unidad de medida del artículo en la receta (ej. kg, m, L)\\n\\n',
  PRIMARY KEY (`idRecMaterial`),
  KEY `idProducto` (`idProducto`),
  KEY `idArticuloFK` (`idArticulo`),
  CONSTRAINT `idArticuloFK` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`),
  CONSTRAINT `idProductoFK` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la lista de materiales (BOM) necesarios para fabricar cada producto.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recmat`
--

LOCK TABLES `recmat` WRITE;
/*!40000 ALTER TABLE `recmat` DISABLE KEYS */;
INSERT INTO `recmat` VALUES (1,6,79,1,1.00,'CU'),(2,6,6,1,1.00,'CU'),(3,6,42,1,1.00,'CU'),(4,6,44,1,1.00,'CU'),(5,6,28,2,1.00,'CU'),(6,6,35,2,1.00,'CU'),(7,6,76,2,2.00,'CU'),(8,6,72,2,2.00,'CU'),(9,6,58,1,4.00,'CU'),(10,6,21,1,6.00,'CU'),(11,6,48,2,1.00,'CU'),(12,6,67,2,8.00,'CU'),(13,6,52,2,4.00,'CU'),(14,6,53,2,4.00,'CU'),(15,6,31,2,2.00,'CU'),(16,6,11,1,2.00,'CU'),(17,6,30,1,4.00,'CU'),(18,6,18,1,2.80,'M2'),(19,6,82,1,550.00,'CM3'),(20,6,29,1,8.00,'CU'),(21,6,50,1,1.00,'CU'),(22,7,80,1,1.00,'CU'),(23,7,7,1,1.00,'CU'),(24,7,43,1,1.00,'CU'),(25,7,45,1,1.00,'CU'),(26,7,25,2,1.00,'CU'),(27,7,74,2,2.00,'CU'),(28,7,33,2,1.00,'CU'),(29,7,77,2,2.00,'CU'),(30,7,58,1,4.00,'CU'),(31,7,21,1,5.00,'CU'),(32,7,48,2,1.00,'CU'),(33,7,67,2,8.00,'CU'),(34,7,52,2,4.00,'CU'),(35,7,53,2,4.00,'CU'),(36,7,31,2,2.00,'CU'),(37,7,11,1,2.00,'CU'),(38,7,30,1,4.00,'CU'),(39,7,18,1,4.70,'M2'),(40,7,82,1,880.00,'CM3'),(41,7,29,1,8.00,'CU'),(42,7,50,1,1.00,'CU'),(43,3,81,1,1.00,'CU'),(44,3,8,1,1.00,'CU'),(45,3,43,1,1.00,'CU'),(46,3,45,1,1.00,'CU'),(47,3,26,2,1.00,'CU'),(48,3,73,2,2.00,'CU'),(49,3,78,2,2.00,'CU'),(50,3,34,2,1.00,'CU'),(51,3,58,1,4.00,'CU'),(52,3,21,1,6.00,'CU'),(53,3,47,2,1.00,'CU'),(54,3,67,2,8.00,'CU'),(55,3,52,2,8.00,'CU'),(56,3,53,2,4.00,'CU'),(57,3,31,2,2.00,'CU'),(58,3,11,2,2.00,'CU'),(59,3,30,1,4.00,'CU'),(60,3,17,1,3.60,'M2'),(61,3,82,1,780.00,'CM3'),(62,3,29,1,8.00,'CU'),(63,3,27,1,1.00,'CU'),(64,3,51,1,1.00,'CU'),(65,1,79,1,1.00,'CU'),(66,1,6,1,1.00,'CU'),(67,1,42,1,1.00,'CU'),(68,1,44,1,1.00,'CU'),(69,1,28,2,1.00,'CU'),(70,1,35,2,1.00,'CU'),(71,1,76,2,2.00,'CU'),(72,1,72,2,2.00,'CU'),(73,1,57,1,4.00,'CU'),(74,1,46,2,1.00,'CU'),(75,1,67,2,8.00,'CU'),(76,1,52,2,4.00,'CU'),(77,1,53,2,4.00,'CU'),(78,1,31,2,2.00,'CU'),(79,1,30,1,4.00,'CU'),(80,1,70,1,5.80,'M2'),(81,1,82,1,760.00,'CM3'),(82,1,29,1,8.00,'CU'),(83,1,23,1,1.00,'CU'),(84,4,69,1,1.00,'CU'),(85,4,1,1,1.00,'CU'),(86,4,40,1,1.00,'CU'),(87,4,41,1,1.00,'CU'),(88,4,22,1,1.00,'CU'),(89,4,32,1,1.00,'CU'),(90,4,75,1,2.00,'CU'),(91,4,71,1,2.00,'CU'),(92,4,57,2,4.00,'CU'),(93,4,20,2,6.00,'CU'),(94,4,46,2,1.00,'CU'),(95,4,67,2,8.00,'CU'),(96,4,52,2,4.00,'CU'),(97,4,53,2,4.00,'CU'),(98,4,31,2,2.00,'CU'),(99,4,10,2,2.00,'CU'),(100,4,30,1,4.00,'CU'),(101,4,15,2,4.80,'M2'),(102,4,82,2,760.00,'CM3'),(103,4,29,1,8.00,'CU'),(104,4,24,2,1.00,'CU'),(105,9,79,1,1.00,'CU'),(106,9,6,1,1.00,'CU'),(107,9,42,1,1.00,'CU'),(108,9,44,1,1.00,'CU'),(109,9,28,1,1.00,'CU'),(110,9,35,1,1.00,'CU'),(111,9,76,1,2.00,'CU'),(112,9,72,1,2.00,'CU'),(113,9,57,2,4.00,'CU'),(114,9,46,2,1.00,'CU'),(115,9,67,1,8.00,'CU'),(116,9,52,2,4.00,'CU'),(117,9,53,2,4.00,'CU'),(118,9,31,2,2.00,'CU'),(119,9,30,2,4.00,'CU'),(120,9,15,2,5.10,'M2'),(121,9,82,2,820.00,'CM3'),(122,9,29,2,8.00,'CU'),(123,9,85,2,1.00,'CU'),(124,2,79,1,1.00,'CU'),(125,2,6,1,1.00,'CU'),(126,2,42,1,1.00,'CU'),(127,2,44,1,1.00,'CU'),(128,2,28,2,1.00,'CU'),(129,2,35,2,1.00,'CU'),(130,2,76,2,2.00,'CU'),(131,2,72,2,2.00,'CU'),(132,2,58,1,4.00,'CU'),(133,2,21,1,4.00,'CU'),(134,2,48,2,1.00,'CU'),(135,2,67,2,8.00,'CU'),(136,2,52,2,4.00,'CU'),(137,2,53,2,4.00,'CU'),(138,2,18,1,2.80,'M2'),(139,2,82,1,550.00,'CM3'),(140,2,5,1,1.00,'CU'),(141,5,79,1,1.00,'CU'),(142,5,6,1,1.00,'CU'),(143,5,42,1,1.00,'CU'),(144,5,44,1,1.00,'CU'),(145,5,28,2,1.00,'CU'),(146,5,35,2,1.00,'CU'),(147,5,76,2,2.00,'CU'),(148,5,72,2,2.00,'CU'),(149,5,59,1,4.00,'CU'),(150,5,20,1,4.00,'CU'),(151,5,46,2,1.00,'CU'),(152,5,67,2,8.00,'CU'),(153,5,52,2,4.00,'CU'),(154,5,15,1,1.50,'M2'),(155,5,84,1,75.00,'CM3'),(156,5,49,1,1.00,'CU'),(157,8,80,1,1.00,'CU'),(158,8,7,1,1.00,'CU'),(159,8,43,1,1.00,'CU'),(160,8,45,1,1.00,'CU'),(161,8,25,2,1.00,'CU'),(162,8,33,2,1.00,'CU'),(163,8,74,2,2.00,'CU'),(164,8,77,2,2.00,'CU'),(165,8,59,1,4.00,'CU'),(166,8,20,1,4.00,'CU'),(167,8,46,2,1.00,'CU'),(168,8,67,2,8.00,'CU'),(169,8,52,2,4.00,'CU'),(170,8,15,1,2.50,'M2'),(171,8,84,1,320.00,'CM3'),(172,8,49,1,1.00,'CU'),(173,10,80,1,1.00,'CU'),(174,10,7,1,1.00,'CU'),(175,10,43,1,1.00,'CU'),(176,10,45,1,1.00,'CU'),(177,10,25,2,1.00,'CU'),(178,10,33,2,1.00,'CU'),(179,10,74,2,2.00,'CU'),(180,10,77,2,2.00,'CU'),(181,10,58,1,4.00,'CU'),(182,10,21,1,4.00,'CU'),(183,10,48,2,1.00,'CU'),(184,10,67,2,8.00,'CU'),(185,10,52,2,4.00,'CU'),(186,10,16,1,4.50,'M2'),(187,10,82,1,800.00,'CM3'),(188,10,63,1,1.00,'CU'),(189,11,79,1,1.00,'CU'),(190,11,6,1,1.00,'CU'),(191,11,42,1,1.00,'CU'),(192,11,44,1,1.00,'CU'),(193,11,28,2,1.00,'CU'),(194,11,35,2,1.00,'CU'),(195,11,76,2,2.00,'CU'),(196,11,72,2,2.00,'CU'),(197,11,58,1,4.00,'CU'),(198,11,21,1,4.00,'CU'),(199,11,47,2,1.00,'CU'),(200,11,67,2,8.00,'CU'),(201,11,52,2,4.00,'CU'),(202,11,19,1,3.00,'M2'),(203,11,83,1,230.00,'CM3'),(204,11,66,1,1.00,'CU');
/*!40000 ALTER TABLE `recmat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recprocesos`
--

DROP TABLE IF EXISTS `recprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recprocesos` (
  `idRecProceso` varchar(20) NOT NULL COMMENT 'ID del renglón de la receta de procesos',
  `idOV` int NOT NULL,
  `tiempoEstimado` time NOT NULL COMMENT 'Tiempo estimado de ejecución del proceso (formato HH:MM:SS)',
  `ordenProceso` int NOT NULL COMMENT 'Orden de ejecución del proceso para fabricar el producto',
  `idProducto` int NOT NULL COMMENT 'ID del producto al que aplica el proceso (referencia a productos)',
  `idProceso` int NOT NULL COMMENT 'ID del proceso productivo (referencia a procesos)',
  PRIMARY KEY (`idRecProceso`),
  KEY `idProducto` (`idProducto`),
  KEY `idProceso` (`idProceso`),
  KEY `idOV_idx` (`idOV`),
  CONSTRAINT `recprocesos_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `recprocesos_ibfk_2` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define las etapas productivas que debe recorrer cada producto y el tiempo estimado para completar cada una.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recprocesos`
--

LOCK TABLES `recprocesos` WRITE;
/*!40000 ALTER TABLE `recprocesos` DISABLE KEYS */;
INSERT INTO `recprocesos` VALUES ('1',1,'00:45:00',1,1,1),('10',1,'02:30:00',4,3,8),('11',1,'00:45:00',5,3,5),('13',1,'00:35:00',1,7,1),('14',1,'01:20:00',2,7,4),('15',1,'00:28:00',3,7,2),('16',1,'02:30:00',4,7,8),('17',1,'00:45:00',5,7,5),('2',1,'01:30:00',2,1,4),('3',1,'00:30:00',3,1,2),('4',1,'02:50:00',4,1,8),('5',1,'00:55:00',5,1,5),('7',1,'00:35:00',1,3,1),('8',1,'01:20:00',2,3,4),('8-1-1',8,'00:35:00',1,5,1),('8-1-2',8,'00:28:00',4,5,2),('8-1-4',8,'01:20:00',2,5,4),('8-1-5',8,'00:45:00',5,5,5),('8-1-6',8,'04:00:00',6,5,6),('8-1-7',8,'06:00:00',3,5,7),('8-2-1',8,'00:35:00',1,8,1),('8-2-2',8,'00:28:00',4,8,2),('8-2-4',8,'01:20:00',2,8,4),('8-2-5',8,'00:45:00',5,8,5),('8-2-6',8,'04:00:00',6,8,6),('8-2-7',8,'06:00:00',3,8,7),('9',1,'00:28:00',3,3,2),('RP-7-1',7,'00:35:00',1,4,1),('RP-7-2',7,'00:28:00',4,4,2),('RP-7-4',7,'01:20:00',2,4,4),('RP-7-5',7,'00:45:00',5,4,5),('RP-7-6',7,'04:00:00',6,4,6),('RP-7-8',7,'02:30:00',3,4,8),('RP-OV2-1',2,'00:35:00',1,5,1),('RP-OV2-2',2,'00:28:00',4,5,2),('RP-OV2-4',2,'01:20:00',2,5,4),('RP-OV2-5',2,'00:45:00',5,5,5),('RP-OV2-6',2,'04:00:00',6,5,6),('RP-OV2-7',2,'06:00:00',3,5,7),('RP-OV3-1',3,'00:35:00',1,3,1),('RP-OV3-2',3,'00:28:00',4,3,2),('RP-OV3-4',3,'01:20:00',2,3,4),('RP-OV3-5',3,'00:45:00',5,3,5),('RP-OV3-6',3,'04:00:00',6,3,6),('RP-OV3-7',3,'06:00:00',3,3,7),('RP-OV4-1',4,'00:35:00',1,11,1),('RP-OV4-2',4,'00:28:00',4,11,2),('RP-OV4-4',4,'01:20:00',2,11,4),('RP-OV4-5',4,'00:45:00',5,11,5),('RP-OV4-6',4,'04:00:00',6,11,6),('RP-OV4-8',4,'02:30:00',3,11,8),('RP-OV5-1',5,'00:35:00',1,10,1),('RP-OV5-2',5,'00:28:00',4,10,2),('RP-OV5-4',5,'01:20:00',2,10,4),('RP-OV5-5',5,'00:45:00',5,10,5),('RP-OV5-6',5,'04:00:00',6,10,6),('RP-OV5-8',5,'02:30:00',3,10,8),('RP-OV6-1',6,'00:35:00',1,8,1),('RP-OV6-2',6,'00:28:00',4,8,2),('RP-OV6-4',6,'01:20:00',2,8,4),('RP-OV6-5',6,'00:45:00',5,8,5),('RP-OV6-6',6,'04:00:00',6,8,6),('RP-OV6-8',6,'02:30:00',3,8,8);
/*!40000 ALTER TABLE `recprocesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recuperomaterial`
--

DROP TABLE IF EXISTS `recuperomaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recuperomaterial` (
  `idRecupero` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de recupero de material',
  `cantidad` decimal(10,2) DEFAULT NULL COMMENT 'Cantidad de material recuperado tras el control de calidad',
  `idQC` int NOT NULL COMMENT 'ID del control de calidad que originó el recupero (referencia a cc)',
  `idArticulo` int NOT NULL COMMENT 'ID del artículo recuperado (referencia a articulos)',
  PRIMARY KEY (`idRecupero`),
  KEY `idCC` (`idQC`),
  KEY `idArticulo` (`idArticulo`),
  CONSTRAINT `recuperomaterial_ibfk_1` FOREIGN KEY (`idQC`) REFERENCES `cc` (`idQC`),
  CONSTRAINT `recuperomaterial_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los materiales recuperados de productos rechazados durante el control de calidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recuperomaterial`
--

LOCK TABLES `recuperomaterial` WRITE;
/*!40000 ALTER TABLE `recuperomaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `recuperomaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitoscab`
--

DROP TABLE IF EXISTS `remitoscab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitoscab` (
  `idRemito` int NOT NULL AUTO_INCREMENT COMMENT 'ID del remito',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión del remito',
  `numeroRemito` varchar(50) NOT NULL COMMENT 'Número de comprobante del remito',
  `direccionEntrega` varchar(200) NOT NULL COMMENT 'Dirección donde se entrega la mercadería',
  `idCliente` int NOT NULL COMMENT 'ID del cliente destinatario (referencia a clientes)',
  `idOV` int NOT NULL COMMENT 'ID de la orden de venta asociada (referencia a ovcab)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idRemito`),
  KEY `idCliente` (`idCliente`),
  KEY `idOV` (`idOV`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `remitoscab_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `remitoscab_ibfk_2` FOREIGN KEY (`idOV`) REFERENCES `ovcab` (`idOV`),
  CONSTRAINT `remitoscab_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los documentos que acompañan la entrega física de mercadería al cliente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitoscab`
--

LOCK TABLES `remitoscab` WRITE;
/*!40000 ALTER TABLE `remitoscab` DISABLE KEYS */;
INSERT INTO `remitoscab` VALUES (1,'2026-08-30','0001-00000001','Fleming 1234, Florida',1,1,5);
/*!40000 ALTER TABLE `remitoscab` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bi_remitoscab_validar_factura` BEFORE INSERT ON `remitoscab` FOR EACH ROW BEGIN
    DECLARE v_items_sin_facturar INT DEFAULT 0;
    DECLARE v_produccion_pendiente INT DEFAULT 0;

    SELECT COUNT(*) INTO v_produccion_pendiente
    FROM ovdet d
    JOIN productos p ON p.idProducto = d.idProducto
    JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
    LEFT JOIN (
        SELECT idOVDet, idPro, SUM(cantP) AS cantidad_producida
        FROM produccion GROUP BY idOVDet, idPro
    ) prod ON prod.idOVDet = d.idOVDet AND prod.idPro = rp.idProceso
    WHERE d.idOV = NEW.idOV
      AND (rp.idProceso <> 3 OR p.CC IS NOT NULL)
      AND COALESCE(prod.cantidad_producida, 0) < d.cantidad;

    SELECT COUNT(*) INTO v_items_sin_facturar
    FROM (
        SELECT d.idOVDet, d.cantidad, COALESCE(SUM(fd.cantidad), 0) AS cantidad_facturada
        FROM ovdet d
        LEFT JOIN facturasdet fd ON fd.idOVDet = d.idOVDet
        WHERE d.idOV = NEW.idOV
        GROUP BY d.idOVDet, d.cantidad
        HAVING COALESCE(SUM(fd.cantidad), 0) < d.cantidad
    ) faltantes;

    IF v_produccion_pendiente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede remitir: la producción de la OV no está completa.';
    END IF;
    IF v_items_sin_facturar > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede remitir: primero debe estar facturada toda la cantidad de la OV.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_INSERT` AFTER INSERT ON `remitoscab` FOR EACH ROW BEGIN
	call NuevoMov("Remitos", new.idUsuario, 1, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_remitoscab_actualizar_estado` AFTER INSERT ON `remitoscab` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(NEW.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_UPDATE` AFTER UPDATE ON `remitoscab` FOR EACH ROW BEGIN
	call NuevoMov("Remitos", new.idUsuario, 3, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_remitoscab_actualizar_estado` AFTER UPDATE ON `remitoscab` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(OLD.idOV); CALL ActualizarEstadoOV(NEW.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remitoscab_AFTER_DELETE` AFTER DELETE ON `remitoscab` FOR EACH ROW BEGIN
	call NuevoMov("Remitos", old.idUsuario, 2, null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_remitoscab_actualizar_estado` AFTER DELETE ON `remitoscab` FOR EACH ROW BEGIN CALL ActualizarEstadoOV(OLD.idOV); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `remitosdet`
--

DROP TABLE IF EXISTS `remitosdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitosdet` (
  `idRemitoDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón del remito',
  `cantidad` int NOT NULL COMMENT 'Cantidad del producto entregado',
  `idRemito` int NOT NULL COMMENT 'ID del remito cabecera (referencia a remitoscab)',
  `idProducto` int NOT NULL COMMENT 'ID del producto entregado (referencia a productos)',
  `detalleprod` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idRemitoDet`),
  UNIQUE KEY `idRemitoDet_UNIQUE` (`idRemitoDet`),
  KEY `idRemito` (`idRemito`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `remitosdet_ibfk_1` FOREIGN KEY (`idRemito`) REFERENCES `remitoscab` (`idRemito`),
  CONSTRAINT `remitosdet_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene el detalle de productos entregados en cada remito.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitosdet`
--

LOCK TABLES `remitosdet` WRITE;
/*!40000 ALTER TABLE `remitosdet` DISABLE KEYS */;
INSERT INTO `remitosdet` VALUES (8,1,1,4,'Hot Rod Deluxe III');
/*!40000 ALTER TABLE `remitosdet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_remitosdet_actualizar_estado` AFTER INSERT ON `remitosdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    SET v_idOV = (SELECT rc.idOV FROM remitoscab rc WHERE rc.idRemito = NEW.idRemito LIMIT 1);
    IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_remitosdet_actualizar_estado` AFTER UPDATE ON `remitosdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    SET v_idOV = (SELECT rc.idOV FROM remitoscab rc WHERE rc.idRemito = OLD.idRemito LIMIT 1);
    IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
    SET v_idOV = (SELECT rc.idOV FROM remitoscab rc WHERE rc.idRemito = NEW.idRemito LIMIT 1);
    IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_remitosdet_actualizar_estado` AFTER DELETE ON `remitosdet` FOR EACH ROW BEGIN
    DECLARE v_idOV INT DEFAULT NULL;
    SET v_idOV = (SELECT rc.idOV FROM remitoscab rc WHERE rc.idRemito = OLD.idRemito LIMIT 1);
    IF v_idOV IS NOT NULL THEN CALL ActualizarEstadoOV(v_idOV); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `respaldo_reparacion_facturacab`
--

DROP TABLE IF EXISTS `respaldo_reparacion_facturacab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_facturacab` (
  `idFactura` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la factura',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión de la factura',
  `numeroFactura` varchar(50) DEFAULT NULL COMMENT 'Número de comprobante de la factura',
  `subtotal` decimal(12,2) NOT NULL COMMENT 'Importe antes de impuestos, expresado en pesos',
  `total` decimal(12,2) DEFAULT NULL COMMENT 'Importe total con impuestos incluidos, expresado en pesos',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que se emite la factura (referencia a clientes)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idFactura`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las facturas emitidas a los clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_facturacab`
--

LOCK TABLES `respaldo_reparacion_facturacab` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_facturacab` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_facturacab` VALUES (2,'2026-09-04','3',45000.00,54450.00,2,5),(3,'2026-09-09','4',298017.90,360601.66,3,4),(4,'2026-10-15','5',300000.00,363000.00,4,4),(5,'2026-10-18','6',450000.00,544500.00,6,5);
/*!40000 ALTER TABLE `respaldo_reparacion_facturacab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_facturasdet`
--

DROP TABLE IF EXISTS `respaldo_reparacion_facturasdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_facturasdet` (
  `idFacturaDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de la factura',
  `cantidad` decimal(8,2) NOT NULL COMMENT 'Cantidad del producto facturado',
  `precioUnitario` decimal(10,2) NOT NULL COMMENT 'Precio unitario del producto facturado, expresado en pesos',
  `subtotal` decimal(8,2) NOT NULL COMMENT 'Subtotal del renglón (cantidad × precio unitario), expresado en pesos',
  `idFactura` int NOT NULL COMMENT 'ID de la factura cabecera (referencia a facturacab)',
  `idProducto` int NOT NULL COMMENT 'ID del producto facturado (referencia a productos)\\n',
  `detalleprod` varchar(150) DEFAULT NULL,
  `idRemito` int DEFAULT NULL,
  `idOVDet` int DEFAULT NULL,
  PRIMARY KEY (`idFacturaDet`),
  KEY `idFactura` (`idFactura`),
  KEY `idProducto` (`idProducto`),
  KEY `idRemitoFK_idx` (`idRemito`),
  KEY `fk_facturasdet_ovdet_reparacion` (`idOVDet`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los productos incluidos en cada factura emitida a clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_facturasdet`
--

LOCK TABLES `respaldo_reparacion_facturasdet` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_facturasdet` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_facturasdet` VALUES (2,4.00,11250.00,45000.00,2,5,'JCM900 4100',2,4),(3,2.00,149008.95,298017.90,3,3,'California Tweed 1X12',3,5),(9,2.00,150000.00,300000.00,4,11,'Soldano SLO-100 Super Lead Overdrive',4,6),(10,3.00,150000.00,450000.00,5,10,'Rivera Venus 5 1x12 35-watt Tube Combo Amp',5,7);
/*!40000 ALTER TABLE `respaldo_reparacion_facturasdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_ovcab`
--

DROP TABLE IF EXISTS `respaldo_reparacion_ovcab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_ovcab` (
  `idOV` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la orden de venta',
  `fCreacion` date NOT NULL COMMENT 'fecha de creacion',
  `fEntrega` date NOT NULL COMMENT 'Fecha estimada de entrega al cliente',
  `cant` int NOT NULL COMMENT 'Cantidad total de productos en la orden',
  `subtotal` decimal(12,2) DEFAULT NULL COMMENT 'Importe antes de impuestos, expresado en pesos',
  `total` decimal(12,2) DEFAULT NULL COMMENT 'Importe total con impuestos incluidos, expresado en pesos',
  `idEstado` int NOT NULL COMMENT 'ID del estado actual de la orden de venta (referencia a estados)',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que corresponde la orden (referencia a clientes)',
  `idVendedor` int NOT NULL COMMENT 'ID del vendedor que generó la orden (referencia a usuarios)',
  `idEntrega` int DEFAULT NULL COMMENT 'ID de la modalidad de entrega pactada (referencia a entregas)',
  `observaciones` varchar(50) DEFAULT NULL COMMENT 'Notas u observaciones adicionales sobre la orden',
  PRIMARY KEY (`idOV`),
  UNIQUE KEY `idOV_UNIQUE` (`idOV`),
  KEY `idCliente` (`idCliente`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idEstado` (`idEstado`),
  KEY `idEntrega` (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa el documento comercial generado cuando un cliente realiza un pedido.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_ovcab`
--

LOCK TABLES `respaldo_reparacion_ovcab` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_ovcab` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_ovcab` VALUES (2,'2026-08-10','2026-09-05',4,45000.00,5445000.00,3,2,5,NULL,NULL),(3,'2026-08-15','2026-09-10',2,298017.90,360601.66,4,3,4,NULL,NULL),(4,'2026-10-01','2026-10-20',2,300000.00,363000.00,2,4,5,NULL,''),(5,'2026-10-05','2026-10-25',3,450000.00,544500.00,1,6,5,NULL,''),(6,'2026-09-20','2026-10-10',4,180000.00,217800.00,1,2,5,NULL,'');
/*!40000 ALTER TABLE `respaldo_reparacion_ovcab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_produccion`
--

DROP TABLE IF EXISTS `respaldo_reparacion_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_produccion` (
  `idProduccion` int NOT NULL AUTO_INCREMENT COMMENT 'ID del registro de producción',
  `idOV` int NOT NULL COMMENT 'ID de la orden de fabricación ejecutada (referencia a ofcab)',
  `idPro` int NOT NULL COMMENT 'ID del proceso productivo realizado (referencia a procesos)',
  `idUs` int NOT NULL COMMENT 'ID del operario que realizó la producción (referencia a usuarios)',
  `hFin` datetime NOT NULL COMMENT 'Fecha y hora de finalización de la producción',
  `cantP` int NOT NULL COMMENT 'Cantidad producida',
  `idOVDet` int NOT NULL,
  PRIMARY KEY (`idProduccion`),
  UNIQUE KEY `idProduccion_UNIQUE` (`idProduccion`),
  KEY `idOV` (`idOV`),
  KEY `idProceso` (`idPro`),
  KEY `idUsuario` (`idUs`),
  KEY `produccion_ibfk_4_idx` (`idOVDet`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra cada avance realizado durante el proceso productivo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_produccion`
--

LOCK TABLES `respaldo_reparacion_produccion` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_produccion` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_produccion` VALUES (6,1,3,4,'2026-08-08 12:00:00',5,1),(12,1,3,4,'2026-08-08 13:00:00',2,2),(18,1,3,4,'2026-08-08 14:30:00',3,3),(19,2,1,12,'2026-08-11 08:30:00',4,4),(20,2,4,13,'2026-08-12 11:00:00',4,4),(21,2,3,4,'2026-08-13 16:00:00',4,4),(22,3,1,1,'2026-08-16 09:00:00',2,5),(23,3,4,3,'2026-08-17 11:30:00',2,5),(24,3,2,6,'2026-08-18 14:00:00',2,5),(25,3,8,7,'2026-08-19 10:00:00',2,5),(26,4,1,1,'2026-10-02 10:00:00',2,6),(27,4,4,4,'2026-10-03 15:30:00',2,6),(28,4,6,5,'2026-10-05 11:15:00',2,6),(29,5,1,14,'2026-10-06 09:00:00',1,7),(30,6,1,1,'2026-09-22 10:00:00',4,8),(31,6,4,4,'2026-09-25 15:30:00',2,8);
/*!40000 ALTER TABLE `respaldo_reparacion_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_recprocesos`
--

DROP TABLE IF EXISTS `respaldo_reparacion_recprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_recprocesos` (
  `idRecProceso` varchar(20) NOT NULL COMMENT 'ID del renglón de la receta de procesos',
  `idOV` int NOT NULL,
  `tiempoEstimado` time NOT NULL COMMENT 'Tiempo estimado de ejecución del proceso (formato HH:MM:SS)',
  `ordenProceso` int NOT NULL COMMENT 'Orden de ejecución del proceso para fabricar el producto',
  `idProducto` int NOT NULL COMMENT 'ID del producto al que aplica el proceso (referencia a productos)',
  `idProceso` int NOT NULL COMMENT 'ID del proceso productivo (referencia a procesos)',
  PRIMARY KEY (`idRecProceso`),
  KEY `idProducto` (`idProducto`),
  KEY `idProceso` (`idProceso`),
  KEY `idOV_idx` (`idOV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define las etapas productivas que debe recorrer cada producto y el tiempo estimado para completar cada una.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_recprocesos`
--

LOCK TABLES `respaldo_reparacion_recprocesos` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_recprocesos` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_recprocesos` VALUES ('12',1,'00:25:00',6,3,3),('18',1,'00:25:00',6,7,3),('19',2,'00:35:00',1,5,1),('20',2,'01:20:00',2,5,4),('21',2,'00:25:00',3,5,3),('22',3,'00:35:00',1,3,1),('23',3,'01:20:00',2,3,4),('24',3,'00:28:00',3,3,2),('25',3,'02:30:00',4,3,8),('26',4,'00:35:00',1,11,1),('27',4,'01:20:00',2,11,4),('28',4,'04:00:00',6,11,6),('29',5,'00:35:00',1,10,1),('30',5,'00:45:00',2,10,5),('6',1,'00:25:00',6,1,3),('RP-7-3',7,'00:25:00',7,4,3),('RP-8-3',8,'00:25:00',7,5,3),('RP-OV4-AC2',4,'00:28:00',4,11,2),('RP-OV4-CC',4,'00:25:00',7,11,3),('RP-OV4-EN2',4,'00:45:00',5,11,5),('RP-OV4-PIN',4,'06:00:00',3,11,7),('RP-OV6-AC1',6,'00:35:00',1,8,1),('RP-OV6-EN1',6,'01:20:00',2,8,4);
/*!40000 ALTER TABLE `respaldo_reparacion_recprocesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_remitoscab`
--

DROP TABLE IF EXISTS `respaldo_reparacion_remitoscab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_remitoscab` (
  `idRemito` int NOT NULL AUTO_INCREMENT COMMENT 'ID del remito',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión del remito',
  `numeroRemito` varchar(50) NOT NULL COMMENT 'Número de comprobante del remito',
  `direccionEntrega` varchar(200) NOT NULL COMMENT 'Dirección donde se entrega la mercadería',
  `idCliente` int NOT NULL COMMENT 'ID del cliente destinatario (referencia a clientes)',
  `idOV` int NOT NULL COMMENT 'ID de la orden de venta asociada (referencia a ovcab)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  PRIMARY KEY (`idRemito`),
  KEY `idCliente` (`idCliente`),
  KEY `idOV` (`idOV`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los documentos que acompañan la entrega física de mercadería al cliente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_remitoscab`
--

LOCK TABLES `respaldo_reparacion_remitoscab` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_remitoscab` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_remitoscab` VALUES (2,'2026-09-03','0001-00000002','Corrientes 2233, CABA',2,2,5),(3,'2026-09-08','0001-00000003','Larrea 2211, CABA',3,3,4),(4,'2026-10-15','0001-00000004','Mitre 4550, San Isidro',4,4,4),(5,'2026-10-18','0001-00000005','Pasteur 1200, CABA',6,5,5);
/*!40000 ALTER TABLE `respaldo_reparacion_remitoscab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_remitosdet`
--

DROP TABLE IF EXISTS `respaldo_reparacion_remitosdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_remitosdet` (
  `idRemitoDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón del remito',
  `cantidad` int NOT NULL COMMENT 'Cantidad del producto entregado',
  `idRemito` int NOT NULL COMMENT 'ID del remito cabecera (referencia a remitoscab)',
  `idProducto` int NOT NULL COMMENT 'ID del producto entregado (referencia a productos)',
  `detalleprod` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idRemitoDet`),
  UNIQUE KEY `idRemitoDet_UNIQUE` (`idRemitoDet`),
  KEY `idRemito` (`idRemito`),
  KEY `idProducto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene el detalle de productos entregados en cada remito.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_remitosdet`
--

LOCK TABLES `respaldo_reparacion_remitosdet` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_remitosdet` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_remitosdet` VALUES (2,4,2,5,'JCM900 4100'),(3,2,3,3,'California Tweed 1X12');
/*!40000 ALTER TABLE `respaldo_reparacion_remitosdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_rpcab`
--

DROP TABLE IF EXISTS `respaldo_reparacion_rpcab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_rpcab` (
  `idRecibo` int NOT NULL AUTO_INCREMENT COMMENT 'ID del recibo de cobro',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión del recibo',
  `importeTotal` decimal(12,2) NOT NULL COMMENT 'Importe total del recibo, expresado en pesos',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que se emite el recibo (referencia a clientes)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  `idFactura` int NOT NULL,
  PRIMARY KEY (`idRecibo`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario` (`idUsuario`),
  KEY `facturas_idx` (`idFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los cobros realizados a los clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_rpcab`
--

LOCK TABLES `respaldo_reparacion_rpcab` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_rpcab` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_rpcab` VALUES (3,'2026-09-15',54450.00,2,5,2),(4,'2026-09-20',150000.00,3,4,3);
/*!40000 ALTER TABLE `respaldo_reparacion_rpcab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_reparacion_rpdeta`
--

DROP TABLE IF EXISTS `respaldo_reparacion_rpdeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_reparacion_rpdeta` (
  `idReciboFactura` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de imputación',
  `importeAplicado` decimal(12,2) NOT NULL COMMENT 'Importe de la factura aplicado en este recibo, expresado en pesos',
  `idRecibo` int NOT NULL COMMENT 'ID del recibo al que pertenece la imputación (referencia a rpcab)',
  `idFactura` int NOT NULL COMMENT 'ID de la factura imputada (referencia a facturacab)',
  PRIMARY KEY (`idReciboFactura`),
  KEY `idRecibo` (`idRecibo`),
  KEY `idFactura` (`idFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Vincula los recibos de cobro con las facturas canceladas (imputación de facturas).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_reparacion_rpdeta`
--

LOCK TABLES `respaldo_reparacion_rpdeta` WRITE;
/*!40000 ALTER TABLE `respaldo_reparacion_rpdeta` DISABLE KEYS */;
INSERT INTO `respaldo_reparacion_rpdeta` VALUES (3,54450.00,3,2),(4,150000.00,4,3);
/*!40000 ALTER TABLE `respaldo_reparacion_rpdeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpcab`
--

DROP TABLE IF EXISTS `rpcab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpcab` (
  `idRecibo` int NOT NULL AUTO_INCREMENT COMMENT 'ID del recibo de cobro',
  `fecha` date NOT NULL COMMENT 'Fecha de emisión del recibo',
  `importeTotal` decimal(12,2) NOT NULL COMMENT 'Importe total del recibo, expresado en pesos',
  `idCliente` int NOT NULL COMMENT 'ID del cliente al que se emite el recibo (referencia a clientes)',
  `idUsuario` int NOT NULL COMMENT 'ID del usuario que generó el registro (referencia a usuarios)',
  `idFactura` int NOT NULL,
  PRIMARY KEY (`idRecibo`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario` (`idUsuario`),
  KEY `facturas_idx` (`idFactura`),
  CONSTRAINT `facturas` FOREIGN KEY (`idFactura`) REFERENCES `facturacab` (`idFactura`),
  CONSTRAINT `rpcab_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `rpcab_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los cobros realizados a los clientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpcab`
--

LOCK TABLES `rpcab` WRITE;
/*!40000 ALTER TABLE `rpcab` DISABLE KEYS */;
INSERT INTO `rpcab` VALUES (1,'2026-09-05',5000.00,1,5,1),(2,'2026-09-20',5000.00,1,5,1);
/*!40000 ALTER TABLE `rpcab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpdeta`
--

DROP TABLE IF EXISTS `rpdeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpdeta` (
  `idReciboFactura` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de imputación',
  `importeAplicado` decimal(12,2) NOT NULL COMMENT 'Importe de la factura aplicado en este recibo, expresado en pesos',
  `idRecibo` int NOT NULL COMMENT 'ID del recibo al que pertenece la imputación (referencia a rpcab)',
  `idFactura` int NOT NULL COMMENT 'ID de la factura imputada (referencia a facturacab)',
  PRIMARY KEY (`idReciboFactura`),
  KEY `idRecibo` (`idRecibo`),
  KEY `idFactura` (`idFactura`),
  CONSTRAINT `rpdeta_ibfk_1` FOREIGN KEY (`idRecibo`) REFERENCES `rpcab` (`idRecibo`),
  CONSTRAINT `rpdeta_ibfk_2` FOREIGN KEY (`idFactura`) REFERENCES `facturacab` (`idFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Vincula los recibos de cobro con las facturas canceladas (imputación de facturas).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpdeta`
--

LOCK TABLES `rpdeta` WRITE;
/*!40000 ALTER TABLE `rpdeta` DISABLE KEYS */;
INSERT INTO `rpdeta` VALUES (1,5000.00,1,1),(2,3000.00,2,1);
/*!40000 ALTER TABLE `rpdeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_rpdeta_actualizar_estado` AFTER INSERT ON `rpdeta` FOR EACH ROW BEGIN CALL ActualizarOVDeFactura(NEW.idFactura); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_rpdeta_actualizar_estado` AFTER UPDATE ON `rpdeta` FOR EACH ROW BEGIN CALL ActualizarOVDeFactura(OLD.idFactura); CALL ActualizarOVDeFactura(NEW.idFactura); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_rpdeta_actualizar_estado` AFTER DELETE ON `rpdeta` FOR EACH ROW BEGIN CALL ActualizarOVDeFactura(OLD.idFactura); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rpdetv`
--

DROP TABLE IF EXISTS `rpdetv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpdetv` (
  `idReciboValor` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de valor del recibo',
  `tipoValor` varchar(50) NOT NULL COMMENT 'Tipo de medio de pago (ej. cheque, transferencia, efectivo)',
  `banco` varchar(100) NOT NULL COMMENT 'Banco del que proviene el valor o pago',
  `numeroCheque` varchar(50) DEFAULT NULL COMMENT 'Número de cheque (si el medio de pago es cheque)',
  `fechaVencimiento` date DEFAULT NULL COMMENT 'Fecha de vencimiento del cheque (si aplica)',
  `importe` decimal(12,2) NOT NULL COMMENT 'Importe del valor recibido, expresado en pesos',
  `idRecibo` int NOT NULL COMMENT 'ID del recibo al que pertenece el valor (referencia a rpcab)',
  PRIMARY KEY (`idReciboValor`),
  KEY `idRecibo` (`idRecibo`),
  CONSTRAINT `rpdetv_ibfk_1` FOREIGN KEY (`idRecibo`) REFERENCES `rpcab` (`idRecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalla los instrumentos de pago recibidos en cada recibo de cobro.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpdetv`
--

LOCK TABLES `rpdetv` WRITE;
/*!40000 ALTER TABLE `rpdetv` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpdetv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectores`
--

DROP TABLE IF EXISTS `sectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectores` (
  `idSector` int NOT NULL AUTO_INCREMENT COMMENT 'ID del sector o área de la empresa',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción del sector',
  PRIMARY KEY (`idSector`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Organiza la estructura de la empresa y permite clasificar a los empleados según el área en la que trabajan.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectores`
--

LOCK TABLES `sectores` WRITE;
/*!40000 ALTER TABLE `sectores` DISABLE KEYS */;
INSERT INTO `sectores` VALUES (1,'ADM'),(2,'PRD'),(3,'VTA'),(4,'COM'),(5,'EXP');
/*!40000 ALTER TABLE `sectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudpedido`
--

DROP TABLE IF EXISTS `solicitudpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudpedido` (
  `idSolicitud` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la solicitud de pedido',
  `fecha` date DEFAULT NULL COMMENT 'Fecha de creación de la solicitud',
  `motivo` varchar(255) DEFAULT NULL COMMENT 'Motivo o justificación de la solicitud',
  `tipoP` varchar(15) NOT NULL COMMENT 'Tipo de pedido: compra o venta',
  `idUsuarioSolicita` int DEFAULT NULL COMMENT 'ID del usuario que generó la solicitud (referencia a usuarios)',
  `idEstado` int DEFAULT NULL COMMENT 'ID del estado actual de la solicitud (referencia a estados)',
  PRIMARY KEY (`idSolicitud`),
  KEY `idUsuarioSolicita` (`idUsuarioSolicita`),
  KEY `idEstado` (`idEstado`),
  CONSTRAINT `solicitudpedido_ibfk_1` FOREIGN KEY (`idUsuarioSolicita`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `solicitudpedido_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los requerimientos internos de materiales realizados por cualquier sector de la empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudpedido`
--

LOCK TABLES `solicitudpedido` WRITE;
/*!40000 ALTER TABLE `solicitudpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudpedidodet`
--

DROP TABLE IF EXISTS `solicitudpedidodet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudpedidodet` (
  `idSolicitudDet` int NOT NULL AUTO_INCREMENT COMMENT 'ID del renglón de la solicitud',
  `cantidad` decimal(10,2) DEFAULT NULL COMMENT 'Cantidad del artículo solicitado',
  `idSolicitud` int DEFAULT NULL COMMENT 'ID de la solicitud cabecera (referencia a solicitudpedido)',
  `idArticulo` int DEFAULT NULL COMMENT 'ID del artículo solicitado (referencia a articulos)',
  PRIMARY KEY (`idSolicitudDet`),
  KEY `idSolicitud` (`idSolicitud`),
  KEY `idArticulo` (`idArticulo`),
  CONSTRAINT `solicitudpedidodet_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudpedido` (`idSolicitud`),
  CONSTRAINT `solicitudpedidodet_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los artículos y cantidades solicitadas en cada solicitud de pedido.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudpedidodet`
--

LOCK TABLES `solicitudpedidodet` WRITE;
/*!40000 ALTER TABLE `solicitudpedidodet` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudpedidodet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockprom`
--

DROP TABLE IF EXISTS `stockprom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockprom` (
  `idStockMov` int NOT NULL AUTO_INCREMENT COMMENT 'ID del movimiento de stock',
  `idArt` int NOT NULL COMMENT 'ID del artículo afectado (referencia a articulos)',
  `idOF` int NOT NULL COMMENT 'ID de la orden de fabricación relacionada al movimiento',
  `fecha` date NOT NULL COMMENT 'Fecha del movimiento de stock',
  `cant` decimal(8,2) NOT NULL COMMENT 'Cantidad del movimiento',
  `tMov` varchar(2) DEFAULT NULL COMMENT 'Tipo de movimiento (E = entrada, S = salida)',
  PRIMARY KEY (`idStockMov`),
  UNIQUE KEY `idArticulo_UNIQUE` (`idArt`),
  UNIQUE KEY `idOF_UNIQUE` (`idOF`),
  KEY `idArticulo` (`idArt`),
  CONSTRAINT `stockprom_ibfk_1` FOREIGN KEY (`idArt`) REFERENCES `articulos` (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los movimientos de stock de los artículos, tanto ingresos como egresos, para el cálculo del PPP.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockprom`
--

LOCK TABLES `stockprom` WRITE;
/*!40000 ALTER TABLE `stockprom` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockprom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipart`
--

DROP TABLE IF EXISTS `tipart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipart` (
  `idTipArt` int NOT NULL AUTO_INCREMENT COMMENT 'ID del tipo de artículo',
  `ClaseArt` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de artículo',
  PRIMARY KEY (`idTipArt`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Clasifica los materiales del inventario en categorías como madera, herrajes, tapicería o pintura.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipart`
--

LOCK TABLES `tipart` WRITE;
/*!40000 ALTER TABLE `tipart` DISABLE KEYS */;
INSERT INTO `tipart` VALUES (1,'TORNILLOS'),(2,'MADERAS'),(3,'PEGAMENTOS'),(4,'HERRAMIENTAS'),(5,'LIBRERIA'),(6,'MAQUINAS ELECT.'),(7,'CLAVOS'),(8,'MANIJAS'),(9,'REGATONES'),(10,'ESQUINEROS'),(11,'CUERINA'),(12,'VINILICOS'),(13,'TELAS'),(14,'LACAS'),(15,'PINTURAS'),(16,'CUEROS'),(17,'TONERS'),(18,'RUEDAS'),(19,'TARUGOS'),(20,'LOGOS'),(21,'CHAPA APOYO'),(22,'CURTIEMBRE'),(23,'MADERA ESPECIAL'),(24,'ELECTRICIDAD'),(25,'VARIOS');
/*!40000 ALTER TABLE `tipart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiprod`
--

DROP TABLE IF EXISTS `tiprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiprod` (
  `idTipProd` int NOT NULL AUTO_INCREMENT COMMENT 'ID del tipo de producto',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de producto',
  PRIMARY KEY (`idTipProd`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Clasifica los productos terminados en categorías.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiprod`
--

LOCK TABLES `tiprod` WRITE;
/*!40000 ALTER TABLE `tiprod` DISABLE KEYS */;
INSERT INTO `tiprod` VALUES (1,'COMBO'),(2,'CABEZAL'),(3,'CAJA'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `tiprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `idUbicacion` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la ubicación física en el depósito',
  `fila` int NOT NULL COMMENT 'Número de fila en el depósito',
  `columna` int NOT NULL COMMENT 'Número de columna en el depósito',
  `estante` int NOT NULL COMMENT 'Número de estante en el depósito',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción adicional de la ubicación',
  PRIMARY KEY (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa la localización física de los materiales dentro del depósito mediante referencias de fila, columna y estante.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idUni` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `Det` varchar(50) NOT NULL,
  PRIMARY KEY (`idUni`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'M2','METROS CUADRADOS'),(2,'CU','CADA UNO'),(3,'ML','METROS LINEALES'),(4,'CM3','CENTIMETROS CUBICOS'),(5,'KG','KILOGRAMO'),(6,'MM','MILIMETROS'),(7,'KWH','KILOWATS HORA'),(8,'LTS','LITROS');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fechaAlta` date DEFAULT NULL,
  `fechaBaja` date DEFAULT NULL,
  `idPuesto` int DEFAULT NULL,
  `idSector` int DEFAULT NULL,
  `Interno` int DEFAULT NULL,
  `Estado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idPuesto` (`idPuesto`),
  KEY `idSector` (`idSector`),
  CONSTRAINT `idpuestosfk` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idSector`) REFERENCES `sectores` (`idSector`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Roberto','Lopez','RLOPEZ',NULL,NULL,NULL,1,2001,'ACT'),(2,'Liliana','Perez','LPEREZ',NULL,NULL,NULL,1,2008,'ACT'),(3,'Raul','Moles','RMOLES',NULL,NULL,NULL,2,2004,'ACT'),(4,'Carlos ','Ramirez','CRAMIREZ',NULL,NULL,NULL,3,2007,'ACT'),(5,'Julio','Gomez','JGOMEZ',NULL,NULL,NULL,3,2009,'ACT'),(6,'Marino','Martinez','MMARTINEZ',NULL,NULL,NULL,2,2012,'ACT'),(7,'Pedro','Perez','PPEREZ',NULL,NULL,NULL,2,2013,'ACT'),(8,'Valeria','Gonzalez','VGONZALEZ',NULL,NULL,NULL,4,2020,'ACT'),(9,'Maria','Garcia','MGARCIA',NULL,NULL,NULL,4,2021,'ACT'),(10,'Marcelo','Lopez','MLOPEZ',NULL,NULL,NULL,5,2022,'ACT'),(11,'Juan','Gutierrez','JGUTIERREZ',NULL,NULL,NULL,2,2020,'ACT'),(12,'Carlos','Pereyra','CPEREYRA',NULL,NULL,NULL,2,2019,'ACT'),(13,'Andres','Garcia','AGARCIA',NULL,NULL,NULL,2,2017,'ACT'),(14,'Ruperto','Lacarra','RLACARRA',NULL,NULL,NULL,2,2019,'ACT'),(15,'Carlos','Carranza','CCARRANZA',NULL,NULL,NULL,2,2001,'ACT');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ordenes_venta`
--

DROP TABLE IF EXISTS `vista_ordenes_venta`;
/*!50001 DROP VIEW IF EXISTS `vista_ordenes_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ordenes_venta` AS SELECT 
 1 AS `idOV`,
 1 AS `fCreacion`,
 1 AS `fEntrega`,
 1 AS `total`,
 1 AS `estado`,
 1 AS `razonSocial`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos`
--

DROP TABLE IF EXISTS `vista_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos` AS SELECT 
 1 AS `idProducto`,
 1 AS `idCli`,
 1 AS `CodProd`,
 1 AS `desc`,
 1 AS `costo`,
 1 AS `margen`,
 1 AS `pUnitario`,
 1 AS `estado`,
 1 AS `fechaAlta`,
 1 AS `cliente_marca`,
 1 AS `cliente_razonSocial`,
 1 AS `tipo_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dashboard_kpis`
--

DROP TABLE IF EXISTS `vw_dashboard_kpis`;
/*!50001 DROP VIEW IF EXISTS `vw_dashboard_kpis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dashboard_kpis` AS SELECT 
 1 AS `recaudacion_total`,
 1 AS `ganancias_mes`,
 1 AS `a_cobrar`,
 1 AS `a_pagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ganancias_mensuales`
--

DROP TABLE IF EXISTS `vw_ganancias_mensuales`;
/*!50001 DROP VIEW IF EXISTS `vw_ganancias_mensuales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ganancias_mensuales` AS SELECT 
 1 AS `mes`,
 1 AS `anio`,
 1 AS `total_ganancia`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'boxsa'
--

--
-- Dumping routines for database 'boxsa'
--
/*!50003 DROP FUNCTION IF EXISTS `Get_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Costo`(v_idProd int) RETURNS float
    DETERMINISTIC
BEGIN
declare C_fab float;
select sum(art.PPP * rec.cant) into C_fab
from articulos art 
join recmat rec on art.idArticulo = rec.idArticulo
join productos prod on prod.idProducto = rec.idProducto
where v_idProd = prod.idProducto
group by prod.idProducto;

RETURN C_fab;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Positivio_Negativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Positivio_Negativo`(V_num int) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
if (V_num > 0) then
	return "positivo";
else
	RETURN "negativo";
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEstadoOV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEstadoOV`(IN p_idOV INT)
BEGIN
    DECLARE v_total_pasos INT DEFAULT 0;
    DECLARE v_pasos_pendientes INT DEFAULT 0;
    DECLARE v_lineas_sin_remitir INT DEFAULT 0;
    DECLARE v_facturas INT DEFAULT 0;
    DECLARE v_total_facturado DECIMAL(14,2) DEFAULT 0;
    DECLARE v_total_pagado DECIMAL(14,2) DEFAULT 0;
    DECLARE v_estado INT DEFAULT NULL;

    SELECT COUNT(*) INTO v_total_pasos
    FROM ovdet d
    JOIN productos p ON p.idProducto = d.idProducto
    JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
    WHERE d.idOV = p_idOV
      AND (rp.idProceso <> 3 OR p.CC IS NOT NULL);

    SELECT COUNT(*) INTO v_pasos_pendientes
    FROM ovdet d
    JOIN productos p ON p.idProducto = d.idProducto
    JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
    LEFT JOIN (
        SELECT idOVDet, idPro, SUM(cantP) AS cantidad_producida
        FROM produccion
        GROUP BY idOVDet, idPro
    ) prod ON prod.idOVDet = d.idOVDet AND prod.idPro = rp.idProceso
    WHERE d.idOV = p_idOV
      AND (rp.idProceso <> 3 OR p.CC IS NOT NULL)
      AND COALESCE(prod.cantidad_producida, 0) < d.cantidad;

    IF v_total_pasos = 0 OR v_pasos_pendientes > 0 THEN
        SET v_estado = (SELECT idEstado FROM estados WHERE tipo = 'OVP' LIMIT 1);
    ELSE
        SELECT COUNT(DISTINCT f.idFactura),
               COALESCE(SUM(f.total), 0),
               COALESCE(SUM(COALESCE(pagos.pagado, 0)), 0)
        INTO v_facturas, v_total_facturado, v_total_pagado
        FROM facturacab f
        JOIN (
            SELECT DISTINCT fd.idFactura
            FROM facturasdet fd
            JOIN ovdet d ON d.idOVDet = fd.idOVDet
            WHERE d.idOV = p_idOV
        ) vinculadas ON vinculadas.idFactura = f.idFactura
        LEFT JOIN (
            SELECT idFactura, SUM(importeAplicado) AS pagado
            FROM rpdeta
            GROUP BY idFactura
        ) pagos ON pagos.idFactura = f.idFactura;

        IF v_facturas = 0 THEN
            SET v_estado = (SELECT idEstado FROM estados WHERE tipo = 'OVF' LIMIT 1);
        ELSE
            SELECT COUNT(*) INTO v_lineas_sin_remitir
            FROM (
                SELECT d.idOVDet, d.cantidad, COALESCE(SUM(rd.cantidad), 0) AS entregado
                FROM ovdet d
                LEFT JOIN remitoscab rc ON rc.idOV = d.idOV
                LEFT JOIN remitosdet rd
                    ON rd.idRemito = rc.idRemito AND rd.idProducto = d.idProducto
                WHERE d.idOV = p_idOV
                GROUP BY d.idOVDet, d.cantidad
                HAVING COALESCE(SUM(rd.cantidad), 0) < d.cantidad
            ) pendientes_remito;

            IF v_lineas_sin_remitir = 0 THEN
                SET v_estado = (SELECT idEstado FROM estados WHERE tipo = 'REM' LIMIT 1);
                IF v_total_facturado > 0 AND v_total_pagado >= v_total_facturado THEN
                    SET v_estado = (SELECT idEstado FROM estados WHERE tipo = 'COB' LIMIT 1);
                END IF;
            ELSE
                SET v_estado = (SELECT idEstado FROM estados WHERE tipo = 'FAC' LIMIT 1);
            END IF;
        END IF;
    END IF;

    UPDATE ovcab SET idEstado = v_estado WHERE idOV = p_idOV;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarOVDeFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarOVDeFactura`(IN p_idFactura INT)
BEGIN
    DECLARE v_terminado INT DEFAULT 0;
    DECLARE v_idOV INT;
    DECLARE cur_ov CURSOR FOR
        SELECT DISTINCT d.idOV
        FROM facturasdet fd
        JOIN ovdet d ON d.idOVDet = fd.idOVDet
        WHERE fd.idFactura = p_idFactura AND d.idOV IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_terminado = 1;

    OPEN cur_ov;
    bucle: LOOP
        FETCH cur_ov INTO v_idOV;
        IF v_terminado = 1 THEN
            LEAVE bucle;
        END IF;
        CALL ActualizarEstadoOV(v_idOV);
    END LOOP;
    CLOSE cur_ov;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto`(V_idProd int, v_cantN int)
BEGIN

    select art.codigoArticulo, (rec.cant * v_cantN) 'Qty Necesaria' , art.stockActual Stock, (stockActual - (rec.cant * v_cantN)) Dif,  
    if(`Positivio_Negativo`(art.stockActual - (rec.cant * v_cantN)) = "positivo" , "Stock OK", "Sin Stock") Estado from recmat rec
    join articulos art
    on art.idArticulo = rec.idArticulo
    where V_idProd = rec.idProducto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto_2`(v_idProd int, v_cant int)
BEGIN
	select
    prod.CodProd,
    if(min(`Positivio_Negativo`(art.stockActual - rec.cant * v_cant)) = "positivo" , "S", "N") Procesable
    from recmat rec
    join articulos art
    on art.idArticulo = rec.idArticulo
    join productos prod
    on prod.idProducto = rec.idProducto
    where (V_idProd = rec.idProducto)
    group by prod.CodProd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item`(v_idOFCab int, v_idOfDet int)
BEGIN
select det.idOVDet Orden, det.nItem Item, det.idProducto Producto, cab.cant "Qty Ordenada", 
	est.tipo Estado, proc.codigoProceso Centro , prod.cantP "Qty procesada" , prod.hfin Fecha,
	 prod.idUs Operario  from ovdet det join ovcab cab
     
    on det.idOV = cab.idOV
    
    join produccion prod
    on cab.idOV = prod.idOV
    
    join estados est
    on cab.idEstado = est.idEstado
    
    join procesos proc
    on proc.idProceso = prod.idPro
   
    where det.idOV = v_idOFCab and det.idOVDet = v_idOfDet;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Costo`(v_idProd int)
BEGIN
select prod.CodProd Producto, sum(art.PPP * rec.cant) as "Costo Fabricacion"
from articulos art 
join recmat rec on art.idArticulo = rec.idArticulo
join productos prod on prod.idProducto = rec.idProducto
where v_idProd = prod.idProducto
group by prod.idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NuevoMov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NuevoMov`(V_tablaA varchar(45), V_Us int, V_Idmov int, V_det varchar(45))
BEGIN
	insert into audit values (default, now(), V_tablaA, V_Us, V_Idmov, V_det);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pendiente_OF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pendiente_OF`(IN p_idOV INT)
BEGIN
    WITH centros AS (
        SELECT
            d.idOV AS Orden,
            d.idOVDet,
            d.nItem,
            pr.CodProd AS producto,
            pr.`desc` AS detalle,
            IFNULL(e.descripcion, e.tipo) AS estado,
            d.cantidad AS cantidad,
            proc.codigoProceso AS cod,
            rp.ordenProceso AS seq,
            IFNULL(SUM(prod.cantP), 0) AS procesado
        FROM ovdet d
        JOIN ovcab cab ON cab.idOV = d.idOV
        JOIN estados e ON e.idEstado = cab.idEstado
        JOIN productos pr ON pr.idProducto = d.idProducto
        JOIN recprocesos rp ON rp.idOV = d.idOV AND rp.idProducto = d.idProducto
        JOIN procesos proc ON proc.idProceso = rp.idProceso
        LEFT JOIN produccion prod
            ON prod.idOV = d.idOV
           AND prod.idOVDet = d.idOVDet
           AND prod.idPro = rp.idProceso
        WHERE d.idOV = p_idOV
          AND (proc.idProceso <> 3 OR pr.CC IS NOT NULL)
        GROUP BY
            d.idOV, d.idOVDet, d.nItem, pr.CodProd, pr.`desc`,
            e.descripcion, e.tipo, d.cantidad, proc.codigoProceso, rp.ordenProceso
    )
    SELECT
        c.Orden,
        c.nItem AS Item,
        c.producto AS Producto,
        c.detalle AS Detalle,
        c.cantidad AS Qty,
        c.estado AS Estado,
        COALESCE(
            GROUP_CONCAT(
                CASE WHEN GREATEST(c.cantidad - c.procesado, 0) > 0
                     THEN CONCAT(c.cod, ':', GREATEST(c.cantidad - c.procesado, 0))
                END
                ORDER BY c.seq SEPARATOR ' | '
            ), '-'
        ) AS `Pendiente x Centro`,
        GROUP_CONCAT(
            CONCAT(c.cod, ' ', LEAST(c.procesado, c.cantidad), '/', c.cantidad)
            ORDER BY c.seq SEPARATOR ' > '
        ) AS `Ruta / Avance`,
        SUM(GREATEST(c.cantidad - c.procesado, 0)) AS `Pendiente total`,
        ROUND(
            CASE WHEN c.cantidad > 0 AND COUNT(*) > 0
                 THEN SUM(LEAST(c.procesado, c.cantidad)) / (c.cantidad * COUNT(*)) * 100
                 ELSE 0
            END,
            1
        ) AS `% avance`
    FROM centros c
    GROUP BY c.idOVDet, c.Orden, c.nItem, c.producto, c.detalle, c.estado, c.cantidad
    ORDER BY c.nItem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Put_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Put_Costo`(V_idProd int)
BEGIN
	declare v_costo int;
    set v_costo = Get_Costo(V_idProd);
    update productos
    set costo = v_costo, pUnitario = (v_costo + margen * v_costo / 100)
    where idProducto = V_idProd;
    
    select "Costo Producto:" as "", CodProd, productos.desc , v_costo "", "Precio Unitario:" as "Precio Unitario:", pUnitario "" 
    from productos 
    where idProducto = V_idProd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Receta_Mat_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Receta_Mat_Producto`(v_idProd int)
BEGIN
	select art.codigoArticulo as Articulo, art.PPP as valor , rec.cant as cantidad, art.stockActual as Stock
    from articulos art 
    join recmat rec on art.idArticulo = rec.idArticulo
    where v_idProd = rec.idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Saldos_Facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Saldos_Facturas`(in v_idCliente int)
BEGIN
	select
		f.idCliente as Cliente,
		f.idFactura as Comprobante,
		f.total as Importe,
		coalesce(sum(d.importeAplicado), 0) as Pagos,
		f.total - coalesce(sum(d.importeAplicado), 0) as Saldo
	from facturacab f
	left join rpdeta d on d.idFactura = f.idFactura
	where f.idCliente = v_idCliente
	group by f.idFactura, f.idCliente, f.total
	order by f.idFactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_ordenes_venta`
--

/*!50001 DROP VIEW IF EXISTS `vista_ordenes_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ordenes_venta` AS select `o`.`idOV` AS `idOV`,`o`.`fCreacion` AS `fCreacion`,`o`.`fEntrega` AS `fEntrega`,`o`.`total` AS `total`,`e`.`descripcion` AS `estado`,`c`.`razonSocial` AS `razonSocial` from ((`ovcab` `o` join `clientes` `c` on((`o`.`idCliente` = `c`.`idCliente`))) join `estados` `e` on((`o`.`idEstado` = `e`.`idEstado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos` AS select `p`.`idProducto` AS `idProducto`,`p`.`idCli` AS `idCli`,`p`.`CodProd` AS `CodProd`,`p`.`desc` AS `desc`,`p`.`costo` AS `costo`,`p`.`margen` AS `margen`,`p`.`pUnitario` AS `pUnitario`,`p`.`estado` AS `estado`,`p`.`fechaAlta` AS `fechaAlta`,`c`.`marca` AS `cliente_marca`,`c`.`razonSocial` AS `cliente_razonSocial`,`tp`.`descripcion` AS `tipo_descripcion` from ((`productos` `p` left join `clientes` `c` on((`p`.`idCli` = `c`.`idCliente`))) left join `tiprod` `tp` on((`p`.`idTipProd` = `tp`.`idTipProd`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dashboard_kpis`
--

/*!50001 DROP VIEW IF EXISTS `vw_dashboard_kpis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dashboard_kpis` AS select (select ifnull(sum(`facturacab`.`total`),0) from `facturacab`) AS `recaudacion_total`,(select ifnull(sum(`ovcab`.`total`),0) from `ovcab` where ((month(`ovcab`.`fCreacion`) = month(curdate())) and (year(`ovcab`.`fCreacion`) = year(curdate())))) AS `ganancias_mes`,((select ifnull(sum(`facturacab`.`total`),0) from `facturacab`) - (select ifnull(sum(`rpdeta`.`importeAplicado`),0) from `rpdeta`)) AS `a_cobrar`,((select ifnull(sum(`facturasprovcab`.`importe`),0) from `facturasprovcab`) - (select ifnull(sum(`pagoprov`.`importe`),0) from `pagoprov`)) AS `a_pagar` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ganancias_mensuales`
--

/*!50001 DROP VIEW IF EXISTS `vw_ganancias_mensuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ganancias_mensuales` AS select month(`ovcab`.`fCreacion`) AS `mes`,year(`ovcab`.`fCreacion`) AS `anio`,ifnull(sum(`ovcab`.`total`),0) AS `total_ganancia` from `ovcab` group by year(`ovcab`.`fCreacion`),month(`ovcab`.`fCreacion`) order by `anio` desc,`mes` desc limit 6 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 16:00:19
