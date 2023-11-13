CREATE DATABASE  IF NOT EXISTS `artesanias` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `artesanias`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: artesanias
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `_accesorioartesanaltoinventario`
--

DROP TABLE IF EXISTS `_accesorioartesanaltoinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_accesorioartesanaltoinventario` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_AccesorioArtesanalToInventario_AB_unique` (`A`,`B`),
  KEY `_AccesorioArtesanalToInventario_B_index` (`B`),
  CONSTRAINT `_AccesorioArtesanalToInventario_A_fkey` FOREIGN KEY (`A`) REFERENCES `accesorioartesanal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AccesorioArtesanalToInventario_B_fkey` FOREIGN KEY (`B`) REFERENCES `inventario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_accesorioartesanaltoinventario`
--

LOCK TABLES `_accesorioartesanaltoinventario` WRITE;
/*!40000 ALTER TABLE `_accesorioartesanaltoinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `_accesorioartesanaltoinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_inventariotojoyeriaartesanal`
--

DROP TABLE IF EXISTS `_inventariotojoyeriaartesanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_inventariotojoyeriaartesanal` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_InventarioToJoyeriaArtesanal_AB_unique` (`A`,`B`),
  KEY `_InventarioToJoyeriaArtesanal_B_index` (`B`),
  CONSTRAINT `_InventarioToJoyeriaArtesanal_A_fkey` FOREIGN KEY (`A`) REFERENCES `inventario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_InventarioToJoyeriaArtesanal_B_fkey` FOREIGN KEY (`B`) REFERENCES `joyeriaartesanal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_inventariotojoyeriaartesanal`
--

LOCK TABLES `_inventariotojoyeriaartesanal` WRITE;
/*!40000 ALTER TABLE `_inventariotojoyeriaartesanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `_inventariotojoyeriaartesanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_inventariotoropaartesanal`
--

DROP TABLE IF EXISTS `_inventariotoropaartesanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_inventariotoropaartesanal` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_InventarioToRopaArtesanal_AB_unique` (`A`,`B`),
  KEY `_InventarioToRopaArtesanal_B_index` (`B`),
  CONSTRAINT `_InventarioToRopaArtesanal_A_fkey` FOREIGN KEY (`A`) REFERENCES `inventario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_InventarioToRopaArtesanal_B_fkey` FOREIGN KEY (`B`) REFERENCES `ropaartesanal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_inventariotoropaartesanal`
--

LOCK TABLES `_inventariotoropaartesanal` WRITE;
/*!40000 ALTER TABLE `_inventariotoropaartesanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `_inventariotoropaartesanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesorioartesanal`
--

DROP TABLE IF EXISTS `accesorioartesanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesorioartesanal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorioartesanal`
--

