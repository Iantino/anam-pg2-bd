-- MySQL dump 10.13  Distrib 26.7.0, for Win64 (x86_64)
--
-- Host: localhost    Database: municipalidad_sanpablojocopilas
-- ------------------------------------------------------
-- Server version	26.7.0

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `accion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'crear, modificar, eliminar, login, logout, etc.',
  `tabla_afectada` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registro_id` int DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalle` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_auditoria_usuario` (`usuario_id`),
  KEY `idx_auditoria_fecha` (`fecha`),
  KEY `idx_auditoria_tabla` (`tabla_afectada`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,NULL,'crear','tramites',1,'2026-09-18 10:05:03','Trámite público TRM-2026-000001 registrado por Fritz Ian Valentino Urizar Rodas'),(2,1,'login_fallido','usuarios',1,'2026-09-18 10:06:28','Intento fallido #1'),(3,1,'login_fallido','usuarios',1,'2026-09-18 10:06:35','Intento fallido #2'),(4,1,'login_fallido','usuarios',1,'2026-09-18 10:06:35','Intento fallido #3'),(5,1,'login_fallido','usuarios',1,'2026-09-18 10:06:35','Intento fallido #4'),(6,1,'login_fallido','usuarios',1,'2026-09-18 10:06:36','Intento fallido #5'),(7,1,'login','usuarios',1,'2026-09-18 10:09:56',NULL),(8,1,'login','usuarios',1,'2026-09-18 10:53:14',NULL),(9,1,'login','usuarios',1,'2026-09-18 15:10:50',NULL),(10,NULL,'crear','tramites',2,'2026-09-18 15:13:41','Trámite público TRM-2026-000002 registrado por Ian'),(11,1,'modificar','tramites',1,'2026-09-18 15:15:07','Estado cambiado de 1 a 2'),(12,1,'modificar','tramites',1,'2026-09-18 15:15:08','Responsable asignado: usuario 1'),(13,NULL,'crear','tramites',3,'2026-09-18 20:38:39','Trámite público TRM-2026-000003 registrado por Fritz Ian'),(14,NULL,'crear','tramites',4,'2026-09-23 09:31:45','Trámite público TRM-2026-000004 registrado por Ian'),(15,1,'login_fallido','usuarios',1,'2026-09-23 09:32:18','Intento fallido #1'),(16,1,'login_fallido','usuarios',1,'2026-09-23 09:32:23','Intento fallido #2'),(17,1,'login','usuarios',1,'2026-09-23 09:32:30',NULL),(18,1,'login','usuarios',1,'2026-09-28 09:46:08',NULL),(19,1,'login','usuarios',1,'2026-09-28 19:03:48',NULL),(20,1,'crear','usuarios',2,'2026-09-28 19:04:19','Usuario creado: Ian'),(21,1,'crear','usuarios',3,'2026-09-28 19:04:45','Usuario creado: Ianpruebas'),(22,1,'logout','usuarios',1,'2026-09-28 19:04:49',NULL),(23,2,'login','usuarios',2,'2026-09-28 19:04:55',NULL),(24,2,'logout','usuarios',2,'2026-09-28 19:05:03',NULL),(25,3,'login','usuarios',3,'2026-09-28 19:05:09',NULL),(26,3,'login','usuarios',3,'2026-09-28 19:29:30',NULL),(27,3,'logout','usuarios',3,'2026-09-28 19:29:42',NULL);
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biografia_alcalde`
--

DROP TABLE IF EXISTS `biografia_alcalde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biografia_alcalde` (
  `id` int NOT NULL DEFAULT '1',
  `nombre_completo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cargo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Alcalde Municipal',
  `periodo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ej. 2024 - 2028',
  `partido_politico` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nombre del archivo en uploads/alcalde',
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `familia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resumen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Presentación / reseña biográfica',
  `formacion_academica` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trayectoria_profesional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trayectoria_politica` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Servicio público y cargos anteriores',
  `logros` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Logros y reconocimientos',
  `ejes_trabajo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Ejes o prioridades de su gestión',
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Mensaje a la población',
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `actualizado_por` int DEFAULT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_biografia_usuario` (`actualizado_por`),
  CONSTRAINT `fk_biografia_usuario` FOREIGN KEY (`actualizado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_biografia_single_row` CHECK ((`id` = 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biografia_alcalde`
--

