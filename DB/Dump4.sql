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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
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
  `genere` varchar(50) DEFAULT NULL,
  `nazione` varchar(50) NOT NULL,
  `vintage` tinyint(1) NOT NULL DEFAULT '0',
  `check_uscita` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (6,'Troubleshooters','Due migliori amici falliti di Tirana sognano di diventare i migliori investigatori privati ​​albanesi.','https://www.youtube.com/watch?v=Y3d4t8Wk8nY',120,'2024-12-12','https://www.ucicinemas.it/media/movie/l/2024/alb-troubleshooters.jpg','Azione','USA',0,1),(7,'Mickey 17','L’improbabile eroe Mickey Barnes (Robert Pattinson) si ritrova nella particolare circostanza di prestare servizio ad un titolare che esige l’impegno definitivo sul lavoro… ovvero morire, per vivere.','https://www.youtube.com/watch?v=ZjMNjRVDjDI&pp=ygUVbWlja2V5IDE3IHRyYWlsZXIgaXRh',140,'2025-03-06','https://www.ucicinemas.it/media/movie/m/2025/ov-mickey-17.jpg','Fantascienza','USA',0,1),(8,'Snow White','Una rivisitazione musicale live-action del classico film del 1937. La magica avventura musicale torna alla storia senza tempo con gli amati personaggi Mammolo, Dotto, Cucciolo, Brontolo, Gongolo, Pisolo e Eolo.','https://www.youtube.com/watch?v=iV46TJKL8cU&pp=ygUSc25vdyB3aGl0ZSB0cmFpbGVy',115,'2025-06-20','https://www.ucicinemas.it/media/movie/l/2025/sala-xl-biancaneve-2025.jpg','Fantasy','USA',0,1),(9,'The Monkey','In soffitta c\'è una scimmietta giocattolo un po\' misteriosa. Apparteneva al papà dei gemelli Hal e Bill che, da bambini, la ritrovano e ne azionano il meccanismo ruotando la chiave nella schiena. È l\'inizio di una serie di morti orribili che distrugge la loro famiglia.','https://youtu.be/lT_yfGzUAwY',125,'2025-06-20','https://pad.mymovies.it/filmclub/2024/10/127/locandina.jpg','Horror','UK',0,1),(10,'Dog Man','Un agente di polizia fa coppia con il cane Greg ed è costantemente all\'inseguimento del malvagio gatto Gino (in originale Petey). Insieme sono la coppia perfetta: l\'umano conosce il kung fu ma non è molto perspicace; Greg è la mente investigativa, seppur in un corpo da cane.','https://www.youtube.com/watch?v=onB9yrRe2JQ&pp=ygUORE9HTUFOIHRyYWlsZXI%3D',100,'2025-01-30','https://pad.mymovies.it/filmclub/2024/07/046/locandina.jpg','Animazione','USA',0,1),(11,'Follemente','Lara e Piero si incontrano per il loro primo appuntamento, si piacciono ma non osano confessarlo (nemmeno a se stessi), incartandosi su ogni dettaglio, impegnati ad ascoltare le voci interiori delle loro rispettive personalità. Riusciranno a zittire quel chiacchiericcio incessante e a trovare la strada verso una relazione finalmente appagante?','https://www.youtube.com/watch?v=pBBE1uSJMV0&pp=ygUSZm9sbGVtZW50ZSB0cmFpbGVy',105,'2025-02-20','https://pad.mymovies.it/filmclub/2024/06/080/locandinapg1.jpg','Commedia','Italia',0,0),(12,'A Different Man','Edward vive a New York con l\'ambizione di fare l\'attore, ma il suo aspetto fisico è pesantemente condizionato dalla neurofibromatosi che gli segna il volto.','https://www.youtube.com/watch?v=NP49Fiz2-X0&pp=ygUXYSBkaWZmZXJlbnQgbWFuIHRyYWlsZXI%3D',125,'2025-03-20','https://pad.mymovies.it/filmclub/2024/01/273/locandina.jpg','Drammatico','USA',0,0),(13,'A Real Pain','David e Benji, due cugini diversissimi tra loro, si ritrovano all\'aeroporto. Il primo vive a Brooklyn, è sposato e ha un figlio. Il secondo è uno spirito più libero dal carattere imprevedibile. Nati a tre settimane di distanza, sono stati molto legati durante l\'infanzia, poi la loro vita ha preso strade divergenti. Hanno così deciso di partire per la Polonia per onorare la loro amata nonna Dory scomparsa da poco e connettersi con la sua storia passata.','https://www.youtube.com/watch?v=lMp79UBWpu4&pp=ygUXYSByZWFsIHBhaW4gdHJhaWxlciBpdGE%3D',115,'2025-02-27','https://pad.mymovies.it/filmclub/2024/02/020/locandinapg2.jpg','Drammatico','USA',0,1),(14,'Bridget Jones: Un Amore Di Ragazzo','Bridget Jones ce l\'aveva fatta, era diventata la signora Darcy, ma ora Mark non c\'è più, è rimasto ucciso in una missione umanitaria in Sudan, e lei è costretta a destreggiarsi da anni tra il dolore per il lutto e l\'esigenza di crescere nel miglior modo possibile i loro figli, Billy e Mabel. Per uscire dal limbo emotivo e cercare di far ripartire la propria vita, accetta di iscriversi a Tinder, dove inizia una fitta conversazione con il giovanissimo Roxster. Anche il nuovo insegnante di Billy, però, il signor Walliker, sembra osservarla con interesse da una certa distanza.','https://www.youtube.com/watch?v=p9jRpUmmeWw&pp=ygUXdW4gYW1vcmUgZGkgcmFnYXp6byBpdGE%3D',120,'2025-03-01','https://pad.mymovies.it/filmclub/2024/04/115/locandinapg1.jpg','Romantico','UK',0,1),(15,'Captain America: Brave New World','L\'ex Generale Thaddeus \"Thunderbolt\" Ross è divenuto presidente degli Stati Uniti con una campagna elettorale all\'insegna dell\'unità del Paese e la sua collaborazione con il nuovo Capitan America sembra migliorare di giorno in giorno. Dopo una missione completata con successo contro i Mercenari dei Serpenti, Sam Wilson viene infatti invitato alla Casa Bianca, accompagnato dal nuovo Falcon, Joaquin Torres, e dal Capitan America dimenticato della Guerra di Corea, vittima per decenni di esperimenti governativi: Isaiah Bradley.','https://www.youtube.com/watch?v=RSIkXjNpwTo&pp=ygUrY2FwdGFpbiBhbWVyaWNhIGJyYXZlIG5ldyB3b3JsZCB0cmFpbGVyIGl0YQ%3D%3D',130,'2025-02-17','https://pad.mymovies.it/filmclub/2022/07/117/locandina.jpg','Azione','USA',0,1),(16,'Diamanti','Fine anni \'70. Alberta e Gabriella Canova sovrintendono una grande sartoria specializzata in costumi per il cinema e il teatro: un microcosmo tutto al femminile. Ne fanno parte la capo sarta Nina (con un figlio hikikomori ante litteram), la ricamatrice Eleonora (vedova con una nipote ribelle), Beatrice la tingitrice, la modista Paolina con un figlio piccolo che si nasconde nella stanza dei bottoni, le sarte Nicoletta (picchiata dal marito) e Fausta, single ironica, più l\'ultima arrivata Giuseppina. La cuoca del palazzo, l\'ex ballerina Silvana, ha una parola di conforto per tutti.','https://www.youtube.com/watch?v=XnKybuHa7-4&pp=ygUUZGlhbWFudGkgdHJhaWxlciBpdGE%3D',100,'2024-12-19','https://pad.mymovies.it/filmclub/2024/07/062/locandinapg1.jpg','Drammatico','Italia',0,1),(17,'Elfkins - Missione Gadget','La giovane e curiosa Elfie vive con il suo clan di Elfkins (gnomi dai cappelli a punta che, secondo un\'antica leggenda, aiutano gli umani nel lavoro) nella mansarda di una pasticceria di Colonia, uscendo solo di notte per svolgere il proprio compito. Elfie, però, è annoiata dalla solita routine e desidera nuove avventure. La svolta arriva quando incontra Bo, di un altro clan di Elfkins provenienti da Vienna, dotati di gadget super-tecnologici per compiere scherzi e furti in città. Elfie si unisce a loro e cerca di riconciliare i due gruppi rivali, ma deve anche sfuggire a una poliziotta e al suo gatto.','https://www.youtube.com/watch?v=riCt-m0C-Po&pp=ygUjZWxma2lucyBtaXNzaW9uZSBnYWRnZXQgdHJhaWxlciBpdGE%3D',95,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/038/locandina.jpg','Animazione','Germania',0,1),(18,'Gioco Pericoloso','Roma. Carlo Paris è un celebre critico d\'arte e la sua compagna è la bellissima ballerina Giada. Durante un vernissage, Carlo si imbatte in Peter Drago, un artista che attira le sue simpatie e che si fermerà nella dependance della casa al mare a Sabaudia. Presto emerge che tra Peter e Giada c\'è un passato comune; inoltre, l\'uomo ha un\'agenda segreta ed è intenzionato a giocare con i destini di entrambi. Sullo sfondo, l\'ambiente dell\'arte contemporanea, con rivalità e manipolazioni in nome dell\'arte.','https://www.youtube.com/watch?v=kptFhyFVlY8&pp=ygUcZ2lvY28gcGVyaWNvbG9zbyB0cmFpbGVyIGl0YQ%3D%3D',120,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/130/locandina.jpg','Thriller','Italia',0,1),(19,'Heretic','Sorella Paxton e Sorella Barnes sono due giovani missionarie mormoni che, porta a porta, predicano il proprio credo. Quando entrano nella casa del signor Reed, durante un temporale, non sanno di trovarsi nella tana del lupo: l\'apparente interesse dell\'uomo nasconde oscure deviazioni e terribili trappole pronte a incastrarle.','https://www.youtube.com/watch?v=cBEyjWAVnXA&pp=ygUTaGVyZXRpYyB0cmFpbGVyIGl0YQ%3D%3D',130,'2025-02-27','https://pad.mymovies.it/filmclub/2024/10/104/locandina.jpg','Horror','USA',0,1),(20,'Il Nibbio','4 febbraio 2005. Nicola Calipari, alto dirigente del SISMI, parte per le vacanze con la famiglia ma viene richiamato a Roma: la giornalista Giuliana Sgrena è stata rapita a Baghdad. Per 28 giorni Calipari, soprannominato \"il Nibbio\", farà la spola tra l\'Iraq presidiato dall\'esercito USA e i Servizi Segreti italiani, cercando di negoziare la liberazione di Sgrena.','https://www.youtube.com/watch?v=WFxQC73mY5c&pp=ygUVaWwgbnViYmlvIHRyYWlsZXIgaXRh',105,'2025-03-06','https://pad.mymovies.it/filmclub/2024/03/136/locandinapg1.jpg','Drammatico','Italia',0,1),(21,'La Città Proibita','Cina, 1979. Due genitori sfuggono alla legge del figlio unico mettendo al mondo le bambine Yun e Mei. Mei, la secondogenita, è costretta a vivere nascosta. A metà anni Novanta, Mei si ritrova a Roma, nel quartiere multietnico dell\'Esquilino, in un ristorante cinese dal nome La città proibita: lì spera di scoprire che fine abbia fatto la sorella Yun, diventata prostituta. Incrocerà i destini di Marcello, giovane cuoco di cucina romana che gestisce un locale rivale insieme a sua madre Lorena, e di Annibale, amico fraterno del padre di Marcello e ostile alla presenza cinese che sente come \"invasione\".','https://www.youtube.com/watch?v=W2xZ_VkzQlo&pp=ygUebGEgY2l0dMOgIHByb2liaXRhIHRyYWlsZXIgaXRh',140,'2025-03-13','https://pad.mymovies.it/filmclub/2024/07/058/locandinapg1.jpg','Azione','Italia',0,1),(22,'Lee Miller','Elizabeth \"Lee\" Miller, dopo una carriera come modella e musa del surrealista Man Ray, decide di partire come fotoreporter di guerra durante la Seconda Guerra Mondiale, testimoniando le condizioni dei prigionieri e il coraggio delle ausiliarie al fronte. Riporterà a casa una sindrome da stress post traumatico che la accompagnerà per tutta la vita.','https://www.youtube.com/watch?v=bsfpfblDlwI&pp=ygUWbGVlIG1pbGxlciB0cmFpbGVyIGl0YQ%3D%3D',115,'2025-03-13','https://pad.mymovies.it/filmclub/2024/05/022/locandinapg1.jpg','Biografico','UK',0,1),(23,'Nella Tana Dei Lupi 2: Pantera','Sono passati due anni dal colpo alla Federal Reserve: la banda di Merrimen è stata decimata e l\'unità Major Crimes dello sceriffo è in macerie. \"Big Nick\" O\'Brien è separato, al verde, senza squadra, ma il recente furto all\'aeroporto di Anversa sembra opera di Donnie, l\'ideatore della rapina di Los Angeles. Giunto in Europa, Nick capisce che tutto converge sul World Diamond Center di Nizza, dove Donnie ha trovato nuovi alleati nella spietata banda della Pantera.','https://www.youtube.com/watch?v=dPlCcDXxnl8&pp=ygUhbmVsbGEgdGFuYSBkZWkgbHVwaSAyIHRyYWlsZXIgaXRh',135,'2025-03-06','https://pad.mymovies.it/filmclub/2024/09/099/locandinapg1.jpg','Azione','USA',0,1),(24,'Paddington In Peru','Judy e Jonathan stanno per lasciare casa, e la signora Brown teme la fine di quei momenti familiari tutti insieme sul divano. Ma l\'orso Paddington riceve una lettera: la zia Lucy, in Perù, non sta bene. L\'intera famiglia Brown, Signora Bird compresa, parte alla volta del Sudamerica per rivederla. Avventure e imprevisti non tarderanno ad arrivare.','https://www.youtube.com/watch?v=x8Fhxnp_CYI&pp=ygUecGFkZGluZ3RvbiBpbiBwZXJ1IHRyYWlsZXIgaXRh',100,'2025-02-20','https://pad.mymovies.it/filmclub/2021/02/174/locandinapg1.jpg','Animazione','UK',0,1),(25,'The Alto Knights - I Due Volti Del Crimine','Metà del secolo scorso: Frank Costello e Vito Genovese, entrambi immigrati italiani e divenuti boss mafiosi a New York, si ritrovano in lotta per il controllo della Famiglia Luciano. Costello, diplomatico e calcolatore, ha preso il comando mentre Genovese era in fuga in Italia. Ora che Genovese è tornato, pretende da Frank ciò che considera suo. Tra omicidi, processi e guerre di potere, la posta in gioco non è mai stata così alta.','https://www.youtube.com/watch?v=IIES5s-Y22c&pp=ygUcdGhlIGFsdG8ga25pZ2h0cyB0cmFpbGVyIGl0YQ%3D%3D',125,'2025-03-20','https://pad.mymovies.it/filmclub/2023/04/074/locandinapg1.jpg','Crime','USA',0,1),(26,'Un Posto Sicuro','In un mondo devastato da una pandemia misteriosa e mortale, cinque sopravvissuti si rifugiano in una villa isolata. Ma non sono soli: presenze inquietanti, chiamate \"OMBRA\", iniziano a minacciare la loro sanità mentale. La villa diventa una prigione di paranoia e tensione, mentre affiorano verità sulla pandemia e sul destino dell’umanità. La speranza lotta contro l’oscurità in un disperato tentativo di sopravvivenza.','https://www.youtube.com/watch?v=zAt53yNqghU&pp=ygUbdW4gcG9zdG8gc2ljdXJvIHRyYWlsZXIgaXRh',115,'2025-03-13','https://pad.mymovies.it/filmclub/2025/02/150/locandina.jpg','Drammatico','Italia',0,1);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
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
INSERT INTO `giudizio` VALUES (2,7,NULL,5,'prova commento!','2025-03-25 15:20:46'),(3,6,NULL,4,'prova 2!','2025-03-25 15:21:24'),(4,6,6,5,'provaCommento','2025-03-25 16:04:43'),(5,6,7,5,'prova commento2','2025-03-25 16:05:10'),(6,7,7,3,'prova commento 3 stelle.','2025-03-25 16:06:05'),(7,6,10,5,'prova commento 5 stelle.','2025-03-25 16:27:36'),(8,7,10,1,'non mi piace','2025-03-25 16:28:10');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spettacolo`
--

LOCK TABLES `spettacolo` WRITE;
/*!40000 ALTER TABLE `spettacolo` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (6,'abdessamad','ghazouline','prova@gmail.com','$2a$10$UH33iYKs29cppveD9dkHweckphnnDSNaS1.iC3dso/s0WFZ8x70pu',0,'2025-03-25 15:18:13','https://i.pinimg.com/736x/19/d4/26/19d426a4ec158169e12675f014f51f5d.jpg'),(7,'LavoroGruppo','LavoroGruppo','LavoroGruppo@gmail.com','$2a$10$b9BHCSGFyIV0rnsJ.BSf3.fzpHs1ATstDMt4U0WiVjc1b7jZ3XFse',1,'2025-03-25 15:19:59',NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 21:50:46
