/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.22-log : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `ssm`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'/processes/MyProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"170.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"250.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"400.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"550.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"205.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"355.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"400.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"505.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"550.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2502',1,'/processes/MyProcess.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"170.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"250.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"400.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"550.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"205.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"355.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"400.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"505.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"550.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2503',1,'/processes/MyProcess.myProcess.png','2501','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0S\0\0	\0\0\0∞º¢‰\0\0ÎIDATx⁄Ì›}lUeûp«∏&ì8l¢âcb≤CåÏcúƒ’«∏∆d≤;F°≠/¨ı%FW\ZHp—d1Zqúƒ∑¯≤∆\r—›ÇºÖÖà:]¥¡—ADl≠fp∫ºÍŸÁw”KN-T⁄˚÷œ\'y¬Ì=◊ﬁ;ùﬂ=ﬂÁ<Á9œ9Î,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*Zñe?˙‚ã/ﬁ‹∫uÎwk◊ÆÕZ[[µ\nhk÷¨…6n‹¯MjıÍJSW\0,o”¶MYwwwv¯a≠ÇZOOO∂a√Üø§\0ºI]iÍ\n†B≈»Å¿´Ë‡;‹⁄⁄∫C]iÍ\n†B≈)·RŸ-ÖﬁQu•©+Ä\nÛ(K≈á^¶Æ4uPÂ°˜◊?we_l{!k_≥†–‚q<\'îÑû∫RW\0:SßÿÈ~ªø#˚‰øö≥ˇ}{ˆÄœ≈6¡$Ù‘ï∫–ô\Z¶ÌiÎÑ¿+∂Ø€W	&°ßÆ‘ÄŒ‘pm«∫2Ùbõ`zÍJ]ËL\r”>iù?dË≈6¡$Ù‘ï∫™4S¶L˘€∫∫∫_\'èß∂.µ=©eπ÷ï⁄ñÙöﬂ¶◊ﬁë_\"‡4Ãü?ˇ\'---è.\\∏ÉÊÊÊû∆∆∆#”¶M;˛Âö9sÊ±|pˇÇ⁄ûyÊôﬂÃù;˜Ôt¶Ñû–SWÍ™zLû<˘©ÉÙª¥O?8®Ût™v4:W©5Lú8ÒGY¥h—uÛÊÕ˚}}}˝˜©ï≠X±\"€æ}{auÊc«éeEΩΩΩŸßü~öΩ˚ÓªŸO<ë≈ÎSÁjO˙of÷ÍóÎtB/Æ≤\Z*Ùbõ`zÍJ]ï[Í˝,µm#Ï@\r’vƒhïÙÑ‰æ˚Óª‰·ánª„é;æÛÕ7ù•ë8r‰H∂yÛÊlÓ‹πﬂ766Óù1c∆?è«Œ‘Áõü2Ùbõ`zÍJ]ïSÍ¯,ÓY:ﬁ!ä≥ã/Œbﬂﬂﬁﬁûuuue<æoèÉÈœ>˚,[æ|y·u”ßO?YßÍùÙ{~*M∑öõõõnø˝ˆ£/ΩÙR÷◊◊óù©m€∂e©3ud÷¨Y+&MöÙ„Ò‘ôÍÌÿû}ÚﬂÛN<ìûãmÇIË©+uU±/Óüuº‘––êΩÚ +ÖŒ“HDNƒYãt>†CUWW∑?˝;Q™2ÓÃô3Á7w›u◊±?¸0M»ZZZé§/kg˙_8^:S—v}Ú	°œ	%°ßÆ‘U;RõÚüò∆#Pg\"¶~¨^Ω:ÀœßMÌ€‘‹öÒ’ëjjj˙n§G%#Ò⁄kØ}W__ˇóÙe˛˚q—ô:t(˚¸ñùx*&=€ì–SWÍ™‘èH≈Èº¸ÿ3’——ëÕû=;ﬂ°:XWW˜K)À∏8µ#RcŸë*ZπrÂ°‘°Í®ˆ™SÖ^¨D˝ŸÊßÜú€€¨V-Ù‘ï∫*•˛9R«;:[∑nì˝|Ã±ä˘T˘™Ùﬁ§-5+&õ«©∂∂∂¨T^}ı’Œ©SßæUÕW˙\rzáe]üøó}¸Óøx≈Øâ◊\ZMzÍJ]ï`DÍg˘…Ê1\"5ñb≤˙¢Eã¨OkXI]jıÙﬁ«1Ÿº‘ÓΩ˜ﬁŒ∫∫∫¶ZÍLùj‘¿hÇ–SWÍ™\\“˛ˆ˜˘9R£yjo∏˘≤3fÃ»OJˇw©KÕâu§b˘É—∏jÔúW?6uÍ‘?UÎë …BÔtF\rÜMTBO]©´±rÊØ⁄;”…Ê#4\röê~âÙ•¶ƒÇú±VHπ<ˆÿcÌqøV:S?4äMP	=u•Æ∆Ëﬂ™bá&ñ?(µXÃ9◊°z\\˙R3‚1±R˘H‰Â—©Ó‘ô˙¶\ZÁNùÓ%Ïö–SWÍ™úbÙøxãòX∂†\Z\r∂sÁŒÎO544¸D\nSñ-[∂8Œõó€ùwﬁ˘áÙeˇG°ßÈL©+u5˙˙oZ\\Ë»ƒvÂí_‘3ÌÛ%Ö©	q”‚U´VïΩ3µtÈ“Õït™/}ñ÷”È‹	=°ßÆ‘U5‘UúV+’|√y„ç7LDßˆ477˜ƒMãÀmÎ÷≠m±à\\•¸]rGN≠Èˇs°\'Ù‘ïVÕuï_§3nH_∆}}~d™U\nS\Zèî„‹˘`{˜ÓÌäıG*mÁîøaÁ…é¸Ñû–SWÍ™\ZÍ*=∑ß∏ΩîWÒ\rˆ’W_\rXsJ\nSb\"b)÷9ÒÂ™‡ù”Ò#©¸NJË	=u•Æ™°ÆÚœ« ‰ÂãxÊ?ã¶&D1WäjËLÂè¸b8]Ë	=u•Æ™°ÆÚ?W¬æ^g\n#S%¯ÇUKzïﬂ‘ï¶Æ6#S0 *eŒTOOOgÖœô*∂mqÁÛ‚öX•ΩÙ6Ö6‘œc˘ûÉ€h˝o0Ç†Æ‘UiÎ ú)Cè<Ú»7ÌÌÌïr5ﬂ¶\nﬁ9\rªRŒm)GËçˆ{	=u•Æ [WÆÊÉ1ÎL≠^Ω∫\"÷ô™§€‰vJ[baπ°Vg/wË≠\\π2ª¸ÚÀ≥sŒ9\';ÔºÛ≤kÆπ¶∞ plÎÈÈ…næ˘ÊÏ‹sœ-lªÒ∆≥Øø˛z¿Ôà◊_q≈#\n´\r6dó]vY·=/∏‡ÇÏ≈_<Âg…ˇû%Kñßé¸x=u•ÆJZWi€Sï∞ŒTºwÓÛ>%Ö©	---O,Z¥®Ïù©¶¶¶O“kbÌúN:bPi°w˛˘ÁÔ⁄µ+{ˇ˝˜èã!72çü?˙Ë£¨≠≠≠¯∫ÎÆ;÷Æ]õuvvé(Ù\"‚ΩˆÏŸSÿü·Tü•¯{û}ˆŸ¬ø∑›v€xAPWÍ™,uï:Yıï∞˙ÏŸ≥Ûù©õ§05!ˆÖ∑‹rÀ˜}}}Â\\c*ÓÕ˜◊¥ì˛õj˚˚ï\"ÙŒ>˚ÏB/ûã«W]uU·Á8jø˛˙Î≥‘9.åƒ∂98k–‹îx.B1u§ßQ\"‘zË°B†Â∑˜Yé\'ü|“m?‘ï∫*°i”¶˝4oæî{æ‘¡∏_†¶f§ÿ◊Ø__∂Œ‘”O?˝A:™˙m5˛ÌJzqjcpË≈sÒ8B+>√=˜‹ì]|Ò≈Ömó^zÈÄ–;Y∞ùuösMNˆ∫	&ûã€Â∑˜YäØkjj*|ˆ8m#Ù‘ï∫*˘÷ÒySÀó//˘æ~Ÿ≤e˘Œ‘“óö2gŒú)<¿wÂX\"°ØØÔË‘©SˇGM:S\'oq4ÅÔµi”¶„sRb€ïW^Y¯yÀñ-Ö”*Ò¯¢ã.*lK◊¬œœ=˜\\·îL<æ˙Í´œ8ÙäaZ¸ù≈Ì√}ñ¸ÎÍÎÎè◊≠[\'Ù‘ï∫*°¸©æ∆∆∆í.ë–——Q+æ™£êæ‘úÙ≈⁄;‘R[∏p·ˆjûÑXä–€Ω{wvÌµ◊¬&N√Lú8Ò¯‹ÿv√\r7é „4Hú\"ââº±mÔﬁΩÖ˘-±-˛€ò◊Ø?”–ã”,Ò˚b~J~˚pü%ˇ∫∑ﬂ~ªxÚ‰…BO]©´Í_\"·„báf≈ä%€◊/X∞ É„ﬂI]j“Ãô3ˇi∆åGˆÔﬂ_≤/W:˝<)˝q“§I?÷ô“Ñû∫RW•ùäë¢/ø¸rÃ˜ıq≈xÓÙﬁ—‘ô∫\\ÍR≥fÕöıüKó.=Zä”}ùùù}qz/E˛¢öˇfBOË©+uUmRáfU±ssˇ˝˜gcy“ÊÕõúﬁKmñ¥•¶≈≠∑ﬁ∫ÎÂó_>2ñ©ÓÓÓc\r\r\rùÈÈæjˇõ	=°ßÆ‘Uµô4i“Ö©S”SÏ‡ƒÚ8qõó±ËH≈)aìŒw‚R’È”ß˜._æ¸XçHıw§◊¬ﬂKË	=u•Æ™Q‹P;µ˝≈éNÃiÍÌÌ’S{ÉF§ﬁ©Ê)0bqe]}}}«Ûœ?øw¥ÁH≈©ΩZëzBO]©´\Z8x˛UqÌ©h1ä∑{9”´ˆÊÕõ7¯ˆ6:Råﬂ™‘Òy+ÆÚ€Ω{˜°3]˛ Æ⁄ã…Ê’>GJË	=u•’Jg*ƒ>9uvæÕw~bÖÙëﬁø/‰åu§çFNÌÈH1Ó’’’5•N’æG}Ù„ù;wéh§*V6oiiŸ£QÈµ¨øPBOË©+uUœ“>zœ‡&ﬂ}˜›ŸÎØø^Xá,Æ˙+Œ´ä£Û£XqØΩXπ˛$7[>j≤9‰D\'(})Ê«ómÊÃôX≤d…ñuÎ÷}îæLªÛùßﬁﬁﬁ}ÈÀ’7-é{Ì≈-bbeÛj]êSË	=u•çáŒTq?sYèR˝êÎHY˛\0Ü©˙y«Íù‘vı}øD]q◊Ú‘èõW„ΩˆÑû–SW⁄xÏLıﬂ√oa~r˙i∂ò{ıÇïÕ°\'Ù‘ï6Æ;SEq0‹?üÍÒ˛ÉÁ¡ßª¶Lô“\Zw∞HØ_ªi1 ÙÑû∫“t¶\0Ñû¶3•©+\0°ß	=u•Æ\0t¶4°ßÆ‘\0BOË©+Mg\n`l≠]ªV∞Tv;òBÔ®∫“‘@Ö⁄∏qcWww∑p©–÷——Ò)Ùv®+M]T®˜ﬁ{Ô_÷Ø_ˇÁ}˚ˆ˝üê©¨ëÉº5k÷ÏNÌ&u•©+Ä\nñv™øLG©€bÿ?ÊQh—‚ˇã’xÍJ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ú‡ˇCB/O«v¬u\0\0\0\0IENDÆB`Ç',1),('2506',1,'/processes/MyProcess.bpmn','2505','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"170.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"250.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"400.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"550.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"205.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"355.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"400.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"505.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"550.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2507',1,'/processes/MyProcess.myProcess.png','2505','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0S\0\0	\0\0\0∞º¢‰\0\0ÎIDATx⁄Ì›}lUeûp«∏&ì8l¢âcb≤CåÏcúƒ’«∏∆d≤;F°≠/¨ı%FW\ZHp—d1Zqúƒ∑¯≤∆\r—›ÇºÖÖà:]¥¡—ADl≠fp∫ºÍŸÁw”KN-T⁄˚÷œ\'y¬Ì=◊ﬁ;ùﬂ=ﬂÁ<Á9œ9Î,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*Zñe?˙‚ã/ﬁ‹∫uÎwk◊ÆÕZ[[µ\nhk÷¨…6n‹¯MjıÍJSW\0,o”¶MYwwwv¯a≠ÇZOOO∂a√Üø§\0ºI]iÍ\n†B≈»Å¿´Ë‡;‹⁄⁄∫C]iÍ\n†B≈)·RŸ-ÖﬁQu•©+Ä\nÛ(K≈á^¶Æ4uPÂ°˜◊?we_l{!k_≥†–‚q<\'îÑû∫RW\0:SßÿÈ~ªø#˚‰øö≥ˇ}{ˆÄœ≈6¡$Ù‘ï∫–ô\Z¶ÌiÎÑ¿+∂Ø€W	&°ßÆ‘ÄŒ‘pm«∫2Ùbõ`zÍJ]ËL\r”>iù?dË≈6¡$Ù‘ï∫™4S¶L˘€∫∫∫_\'èß∂.µ=©eπ÷ï⁄ñÙöﬂ¶◊ﬁë_\"‡4Ãü?ˇ\'---è.\\∏ÉÊÊÊû∆∆∆#”¶M;˛Âö9sÊ±|pˇÇ⁄ûyÊôﬂÃù;˜Ôt¶Ñû–SWÍ™zLû<˘©ÉÙª¥O?8®Ût™v4:W©5Lú8ÒGY¥h—uÛÊÕ˚}}}˝˜©ï≠X±\"€æ}{auÊc«éeEΩΩΩŸßü~öΩ˚ÓªŸO<ë≈ÎSÁjO˙of÷ÍóÎtB/Æ≤\Z*Ùbõ`zÍJ]ï[Í˝,µm#Ï@\r’vƒhïÙÑ‰æ˚Óª‰·ánª„é;æÛÕ7ù•ë8r‰H∂yÛÊlÓ‹πﬂ766Óù1c∆?è«Œ‘Áõü2Ùbõ`zÍJ]ïSÍ¯,ÓY:ﬁ!ä≥ã/Œbﬂﬂﬁﬁûuuue<æoèÉÈœ>˚,[æ|y·u”ßO?YßÍùÙ{~*M∑öõõõnø˝ˆ£/ΩÙR÷◊◊óù©m€∂e©3ud÷¨Y+&MöÙ„Ò‘ôÍÌÿû}ÚﬂÛN<ìûãmÇIË©+uU±/Óüuº‘––êΩÚ +ÖŒ“HDNƒYãt>†CUWW∑?˝;Q™2ÓÃô3Á7w›u◊±?¸0M»ZZZé§/kg˙_8^:S—v}Ú	°œ	%°ßÆ‘U;RõÚüò∆#Pg\"¶~¨^Ω:ÀœßMÌ€‘‹öÒ’ëjjj˙n§G%#Ò⁄kØ}W__ˇóÙe˛˚q—ô:t(˚¸ñùx*&=€ì–SWÍ™‘èH≈Èº¸ÿ3’——ëÕû=;ﬂ°:XWW˜K)À∏8µ#RcŸë*ZπrÂ°‘°Í®ˆ™SÖ^¨D˝ŸÊßÜú€€¨V-Ù‘ï∫*•˛9R«;:[∑nì˝|Ã±ä˘T˘™Ùﬁ§-5+&õ«©∂∂∂¨T^}ı’Œ©SßæUÕW˙\rzáe]üøó}¸Óøx≈Øâ◊\ZMzÍJ]ï`DÍg˘…Ê1\"5ñb≤˙¢Eã¨OkXI]jıÙﬁ«1Ÿº‘ÓΩ˜ﬁŒ∫∫∫¶ZÍLùj‘¿hÇ–SWÍ™\\“˛ˆ˜˘9R£yjo∏˘≤3fÃ»OJˇw©KÕâu§b˘É—∏jÔúW?6uÍ‘?UÎë …BÔtF\rÜMTBO]©´±rÊØ⁄;”…Ê#4\röê~âÙ•¶ƒÇú±VHπ<ˆÿcÌqøV:S?4äMP	=u•Æ∆Ëﬂ™bá&ñ?(µXÃ9◊°z\\˙R3‚1±R˘H‰Â—©Ó‘ô˙¶\ZÁNùÓ%Ïö–SWÍ™úbÙøxãòX∂†\Z\r∂sÁŒÎO544¸D\nSñ-[∂8Œõó€ùwﬁ˘áÙeˇG°ßÈL©+u5˙˙oZ\\Ë»ƒvÂí_‘3ÌÛ%Ö©	q”‚U´VïΩ3µtÈ“Õït™/}ñ÷”È‹	=°ßÆ‘U5‘UúV+’|√y„ç7LDßˆ477˜ƒMãÀmÎ÷≠m±à\\•¸]rGN≠Èˇs°\'Ù‘ïVÕuï_§3nH_∆}}~d™U\nS\Zèî„‹˘`{˜ÓÌäıG*mÁîøaÁ…é¸Ñû–SWÍ™\ZÍ*=∑ß∏ΩîWÒ\rˆ’W_\rXsJ\nSb\"b)÷9ÒÂ™‡ù”Ò#©¸NJË	=u•Æ™°ÆÚœ« ‰ÂãxÊ?ã¶&D1WäjËLÂè¸b8]Ë	=u•Æ™°ÆÚ?W¬æ^g\n#S%¯ÇUKzïﬂ‘ï¶Æ6#S0 *eŒTOOOgÖœô*∂mqÁÛ‚öX•ΩÙ6Ö6‘œc˘ûÉ€h˝o0Ç†Æ‘UiÎ ú)Cè<Ú»7ÌÌÌïr5ﬂ¶\nﬁ9\rªRŒm)GËçˆ{	=u•Æ [WÆÊÉ1ÎL≠^Ω∫\"÷ô™§€‰vJ[baπ°Vg/wË≠\\π2ª¸ÚÀ≥sŒ9\';ÔºÛ≤kÆπ¶∞ plÎÈÈ…næ˘ÊÏ‹sœ-lªÒ∆≥Øø˛z¿Ôà◊_q≈#\n´\r6dó]vY·=/∏‡ÇÏ≈_<Âg…ˇû%Kñßé¸x=u•ÆJZWi€Sï∞ŒTºwÓÛ>%Ö©	---O,Z¥®Ïù©¶¶¶O“kbÌúN:bPi°w˛˘ÁÔ⁄µ+{ˇ˝˜èã!72çü?˙Ë£¨≠≠≠¯∫ÎÆ;÷Æ]õuvvé(Ù\"‚ΩˆÏŸSÿü·Tü•¯{û}ˆŸ¬ø∑›v€xAPWÍ™,uï:Yıï∞˙ÏŸ≥Ûù©õ§05!ˆÖ∑‹rÀ˜}}}Â\\c*ÓÕ˜◊¥ì˛õj˚˚ï\"ÙŒ>˚ÏB/ûã«W]uU·Á8jø˛˙Î≥‘9.åƒ∂98k–‹îx.B1u§ßQ\"‘zË°B†Â∑˜Yé\'ü|“m?‘ï∫*°i”¶˝4oæî{æ‘¡∏_†¶f§ÿ◊Ø__∂Œ‘”O?˝A:™˙m5˛ÌJzqjcpË≈sÒ8B+>√=˜‹ì]|Ò≈Ömó^zÈÄ–;Y∞ùuösMNˆ∫	&ûã€Â∑˜YäØkjj*|ˆ8m#Ù‘ï∫*˘÷ÒySÀó//˘æ~Ÿ≤e˘Œ‘“óö2gŒú)<¿wÂX\"°ØØÔË‘©SˇGM:S\'oq4ÅÔµi”¶„sRb€ïW^Y¯yÀñ-Ö”*Ò¯¢ã.*lK◊¬œœ=˜\\·îL<æ˙Í´œ8ÙäaZ¸ù≈Ì√}ñ¸ÎÍÎÎè◊≠[\'Ù‘ï∫*°¸©æ∆∆∆í.ë–——Q+æ™£êæ‘úÙ≈⁄;‘R[∏p·ˆjûÑXä–€Ω{wvÌµ◊¬&N√Lú8Ò¯‹ÿv√\r7é „4Hú\"ââº±mÔﬁΩÖ˘-±-˛€ò◊Ø?”–ã”,Ò˚b~J~˚pü%ˇ∫∑ﬂ~ªxÚ‰…BO]©´Í_\"·„báf≈ä%€◊/X∞ É„ﬂI]j“Ãô3ˇi∆åGˆÔﬂ_≤/W:˝<)˝q“§I?÷ô“Ñû∫RW•ùäë¢/ø¸rÃ˜ıq≈xÓÙﬁ—‘ô∫\\ÍR≥fÕöıüKó.=Zä”}ùùù}qz/E˛¢öˇfBOË©+uUmRáfU±ssˇ˝˜gcy“ÊÕõúﬁKmñ¥•¶≈≠∑ﬁ∫ÎÂó_>2ñ©ÓÓÓc\r\r\rùÈÈæjˇõ	=°ßÆ‘Uµô4i“Ö©S”SÏ‡ƒÚ8qõó±ËH≈)aìŒw‚R’È”ß˜._æ¸XçHıw§◊¬ﬂKË	=u•Æ™Q‹P;µ˝≈éNÃiÍÌÌ’S{ÉF§ﬁ©Ê)0bqe]}}}«Ûœ?øw¥ÁH≈©ΩZëzBO]©´\Z8x˛UqÌ©h1ä∑{9”´ˆÊÕõ7¯ˆ6:Råﬂ™‘Òy+ÆÚ€Ω{˜°3]˛ Æ⁄ã…Ê’>GJË	=u•’Jg*ƒ>9uvæÕw~bÖÙëﬁø/‰åu§çFNÌÈH1Ó’’’5•N’æG}Ù„ù;wéh§*V6oiiŸ£QÈµ¨øPBOË©+uUœ“>zœ‡&ﬂ}˜›ŸÎØø^Xá,Æ˙+Œ´ä£Û£XqØΩXπ˛$7[>j≤9‰D\'(})Ê«ómÊÃôX≤d…ñuÎ÷}îæLªÛùßﬁﬁﬁ}ÈÀ’7-é{Ì≈-bbeÛj]êSË	=u•çáŒTq?sYèR˝êÎHY˛\0Ü©˙y«Íù‘vı}øD]q◊Ú‘èõW„ΩˆÑû–SW⁄xÏLıﬂ√oa~r˙i∂ò{ıÇïÕ°\'Ù‘ï6Æ;SEq0‹?üÍÒ˛ÉÁ¡ßª¶Lô“\Zw∞HØ_ªi1 ÙÑû∫“t¶\0Ñû¶3•©+\0°ß	=u•Æ\0t¶4°ßÆ‘\0BOË©+Mg\n`l≠]ªV∞Tv;òBÔ®∫“‘@Ö⁄∏qcWww∑p©–÷——Ò)Ùv®+M]T®˜ﬁ{Ô_÷Ø_ˇÁ}˚ˆ˝üê©¨ëÉº5k÷ÏNÌ&u•©+Ä\nñv™øLG©€bÿ?ÊQh—‚ˇã’xÍJ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ú‡ˇCB/O«v¬u\0\0\0\0IENDÆB`Ç',1),('3',1,'/processes/MyProcess.myProcess.png','1','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0S\0\0	\0\0\0∞º¢‰\0\0ÎIDATx⁄Ì›}lUeûp«∏&ì8l¢âcb≤CåÏcúƒ’«∏∆d≤;F°≠/¨ı%FW\ZHp—d1Zqúƒ∑¯≤∆\r—›ÇºÖÖà:]¥¡—ADl≠fp∫ºÍŸÁw”KN-T⁄˚÷œ\'y¬Ì=◊ﬁ;ùﬂ=ﬂÁ<Á9œ9Î,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*Zñe?˙‚ã/ﬁ‹∫uÎwk◊ÆÕZ[[µ\nhk÷¨…6n‹¯MjıÍJSW\0,o”¶MYwwwv¯a≠ÇZOOO∂a√Üø§\0ºI]iÍ\n†B≈»Å¿´Ë‡;‹⁄⁄∫C]iÍ\n†B≈)·RŸ-ÖﬁQu•©+Ä\nÛ(K≈á^¶Æ4uPÂ°˜◊?we_l{!k_≥†–‚q<\'îÑû∫RW\0:SßÿÈ~ªø#˚‰øö≥ˇ}{ˆÄœ≈6¡$Ù‘ï∫–ô\Z¶ÌiÎÑ¿+∂Ø€W	&°ßÆ‘ÄŒ‘pm«∫2Ùbõ`zÍJ]ËL\r”>iù?dË≈6¡$Ù‘ï∫™4S¶L˘€∫∫∫_\'èß∂.µ=©eπ÷ï⁄ñÙöﬂ¶◊ﬁë_\"‡4Ãü?ˇ\'---è.\\∏ÉÊÊÊû∆∆∆#”¶M;˛Âö9sÊ±|pˇÇ⁄ûyÊôﬂÃù;˜Ôt¶Ñû–SWÍ™zLû<˘©ÉÙª¥O?8®Ût™v4:W©5Lú8ÒGY¥h—uÛÊÕ˚}}}˝˜©ï≠X±\"€æ}{auÊc«éeEΩΩΩŸßü~öΩ˚ÓªŸO<ë≈ÎSÁjO˙of÷ÍóÎtB/Æ≤\Z*Ùbõ`zÍJ]ï[Í˝,µm#Ï@\r’vƒhïÙÑ‰æ˚Óª‰·ánª„é;æÛÕ7ù•ë8r‰H∂yÛÊlÓ‹πﬂ766Óù1c∆?è«Œ‘Áõü2Ùbõ`zÍJ]ïSÍ¯,ÓY:ﬁ!ä≥ã/Œbﬂﬂﬁﬁûuuue<æoèÉÈœ>˚,[æ|y·u”ßO?YßÍùÙ{~*M∑öõõõnø˝ˆ£/ΩÙR÷◊◊óù©m€∂e©3ud÷¨Y+&MöÙ„Ò‘ôÍÌÿû}ÚﬂÛN<ìûãmÇIË©+uU±/Óüuº‘––êΩÚ +ÖŒ“HDNƒYãt>†CUWW∑?˝;Q™2ÓÃô3Á7w›u◊±?¸0M»ZZZé§/kg˙_8^:S—v}Ú	°œ	%°ßÆ‘U;RõÚüò∆#Pg\"¶~¨^Ω:ÀœßMÌ€‘‹öÒ’ëjjj˙n§G%#Ò⁄kØ}W__ˇóÙe˛˚q—ô:t(˚¸ñùx*&=€ì–SWÍ™‘èH≈Èº¸ÿ3’——ëÕû=;ﬂ°:XWW˜K)À∏8µ#RcŸë*ZπrÂ°‘°Í®ˆ™SÖ^¨D˝ŸÊßÜú€€¨V-Ù‘ï∫*•˛9R«;:[∑nì˝|Ã±ä˘T˘™Ùﬁ§-5+&õ«©∂∂∂¨T^}ı’Œ©SßæUÕW˙\rzáe]üøó}¸Óøx≈Øâ◊\ZMzÍJ]ï`DÍg˘…Ê1\"5ñb≤˙¢Eã¨OkXI]jıÙﬁ«1Ÿº‘ÓΩ˜ﬁŒ∫∫∫¶ZÍLùj‘¿hÇ–SWÍ™\\“˛ˆ˜˘9R£yjo∏˘≤3fÃ»OJˇw©KÕâu§b˘É—∏jÔúW?6uÍ‘?UÎë …BÔtF\rÜMTBO]©´±rÊØ⁄;”…Ê#4\röê~âÙ•¶ƒÇú±VHπ<ˆÿcÌqøV:S?4äMP	=u•Æ∆Ëﬂ™bá&ñ?(µXÃ9◊°z\\˙R3‚1±R˘H‰Â—©Ó‘ô˙¶\ZÁNùÓ%Ïö–SWÍ™úbÙøxãòX∂†\Z\r∂sÁŒÎO544¸D\nSñ-[∂8Œõó€ùwﬁ˘áÙeˇG°ßÈL©+u5˙˙oZ\\Ë»ƒvÂí_‘3ÌÛ%Ö©	q”‚U´VïΩ3µtÈ“Õït™/}ñ÷”È‹	=°ßÆ‘U5‘UúV+’|√y„ç7LDßˆ477˜ƒMãÀmÎ÷≠m±à\\•¸]rGN≠Èˇs°\'Ù‘ïVÕuï_§3nH_∆}}~d™U\nS\Zèî„‹˘`{˜ÓÌäıG*mÁîøaÁ…é¸Ñû–SWÍ™\ZÍ*=∑ß∏ΩîWÒ\rˆ’W_\rXsJ\nSb\"b)÷9ÒÂ™‡ù”Ò#©¸NJË	=u•Æ™°ÆÚœ« ‰ÂãxÊ?ã¶&D1WäjËLÂè¸b8]Ë	=u•Æ™°ÆÚ?W¬æ^g\n#S%¯ÇUKzïﬂ‘ï¶Æ6#S0 *eŒTOOOgÖœô*∂mqÁÛ‚öX•ΩÙ6Ö6‘œc˘ûÉ€h˝o0Ç†Æ‘UiÎ ú)Cè<Ú»7ÌÌÌïr5ﬂ¶\nﬁ9\rªRŒm)GËçˆ{	=u•Æ [WÆÊÉ1ÎL≠^Ω∫\"÷ô™§€‰vJ[baπ°Vg/wË≠\\π2ª¸ÚÀ≥sŒ9\';ÔºÛ≤kÆπ¶∞ plÎÈÈ…næ˘ÊÏ‹sœ-lªÒ∆≥Øø˛z¿Ôà◊_q≈#\n´\r6dó]vY·=/∏‡ÇÏ≈_<Âg…ˇû%Kñßé¸x=u•ÆJZWi€Sï∞ŒTºwÓÛ>%Ö©	---O,Z¥®Ïù©¶¶¶O“kbÌúN:bPi°w˛˘ÁÔ⁄µ+{ˇ˝˜èã!72çü?˙Ë£¨≠≠≠¯∫ÎÆ;÷Æ]õuvvé(Ù\"‚ΩˆÏŸSÿü·Tü•¯{û}ˆŸ¬ø∑›v€xAPWÍ™,uï:Yıï∞˙ÏŸ≥Ûù©õ§05!ˆÖ∑‹rÀ˜}}}Â\\c*ÓÕ˜◊¥ì˛õj˚˚ï\"ÙŒ>˚ÏB/ûã«W]uU·Á8jø˛˙Î≥‘9.åƒ∂98k–‹îx.B1u§ßQ\"‘zË°B†Â∑˜Yé\'ü|“m?‘ï∫*°i”¶˝4oæî{æ‘¡∏_†¶f§ÿ◊Ø__∂Œ‘”O?˝A:™˙m5˛ÌJzqjcpË≈sÒ8B+>√=˜‹ì]|Ò≈Ömó^zÈÄ–;Y∞ùuösMNˆ∫	&ûã€Â∑˜YäØkjj*|ˆ8m#Ù‘ï∫*˘÷ÒySÀó//˘æ~Ÿ≤e˘Œ‘“óö2gŒú)<¿wÂX\"°ØØÔË‘©SˇGM:S\'oq4ÅÔµi”¶„sRb€ïW^Y¯yÀñ-Ö”*Ò¯¢ã.*lK◊¬œœ=˜\\·îL<æ˙Í´œ8ÙäaZ¸ù≈Ì√}ñ¸ÎÍÎÎè◊≠[\'Ù‘ï∫*°¸©æ∆∆∆í.ë–——Q+æ™£êæ‘úÙ≈⁄;‘R[∏p·ˆjûÑXä–€Ω{wvÌµ◊¬&N√Lú8Ò¯‹ÿv√\r7é „4Hú\"ââº±mÔﬁΩÖ˘-±-˛€ò◊Ø?”–ã”,Ò˚b~J~˚pü%ˇ∫∑ﬂ~ªxÚ‰…BO]©´Í_\"·„báf≈ä%€◊/X∞ É„ﬂI]j“Ãô3ˇi∆åGˆÔﬂ_≤/W:˝<)˝q“§I?÷ô“Ñû∫RW•ùäë¢/ø¸rÃ˜ıq≈xÓÙﬁ—‘ô∫\\ÍR≥fÕöıüKó.=Zä”}ùùù}qz/E˛¢öˇfBOË©+uUmRáfU±ssˇ˝˜gcy“ÊÕõúﬁKmñ¥•¶≈≠∑ﬁ∫ÎÂó_>2ñ©ÓÓÓc\r\r\rùÈÈæjˇõ	=°ßÆ‘Uµô4i“Ö©S”SÏ‡ƒÚ8qõó±ËH≈)aìŒw‚R’È”ß˜._æ¸XçHıw§◊¬ﬂKË	=u•Æ™Q‹P;µ˝≈éNÃiÍÌÌ’S{ÉF§ﬁ©Ê)0bqe]}}}«Ûœ?øw¥ÁH≈©ΩZëzBO]©´\Z8x˛UqÌ©h1ä∑{9”´ˆÊÕõ7¯ˆ6:Råﬂ™‘Òy+ÆÚ€Ω{˜°3]˛ Æ⁄ã…Ê’>GJË	=u•’Jg*ƒ>9uvæÕw~bÖÙëﬁø/‰åu§çFNÌÈH1Ó’’’5•N’æG}Ù„ù;wéh§*V6oiiŸ£QÈµ¨øPBOË©+uUœ“>zœ‡&ﬂ}˜›ŸÎØø^Xá,Æ˙+Œ´ä£Û£XqØΩXπ˛$7[>j≤9‰D\'(})Ê«ómÊÃôX≤d…ñuÎ÷}îæLªÛùßﬁﬁﬁ}ÈÀ’7-é{Ì≈-bbeÛj]êSË	=u•çáŒTq?sYèR˝êÎHY˛\0Ü©˙y«Íù‘vı}øD]q◊Ú‘èõW„ΩˆÑû–SW⁄xÏLıﬂ√oa~r˙i∂ò{ıÇïÕ°\'Ù‘ï6Æ;SEq0‹?üÍÒ˛ÉÁ¡ßª¶Lô“\Zw∞HØ_ªi1 ÙÑû∫“t¶\0Ñû¶3•©+\0°ß	=u•Æ\0t¶4°ßÆ‘\0BOË©+Mg\n`l≠]ªV∞Tv;òBÔ®∫“‘@Ö⁄∏qcWww∑p©–÷——Ò)Ùv®+M]T®˜ﬁ{Ô_÷Ø_ˇÁ}˚ˆ˝üê©¨ëÉº5k÷ÏNÌ&u•©+Ä\nñv™øLG©€bÿ?ÊQh—‚ˇã’xÍJ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ú‡ˇCB/O«v¬u\0\0\0\0IENDÆB`Ç',1),('6',1,'/processes/MyProcess.bpmn','5','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"User Task\"></userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"170.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"250.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"400.0\" y=\"200.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"550.0\" y=\"210.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"205.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"355.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"400.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"505.0\" y=\"227.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"550.0\" y=\"227.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7',1,'/processes/MyProcess.myProcess.png','5','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0S\0\0	\0\0\0∞º¢‰\0\0ÎIDATx⁄Ì›}lUeûp«∏&ì8l¢âcb≤CåÏcúƒ’«∏∆d≤;F°≠/¨ı%FW\ZHp—d1Zqúƒ∑¯≤∆\r—›ÇºÖÖà:]¥¡—ADl≠fp∫ºÍŸÁw”KN-T⁄˚÷œ\'y¬Ì=◊ﬁ;ùﬂ=ﬂÁ<Á9œ9Î,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*Zñe?˙‚ã/ﬁ‹∫uÎwk◊ÆÕZ[[µ\nhk÷¨…6n‹¯MjıÍJSW\0,o”¶MYwwwv¯a≠ÇZOOO∂a√Üø§\0ºI]iÍ\n†B≈»Å¿´Ë‡;‹⁄⁄∫C]iÍ\n†B≈)·RŸ-ÖﬁQu•©+Ä\nÛ(K≈á^¶Æ4uPÂ°˜◊?we_l{!k_≥†–‚q<\'îÑû∫RW\0:SßÿÈ~ªø#˚‰øö≥ˇ}{ˆÄœ≈6¡$Ù‘ï∫–ô\Z¶ÌiÎÑ¿+∂Ø€W	&°ßÆ‘ÄŒ‘pm«∫2Ùbõ`zÍJ]ËL\r”>iù?dË≈6¡$Ù‘ï∫™4S¶L˘€∫∫∫_\'èß∂.µ=©eπ÷ï⁄ñÙöﬂ¶◊ﬁë_\"‡4Ãü?ˇ\'---è.\\∏ÉÊÊÊû∆∆∆#”¶M;˛Âö9sÊ±|pˇÇ⁄ûyÊôﬂÃù;˜Ôt¶Ñû–SWÍ™zLû<˘©ÉÙª¥O?8®Ût™v4:W©5Lú8ÒGY¥h—uÛÊÕ˚}}}˝˜©ï≠X±\"€æ}{auÊc«éeEΩΩΩŸßü~öΩ˚ÓªŸO<ë≈ÎSÁjO˙of÷ÍóÎtB/Æ≤\Z*Ùbõ`zÍJ]ï[Í˝,µm#Ï@\r’vƒhïÙÑ‰æ˚Óª‰·ánª„é;æÛÕ7ù•ë8r‰H∂yÛÊlÓ‹πﬂ766Óù1c∆?è«Œ‘Áõü2Ùbõ`zÍJ]ïSÍ¯,ÓY:ﬁ!ä≥ã/Œbﬂﬂﬁﬁûuuue<æoèÉÈœ>˚,[æ|y·u”ßO?YßÍùÙ{~*M∑öõõõnø˝ˆ£/ΩÙR÷◊◊óù©m€∂e©3ud÷¨Y+&MöÙ„Ò‘ôÍÌÿû}ÚﬂÛN<ìûãmÇIË©+uU±/Óüuº‘––êΩÚ +ÖŒ“HDNƒYãt>†CUWW∑?˝;Q™2ÓÃô3Á7w›u◊±?¸0M»ZZZé§/kg˙_8^:S—v}Ú	°œ	%°ßÆ‘U;RõÚüò∆#Pg\"¶~¨^Ω:ÀœßMÌ€‘‹öÒ’ëjjj˙n§G%#Ò⁄kØ}W__ˇóÙe˛˚q—ô:t(˚¸ñùx*&=€ì–SWÍ™‘èH≈Èº¸ÿ3’——ëÕû=;ﬂ°:XWW˜K)À∏8µ#RcŸë*ZπrÂ°‘°Í®ˆ™SÖ^¨D˝ŸÊßÜú€€¨V-Ù‘ï∫*•˛9R«;:[∑nì˝|Ã±ä˘T˘™Ùﬁ§-5+&õ«©∂∂∂¨T^}ı’Œ©SßæUÕW˙\rzáe]üøó}¸Óøx≈Øâ◊\ZMzÍJ]ï`DÍg˘…Ê1\"5ñb≤˙¢Eã¨OkXI]jıÙﬁ«1Ÿº‘ÓΩ˜ﬁŒ∫∫∫¶ZÍLùj‘¿hÇ–SWÍ™\\“˛ˆ˜˘9R£yjo∏˘≤3fÃ»OJˇw©KÕâu§b˘É—∏jÔúW?6uÍ‘?UÎë …BÔtF\rÜMTBO]©´±rÊØ⁄;”…Ê#4\röê~âÙ•¶ƒÇú±VHπ<ˆÿcÌqøV:S?4äMP	=u•Æ∆Ëﬂ™bá&ñ?(µXÃ9◊°z\\˙R3‚1±R˘H‰Â—©Ó‘ô˙¶\ZÁNùÓ%Ïö–SWÍ™úbÙøxãòX∂†\Z\r∂sÁŒÎO544¸D\nSñ-[∂8Œõó€ùwﬁ˘áÙeˇG°ßÈL©+u5˙˙oZ\\Ë»ƒvÂí_‘3ÌÛ%Ö©	q”‚U´VïΩ3µtÈ“Õït™/}ñ÷”È‹	=°ßÆ‘U5‘UúV+’|√y„ç7LDßˆ477˜ƒMãÀmÎ÷≠m±à\\•¸]rGN≠Èˇs°\'Ù‘ïVÕuï_§3nH_∆}}~d™U\nS\Zèî„‹˘`{˜ÓÌäıG*mÁîøaÁ…é¸Ñû–SWÍ™\ZÍ*=∑ß∏ΩîWÒ\rˆ’W_\rXsJ\nSb\"b)÷9ÒÂ™‡ù”Ò#©¸NJË	=u•Æ™°ÆÚœ« ‰ÂãxÊ?ã¶&D1WäjËLÂè¸b8]Ë	=u•Æ™°ÆÚ?W¬æ^g\n#S%¯ÇUKzïﬂ‘ï¶Æ6#S0 *eŒTOOOgÖœô*∂mqÁÛ‚öX•ΩÙ6Ö6‘œc˘ûÉ€h˝o0Ç†Æ‘UiÎ ú)Cè<Ú»7ÌÌÌïr5ﬂ¶\nﬁ9\rªRŒm)GËçˆ{	=u•Æ [WÆÊÉ1ÎL≠^Ω∫\"÷ô™§€‰vJ[baπ°Vg/wË≠\\π2ª¸ÚÀ≥sŒ9\';ÔºÛ≤kÆπ¶∞ plÎÈÈ…næ˘ÊÏ‹sœ-lªÒ∆≥Øø˛z¿Ôà◊_q≈#\n´\r6dó]vY·=/∏‡ÇÏ≈_<Âg…ˇû%Kñßé¸x=u•ÆJZWi€Sï∞ŒTºwÓÛ>%Ö©	---O,Z¥®Ïù©¶¶¶O“kbÌúN:bPi°w˛˘ÁÔ⁄µ+{ˇ˝˜èã!72çü?˙Ë£¨≠≠≠¯∫ÎÆ;÷Æ]õuvvé(Ù\"‚ΩˆÏŸSÿü·Tü•¯{û}ˆŸ¬ø∑›v€xAPWÍ™,uï:Yıï∞˙ÏŸ≥Ûù©õ§05!ˆÖ∑‹rÀ˜}}}Â\\c*ÓÕ˜◊¥ì˛õj˚˚ï\"ÙŒ>˚ÏB/ûã«W]uU·Á8jø˛˙Î≥‘9.åƒ∂98k–‹îx.B1u§ßQ\"‘zË°B†Â∑˜Yé\'ü|“m?‘ï∫*°i”¶˝4oæî{æ‘¡∏_†¶f§ÿ◊Ø__∂Œ‘”O?˝A:™˙m5˛ÌJzqjcpË≈sÒ8B+>√=˜‹ì]|Ò≈Ömó^zÈÄ–;Y∞ùuösMNˆ∫	&ûã€Â∑˜YäØkjj*|ˆ8m#Ù‘ï∫*˘÷ÒySÀó//˘æ~Ÿ≤e˘Œ‘“óö2gŒú)<¿wÂX\"°ØØÔË‘©SˇGM:S\'oq4ÅÔµi”¶„sRb€ïW^Y¯yÀñ-Ö”*Ò¯¢ã.*lK◊¬œœ=˜\\·îL<æ˙Í´œ8ÙäaZ¸ù≈Ì√}ñ¸ÎÍÎÎè◊≠[\'Ù‘ï∫*°¸©æ∆∆∆í.ë–——Q+æ™£êæ‘úÙ≈⁄;‘R[∏p·ˆjûÑXä–€Ω{wvÌµ◊¬&N√Lú8Ò¯‹ÿv√\r7é „4Hú\"ââº±mÔﬁΩÖ˘-±-˛€ò◊Ø?”–ã”,Ò˚b~J~˚pü%ˇ∫∑ﬂ~ªxÚ‰…BO]©´Í_\"·„báf≈ä%€◊/X∞ É„ﬂI]j“Ãô3ˇi∆åGˆÔﬂ_≤/W:˝<)˝q“§I?÷ô“Ñû∫RW•ùäë¢/ø¸rÃ˜ıq≈xÓÙﬁ—‘ô∫\\ÍR≥fÕöıüKó.=Zä”}ùùù}qz/E˛¢öˇfBOË©+uUmRáfU±ssˇ˝˜gcy“ÊÕõúﬁKmñ¥•¶≈≠∑ﬁ∫ÎÂó_>2ñ©ÓÓÓc\r\r\rùÈÈæjˇõ	=°ßÆ‘Uµô4i“Ö©S”SÏ‡ƒÚ8qõó±ËH≈)aìŒw‚R’È”ß˜._æ¸XçHıw§◊¬ﬂKË	=u•Æ™Q‹P;µ˝≈éNÃiÍÌÌ’S{ÉF§ﬁ©Ê)0bqe]}}}«Ûœ?øw¥ÁH≈©ΩZëzBO]©´\Z8x˛UqÌ©h1ä∑{9”´ˆÊÕõ7¯ˆ6:Råﬂ™‘Òy+ÆÚ€Ω{˜°3]˛ Æ⁄ã…Ê’>GJË	=u•’Jg*ƒ>9uvæÕw~bÖÙëﬁø/‰åu§çFNÌÈH1Ó’’’5•N’æG}Ù„ù;wéh§*V6oiiŸ£QÈµ¨øPBOË©+uUœ“>zœ‡&ﬂ}˜›ŸÎØø^Xá,Æ˙+Œ´ä£Û£XqØΩXπ˛$7[>j≤9‰D\'(})Ê«ómÊÃôX≤d…ñuÎ÷}îæLªÛùßﬁﬁﬁ}ÈÀ’7-é{Ì≈-bbeÛj]êSË	=u•çáŒTq?sYèR˝êÎHY˛\0Ü©˙y«Íù‘vı}øD]q◊Ú‘èõW„ΩˆÑû–SW⁄xÏLıﬂ√oa~r˙i∂ò{ıÇïÕ°\'Ù‘ï6Æ;SEq0‹?üÍÒ˛ÉÁ¡ßª¶Lô“\Zw∞HØ_ªi1 ÙÑû∫“t¶\0Ñû¶3•©+\0°ß	=u•Æ\0t¶4°ßÆ‘\0BOË©+Mg\n`l≠]ªV∞Tv;òBÔ®∫“‘@Ö⁄∏qcWww∑p©–÷——Ò)Ùv®+M]T®˜ﬁ{Ô_÷Ø_ˇÁ}˚ˆ˝üê©¨ëÉº5k÷ÏNÌ&u•©+Ä\nñv™øLG©€bÿ?ÊQh—‚ˇã’xÍJ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ú‡ˇCB/O«v¬u\0\0\0\0IENDÆB`Ç',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','5001',3),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1',NULL,NULL,'','2018-09-24 19:40:06.233'),('2501',NULL,NULL,'','2018-09-24 19:43:13.862'),('2505',NULL,NULL,'','2018-09-24 19:43:14.470'),('5',NULL,NULL,'','2018-09-24 19:40:06.849');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('myProcess:1:4',1,'http://www.activiti.org/test','My process','myProcess',1,'1','/processes/MyProcess.bpmn','/processes/MyProcess.myProcess.png',NULL,0,1,1,''),('myProcess:2:8',1,'http://www.activiti.org/test','My process','myProcess',2,'5','/processes/MyProcess.bpmn','/processes/MyProcess.myProcess.png',NULL,0,1,1,''),('myProcess:3:2504',1,'http://www.activiti.org/test','My process','myProcess',3,'2501','/processes/MyProcess.bpmn','/processes/MyProcess.myProcess.png',NULL,0,1,1,''),('myProcess:4:2508',1,'http://www.activiti.org/test','My process','myProcess',4,'2505','/processes/MyProcess.bpmn','/processes/MyProcess.myProcess.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_bin DEFAULT '‰∏≠ÂõΩ',
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

insert  into `student`(`id`,`username`,`age`) values (1,'‰∏≠ÂõΩ',12),(2,'‰∏≠ÂõΩ',12),(3,'‰∏≠ÂõΩ',6),(4,'‰∏≠ÂõΩ',6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
