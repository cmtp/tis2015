-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: tis_munisoft
-- ------------------------------------------------------
-- Server version	10.0.17-MariaDB

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
-- Table structure for table `TBL_DUMMY`
--

DROP TABLE IF EXISTS `TBL_DUMMY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_DUMMY` (
  `error` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_DUMMY`
--

LOCK TABLES `TBL_DUMMY` WRITE;
/*!40000 ALTER TABLE `TBL_DUMMY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_DUMMY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_grupo_empresa`
--

DROP TABLE IF EXISTS `actividad_grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad_grupo_empresa` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `porcentaje_completado` decimal(6,2) DEFAULT '0.00',
  `modificado` int(11) DEFAULT '0',
  `entrega_producto` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `fk_actividad_grupo_empresa_entrega_producto1_idx` (`entrega_producto`),
  KEY `id_responsable` (`id_responsable`),
  KEY `id_responsable_2` (`id_responsable`),
  CONSTRAINT `fk_actividad_grupo_empresa_entrega_producto1` FOREIGN KEY (`entrega_producto`) REFERENCES `entrega_producto` (`id_entrega_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_grupo_empresa`
--

LOCK TABLES `actividad_grupo_empresa` WRITE;
/*!40000 ALTER TABLE `actividad_grupo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `id_anuncio` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) NOT NULL,
  `contenido` text,
  `adjunto` varchar(128) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_anuncio`),
  KEY `fk_anuncio_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_anuncio_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avance_semanal`
--

DROP TABLE IF EXISTS `avance_semanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avance_semanal` (
  `id_avance_semanal` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_revision` date NOT NULL,
  `desc_avance` varchar(128) NOT NULL,
  `enlace_entregable` varchar(128) DEFAULT NULL,
  `observacion` varchar(128) DEFAULT NULL,
  `presentado` int(1) NOT NULL,
  `grupo_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_avance_semanal`),
  KEY `fk_avance_semanal_grupo_empresa1_idx` (`grupo_empresa`),
  CONSTRAINT `fk_avance_semanal_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_semanal`
--

