CREATE DATABASE  IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users1_idx` (`user_id`),
  KEY `fk_comments_recipes1_idx` (`recipe_id`),
  CONSTRAINT `fk_comments_recipes1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `allgrain` text,
  `maltgrain` text,
  `privacy` tinyint NOT NULL,
  `hopsched` text,
  `yeast` text,
  `instructions` text,
  `notes` text,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_recipes_users1_idx` (`user_id`),
  CONSTRAINT `fk_recipes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (2,'testing testing 123','evyebvyebvosebvyebraovidursavnseuopvnbuewipvbnvnweuyn','sedfnvpsednuyvespbvner8pvbneiusvbfsnvuisdfbnpsdfubiudfnuibn','ubhuisdbfvnpioueadbvuisdfnvusdfnbsedfiufvbnsadvudsabuib',1,'puhuhevusdhvuhesdpuvhdsbvhuiesrvhpesrvhv7ehu7phhu','uphusehdvpusdhvushdvuersvhusdrhvusdfivhpisudhvbpusdhuhu','h8puhupsdhfvuhdsupfpvhsdfhp7hsd7vhuhuhh','8yhy8g7gyygg76tghyyg7tff656go8yghuyog776g7tg',3,'2021-10-10 14:29:20','2021-10-10 14:29:20'),(3,'Doctor\'s go-go juice','gvuiouywbuysabvyusabovaedsrybvasdfuyvbavybealsvbuybyub','ouygbuyobybuyvotuvbuyovirycurtctkyu','vtfvrytcytukbguygvi7tfivtyubuybyouioitugvuyg',0,'uytguytguyfitfftyugyugiuyg76f6rfituygugoyfg','7ygf7tifutygiytdfr6dfi67gi7tfr6dfi76g7tf75tif','i7tf7itf65figtfyrdredtygk6gftyfytfyt','iytfyitfytvurdr6dfitgityuvfryt6d56ftftftyfr6u65ftfy',4,'2021-10-10 14:31:03','2021-10-10 14:31:03'),(4,'Glitter Bomb Party Beer','ihohbyvuysbfdviouysfbvodsiauvdfiuvfbdsfiuvbasibib','i8ygiuybiybvuyoh;unbuoytgli','iyubibiuhuyoguohuibuyotvuyb',0,'piuyghpiuyhbiuhbuygpuhiygh','pi8uyghygiubuytfgo7ghiuyg','uygihguoygo7tfgiuylhiluyguyglih','ygyuoigouyto87hiouygbutfoylghgyuguyoggy',5,'2021-10-10 14:32:02','2021-10-10 14:32:02'),(5,'Public','oiunsdvsdriubvsndfiovubiyuobyubb','exexeyecexeyxercxyrtexctrhct','xexertxcexrtectjcytvkukygyugyfuytf',0,'ygyfgtiyfytglgyugtif5f6gguykfytfdtg','iuyguyfgi7t6gf7uygiuygfiytfklihyuogofotuifytifvytgfuytg','iuytftyfuytfytfguygukytftyfgiguyg','uyguyguygfytfitfyugiyftftyifygftyfytf',5,'2021-10-10 14:40:50','2021-10-10 14:40:50'),(7,'EXTRA EXTRA DELETE ME!','uhdsvbdsriuvbnedariuvnaberiuvbearvapiby','buoyvuytvuyovtvyuvuytiv','uyvbyuougyuuyovyuibilbiubvtv',0,'uylbyuvouyglihol7ghooyugyug76gyuu','yguyoguyg6ooguiohuyogi7tf76ouhguoygouytf7igfyg','yogyuguyfi756gogtyfi76fg7hhiyugoug','o8goyguytf7ighlygt7gi7ggyukguygb',3,'2021-10-10 18:26:55','2021-10-10 18:26:55'),(8,'This one is private','yereybveryvb9dvbeyviwbterbtbtyb','tvitbvytvtr8if6ybvtyvutrcrvityvtyvtyvtgy','vtyvtyvtkyvctfvyvkktyvtftvbyub nuihgytvg jhbyu',1,'uybyttgiybvtybbyufrctybbyugtyu','iytvytgvkuybvtyifvtyvu6rfvtybuybyuv6ctyvyub','iytvyutvtfgyvut6rucurvtbnuih 76gt6vybygtgv','uyubuiybyuvytyubyuih7ggyun',3,'2021-10-10 18:30:31','2021-10-10 18:30:31'),(9,'Austin Beer Garden Simple Pil','Here is a simple and simply delicious recipe scaled to homebrew volume from The Austin Beer Garden Brewing Co.’s Brewer Brian Peters.','Batch size: 5 gallons (19 liters)\r\nOG:  1.046\r\nFG: 1.008\r\nIBUs: 35\r\nABV: 4.9','8 lb (3.6 kg) Weyermann Pilsner Malt\r\n1.6 oz (45 g) Weyermann Acidulated Malt',0,'1 oz (28 g) Hallertau Mittelfruh at 60 minutes  1 oz (28 g) Hallertau Mittelfruh at 45 minutes  1 oz (28 g) Hallertau Mittelfruh at 15 minutes  1 oz (28 g) German Saphir at 0 minutes ','Wyeast 2352-PC Munich Lager II yeast (2 qt/1.9 l) starter). Because it’s a “Private Collection” yeast, this one may not always be available. Substitute Wyeast 2042 Danish Lager if needed.','Mash for 30 minutes at 145°F (63°C). Raise the mash temperature to 160°F (71°C) over 15–20 minutes, then rest for 15 minutes. Recirculate until the wort is clear (15–20 minutes).\r\n\r\nBoil for 60 minutes following the hop additions schedule. Whirlpool and cool the wort to 52°F (11°C). (That’s a bit of challenge.) Aerate the wort and pitch the yeast.\r\n\r\nFerment at 52°F (11°C) until specific gravity hits 4° Plato (about 10 days), then raise the temperature to 58°F (14°C) and hold for 4 days. Rack the beer into a CO2-purged soda keg and cool 3°F (2°C) a day until the beer reaches 32°F (0°C) (about 5 days). Hold at 32°F (0°C) for four weeks. Force carbonate and enjoy.','Any German Pilsner malt is fine. We’ve used Bestmalz, Durst-Malz, and Schill Malz in the past.',3,'2021-10-10 19:45:09','2021-10-10 19:45:09'),(10,'Less Thinking IPA Recipe','This recipe from Matt Gallagher, brewmaster at Half Acre Beer Co., is great for highlighting two different hops, but it could easily be used to evaluate a single varietal as well.','Batch size: 5 gallons (19 liters)\r\nOG: 1.051\r\nFG: 1.007\r\nIBUs: 50\r\nABV: 6','8 lb (3.6 kg) 2-row malt\r\n1.5 lb (680 g) Vienna\r\n10 oz (283 g) flaked oats',0,'0.25 oz (7 g) Warrior at 60 minutes\r\n0.5 oz (14 g) Amarillo at 30 minutes\r\n0.75 oz (21 g) Amarillo at 15 minutes\r\n1.5 oz (43 g) Amarillo at whirlpool\r\n0.5 oz (14 g) Centennial at whirlpool\r\n3.5 oz (99 g) Amarillo at dry hop (day 6 of fermentation)\r\n1 oz (28 g) Centennial at dry hop (day 6 of fermentation)','White Labs WLP051 California Ale V','Mash at 145°F (63°C) for 60 minutes, then rest until conversion is complete. Boil for 90 minutes. Pitch the yeast and ferment at 65°F (18°C). Dry hop on day 6 of fermentation (when fermentation is slowing down), crash the beer on day 10 to 31°F (0°C). Wait a week or two before packaging.','It is best consumed during the summer months surrounded by nature.',3,'2021-10-10 19:48:45','2021-10-10 19:48:45'),(11,'White Dog IPA','El Segundo Brewing Company Founder and Brewmaster Rob Croxall shared this recipe for one of the first IPAs he brewed.','Batch size: 5 gallons (19 liters)\r\nOG: 1.061\r\nFG: 1.010\r\nIBU: 44\r\nABV: 6.7','7 lb (3.2 kg) 2-row base malt\r\n6 lb (2.7 kg) white wheat malt\r\n0.5 lb (227 g) rice hulls (if you’re concerned about a stuck mash)',0,'1 oz (28 g) Chinook [11.1 AA] at 60 minutes\r\n1 oz (28 g) Cascade at 5 minutes\r\n1 oz (28 g) Nelson Sauvin at 5 minutes\r\n0.5 oz (14 g) Chinook dry hop 7 days\r\n1 oz (28 g) Cascade dry hop 7 days\r\n2 oz (57 g) Nelson Sauvin dry hop 7 days','White Labs WLP0001 or Wyeast 1056','Mash the grains at 148°F (64°C) for 60 minutes. Sparge at 168°F (75°C), bring to a boil, and boil for 60 minutes, following the hops schedule. Whirlpool and cool to 68°F (20°C) rapidly. Maintain fermentation temperature at 68°F (20°C). Once primary fermentation and diacetyl rest are complete, drop the temperature to 60°F (15°C) and dry hop for 7 days. Don’t use a filter or finings; the beer should finish with a medium haze but shouldn’t be murky. Carbonate to 2.5 vols of CO2.','El Segundo Brewing Company (El Segundo, California) Founder and Brewmaster Rob Croxall shared this recipe for one of the first IPAs he brewed.',3,'2021-10-10 19:51:56','2021-10-10 19:51:56'),(12,'This is a private recipe','ughvbudsbvsdyfoubesarvyuasibverlyiebvisdbivsyubyblutcirftuyklibu','butvuylbyvityolbbuhvktyfkbyvtyctyvuyvytivkuy','bvuoyguyovguyvityfgyubyuvkuvbbgyugiuybliuyg',1,'iulygylbliuyg7ytiugybhkvtyfoyubyouytftugh;h;uih','uhuygiuygyiuhyguyguygiulgyguyogiu','gygyiuogiyulguyft7futyvirdrdrutfy','6rfr6dfuigg7igf765ftftyg',5,'2021-10-10 20:23:54','2021-10-10 20:23:54'),(14,'PRIVATE!!!','dfvuhdbsafviuyasfdbvliuadfsdfilafsbvbu','ybvuyvtiyfvuylbutoyfiytglybuyi','tvfkyubyuftkygulihuygfityufgykubvktyft',1,'yvtykfktfyukvtiyftyfkgybuyvtyftykvyukguky','fktyuguykfuygyitgkyufytifvuykgyit','glygitfygyuigfyulgitdftyukgugtif','kyufitfgyugiytftkuygo6iftygu',5,'2021-10-10 20:26:51','2021-10-10 20:26:51');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_pic` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Joe','Martin','$2b$12$JcZuC3ITtZri5QN9lSrCc.n/qaMNakwcBsEUy0G4tSyKyKZxP0dV.','JMart.DC@gmail.com','2021-10-10 00:31:22','2021-10-10 00:31:22',NULL),(4,'Doctor','Martin','$2b$12$AQpVzXap43z7cPsxTztvmONTGNPCBrD3VWdM11/X/2tHXmOmNLsTK','doc@gmail.com','2021-10-10 14:30:26','2021-10-10 14:30:26',NULL),(5,'Ashley','Martin','$2b$12$gMQ7L0RcgimFb0TCEXxEX.KgoG.HOyNTbICGhG0QQG5mriNv/nFd6','adt@gmail.com','2021-10-10 14:31:30','2021-10-10 14:31:30',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'recipes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-11 12:14:17
