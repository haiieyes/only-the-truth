-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: albumReviews
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `albumReviews`
--

DROP TABLE IF EXISTS `albumReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albumReviews` (
  `albumID` int(10) unsigned NOT NULL,
  `nick` varchar(45) NOT NULL,
  `review` text NOT NULL,
  `reviewID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`reviewID`),
  KEY `albumID` (`albumID`),
  CONSTRAINT `albumReviews_ibfk_1` FOREIGN KEY (`albumID`) REFERENCES `albums` (`albumID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumReviews`
--

LOCK TABLES `albumReviews` WRITE;
/*!40000 ALTER TABLE `albumReviews` DISABLE KEYS */;
INSERT INTO `albumReviews` VALUES (1,'Rob Mitchum','Bloated tracklist, guest star overload, lyrical paradoxes: It all might sound a bit critical for an 8+ album, but College Dropout\'s flaws tend to only help make Kanye West all the more personable as an artist. With the fat playlist trimmed, the album lays down a sky-high standard for hip-hop challengers in \'04, featuring enough singles in reserve to fill out the calendar year. Ideal weather conditions of Chicago\'s rap void, producer name-dropping, and mainstream/underground bleedover may have handled the advance work for Kanye West\'s arrival, but College Dropout doesn\'t muff the kick.',1),(2,'Tom Breihan','Two long-reigning titans make a relatively quick album which, despite their best efforts, still winds up being a monument to their own grandiosity. Should we care? Well, yeah. Kanye doesn\'t have a cruise-control switch, and when he\'s around, neither does Jay. On Watch the Throne, they push each other and have fun doing it, and the result is a stadium-sized event-rap spectacle that still sounds like two insanely talented guys\' idiosyncratic vision. That\'s worth celebrating.',2),(3,'Jayson Greene','If there was a larger message behind all this impulsive last-second lurching and heaving, that was it. \"We on an ultralight beam/ This is a God dream\" reads like an affirmation that we live in a world touched by divinity—but it could also mean the universe is a trick of the light, and we\'re nothing but a figment in a higher being\'s imagination. Nothing is as it seems, nothing is safe from revision, and nothing lasts: In one last rug pull, Kanye claimed that the \"Pablo\" of the title was neither Escobar nor Picasso, but St. Paul of Tarsus (\"Pablo\" in Spanish). The claim slots neatly with his assertion that The Life of Pablo is a \"gospel album,\" and on \"Wolves,\"  he offers a resonant, lonely image: Kim and Kanye as Mary and Joseph, alone in the manger and surrounded by the void.  \"Cover Nori in lamb\'s wool/ We surrounded by/ The fuckin wolves,\" he raps. If Pablo is indeed St. Paul, Kanye might have a passage on his mind from Corinthians, Chapter 13 verse 2: \"If I have a faith that can move mountains, but do not have love, I am nothing.\"',3),(3,'Rob Sheffield','The world has distracted from Kanye West’s creative process – except, as he shows on The Life of Pablo, distraction is his creative process. This is a messy album that feels like it was made that way on purpose, after the laser-sharp intensity of Yeezus. It’s a labored-over opus that wishes it were a mixtape, trying hard to curate the vibe of a sprawling mess, and that’s because it’s made by an artist who feels like a mess and doesn’t care to hide it. “My psychiatrist got kids that I inspired” is the most brilliant line on the album: Ye can’t even go to the shrink without getting his ass kissed about what a big shot he is, so he has to go to the studio instead. And dude knows he’s got some issues to work on.',4),(1,'Derek Xu','The College Dropout is an incredible project and it’s unbelievable that this was Kanye’s first full-length album. Each song is beautifully written and Kanye’s unique style shines through on all of them. He flawlessly leverages the album’s central concept by delivering bombshell after bombshell. He continuously tears down the norms of society and points out its largest flaws. This album is the perfect introduction to Kanye West as a musician, and as a human being. The College Dropout is a timeless masterpiece, and it is definitely an essential hip-hop album.',5),(4,'Ryan Dombal','Kanye\'s big year culminates in an LP that feels like an instant greatest hits, the ultimate realization of his strongest talents and divisive public persona.',6),(5,'Kris Ex','Coloring Book is one of the strongest rap albums released this year, and is destined to be on year-end lists aplenty. It\'s a more rewarding listen than Drake\'s recently released VIEWS; it\'s nearly as adventurous as The Life of Pablo. In execution and focus, it comes as a joyful, praise-dancing rejoinder to Kendrick Lamar\'s \'To Pimp a Butterfly\'. It feels a bit silly to compare Coloring Book to Butterfly, but it feels even sillier not to. When music comes like this—personal and panoramic, full of conversations with God, defying hip-hop norms while respecting them, proving that the genre can still dig deeper into its roots—it needs to be contextualized as what it is. This is an ultralight beam; it\'s a God dream.',7),(6,'Rawiya Kameir','There is not enough depth here to distract from his politics, or to complicate them. It’s an album of slogans, dashed-off and too short, and as he continues to test the edge between spontaneous and half-finished, it gets harder to ignore the facts hovering outside the frame. His call for the abolishment of the 13th Amendment, for example, is in direct opposition to his avowed support of a racist, punitive, incarceration-obsessed president. Yes, the bassline on “Water” is one of the best I’ve heard in a long time, but a moment like this feels like a consolation, not a highlight. Kanye albums used to stretch our perspectives and imaginations. Now they illuminate the contours of his increasingly shrunken world.',8);
/*!40000 ALTER TABLE `albumReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `albumID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artistID` int(11) unsigned NOT NULL,
  `albumName` varchar(45) NOT NULL,
  `albumGenre` varchar(45) NOT NULL,
  `albumDescription` text NOT NULL,
  `albumArt` varchar(128) NOT NULL,
  PRIMARY KEY (`albumID`),
  KEY `artistID` (`artistID`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `artists` (`artistID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'The College Dropout','Rap','Following success producing for numerous contemporaries including Talib Kweli, Beanie Sigel and most notably Jay-Z, Kanye West released his debut studio album, The College Dropout, on February 10, 2004.','https://imagescdn.juno.co.uk/full/CS138251-01A-BIG.jpg'),(2,1,'Watch the Throne','Rap','Watch The Throne is the debut studio album by longtime partners/friends and label-mates, JAY Z & Kanye West, also known and commonly referred to as The Throne.','https://upload.wikimedia.org/wikipedia/en/e/ee/Watch_The_Throne.jpg'),(3,1,'The Life of Pablo','Rap','The Life of Pablo is Kanye West’s 7th studio album. It was originally titled So Help Me God, then SWISH, and briefly WAVES. On February 9th, 2016, Kanye announced that the title could be acronymized as T.L.O.P., later revealed to stand for The Life of Pablo.','https://media.pitchfork.com/photos/5929b3995e6ef9596932249e/1:1/w_320/1192269b.jpg'),(4,1,'My Beautiful Dark Twisted Fantasy','Rap','My Beautiful Dark Twisted Fantasy is the fifth studio album by American rapper and producer Kanye West. It was released on November 22, 2010, through Def Jam Recordings and Roc-A-Fella Records. Following a period of public and legal controversy, West retreated to a self-imposed exile in Hawaii in 2009.','https://m.media-amazon.com/images/I/715Ag05hzQL._SS500_.jpg'),(5,3,'Coloring Book','Rap','Coloring Book is the third mixtape by American rapper Chance the Rapper. It was produced by his group The Social Experiment, Lido, and Kaytranada, among others.','https://media.pitchfork.com/photos/5929b5bb13d197565213ace9/1:1/w_600/c5e30897.jpg'),(6,1,'Jesus Is King','Rap','Jesus Is King is the ninth studio album by American rapper Kanye West, released on October 25, 2019, through GOOD Music and Def Jam Recordings. The album follows a Christian theme, with West describing it as \"an expression of the gospel.','https://i1.wp.com/hiphopza.com/wp-content/uploads/2019/10/DOWNLOAD-Kanye-West-Jesus-Is-King-Album.jpeg');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artistID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `artistName` varchar(45) NOT NULL,
  PRIMARY KEY (`artistID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Kanye West'),(3,'Chance The Rapper'),(4,'J Cole');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `trackID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `albumID` int(10) unsigned NOT NULL,
  `artistID` int(10) unsigned NOT NULL,
  `trackOrder` int(11) NOT NULL,
  `trackName` varchar(45) NOT NULL,
  `trackRating` int(11) NOT NULL,
  PRIMARY KEY (`trackID`),
  KEY `albumID` (`albumID`),
  KEY `artistID` (`artistID`),
  CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `artists` (`artistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracks_ibfk_2` FOREIGN KEY (`albumID`) REFERENCES `albums` (`albumID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,1,1,1,'Intro',4),(2,1,1,2,'We Dont Care',3),(3,1,1,3,'Graduation Day',4),(4,1,1,4,'All Falls Down (feat. Syleena Johnson)',5),(5,1,1,5,'Ill Fly Away',3),(6,1,1,6,'Spaceship (feat.GLC & Consequence)',2),(7,1,1,7,'Jesus Walks',5),(8,1,1,8,'Never Let Me Down (feat. Jay-Z & J. Ivy)',3),(9,1,1,9,'Get Em High',1),(10,1,1,10,'Workout Plan',1),(11,1,1,11,'The New Workout Plan',1),(12,1,1,12,'Slow Jamz',1),(13,1,1,13,'Breathe In Breathe Out (feat. Ludacris)',5),(14,1,1,14,'School Spirit Skit 1',2),(15,1,1,15,'School Spirit',4),(16,1,1,16,'School Spirit Skit 2',2),(17,1,1,17,'Lil Jimmy Skit',2),(18,1,1,18,'Two Words',2),(19,1,1,19,'Through The Wire',5),(20,1,1,20,'Family Business',4),(21,1,1,21,'Last Call',5),(22,3,1,1,'Ultralight Beam',5),(23,3,1,2,'Father Stretch My Hands, Pt. 1',3),(24,3,1,3,'Pt. 2',4),(25,3,1,4,'Famous',5),(26,3,1,5,'Feedback',2),(27,3,1,6,'Low Lights',2),(28,3,1,7,'Highlights',2),(29,3,1,8,'Freestyle 4',1),(30,3,1,9,'I Love Kanye',1),(31,3,1,10,'Waves',4),(32,3,1,11,'FML',2),(33,3,1,12,'Real Friends',2),(34,3,1,13,'Wolves',5),(35,3,1,14,'Franks Track',5),(36,3,1,15,'Siiiiiiiiilver Surffffeeeeer Intermission',1),(37,3,1,16,'30 Hours',2),(38,3,1,17,'No More Parties in LA',2),(39,3,1,18,'Facts (Charlie Heat Version)',2),(40,3,1,19,'Fade',3),(41,3,1,20,'Saint Pablo',2),(42,2,1,1,'No Church in The Wild (feat. Frank Ocean)',5),(43,2,1,2,'Lift Off (feat. Beyonce)',4),(44,2,1,3,'Niggas in Paris',5),(45,2,1,4,'Otis (feat. Otis Redding)',3),(46,2,1,5,'Gotta Have It',3),(47,2,1,6,'New Day',2),(48,2,1,7,'Prime Time',1),(49,2,1,8,'Who Gon Stop Me',4),(50,2,1,9,'Murder to Excellence',2),(51,2,1,10,'Welcome to The Jungle',2),(52,2,1,11,'Sweet Baby Jesus (feat. Frank Ocean)',3),(53,2,1,12,'Love You So (feat. Mr Hudson)',3),(54,2,1,13,'Illest MTHFKR Alive',4),(55,2,1,14,'HAM (Bonus)',3),(56,2,1,15,'Thats My Bitch (Bonus)',3),(57,2,1,16,'The Joy (Feat. Curtis Mayfield) (Bonus)',3);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-07  8:01:42
