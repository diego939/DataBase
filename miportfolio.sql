CREATE DATABASE  IF NOT EXISTS `miportfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `miportfolio`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: miportfolio
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `certificado`
--

DROP TABLE IF EXISTS `certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificado` (
  `id_certificado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id_certificado`),
  KEY `fk_certificado_persona1` (`persona_id`),
  CONSTRAINT `fk_certificado_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificado`
--

LOCK TABLES `certificado` WRITE;
/*!40000 ALTER TABLE `certificado` DISABLE KEYS */;
INSERT INTO `certificado` VALUES (15,'#SeProgramar','argentina_programa_octubre_diciembre_2021-1.png',1),(16,'Bases De Datos SQL','CertificacionBaseDeDatos-1.png',1),(17,'Java Hibernate','certificado Java Hibernate-1.png',1),(18,'Desarrollo fullstack con Java','CertificadoDigitalers2021-1.png',1),(19,'Git','certificadoGit-1.png',1),(20,'Desarrollo Web','CertificadoUTN-1.png',1),(21,'Bases De Datos Oracle','Diego David Almirón-Oracle-1.png',1),(22,'Seguridad Informática','Diego-David Almirón-Seguridad Informática-1.png',1),(23,'Fundamentos Web Html','Fundamentos Web certificado-1.png',1),(24,'Java Para no Programadores','Java para no programadores certificado-1.png',1),(25,'Java Spring boot','Java Spring certificado-1.png',1),(26,'Java Standard Web Programming','Java Standard Web Programming, J2SE Certificado-1.png',1),(27,'Javascript desde cero','Javascript desde cero certificado-1.png',1),(28,'ReactJS','ReactJS Certificado-1.png',1);
/*!40000 ALTER TABLE `certificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilio` (
  `id_domicilio` int(11) NOT NULL AUTO_INCREMENT,
  `domicilio` varchar(500) NOT NULL DEFAULT 'Sin especificar',
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_domicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1,'Bº Dr. Momntaña. 387 viviendas, Manzana 56, casa 15','Corrientes','Corrientes','Argentina');
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educacion` (
  `id_educacion` int(11) NOT NULL AUTO_INCREMENT,
  `instituto` varchar(200) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id_educacion`),
  KEY `fk_educacion_persona1` (`persona_id`),
  CONSTRAINT `fk_educacion_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educacion`
--

LOCK TABLES `educacion` WRITE;
/*!40000 ALTER TABLE `educacion` DISABLE KEYS */;
INSERT INTO `educacion` VALUES (3,'UTN-FBRA cursos a distancia','Desarrollo Web frond end',1),(4,'Educacion IT','Desarrollo fullstack con java',1),(5,'UNNE - Facultad de Ciencias Exactas','Licenciado en Sistemas de información',1);
/*!40000 ALTER TABLE `educacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia`
--

DROP TABLE IF EXISTS `experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia` (
  `id_experiencia` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(100) NOT NULL,
  `empresa` varchar(100) NOT NULL DEFAULT 'Sin Especificar',
  `descripcion_puesto` varchar(3000) NOT NULL,
  `anio_ingreso` date NOT NULL,
  `anio_egreso` date DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo_experiencia_id` int(11) NOT NULL,
  PRIMARY KEY (`id_experiencia`),
  KEY `fk_experiencia_persona1` (`persona_id`),
  KEY `fk_experiencia_tipo_experiencia1` (`tipo_experiencia_id`),
  CONSTRAINT `fk_experiencia_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_tipo_experiencia1` FOREIGN KEY (`tipo_experiencia_id`) REFERENCES `tipo_experiencia` (`id_tipo_experiencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia`
--

LOCK TABLES `experiencia` WRITE;
/*!40000 ALTER TABLE `experiencia` DISABLE KEYS */;
INSERT INTO `experiencia` VALUES (1,'Freelance full stack developer','Bruno Gas','Se desarrolló una aplicación web que administre las ventas de una tienda de artículos de gas. controlando el stock y realice pedidos de productos a través de la web. El proyecto fue realizado en el framework Codeigniter, con lenguajes JavaScript y PHP para el bak end','2020-01-12','2020-04-27',1,1),(2,'Operador Informático','Soluciones PC','Instalación de sistemas operativos, backup y mantenimiento de PC.','2018-12-27','2019-07-12',1,1);
/*!40000 ALTER TABLE `experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidad` (
  `id_habilidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_habilidad` varchar(200) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  PRIMARY KEY (`id_habilidad`),
  KEY `fk_habilidad_persona1` (`persona_id`),
  KEY `fk_habilidad_nivel1` (`nivel_id`),
  CONSTRAINT `fk_habilidad_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidad_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidad`
--

LOCK TABLES `habilidad` WRITE;
/*!40000 ALTER TABLE `habilidad` DISABLE KEYS */;
INSERT INTO `habilidad` VALUES (1,'Trabajo en equipo',1,3),(2,'Liderazgo',1,4),(3,'Gestión del tiempo',1,3),(4,'Resolución de Problemas',1,4),(5,'Diseño de sistemas',1,4);
/*!40000 ALTER TABLE `habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` int(11) NOT NULL DEFAULT 20,
  `descripcion_nivel` varchar(45) NOT NULL DEFAULT 'Regular',
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,20,'Regular'),(2,40,'Básico'),(3,60,'Bueno'),(4,80,'Muy Bueno'),(5,100,'Excelente');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL DEFAULT 'Names',
  `apellido` varchar(45) NOT NULL DEFAULT 'User',
  `telefono` bigint(12) NOT NULL DEFAULT 0,
  `correo` varchar(45) NOT NULL,
  `fechanac` date DEFAULT NULL,
  `sobre_mi` varchar(3000) NOT NULL DEFAULT 'Mi descripcion',
  `ocupacion` varchar(200) NOT NULL DEFAULT 'Sin especificar',
  `image_perfil` varchar(200) NOT NULL DEFAULT 'avatar.jpg',
  `image_portada` varchar(200) NOT NULL DEFAULT 'portada.jpg',
  `domicilio_id` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_persona_domicilio` (`domicilio_id`),
  CONSTRAINT `fk_persona_domicilio` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Diego','Almirón',3795315483,'diegodavidalmiron17@gmail.com',NULL,'Hola, mi nombre es Diego David Almirón, soy argentino, vivo en la ciudad de Corrientes. Estoy capacitandome en el mundo IT que es lo que más me gusta, la programación es algo que me llamó mucho la atención en cómo podemos resolver problemas y diseñar sistemas de una amplia variedad de maneras y por eso estoy acá buscando seguir teniendo conocimientos a cerca de este mundo tecnológico que es muy cambiante y a la vez hermoso. En este perfil describiré mis habilidades que adquirí a lo largo de los años, mis estudios realizados, también las tecnologías y los lenguajes tanto de back end cómo frond end y mis niveles de manejo en ellos, cómo así también habilidades blandas que son muy importantes para el trabajo en equipo e fundamentales para los entornos de desarrollo de las empresas, también detallaré los diferentes proyectos que desarrollé en la programación. Este apartado fue creado con el fin de obtener una certificación de desarrollador fullstack junior de la segunda etapa del plan Argentina programa (Yo Programo) que consiste en desarrollar un Portafolio web para que tengamos una carta de presentción que nos ayudará a actualizar nuestro perfil profesional. Desde ya muchas gracias por haber entrado a ver mi humilde perfil, saludos cordiales...','Desarrollador full stack java','avatar.jpg','portada.jpg',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(100) NOT NULL,
  `descripcion_proyecto` varchar(3000) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `fk_proyecto_persona1` (`persona_id`),
  CONSTRAINT `fk_proyecto_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (3,'Tienda en linea','Desarrollamos un proyecto web con dinamismo de control de stock de productos y sistema de ventas de productos con facturaciones.',1),(4,'Calculadora Básica','Se desarrolló un pequeño proyecto de una calculadora básica en javascript, con las funcionalidades básicas para realizar operaciones simples.',1);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnologia`
--

DROP TABLE IF EXISTS `tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnologia` (
  `id_tecnologia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tecnologia` varchar(200) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  PRIMARY KEY (`id_tecnologia`),
  KEY `fk_tecnologia_persona1` (`persona_id`),
  KEY `fk_tecnologia_nivel1` (`nivel_id`),
  CONSTRAINT `fk_tecnologia_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tecnologia_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnologia`
--

LOCK TABLES `tecnologia` WRITE;
/*!40000 ALTER TABLE `tecnologia` DISABLE KEYS */;
INSERT INTO `tecnologia` VALUES (1,'HTML',1,4),(2,'CSS',1,4),(3,'JavaScript',1,4),(4,'PHP',1,3),(5,'MySQL',1,5),(6,'Bootstrasp',1,3),(7,'Java',1,4);
/*!40000 ALTER TABLE `tecnologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_experiencia`
--

DROP TABLE IF EXISTS `tipo_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_experiencia` (
  `id_tipo_experiencia` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_experiencia_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_experiencia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_experiencia`
--

LOCK TABLES `tipo_experiencia` WRITE;
/*!40000 ALTER TABLE `tipo_experiencia` DISABLE KEYS */;
INSERT INTO `tipo_experiencia` VALUES (1,'Freelance'),(2,'Empresa');
/*!40000 ALTER TABLE `tipo_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_persona1` (`persona_id`),
  CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'diego@gmail.com','RGllZ28xMjM0',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 20:31:25