LOCK TABLES `biografia_alcalde` WRITE;
/*!40000 ALTER TABLE `biografia_alcalde` DISABLE KEYS */;
INSERT INTO `biografia_alcalde` VALUES (1,'','Alcalde Municipal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2026-09-28 18:44:14');
/*!40000 ALTER TABLE `biografia_alcalde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tramite_id` int NOT NULL,
  `nombre_original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano` int NOT NULL COMMENT 'tamaño en bytes',
  `usuario_id` int NOT NULL,
  `fecha_carga` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_documentos_tramite` (`tramite_id`),
  KEY `fk_documentos_usuario` (`usuario_id`),
  CONSTRAINT `fk_documentos_tramite` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_documentos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_tramite`
--

DROP TABLE IF EXISTS `estados_tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_tramite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_tramite`
--

LOCK TABLES `estados_tramite` WRITE;
/*!40000 ALTER TABLE `estados_tramite` DISABLE KEYS */;
INSERT INTO `estados_tramite` VALUES (1,'Recibido','La solicitud fue registrada y aún no se ha asignado'),(2,'En proceso','La solicitud está siendo atendida por un responsable'),(3,'Finalizado','La solicitud fue atendida y cerrada'),(4,'Rechazado','La solicitud no procede o fue rechazada');
/*!40000 ALTER TABLE `estados_tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_tramite`
--

DROP TABLE IF EXISTS `historial_tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_tramite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tramite_id` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `estado_anterior` int DEFAULT NULL,
  `estado_nuevo` int NOT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_historial_tramite` (`tramite_id`),
  KEY `fk_historial_usuario` (`usuario_id`),
  KEY `fk_historial_estado_anterior` (`estado_anterior`),
  KEY `fk_historial_estado_nuevo` (`estado_nuevo`),
  CONSTRAINT `fk_historial_estado_anterior` FOREIGN KEY (`estado_anterior`) REFERENCES `estados_tramite` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_estado_nuevo` FOREIGN KEY (`estado_nuevo`) REFERENCES `estados_tramite` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_tramite` FOREIGN KEY (`tramite_id`) REFERENCES `tramites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_tramite`
--

LOCK TABLES `historial_tramite` WRITE;
/*!40000 ALTER TABLE `historial_tramite` DISABLE KEYS */;
INSERT INTO `historial_tramite` VALUES (1,1,NULL,NULL,1,'Solicitud registrada por el ciudadano desde el sitio público.','2026-09-18 10:05:03'),(2,2,NULL,NULL,1,'Solicitud registrada por el ciudadano desde el sitio público.','2026-09-18 15:13:41'),(3,1,1,1,2,NULL,'2026-09-18 15:15:07'),(4,3,NULL,NULL,1,'Solicitud registrada por el ciudadano desde el sitio público.','2026-09-18 20:38:39'),(5,4,NULL,NULL,1,'Solicitud registrada por el ciudadano desde el sitio público.','2026-09-23 09:31:45');
/*!40000 ALTER TABLE `historial_tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_publica`
--

DROP TABLE IF EXISTS `informacion_publica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_publica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('borrador','publicado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'borrador',
  `usuario_id` int NOT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_infopublica_usuario` (`usuario_id`),
  CONSTRAINT `fk_infopublica_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_publica`
--

LOCK TABLES `informacion_publica` WRITE;
/*!40000 ALTER TABLE `informacion_publica` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_publica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `id` int NOT NULL DEFAULT '1',
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horario` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_institucion_single_row` CHECK ((`id` = 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,'Municipalidad de San Pablo Jocopilas','Suchitepéquez','San Pablo Jocopilas',NULL,'+502 7792-6303','municipalidadsanpablojocopilas@gmail.com','Lunes a viernes, 8:00 a 16:00 horas',NULL,'2026-09-18 09:58:52');
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes_contacto`
--

DROP TABLE IF EXISTS `mensajes_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes_contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asunto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('nuevo','atendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nuevo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_mensajes_estado` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes_contacto`
--

LOCK TABLES `mensajes_contacto` WRITE;
/*!40000 ALTER TABLE `mensajes_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `rol_id` int NOT NULL,
  `permiso_id` int NOT NULL,
  PRIMARY KEY (`rol_id`,`permiso_id`),
  KEY `fk_rolpermiso_permiso` (`permiso_id`),
  CONSTRAINT `fk_rolpermiso_permiso` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rolpermiso_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Acceso completo a todos los módulos del sistema'),(2,'Operativo','Gestión de trámites, documentos e información pública');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_tramite`
--

DROP TABLE IF EXISTS `tipos_tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_tramite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_tramite`
--

LOCK TABLES `tipos_tramite` WRITE;
/*!40000 ALTER TABLE `tipos_tramite` DISABLE KEYS */;
INSERT INTO `tipos_tramite` VALUES (1,'Información pública','Solicitud de actas, presupuesto, reglamentos y más','activo'),(2,'IUSI','Consulta, pago y solvencia de inmuebles','activo'),(3,'Constancias','Residencia, ingresos, cargas familiares y otras','activo'),(4,'Inscripción de inmuebles','Registro de un inmueble ante la municipalidad','activo'),(5,'Pagos municipales','Tasas, arbitrios y contribuciones','activo');
/*!40000 ALTER TABLE `tipos_tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramites`
--

DROP TABLE IF EXISTS `tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_id` int NOT NULL,
  `usuario_creador_id` int DEFAULT NULL,
  `solicitante_nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante_dpi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante_correo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante_telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsable_id` int DEFAULT NULL,
  `estado_id` int NOT NULL,
  `fecha_recepcion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_tramites_tipo` (`tipo_id`),
  KEY `fk_tramites_creador` (`usuario_creador_id`),
  KEY `idx_tramites_estado` (`estado_id`),
  KEY `idx_tramites_responsable` (`responsable_id`),
  KEY `idx_tramites_fecha` (`fecha_recepcion`),
  CONSTRAINT `fk_tramites_creador` FOREIGN KEY (`usuario_creador_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_tramites_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados_tramite` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_tramites_responsable` FOREIGN KEY (`responsable_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tramites_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_tramite` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramites`
--

LOCK TABLES `tramites` WRITE;
/*!40000 ALTER TABLE `tramites` DISABLE KEYS */;
INSERT INTO `tramites` VALUES (1,'TRM-2026-000001',1,NULL,'Fritz Ian Valentino Urizar Rodas','3224729111001','Urizarian@gmail.com','40756312',1,2,'2026-09-18 10:05:03','2026-09-18 15:15:08','Necesito ver las actas municipales'),(2,'TRM-2026-000002',3,NULL,'Ian','3224729111001','Urizarian@gmail.cpm','40756312',NULL,1,'2026-09-18 15:13:40','2026-09-18 15:13:40','prueba 1'),(3,'TRM-2026-000003',5,NULL,'Fritz Ian','3224729111001','ejemplo@gmail.com','00000000',NULL,1,'2026-09-18 20:38:39','2026-09-18 20:38:39','Información sobre el pago de agua'),(4,'TRM-2026-000004',1,NULL,'Ian','1000000000000','Urizarian@gmail.com','40756312',NULL,1,'2026-09-23 09:31:45','2026-09-23 09:31:45','info');
/*!40000 ALTER TABLE `tramites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` int NOT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `intentos_fallidos` int NOT NULL DEFAULT '0',
  `bloqueado_hasta` datetime DEFAULT NULL,
  `creado_por` int DEFAULT NULL,
  `actualizado_por` int DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `fk_usuarios_rol` (`rol_id`),
  KEY `fk_usuarios_creador` (`creado_por`),
  KEY `fk_usuarios_actualizador` (`actualizado_por`),
  CONSTRAINT `fk_usuarios_actualizador` FOREIGN KEY (`actualizado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuarios_creador` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador General','admin','$2a$10$uqdGmqrUepywSHHKGKxKEe4BVwhJFtHfGea2b9dIkhTgT4kvRsem2',1,'activo',0,NULL,NULL,NULL,'2026-09-18 09:58:53','2026-09-23 09:32:30'),(2,'Ian Urizar','Ian','$2a$10$QoZc7aMHesyafOXRTL1XBOlfH9D.oVL.Td8me7Gjt8wa9zM.N.zlK',1,'activo',0,NULL,1,NULL,'2026-09-28 19:04:19','2026-09-28 19:04:19'),(3,'Ianpruebas','Ianpruebas','$2a$10$.BszFiQm1f8dNo3D7uJA3.Pb2Ig8bEn9uVYmm7sUFtf8OZJskkNk.',2,'activo',0,NULL,1,NULL,'2026-09-28 19:04:45','2026-09-28 19:04:45');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 14:49:30