LOCK TABLES `avance_semanal` WRITE;
/*!40000 ALTER TABLE `avance_semanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `avance_semanal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `avance_semanal_BINS` BEFORE INSERT ON `avance_semanal` FOR EACH ROW BEGIN
	INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,6,NEW.grupo_empresa,get_consultor_empresa(NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `backup_log`
--

DROP TABLE IF EXISTS `backup_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_log` (
  `id_backup` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_backup` varchar(32) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `observacion` varchar(128) NOT NULL,
  PRIMARY KEY (`id_backup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_log`
--

LOCK TABLES `backup_log` WRITE;
/*!40000 ALTER TABLE `backup_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_bd`
--

DROP TABLE IF EXISTS `bitacora_bd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_bd` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `tabla` varchar(64) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `viejo` text,
  `nuevo` text,
  PRIMARY KEY (`id_bitacora`),
  KEY `fk_bitacora_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_bitacora_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_bd`
--

LOCK TABLES `bitacora_bd` WRITE;
/*!40000 ALTER TABLE `bitacora_bd` DISABLE KEYS */;
INSERT INTO `bitacora_bd` VALUES (253,1,'usuario','2014-06-23 09:07:57',NULL,'0,admin,admin,Boris Marcelo,Calancha Navia,4436755,boris@yahoo.com,,1,1,1');
/*!40000 ALTER TABLE `bitacora_bd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_sesion`
--

DROP TABLE IF EXISTS `bitacora_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_sesion` (
  `id_bitacora_sesion` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `operacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_bitacora_sesion`),
  KEY `fk_bitacora_sesion_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_bitacora_sesion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_sesion`
--

LOCK TABLES `bitacora_sesion` WRITE;
/*!40000 ALTER TABLE `bitacora_sesion` DISABLE KEYS */;
INSERT INTO `bitacora_sesion` VALUES (1,1,'2015-05-17 09:22:35',0);
/*!40000 ALTER TABLE `bitacora_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Licenciatura en Informática'),(2,'Ingeniería de Sistemas');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultor_tis`
--

DROP TABLE IF EXISTS `consultor_tis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultor_tis` (
  `usuario` int(11) NOT NULL,
  `curriculum` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  CONSTRAINT `fk_consultor_tis_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultor_tis`
--

LOCK TABLES `consultor_tis` WRITE;
/*!40000 ALTER TABLE `consultor_tis` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultor_tis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `consultor_tis_BINS` BEFORE INSERT ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO notificacion (fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,1,NEW.usuario,1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `consultor_tis_AINS` AFTER INSERT ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',' , NEW.usuario, NEW.curriculum));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `consultor_tis_AUPD` AFTER UPDATE ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',', OLD.usuario, OLD.curriculum), CONCAT_WS(',' , NEW.usuario, NEW.curriculum));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `consultor_tis_ADEL` AFTER DELETE ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',', OLD.usuario, OLD.curriculum));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `documento_consultor`
--

DROP TABLE IF EXISTS `documento_consultor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_consultor` (
  `id_documento_consultor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(64) NOT NULL,
  `descripsion_documento` varchar(128) DEFAULT NULL,
  `ruta_documento` varchar(128) DEFAULT NULL,
  `fecha_documento` datetime NOT NULL,
  `documento_jefe` tinyint(1) NOT NULL,
  `consultor_tis` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_documento_consultor`),
  KEY `fk_documento_consultor_consultor_tis1_idx` (`consultor_tis`),
  KEY `fk_documento_consultor_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_documento_consultor_consultor_tis1` FOREIGN KEY (`consultor_tis`) REFERENCES `consultor_tis` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_consultor_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_consultor`
--

LOCK TABLES `documento_consultor` WRITE;
/*!40000 ALTER TABLE `documento_consultor` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento_consultor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `documento_consultor_AINS` AFTER INSERT ON `documento_consultor` FOR EACH ROW BEGIN
	INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,4,NEW.consultor_tis,1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrega_producto`
--

DROP TABLE IF EXISTS `entrega_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega_producto` (
  `id_entrega_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_real_entrega` date DEFAULT NULL,
  `pago_establecido` decimal(6,2) DEFAULT '0.00',
  `pago_recibido` decimal(6,2) DEFAULT '0.00',
  `observacion` text,
  `enlace_producto` text,
  `grupo_empresa` int(11) NOT NULL,
  `id_responsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entrega_producto`),
  KEY `fk_entrega_producto_grupo_empresa1_idx` (`grupo_empresa`),
  KEY `id_responsable` (`id_responsable`),
  CONSTRAINT `entrega_producto_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_entrega_producto_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_producto`
--

LOCK TABLES `entrega_producto` WRITE;
/*!40000 ALTER TABLE `entrega_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `entrega_producto_AINS` AFTER INSERT ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,nuevo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',NEW.id_entrega_producto,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.fecha_real_entrega,NEW.pago_establecido,NEW.pago_recibido,NEW.observacion,NEW.enlace_producto,NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `entrega_producto_BUPD` BEFORE UPDATE ON `entrega_producto` FOR EACH ROW BEGIN
	DECLARE old_date CONDITION FOR SQLSTATE '99991';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		CALL SP_RAISE_ERROR ('La actividad puede editarse. Verifique lo siguiente:
-La fecha de inicio de la entrega no es hoy ni ha pasado ya.
-La duración máxima de la entrega deber ser de dos semanas.');
	  END;
	IF(OLD.fecha_inicio <= CURDATE() AND (OLD.descripcion != NEW.descripcion OR OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)) THEN
		CALL ghost_procedure();
	END IF;
	IF(OLD.enlace_producto != NEW.enlace_producto)
	THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,11,id_usuario(connection_id()),get_consultor_empresa(NEW.grupo_empresa));
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `entrega_producto_AUPD` AFTER UPDATE ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo,nuevo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_entrega_producto,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.fecha_real_entrega,OLD.pago_establecido,OLD.pago_recibido,OLD.observacion,OLD.enlace_producto,OLD.grupo_empresa),CONCAT_WS(',',NEW.id_entrega_producto,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.fecha_real_entrega,NEW.pago_establecido,NEW.pago_recibido,NEW.observacion,NEW.enlace_producto,NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `entrega_producto_ADEL` AFTER DELETE ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_entrega_producto,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.fecha_real_entrega,OLD.pago_establecido,OLD.pago_recibido,OLD.observacion,OLD.enlace_producto,OLD.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fase_convocatoria`
--

DROP TABLE IF EXISTS `fase_convocatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fase_convocatoria` (
  `id_fase_convocatoria` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_fase_convocatoria` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  PRIMARY KEY (`id_fase_convocatoria`),
  KEY `fk_actividad_tipo_actividad1_idx` (`tipo_fase_convocatoria`),
  KEY `fk_fase_convocatoria_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_actividad_tipo_actividad1` FOREIGN KEY (`tipo_fase_convocatoria`) REFERENCES `tipo_fase_convocatoria` (`id_tipo_fase_convocatoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fase_convocatoria_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase_convocatoria`
--

LOCK TABLES `fase_convocatoria` WRITE;
/*!40000 ALTER TABLE `fase_convocatoria` DISABLE KEYS */;
INSERT INTO `fase_convocatoria` VALUES (13,NULL,NULL,NULL,0,1,1),(14,NULL,NULL,NULL,0,2,1),(15,NULL,NULL,NULL,0,3,1),(16,NULL,NULL,NULL,0,4,1),(17,NULL,NULL,NULL,0,5,1),(18,NULL,NULL,NULL,0,6,1),(19,NULL,NULL,NULL,0,7,1),(20,NULL,NULL,NULL,0,1,2),(21,NULL,NULL,NULL,0,2,2),(22,NULL,NULL,NULL,0,3,2),(23,NULL,NULL,NULL,0,4,2),(24,NULL,NULL,NULL,0,5,2),(25,NULL,NULL,NULL,0,6,2),(26,NULL,NULL,NULL,0,7,2);
/*!40000 ALTER TABLE `fase_convocatoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `fase_convocatoria_BUPD` BEFORE UPDATE ON `fase_convocatoria` FOR EACH ROW BEGIN
	DECLARE tipo INT;
	IF(OLD.activo != NEW.activo)
	THEN IF(NEW.activo = 1)
			THEN SET tipo = 9;
			ELSE SET tipo = 10;
		END IF;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),1);
	END IF;
	IF(OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)
	THEN SET tipo = 14;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),1);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gestion_empresa_tis`
--

DROP TABLE IF EXISTS `gestion_empresa_tis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_empresa_tis` (
  `id_gestion` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` varchar(20) NOT NULL,
  `descripcion_gestion` varchar(64) DEFAULT NULL,
  `fecha_ini_gestion` date NOT NULL,
  `fecha_fin_gestion` date DEFAULT NULL,
  `gestion_activa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gestion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_empresa_tis`
--

LOCK TABLES `gestion_empresa_tis` WRITE;
/*!40000 ALTER TABLE `gestion_empresa_tis` DISABLE KEYS */;
INSERT INTO `gestion_empresa_tis` VALUES (1,'Permanente','Gestion Permanente para Administrador Y Consultor TIS','2014-01-01',NULL,0),(2,'1-2015','gestion de empresa tis 2015','2015-05-17','2015-07-31',1);
/*!40000 ALTER TABLE `gestion_empresa_tis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `fases` AFTER INSERT ON `gestion_empresa_tis` FOR EACH ROW BEGIN
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,1,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,2,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,3,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,4,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,5,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,6,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,7,NEW.id_gestion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo_empresa`
--

DROP TABLE IF EXISTS `grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_empresa` (
  `id_grupo_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_largo` varchar(64) NOT NULL,
  `nombre_corto` varchar(20) NOT NULL,
  `fecha_sobre_a` date DEFAULT NULL,
  `sobre_a` varchar(128) DEFAULT NULL,
  `fecha_sobre_b` date DEFAULT NULL,
  `sobre_b` varchar(128) DEFAULT NULL,
  `sociedad` int(11) DEFAULT NULL,
  `consultor_tis` int(11) NOT NULL,
  `observacion` varchar(64) DEFAULT NULL,
  `habilitado` int(1) DEFAULT '0',
  PRIMARY KEY (`id_grupo_empresa`),
  KEY `fk_grupo_empresa_sociedad` (`sociedad`),
  KEY `fk_grupo_empresa_consultor_tis1_idx` (`consultor_tis`),
  CONSTRAINT `fk_grupo_empresa_consultor_tis1` FOREIGN KEY (`consultor_tis`) REFERENCES `consultor_tis` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_empresa_sociedad` FOREIGN KEY (`sociedad`) REFERENCES `sociedad` (`id_sociedad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_empresa`
--

LOCK TABLES `grupo_empresa` WRITE;
/*!40000 ALTER TABLE `grupo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `grupo_empresa_AINS` AFTER INSERT ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',' ,NEW.nombre_largo, NEW.nombre_corto, NEW.fecha_sobre_a, NEW.sobre_a, NEW.fecha_sobre_b, NEW.sobre_b, NEW.sociedad, NEW.consultor_tis));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `grupo_empresa_BUPD` BEFORE UPDATE ON `grupo_empresa` FOR EACH ROW BEGIN
IF((OLD.sobre_a <=> NULL AND !(OLD.sobre_a <=> NEW.sobre_a)) OR(OLD.sobre_b <=> NULL AND !(OLD.sobre_b <=> NEW.sobre_b)))
         THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,16,get_jefe_grupo(OLD.id_grupo_empresa),get_consultor_empresa(OLD.id_grupo_empresa));
ELSE IF((!(OLD.sobre_a <=> NULL) AND (NEW.sobre_a <=> NULL)) OR(!(OLD.sobre_b <=> NULL) AND (NEW.sobre_b <=> NULL)))
         THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,12,get_consultor_empresa(OLD.id_grupo_empresa),get_jefe_grupo(OLD.id_grupo_empresa));
         ELSE IF(OLD.habilitado = '0' AND NEW.habilitado = '1')
                  THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,15,get_consultor_empresa(OLD.id_grupo_empresa),get_jefe_grupo(OLD.id_grupo_empresa));
                  END IF;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `grupo_empresa_AUPD` AFTER UPDATE ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',', OLD.nombre_largo, OLD.nombre_corto, OLD.fecha_sobre_a, OLD.sobre_a, OLD.fecha_sobre_b, OLD.sobre_b, OLD.sociedad, OLD.consultor_tis, OLD.observacion, OLD.habilitado), CONCAT_WS(',' ,NEW.nombre_largo, NEW.nombre_corto, NEW.fecha_sobre_a, NEW.sobre_a, NEW.fecha_sobre_b, NEW.sobre_b, NEW.sociedad, NEW.consultor_tis, NEW.observacion, NEW.habilitado));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `grupo_empresa_ADEL` AFTER DELETE ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',', OLD.nombre_largo, OLD.nombre_corto, OLD.fecha_sobre_a, OLD.sobre_a, OLD.fecha_sobre_b, OLD.sobre_b, OLD.sociedad, OLD.consultor_tis));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `integrante`
--

DROP TABLE IF EXISTS `integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrante` (
  `usuario` int(11) NOT NULL,
  `codigo_sis` varchar(9) NOT NULL,
  `carrera` int(11) NOT NULL,
  `grupo_empresa` int(11) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_integrante_carrera1_idx` (`carrera`),
  KEY `fk_integrante_grupo_empresa1_idx` (`grupo_empresa`),
  CONSTRAINT `fk_integrante_carrera1` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_integrante_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_integrante_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrante`
--

LOCK TABLES `integrante` WRITE;
/*!40000 ALTER TABLE `integrante` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `integrante_BINS` BEFORE INSERT ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO notificacion (fecha, tipo_notificacion, usuario, usuario_destino) VALUES (CURRENT_TIMESTAMP,2,NEW.usuario,get_consultor_empresa(NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `integrante_AINS` AFTER INSERT ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',' , NEW.usuario, NEW.codigo_sis, NEW.carrera, NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `integrante_AUPD` AFTER UPDATE ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',', OLD.usuario, OLD.codigo_sis, OLD.carrera, OLD.grupo_empresa), CONCAT_WS(',' , NEW.usuario, NEW.codigo_sis, NEW.carrera, NEW.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `integrante_ADEL` AFTER DELETE ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',', OLD.usuario, OLD.codigo_sis, OLD.carrera, OLD.grupo_empresa));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `contenido` text NOT NULL,
  `leido` tinyint(1) NOT NULL,
  `de_usuario` int(11) NOT NULL,
  `asunto` varchar(32) NOT NULL,
  `visible` int(1) NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `fk_mensaje_usuario1_idx` (`de_usuario`),
  CONSTRAINT `fk_mensaje_usuario1` FOREIGN KEY (`de_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologia`
--

DROP TABLE IF EXISTS `metodologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologia` (
  `id_metodologia` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_metodologia` varchar(50) NOT NULL,
  `descripcion_metodologia` varchar(300) NOT NULL,
  PRIMARY KEY (`id_metodologia`),
  UNIQUE KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologia`
--

LOCK TABLES `metodologia` WRITE;
/*!40000 ALTER TABLE `metodologia` DISABLE KEYS */;
INSERT INTO `metodologia` VALUES (1,'scrum','metodologia scrum'),(2,'eXtreme Programming','metodologia xp');
/*!40000 ALTER TABLE `metodologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologia_grupo_empresa`
--

DROP TABLE IF EXISTS `metodologia_grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologia_grupo_empresa` (
  `id_grupo_empresa` int(11) NOT NULL,
  `id_metodologia` int(11) NOT NULL,
  UNIQUE KEY `id_grupo_empresa` (`id_metodologia`),
  KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologia_grupo_empresa`
--

LOCK TABLES `metodologia_grupo_empresa` WRITE;
/*!40000 ALTER TABLE `metodologia_grupo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodologia_grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `leido` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL,
  `tipo_notificacion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `usuario_destino` int(11) NOT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `fk_notificacion_tipo_notificacion1_idx` (`tipo_notificacion`),
  KEY `fk_notificacion_usuario1_idx` (`usuario`),
  KEY `fk_notificacion_usuario2_idx` (`usuario_destino`),
  CONSTRAINT `fk_notificacion_tipo_notificacion1` FOREIGN KEY (`tipo_notificacion`) REFERENCES `tipo_notificacion` (`id_tipo_notificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificacion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificacion_usuario2` FOREIGN KEY (`usuario_destino`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `rol_unico` varchar(2) NOT NULL DEFAULT 'no',
  `id_metodologia` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Representante Legal','El Representante Legal contacta con la Empresa TIS para todo efecto legal.','si',0),(2,'Product Owner','En Scrum, el Product Owner estudia los requerimientos del cliente y los comunica al Equipo.','si',1),(3,'Scrum Master','En Scrum, el Scrum Master dirige el proceso de desarrollo.','si',1),(4,'Desarrollador','El Desarrollador es \"el pan y la mantequilla\" de todo proceso de desarrollo de software.','no',0),(5,'Tester','El Tester se encarga de probar la funcionalidad de los producto de los desarrolladores.','no',0),(6,'Encargado Base de Datos','El Encargado de la Base de Datos está continuamente trabajando con la reingeniería de la base de datos.','no',0),(7,'Documentador','El Documentador redacta los documentos necesarios para controlar, verificar y avalar el proceso.','no',0),(8,'Tracker','Proporciona retroalimentacion al equipo en el proceso xp','si',2),(9,'Big boss','Es el vinculo entre clientes y programadores','si',2);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_integrante`
--

DROP TABLE IF EXISTS `rol_integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_integrante` (
  `integrante` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  KEY `fk_rol_integrante_rol1_idx` (`rol`),
  KEY `fk_rol_integrante_integrante1_idx` (`integrante`),
  CONSTRAINT `fk_rol_integrante_integrante1` FOREIGN KEY (`integrante`) REFERENCES `integrante` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_integrante_rol1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_integrante`
--

LOCK TABLES `rol_integrante` WRITE;
/*!40000 ALTER TABLE `rol_integrante` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_integrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `id_proceso` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_proceso`),
  KEY `fk_sesion_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_sesion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociedad`
--

DROP TABLE IF EXISTS `sociedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociedad` (
  `id_sociedad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) NOT NULL,
  `abreviatura` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_sociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociedad`
--

LOCK TABLES `sociedad` WRITE;
/*!40000 ALTER TABLE `sociedad` DISABLE KEYS */;
INSERT INTO `sociedad` VALUES (1,'Sociedad Anónima','S.A.'),(2,'Sociedad de Responsabilidad Limitada','S.R.L.'),(3,'Empresa Individual de Responsabilidad Limitada','E.I.R.L.'),(4,'Sociedad en Comandita','S.Co.'),(5,'Sociedad Colectiva','S.C.'),(6,'Sociedad de Hecho','S.H.');
/*!40000 ALTER TABLE `sociedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `resultado_esperado` varchar(128) NOT NULL,
  `resultado_obtenido` varchar(128) DEFAULT NULL,
  `porcentaje_completado` int(11) NOT NULL DEFAULT '0',
  `color_tarea` varchar(20) DEFAULT NULL,
  `color_texto` varchar(20) DEFAULT NULL,
  `modificado` int(11) DEFAULT '0',
  `actividad` int(11) NOT NULL,
  `responsable` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`),
  KEY `fk_tarea_actividad_grupo_empresa1_idx` (`actividad`),
  KEY `fk_tarea_integrante1_idx` (`responsable`),
  CONSTRAINT `fk_tarea_actividad_grupo_empresa1` FOREIGN KEY (`actividad`) REFERENCES `actividad_grupo_empresa` (`id_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarea_integrante1` FOREIGN KEY (`responsable`) REFERENCES `integrante` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `tarea_AINS` AFTER INSERT ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,nuevo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',NEW.id_tarea,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.resultado_esperado,NEW.resultado_obtenido,NEW.porcentaje_completado,NEW.color_tarea,NEW.color_texto,NEW.modificado));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `tarea_BUPD` BEFORE UPDATE ON `tarea` FOR EACH ROW BEGIN
	DECLARE old_date CONDITION FOR SQLSTATE '99991';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		CALL SP_RAISE_ERROR ('La fecha de inicio de la tarea ya ha vencido.');
	  END;
	IF(OLD.fecha_inicio <= CURDATE() AND (OLD.descripcion != NEW.descripcion OR OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)) THEN
		CALL ghost_procedure();
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `tarea_AUPD` AFTER UPDATE ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo,nuevo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_tarea,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.resultado_esperado,OLD.resultado_obtenido,OLD.porcentaje_completado,OLD.color_tarea,OLD.color_texto,OLD.modificado),CONCAT_WS(',',NEW.id_tarea,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.resultado_esperado,NEW.resultado_obtenido,NEW.porcentaje_completado,NEW.color_tarea,NEW.color_texto,NEW.modificado));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `tarea_ADEL` AFTER DELETE ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_tarea,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.resultado_esperado,OLD.resultado_obtenido,OLD.porcentaje_completado,OLD.color_tarea,OLD.color_texto,OLD.modificado));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_fase_convocatoria`
--

DROP TABLE IF EXISTS `tipo_fase_convocatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_fase_convocatoria` (
  `id_tipo_fase_convocatoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) NOT NULL,
  PRIMARY KEY (`id_tipo_fase_convocatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_fase_convocatoria`
--

LOCK TABLES `tipo_fase_convocatoria` WRITE;
/*!40000 ALTER TABLE `tipo_fase_convocatoria` DISABLE KEYS */;
INSERT INTO `tipo_fase_convocatoria` VALUES (1,'Lanzamiento de la Convocatoria Pública'),(2,'Registro de Grupo Empresas'),(3,'Envio de Documentos'),(4,'Firma de Contratos'),(5,'Proceso de Desarollo'),(6,'Entrega de Producto Final'),(7,'Cierre de la Convocatoria');
/*!40000 ALTER TABLE `tipo_fase_convocatoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_notificacion`
--

DROP TABLE IF EXISTS `tipo_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_notificacion` (
  `id_tipo_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `enlace` varchar(128) DEFAULT NULL,
  `contenido` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_notificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_notificacion`
--

LOCK TABLES `tipo_notificacion` WRITE;
/*!40000 ALTER TABLE `tipo_notificacion` DISABLE KEYS */;
INSERT INTO `tipo_notificacion` VALUES (1,'Consultor(es) TIS esperando validación','',''),(2,'Integrante(s) esperando validación','',''),(3,'Comentario(s) nuevo(s)','',''),(4,'Documento(s) nuevo(s)','',''),(5,'Plazo(s) cumplido(s)','',''),(6,'Nuevo avance semanal','',''),(7,'Usuario habilitado','',''),(8,'Usuario deshabilitado','',''),(9,'Fase habilitada','',''),(10,'Fase deshabilitada','',''),(11,'Enlace producto actualizado','',''),(12,'Consultor TIS rechazo sobres A-B','',''),(13,'Documento recibido','',''),(14,'Fase modificada','',''),(15,'Consultor TIS acepta sobres A-B','',''),(16,'Grupo Empresa envio sobres A-B','',''),(17,'Tiene observacion(es) en la entrega de un subsistema','','');
/*!40000 ALTER TABLE `tipo_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador'),(2,'Jefe Consultor TIS'),(3,'Consultor TIS'),(4,'Jefe de Grupo Empresa'),(5,'Integrante');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(48) NOT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario`),
  KEY `fk_usuario_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_usuario_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Boris Marcelo','Calancha Navia','4436755','boris@yahoo.com','',1,1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `usuario_AINS` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario',CONCAT_WS(',', LAST_INSERT_ID(), NEW.nombre_usuario, NEW.clave, NEW.nombre, NEW.apellido, NEW.telefono, NEW.email, NEW.foto, NEW.habilitado, NEW.tipo_usuario, NEW.gestion));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `usuario_BUPD` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
	DECLARE tipo INT;
	IF(OLD.habilitado != NEW.habilitado)
	THEN IF(NEW.habilitado = 1)
			THEN SET tipo = 7;
			ELSE SET tipo = 8;
		END IF;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),NEW.id_usuario);
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `usuario_AUPD` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
	IF(OLD.habilitado != NEW.habilitado) THEN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario', CONCAT_WS(',', OLD.nombre_usuario, OLD.clave, OLD.nombre, OLD.apellido, OLD.telefono, OLD.email, OLD.foto, OLD.habilitado, OLD.tipo_usuario, OLD.gestion), CONCAT_WS(',' ,NEW.nombre_usuario, NEW.clave, NEW.nombre, NEW.apellido, NEW.telefono, NEW.email, NEW.foto, NEW.habilitado, NEW.tipo_usuario, NEW.gestion));
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`munisoft`@`%`*/ /*!50003 TRIGGER `usuario_ADEL` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario', CONCAT_WS(',', OLD.nombre_usuario, OLD.clave, OLD.nombre, OLD.apellido, OLD.telefono, OLD.email, OLD.foto, OLD.habilitado, OLD.tipo_usuario, OLD.gestion));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-17  9:22:55
