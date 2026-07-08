-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantdb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `ContractID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `StartDate` date NOT NULL,
  PRIMARY KEY (`ContractID`),
  KEY `fk_contract_supplier` (`SupplierID`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`),
  CONSTRAINT `fk_contract_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1,5000.00,'2026-01-01'),(2,2,7000.00,'2026-01-05'),(3,3,6500.00,'2026-01-10'),(4,4,8000.00,'2026-01-15'),(5,5,5500.00,'2026-01-20'),(6,6,7200.00,'2026-01-25'),(7,7,9000.00,'2026-02-01'),(8,8,4800.00,'2026-02-05'),(9,9,6100.00,'2026-02-10'),(10,10,7500.00,'2026-02-15');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ahmed Ali','ahmed@gmail.com'),(2,'Sara Khalid','sara@gmail.com'),(3,'Faisal Noor','faisal@gmail.com'),(4,'Lama Adel','lama@gmail.com'),(5,'Noura Salem','noura@gmail.com'),(6,'Omar Hassan','omar@gmail.com'),(7,'Reem Tariq','reem@gmail.com'),(8,'Yousef Sami','yousef@gmail.com'),(9,'Dana Majed','dana@gmail.com'),(10,'Khalid Fahad','khalid@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phone`
--

DROP TABLE IF EXISTS `customer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phone` (
  `PhoneNumber` varchar(15) NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`CustomerID`),
  KEY `fk_customerphone_customer` (`CustomerID`),
  CONSTRAINT `fk_customerphone_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone`
--

LOCK TABLES `customer_phone` WRITE;
/*!40000 ALTER TABLE `customer_phone` DISABLE KEYS */;
INSERT INTO `customer_phone` VALUES ('0551111111',1),('0552222222',2),('0553333333',3),('0554444444',4),('0555555555',5),('0556666666',6),('0557777777',7),('0558888888',8),('0559999999',9),('0551234567',10);
/*!40000 ALTER TABLE `customer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ali Hassan','0501111111','Manager',12000.00),(2,'Sara Ahmed','0502222222','Cashier',5000.00),(3,'Omar Khalid','0503333333','Chef',9000.00),(4,'Lama Adel','0504444444','Waiter',4500.00),(5,'Noura Salem','0505555555','Supervisor',10000.00),(6,'Faisal Noor','0506666666','Cashier',5200.00),(7,'Reem Tariq','0507777777','Chef',8500.00),(8,'Dana Majed','0508888888','Waiter',4300.00),(9,'Yousef Sami','0509999999','Cleaner',3500.00),(10,'Khalid Fahad','0501234567','Supervisor',9800.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `QuantityInStock` int NOT NULL,
  `RecorderLevel` int NOT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `fk_inventory_supplier` (`SupplierID`),
  CONSTRAINT `fk_inventory_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,'Bread',100,20),(2,2,'Cheese',50,10),(3,3,'Chicken',80,15),(4,4,'Tomato',120,25),(5,5,'Lettuce',60,12),(6,6,'Beef',40,8),(7,7,'Milk',90,18),(8,8,'Coffee Beans',70,14),(9,9,'Ice Cream Mix',30,5),(10,10,'Juice Concentrate',55,10);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `AvailabilityStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` VALUES (1,'Burger',25.00,'Available'),(2,'Pizza',40.00,'Available'),(3,'Pasta',35.00,'Unavailable'),(4,'Fries',15.00,'Available'),(5,'Salad',20.00,'Available'),(6,'Chicken Wrap',30.00,'Available'),(7,'Steak',80.00,'Unavailable'),(8,'Ice Cream',18.00,'Available'),(9,'Coffee',12.00,'Available'),(10,'Juice',10.00,'Available');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `OrderID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  `SubTotal` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`,`MenuItemID`),
  KEY `fk_orderdetails_menuitem` (`MenuItemID`),
  CONSTRAINT `fk_orderdetails_menuitem` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitem` (`MenuItemID`),
  CONSTRAINT `fk_orderdetails_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,50.00,2),(2,2,40.00,1),(3,3,70.00,2),(4,4,30.00,2),(5,5,20.00,1),(6,6,60.00,2),(7,7,80.00,1),(8,8,36.00,2),(9,9,24.00,2),(10,10,20.00,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `OrderID` int NOT NULL,
  `MethodCode` varchar(20) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_payment_order` (`OrderID`),
  KEY `fk_payment_methodcode` (`MethodCode`),
  CONSTRAINT `fk_payment_methodcode` FOREIGN KEY (`MethodCode`) REFERENCES `payment_method_type` (`MethodCode`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,50.00,'2026-05-01',1,'CASH'),(2,75.00,'2026-05-02',2,'CARD'),(3,120.00,'2026-05-03',3,'APPLEPAY'),(4,30.00,'2026-05-04',4,'STCPAY'),(5,90.00,'2026-05-05',5,'MADA'),(6,60.00,'2026-05-06',6,'VISA'),(7,150.00,'2026-05-07',7,'MASTERCARD'),(8,45.00,'2026-05-08',8,'PAYPAL'),(9,110.00,'2026-05-09',9,'BANK'),(10,70.00,'2026-05-10',10,'ONLINE');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_type`
--

DROP TABLE IF EXISTS `payment_method_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method_type` (
  `MethodCode` varchar(20) NOT NULL,
  PRIMARY KEY (`MethodCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_type`
--

LOCK TABLES `payment_method_type` WRITE;
/*!40000 ALTER TABLE `payment_method_type` DISABLE KEYS */;
INSERT INTO `payment_method_type` VALUES ('APPLEPAY'),('BANK'),('CARD'),('CASH'),('MADA'),('MASTERCARD'),('ONLINE'),('PAYPAL'),('STCPAY'),('VISA');
/*!40000 ALTER TABLE `payment_method_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(150) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Dammam','supplier1@gmail.com'),(2,'Riyadh','supplier2@gmail.com'),(3,'Jeddah','supplier3@gmail.com'),(4,'Khobar','supplier4@gmail.com'),(5,'Madinah','supplier5@gmail.com'),(6,'Jubail','supplier6@gmail.com'),(7,'Tabuk','supplier7@gmail.com'),(8,'Abha','supplier8@gmail.com'),(9,'Taif','supplier9@gmail.com'),(10,'Hail','supplier10@gmail.com');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_phone`
--

DROP TABLE IF EXISTS `supplier_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_phone` (
  `PhoneNumber` varchar(15) NOT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`SupplierID`),
  KEY `fk_supplierphone_supplier` (`SupplierID`),
  CONSTRAINT `fk_supplierphone_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_phone`
--

LOCK TABLES `supplier_phone` WRITE;
/*!40000 ALTER TABLE `supplier_phone` DISABLE KEYS */;
INSERT INTO `supplier_phone` VALUES ('0561111111',1),('0562222222',2),('0563333333',3),('0564444444',4),('0565555555',5),('0566666666',6),('0567777777',7),('0568888888',8),('0569999999',9),('0561234567',10);
/*!40000 ALTER TABLE `supplier_phone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-08 16:50:48
