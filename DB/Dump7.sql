-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: portale_cinema
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `id_spettacolo` int NOT NULL,
  `data_acquisto` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_utente` (`id_utente`),
  KEY `id_spettacolo` (`id_spettacolo`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`id_spettacolo`) REFERENCES `spettacolo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,6,2,'2025-03-25 21:59:19'),(2,6,2,'2025-03-25 22:14:15'),(3,6,10,'2025-03-25 22:36:19'),(4,6,10,'2025-03-26 08:21:39');
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `descrizione` text,
  `link_trailer` varchar(255) DEFAULT NULL,
  `durata` int NOT NULL,
  `data_uscita` date DEFAULT NULL,
  `locandina` varchar(255) DEFAULT NULL,
  `nazione` varchar(50) NOT NULL,
  `vintage` tinyint(1) NOT NULL DEFAULT '0',
  `check_uscita` tinyint(1) NOT NULL DEFAULT '0',
  `id_genere` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_film_genere` (`id_genere`),
  CONSTRAINT `fk_film_genere` FOREIGN KEY (`id_genere`) REFERENCES `genere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (6,'Troubleshooters','Due migliori amici falliti di Tirana sognano di diventare i migliori investigatori privati ​​albanesi.','https://www.youtube.com/watch?v=Y3d4t8Wk8nY',120,'2024-12-12','https://www.ucicinemas.it/media/movie/l/2024/alb-troubleshooters.jpg','USA',1,1,1),(7,'Mickey 17','L’improbabile eroe Mickey Barnes (Robert Pattinson) si ritrova nella particolare circostanza di prestare servizio ad un titolare che esige l’impegno definitivo sul lavoro… ovvero morire, per vivere.','https://www.youtube.com/watch?v=ZjMNjRVDjDI&pp=ygUVbWlja2V5IDE3IHRyYWlsZXIgaXRh',140,'2025-03-06','https://www.ucicinemas.it/media/movie/m/2025/ov-mickey-17.jpg','USA',0,0,2),(8,'Snow White','Una rivisitazione musicale live-action del classico film del 1937. La magica avventura musicale torna alla storia senza tempo con gli amati personaggi Mammolo, Dotto, Cucciolo, Brontolo, Gongolo, Pisolo e Eolo.','https://www.youtube.com/watch?v=iV46TJKL8cU&pp=ygUSc25vdyB3aGl0ZSB0cmFpbGVy',115,'2025-06-20','https://www.ucicinemas.it/media/movie/l/2025/sala-xl-biancaneve-2025.jpg','USA',0,1,3),(9,'The Monkey','In soffitta c\'è una scimmietta giocattolo un po\' misteriosa. Apparteneva al papà dei gemelli Hal e Bill che, da bambini, la ritrovano e ne azionano il meccanismo ruotando la chiave nella schiena. È l\'inizio di una serie di morti orribili che distrugge la loro famiglia.','https://youtu.be/lT_yfGzUAwY',125,'2025-06-20','https://pad.mymovies.it/filmclub/2024/10/127/locandina.jpg','UK',0,1,4),(11,'Follemente','Lara e Piero si incontrano per il loro primo appuntamento, si piacciono ma non osano confessarlo (nemmeno a se stessi), incartandosi su ogni dettaglio, impegnati ad ascoltare le voci interiori delle loro rispettive personalità. Riusciranno a zittire quel chiacchiericcio incessante e a trovare la strada verso una relazione finalmente appagante?','https://www.youtube.com/watch?v=pBBE1uSJMV0&pp=ygUSZm9sbGVtZW50ZSB0cmFpbGVy',105,'2025-02-20','https://pad.mymovies.it/filmclub/2024/06/080/locandinapg1.jpg','Italia',0,0,5),(12,'A Different Man','Edward vive a New York con l\'ambizione di fare l\'attore, ma il suo aspetto fisico è pesantemente condizionato dalla neurofibromatosi che gli segna il volto.','https://www.youtube.com/watch?v=NP49Fiz2-X0&pp=ygUXYSBkaWZmZXJlbnQgbWFuIHRyYWlsZXI%3D',125,'2025-03-20','https://pad.mymovies.it/filmclub/2024/01/273/locandina.jpg','USA',0,0,6),(13,'A Real Pain','David e Benji, due cugini diversissimi tra loro, si ritrovano all\'aeroporto. Il primo vive a Brooklyn, è sposato e ha un figlio. Il secondo è uno spirito più libero dal carattere imprevedibile. Nati a tre settimane di distanza, sono stati molto legati durante l\'infanzia, poi la loro vita ha preso strade divergenti. Hanno così deciso di partire per la Polonia per onorare la loro amata nonna Dory scomparsa da poco e connettersi con la sua storia passata.','https://www.youtube.com/watch?v=lMp79UBWpu4&pp=ygUXYSByZWFsIHBhaW4gdHJhaWxlciBpdGE%3D',115,'2025-02-27','https://pad.mymovies.it/filmclub/2024/02/020/locandinapg2.jpg','USA',1,1,6),(14,'Bridget Jones: Un Amore Di Ragazzo','Bridget Jones ce l\'aveva fatta, era diventata la signora Darcy, ma ora Mark non c\'è più, è rimasto ucciso in una missione umanitaria in Sudan, e lei è costretta a destreggiarsi da anni tra il dolore per il lutto e l\'esigenza di crescere nel miglior modo possibile i loro figli, Billy e Mabel. Per uscire dal limbo emotivo e cercare di far ripartire la propria vita, accetta di iscriversi a Tinder, dove inizia una fitta conversazione con il giovanissimo Roxster. Anche il nuovo insegnante di Billy, però, il signor Walliker, sembra osservarla con interesse da una certa distanza.','https://www.youtube.com/watch?v=p9jRpUmmeWw&pp=ygUXdW4gYW1vcmUgZGkgcmFnYXp6byBpdGE%3D',120,'2025-03-01','https://pad.mymovies.it/filmclub/2024/04/115/locandinapg1.jpg','UK',0,1,7),(15,'Captain America: Brave New World','L\'ex Generale Thaddeus \"Thunderbolt\" Ross è divenuto presidente degli Stati Uniti con una campagna elettorale all\'insegna dell\'unità del Paese e la sua collaborazione con il nuovo Capitan America sembra migliorare di giorno in giorno. Dopo una missione completata con successo contro i Mercenari dei Serpenti, Sam Wilson viene infatti invitato alla Casa Bianca, accompagnato dal nuovo Falcon, Joaquin Torres, e dal Capitan America dimenticato della Guerra di Corea, vittima per decenni di esperimenti governativi: Isaiah Bradley.','https://www.youtube.com/watch?v=RSIkXjNpwTo&pp=ygUrY2FwdGFpbiBhbWVyaWNhIGJyYXZlIG5ldyB3b3JsZCB0cmFpbGVyIGl0YQ%3D%3D',130,'2025-02-17','https://pad.mymovies.it/filmclub/2022/07/117/locandina.jpg','USA',0,1,1),(16,'Diamanti','Fine anni \'70. Alberta e Gabriella Canova sovrintendono una grande sartoria specializzata in costumi per il cinema e il teatro: un microcosmo tutto al femminile. Ne fanno parte la capo sarta Nina (con un figlio hikikomori ante litteram), la ricamatrice Eleonora (vedova con una nipote ribelle), Beatrice la tingitrice, la modista Paolina con un figlio piccolo che si nasconde nella stanza dei bottoni, le sarte Nicoletta (picchiata dal marito) e Fausta, single ironica, più l\'ultima arrivata Giuseppina. La cuoca del palazzo, l\'ex ballerina Silvana, ha una parola di conforto per tutti.','https://www.youtube.com/watch?v=XnKybuHa7-4&pp=ygUUZGlhbWFudGkgdHJhaWxlciBpdGE%3D',100,'2024-12-19','https://pad.mymovies.it/filmclub/2024/07/062/locandinapg1.jpg','Italia',0,1,6),(17,'Elfkins - Missione Gadget','La giovane e curiosa Elfie vive con il suo clan di Elfkins (gnomi dai cappelli a punta che, secondo un\'antica leggenda, aiutano gli umani nel lavoro) nella mansarda di una pasticceria di Colonia, uscendo solo di notte per svolgere il proprio compito. Elfie, però, è annoiata dalla solita routine e desidera nuove avventure. La svolta arriva quando incontra Bo, di un altro clan di Elfkins provenienti da Vienna, dotati di gadget super-tecnologici per compiere scherzi e furti in città. Elfie si unisce a loro e cerca di riconciliare i due gruppi rivali, ma deve anche sfuggire a una poliziotta e al suo gatto.','https://www.youtube.com/watch?v=riCt-m0C-Po&pp=ygUjZWxma2lucyBtaXNzaW9uZSBnYWRnZXQgdHJhaWxlciBpdGE%3D',95,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/038/locandina.jpg','Germania',1,0,8),(18,'Gioco Pericoloso','Roma. Carlo Paris è un celebre critico d\'arte e la sua compagna è la bellissima ballerina Giada. Durante un vernissage, Carlo si imbatte in Peter Drago, un artista che attira le sue simpatie e che si fermerà nella dependance della casa al mare a Sabaudia. Presto emerge che tra Peter e Giada c\'è un passato comune; inoltre, l\'uomo ha un\'agenda segreta ed è intenzionato a giocare con i destini di entrambi. Sullo sfondo, l\'ambiente dell\'arte contemporanea, con rivalità e manipolazioni in nome dell\'arte.','https://www.youtube.com/watch?v=kptFhyFVlY8&pp=ygUcZ2lvY28gcGVyaWNvbG9zbyB0cmFpbGVyIGl0YQ%3D%3D',120,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/130/locandina.jpg','Italia',0,1,9),(19,'Heretic','Sorella Paxton e Sorella Barnes sono due giovani missionarie mormoni che, porta a porta, predicano il proprio credo. Quando entrano nella casa del signor Reed, durante un temporale, non sanno di trovarsi nella tana del lupo: l\'apparente interesse dell\'uomo nasconde oscure deviazioni e terribili trappole pronte a incastrarle.','https://www.youtube.com/watch?v=cBEyjWAVnXA&pp=ygUTaGVyZXRpYyB0cmFpbGVyIGl0YQ%3D%3D',130,'2025-02-27','https://pad.mymovies.it/filmclub/2024/10/104/locandina.jpg','USA',0,1,4),(20,'Il Nibbio','4 febbraio 2005. Nicola Calipari, alto dirigente del SISMI, parte per le vacanze con la famiglia ma viene richiamato a Roma: la giornalista Giuliana Sgrena è stata rapita a Baghdad. Per 28 giorni Calipari, soprannominato \"il Nibbio\", farà la spola tra l\'Iraq presidiato dall\'esercito USA e i Servizi Segreti italiani, cercando di negoziare la liberazione di Sgrena.','https://www.youtube.com/watch?v=WFxQC73mY5c&pp=ygUVaWwgbnViYmlvIHRyYWlsZXIgaXRh',105,'2025-03-06','https://pad.mymovies.it/filmclub/2024/03/136/locandinapg1.jpg','Italia',0,1,6),(21,'La Città Proibita','Cina, 1979. Due genitori sfuggono alla legge del figlio unico mettendo al mondo le bambine Yun e Mei. Mei, la secondogenita, è costretta a vivere nascosta. A metà anni Novanta, Mei si ritrova a Roma, nel quartiere multietnico dell\'Esquilino, in un ristorante cinese dal nome La città proibita: lì spera di scoprire che fine abbia fatto la sorella Yun, diventata prostituta. Incrocerà i destini di Marcello, giovane cuoco di cucina romana che gestisce un locale rivale insieme a sua madre Lorena, e di Annibale, amico fraterno del padre di Marcello e ostile alla presenza cinese che sente come \"invasione\".','https://www.youtube.com/watch?v=W2xZ_VkzQlo&pp=ygUebGEgY2l0dMOgIHByb2liaXRhIHRyYWlsZXIgaXRh',140,'2025-03-13','https://pad.mymovies.it/filmclub/2024/07/058/locandinapg1.jpg','Italia',0,1,1),(22,'Lee Miller','Elizabeth \"Lee\" Miller, dopo una carriera come modella e musa del surrealista Man Ray, decide di partire come fotoreporter di guerra durante la Seconda Guerra Mondiale, testimoniando le condizioni dei prigionieri e il coraggio delle ausiliarie al fronte. Riporterà a casa una sindrome da stress post traumatico che la accompagnerà per tutta la vita.','https://www.youtube.com/watch?v=bsfpfblDlwI&pp=ygUWbGVlIG1pbGxlciB0cmFpbGVyIGl0YQ%3D%3D',115,'2025-03-13','https://pad.mymovies.it/filmclub/2024/05/022/locandinapg1.jpg','UK',0,1,10),(23,'Nella Tana Dei Lupi 2: Pantera','Sono passati due anni dal colpo alla Federal Reserve: la banda di Merrimen è stata decimata e l\'unità Major Crimes dello sceriffo è in macerie. \"Big Nick\" O\'Brien è separato, al verde, senza squadra, ma il recente furto all\'aeroporto di Anversa sembra opera di Donnie, l\'ideatore della rapina di Los Angeles. Giunto in Europa, Nick capisce che tutto converge sul World Diamond Center di Nizza, dove Donnie ha trovato nuovi alleati nella spietata banda della Pantera.','https://www.youtube.com/watch?v=dPlCcDXxnl8&pp=ygUhbmVsbGEgdGFuYSBkZWkgbHVwaSAyIHRyYWlsZXIgaXRh',135,'2025-03-06','https://pad.mymovies.it/filmclub/2024/09/099/locandinapg1.jpg','USA',0,1,1),(24,'Paddington In Peru','Judy e Jonathan stanno per lasciare casa, e la signora Brown teme la fine di quei momenti familiari tutti insieme sul divano. Ma l\'orso Paddington riceve una lettera: la zia Lucy, in Perù, non sta bene. L\'intera famiglia Brown, Signora Bird compresa, parte alla volta del Sudamerica per rivederla. Avventure e imprevisti non tarderanno ad arrivare.','https://www.youtube.com/watch?v=x8Fhxnp_CYI&pp=ygUecGFkZGluZ3RvbiBpbiBwZXJ1IHRyYWlsZXIgaXRh',100,'2025-02-20','https://pad.mymovies.it/filmclub/2021/02/174/locandinapg1.jpg','UK',0,1,8),(25,'The Alto Knights - I Due Volti Del Crimine','Metà del secolo scorso: Frank Costello e Vito Genovese, entrambi immigrati italiani e divenuti boss mafiosi a New York, si ritrovano in lotta per il controllo della Famiglia Luciano. Costello, diplomatico e calcolatore, ha preso il comando mentre Genovese era in fuga in Italia. Ora che Genovese è tornato, pretende da Frank ciò che considera suo. Tra omicidi, processi e guerre di potere, la posta in gioco non è mai stata così alta.','https://www.youtube.com/watch?v=IIES5s-Y22c&pp=ygUcdGhlIGFsdG8ga25pZ2h0cyB0cmFpbGVyIGl0YQ%3D%3D',125,'2025-03-20','https://pad.mymovies.it/filmclub/2023/04/074/locandinapg1.jpg','USA',0,1,11),(26,'Un Posto Sicuro','In un mondo devastato da una pandemia misteriosa e mortale, cinque sopravvissuti si rifugiano in una villa isolata. Ma non sono soli: presenze inquietanti, chiamate \"OMBRA\", iniziano a minacciare la loro sanità mentale. La villa diventa una prigione di paranoia e tensione, mentre affiorano verità sulla pandemia e sul destino dell’umanità. La speranza lotta contro l’oscurità in un disperato tentativo di sopravvivenza.','https://www.youtube.com/watch?v=zAt53yNqghU&pp=ygUbdW4gcG9zdG8gc2ljdXJvIHRyYWlsZXIgaXRh',115,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/150/locandina.jpg','Italia',0,1,6);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES (8,'Animazione'),(1,'Azione'),(10,'Biografico'),(5,'Commedia'),(11,'Crime'),(6,'Drammatico'),(2,'Fantascienza'),(3,'Fantasy'),(4,'Horror'),(7,'Romantico'),(9,'Thriller');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giudizio`
--

DROP TABLE IF EXISTS `giudizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giudizio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `id_film` int DEFAULT NULL,
  `stelle` int DEFAULT NULL,
  `commento` text,
  `data_giudizio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_utente` (`id_utente`,`id_film`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `giudizio_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `giudizio_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE SET NULL,
  CONSTRAINT `giudizio_chk_1` CHECK ((`stelle` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giudizio`
--

LOCK TABLES `giudizio` WRITE;
/*!40000 ALTER TABLE `giudizio` DISABLE KEYS */;
INSERT INTO `giudizio` VALUES (2,7,NULL,5,'prova commento!','2025-03-25 15:20:46'),(3,6,NULL,4,'prova 2!','2025-03-25 15:21:24'),(4,6,6,5,'provaCommento','2025-03-25 16:04:43'),(5,6,7,5,'prova commento2','2025-03-25 16:05:10'),(6,7,7,3,'prova commento 3 stelle.','2025-03-25 16:06:05'),(7,6,NULL,5,'prova commento 5 stelle.','2025-03-25 16:27:36'),(8,7,NULL,1,'non mi piace','2025-03-25 16:28:10');
/*!40000 ALTER TABLE `giudizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oggetto` varchar(100) NOT NULL,
  `messaggio` text NOT NULL,
  `data_invio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `id_sala` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`,`id_sala`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `posto_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
INSERT INTO `posto` VALUES (1,1,1),(201,1,2),(456,1,3),(711,1,4),(2,2,1),(202,2,2),(457,2,3),(712,2,4),(3,3,1),(203,3,2),(458,3,3),(713,3,4),(4,4,1),(204,4,2),(459,4,3),(714,4,4),(5,5,1),(205,5,2),(460,5,3),(715,5,4),(6,6,1),(206,6,2),(461,6,3),(716,6,4),(7,7,1),(207,7,2),(462,7,3),(717,7,4),(8,8,1),(208,8,2),(463,8,3),(718,8,4),(9,9,1),(209,9,2),(464,9,3),(719,9,4),(10,10,1),(210,10,2),(465,10,3),(720,10,4),(11,11,1),(211,11,2),(466,11,3),(721,11,4),(12,12,1),(212,12,2),(467,12,3),(722,12,4),(13,13,1),(213,13,2),(468,13,3),(723,13,4),(14,14,1),(214,14,2),(469,14,3),(724,14,4),(15,15,1),(215,15,2),(470,15,3),(725,15,4),(16,16,1),(216,16,2),(471,16,3),(726,16,4),(17,17,1),(217,17,2),(472,17,3),(727,17,4),(18,18,1),(218,18,2),(473,18,3),(728,18,4),(19,19,1),(219,19,2),(474,19,3),(729,19,4),(20,20,1),(220,20,2),(475,20,3),(730,20,4),(21,21,1),(221,21,2),(476,21,3),(731,21,4),(22,22,1),(222,22,2),(477,22,3),(732,22,4),(23,23,1),(223,23,2),(478,23,3),(733,23,4),(24,24,1),(224,24,2),(479,24,3),(734,24,4),(25,25,1),(225,25,2),(480,25,3),(735,25,4),(26,26,1),(226,26,2),(481,26,3),(736,26,4),(27,27,1),(227,27,2),(482,27,3),(737,27,4),(28,28,1),(228,28,2),(483,28,3),(738,28,4),(29,29,1),(229,29,2),(484,29,3),(739,29,4),(30,30,1),(230,30,2),(485,30,3),(740,30,4),(31,31,1),(231,31,2),(486,31,3),(741,31,4),(32,32,1),(232,32,2),(487,32,3),(742,32,4),(33,33,1),(233,33,2),(488,33,3),(743,33,4),(34,34,1),(234,34,2),(489,34,3),(744,34,4),(35,35,1),(235,35,2),(490,35,3),(745,35,4),(36,36,1),(236,36,2),(491,36,3),(746,36,4),(37,37,1),(237,37,2),(492,37,3),(747,37,4),(38,38,1),(238,38,2),(493,38,3),(748,38,4),(39,39,1),(239,39,2),(494,39,3),(749,39,4),(40,40,1),(240,40,2),(495,40,3),(750,40,4),(41,41,1),(241,41,2),(496,41,3),(751,41,4),(42,42,1),(242,42,2),(497,42,3),(752,42,4),(43,43,1),(243,43,2),(498,43,3),(753,43,4),(44,44,1),(244,44,2),(499,44,3),(754,44,4),(45,45,1),(245,45,2),(500,45,3),(755,45,4),(46,46,1),(246,46,2),(501,46,3),(756,46,4),(47,47,1),(247,47,2),(502,47,3),(757,47,4),(48,48,1),(248,48,2),(503,48,3),(758,48,4),(49,49,1),(249,49,2),(504,49,3),(759,49,4),(50,50,1),(250,50,2),(505,50,3),(760,50,4),(51,51,1),(251,51,2),(506,51,3),(761,51,4),(52,52,1),(252,52,2),(507,52,3),(762,52,4),(53,53,1),(253,53,2),(508,53,3),(763,53,4),(54,54,1),(254,54,2),(509,54,3),(764,54,4),(55,55,1),(255,55,2),(510,55,3),(765,55,4),(56,56,1),(256,56,2),(511,56,3),(766,56,4),(57,57,1),(257,57,2),(512,57,3),(767,57,4),(58,58,1),(258,58,2),(513,58,3),(768,58,4),(59,59,1),(259,59,2),(514,59,3),(769,59,4),(60,60,1),(260,60,2),(515,60,3),(770,60,4),(61,61,1),(261,61,2),(516,61,3),(771,61,4),(62,62,1),(262,62,2),(517,62,3),(772,62,4),(63,63,1),(263,63,2),(518,63,3),(773,63,4),(64,64,1),(264,64,2),(519,64,3),(774,64,4),(65,65,1),(265,65,2),(520,65,3),(775,65,4),(66,66,1),(266,66,2),(521,66,3),(776,66,4),(67,67,1),(267,67,2),(522,67,3),(777,67,4),(68,68,1),(268,68,2),(523,68,3),(778,68,4),(69,69,1),(269,69,2),(524,69,3),(779,69,4),(70,70,1),(270,70,2),(525,70,3),(780,70,4),(71,71,1),(271,71,2),(526,71,3),(781,71,4),(72,72,1),(272,72,2),(527,72,3),(782,72,4),(73,73,1),(273,73,2),(528,73,3),(783,73,4),(74,74,1),(274,74,2),(529,74,3),(784,74,4),(75,75,1),(275,75,2),(530,75,3),(785,75,4),(76,76,1),(276,76,2),(531,76,3),(786,76,4),(77,77,1),(277,77,2),(532,77,3),(787,77,4),(78,78,1),(278,78,2),(533,78,3),(788,78,4),(79,79,1),(279,79,2),(534,79,3),(789,79,4),(80,80,1),(280,80,2),(535,80,3),(790,80,4),(81,81,1),(281,81,2),(536,81,3),(791,81,4),(82,82,1),(282,82,2),(537,82,3),(792,82,4),(83,83,1),(283,83,2),(538,83,3),(793,83,4),(84,84,1),(284,84,2),(539,84,3),(794,84,4),(85,85,1),(285,85,2),(540,85,3),(795,85,4),(86,86,1),(286,86,2),(541,86,3),(796,86,4),(87,87,1),(287,87,2),(542,87,3),(797,87,4),(88,88,1),(288,88,2),(543,88,3),(798,88,4),(89,89,1),(289,89,2),(544,89,3),(799,89,4),(90,90,1),(290,90,2),(545,90,3),(800,90,4),(91,91,1),(291,91,2),(546,91,3),(801,91,4),(92,92,1),(292,92,2),(547,92,3),(802,92,4),(93,93,1),(293,93,2),(548,93,3),(803,93,4),(94,94,1),(294,94,2),(549,94,3),(804,94,4),(95,95,1),(295,95,2),(550,95,3),(805,95,4),(96,96,1),(296,96,2),(551,96,3),(806,96,4),(97,97,1),(297,97,2),(552,97,3),(807,97,4),(98,98,1),(298,98,2),(553,98,3),(808,98,4),(99,99,1),(299,99,2),(554,99,3),(809,99,4),(100,100,1),(300,100,2),(555,100,3),(810,100,4),(101,101,1),(301,101,2),(556,101,3),(811,101,4),(102,102,1),(302,102,2),(557,102,3),(812,102,4),(103,103,1),(303,103,2),(558,103,3),(813,103,4),(104,104,1),(304,104,2),(559,104,3),(814,104,4),(105,105,1),(305,105,2),(560,105,3),(815,105,4),(106,106,1),(306,106,2),(561,106,3),(816,106,4),(107,107,1),(307,107,2),(562,107,3),(817,107,4),(108,108,1),(308,108,2),(563,108,3),(818,108,4),(109,109,1),(309,109,2),(564,109,3),(819,109,4),(110,110,1),(310,110,2),(565,110,3),(820,110,4),(111,111,1),(311,111,2),(566,111,3),(821,111,4),(112,112,1),(312,112,2),(567,112,3),(822,112,4),(113,113,1),(313,113,2),(568,113,3),(823,113,4),(114,114,1),(314,114,2),(569,114,3),(824,114,4),(115,115,1),(315,115,2),(570,115,3),(825,115,4),(116,116,1),(316,116,2),(571,116,3),(826,116,4),(117,117,1),(317,117,2),(572,117,3),(827,117,4),(118,118,1),(318,118,2),(573,118,3),(828,118,4),(119,119,1),(319,119,2),(574,119,3),(829,119,4),(120,120,1),(320,120,2),(575,120,3),(830,120,4),(121,121,1),(321,121,2),(576,121,3),(831,121,4),(122,122,1),(322,122,2),(577,122,3),(832,122,4),(123,123,1),(323,123,2),(578,123,3),(833,123,4),(124,124,1),(324,124,2),(579,124,3),(834,124,4),(125,125,1),(325,125,2),(580,125,3),(835,125,4),(126,126,1),(326,126,2),(581,126,3),(836,126,4),(127,127,1),(327,127,2),(582,127,3),(837,127,4),(128,128,1),(328,128,2),(583,128,3),(838,128,4),(129,129,1),(329,129,2),(584,129,3),(839,129,4),(130,130,1),(330,130,2),(585,130,3),(840,130,4),(131,131,1),(331,131,2),(586,131,3),(841,131,4),(132,132,1),(332,132,2),(587,132,3),(842,132,4),(133,133,1),(333,133,2),(588,133,3),(843,133,4),(134,134,1),(334,134,2),(589,134,3),(844,134,4),(135,135,1),(335,135,2),(590,135,3),(845,135,4),(136,136,1),(336,136,2),(591,136,3),(846,136,4),(137,137,1),(337,137,2),(592,137,3),(847,137,4),(138,138,1),(338,138,2),(593,138,3),(848,138,4),(139,139,1),(339,139,2),(594,139,3),(849,139,4),(140,140,1),(340,140,2),(595,140,3),(850,140,4),(141,141,1),(341,141,2),(596,141,3),(851,141,4),(142,142,1),(342,142,2),(597,142,3),(852,142,4),(143,143,1),(343,143,2),(598,143,3),(853,143,4),(144,144,1),(344,144,2),(599,144,3),(854,144,4),(145,145,1),(345,145,2),(600,145,3),(855,145,4),(146,146,1),(346,146,2),(601,146,3),(856,146,4),(147,147,1),(347,147,2),(602,147,3),(857,147,4),(148,148,1),(348,148,2),(603,148,3),(858,148,4),(149,149,1),(349,149,2),(604,149,3),(859,149,4),(150,150,1),(350,150,2),(605,150,3),(860,150,4),(151,151,1),(351,151,2),(606,151,3),(861,151,4),(152,152,1),(352,152,2),(607,152,3),(862,152,4),(153,153,1),(353,153,2),(608,153,3),(863,153,4),(154,154,1),(354,154,2),(609,154,3),(864,154,4),(155,155,1),(355,155,2),(610,155,3),(865,155,4),(156,156,1),(356,156,2),(611,156,3),(866,156,4),(157,157,1),(357,157,2),(612,157,3),(867,157,4),(158,158,1),(358,158,2),(613,158,3),(868,158,4),(159,159,1),(359,159,2),(614,159,3),(869,159,4),(160,160,1),(360,160,2),(615,160,3),(870,160,4),(161,161,1),(361,161,2),(616,161,3),(871,161,4),(162,162,1),(362,162,2),(617,162,3),(872,162,4),(163,163,1),(363,163,2),(618,163,3),(873,163,4),(164,164,1),(364,164,2),(619,164,3),(874,164,4),(165,165,1),(365,165,2),(620,165,3),(875,165,4),(166,166,1),(366,166,2),(621,166,3),(876,166,4),(167,167,1),(367,167,2),(622,167,3),(877,167,4),(168,168,1),(368,168,2),(623,168,3),(878,168,4),(169,169,1),(369,169,2),(624,169,3),(879,169,4),(170,170,1),(370,170,2),(625,170,3),(880,170,4),(171,171,1),(371,171,2),(626,171,3),(881,171,4),(172,172,1),(372,172,2),(627,172,3),(882,172,4),(173,173,1),(373,173,2),(628,173,3),(883,173,4),(174,174,1),(374,174,2),(629,174,3),(884,174,4),(175,175,1),(375,175,2),(630,175,3),(885,175,4),(176,176,1),(376,176,2),(631,176,3),(886,176,4),(177,177,1),(377,177,2),(632,177,3),(887,177,4),(178,178,1),(378,178,2),(633,178,3),(888,178,4),(179,179,1),(379,179,2),(634,179,3),(889,179,4),(180,180,1),(380,180,2),(635,180,3),(890,180,4),(181,181,1),(381,181,2),(636,181,3),(891,181,4),(182,182,1),(382,182,2),(637,182,3),(892,182,4),(183,183,1),(383,183,2),(638,183,3),(893,183,4),(184,184,1),(384,184,2),(639,184,3),(894,184,4),(185,185,1),(385,185,2),(640,185,3),(895,185,4),(186,186,1),(386,186,2),(641,186,3),(896,186,4),(187,187,1),(387,187,2),(642,187,3),(897,187,4),(188,188,1),(388,188,2),(643,188,3),(898,188,4),(189,189,1),(389,189,2),(644,189,3),(899,189,4),(190,190,1),(390,190,2),(645,190,3),(900,190,4),(191,191,1),(391,191,2),(646,191,3),(901,191,4),(192,192,1),(392,192,2),(647,192,3),(902,192,4),(193,193,1),(393,193,2),(648,193,3),(903,193,4),(194,194,1),(394,194,2),(649,194,3),(904,194,4),(195,195,1),(395,195,2),(650,195,3),(905,195,4),(196,196,1),(396,196,2),(651,196,3),(906,196,4),(197,197,1),(397,197,2),(652,197,3),(907,197,4),(198,198,1),(398,198,2),(653,198,3),(908,198,4),(199,199,1),(399,199,2),(654,199,3),(909,199,4),(200,200,1),(400,200,2),(655,200,3),(910,200,4);
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto_acquistato`
--

DROP TABLE IF EXISTS `posto_acquistato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto_acquistato` (
  `id_acquisto` int NOT NULL,
  `id_posto` int NOT NULL,
  PRIMARY KEY (`id_acquisto`,`id_posto`),
  KEY `id_posto` (`id_posto`),
  CONSTRAINT `posto_acquistato_ibfk_1` FOREIGN KEY (`id_acquisto`) REFERENCES `acquisto` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posto_acquistato_ibfk_2` FOREIGN KEY (`id_posto`) REFERENCES `posto` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto_acquistato`
--

LOCK TABLES `posto_acquistato` WRITE;
/*!40000 ALTER TABLE `posto_acquistato` DISABLE KEYS */;
INSERT INTO `posto_acquistato` VALUES (1,60),(2,150),(3,202),(4,395);
/*!40000 ALTER TABLE `posto_acquistato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'Sala 1'),(2,'Sala 2'),(3,'Sala 3'),(4,'Sala 4');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spettacolo`
--

DROP TABLE IF EXISTS `spettacolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spettacolo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_sala` int NOT NULL,
  `data` date NOT NULL,
  `orario` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `spettacolo_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `spettacolo_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spettacolo`
--

LOCK TABLES `spettacolo` WRITE;
/*!40000 ALTER TABLE `spettacolo` DISABLE KEYS */;
INSERT INTO `spettacolo` VALUES (2,20,1,'2025-03-26','17:30:00'),(3,22,1,'2025-03-27','17:30:00'),(4,20,1,'2025-03-28','22:30:00'),(5,21,1,'2025-03-29','17:30:00'),(6,12,1,'2025-03-30','20:00:00'),(7,23,2,'2025-03-27','17:30:00'),(8,12,2,'2025-03-28','15:00:00'),(10,8,2,'2025-03-30','17:30:00'),(11,19,2,'2025-03-31','20:00:00'),(12,9,3,'2025-03-28','17:30:00'),(13,26,3,'2025-03-29','17:30:00'),(14,7,3,'2025-03-30','15:00:00'),(15,19,3,'2025-03-31','20:00:00'),(16,14,3,'2025-04-01','22:30:00'),(17,26,4,'2025-03-29','17:30:00'),(18,25,4,'2025-03-30','20:00:00'),(19,16,4,'2025-03-31','20:00:00'),(20,18,4,'2025-04-01','15:00:00'),(21,17,4,'2025-04-02','22:30:00');
/*!40000 ALTER TABLE `spettacolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `consenso_newsletter` tinyint(1) DEFAULT '0',
  `data_registrazione` datetime DEFAULT CURRENT_TIMESTAMP,
  `foto_profilo` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (6,'abdessamad','ghazouline','prova@gmail.com','$2a$10$UH33iYKs29cppveD9dkHweckphnnDSNaS1.iC3dso/s0WFZ8x70pu',0,'2025-03-25 15:18:13','https://storage.googleapis.com/pod_public/1300/183549.jpg',1),(7,'LavoroGruppo','LavoroGruppo','LavoroGruppo@gmail.com','$2a$10$b9BHCSGFyIV0rnsJ.BSf3.fzpHs1ATstDMt4U0WiVjc1b7jZ3XFse',1,'2025-03-25 15:19:59',NULL,0);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `id_film` int NOT NULL,
  `data_inserimento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_watchlist_utente` (`id_utente`),
  KEY `fk_watchlist_film` (`id_film`),
  CONSTRAINT `fk_watchlist_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_watchlist_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 11:24:19
