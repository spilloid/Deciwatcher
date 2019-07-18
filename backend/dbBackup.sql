-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DBReadings`
--

DROP TABLE IF EXISTS `DBReadings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBReadings` (
  `PrimaryID` bigint(255) NOT NULL AUTO_INCREMENT,
  `IoTSensor` bigint(255) NOT NULL,
  `Decibels` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PrimaryID`),
  KEY `IoTSensor` (`IoTSensor`),
  CONSTRAINT `DBReadings_ibfk_1` FOREIGN KEY (`IoTSensor`) REFERENCES `IoTSensors` (`PrimaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBReadings`
--

LOCK TABLES `DBReadings` WRITE;
/*!40000 ALTER TABLE `DBReadings` DISABLE KEYS */;
INSERT INTO `DBReadings` VALUES (1,1,100,'2019-03-02 12:03:49'),(2,1,200,'2019-03-04 12:04:06'),(3,2,0,'2019-03-01 12:41:08'),(4,2,5,'2019-03-04 12:41:18');
/*!40000 ALTER TABLE `DBReadings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IoTSensors`
--

DROP TABLE IF EXISTS `IoTSensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IoTSensors` (
  `PrimaryID` bigint(255) NOT NULL AUTO_INCREMENT,
  `SensorName` varchar(255) COLLATE utf8_bin NOT NULL,
  `Location` varchar(255) COLLATE utf8_bin NOT NULL,
  `Picture` blob NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`PrimaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IoTSensors`
--

LOCK TABLES `IoTSensors` WRITE;
/*!40000 ALTER TABLE `IoTSensors` DISABLE KEYS */;
INSERT INTO `IoTSensors` VALUES (1,'FakeSensor1','The Moon','RIFFr%\0\0WEBPVP8X\n\0\0\0 \0\0\0Û\0\0Ð\0\0ICCP0\0\0\0\00ADBE\0\0mntrRGB XYZ Ï\0\0\0\0\0\0\0\0acspAPPL\0\0\0\0none\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ncprt\0\0\0ü\0\0\02desc\0\00\0\0\0kwtpt\0\0œ\0\0\0bkpt\0\0°\0\0\0rTRC\0\0Ä\0\0\0gTRC\0\0Ô\0\0\0bTRC\0\0ä\0\0\0rXYZ\0\0ô\0\0\0gXYZ\0\0\0\0\0bXYZ\0\0\0\0\0text\0\0\0\0Copyright 1999 Adobe Systems Incorporated\0\0\0desc\0\0\0\0\0\0\0Adobe RGB (1998)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0XYZ \0\0\0\0\0\0œ\0\0O¥\0\0üXYZ \0\0\0\0\0\04\0\0 ,\0\0•XYZ \0\0\0\0\0\0&1\0\0/\0\0¾œVP8 #\0\0Ðo\0*Ü\0Ñ\0>E‹C¢¡¡»%p(D´·p¸˜¹Õ´ò>øþúïÞ˜OëßP›þ@ÆS\">?êîO5/¾ìbÛÿØú{ÙøOE<ìäïýÏÁÈöý;ÿ{Ù·üþßv>Ô?^ÿkìûéÛì‹÷“Ùö“ÿj&í&µ÷®šÂF¥\ZÁß”ë,Åïãà+\0Äƒ?Ñ×¹Ù‰[<ÿÞùgöuø>ê•a‚ÙŸ3¢8«ø6k…ž&¨<j›¶·¯õÎ`X{ÿçÎ]˜#6D\Zo¾.X	´ðu0F	&h~ïš~Ä{ÝÒ9Z^äf3A®¾MàV—qÈ¡vC+$`ä¸ÊØ©ç~‘ôŽ:Ûïã‚C5\\\rôøÓµ×ÑfHÈB„X~¦¸ýî8ƒg³’$ÅuÑ‘j†ÞÓ£ŠN´íÛQ.²ÔÐŒ=;‰Ç›&Û‚£…Â†µGM¯™zøUçÁ1ˆZóoõAÐ>{OT\ZV¶D:†=Ð”¹Ì|øù³³´ãh˜¾Ï°ioc=Ÿ5[Ù†•ªZ€}y\r™ÑR‚ðžX—˜6˜/îâM}Ó¦;Œ¦¤ÛŸôHú“[ÖœÝ‰„°:°]“ï;ÕÛf$.£ËÝúÂÝX¿ë+‹ªÆl%Ã\'·£‰‡’\råÅùgw\'G3\\•bÜç}axZÏ»êÛ*PJ|ˆ¶ª“õŠÙÃ7Ã¹çÐêCãæ¿ÇŒ¡±zöíÝ+ÛxÐbí¸ÇÄÍ1©ÊË†yÕ4ï^<gM»†ÁúvÍÆŸI`±_´§d2é¿äe+ê#/VpÜKÔÞÓ(Ï1ñ¿N*†ú˜^LÉ™Âêv	]Ê;Pì|Ê}÷\nÝ×hrãX!ð\0<§$4`±Ô^pÆÔžžA¿6ÊåmŽC‹(Fž´OqrWXQlž:ª#>úe™Ø¯>róN	l7q@ýñc[£\'ŒÑ9®*V]1UœõÓlgIQ1Ô¬]ãù˜¤¢}Ž3ßG¤ïz¬ÎŸÊ¼goÒÒubI”k{!¹³^ÿxIâj=Í€€š:KV²Á?&r­Ð5*…˜/ß{¤-€Ãö1-[Ül¬[CQ/½:»aüßÿšž½´úâ$D,«mÇã\"Îp«ö-hVp\nXH,TÚß®Z¿”nÒeg€\0þÿ»!`tŒ£¸Iª~«ï¯/b†Jæ\Zb:jâÈÖl€uˆâäÍ%sp÷jêÇ²{Yè¢Vœª¿ô<§ºÌõ0xs+¬ØåÊeóÅcÿâóý3©ý¯xtÖµ«Ë”V¡yo¨®mrfö$ìq‡¡˜ÜdÞ¥ÉA}\\\Z³æ´ÈGf×‚°T•_ÖÓgÅ4%Ì°úŸ÷¿6‡BÖØYžŽ£	CMA·På£c.@MNéÑ~{F\rnKMß\"µS¾¢zÇ$Û`<âä1¨§Ùtêkéð¨ûZ$‰úû–˜’ÐŒ‹2µÂŽ\ZW*£È7Á[ù)ûE7ÕÑ²ná4º	ïBisVu1‹>¦(lZOžQÕ\ZÍÙ‰=y²ÆÕ·Ò×ka’Ë1ÖÙr®Ü+Û¯YÁ»ðípòoßŠú¶²2e©ÉX3(R‹(„¡FûÅ}2Ý-¿2æ‘û3u3ë5?×•¨f·Å|a4@	Œ=\"hÈ¢©Z¬Šíz5&Ü[[})ÇPìx’RñÕ~z{²Iä8õ\r0;Ó\rbGª$æµÏóK½âÝ5R\nÛ½¬_%“tnLmQ8éŽðå\0ê©¨Vðÿ÷NPZ§$OŸ—qT7Ï<,\"T«m5\"Ÿ;ö°WöOuÌød†Dr¨sf*Ù—§áF\"Åíÿ^Í~ÕLæÇûñgÅÿÕ´3ø$?ºâ	ë<¡”Å·;QìxÒlð¼š›Íÿì¿_P£|œi„²e2/·w\0Ä·r‰s.c|˜Ùÿ–¸ukH–iäB›bEÍDLÐ·|ÿnð±=÷P6eñ\\_à«8üÏºEäAæ·6òé:©õt˜¶àY›=@–‘—üTN\'žŸÉI§ö§¼ÒTfÛL®Ù\\bánR$›Ñ)î\0÷Ó`¾tŠEUßkœh(‰•wx?ÄÖq¡ÄZ-›`´ ò°¥ámÎÊš·ûmKç·µÔ|Ù“«‘·<Pdü»´ÔÊ>¤¶&:ÕÞØ«áŽSH°ÈÌ†>ïú£ðÊ¤\"ç¢Ni^#Ø)tÈê¼$/Î4@ÊøøDÎÍ@áÄ:’\ZÚGüØ\nPÆXBÍTf%â\'wÔš$_ïL‹¼ÑJµ^§ž—´\0pOO÷\\¤@ô¬%R>’A¨–ê«(®nEbn­ãx`nls=ÉE+œM«ãyCŒƒ(‚Ü_›¬õëâ°Û¨\\-MF¡v%!î•	Ô¤è^nîY‹Ì¢F“­ü¤a×cä!Dú~ªë…›Nöî‰ëi^ÐúäÏÕUtk—˜Ü¸õ7Ë|AÍlZxñÁ«JoÝ^Æ­yH½¹t3šOÐÔ‹’¹º€ðt68«¨C¹2<âkdŒÆ´kGåKÏ2qØÉ=Rº\0æÊÆ–ÿ¤/>\0H¼bŠ·ì ^†”uÿœi¯Öf8ˆ:{9¯pkb‰õò<œZÜËpÅ\"n\níë.\r`¡B“q‰ŽR¦=Å­–dŠº™öoýœ£!/1¼ØRozP4Ä¢\\v¹†^‘¥jhr $«Ë4:‹®VÃÒ‚\0q¸3–\ns\\Âš¿å¬5ï´0Ÿã‰ÂÑÎ4\r+/áCV\rƒžÖ(^ô=@lÂ<.–ÉMþŸÓ¿B= a!ÆcÔ Q›hž§jQÍ\'$‘u¸ç*fÊÐ8qµ¬)Û_Éç¸D(PJbôêOç6ãß“^Ë}öæ¨†DŒ,óm…Ýµ@‰J%ÌxLl›oúðþy-ß+h+Ó\Z—ÒUÏ§—{p¤owÎz’â¾¡ñ„Z_JÓ_„5Dm­xì©Žð“í1×ÉF¨ELšóÔß:éF6=A±÷éøÐÃêãL\Zð¥!ïåµCË6Á„CÅÐÿSû½‘Mµœ-¿bo?á³€6Iz½¦	›J\'€\\døW}d=	àk¨G–÷gBVÞ.Î|¥©AyÄˆ_¼‰s[ÀsZôÿ¼àQÜ™ÿ‹îæ)$û·TˆP:>ÆèÀCgêg5`™Roˆk˜3ÆéÖJô^6ØHû}\\ÿÁ¨3R_.o‡ÓÈÕ¤ÞãƒCŒ]6¸$:M¨\'³,÷Ÿêr%»îƒ\nƒ\ZŸSÂ¯6þ U‹kÿ|×Æ Õ¬©º•VT“£2·¯IzÏ¿<ÜòÓ	¤°ëÙ\'¿sàu?‹L&SQë5âGõº®ujºÎàžW|cËYCÐÆ2Uê¶y+Wo?>ž°‘ÏêL,Y/•Ææ†éÑÇGô\0`/›ùœTæ§DºéÉ‘£H?ï•â%ž½ ìAÿÉÕ&Â:·%å„Ùw–õäSÝ”ÂÕw:•+–¾ó‘oS²R~\Z±Û\'¥<@Á·)@î±:%·œ¦~5õ /üëÂ^âÙqOj§²+f§ÌÄ“<(íˆx\0¹ÄàÍŒ×1ƒÃÓgÖxž–!¥À¶oh\Zµ8àÿ™@½’¬m\ZÄµà.É‰îm@½?”ÇýŒPm3Š¯Ø´½¶HÎ[lÉUm‡ÃÛý+!¦GÂ:×:à7‹\'>Na»Q•´(ÊuéÈŒð5€J—Ee”J2Æ7N±˜¯cðvF¶¸þä¦xÉ·Áià×f­âüT{[Ý‚‡Ü—´KCT @KaTøâ6‘šš`:2òæ+7S×Q›²¾hþåÕüwÙF8‚a¤pÉ·Çà&Ë¹#aŽg£Š}lÓË£:=ó ´¼@ujyMes\0q~,ÛÈYµÀ…0F,âÊû:¢1ƒhø¦ê\"ã/åI¯°e)3rTœ\'¢nùJUí=8<\nœõä²}ã#/·ÿÝC)ßÄ™Wæh\0ˆ‰bo¶âsä;/2^¬jY\\_ëù7’úJ½þ3,·ù±¤¿Ê¡ï¨ªï»uúu[B#\0šÉËX¿èTùèãx¡š]qS-;5¥e*¼Wo	XÄîž¨‚ÛèË	`ýI)¶·VLóœnæ\0“,7GÚ+@pêÇy\nd$.¸bGIø:Mìfð»¶¦‰}NKË0:—$‰»K+–[½ÚNÛn¨ÑŸì]Ò#â\rÔg‘[Gð|v˜ñ¢Ê{ƒ½Jâð£§›èû‘ša«\ró–õdå¿-þÚöã\0ž\\tÛ)ÒVaw\0FÉ­²ËÇL¥§‘T»Â‹pýïœZî\"ucánM8íjnCÓ+ke;woB°¸Z¥Ýé¸ý«ôñ·ZÞJwà™H›ÇIBû2_4p=|~™õµS­‹W©m¥¯l‚°„šU{Šù?êù\\½µíx¦=Ïºq-u|mÌònq~0ô—ƒµW¸éX\0Ê­iËÈñuË°¸y@“^¿>äœ2xGâÀžæUøÑŸ³P·;^¬ùáåzy\"äæNŠÊ¸ÝÛµW%Czk•÷‹!Oÿà[\r±½_“W;3Ššˆ)ƒŠ5ÙPB*§ØÖ@l‹Ù¬¬œ¿t$¿>PÐz>ÕŽü%Ü§ÓnÉœ\Z§‚­gEP2ËùÜ4·%ÝD¸W`]´ñfç½Ó÷JÏ-\nŸfHW¡§A§æDGÊ—´¿LÄnŸDFˆ(ÑþžíIµ%uŽ/U¤ß?y>î¾äkN‘¥‚/Uÿ\0øAJ&8å“v…Ñ¯yVý!Éá\'H&vŸ¹ø•ÑLBì;_.“e1KŸ2e‹\\\0:ñ@p\"ÒÖÙe-º)™	Q¿É¹‚;!ÔöÑ´ËÚÀõïÜ¥¯B–>uÎñ»Ð|››0xþÂ\n^¹¡®’\0¤˜Pùü0íebºÅl—¾˜Y`ùâ[5:Ü…´ÒêçË\"ç[0µ´àé£D!T•B:°^ÞâË=­m2­Ñþæ,¬‰–¬	üîuÖßÅwS\'\nTõè\0Ô;àSZWôäÌ­Ê•‹lÁè‹ìjœOÀ;¤©y^]ŒÓÄq¼¹ªt0\"¨\rœñYË¦–CTKñ»AKÉÅ(®8ˆ#£¥|#ÞßmåÛ³-CÀªÌœú°Ä³\r³«áõÝoj…–©ÆýÂéMÄÙ\'¿ºQW„a#twb@n¶Ù‚kq,É%ÄOd …ô^û§—ôT¼\0\Zs¹W%Ÿ_ð:fC²2h‰ÌÑ€ŒDŽ{Ô¸‚ÛKßSÑí·-Ž;É@K´ák<	x:aÀ°)íÁ¬\0$g‹6ü·²%q±tX÷…¶$B|@«»?‹Ð\"¼ò&<5^0¸yt:SŸ§€HŸN[ð«¢¬‘*tÆ]·#â`½7˜pÒp¼ÊêÑ1ræçÂ«o4Æ?éàÆÒ’\\é…«´/u•2Qž€¬ˆvoßý·\n«.¹Ø)`Õ–{T_²/øènB¸™`ó*Ò<\r_|¢ˆ5B3ýÓÄdÚ]Q ±:Ñ¨Øþ+ï2|däÆæ[fL®ÚGà–‚@µ\nZiYb+,1ð\\?>†Öõ%QÚ;!¤$ùjÈií“2!ÐX`äùŠRà£q¥Yÿà÷4åøÜ³©fBõ`çnG\"mÙ™ªW÷ªZC›Ô©Y²&yKK¦[XæžkÀõâÃ†\"@x‚Ú¬™{U^Š}Á^xøJú£\Z[È`H¥p€!KœU¥XÖœÚo=¦’ÿ±ºÓR;jÔ|¹÷•ºÝÅ[‘ukaÜ•ïQú:äª,|+dJ»[s)T×5¢k²›	’èF®%LË¤ž WËWÅ{ÍßÌæÚØµòèËÇ±è¶$š\nÅ\rð„|IØÉº“ÿ©2ëMà„>îÉ\"øÛ·þÆk²ÌŽ³Ç\\•=š;ÂžyÉ©®œc9¼«X[~j?äMÖTIGj\ngíˆšRNÄ’l7`;ZóÃ!ÆèÕ¶†\"ÏÂ±lU¦Úo+®€fþÒtßKÉN{¼aI¹!ÔòM†•RO:Ôw|à/¿ÉYÔÓL58œ™ƒÿÂh¥Î£í¡çSÔðZ IÕŽÿ½ê\'eÝÀ¦¥|¬Á4ÍA.øN\rÀÉ+8swÂ\0;ec»\0])Åç\'oôÑAÎÐ2q[²×çøbxõºÈ%ß†Ê±à~Ê¾ôô€õÓy6òç~ÿ’aù0ÍÈ¸CY&lõ0\"³ˆxuEo}™\nWPU_á`ºU@³}g_^J¼¶»þÁ‘Ââ+¦‰gæËˆÐ‡:hž×[©!|ä<,ëŸ–—à\0¿QÝ,_ÜWBÊ}öžÖiÔW»“ˆÑ*IU¡ñPX{Õ-1¼+©•1Dö|dÒ\0yÙ5Ôa‹/¸AÒýxtD»\0–k—sûã vŸæ7ãûv`Ìf–;Ç;)–ðG6wLük(Å!yÊÄ2~ogŒŒ¹åwqÞK¯’YWIßmlTqád.aI™kŽNŒdÓù×»çPSMv*ùœ]íL}¢å§­uìˆ(»¡¼ã1±ÀÞÿ\'Ê\0™“$dL{õ‰ö•\'Þ¯8¨º@#‘€\n­)š¦äÐ‚+”ŒAŒWç¥ä%¬$L¿ò¶Å+ƒé¬Áº¿*õxˆG\nÄì”;T\'Õ£J31GÙ¿-c‹)mŽ6X?üîW•ÕîËx\\Ð~~Ø>ºëpâÇùÇŒà\"Þ?—aAˆ!ÛªÄCO]wôœ”‡«®€Æ®(1ÛÎÑ¬Q[\"p§\'5äùi¼qƒÉvÅ›Â}¿l©)ÿ£„ƒÒ~<,OJß‚Û]—&û ÐðÄoÓas§è4‚hPáöÒÝ#^rILzë5W:æÿ«ç²b>ŸÑ®;¿<z Ï×%¸èû*+Óû,¾wÛöØŸnµ\"âOºþÖü)ç?uî›5¡¢6&ÑÂÕn”¸ªÉ:âìsp‹	ÜÏÏ¿1O~ÑoG2	íB±òi¦¶—Ém—ÔÄmBÁÚ°ÃLä\0;EbNÍÁwªuxî@”8ÒJÝ\\¥´.”Æß3—%Ë½\"R!ÉOÞu@™Öhl&Å×œu	°I¿`\0¤•|‡s“âk`®%Ú_—%èz0ìŒ>DóðÂ­žçÝ]@÷m¯sB,3‘µÞ‚aÓñã±¢>‚­ÆçŽ¦ûƒµø†ÌÌ~Q¥wX<N¡Ø‚>7Íy\Z§~ÔäJ	éÊåØFàçßÌ:ªA_4hoá/í½!-ÙZJ™Á4ð\rHŒ1.%çrS¶ÝVWjˆÙ×XÎ†—cMÒoÈèLPê.»&Jð´a‚˜¶¦3vÇbº,ˆQ>(fÐ(\n‚ù¯R{;—øpdí®z^·%Ý+ŸC‹Eƒª”ú¼\rÞNîåpÒÐh7=úÂ…úº˜ð!‡ËQÂvùUMôÖa+%òü˜Ö`V8	·¥mS×–Õ½1—¬ÃìFÉ%•Î·æû‡ò\nõ~ñ¸hâqgÍŒSõP	¥7pcüf£ìÿþÏöp†wîÌ#âùÄM@í5Çž¾ÑV„ ‡iŒ¾t÷ÎS¶<KØã„³\"XîáÌÈž¢ù.ÈW:A(ßŽ$Ù,3þ¢ÐN¹´~ÔÓjd¶1^‡Hò`’/ûêDêC×w¾sæ=†ªH¶1í›Æ³kŽòœÀ™ˆ‡±–ùuðÀ¦RQŽàÿZ´Â¶Û!±£¿½Ü…Hü%Þ\0ïcÞºáu\0Ýð0$­!8¿M€0R³¾>Ï\Z¬™1ÏÄNšŠM³kRK$•cUV®”ÐdyGqô¸R•åvÈüµ}&Ìs@üá“°ÄF\rŽkceSÿ¡dPë´éëY™ÞåeA¾ÝÛ{Ð/ÃÂPô#J¡bS=ÑbÏÅ’©ÙO™[×LUA£sŒÐX/‹üR34PŒéÎ‡¤´Hîú‘ó~ëg&så~ŸûÐàß¹$È%-;ÈÙK5<æ½©½\'-¿âÜH$¥húL´cpô¶#DÆl¿Gˆ§¯É4«}!JXta}vëæb¢Æ¾¾™æõêrÝÃ²g²Öè³M×Ç>–^4‚ëe®•»½y·÷²îÐLÚŽ\nå“«°Œ ¡Ç±Íš0\'Ä;3,jŒöeý˜MRïvèPZÚâ>3ÆMPðôÎî	!¸;‘,(#\0ÙÑ¬œ»“‡Ü;d:÷ugÛ½¢>z,»«? \r%fêQÂVëí¤E¯I\"_„T¬e\0°,çB¹#,ç<$í¨b‹åXí œØ0ÀíBP\"; ¢b6bž0?Ø%õ&Á$=\\ÁG\n§SÏbT-ß‰“ôéReA¯Î?£³‚Ì\r»ñJ„S9ípùDÊ9^AÃ ¾Bæ¡Îr­pûoVg’ŒH7c¸ÎþØQQæ ¤e£4åqCô-äÁß^ÆhE`²f4UûÍÓ@‚pÍj4j2³™Î”+pgU”¢©(|Ñ(×yèD®>á\nw÷œD¥2]ŠÊê\r1Õí’t„q„]¦ùBçžšNœ†±Åì¸Ž Eøm2RR\nÿ¯Íã…¿‘üÒH÷VÌCìkì°gýsvEóQu<UJÚJô@e^æe@> ƒzå”0 üÁ6sîa1ãç¿ŠYÖ~É§˜0Y\'íš‹Ü|lÅNÊŸÇ\\Oå8ÐET„ª1ìT™–¸×ŽÀH½Ï÷3,ÌWÂšdMLfZ…UÿH7ø!æòï˜ÿA—èÐá«äöN¤^ÕÈ%}TÜ˜h+á^aV¶¦Uo.¢gÔ+QúÙÑ5t\"ÕÉHWé½›aº^VŒ–€½–¾ÎãbœÍuú|âÈÕÏÜ*(+#ó*@J¶{N\nº´‘JÄsx‰­çLj·Ãùð§Ê}ý~‚ï\"3‚0Õ¯j•µ\\™$Ê¹ ·Vù!—ñšdœGÐ&ÓEÁÂ/ïBÄÞ9!<Á^{†ä‰°FÁÀPÜfìÃ a™e 3Ž¸?y@ªJ>h*M?[°úaM½[½åR|Š®7ž[·þ_\";/–m³tm™¡€üJù#[dŽgfñÉsŒx2´N`Æ Úæ‰ñ×™J	LòQä©<†óràx•Á\"a¯=#nî$÷Çe+Õg4lÒRŸºEœSµM%øï\röw”å¾\nF&[^ŒÂjÜýw¼s‹Ó„7‡ï¯¢Û¦\0CÁ}¬.=Ó…L²ŒÐÓyð‡A\"-|ÀdbO\\¿ÒPD†ƒ¹:†ÎT·§ÂÌš“W6•\r;æ1/3\"µ“ä_C;íª-÷1\05Ú¦‹È„?Þcâa„âÆ!CÕÄ®p ­Ñý\'ò¸=ò+Ô)üëë­círj3˜§DXÄžVµíÚ×9áÑ\n¬/—ÞØ–·»#[ærìãÓÉgÂÚa‡™lit€ÏÒ2Ì³&øÕW:@Ð¾“ŒÐ<?$ÁÎHFà¼ÃwM²`‚rMäŠdó5sKÕ¥¥ÀËëšÖÞû½ˆ¼¦§‡¬˜ÈLµû„rRé\"mþ:³ÛÓ#­¯„ïiO´$È€¤^+nœ¯@Å‰²ƒŠTûUEä0’µ7ËÛu£4ôûó-%xöTOPÅØ§)A•­dýáÀVøobó”LÀ\"½ëÄcjÝÐqÃ?*iífTv\'éxËw˜UJ¹ë»£Ž Þ_¦²Z¸Mâf€kKæ£0’þ-98Ö¼Ïüã\Z	 °O;br˜ë]ŠNó;“\Z™LÒ¦f0ª’\ZÉc7™cÁÜG#Â?Š—ŽNj×${’ù•fçõHŸ$ër1\rmêÊÂøŒ™µwl$/…z¢©ë×©wÜÒ™Á\n‘˜á@J‹*Gb¡gR©é´“w•íw¨ãŸ“!Êøÿˆ*³KÈúªCÔÕBF‹±!oÈníÚÌ\ráÆÍ“¬ù:Áù°œá¨Ž²v’$N}ÈëE0§òÖ“[œµIOxÅÍBD*Ó->tßš²Ô¤büsE7èA´÷T}@/þ0-~\"“ÊjÙ«O>‚\"…”\'±¼JÍ.ëüyŸO|N5‡¹®Ú(‚¬.t|ãÍì2ðêª\'\rû¤²J¶Šõ¿bi» \n\"P-ÙE§­y¡¬\\äoåøj†àÃILò_«\'XE‹}ô\'lb íì…P Òt®êNFAA¬:‰ŸQUâÝcVÒàB,3ÒmÖ§5ø´\nWiHã6±Ä¼-Û>æƒçSÊëÕ)%ƒáÕY–;;ïè³Å‹¢îŒ?›nO22jŒSÂEDgè³‚ÊÈËž\nÜ·‹H›ß›12EåkŠ‚þznªË¢­Gå³’qÈ••×7h½SÑHTJÁl4gáwRw}Œû¨…–WLIUpAÛs¸ªð§,ÚècÛ‘dÙÙ°(©îÆ.5·àì 9aXN“\\¸&—	€k˜\n@Ô‹JD†ÓpVq+Þ‘iúí0u òo-2VÀ›ã3a’»¾Z+¿æ#Ký°«X¨¹Ë\nFŠJnŒ@J’\"ÈA*tªl\"gi\nçË•SDL‚ä§«ô†‚\0ãÉÓè×{Pvú¬‚s3°Q°Jœ\0(K¯aV©\0¸Á²ð&Z,_–éí—÷L°ÎŽËµ†×v”<NA¹š÷.Ìó½%Å+Í+2\nlWôª[šúR’FõòÊ™‚	˜P²Š5\0{\"\'ƒÃQ,¾\nêfê\'Û¢ÔyË–Êe O_™N\n³8ÞÞïÙÇÜ1ÕNMµ}ÔukÜ^/†–]ü-sBÚPMŸC—SÐKå\Z„BrŽV_÷¨¥lö3¸íJÞÌµg@®Tý¨$È±Þ`[Í¥3¤Ú5)ºâ\r5–\r\Zí¨§”	®;QÕñ§BM(B}¸ÏCS_/ed!dÙóòJój×\n´ä”ÚOª-­<m…·æh/Z&MDu[žÃk` É¢—TÃ¤&ö6¹ðàÿ.ÓY«ß™Ãßº¥S%¢„eËLäå¸ÄûÆáÞ¨ãÁA7˜Š1¢nò¯ç¬ÿÃ66£¯g+‹Z§wÃé„§^¼ŸP¯ˆKQiæ¶ö\nº¼*6©ÁÚV˜U«Fl‚ªŽƒÉCŒÁVÄüu\'<fßŸýˆ½ƒßOb¦‰ùP¨úPÉ%ÀfÛ‰¬¦ŒpÛÌq²¡žç‡‡öÓ!‰ŒÂdÌœ\"‚\0“§¼ô7uY›Ù˜«X(ÿIý¼¯¶×¿ú&Çe¸ñ@çæ!s\'Ó”Í¥ÞjÑ:hd°š?/¼{OVÎÊ]i}b/œ…4;9_¤GxÖ—ÅÅ\03êU“¿‘ÐÅñ$l…]Ü²JÞô®+<žÊÐ…Mœ0ÈëNý.‹LÉ9ûfEó¯Ãåö\'½æ15òó9Ÿ<V8ŸÝjdÓ\nj¾cÜ€Igÿ	@§ˆÑ8Üªµ¢0‹ƒXš}â’G;—Fæƒ´Ó\"Ãæ¾,˜C*[ƒEoÝø±˜Ìœøc\"?v¨•+›‘‘HÛë[h®æ„ù>¦`~òBhWoÄnPŽæ”ò±<#÷Ûšæ@ ¶rV®Ã~S\\‚ì3©DL¨ÖµrÜ÷œW&ô½Ìk¾%dñß-˜k<þÀY±Ê\Z‹Ð‘QX_~ÇMØì[ãl=…÷~	 éEL;•^_Š¿¹”“/g¤.CQ„Ÿ4Âñï¼_RQUQb÷\'hš)Þüš>\n¡ÞåÏ?¼0Ž¬\\§Ée\\ÙßIÉ‚\r!nnX\0L\\Š\0\0\0\0\0\0',1),(2,'FakeSensor2','Mars','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z ( %!1!%)+...383-7(-.+\n\n\n\r\Z\Z-% %----+---------------------------------------------ÿÀ\0\0á\0á\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0=\0\0\0\0\0\0!1AQaq‘¡±ð\"ÁÑ2BáñRr#b’¢Ò$3²ÂÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0#\0\0\0\0\0\0\0\0!1AQ2a\"ÿÚ\0\0\0?\0ðÔ!B\0B€„ +ýŸØõk]­†ÿ\0[¬ÞºøJè0=Ö`ü{Uá-oÜù)¹È¼xòËÓVèvmgþ\Zn>:•èø.ÊkGÊÆÓ\0ó9õ[*]”Ùž«¹ätãñ-÷^iK»8ƒ›Cy¸}%Xgt+ŸÍLsqÿ\0ŠôÖá[Ígà´XYß‘[Ï…ÛËª÷N³53È»þ*»»»_FƒÈ¬/UFéì²(û%üœ‡ð°xõ^Ì¬Üé»¤ú*¤/k~\0n_‹ìŠ/³Ø×s\0ÇÙTù?¸Œ¾ê¼Ð1ýÉ¤á4œXÔ:ù®[´û¹^Œ’Í¦ÌÛ˜è¶Ç›¾ÜÙü~L=Æ¡BÕ€B€„ !B\0B€„ !tÝîÓ«Ãß-¥æïíÜ8ú¥lžÕŽ7+¨ÔögÔ¬íšmœ¤è\'Rt]Ÿd÷Z›.áñÄ|ƒ“uñò]\'gàI¡¬hhE£Œç<sR}ŒÑsåËo§oÇ˜ù¤|ˆ“1¦ƒÁl(aNsÒÁ7€$Iôä®€¹òÉÙ‡\Zµ:\\\nJqªa&,z}”>™Ü³Û]0Êr\'è¤ê°Nu„O.*\ry	^æ8‚è0e]ª¾G’@ãê>ÆB¥#³#¢…<±‘ëÕ]kÄÀ ÿ\0B²Ñr@™ÌT•¨¡ü³›”¹(	ËÇB¶³”*Õ©\r©ì‚Ôs}µÝZ5p\rÿ\0ÔÑcýÍÈó±â¸ØìZ¸só‰lÀ{nÓã¡àW±Ul_®åS‚cšDH\"\"AF«~>|±ñ}9¹¾.9ùž+ÅºžòwUÔ¦¥K3-Ì´oó0¹eÝŽs)¸ò³ãË¬‚…HB„\0„!\0!§î_vŽ%ÿ\0ãü&Ÿõ»úy\rzrVéXãrº‡wCºßŠµ‡øyµº¿‰ÿ\0/¯%èËµƒBw†àjS€\"ã\0‚l_â€wLu=2\\¹çºô¸ø¦—;Á1„>[\rªQµ ËÇxÓ°À’˜ß1è²m#cLË~ž÷¨¸î5‡8%/âFãmu±®˜¹.\'?%^­s 7ö	¬Ñ-öe:boa¡ÝÏ‚“é·’ÎØ÷>þÊ¹¨ôÝú`ÊEs¤‚™Uà\\*â‹Ý$	Í4ÓA:ä¬ákAÞQâ7ýˆRYñJœ«Fœ˜iÚBQiâê@¾l8å+%ÅÄ|°LÜH¡%\0_²u:ßšSSm\'z¹L€Fíè8¥±˜ô+ÍûåÜø&®_70j5s8GEê%›Œúªµèmˆ×Njøù.qŸ7äÇUóÚkßŽìN&›~Yÿ\0£ò“ùÀÜuÜyÛŠ^–9L¦ãÃäã¸eª„*@B€„ 6=Ù.ÅVm&ÚnçKâw½H^ÈÊ¡I¬¦ÐÖ°@\Zï¿ny•¢î7cÿ\0/‡ÛpŠ•€qùÒüÝÁtTÛ6ã7íÁsòe·Çãë7÷Hm¾g~ƒé%*¬5¦Ü;ßÑ8™%ÆÚýGÝ\"¾Xò2f5Ò«ñdÜÀÖ9\'YÙµ½Ù+ámuQ]\Z¨›\\{‹ ™\rç^©uñDÙ‘÷ý’+‹LÚÂ5´ÙEµ´	Ý¯+Ú{nnv½Œ-æwòW©’vŒƒy;²ðTi°€ëÞošxU5X¬\Z±ØÑeŽÄÏŠKZdXžÓë×h¡”ˆ\0ëªš¸GÊFpAëÀBf§fCéÍóqùfªŠÆ\"ÞïÉ$ÓjåZ¤d¿—†Õ7¹3ñJuA¬4Åýûû m}˜§¶ ÛK=J›±{pcì«Ñ®pn\nœµÚAòðS¥ílSÁ#k†½þ4Ï}8¯u0¨º¹ˆÎü£r4}´ØÑsˆ°é¿è¬²ó;®©Pu§ª¶Ã­Ž°¦ªÂƒò¸ äA±iW‰÷³±¹hŸ†ïšœçÒxƒn‡UíµŒ1ÁsùìÑ‰ HQŸ0ðG%Ññóëtäù|]ñÜ÷>…’ ñ‚„\0·½Ìì‘‰Å1ŽÆüõ?µ±o@ñZ%éŸÃŒ ¥†ub>jÎýŒ·›¶º¯¦œxï/.»ù$þ×UkbÓÉfµM2•Z¬H\Z	%räôbã-ø!â$XÖ’|Dx©ëUÚ+¹ÄŸy¬°À\'ì³ñ-1’UZ“šŠl9ºÍõ	tßrf!ÝÜVi{Íp¨I&cw\\x«l%ÀIÈDëÌñHf›Ÿ$Í¥´Æ~Ó}Kê G¸J{ætå—Š]JŠ¤-5”µžH{N‡E€ØÕ2—Í™0=³ñÌl”Ú´÷:6‘qÑ#áÉ@óÊÅx*g	Îÿ\0LßÃzH¨ÊãM<ÐzÒÑ79Çª+Q0ôæŒ;äqðLb/§¶­lú4ÎÍ²÷ªµ†n‡ÙT)Ö-0cëÅ5Ø’9Mµà¦ª]6x†Àåœû¸Zš¬\'[b®¾¦Ðã7F2ˆ{-b7\'‰ååâ=íìÓCæï>zýŠÒ¯Eþ#vy4Ù[ScýÍ±ê\'¢ó¥éñåÛ^63°!VÉ–‰°^ËÃ|:t©˜Ö´ñ \\õ•åÝÖÃ|L]é¶y3ç?ú¯Yqú•×GEï±‡Ñ&¡·2ûÀÔ$âÎåÍ}»g­•V¡£R©€ZéÍ2žr|ÚdØ\'ä3ï¢¡ñc<¥XÅb-XkL„¦;e¦Ö9‹ø+P7xÇ¢¡Aä	ƒ—>3É_ÃpD	¼DÌ,ò–6Ã)Os£2#ÞŠEü¹d¢âÝÖYµB³Á:ßÁAÍ\Zy~ŠË\Z4S8a˜ê­¨l•:YÚD)\nI±¢\n@úå¢cå9ëè™‡\rqØÁÐLè5ºÃT ØçîRÛê4\0í#VÎ¼}ê“U­‚LÃ)µ¡$S1î\n\\’`”hmn”Z{Ñ[kµŽ¶àZO‚ \\ð±V\\Âo*¨‘¤.-\"àéû%2Êªº\"Lè×Û&n-o^m)6˜÷ÕOâu·Œ$`äeª}z€%ôç»ë‡Ú¢ÞÞ6%xíVA#q…í½âª×3gX‘Ïö^9Úô¶jž7÷Ñz<Õä|Éÿ\0{RB¶qºoáëÅÌ~\Zo<¦ÿ\0Òô-¹$ø.øjÕº™\\ß²ípÎ±æ³äôêà5Ž¼ªØ§ÉL.‰T+¹e\'–öøÑâ¢™«kª?T\Z’‹\ndÅwñTª›«/«Ôl*Æ3Ê¶&vLG(¿§³²ÃU‡lºæcLŽwèµ=œÛXŸOÍœx)R¨C®L€<M¾k¬r›µÑ†Z‘¼|@\Z­Ò‰è²ÜFßÍ©Ïš!béöÂmJû-Ú9þê-ÍÒGNWæ•Ä´ˆ\Zï6¶ÿ\0Õn•º›0bÌÍÎ|x¦6Ž‹eG²ÌeÄn¿—Us\rsd8glî!Uãý#]ûmœÈÒ&b\\çNÔ¶-Ï’°Ú ©³M%•\'…\ZL“;”¦Úe¿‚ªÌSöâeaÆwý’ÖÅ²/meªM¨FDñ÷õJcŒÞ$î\ZNe:Ò¦®\Zj¿ŸêµØºs¶p’9Â«Á9fµuFy>Ê1Ù¸ÇlüÇ)Ýl*>o»%LÞÖ‹oáN«þQÃÕ?t½F»´*É3™˜ðïe(¨×œxú®ÇZ*4œ¶²7Ï’åûÞÏ–‘Ü^:ÇÙwñ<¿‘çneBÙÈé;‘R*½»Ùèá÷]¶	Ù®ºŠüØG›OÑwg(ÎxtpÓ+>ê†!êåRª–L¬£|¼«J‰y°Ü¥Qª-	 ÀûB*ÜLóP+‹Ùo	V\"g¢²ú!ðr;Ö£RÊ·ˆ­\ro*2ÇË\\ršò·N¾Áƒöž^ŠÀÆ•Ž²màV¶ë“q’ˆÅ[çš›ÇµNmxoªb\0×¥ïmtä”ÚÔö@\0pÎEÍ¼Ö±2g¦—¼%ó|ÃåË4¦y[gWÎÙªïqÍAÕDJE|DlyJC¹Dñ¶`4á¨V0Ý¦“ÈnæV¶ÂK2}æ–OáýD*úÆ}ì®˜bEãÁJ•@n¹ü.*àÆþ>ªÓqWY\\+|yemÝRéôªž–4ÄêÆ©¿‚uÝ*2ÇÃLs–¶€ÀU‰ÚÝ¨çHT$[×5,³kì\09f•Yÿ\0­øJGYVq²¼Q‘ˆ×>‹’ï‹¾ZCyqéu¾ÄbHx\0ûãåÕs½óué\rÁÇ©è»x¦«Îç²ã\\Ú…»‰{±*ì×aãAUè^¼ÍŽ‚Ì_¢ï°X¦‚5\0õºYzkÇ|¶¹ªÕ\Z¦Ç©?/ƒ©QÅ`·hÎ_ªhmŠ“iDø\"Ñ%Ss¼’®ý9+ ~©b7÷½9bl¤¹¾)ÎËÒsLØuƒ:ÛØú¥½Ÿ]6ŽJ\r¥©ðWväX	|=è¡³µ¤_/Õ-ŸXY¤`F¨n’x+Ôrä²|”w«üq¬ ¤übØÖ\'Ìè­V½÷$8HÈÊÑ•ÿ\0}rs˜áÏT—Ò9+Ë\0×ÑCàX“š[‡ÖµÕ*éy\Z«8JÇ!™Ëíä¦0ÀÉ‹ûýè°4ÞÚNäíšLÆïg¶³ãæmæÄ}U¬ Ámç[h«Pné#;ç>;òM&Û‡HYÙ¶ÒëÊÍq.€bZŒÕñ^ËQ‚`Á]mK¬óÆ}5ãÎëÊæÚ[Í’Ã–õ4·ÁU¨·0.ÞzûUÏù@_ªìÎ\"vÆáWžãkmÔs·“´ò…ÙÅ/ÛÏùO¢„-ÜuÞÄÍ8Õ¦<4÷Árêÿ\0cbv*\0ru=½éUcu]µ\nªÓn´ôêÂ¿J¼…ŽQ×ŽK0˜Ä€éYkôYVÑ`„5ª\r*D¨­\"F¤âNEÇ¢›bÞü”¶x©Ú´IÃ7MPÚ &¬‚ŽÔu…¨še:!>ªo£:G\n-da\Z}ÕÎj\n»£¢³˜3K,½¬J·²2P4ÑØº«Kgz˜Ã‚DäŸ}E4æ1IŽa÷¢°àˆOc©Md,†ø}µS#‚–Ê[\ZBÿ\0ÂyÐØXsx\"i»Z ¥†yÕÃdhdÈž’Wº>úc¶ª\nC&	w÷°õ+œ]œsÆÞo5ÞZŸAB¶AB¤ìì^Û9‹keB¤.G‰,tèlWIB¬€£(Û›šOLÉkèUVöì°±Õ*Ë\\›´«4ø&°¬ìk)í;½òS¦âuIn–Sä§K”ÂäJVÒ6’ÑìÖºèÛJV	÷šZ=¦ç¥¹ÐÛ €ÓSè	Pk®¦B‚pªDÝfRçØR2H—Z¢\\•R&ÔåVí<h¥IÕåÈoqÉ½~©´¥Þ:.+½}«ñj|6™e3¦Nv§ˆëL0ÝcËÉÖ4•j8¹ÆK‰$ï&ä¨!©ç„!B\0[ÌÆGÊ|>Ë\\„ºut«+´k.kü®ÏN+iJ¬,rštažÛæ>Sé-5\n«aNªÊÇL­…\"²û]Vk“tP¹S%F˜•€å’5)i[·ŠQqÊn¤Ô„Ë¦o~*LjF‹)XË%†&-æ¤lTšÒBz•\n°úGE\Z”ã§¼‘¢µX… ²öÆ‰Ô°¤ŸÑTÅ6«=úõOÁaQÁ­•·ì¾Á5°ÙœÉwû+ìïÆ£ð(WñsbÚ\0‹=ÃWGáiæm\0ëŽ;ôË<ºùÉËwïÜ?å©»þåãüHÎ“\'dî{†š9‘h§Z³žç=î.s‰sœâKœâd¸“rIÕAtI#‹<îWt!MB\0B€„ ü¯ð?uA9téhWWi×\\Ao-Ëk†Æ¯‚Ë,áÈè)âªx™Z*uUšuÊÊâÞfÞSr”…ª§Š*Ý,Dä£M&KPz\"ódæQ¶Ô‹é7è™ðŽƒ]ãÌfŽª•\nmR©NršÚzë¹2,Ž§Ù]Œ˜lÚÖÜSZXvH2  óSm2HÕÅÖÙ3”’:—c\r0Ð6í7¼å¿ÅUq˜0@3\Zº\'EgMÌ¨XüÏõ ï\'=ù,Ó¦ÖÓÊMâæã^^ªŠ±†ÂÌ$ÎZtkÙ]‡V«¬[$9æ\ZÃ@Ïš§ˆí¶®\"©€,ßÍPë°Ìã+ú.¾Äšø hÐ‡Èµ¶{ÇùÜ2å2®qÛíž\\ØâëûÝüA¡€c°½œCëåR½‹XuÙÑîÿ\0hãñšÕ\\÷=ÅÎq%Î&I$É$›’Nª[É#‹<îWt!MB\0B€„ !B\0YaTq®ßÕl(cÖül´¨Jã*¦v:†ŸN¹–£‰{?ˆñ·Em±Pg²y´(üq¤æuxnÑÙ Ä¦õ²¥ÚtÉ³v Ëœ	à\"Þ‹‹»¾ðt}\ns{}‘ÿ\0ŒõGEÎXëÿ\0ê )»´™ùdóå%qìïGäqñe÷iKýß`—Jš;/úÀ½Ti»hh¸ ÁàŒŠáª÷‚©ü!­ä	?î%QÄcª?ñ¼žn‚Èübóþ®#¼a;O’xí:ûÿ\0XZlw{ªºÔþA”›˜à2k›B¹„Œ²åÊ™Z³žvžââu&OR–„*d„ !B\0B€„ !B\0B€„ !B\0B€„ !B\0B€„ !BÿÙ',1);
/*!40000 ALTER TABLE `IoTSensors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-25 20:48:42
