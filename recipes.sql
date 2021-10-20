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
-- Table structure for table `liked_recipes`
--

DROP TABLE IF EXISTS `liked_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liked_recipes` (
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`user_id`,`recipe_id`),
  KEY `fk_users_has_recipes_recipes1_idx` (`recipe_id`),
  KEY `fk_users_has_recipes_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_recipes_recipes1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `fk_users_has_recipes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liked_recipes`
--

LOCK TABLES `liked_recipes` WRITE;
/*!40000 ALTER TABLE `liked_recipes` DISABLE KEYS */;
INSERT INTO `liked_recipes` VALUES (10,10,46),(10,20,43);
/*!40000 ALTER TABLE `liked_recipes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (2,'testing testing ',' vyebvyebvosebvyebraovidursavnseuopvnbuewipvbnvnweuyn ',' sedfnvpsednuyvespbvner8pvbneiusvbfsnvuisdfbnpsdfubiudfnuibn ',' ubhuisdbfvnpioueadbvuisdfnvusdfnbsedfiufvbnsadvudsabuib ',0,' puhuhevusdhvuhesdpuvhdsbvhuiesrvhpesrvhv7ehu7phhu ',' uphusehdvpusdhvushdvuersvhusdrhvusdfivhpisudhvbpusdhuhu ',' h8puhupsdhfvuhdsupfpvhsdfhp7hsd7vhuhuhh ',' 8yhy8g7gyygg76tghyyg7tff656go8yghuyog776g7tg ',3,'2021-10-10 14:29:20','2021-10-18 20:18:35'),(3,'Doctor\'s go-go juice','gvuiouywbuysabvyusabovaedsrybvasdfuyvbavybealsvbuybyub','ouygbuyobybuyvotuvbuyovirycurtctkyu','vtfvrytcytukbguygvi7tfivtyubuybyouioitugvuyg',0,'uytguytguyfitfftyugyugiuyg76f6rfituygugoyfg','7ygf7tifutygiytdfr6dfi67gi7tfr6dfi76g7tf75tif','i7tf7itf65figtfyrdredtygk6gftyfytfyt','iytfyitfytvurdr6dfitgityuvfryt6d56ftftftyfr6u65ftfy',4,'2021-10-10 14:31:03','2021-10-10 14:31:03'),(4,'Glitter Bomb Party Beer','ihohbyvuysbfdviouysfbvodsiauvdfiuvfbdsfiuvbasibib','i8ygiuybiybvuyoh;unbuoytgli','iyubibiuhuyoguohuibuyotvuyb',0,'piuyghpiuyhbiuhbuygpuhiygh','pi8uyghygiubuytfgo7ghiuyg','uygihguoygo7tfgiuylhiluyguyglih','ygyuoigouyto87hiouygbutfoylghgyuguyoggy',5,'2021-10-10 14:32:02','2021-10-10 14:32:02'),(5,'Public','oiunsdvsdriubvsndfiovubiyuobyubb','exexeyecexeyxercxyrtexctrhct','xexertxcexrtectjcytvkukygyugyfuytf',0,'ygyfgtiyfytglgyugtif5f6gguykfytfdtg','iuyguyfgi7t6gf7uygiuygfiytfklihyuogofotuifytifvytgfuytg','iuytftyfuytfytfguygukytftyfgiguyg','uyguyguygfytfitfyugiyftftyifygftyfytf',5,'2021-10-10 14:40:50','2021-10-10 14:40:50'),(9,'Austin Beer Garden Simple Pil','Here is a simple and simply delicious recipe scaled to homebrew volume from The Austin Beer Garden Brewing Co.’s Brewer Brian Peters.','Batch size: 5 gallons (19 liters)\r\nOG:  1.046\r\nFG: 1.008\r\nIBUs: 35\r\nABV: 4.9','8 lb (3.6 kg) Weyermann Pilsner Malt\r\n1.6 oz (45 g) Weyermann Acidulated Malt',0,'1 oz (28 g) Hallertau Mittelfruh at 60 minutes  1 oz (28 g) Hallertau Mittelfruh at 45 minutes  1 oz (28 g) Hallertau Mittelfruh at 15 minutes  1 oz (28 g) German Saphir at 0 minutes ','Wyeast 2352-PC Munich Lager II yeast (2 qt/1.9 l) starter). Because it’s a “Private Collection” yeast, this one may not always be available. Substitute Wyeast 2042 Danish Lager if needed.','Mash for 30 minutes at 145°F (63°C). Raise the mash temperature to 160°F (71°C) over 15–20 minutes, then rest for 15 minutes. Recirculate until the wort is clear (15–20 minutes).\r\n\r\nBoil for 60 minutes following the hop additions schedule. Whirlpool and cool the wort to 52°F (11°C). (That’s a bit of challenge.) Aerate the wort and pitch the yeast.\r\n\r\nFerment at 52°F (11°C) until specific gravity hits 4° Plato (about 10 days), then raise the temperature to 58°F (14°C) and hold for 4 days. Rack the beer into a CO2-purged soda keg and cool 3°F (2°C) a day until the beer reaches 32°F (0°C) (about 5 days). Hold at 32°F (0°C) for four weeks. Force carbonate and enjoy.','Any German Pilsner malt is fine. We’ve used Bestmalz, Durst-Malz, and Schill Malz in the past.',3,'2021-10-10 19:45:09','2021-10-10 19:45:09'),(10,'Less Thinking IPA Recipe','This recipe from Matt Gallagher, brewmaster at Half Acre Beer Co., is great for highlighting two different hops, but it could easily be used to evaluate a single varietal as well.','Batch size: 5 gallons (19 liters)\r\nOG: 1.051\r\nFG: 1.007\r\nIBUs: 50\r\nABV: 6','8 lb (3.6 kg) 2-row malt\r\n1.5 lb (680 g) Vienna\r\n10 oz (283 g) flaked oats',0,'0.25 oz (7 g) Warrior at 60 minutes\r\n0.5 oz (14 g) Amarillo at 30 minutes\r\n0.75 oz (21 g) Amarillo at 15 minutes\r\n1.5 oz (43 g) Amarillo at whirlpool\r\n0.5 oz (14 g) Centennial at whirlpool\r\n3.5 oz (99 g) Amarillo at dry hop (day 6 of fermentation)\r\n1 oz (28 g) Centennial at dry hop (day 6 of fermentation)','White Labs WLP051 California Ale V','Mash at 145°F (63°C) for 60 minutes, then rest until conversion is complete. Boil for 90 minutes. Pitch the yeast and ferment at 65°F (18°C). Dry hop on day 6 of fermentation (when fermentation is slowing down), crash the beer on day 10 to 31°F (0°C). Wait a week or two before packaging.','It is best consumed during the summer months surrounded by nature.',3,'2021-10-10 19:48:45','2021-10-10 19:48:45'),(11,'White Dog IPA','El Segundo Brewing Company Founder and Brewmaster Rob Croxall shared this recipe for one of the first IPAs he brewed.','Batch size: 5 gallons (19 liters)\r\nOG: 1.061\r\nFG: 1.010\r\nIBU: 44\r\nABV: 6.7','7 lb (3.2 kg) 2-row base malt\r\n6 lb (2.7 kg) white wheat malt\r\n0.5 lb (227 g) rice hulls (if you’re concerned about a stuck mash)',0,'1 oz (28 g) Chinook [11.1 AA] at 60 minutes\r\n1 oz (28 g) Cascade at 5 minutes\r\n1 oz (28 g) Nelson Sauvin at 5 minutes\r\n0.5 oz (14 g) Chinook dry hop 7 days\r\n1 oz (28 g) Cascade dry hop 7 days\r\n2 oz (57 g) Nelson Sauvin dry hop 7 days','White Labs WLP0001 or Wyeast 1056','Mash the grains at 148°F (64°C) for 60 minutes. Sparge at 168°F (75°C), bring to a boil, and boil for 60 minutes, following the hops schedule. Whirlpool and cool to 68°F (20°C) rapidly. Maintain fermentation temperature at 68°F (20°C). Once primary fermentation and diacetyl rest are complete, drop the temperature to 60°F (15°C) and dry hop for 7 days. Don’t use a filter or finings; the beer should finish with a medium haze but shouldn’t be murky. Carbonate to 2.5 vols of CO2.','El Segundo Brewing Company (El Segundo, California) Founder and Brewmaster Rob Croxall shared this recipe for one of the first IPAs he brewed.',3,'2021-10-10 19:51:56','2021-10-10 19:51:56'),(12,'This is a private recipe','ughvbudsbvsdyfoubesarvyuasibverlyiebvisdbivsyubyblutcirftuyklibu','butvuylbyvityolbbuhvktyfkbyvtyctyvuyvytivkuy','bvuoyguyovguyvityfgyubyuvkuvbbgyugiuybliuyg',1,'iulygylbliuyg7ytiugybhkvtyfoyubyouytftugh;h;uih','uhuygiuygyiuhyguyguygiulgyguyogiu','gygyiuogiyulguyft7futyvirdrdrutfy','6rfr6dfuigg7igf765ftftyg',5,'2021-10-10 20:23:54','2021-10-10 20:23:54'),(15,'This one is just a demo','ouysebviuyoasnoviusabdovuvnvbfyiauvniubsdfovibvbibiuybiuy','ibyubyubtyvitbyubvutvituykgvkugybuyby','ouygbuybuyoogyogyugyuogyugyuguyglygoyugygiuygyuigoyg',1,'lguygoyguygyuigfuyguftfytfytyukvkuyvtyftytvktvtykgyk','999999999999999999999999999999999999999999999999','ytdctfctfrcurttvtyvtvykuvvittykvytvtkytvtgyuggugiutfu6gigg6gtuyi','i7tgi7ggyug87gyugsuyvgsedygvysedgvsueygvysergverygveyuvgesyuvgerkysuvgsrguy',3,'2021-10-14 15:37:26','2021-10-14 15:37:26'),(16,'oeurygvdsrvbseurbuyb','ouyvuybslnviudsfbvisldufnbvldsfbsi kjbiuybliu','biuiulbiulbiulnjbkuvtyfgyuibhkhgvtyugi,bghkvuyb','uhiulgkuylibkgvyjvbktyfvhj,khiulvukyigbkguvyb',1,'liuygyukbhjvjyfkuyibtuyjcrcvkyjuuiulygbykuvytj','gliubyktjfuykbyuftyickuigtycthjvkuyfyfguyg','i7tgfuykgfytgluivkyrtufctkyubulgtcygjkuvuvtyfuyv','ytrfvjhyvktykugtcurcjtyyvkuyftykgy',7,'2021-10-16 23:17:28','2021-10-16 23:17:28'),(17,'Sal\'s n/a Golden Ale','eboyfubaevyuasbvdsfaouybfvylsbfdvduyvbdfuy gldsfiuybyubvugytufty','guihbiygfit7gliuhyuigvtyf76khuihbhvktyfk6uy7hbuykgvytguh78gytvuybyuvi','ggbiuytf7tigubytgjfk76giuh 78fityfvkvgjtygugi76ftygygitf',0,'yukguytigyufgirtftkbuyg67gfytvkyubvjtifukyguybyut67','fgygyufi76ygyuvykh iyufuykgtyjf765gyugvuygytguyg','o87guygviytf67gygt7yftguig87ggo7g78','o78g8oguyfi76tguihguyiyfi76fgiuyo78o7tig',12,'2021-10-19 14:37:35','2021-10-19 14:37:35'),(18,'NJ Doppelbock','i7tfktuvtykvyubfvuysbdlvbkuyvfuysavtvyuvktycf','kuyillghluyvuylihlbuyvktuyfybjkhuilgtvkuligyugvluvkytfyguibv','iulygbjuhykvftuyghuihliyvkhjkbhvkytfufvtkybhj,bgy6ftkyulggktggvk',0,'uygiulgiuyguktfuygihguytgfyuihhgi76ftydghjvctfdtyftcrtjy','fyufuyrtfyugitykfyufjytdf67fcjrdyguguyguykfutyfyu','fytfytrtkfgi7dfi76ifrytcvgjhhyuyffuyfrytutugfytfdgk','uyfytfkurtyrfgyug76ifyuigityrtycytfytftyf',13,'2021-10-19 14:38:56','2021-10-19 14:38:56'),(19,'Giant Peachtree Double IPA','Remember double IPAs before they went all soft and hazy on us? This is one of those—bright and bitter, with plenty of oomph.','Batch size: 5 gallons (19 liters)\r\nOG: 1.076\r\nFG: 1.019\r\nIBUs: 67\r\nABV: 7.9','13 lb (5.9 kg) pilsner\r\n8 oz (227 g) Weyermann Caramunich I\r\n8 oz (227 g) British light crystal (45L) ',0,'0.5 oz (14 g) Warrior at 60 minutes [30 IBUs]\r\n1 oz (28 g) Amarillo at 30 minutes [22 IBUs]\r\n1 oz (28 g) each of Amarillo, Citra, and Motueka at whirlpool [15 IBUs]\r\n1 oz (28 g) Amarillo at dry hop on Day 1\r\n1 oz (28 g) Citra at dry hop on Day 5\r\n1 oz (28 g) Motueka at dry hop on Day 10 ','Wyeast 1007 German Ale ','Mill the grains and mash at 152°F (67°C) for 60 minutes. Vorlauf until your runnings are clear, then run off into the kettle. Sparge and top up as necessary to get about 6 gallons (23 liters) of wort—or more, depending on your evaporation rate. Boil for 60 minutes, adding hops according to the schedule. After the boil and whirlpool (if whirlpooling), chill to about 60°F (16°C). Aerate well and pitch plenty of healthy yeast. Starting on Day 1, add dry hops according to the schedule. Ferment at 62°F (17°C) for the first 2 days, then allow the temperature rise to 69°F (21°C) over the course of 8 days (until Day 10). When dry hopping is complete and the gravity has stabilized, crash to 35°F (2°C), package, and carbonate to about 2.5 volumes.','The dry-hopping sequence may seem picky, but after multiple trials, the Amarillo-Citra-Motueka train produced the brightest and best aroma. (Feel free to try your own combinations, especially if swapping in other hops.) Also, take your time. Too many IPAs are rushed into package to preserve their hop character, only to produce a beer with off-flavors. This is a robust recipe, and the beer will be bright and hoppy for a healthy interval.',10,'2021-10-19 14:58:04','2021-10-19 14:58:04'),(20,'Almond Joy Magic Stout','This is a sweeter milk stout recipe that CBB staffer Libby Murphy has had fun experimenting with. Despite its name, there aren’t actual almonds in the recipe, but the flavor magically works itself into the mix. ','OG: 1.050\r\nFG: 1.008\r\nIBUs: 13\r\nABV: 5.4','8 lb (3.6 kg) pale malt (UK)\r\n1 lb (454 g) chocolate malt\r\n8 oz (227 g) caramel malt (120L)\r\n4 oz (113 g) Black Patent malt\r\n4 oz (113 g) Victory malt ',0,'1 oz (28 g) Fuggles [4.5 percent AA] at 60 minutes\r\n1 lb (454 g) lactose at 60 minutes\r\n4 oz (113 g) cacao nibs in secondary\r\n1 lb (454 g) toasted coconut in secondary—or you can make a tincture with coconut','1 package White Labs WLP004 Irish Stout Yeast or WLP001 California Ale Yeast','Mash at 154°F (68°C) for 60 minutes, sparge until desired clarity is achieved, then boil for 60 minutes, following the hops and additions schedule above.\r\n\r\nFerment for 2 weeks at the optimum temperature for your yeast, then rack into a secondary and add the cacao nibs. If you’re using toasted coconut, you can add it along with the cacao nibs. If you’d prefer the tincture, add that at bottling, following the instructions below. After 2−3 weeks in secondary, package.','I prefer the bright, fresh flavor of a coconut tincture over toasted coconut, especially in such a sweet beer. Prepare it the same day you brew so it has plenty of time to soak up the flavors.\r\n\r\nTo make a tincture, pour 16 fl oz (473 ml) of rum or vodka (rum has some great spices) into a Mason jar, then add 8 oz (227 g) of no-sugar-added coconut flakes. Test the flavor every few days until it’s the desired strength, then strain the flakes through a cheesecloth, saving the vodka or rum in a clean jar (discard the flakes). When it’s time to package the beer and you’ve racked it to your bottling bucket, slowly add the tincture, stirring and tasting as you go, until you reach the desired result.',10,'2021-10-19 15:07:17','2021-10-19 15:07:17'),(21,'Czech Plz!','Besides a hearty embrace of spicy Saaz hops, this partial-mash recipe for a Czech-style pilsner includes a method for pressurized fermentation in a corny keg.','Batch size: 4.75 gallons (18 liters)\r\nOG: 1.056\r\nFG: 1.015\r\nIBUs: 40\r\nABV: 5.2','9 lb (4.1 kg) pilsner liquid malt extract (LME)\r\n1 lb (454 g) Carapils ',1,'2 oz (57 g) Saaz at 60 minutes [19 IBUs]\r\n2 oz (57 g) Saaz at 30 minutes [14 IBUs]\r\n½ tsp (2.5 ml) Irish moss or ½ Whirlfloc tablet at 15 minutes\r\n2 oz (57 g) Saaz at 10 minutes [7 IBUs]\r\n1 oz (28 g) Saaz at flameout ','Fermentis SafLager W-34/70, White Labs WLP833 German Bock Lager, or other lager strain of choice','Mix your usual brewing water 50/50 with distilled water to make 5 gallons (19 liters) and heat it to 154°F (68°C). Mill the Carapils and steep at 154°F (68°C) for 30 minutes. Turn off the heat, add the LME, and stir thoroughly. Boil for 70 minutes, adding hops and Irish moss or Whirlfloc according to the schedule. Chill to about 65°F (18°C) and transfer to a clean, sanitized corny keg. Fill to about 4.75 gallons (18 liters), aerate well, and pitch the yeast. Seal the keg, connect a spunding valve, and set it to 6 PSI. On Day 5 of fermentation, set the valve to 12 PSI. Transfer the finished beer to bottles or a clean keg and lager (i.e., chill) for at least 2 weeks before consuming. ','Filling the keg not quite full (i.e., about 4.75 gallons/18 liters) allows some head space for the fermentation and spunding to work under pressure.',10,'2021-10-19 15:09:27','2021-10-19 15:09:27'),(22,'Ruse Phantom Shore Citra Extra Pale','This American-style extra pale ale is brewed with a nice layer of wheat and hopped exclusively with Citra. It’s super-smooth with a light body and dank notes of tangelo, nectarine, and kiwi.','Batch size: 5 gallons (19 liters)\r\nOG: 1.050\r\nFG: 1.009\r\nIBUs: 20\r\nABV: 5.4','6.75 lb (3.1 kg) Rahr 2-row\r\n12 oz (340 g) Weyermann Vienna\r\n12 oz (340 g) Rahr White Wheat ',1,'1 oz (28 g) Citra at whirlpool, with a 20-minute rest\r\n6 oz (170 g) Citra at dry hop (5 days) ','Chico ','Mash the grains at 152°F (67°C) for 45 minutes to an hour. Vorlauf until your runnings are clear, then run off into the kettle. Sparge the grains and top up as necessary to obtain 6 gallons (23 l) of wort—or more, depending on your evaporation rate. Boil for 75 minutes following the hops schedule.\r\n\r\nAfter the boil, chill the wort to slightly below fermentation temperature, about 68°F (20°C). Aerate the wort and pitch the yeast.\r\n\r\nFerment at 68°F (20°C), then step up to 70°F (21°C) when the gravity reaches 1.020. ','Our brewer’s beer, what we crave after a hard day of work—clean, crisp, pale with a nice hops expression. Go lighter on sulphate and heavier on chloride addition for the water profile.',10,'2021-10-19 15:14:11','2021-10-19 15:14:11'),(23,'Classic Weizenbock','A properly brewed weizenbock will have you experiencing intense malt and yeast flavors with enough alcohol to warm the body and soul.','ALL-GRAIN Batch size: 5 gallons (19 liters)\r\nOG: 1.076\r\nFG: 1.011\r\nIBUs: 20\r\nABV: 8.5','4.1 lb (1.9 kg) dark wheat malt\r\n4.1 lb (1.9 kg) light wheat malt\r\n2.25 lb (1 kg) Vienna malt\r\n1.83 lb 830 g) dark Munich malt\r\n1.13 lb (513 g) Pilsner malt\r\n9 oz (254 g) med. caramel malt\r\n2.4 oz (68 g) dark caramel malt ',1,'0.67 oz (19 g) Tettnang [3 AA] at boil start, \r\n0.33 oz (9 g) Spalt Select [6 AA] at boil start, \r\n0.67 oz (19 g) Tettnang [3 AA] at 30 minutes, \r\n0.33 oz (9 g) Spalt Select [6 AA] at 30 minutes ','Your favorite hefeweizen strain; most typical is Wyeast 3068 Weihenstephan Weizen. ','Multistep mash: Mash in at 112°F (44°C) and hold for 10 minutes. Raise temperature to 144°F (62°C) and hold for 45 minutes. Raise temperature to 158°F (70°C) and hold for 15 minutes. Raise temperature to 172°F (78°C) for mash out.\r\n\r\nLauter slowly, but not too slowly. The problem can be that with this combination of malts, the bed will want to set if you pull too hard. If you go too slowly, the temperature will decrease, increasing the viscosity and slowing things down further. You will probably need to manually lift the bed at some point.\r\n\r\nBoil as usual, following the hops schedule. You should evaporate 5–8 percent of your kettle full volume, however long that takes, usually 45–90 minutes.\r\n\r\nCool, aerate, and pitch the yeast at 61°F (16°C). Ferment at 65°F (18°C). After checking for diacetyl and verifying it is sufficiently low, cool to 40°F (4°C). ','The malt bill is the most complex I have used in our brewery. Typically, simple is better, but the reason for this combination is the complexity it brings to the malt character. More important is the way the yeast transforms the different proteins in the different malts into the complex aromas that are characteristic of this style of beer. If you are having trouble sourcing any of these ingredients, there are suitable substitutions for the malts that I have specified. For example, if you cannot source dark wheat malt, increase the light wheat and dark Munich malts to achieve similar color.\r\n\r\nLautering can take a long time and require interventions to keep it going. If it takes longer than 3 hours, heat the collected wort to at least 160°F (71°C) to keep it from spoiling as you collect the remaining wort from lautering. ',10,'2021-10-19 15:17:20','2021-10-19 15:17:20');
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
  `profile_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Eric','Jones','Kaywood1','josephrm84@gmail.com','2021-10-10 00:31:22','2021-10-19 14:44:21','/static/images/jonesy.png'),(4,'Doctor','Martin','$2b$12$AQpVzXap43z7cPsxTztvmONTGNPCBrD3VWdM11/X/2tHXmOmNLsTK','doc@gmail.com','2021-10-10 14:30:26','2021-10-10 14:30:26',NULL),(5,'Ashley','Martin','$2b$12$gMQ7L0RcgimFb0TCEXxEX.KgoG.HOyNTbICGhG0QQG5mriNv/nFd6','adt@gmail.com','2021-10-10 14:31:30','2021-10-19 14:46:17','/static/images/unicorn.png'),(6,'Ninja','Martin','$2b$12$mzxxD3nhZggbomPwXV43K.F2QfOdYex6B1xoO9UMXWbLmW8gKjvtG','ninja@gmail.com','2021-10-14 15:23:23','2021-10-19 00:16:45','/static/images/cat_beer.png'),(7,'tim','tam','$2b$12$z3fcRae1rZZDGPtUowHKoO3s0/4d6ntJmW2L.WxXFHd7bx7gotveO','timtam@gmail.com','2021-10-16 23:15:57','2021-10-16 23:15:57',NULL),(8,'James','Oisdb','','james@gmail.com',NULL,'2021-10-18 21:15:15','<FileStorage: \'cat beer.jpeg\' (\'image/jpeg\')>'),(10,'Joe','Martin','$2b$12$mkkKeY9RNWtVWgseHKyuh.lYrCjpz5g3RPmqWtmgj3DGSQZoB.tTG','JMart.DC@gmail.com','2021-10-18 22:06:28','2021-10-19 14:30:03','/static/images/joey.png'),(11,'bob','bob','$2b$12$LfXXloLlnrJ7hCwhEGHUg.MO.7dUiQvP79LKw4vXDO42ABUcswzDa','bob@bob.com','2021-10-19 00:18:17','2021-10-19 00:18:40','/static/images/cat_beer.png'),(12,'Sal','Makatura','$2b$12$djh12e3Fv4A3cpgUVcXC/uo3yYBGn6UvPHHtRsI4612a7oqn.yVbm','sal@gmail.com','2021-10-19 14:36:27','2021-10-19 14:48:39','/static/images/cd-logo.png'),(13,'Pedro','Lora','$2b$12$0BXoor6D789vl2r/PbDaheGwB6jHgIHbXHR2z0WgfVaCx3vVzgbZm','Pedro@gmail.com','2021-10-19 14:38:04','2021-10-19 14:40:46','/static/images/smart_dog.png');
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

-- Dump completed on 2021-10-19 22:11:02