LOCK TABLES `accesorioartesanal` WRITE;
/*!40000 ALTER TABLE `accesorioartesanal` DISABLE KEYS */;
INSERT INTO `accesorioartesanal` VALUES (1,'Bolso de Cuero','Bolso de cuero genuino con diseño elegante',89.99,'https://madeheart.com/media/productphoto/46/34527166/1_06_DSC_5273.jpg'),(2,'Gafas de Sol','Gafas de sol de diseño artesanal',39.99,'https://th.bing.com/th/id/R.7793d7e2ce3a45033f6fe7c67ca0af72?rik=CP15gvyUP0%2fqzQ&pid=ImgRaw&r=0'),(3,'Bufanda Tejida','Bufanda tejida a mano con lana de alta calidad',19.99,'https://th.bing.com/th/id/OIP.VxtloK6t-yx3IinjSJiMpAHaE8?pid=ImgDet&rs=1'),(4,'Cinturón de Cuero','Cinturón de cuero auténtico con hebilla personalizada',29.99,'https://i.pinimg.com/736x/00/60/81/00608146cd6312d8b43a9b5cbb11de5d--colombia.jpg'),(5,'Sombrero de Paja','Sombrero de paja tejido a mano con banda de cuero',24.99,'https://i.pinimg.com/736x/00/60/81/00608146cd6312d8b43a9b5cbb11de5d--colombia.jpg');
/*!40000 ALTER TABLE `accesorioartesanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Compra_id_usuario_fkey` (`id_usuario`),
  CONSTRAINT `Compra_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementocarrito`
--

DROP TABLE IF EXISTS `elementocarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementocarrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ElementoCarrito_id_carrito_fkey` (`id_carrito`),
  KEY `ElementoCarrito_id_producto_fkey` (`id_producto`),
  CONSTRAINT `ElementoCarrito_id_carrito_fkey` FOREIGN KEY (`id_carrito`) REFERENCES `compra` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ElementoCarrito_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementocarrito`
--

LOCK TABLES `elementocarrito` WRITE;
/*!40000 ALTER TABLE `elementocarrito` DISABLE KEYS */;
INSERT INTO `elementocarrito` VALUES (11,1,1,3),(12,2,2,2),(13,3,3,1),(14,4,4,4),(15,5,5,2);
/*!40000 ALTER TABLE `elementocarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `fecha` datetime(3) NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Inventario_id_producto_fkey` (`id_producto`),
  CONSTRAINT `Inventario_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joyeriaartesanal`
--

DROP TABLE IF EXISTS `joyeriaartesanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joyeriaartesanal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joyeriaartesanal`
--

LOCK TABLES `joyeriaartesanal` WRITE;
/*!40000 ALTER TABLE `joyeriaartesanal` DISABLE KEYS */;
INSERT INTO `joyeriaartesanal` VALUES (1,'Collar de Plata','Collar de plata esterlina con piedra preciosa',79.99,'https://th.bing.com/th/id/R.02159609110e89044b00076e158f11ee?rik=Ty5pBKXAV8E5AA&pid=ImgRaw&r=0'),(2,'Pendientes de Oro','Pendientes de oro con incrustaciones de diamantes',129.99,'https://th.bing.com/th/id/R.c0ed7415b700f674a89703ce9940c66c?rik=6DyOgJ61PL1vaw&pid=ImgRaw&r=0'),(3,'Pulsera de Cuarzo','Pulsera de cuarzo rosa con cuentas de madera',49.99,'https://th.bing.com/th/id/OIP.IdZDiIi8ZVDiwRNH7jDrvgHaJ4?pid=ImgDet&rs=1'),(4,'Anillo de Plata','Anillo de plata con diseño único',59.99,'https://th.bing.com/th/id/R.1c2f3a92aeb5707a931088d2f27a083c?rik=o9CwgJG7UR6cig&pid=ImgRaw&r=0'),(5,'Collar de Perlas','Collar de perlas cultivadas con cierre de oro',69.99,'https://th.bing.com/th/id/R.c0ed7415b700f674a89703ce9940c66c?rik=6DyOgJ61PL1vaw&pid=ImgRaw&r=0');
/*!40000 ALTER TABLE `joyeriaartesanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Vestido Azul','Vestido de estilo artesanal en color azul',49.99,'imagen_vestido_azul.jpg'),(2,'Collar de Plata','Collar de plata esterlina con piedra preciosa',79.99,'imagen_collar_plata.jpg'),(3,'Bolso de Cuero','Bolso de cuero genuino con diseño elegante',89.99,'imagen_bolso_cuero.jpg'),(4,'Blusa Floral','Blusa con diseño floral, tejida a mano',29.99,'imagen_blusa_floral.jpg'),(5,'Pendientes de Oro','Pendientes de oro con incrustaciones de diamantes',129.99,'imagen_pendientes_oro.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropaartesanal`
--

DROP TABLE IF EXISTS `ropaartesanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropaartesanal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropaartesanal`
--

LOCK TABLES `ropaartesanal` WRITE;
/*!40000 ALTER TABLE `ropaartesanal` DISABLE KEYS */;
INSERT INTO `ropaartesanal` VALUES (1,'Vestido Azul verde','Vestido de estilo artesanal en color azul',49.99,'https://th.bing.com/th/id/R.7a3333c32ff075af90f8298e985c0f89?rik=j48AABFc48L4dA&pid=ImgRaw&r=0'),(2,'Blusa Floral','Blusa con diseño floral, tejida a mano',29.99,'https://th.bing.com/th/id/R.17551876f972cc57ceeb34fdd6883c4b?rik=%2bZ9RdNgx96yGjA&pid=ImgRaw&r=0'),(3,'Pantalones Vaqueros','Pantalones vaqueros de alta calidad',59.99,'https://th.bing.com/th/id/R.c9704b6780902e9ccca499828eee51a6?rik=aLmNR5%2bklgPO4g&pid=ImgRaw&r=0'),(4,'Sudadera de Lana','Sudadera cálida de lana con patrón único',39.99,'https://th.bing.com/th/id/R.6e1bdce9dc516369662382e09512850c?rik=Ry4ltu98j45qyQ&pid=ImgRaw&r=0'),(5,'Chaqueta de Cuero','Chaqueta de cuero genuino, estilo vintage',79.99,'https://th.bing.com/th/id/R.17551876f972cc57ceeb34fdd6883c4b?rik=%2bZ9RdNgx96yGjA&pid=ImgRaw&r=0'),(16,'Pantalones Vaqueros','Sudadera cálida de lana con patrón único',39.99,'https://th.bing.com/th/id/R.c9704b6780902e9ccca499828eee51a6?rik=aLmNR5%2bklgPO4g&pid=ImgRaw&r=0'),(17,'Sudadera de Lana','Blusa con diseño floral, tejida a mano',39.99,'https://th.bing.com/th/id/R.6e1bdce9dc516369662382e09512850c?rik=Ry4ltu98j45qyQ&pid=ImgRaw&r=0'),(18,'Chaqueta de Cuero','Chaqueta de cuero genuino, estilo vintage',39.99,'https://th.bing.com/th/id/R.17551876f972cc57ceeb34fdd6883c4b?rik=%2bZ9RdNgx96yGjA&pid=ImgRaw&r=0');
/*!40000 ALTER TABLE `ropaartesanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_electronico` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario_correo_electronico_key` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Usuario1','usuario1@email.com','contrasena1'),(2,'Usuario2','usuario2@email.com','contrasena2'),(3,'Usuario3','usuario3@email.com','contrasena3'),(4,'Usuario4','usuario4@email.com','contrasena4'),(5,'Usuario5','usuario5@email.com','contrasena5');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'artesanias'
--

--
-- Dumping routines for database 'artesanias'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-12 22:31:29
