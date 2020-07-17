-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `subjectparams` longtext COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `messageparams` longtext COLLATE utf8mb4_bin,
  `file` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  KEY `activity_time` (`timestamp`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT '0',
  `amq_latest_send` int(11) NOT NULL DEFAULT '0',
  `amq_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `amq_appid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subjectparams` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`),
  KEY `appconfig_appid_key` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('accessibility','enabled','yes'),('accessibility','installed_version','1.1.0'),('accessibility','types',''),('activity','enabled','yes'),('activity','installed_version','2.8.2'),('activity','types','filesystem'),('backgroundjob','lastjob','24'),('bruteforcesettings','enabled','yes'),('bruteforcesettings','installed_version','1.3.0'),('bruteforcesettings','types',''),('cloud_federation_api','enabled','yes'),('cloud_federation_api','installed_version','0.1.0'),('cloud_federation_api','types','filesystem'),('comments','enabled','yes'),('comments','installed_version','1.5.0'),('comments','types','logging'),('core','default_encryption_module','OC_DEFAULT_MODULE'),('core','installed.bundles','[\"CoreBundle\"]'),('core','installedat','1547714373.0593'),('core','lastcron','1547715496'),('core','lastupdatedat','1547714373.0614'),('core','oc.integritycheck.checker','[]'),('core','public_files','files_sharing/public.php'),('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),('core','scss.variables','db81cddf52fdb3c8ca1e4c859e214124'),('core','vendor','nextcloud'),('dav','enabled','yes'),('dav','installed_version','1.8.1'),('dav','types','filesystem'),('encryption','enabled','no'),('encryption','installed_version','2.3.0'),('encryption','masterKeyId','master_2ad7b4a5'),('encryption','publicShareKeyId','pubShare_2ad7b4a5'),('encryption','recoveryKeyId','recoveryKey_2ad7b4a5'),('encryption','types','filesystem'),('federatedfilesharing','enabled','yes'),('federatedfilesharing','installed_version','1.5.0'),('federatedfilesharing','types',''),('federation','autoAddServers','1'),('federation','enabled','yes'),('federation','installed_version','1.5.0'),('federation','types','authentication'),('files','cronjob_scan_files','500'),('files','enabled','yes'),('files','installed_version','1.10.0'),('files','types','filesystem'),('files_external','enabled','no'),('files_external','installed_version','1.6.0'),('files_external','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','1.4.0'),('files_pdfviewer','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','1.7.0'),('files_sharing','types','filesystem'),('files_texteditor','enabled','yes'),('files_texteditor','installed_version','2.7.0'),('files_texteditor','types',''),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','1.5.0'),('files_trashbin','types','filesystem,dav'),('files_versions','enabled','yes'),('files_versions','installed_version','1.8.0'),('files_versions','types','filesystem,dav'),('files_videoplayer','enabled','yes'),('files_videoplayer','installed_version','1.4.0'),('files_videoplayer','types',''),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','2.4.0'),('firstrunwizard','types','logging'),('gallery','enabled','yes'),('gallery','installed_version','18.2.0'),('gallery','types',''),('logreader','enabled','yes'),('logreader','installed_version','2.0.0'),('logreader','types',''),('lookup_server_connector','enabled','yes'),('lookup_server_connector','installed_version','1.3.0'),('lookup_server_connector','types','authentication'),('nextcloud_announcements','enabled','yes'),('nextcloud_announcements','installed_version','1.4.0'),('nextcloud_announcements','pub_date','Sat, 10 Dec 2016 00:00:00 +0100'),('nextcloud_announcements','types','logging'),('notifications','enabled','yes'),('notifications','installed_version','2.3.0'),('notifications','types','logging'),('oauth2','enabled','yes'),('oauth2','installed_version','1.3.0'),('oauth2','types','authentication'),('password_policy','enabled','yes'),('password_policy','installed_version','1.5.0'),('password_policy','types',''),('provisioning_api','enabled','yes'),('provisioning_api','installed_version','1.5.0'),('provisioning_api','types','prevent_group_restriction'),('serverinfo','enabled','yes'),('serverinfo','installed_version','1.5.0'),('serverinfo','types',''),('sharebymail','enabled','yes'),('sharebymail','installed_version','1.5.0'),('sharebymail','types','filesystem'),('support','enabled','no'),('support','installed_version','1.0.0'),('support','types',''),('survey_client','enabled','no'),('survey_client','installed_version','1.3.0'),('survey_client','types',''),('systemtags','enabled','yes'),('systemtags','installed_version','1.5.0'),('systemtags','types','logging'),('theming','enabled','no'),('theming','installed_version','1.6.0'),('theming','types','logging'),('twofactor_backupcodes','enabled','yes'),('twofactor_backupcodes','installed_version','1.4.1'),('twofactor_backupcodes','types',''),('updatenotification','enabled','no'),('updatenotification','installed_version','1.5.0'),('updatenotification','types',''),('user_ldap','cleanUpJobOffset','0'),('user_ldap','enabled','yes'),('user_ldap','installed_version','1.5.0'),('user_ldap','s01_lastChange','1547715475'),('user_ldap','s01has_memberof_filter_support','0'),('user_ldap','s01home_folder_naming_rule',''),('user_ldap','s01last_jpegPhoto_lookup','0'),('user_ldap','s01ldap_agent_password',''),('user_ldap','s01ldap_attributes_for_group_search',''),('user_ldap','s01ldap_attributes_for_user_search',''),('user_ldap','s01ldap_backup_host',''),('user_ldap','s01ldap_backup_port',''),('user_ldap','s01ldap_base','{{LDAP_BASE_USER_TREE}}'),('user_ldap','s01ldap_base_groups','{{LDAP_BASE_GROUP_TREE}}'),('user_ldap','s01ldap_base_users','{{LDAP_BASE_USER_TREE}}'),('user_ldap','s01ldap_cache_ttl','600'),('user_ldap','s01ldap_configuration_active','1'),('user_ldap','s01ldap_default_ppolicy_dn',''),('user_ldap','s01ldap_display_name','cn'),('user_ldap','s01ldap_dn',''),('user_ldap','s01ldap_dynamic_group_member_url',''),('user_ldap','s01ldap_email_attr',''),('user_ldap','s01ldap_experienced_admin','0'),('user_ldap','s01ldap_expert_username_attr',''),('user_ldap','s01ldap_expert_uuid_group_attr','cn'),('user_ldap','s01ldap_expert_uuid_user_attr','uid'),('user_ldap','s01ldap_gid_number','gidNumber'),('user_ldap','s01ldap_group_display_name','cn'),('user_ldap','s01ldap_group_filter','(objectclass=x-lliurex-group)'),('user_ldap','s01ldap_group_filter_mode','1'),('user_ldap','s01ldap_group_member_assoc_attribute','memberUid'),('user_ldap','s01ldap_groupfilter_groups',''),('user_ldap','s01ldap_groupfilter_objectclass',''),('user_ldap','s01ldap_host','ldap://localhost'),('user_ldap','s01ldap_login_filter','(&(|(objectclass=person))(uid=%uid))'),('user_ldap','s01ldap_login_filter_mode','0'),('user_ldap','s01ldap_loginfilter_attributes',''),('user_ldap','s01ldap_loginfilter_email','0'),('user_ldap','s01ldap_loginfilter_username','1'),('user_ldap','s01ldap_nested_groups','0'),('user_ldap','s01ldap_override_main_server',''),('user_ldap','s01ldap_paging_size','500'),('user_ldap','s01ldap_port','389'),('user_ldap','s01ldap_quota_attr',''),('user_ldap','s01ldap_quota_def',''),('user_ldap','s01ldap_tls','0'),('user_ldap','s01ldap_turn_off_cert_check','0'),('user_ldap','s01ldap_turn_on_pwd_change','0'),('user_ldap','s01ldap_user_avatar_rule','default'),('user_ldap','s01ldap_user_display_name_2',''),('user_ldap','s01ldap_user_filter_mode','1'),('user_ldap','s01ldap_userfilter_groups',''),('user_ldap','s01ldap_userfilter_objectclass','posixAccount'),('user_ldap','s01ldap_userlist_filter','(objectclass=*)'),('user_ldap','s01use_memberof_to_detect_membership','1'),('user_ldap','types','authentication'),('workflowengine','enabled','yes'),('workflowengine','installed_version','1.5.0'),('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `login_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `password` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `remember` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  `scope` longtext COLLATE utf8mb4_bin,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext COLLATE utf8mb4_bin,
  `public_key` longtext COLLATE utf8mb4_bin,
  `version` smallint(5) unsigned NOT NULL DEFAULT '1',
  `password_invalid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_index` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`),
  KEY `authtoken_version_index` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `metadata` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrenceid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attendee` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `organizer` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classification` int(11) DEFAULT '0',
  `calendartype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parameter` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8mb4_bin,
  `components` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/system/system','Contact birthdays','contact_birthdays',1,NULL,0,'#FFFFCA',NULL,'VEVENT,VTODO',0);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `refreshrate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `source` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT '0',
  `carddata` longblob,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E98F2EC48B26C2E9` (`addressbookid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT '0',
  `cardid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `IDX_811F5CFA8B26C2E9` (`addressbookid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `children_count` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `actor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_bin,
  `verb` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  UNIQUE KEY `comments_marker_index` (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_credentials`
--

DROP TABLE IF EXISTS `oc_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_credentials` (
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `credentials` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`user`,`identifier`),
  KEY `credentials_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_credentials`
--

LOCK TABLES `oc_credentials` WRITE;
/*!40000 ALTER TABLE `oc_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_applicable`
--

DROP TABLE IF EXISTS `oc_external_applicable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_applicable` (
  `applicable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`applicable_id`),
  UNIQUE KEY `applicable_type_value_mount` (`type`,`value`,`mount_id`),
  KEY `applicable_mount` (`mount_id`),
  KEY `applicable_type_value` (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_applicable`
--

LOCK TABLES `oc_external_applicable` WRITE;
/*!40000 ALTER TABLE `oc_external_applicable` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_applicable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_config`
--

DROP TABLE IF EXISTS `oc_external_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4096) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_mount_key` (`mount_id`,`key`),
  KEY `config_mount` (`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_config`
--

LOCK TABLES `oc_external_config` WRITE;
/*!40000 ALTER TABLE `oc_external_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_mounts`
--

DROP TABLE IF EXISTS `oc_external_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_mounts` (
  `mount_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_point` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `storage_backend` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `auth_backend` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '100',
  `type` int(11) NOT NULL,
  PRIMARY KEY (`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_mounts`
--

LOCK TABLES `oc_external_mounts` WRITE;
/*!40000 ALTER TABLE `oc_external_mounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_options`
--

DROP TABLE IF EXISTS `oc_external_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_options` (
  `option_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_mount_key` (`mount_id`,`key`),
  KEY `option_mount` (`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_options`
--

LOCK TABLES `oc_external_options` WRITE;
/*!40000 ALTER TABLE `oc_external_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` int(11) NOT NULL,
  `remote_id` int(11) NOT NULL COMMENT 'share ID at the remote server',
  UNIQUE KEY `share_id_index` (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT '0',
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/4a49de377fd7cff58cd9cd987dde649f',1547718015),(2,0,'files/00d303f083a0e12e22aeedf18cfea27a',1547718015);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT '0',
  `path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT '0',
  `mimepart` bigint(20) NOT NULL DEFAULT '0',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `mtime` bigint(11) NOT NULL DEFAULT '0',
  `storage_mtime` bigint(11) NOT NULL DEFAULT '0',
  `encrypted` int(11) NOT NULL DEFAULT '0',
  `unencrypted_size` bigint(20) NOT NULL DEFAULT '0',
  `etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT '0',
  `checksum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_mtime` (`mtime`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,3864220,1547715497,1547714415,0,0,'5c4043a9f37a2',23,''),(2,1,'appdata_ocntcyhrwg8x','21506de50537f3a779224a1107f945d9',1,'appdata_ocntcyhrwg8x',2,1,3864220,1547715497,1547714389,0,0,'5c4043a9f37a2',31,''),(3,1,'appdata_ocntcyhrwg8x/appstore','5c20b2841680cdcfd464f02ade5ca7a8',2,'appstore',2,1,614222,1547715475,1547714415,0,0,'5c404393dbd7f',31,''),(4,1,'appdata_ocntcyhrwg8x/appstore/apps.json','d92846d9f6ca6cda0bbc0b2d6870d578',3,'apps.json',4,3,494613,1547715180,1547715180,0,0,'d12b0789f3ec2161f781190470ae97a0',27,''),(5,1,'appdata_ocntcyhrwg8x/preview','87d1870799619f6989837c0f6277e2f4',2,'preview',2,1,98800,1547714398,1547714398,0,0,'5c403f5ee1073',31,''),(6,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,10947753,1547714384,1547714384,0,0,'5c403f50c4845',23,''),(7,2,'files','45b963397aa40d4a0063e0d85e4fe7a1',6,'files',2,1,10947753,1547714384,1547714384,0,0,'5c403f50c4845',31,''),(8,2,'files/Nextcloud.mp4','77a79c09b93e57cba23c11eb0e6048a6',7,'Nextcloud.mp4',6,5,462413,1547714384,1547714384,0,0,'9119604e80d64cc8582d7349d4ab28e7',27,''),(9,2,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',7,'Nextcloud Manual.pdf',7,3,4646274,1547714384,1547714384,0,0,'ab9ea946fd216fa45a1c81806ca61adf',27,''),(10,2,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',7,'Photos',2,1,3157336,1547714384,1547714384,0,0,'5c403f509b4cd',31,''),(11,2,'files/Photos/Nut.jpg','aa8daeb975e1d39412954fd5cd41adb4',10,'Nut.jpg',9,8,955026,1547714384,1547714384,0,0,'cf49a1b8000a20d89b5aea869004c388',27,''),(12,2,'files/Photos/Coast.jpg','a6fe87299d78b207e9b7aba0f0cb8a0a',10,'Coast.jpg',9,8,819766,1547714384,1547714384,0,0,'801058d7a51584214f7f6a46bc1c91de',27,''),(13,2,'files/Photos/Hummingbird.jpg','e077463269c404ae0f6f8ea7f2d7a326',10,'Hummingbird.jpg',9,8,585219,1547714384,1547714384,0,0,'21c3a88f46da475d3e33afeaf4a6cc27',27,''),(14,2,'files/Photos/Nextcloud Community.jpg','ee47a9ab6cce8e8e0d4021d5eb51e3d8',10,'Nextcloud Community.jpg',9,8,797325,1547714384,1547714384,0,0,'3a2fb57f34dde55783334682b2c9daf4',27,''),(15,2,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',7,'Nextcloud.png',10,8,37042,1547714384,1547714384,0,0,'28aa40ef8cbfce41d2677fd9fb8171db',27,''),(16,2,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',7,'Documents',2,1,2644688,1547714384,1547714384,0,0,'5c403f50c4845',31,''),(17,2,'files/Documents/About.txt','9da7b739e7a65d74793b2881da521169',16,'About.txt',12,11,1074,1547714384,1547714384,0,0,'b73b03ceb3874515a6f936645b5d009d',27,''),(18,2,'files/Documents/User Data Manifesto.pdf','5e60cf6ee166400ac56993095e207c56',16,'User Data Manifesto.pdf',7,3,36861,1547714384,1547714384,0,0,'d0cd4192f3235f464c3e45bbe994f946',27,''),(19,2,'files/Documents/Nextcloud Flyer.pdf','dda5bc1db7ea6619926b0dac54e69262',16,'Nextcloud Flyer.pdf',7,3,2529331,1547714384,1547714384,0,0,'fc0d93368f959483219452498e20c820',27,''),(20,2,'files/Documents/About.odt','b2ee7d56df9f34a0195d4b611376e885',16,'About.odt',13,3,77422,1547714384,1547714384,0,0,'c5b31aaf759dacec08811ef221b54574',27,''),(21,1,'appdata_ocntcyhrwg8x/theming','0a93bae3fcc7b686fbc8f86e6b54a3df',2,'theming',2,1,337441,1547715497,1547714396,0,0,'5c4043a9f37a2',31,''),(22,1,'appdata_ocntcyhrwg8x/avatar','a846eb715053fdf0c18eda2e986cc06d',2,'avatar',2,1,132959,1547715486,1547715485,0,0,'5c40439e0d9b7',31,''),(23,1,'appdata_ocntcyhrwg8x/avatar/nextcloud_adm','3f9e0ff49b4845643d98d8e16fd25cb8',22,'nextcloud_adm',2,1,8653,1547714720,1547714720,0,0,'5c4040a0285e4',31,''),(24,1,'appdata_ocntcyhrwg8x/js','cb1a6401d690933e453e5a118cb152e0',2,'js',2,1,2282918,1547715495,1547714388,0,0,'5c4043a7c0834',31,''),(25,1,'appdata_ocntcyhrwg8x/js/core','17b2da039f8a5d31047d0c970d2e1f0e',24,'core',2,1,483619,1547715495,1547715495,0,0,'5c4043a7c0834',31,''),(26,1,'appdata_ocntcyhrwg8x/js/core/merged-template-prepend.js','8aec6c8d294fa5722bb616246bb9a8c9',25,'merged-template-prepend.js',14,3,158517,1547714387,1547714387,0,0,'cf9582a69474bac335395c728b9fc650',27,''),(27,1,'appdata_ocntcyhrwg8x/js/core/merged-template-prepend.js.deps','5e7418a79e1f550f5582b50b71f6942b',25,'merged-template-prepend.js.deps',15,3,1246,1547714387,1547714387,0,0,'d448e54eb55460e9602af94dfef5abda',27,''),(28,1,'appdata_ocntcyhrwg8x/js/core/merged-template-prepend.js.gzip','7fd604e981ebafde7af5b96498c058fe',25,'merged-template-prepend.js.gzip',16,3,42536,1547714387,1547714387,0,0,'5aa8a0345bed697353798d8ab417b847',27,''),(29,1,'appdata_ocntcyhrwg8x/js/core/merged-share-backend.js','8c168f780ee5423bae691ea302796f39',25,'merged-share-backend.js',14,3,207156,1547714387,1547714387,0,0,'c6355228c3f5d165ffdcea1654ccf7f3',27,''),(30,1,'appdata_ocntcyhrwg8x/js/core/merged-share-backend.js.deps','85605c2391b75c231441ca1808c13269',25,'merged-share-backend.js.deps',15,3,681,1547714387,1547714387,0,0,'2ec2441bd72a59c6ebc930ee532d35c5',27,''),(31,1,'appdata_ocntcyhrwg8x/js/core/merged-share-backend.js.gzip','40c247b1e5bb07d58a5e7a418bc7addc',25,'merged-share-backend.js.gzip',16,3,31435,1547714387,1547714387,0,0,'818a4d306befe3e0866f966a8c7889d2',27,''),(32,1,'appdata_ocntcyhrwg8x/js/files','7027429672219f42a985b87e2d3406ac',24,'files',2,1,470400,1547714387,1547714387,0,0,'5c403f53d3486',31,''),(33,1,'appdata_ocntcyhrwg8x/js/files/merged-index.js','7017c894cf2b500ff1d047d8bd40c749',32,'merged-index.js',14,3,380988,1547714387,1547714387,0,0,'98512748ac9589da8851b5f3161c3e6f',27,''),(34,1,'appdata_ocntcyhrwg8x/js/files/merged-index.js.deps','c9fbc192ea96a73761fbdf07a6aa1e31',32,'merged-index.js.deps',15,3,2099,1547714387,1547714387,0,0,'99862f94e44169018f52d1e345ec22fd',27,''),(35,1,'appdata_ocntcyhrwg8x/js/files/merged-index.js.gzip','cbb70796f00bfc09f768e616b03014a9',32,'merged-index.js.gzip',16,3,87313,1547714387,1547714387,0,0,'2e80bb39abe7a9ce164c5231061a3dba',27,''),(36,1,'appdata_ocntcyhrwg8x/js/activity','4fc222187d1a2a195de9435a1fd0eb70',24,'activity',2,1,32891,1547714387,1547714387,0,0,'5c403f54040cf',31,''),(37,1,'appdata_ocntcyhrwg8x/js/activity/activity-sidebar.js','e9613451b4e4ad2f8aa9910555a8f3d8',36,'activity-sidebar.js',14,3,27440,1547714387,1547714387,0,0,'d34f2c91b237afb344beccb893053544',27,''),(38,1,'appdata_ocntcyhrwg8x/js/activity/activity-sidebar.js.deps','d49cd04accb689755dab659d8528a006',36,'activity-sidebar.js.deps',15,3,527,1547714387,1547714387,0,0,'3f5e4f8081dbbb530f36fd7bd010345d',27,''),(39,1,'appdata_ocntcyhrwg8x/js/activity/activity-sidebar.js.gzip','7cd5f2e4dfd8e34818556804e5eff1d1',36,'activity-sidebar.js.gzip',16,3,4924,1547714387,1547714387,0,0,'2787f6b3401ff8c078eb0a8baff16523',27,''),(40,1,'appdata_ocntcyhrwg8x/js/comments','903d2276b5e75fd3b72d9d248719405d',24,'comments',2,1,101369,1547714388,1547714388,0,0,'5c403f5434b29',31,''),(41,1,'appdata_ocntcyhrwg8x/js/comments/merged.js','42ac1096aecc6781e1a7138b51bcea80',40,'merged.js',14,3,80271,1547714388,1547714388,0,0,'c15649445b42781ee426e365bf8fa416',27,''),(42,1,'appdata_ocntcyhrwg8x/js/comments/merged.js.deps','0300fe9206aefc920fb32e733fa82e3d',40,'merged.js.deps',15,3,1001,1547714388,1547714388,0,0,'4bf279e0d7191e2d89d7f4fa69d4914f',27,''),(43,1,'appdata_ocntcyhrwg8x/js/comments/merged.js.gzip','242a87d4211d1057143c88f2bbf86238',40,'merged.js.gzip',16,3,20097,1547714388,1547714388,0,0,'938d9f447e072dfafa115a3dcd593a10',27,''),(44,1,'appdata_ocntcyhrwg8x/js/files_versions','b31a3e4891875f90e0f0d1d55c3b52a5',24,'files_versions',2,1,21021,1547714388,1547714388,0,0,'5c403f54566d7',31,''),(45,1,'appdata_ocntcyhrwg8x/js/files_versions/merged.js','3671218c9c05512d5ff59aa0e0bb788d',44,'merged.js',14,3,16630,1547714388,1547714388,0,0,'8441ee6b24b1c0e6b7bf4efc4cd449ed',27,''),(46,1,'appdata_ocntcyhrwg8x/js/files_versions/merged.js.deps','769e73ed1437c4a46f1039690e856595',44,'merged.js.deps',15,3,469,1547714388,1547714388,0,0,'d23528003fe565b64505b7b6a6bc773b',27,''),(47,1,'appdata_ocntcyhrwg8x/js/files_versions/merged.js.gzip','b3f61ac75f759380dab48e58628945de',44,'merged.js.gzip',16,3,3922,1547714388,1547714388,0,0,'12e77cf10e05360f68213098b5a242ad',27,''),(48,1,'appdata_ocntcyhrwg8x/js/files_sharing','9bec8673a8083e46cf077812e6a2ac49',24,'files_sharing',2,1,19416,1547714388,1547714388,0,0,'5c403f546f51d',31,''),(49,1,'appdata_ocntcyhrwg8x/js/files_sharing/additionalScripts.js','f245231ed55eb4c6ea3aa5d89c371fbe',48,'additionalScripts.js',14,3,14612,1547714388,1547714388,0,0,'1ca7436ede4600721e53fdbfce2adf8f',27,''),(50,1,'appdata_ocntcyhrwg8x/js/files_sharing/additionalScripts.js.deps','df8be246b32d7eaf369760f423211703',48,'additionalScripts.js.deps',15,3,316,1547714388,1547714388,0,0,'1da3eb6443ae84791f313725286bf405',27,''),(51,1,'appdata_ocntcyhrwg8x/js/files_sharing/additionalScripts.js.gzip','3b531c67513a37611d11af0e8c9de328',48,'additionalScripts.js.gzip',16,3,4488,1547714388,1547714388,0,0,'1c59a34b41af2b0311fac4ddda2a2da9',27,''),(52,1,'appdata_ocntcyhrwg8x/js/files_texteditor','595a7092abd6fe7e6e9f115287bcaabf',24,'files_texteditor',2,1,839425,1547714388,1547714388,0,0,'5c403f54aa62d',31,''),(53,1,'appdata_ocntcyhrwg8x/js/files_texteditor/merged.js','ec9000d8df86296ad64b75c48a483774',52,'merged.js',14,3,699916,1547714388,1547714388,0,0,'fff29d1d21f4ee69d39abdb8c281f7e1',27,''),(54,1,'appdata_ocntcyhrwg8x/js/files_texteditor/merged.js.deps','66e8385d617e1b11ae480d5d89805770',52,'merged.js.deps',15,3,346,1547714388,1547714388,0,0,'9697380cb5c219853f695a557bc9fbec',27,''),(55,1,'appdata_ocntcyhrwg8x/js/files_texteditor/merged.js.gzip','395fccd8e7f880695865bfad9469c0ee',52,'merged.js.gzip',16,3,139163,1547714388,1547714388,0,0,'e238d625e7a5f6dea62a5306436ca739',27,''),(56,1,'appdata_ocntcyhrwg8x/js/gallery','d6b177de24d2c6e929a807dcb7f814a9',24,'gallery',2,1,290671,1547714388,1547714388,0,0,'5c403f54cf680',31,''),(57,1,'appdata_ocntcyhrwg8x/js/gallery/scripts-for-file-app.js','3a822c7726883fa473786c6050700e4a',56,'scripts-for-file-app.js',14,3,233904,1547714388,1547714388,0,0,'a24bfea1e5829d63f9f37125ce876a26',27,''),(58,1,'appdata_ocntcyhrwg8x/js/gallery/scripts-for-file-app.js.deps','0b18f33ef4febac6e444d00fa92c7d01',56,'scripts-for-file-app.js.deps',15,3,796,1547714388,1547714388,0,0,'ecb0146eb7f9207bf7227ea5bfff02b5',27,''),(59,1,'appdata_ocntcyhrwg8x/js/gallery/scripts-for-file-app.js.gzip','a485a403103367c3257de77d15cc9f76',56,'scripts-for-file-app.js.gzip',16,3,55971,1547714388,1547714388,0,0,'3666b4945f3fb41cf5f11c6101491bd2',27,''),(60,1,'appdata_ocntcyhrwg8x/js/core/merged.js','a3dca4630798295e962e466fee051343',25,'merged.js',14,3,25390,1547714388,1547714388,0,0,'33624f8024a4b494730476711f3a880b',27,''),(61,1,'appdata_ocntcyhrwg8x/js/core/merged.js.deps','c6eea308d74e2056265368d0cf52e06d',25,'merged.js.deps',15,3,543,1547714388,1547714388,0,0,'67e7ac09869c964b230f997a9cfa5408',27,''),(62,1,'appdata_ocntcyhrwg8x/js/core/merged.js.gzip','b62e3bd185884337d9e5b17924a087ee',25,'merged.js.gzip',16,3,5922,1547714388,1547714388,0,0,'125f0f46716d135d3d0c2e8974020c51',27,''),(63,1,'appdata_ocntcyhrwg8x/js/systemtags','fecae0ce072985323fb4a1f88bea6c2e',24,'systemtags',2,1,24106,1547714389,1547714389,0,0,'5c403f551c7af',31,''),(64,1,'appdata_ocntcyhrwg8x/js/systemtags/merged.js','397f9a26f2553ace3bff4bd7e4c7caa4',63,'merged.js',14,3,18287,1547714389,1547714389,0,0,'a9d847021cefde5178718f14e3e53f36',27,''),(65,1,'appdata_ocntcyhrwg8x/js/systemtags/merged.js.deps','1961186143dace23db3b5ba8be833ad1',63,'merged.js.deps',15,3,459,1547714389,1547714389,0,0,'dab140003a4c2cd2ae65e78f42461b22',27,''),(66,1,'appdata_ocntcyhrwg8x/js/systemtags/merged.js.gzip','ed0d63080a763fbf094467ae9bda82ca',63,'merged.js.gzip',16,3,5360,1547714389,1547714389,0,0,'b3334e9e0c29d57f7dfa67a3cb92ae14',27,''),(67,1,'appdata_ocntcyhrwg8x/css','23c1ace551b70f973e8bf8cd40c9459e',2,'css',2,1,397880,1547715243,1547715243,0,0,'5c4042ab7e569',31,''),(68,1,'appdata_ocntcyhrwg8x/css/icons','3aae144cba6d4fc5a939c5a2781d6ac1',67,'icons',2,1,127564,1547715243,1547714389,0,0,'5c4042ab65772',31,''),(69,1,'appdata_ocntcyhrwg8x/css/core','31c72964cab0cee609e965777955751f',67,'core',2,1,164894,1547714394,1547714393,0,0,'5c403f5a09e74',31,''),(70,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery-ui-fixes.css','18049bbba798846fb6c4033d747478a0',69,'339f-5593-jquery-ui-fixes.css',17,11,4908,1547714389,1547714389,0,0,'794ef322f7dc6cf47f08bf731048d0ee',27,''),(71,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery-ui-fixes.css.deps','675835b6032e973f7bdcf7002c690902',69,'339f-5593-jquery-ui-fixes.css.deps',15,3,193,1547714389,1547714389,0,0,'dd2e730e30230ecc4e27026545fd76c9',27,''),(72,1,'appdata_ocntcyhrwg8x/css/icons/icons-list.template','4b8ae586128591fb670db928be33687e',68,'icons-list.template',15,3,14685,1547715243,1547715243,0,0,'d5ba7d575d6bb8395290682f40fd0b43',27,''),(73,1,'appdata_ocntcyhrwg8x/css/icons/icons-vars.css','a7c612a7323b7b6c8eaef2103660abfe',68,'icons-vars.css',17,11,112879,1547715243,1547715243,0,0,'03061255d1d3fc4aaf336d8dca752320',27,''),(74,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery-ui-fixes.css.gzip','d83399d0d03347a0ea06cab4e4a5c6de',69,'339f-5593-jquery-ui-fixes.css.gzip',16,3,927,1547714389,1547714389,0,0,'46b479b6070e9e8f91094604d59462a7',27,''),(75,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-server.css','411a55f5e79d2aa945a6b0601b42824e',69,'339f-5593-server.css',17,11,131426,1547714390,1547714390,0,0,'45be898453a7c2ebed25bed1ee050f49',27,''),(76,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-server.css.deps','f4596ddd8aef24105cb7c5557dcb3315',69,'339f-5593-server.css.deps',15,3,829,1547714390,1547714390,0,0,'0a804a92b57584ad90962c49a7af1c5c',27,''),(77,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-server.css.gzip','a46b63253261258727925c8d995503f8',69,'339f-5593-server.css.gzip',16,3,18900,1547714391,1547714391,0,0,'69bfdf500e382801466f5e8f5e951368',27,''),(78,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-css-variables.css','f995e72afca89d1950357a4e60405b3f',69,'339f-5593-css-variables.css',17,11,938,1547714391,1547714391,0,0,'526bc97d7fc94e7916cb6b2524326c05',27,''),(79,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-css-variables.css.deps','b4380e8d11f0944b3be105b4fa351af4',69,'339f-5593-css-variables.css.deps',15,3,191,1547714391,1547714391,0,0,'408a9c127768f4459d98c4b420430b76',27,''),(80,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-css-variables.css.gzip','615b4a3599f0adf024056c94e9b41d34',69,'339f-5593-css-variables.css.gzip',16,3,429,1547714391,1547714391,0,0,'81b1ab94baadc137bb8fce01b864405e',27,''),(81,1,'appdata_ocntcyhrwg8x/css/firstrunwizard','9c0fde109ed7693226746fe45cc361c9',67,'firstrunwizard',2,1,8171,1547714391,1547714391,0,0,'5c403f5778556',31,''),(82,1,'appdata_ocntcyhrwg8x/css/firstrunwizard/0d6d-5593-firstrunwizard.css','3e48fb99ad41c3d8de21d4fc80d1d76a',81,'0d6d-5593-firstrunwizard.css',17,11,6221,1547714391,1547714391,0,0,'ebc27fb3782ec6c1ba27888c3a7f0edf',27,''),(83,1,'appdata_ocntcyhrwg8x/css/firstrunwizard/0d6d-5593-firstrunwizard.css.deps','9b7f4745ae98680b3f9efe0e3fc71ec8',81,'0d6d-5593-firstrunwizard.css.deps',15,3,285,1547714391,1547714391,0,0,'eaab087829f36b403f1129383c85b94c',27,''),(84,1,'appdata_ocntcyhrwg8x/css/firstrunwizard/0d6d-5593-firstrunwizard.css.gzip','1a3c73914bd0985ae1bc1904be5d7dd6',81,'0d6d-5593-firstrunwizard.css.gzip',16,3,1665,1547714391,1547714391,0,0,'fdb582fc8f71ede2d601dd447b58d6c0',27,''),(85,1,'appdata_ocntcyhrwg8x/css/notifications','226c6f2182f2633b78178ea657dfe146',67,'notifications',2,1,4527,1547714391,1547714391,0,0,'5c403f57b7738',31,''),(86,1,'appdata_ocntcyhrwg8x/css/notifications/70e2-5593-styles.css','fa7929127c56314382ec2f92724ea969',85,'70e2-5593-styles.css',17,11,3471,1547714391,1547714391,0,0,'3cae28d51f1b234351a65a8affcc5691',27,''),(87,1,'appdata_ocntcyhrwg8x/css/notifications/70e2-5593-styles.css.deps','5d3d5bc7e93a16ca8d51bf6606169d01',85,'70e2-5593-styles.css.deps',15,3,199,1547714391,1547714391,0,0,'18ce47825cd28ec0bf740a9d48fbc487',27,''),(88,1,'appdata_ocntcyhrwg8x/css/notifications/70e2-5593-styles.css.gzip','b604ba61476d3624485d6e9f6fceed4e',85,'70e2-5593-styles.css.gzip',16,3,857,1547714391,1547714391,0,0,'389e3e85fb26451f5677acf2c8ea4615',27,''),(89,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery.ocdialog.css','ac1fd31836a5ddfe20778b2bf71c68ff',69,'339f-5593-jquery.ocdialog.css',17,11,1489,1547714391,1547714391,0,0,'5be915585ddf35066422d49ddfcaf796',27,''),(90,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery.ocdialog.css.deps','e18ec6c29a43debaf9d0a3131b7f5a41',69,'339f-5593-jquery.ocdialog.css.deps',15,3,193,1547714391,1547714391,0,0,'2412d59dd7a2a99c48962192b0189ff6',27,''),(91,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-jquery.ocdialog.css.gzip','8740e957b15b7a4f5213ffb23c84eb94',69,'339f-5593-jquery.ocdialog.css.gzip',16,3,609,1547714391,1547714391,0,0,'b68a47e5b34d2fa45145f8928e85b99e',27,''),(92,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-results.css','73cb9f1485e874d59a67c4993fea5396',69,'339f-5593-results.css',17,11,1189,1547714392,1547714392,0,0,'47d07acd052797b7d71a0fec25183b9c',27,''),(93,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-results.css.deps','0fbf0bf232b7e936e0e7e4ebff6ca394',69,'339f-5593-results.css.deps',15,3,193,1547714392,1547714392,0,0,'82a744b9d74132321198ff541ac23286',27,''),(94,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-results.css.gzip','dc16dbdfb6942d6369d1a3b958831713',69,'339f-5593-results.css.gzip',16,3,504,1547714392,1547714392,0,0,'c21b6f56befc370177a6e03b1b75bda9',27,''),(95,1,'appdata_ocntcyhrwg8x/css/files','95a4db504e4bb86759636a232d0ab8d9',67,'files',2,1,32265,1547714392,1547714392,0,0,'5c403f58c6123',31,''),(96,1,'appdata_ocntcyhrwg8x/css/files/e8ed-5593-merged.css','cb5b9841b686d32fd0e1f43108206562',95,'e8ed-5593-merged.css',17,11,26509,1547714392,1547714392,0,0,'e2c216e13cad6d720d7c83ccdc72006c',27,''),(97,1,'appdata_ocntcyhrwg8x/css/files/e8ed-5593-merged.css.deps','9e877f4d2ec571e8e40941ea0ca5c02f',95,'e8ed-5593-merged.css.deps',15,3,520,1547714392,1547714392,0,0,'62d05b48f6c39f4d1ed38a2362f882c4',27,''),(98,1,'appdata_ocntcyhrwg8x/css/files/e8ed-5593-merged.css.gzip','7d6c8bfeddc6161e357045bbbbddd2cd',95,'e8ed-5593-merged.css.gzip',16,3,5236,1547714392,1547714392,0,0,'2c1f40a3e16f48c6cbe8476b23645b7b',27,''),(99,1,'appdata_ocntcyhrwg8x/css/files_trashbin','6a72900c1457e90955a1845e16855c68',67,'files_trashbin',2,1,704,1547714392,1547714392,0,0,'5c403f590148f',31,''),(100,1,'appdata_ocntcyhrwg8x/css/files_trashbin/35c3-5593-trash.css','ebcc81b320c89295dcfbd87301aae125',99,'35c3-5593-trash.css',17,11,344,1547714392,1547714392,0,0,'af65898a458b586227e4a757bf0d1274',27,''),(101,1,'appdata_ocntcyhrwg8x/css/files_trashbin/35c3-5593-trash.css.deps','b063d36b917582500b5845535dcf6118',99,'35c3-5593-trash.css.deps',15,3,199,1547714392,1547714392,0,0,'c5f89d348b95513338dc21f33fd4c455',27,''),(102,1,'appdata_ocntcyhrwg8x/css/files_trashbin/35c3-5593-trash.css.gzip','840e38aa16c3c1eac3df6f991059ae43',99,'35c3-5593-trash.css.gzip',16,3,161,1547714392,1547714392,0,0,'1c7c24fb615731b7d9c04f3faef4d93a',27,''),(103,1,'appdata_ocntcyhrwg8x/css/comments','52a22c221a3dbfceb5987d3e93f0948d',67,'comments',2,1,8531,1547714393,1547714393,0,0,'5c403f595e130',31,''),(104,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-autocomplete.css','3056d0a62222b63b398235b181b48229',103,'35c3-5593-autocomplete.css',17,11,1211,1547714393,1547714393,0,0,'1c106b74563b806cf71d0b37b29ca412',27,''),(105,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-autocomplete.css.deps','a148cafeeb3ca49faaad16261df4a749',103,'35c3-5593-autocomplete.css.deps',15,3,200,1547714393,1547714393,0,0,'5d84fddc111b6df41704dcc2ab711e50',27,''),(106,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-autocomplete.css.gzip','020dc865ff23b6e8bb542fb17e3b88b5',103,'35c3-5593-autocomplete.css.gzip',16,3,434,1547714393,1547714393,0,0,'78da2a483f43f18d854481e256ea7b1b',27,''),(107,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-comments.css','6877bea6bde9a66437cbf6fff3a9092e',103,'35c3-5593-comments.css',17,11,5299,1547714393,1547714393,0,0,'b7c90ab26b2da9f98c6b33fb68ea009d',27,''),(108,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-comments.css.deps','35f494ebef6ef5e0bc517dd556910d0b',103,'35c3-5593-comments.css.deps',15,3,196,1547714393,1547714393,0,0,'5fcc7cf7da6378bfdace23e2f87f3acb',27,''),(109,1,'appdata_ocntcyhrwg8x/css/comments/35c3-5593-comments.css.gzip','279baac4bdb73d3d7166d9ad43dc4a7d',103,'35c3-5593-comments.css.gzip',16,3,1191,1547714393,1547714393,0,0,'f9fb8cd0a77f0c98007af00b24c9bb61',27,''),(110,1,'appdata_ocntcyhrwg8x/css/files_sharing','0bd428ad4cad36796cb9a9048b6ddd52',67,'files_sharing',2,1,7174,1547714393,1547714393,0,0,'5c403f59949e1',31,''),(111,1,'appdata_ocntcyhrwg8x/css/files_sharing/6a15-5593-mergedAdditionalStyles.css','38818291ab17ae6ce471eb8b958951a3',110,'6a15-5593-mergedAdditionalStyles.css',17,11,5371,1547714393,1547714393,0,0,'82ec551b6ca10c4857d7515b4d006ce7',27,''),(112,1,'appdata_ocntcyhrwg8x/css/files_sharing/6a15-5593-mergedAdditionalStyles.css.deps','54b012ad1d5c357fabab63a1bea9bca8',110,'6a15-5593-mergedAdditionalStyles.css.deps',15,3,378,1547714393,1547714393,0,0,'9fede110e6358b2c83b2fbfd6dac2c68',27,''),(113,1,'appdata_ocntcyhrwg8x/css/files_sharing/6a15-5593-mergedAdditionalStyles.css.gzip','c585bcfe0c4f07cf69d420dfe1fa2bfc',110,'6a15-5593-mergedAdditionalStyles.css.gzip',16,3,1425,1547714393,1547714393,0,0,'7c3f9080c80a26f6607691791f6f0613',27,''),(114,1,'appdata_ocntcyhrwg8x/css/files_texteditor','83f0e2f7f98e5676c063eaf9d0ad1003',67,'files_texteditor',2,1,5861,1547714393,1547714393,0,0,'5c403f59ca851',31,''),(115,1,'appdata_ocntcyhrwg8x/css/files_texteditor/b1d7-5593-merged.css','18a13888920d9404343b99b89352718c',114,'b1d7-5593-merged.css',17,11,4148,1547714393,1547714393,0,0,'e4ed8c66c7bd53ad5ba5a1741bf29795',27,''),(116,1,'appdata_ocntcyhrwg8x/css/files_texteditor/b1d7-5593-merged.css.deps','c787dee51ee83b3fd328c6e93e3b555e',114,'b1d7-5593-merged.css.deps',15,3,451,1547714393,1547714393,0,0,'e354aae62e1e83713dfabf33f11e08ca',27,''),(117,1,'appdata_ocntcyhrwg8x/css/files_texteditor/b1d7-5593-merged.css.gzip','9f7a8ca4707892cd73362b55bf518cfd',114,'b1d7-5593-merged.css.gzip',16,3,1262,1547714393,1547714393,0,0,'54a54ef9c918a57a6f1b8d079b9c0494',27,''),(118,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-systemtags.css','fcf890996207f67ddef6234dca1de186',69,'339f-5593-systemtags.css',17,11,1403,1547714393,1547714393,0,0,'9b3652ecc34a993cd998d29de7258bec',27,''),(119,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-systemtags.css.deps','32fe84b42fdd9efd44ca4ef5946f46ab',69,'339f-5593-systemtags.css.deps',15,3,188,1547714393,1547714393,0,0,'8ee5a27711ec83be54f1cf2e1a24b52b',27,''),(120,1,'appdata_ocntcyhrwg8x/css/core/339f-5593-systemtags.css.gzip','feff8ffdb869567b029c42d01f62436f',69,'339f-5593-systemtags.css.gzip',16,3,385,1547714394,1547714394,0,0,'09bddf81fa4c2e033a7899cc96053ed3',27,''),(121,1,'appdata_ocntcyhrwg8x/css/systemtags','a532a5afa1df0f5a43484fc6530c8334',67,'systemtags',2,1,714,1547714394,1547714394,0,0,'5c403f5a44395',31,''),(122,1,'appdata_ocntcyhrwg8x/css/systemtags/35c3-5593-systemtagsfilelist.css','62d83292c95b5a73719d97d122bcfbcf',121,'35c3-5593-systemtagsfilelist.css',17,11,296,1547714394,1547714394,0,0,'904af8b922e59b9055e7f375b2737765',27,''),(123,1,'appdata_ocntcyhrwg8x/css/systemtags/35c3-5593-systemtagsfilelist.css.deps','7ef101b45dadf25c7d6955a049121428',121,'35c3-5593-systemtagsfilelist.css.deps',15,3,208,1547714394,1547714394,0,0,'c21e110d03a4a4ee05c008ae6517b4ec',27,''),(124,1,'appdata_ocntcyhrwg8x/css/systemtags/35c3-5593-systemtagsfilelist.css.gzip','734c6a7fd02844e0480c8fc25f483241',121,'35c3-5593-systemtagsfilelist.css.gzip',16,3,210,1547714394,1547714394,0,0,'a9d091df6ea37081813464ff9e4880f9',27,''),(125,1,'appdata_ocntcyhrwg8x/css/theming','54e2b347139212fd3cb47eb4845bc77b',67,'theming',2,1,1533,1547714395,1547714395,0,0,'5c403f5b66d12',31,''),(126,1,'appdata_ocntcyhrwg8x/css/theming/ca9f-5593-theming.css','aceae3f10bad86965df9972012d62530',125,'ca9f-5593-theming.css',17,11,967,1547714395,1547714395,0,0,'227fd812910cd981fb5167a6d91599b8',27,''),(127,1,'appdata_ocntcyhrwg8x/css/theming/ca9f-5593-theming.css.deps','5d530e4bbe2b05930e4b7d9d6b29a5d6',125,'ca9f-5593-theming.css.deps',15,3,194,1547714395,1547714395,0,0,'0f89f8873aabbd03ee41f0d3d544f6a1',27,''),(128,1,'appdata_ocntcyhrwg8x/css/theming/ca9f-5593-theming.css.gzip','c228f7efbb21abce354d09cc65aa7319',125,'ca9f-5593-theming.css.gzip',16,3,372,1547714395,1547714395,0,0,'8fbfbb0c2c757affb4b10f7222a4cfc3',27,''),(129,1,'appdata_ocntcyhrwg8x/theming/0','40a34715e592a7478d0c3b330a1ae0d6',21,'0',2,1,337441,1547715497,1547715497,0,0,'5c4043a9f37a2',31,''),(130,1,'appdata_ocntcyhrwg8x/preview/15','a9ea393966f5225410e81b47b6328894',5,'15',2,1,98800,1547714398,1547714398,0,0,'5c403f5ee1073',31,''),(131,1,'appdata_ocntcyhrwg8x/theming/0/icon-core-filetypes_image.svg','178e858709a864ffc07bc407cf2b5f56',129,'icon-core-filetypes_image.svg',18,8,352,1547714398,1547714398,0,0,'cd149a4dd55e48df233924ace2631d95',27,''),(132,1,'appdata_ocntcyhrwg8x/theming/0/icon-core-filetypes_video.svg','91cae751d90221a5831c86c0381de1a3',129,'icon-core-filetypes_video.svg',18,8,277,1547714398,1547714398,0,0,'bbd79dd5fca46c9c11ad0d18be29e366',27,''),(133,1,'appdata_ocntcyhrwg8x/preview/15/500-500-max.png','e64f0d79e54fcd59b9a8628f6971b08b',130,'500-500-max.png',10,8,64951,1547714398,1547714398,0,0,'f921848e9373e84a02ae57ec8baea5dc',27,''),(134,1,'appdata_ocntcyhrwg8x/theming/0/icon-core-filetypes_folder.svg','a8e1d45d1ff41dc09f4d14508755ea0e',129,'icon-core-filetypes_folder.svg',18,8,255,1547714398,1547714398,0,0,'21d5f7bcf76b60fde75e34a7496b5a77',27,''),(135,1,'appdata_ocntcyhrwg8x/theming/0/icon-core-filetypes_application-pdf.svg','f0bf5b687955a3f41c822cfadcb75b80',129,'icon-core-filetypes_application-pdf.svg',18,8,676,1547714398,1547714398,0,0,'56301ce31ee5ad93429d3573ab52a8bf',27,''),(136,1,'appdata_ocntcyhrwg8x/preview/15/256-256-crop.png','1afda858c70ddd02b4349ca36e99a3e0',130,'256-256-crop.png',10,8,33849,1547714398,1547714398,0,0,'3ad6cfb5a1c75543794f111172f72d5d',27,''),(137,1,'appdata_ocntcyhrwg8x/theming/0/favIcon-files','74a402832ab48bfe89fc240a7581b3a6',129,'favIcon-files',15,3,90022,1547714399,1547714399,0,0,'0de5abafe20812321c7ae3c6131e7953',27,''),(138,1,'appdata_ocntcyhrwg8x/theming/0/touchIcon-files','4e22d7b582714d1fee8dcd2bfcf9b3e9',129,'touchIcon-files',15,3,8508,1547714399,1547714399,0,0,'49660781f493b8d68b950104a6954aaa',27,''),(139,1,'appdata_ocntcyhrwg8x/css/settings','180ed2f8060bdb23c5269e4301cc4ee6',67,'settings',2,1,34430,1547714414,1547714414,0,0,'5c403f6e26d3b',31,''),(140,1,'appdata_ocntcyhrwg8x/css/settings/339f-5593-settings.css','a012fd5c50799c4976cc5ba3457bbda2',139,'339f-5593-settings.css',17,11,28312,1547714414,1547714414,0,0,'9a106fb60b2ae36ad582f8605f20d46b',27,''),(141,1,'appdata_ocntcyhrwg8x/css/settings/339f-5593-settings.css.deps','25cd3a39650fdba78c66e71a6e8d2174',139,'339f-5593-settings.css.deps',15,3,190,1547714414,1547714414,0,0,'a041f5ca1604474fea5ad304d7515d95',27,''),(142,1,'appdata_ocntcyhrwg8x/css/settings/339f-5593-settings.css.gzip','a1ff4b2c203134548332f573deee5331',139,'339f-5593-settings.css.gzip',16,3,5928,1547714414,1547714414,0,0,'026c84ab11f78d6314282317563c44f1',27,''),(143,1,'appdata_ocntcyhrwg8x/appstore/categories.json','461ae0e37ea8a7493da631e2c6e72a45',3,'categories.json',4,3,119609,1547715475,1547715475,0,0,'8fb4c1d868f0424e538974fa7e239d4c',27,''),(144,1,'files_external','c270928b685e7946199afdfb898d27ea',1,'files_external',2,1,0,1547714415,1547714415,0,0,'5c403f6f81612',31,''),(145,1,'appdata_ocntcyhrwg8x/theming/0/touchIcon-settings','9b69c03405d759a0aba6bfa6732cdbed',129,'touchIcon-settings',15,3,28506,1547714417,1547714417,0,0,'0d340755cc6c698f2a7ffca40a94eee3',27,''),(146,1,'appdata_ocntcyhrwg8x/theming/0/favIcon-settings','391c5b584df332ff43a67940eb77066c',129,'favIcon-settings',15,3,90022,1547714417,1547714417,0,0,'3eded993efb87e9e18d5ab3a3c0b5c38',27,''),(147,1,'appdata_ocntcyhrwg8x/avatar/nextcloud_adm/avatar.png','6e87fe04087ae583ba69b89be51f1744',23,'avatar.png',10,8,7377,1547714680,1547714680,0,0,'c73d3276f703b892110515807b95aac4',27,''),(148,1,'appdata_ocntcyhrwg8x/avatar/nextcloud_adm/generated','143f71ec73560fa0f09940edecefc1b7',23,'generated',15,3,0,1547714680,1547714680,0,0,'6b8111fe110de19b0290afe60e8dda44',27,''),(149,1,'appdata_ocntcyhrwg8x/avatar/nextcloud_adm/avatar.145.png','7e1e6338cdd487298b79171aec3dac4d',23,'avatar.145.png',10,8,968,1547714680,1547714680,0,0,'4fd7918e9f5ed001df69f8ef971670d3',27,''),(150,1,'appdata_ocntcyhrwg8x/avatar/nextcloud_adm/avatar.32.png','9751d7bacf97f41ad7c3707619ebf597',23,'avatar.32.png',10,8,308,1547714720,1547714720,0,0,'437609524505a01d1818812213902339',27,''),(151,1,'appdata_ocntcyhrwg8x/theming/0/icon-core-filetypes_text.svg','05e09c39e9de28d6ef526860a5ab201d',129,'icon-core-filetypes_text.svg',18,8,295,1547714759,1547714759,0,0,'c070299231011d8d16972268f1e669fb',27,''),(152,1,'appdata_ocntcyhrwg8x/css/updatenotification','66789e1335802553092e4494eaf94fde',67,'updatenotification',2,1,1512,1547715243,1547715243,0,0,'5c4042ab7e569',31,''),(153,1,'appdata_ocntcyhrwg8x/css/updatenotification/35c3-5593-admin.css','6b36895dad4945eef2e2b2723b7a9d44',152,'35c3-5593-admin.css',17,11,970,1547715243,1547715243,0,0,'e484d6b20b97269fcfe89ece9fef398c',27,''),(154,1,'appdata_ocntcyhrwg8x/css/updatenotification/35c3-5593-admin.css.deps','a2659820ae9ebb775624f3b05283e6ea',152,'35c3-5593-admin.css.deps',15,3,203,1547715243,1547715243,0,0,'c58a50b1a584ac32672ecc896a490a10',27,''),(155,1,'appdata_ocntcyhrwg8x/css/updatenotification/35c3-5593-admin.css.gzip','7681aebfd10b2332cfec89add2811b2e',152,'35c3-5593-admin.css.gzip',16,3,339,1547715243,1547715243,0,0,'160dc72aa47c31f5de46b5cc0dde1b2e',27,''),(156,1,'appdata_ocntcyhrwg8x/avatar/9403839e-acf2-1038-8d28-b92303f70426','dd6c927f54c0a1cc65d68c3d6f6b5e1e',22,'9403839e-acf2-1038-8d28-b92303f70426',2,1,7468,1547715476,1547715476,0,0,'5c4043940d5a0',31,''),(157,1,'appdata_ocntcyhrwg8x/avatar/9403839e-acf2-1038-8d28-b92303f70426/avatar.png','2e4872b07a4f5822f9680d75b76e9002',156,'avatar.png',10,8,7468,1547715476,1547715476,0,0,'a8be8e5db92f0f40c510f669d4a43d75',27,''),(158,1,'appdata_ocntcyhrwg8x/avatar/9403839e-acf2-1038-8d28-b92303f70426/generated','76d0c53e9053c1e384b6ee1bbe8b51e6',156,'generated',15,3,0,1547715476,1547715476,0,0,'d8176bc82866161d876dc7e93d7517c8',27,''),(159,1,'appdata_ocntcyhrwg8x/avatar/940b92d2-acf2-1038-8d29-b92303f70426','560c14b793e33c405b380a77d9838802',22,'940b92d2-acf2-1038-8d29-b92303f70426',2,1,7442,1547715476,1547715476,0,0,'5c404394c5f48',31,''),(160,1,'appdata_ocntcyhrwg8x/avatar/940b92d2-acf2-1038-8d29-b92303f70426/avatar.png','69ac197395b3f96f59a0e1aa67b8b7d3',159,'avatar.png',10,8,7442,1547715476,1547715476,0,0,'12fc3c716c8b85680fe6cbd97cf9e28e',27,''),(161,1,'appdata_ocntcyhrwg8x/avatar/940b92d2-acf2-1038-8d29-b92303f70426/generated','43defa069d2e11d5199407594c55145b',159,'generated',15,3,0,1547715476,1547715476,0,0,'4b4a4e737a2aede21e6dbb66a4d0fd8e',27,''),(162,1,'appdata_ocntcyhrwg8x/avatar/94188366-acf2-1038-8d2a-b92303f70426','58ef8e9126f0a46f9a0071e85ea0ca70',22,'94188366-acf2-1038-8d2a-b92303f70426',2,1,7517,1547715477,1547715477,0,0,'5c4043958c5e0',31,''),(163,1,'appdata_ocntcyhrwg8x/avatar/94188366-acf2-1038-8d2a-b92303f70426/avatar.png','b14296cedc8cf11f265da27e63c562e4',162,'avatar.png',10,8,7517,1547715477,1547715477,0,0,'25e15a6e53b056cec5c2ac69bfe6692f',27,''),(164,1,'appdata_ocntcyhrwg8x/avatar/94188366-acf2-1038-8d2a-b92303f70426/generated','e2c35a0556a17f790370ff2ddc3406a8',162,'generated',15,3,0,1547715477,1547715477,0,0,'de3d82d1ebe494cb46246247a972bc67',27,''),(165,1,'appdata_ocntcyhrwg8x/avatar/942235a0-acf2-1038-8d2b-b92303f70426','ce25577228ef106ef3f564ac6622365d',22,'942235a0-acf2-1038-8d2b-b92303f70426',2,1,7475,1547715478,1547715478,0,0,'5c40439649ecf',31,''),(166,1,'appdata_ocntcyhrwg8x/avatar/942235a0-acf2-1038-8d2b-b92303f70426/avatar.png','a6afe6026eb5a40f19870f5d9ddcb273',165,'avatar.png',10,8,7475,1547715478,1547715478,0,0,'2abbcdb8922520f3582e0122041dad74',27,''),(167,1,'appdata_ocntcyhrwg8x/avatar/942235a0-acf2-1038-8d2b-b92303f70426/generated','1aa20a5e9317baa1b279d9e5793659a3',165,'generated',15,3,0,1547715478,1547715478,0,0,'0d0db9471b76b384ed542819c6b3c3f9',27,''),(168,1,'appdata_ocntcyhrwg8x/avatar/942ab05e-acf2-1038-8d2c-b92303f70426','d52c11fbcde12404eb52275a34aa26dc',22,'942ab05e-acf2-1038-8d2c-b92303f70426',2,1,7560,1547715478,1547715478,0,0,'5c404396b338a',31,''),(169,1,'appdata_ocntcyhrwg8x/avatar/942ab05e-acf2-1038-8d2c-b92303f70426/avatar.png','114a000fa3166298f5d93c1c945de8c1',168,'avatar.png',10,8,7560,1547715478,1547715478,0,0,'1526f8fd44fea1c277ea37dba54103ed',27,''),(170,1,'appdata_ocntcyhrwg8x/avatar/942ab05e-acf2-1038-8d2c-b92303f70426/generated','93d68e6808dbf0fae751a21308d2fb96',168,'generated',15,3,0,1547715478,1547715478,0,0,'18010c84dca6b026d7b39d16c4572a57',27,''),(171,1,'appdata_ocntcyhrwg8x/avatar/94329620-acf2-1038-8d2d-b92303f70426','575c1c4c12d916eafe49f560c7b57667',22,'94329620-acf2-1038-8d2d-b92303f70426',2,1,7651,1547715479,1547715479,0,0,'5c404397284d7',31,''),(172,1,'appdata_ocntcyhrwg8x/avatar/94329620-acf2-1038-8d2d-b92303f70426/avatar.png','e718d5518cb1ae78157014d158111d36',171,'avatar.png',10,8,7651,1547715479,1547715479,0,0,'bb16d323a166d013ee387cb17976c46a',27,''),(173,1,'appdata_ocntcyhrwg8x/avatar/94329620-acf2-1038-8d2d-b92303f70426/generated','a0ebe0a9313fa4ae556ea1dd0b66abe9',171,'generated',15,3,0,1547715479,1547715479,0,0,'028f9175bf5da61d14710df2440f4f2a',27,''),(174,1,'appdata_ocntcyhrwg8x/avatar/9439d8ae-acf2-1038-8d2e-b92303f70426','7448da832372b1f956a86b5c5c003228',22,'9439d8ae-acf2-1038-8d2e-b92303f70426',2,1,7442,1547715479,1547715479,0,0,'5c404397a0bd7',31,''),(175,1,'appdata_ocntcyhrwg8x/avatar/9439d8ae-acf2-1038-8d2e-b92303f70426/avatar.png','c268544bfcb43ca0e56dea741732e0b7',174,'avatar.png',10,8,7442,1547715479,1547715479,0,0,'7ea550ff166b0e5bfcd69b4f94a0e315',27,''),(176,1,'appdata_ocntcyhrwg8x/avatar/9439d8ae-acf2-1038-8d2e-b92303f70426/generated','9013cc5b5e86eac4e61f02eabce452e4',174,'generated',15,3,0,1547715479,1547715479,0,0,'1dd0353adde78bde47c58db4afab61c0',27,''),(177,1,'appdata_ocntcyhrwg8x/avatar/9440b480-acf2-1038-8d2f-b92303f70426','b99683ba34229968c608a5a8abcd121b',22,'9440b480-acf2-1038-8d2f-b92303f70426',2,1,7597,1547715480,1547715480,0,0,'5c40439828fcc',31,''),(178,1,'appdata_ocntcyhrwg8x/avatar/9440b480-acf2-1038-8d2f-b92303f70426/avatar.png','161321de00183055ec47ccdac0f91829',177,'avatar.png',10,8,7597,1547715480,1547715480,0,0,'2cf3677fe8a676a7288d6c3f19e8b5db',27,''),(179,1,'appdata_ocntcyhrwg8x/avatar/9440b480-acf2-1038-8d2f-b92303f70426/generated','1eb2641c98bcab3160bf7d0825ad3e4a',177,'generated',15,3,0,1547715480,1547715480,0,0,'66eb4ddccd26aba053cc60115258bdf3',27,''),(180,1,'appdata_ocntcyhrwg8x/avatar/94478b7a-acf2-1038-8d30-b92303f70426','b674b137f6d77d219456e74dbeb1ed68',22,'94478b7a-acf2-1038-8d30-b92303f70426',2,1,7686,1547715480,1547715480,0,0,'5c404398991eb',31,''),(181,1,'appdata_ocntcyhrwg8x/avatar/94478b7a-acf2-1038-8d30-b92303f70426/avatar.png','26e42660a84c40a06104c3afac1aa53d',180,'avatar.png',10,8,7686,1547715480,1547715480,0,0,'205a60b42046455ea128fef34a7c5cd1',27,''),(182,1,'appdata_ocntcyhrwg8x/avatar/94478b7a-acf2-1038-8d30-b92303f70426/generated','c7a032c0cf625080fc3450273eba054f',180,'generated',15,3,0,1547715480,1547715480,0,0,'134e3284302603252f88a21bdb9701d7',27,''),(183,1,'appdata_ocntcyhrwg8x/avatar/944ef20c-acf2-1038-8d31-b92303f70426','32fb18819e396fc6e3b52ea52f37d879',22,'944ef20c-acf2-1038-8d31-b92303f70426',2,1,7761,1547715481,1547715481,0,0,'5c40439913a8e',31,''),(184,1,'appdata_ocntcyhrwg8x/avatar/944ef20c-acf2-1038-8d31-b92303f70426/avatar.png','413cd7df31834035e5511ce391b6ae11',183,'avatar.png',10,8,7761,1547715481,1547715481,0,0,'0932e029cf3e1d96dc873634d96dad80',27,''),(185,1,'appdata_ocntcyhrwg8x/avatar/944ef20c-acf2-1038-8d31-b92303f70426/generated','b86b2442adabd3b4f4aa3b585c73659f',183,'generated',15,3,0,1547715481,1547715481,0,0,'9ccc9563ce00beef2bff51ac87f98609',27,''),(186,1,'appdata_ocntcyhrwg8x/avatar/513dd404-acf4-1038-8d3d-b92303f70426','1b89c973ebadd1f5a910e8ce0f9c4bdf',22,'513dd404-acf4-1038-8d3d-b92303f70426',2,1,4866,1547715481,1547715481,0,0,'5c4043998a2a0',31,''),(187,1,'appdata_ocntcyhrwg8x/avatar/513dd404-acf4-1038-8d3d-b92303f70426/avatar.png','2793c7fafdbcd57c10cc64fe809e8d34',186,'avatar.png',10,8,4866,1547715481,1547715481,0,0,'64c7575f8306c7414a7b11c15314e7b5',27,''),(188,1,'appdata_ocntcyhrwg8x/avatar/513dd404-acf4-1038-8d3d-b92303f70426/generated','b23fc054bd8a326c2d90ae5473548a0c',186,'generated',15,3,0,1547715481,1547715481,0,0,'99271afc928cee9eff6ae1b5d18856ce',27,''),(189,1,'appdata_ocntcyhrwg8x/avatar/51523c6e-acf4-1038-8d3e-b92303f70426','33299f3cf38efddb598220604cd5bc5a',22,'51523c6e-acf4-1038-8d3e-b92303f70426',2,1,4783,1547715482,1547715482,0,0,'5c40439a1c3a3',31,''),(190,1,'appdata_ocntcyhrwg8x/avatar/51523c6e-acf4-1038-8d3e-b92303f70426/avatar.png','36212008213e1266937e23423b2b3c4a',189,'avatar.png',10,8,4783,1547715482,1547715482,0,0,'41a7c5fe73b79140e41612c3fb7a8651',27,''),(191,1,'appdata_ocntcyhrwg8x/avatar/51523c6e-acf4-1038-8d3e-b92303f70426/generated','34804d65d353a319fc6155f00fadbc7a',189,'generated',15,3,0,1547715482,1547715482,0,0,'af485191e00713fe4abc29fffaa56160',27,''),(192,1,'appdata_ocntcyhrwg8x/avatar/5160e8fe-acf4-1038-8d3f-b92303f70426','ce9721363259a0cfb3871424e0b5d417',22,'5160e8fe-acf4-1038-8d3f-b92303f70426',2,1,4903,1547715482,1547715482,0,0,'5c40439a89ded',31,''),(193,1,'appdata_ocntcyhrwg8x/avatar/5160e8fe-acf4-1038-8d3f-b92303f70426/avatar.png','dfdb6fb9f4890476c32045bd2116c1f1',192,'avatar.png',10,8,4903,1547715482,1547715482,0,0,'1f9e92b516644c84d97dde97010be5df',27,''),(194,1,'appdata_ocntcyhrwg8x/avatar/5160e8fe-acf4-1038-8d3f-b92303f70426/generated','0091aa785890215e97b601c709880320',192,'generated',15,3,0,1547715482,1547715482,0,0,'cf24ad021baf1c398246b7e379fd4cb3',27,''),(195,1,'appdata_ocntcyhrwg8x/avatar/5169ca28-acf4-1038-8d40-b92303f70426','b5219bcb82fd5e52971af60615dbd9d7',22,'5169ca28-acf4-1038-8d40-b92303f70426',2,1,4959,1547715482,1547715482,0,0,'5c40439af2b87',31,''),(196,1,'appdata_ocntcyhrwg8x/avatar/5169ca28-acf4-1038-8d40-b92303f70426/avatar.png','3fe7ff003d54899fa13c55298d3fffd1',195,'avatar.png',10,8,4959,1547715482,1547715482,0,0,'643f05ec44c93f379e226afad012f01a',27,''),(197,1,'appdata_ocntcyhrwg8x/avatar/5169ca28-acf4-1038-8d40-b92303f70426/generated','e97c0003e9cb401cb69a06f1254336fe',195,'generated',15,3,0,1547715482,1547715482,0,0,'e84717d23722f5234c941415a7f1af3f',27,''),(198,1,'appdata_ocntcyhrwg8x/avatar/517292fc-acf4-1038-8d41-b92303f70426','408486b732376bb3185dea5c8fec2445',22,'517292fc-acf4-1038-8d41-b92303f70426',2,1,4807,1547715483,1547715483,0,0,'5c40439b6a060',31,''),(199,1,'appdata_ocntcyhrwg8x/avatar/517292fc-acf4-1038-8d41-b92303f70426/avatar.png','7b77b2053eb9f39dc7d617b7ac48f072',198,'avatar.png',10,8,4807,1547715483,1547715483,0,0,'83a394ddbea791ab39866d23f47f7024',27,''),(200,1,'appdata_ocntcyhrwg8x/avatar/517292fc-acf4-1038-8d41-b92303f70426/generated','5fb581bdd8d41f10676d6a71faa21de7',198,'generated',15,3,0,1547715483,1547715483,0,0,'fdcc47635452a0ce112040a1b99150d1',27,''),(201,1,'appdata_ocntcyhrwg8x/avatar/517ac120-acf4-1038-8d42-b92303f70426','37545f8d92ab2abdc66db467369bc74e',22,'517ac120-acf4-1038-8d42-b92303f70426',2,1,4899,1547715483,1547715483,0,0,'5c40439bd76a1',31,''),(202,1,'appdata_ocntcyhrwg8x/avatar/517ac120-acf4-1038-8d42-b92303f70426/avatar.png','a73d8b7e9cad7f5badeabe2ef10158b1',201,'avatar.png',10,8,4899,1547715483,1547715483,0,0,'3cca53f051043814c44e9f496c1b84ec',27,''),(203,1,'appdata_ocntcyhrwg8x/avatar/517ac120-acf4-1038-8d42-b92303f70426/generated','c20a7cebff0c8b882c4b6ef02599506e',201,'generated',15,3,0,1547715483,1547715483,0,0,'f40c2448ba4e6707a3128b375252642e',27,''),(204,1,'appdata_ocntcyhrwg8x/avatar/51833b66-acf4-1038-8d43-b92303f70426','74441ce1b40091441611a88c901b87b7',22,'51833b66-acf4-1038-8d43-b92303f70426',2,1,4925,1547715484,1547715484,0,0,'5c40439c6213e',31,''),(205,1,'appdata_ocntcyhrwg8x/avatar/51833b66-acf4-1038-8d43-b92303f70426/avatar.png','7b7652db4888ee1b28a087f5a277ae63',204,'avatar.png',10,8,4925,1547715484,1547715484,0,0,'f5b19076b92ce7d68087e82057505bbe',27,''),(206,1,'appdata_ocntcyhrwg8x/avatar/51833b66-acf4-1038-8d43-b92303f70426/generated','8ff880bfb9b116219098b901931aae7f',204,'generated',15,3,0,1547715484,1547715484,0,0,'7b708db2096128635ebe62e35df3e54f',27,''),(207,1,'appdata_ocntcyhrwg8x/avatar/518b3ac8-acf4-1038-8d44-b92303f70426','7b8ca71dba61d673ca6fec7334669da1',22,'518b3ac8-acf4-1038-8d44-b92303f70426',2,1,4903,1547715485,1547715485,0,0,'5c40439d0bd74',31,''),(208,1,'appdata_ocntcyhrwg8x/avatar/518b3ac8-acf4-1038-8d44-b92303f70426/avatar.png','ae18b1dda6e535429ec67ccafb6476ab',207,'avatar.png',10,8,4903,1547715484,1547715484,0,0,'2885e107b190be70eec74f24ca608ab6',27,''),(209,1,'appdata_ocntcyhrwg8x/avatar/518b3ac8-acf4-1038-8d44-b92303f70426/generated','638e5762bca2ace96623f9fd2898d111',207,'generated',15,3,0,1547715485,1547715485,0,0,'13bf411caa8e3f8172c9a049841191f2',27,''),(210,1,'appdata_ocntcyhrwg8x/avatar/519675fa-acf4-1038-8d45-b92303f70426','f22e5a62fe31927a75d269be0a92f014',22,'519675fa-acf4-1038-8d45-b92303f70426',2,1,4796,1547715485,1547715485,0,0,'5c40439d97a2c',31,''),(211,1,'appdata_ocntcyhrwg8x/avatar/519675fa-acf4-1038-8d45-b92303f70426/avatar.png','5a1b0e713ad8996cf8e74b5a29dd7de4',210,'avatar.png',10,8,4796,1547715485,1547715485,0,0,'ce71badf63eaac42e7593375a44ece49',27,''),(212,1,'appdata_ocntcyhrwg8x/avatar/519675fa-acf4-1038-8d45-b92303f70426/generated','4bdcc44afd152683b94607a748c88ef1',210,'generated',15,3,0,1547715485,1547715485,0,0,'abcf72cbc17096f9b11521689243037a',27,''),(213,1,'appdata_ocntcyhrwg8x/avatar/51a070be-acf4-1038-8d46-b92303f70426','dbe76aa7f213dc69f760bbd36ebbe6a4',22,'51a070be-acf4-1038-8d46-b92303f70426',2,1,4866,1547715486,1547715486,0,0,'5c40439e0d9b7',31,''),(214,1,'appdata_ocntcyhrwg8x/avatar/51a070be-acf4-1038-8d46-b92303f70426/avatar.png','fe58accd43839c189f0fb0ef83639fae',213,'avatar.png',10,8,4866,1547715486,1547715486,0,0,'5a4964cd05f95964a35f6fcb4daa4424',27,''),(215,1,'appdata_ocntcyhrwg8x/avatar/51a070be-acf4-1038-8d46-b92303f70426/generated','3e5124c4bb7ef8dda1fb136582b11c17',213,'generated',15,3,0,1547715486,1547715486,0,0,'0b3d60bffd72c7aae928f4a1cb7b47da',27,''),(216,1,'appdata_ocntcyhrwg8x/js/core/merged-login.js','5fce56f20e8281beb2f6b54fd0e7bf11',25,'merged-login.js',14,3,7624,1547715495,1547715495,0,0,'94dd635ae4430a8b099e9ffc83aa8af7',27,''),(217,1,'appdata_ocntcyhrwg8x/js/core/merged-login.js.deps','b4ac39528e2547b5ad686b63573382ba',25,'merged-login.js.deps',15,3,247,1547715495,1547715495,0,0,'79a58d593c15518fa42bd56f45bdd015',27,''),(218,1,'appdata_ocntcyhrwg8x/js/core/merged-login.js.gzip','cb29a6b828ac124c21b7c8461f699414',25,'merged-login.js.gzip',16,3,2322,1547715495,1547715495,0,0,'da1c9b1909b635912a96a83b54085619',27,''),(219,1,'appdata_ocntcyhrwg8x/theming/0/touchIcon-core','c336fc6afd7c255e3e147be6b594898b',129,'touchIcon-core',15,3,28506,1547715497,1547715497,0,0,'40a656f318bdb2af2bf58dd83db55b41',27,''),(220,1,'appdata_ocntcyhrwg8x/theming/0/favIcon-core','d6079997e02dc10ccd708549c20e1c43',129,'favIcon-core',15,3,90022,1547715497,1547715497,0,0,'87f83cd62a5b66ce203ce45a3c197060',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `operator` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `value` longtext COLLATE utf8mb4_bin,
  `hash` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `checks` longtext COLLATE utf8mb4_bin,
  `operation` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','{{ ADMIN_USER }}');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `argument` varchar(4000) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0',
  `last_checked` int(11) DEFAULT '0',
  `reserved_at` int(11) DEFAULT '0',
  `execution_duration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',1547714396,1547715434,0,0),(2,'OCA\\Federation\\SyncJob','null',1547714415,1547715470,0,0),(3,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1547714679,1547714679,0,0),(4,'OCA\\Files_Sharing\\ExpireSharesJob','null',1547714720,1547714720,0,0),(5,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1547714751,1547714751,0,0),(6,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1547714759,1547714759,0,0),(7,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1547714765,1547714765,0,0),(8,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1547714773,1547714773,0,0),(9,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',1547714783,1547714783,0,0),(10,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1547758374,0,0),(11,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',1547715174,1547715174,0,0),(12,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',1547715181,1547715181,0,0),(13,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',1547715185,1547715185,0,0),(14,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',1547715195,1547715195,0,0),(15,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',1547715244,1547715244,0,1),(16,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1547715329,1547715329,0,0),(17,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',1547715333,1547715333,0,0),(18,'OCA\\Survey_Client\\BackgroundJobs\\AdminNotification','null',0,1547758535,0,0),(19,'OC\\Authentication\\Token\\DefaultTokenCleanupJob','null',1547715335,1547715335,0,0),(20,'OC\\Log\\Rotate','null',1547715343,1547715343,0,0),(21,'OC\\Preview\\BackgroundCleanupJob','null',1547715347,1547715347,0,0),(23,'OCA\\User_LDAP\\Jobs\\UpdateGroups','null',1547715475,1547715475,0,11),(24,'OCA\\User_LDAP\\Jobs\\CleanUp','null',1547715496,1547715496,0,0),(25,'OCA\\User_LDAP\\Jobs\\Sync','null',0,1547714579,0,0);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ldap_group_mapping`
--

DROP TABLE IF EXISTS `oc_ldap_group_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ldap_group_mapping` (
  `ldap_dn` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `owncloud_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `directory_uuid` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ldap_dn`),
  UNIQUE KEY `owncloud_name_groups` (`owncloud_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ldap_group_mapping`
--

LOCK TABLES `oc_ldap_group_mapping` WRITE;
/*!40000 ALTER TABLE `oc_ldap_group_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ldap_group_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ldap_group_members`
--

DROP TABLE IF EXISTS `oc_ldap_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ldap_group_members` (
  `owncloudname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `owncloudusers` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`owncloudname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ldap_group_members`
--

LOCK TABLES `oc_ldap_group_members` WRITE;
/*!40000 ALTER TABLE `oc_ldap_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ldap_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ldap_user_mapping`
--

DROP TABLE IF EXISTS `oc_ldap_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ldap_user_mapping` (
  `ldap_dn` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `owncloud_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `directory_uuid` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`owncloud_name`),
  UNIQUE KEY `ldap_dn_users` (`ldap_dn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ldap_user_mapping`
--

LOCK TABLES `oc_ldap_user_mapping` WRITE;
/*!40000 ALTER TABLE `oc_ldap_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ldap_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(14,'application/javascript'),(4,'application/json'),(15,'application/octet-stream'),(7,'application/pdf'),(13,'application/vnd.oasis.opendocument.text'),(16,'application/x-gzip'),(1,'httpd'),(2,'httpd/unix-directory'),(8,'image'),(9,'image/jpeg'),(10,'image/png'),(18,'image/svg+xml'),(11,'text'),(17,'text/css'),(12,'text/plain'),(5,'video'),(6,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) NOT NULL,
  `root_id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mount_point` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`),
  KEY `mounts_user_index` (`user_id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,2,6,'nextcloud_adm','/nextcloud_adm/',NULL);
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject_parameters` longtext COLLATE utf8mb4_bin,
  `message` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `message_parameters` longtext COLLATE utf8mb4_bin,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `actions` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushtokens`
--

DROP TABLE IF EXISTS `oc_notifications_pushtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushtokens` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` int(11) NOT NULL DEFAULT '0',
  `deviceidentifier` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickey` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickeyhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `pushtokenhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `proxyserver` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `apptype` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown',
  UNIQUE KEY `oc_notifpushtoken` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushtokens`
--

LOCK TABLES `oc_notifications_pushtokens` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `encrypted_token` varchar(786) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8mb4_bin NOT NULL,
  `client_identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('{{ ADMIN_USER }}','avatar','generated','true'),('{{ ADMIN_USER }}','core','lang','{{ DEFAULT_LANG }}'),('{{ ADMIN_USER }}','core','locale','es_ES'),('{{ ADMIN_USER }}','core','timezone','Europe/Madrid'),('{{ ADMIN_USER }}','files_external','config_version','0.5.0'),('{{ ADMIN_USER }}','firstrunwizard','show','0');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyvalue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendardata` longblob,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT '0',
  `share_with` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT '0',
  `stime` bigint(20) NOT NULL DEFAULT '0',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT '0',
  `share_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password_by_talk` tinyint(1) NOT NULL DEFAULT '0',
  `note` longtext COLLATE utf8mb4_bin,
  `hide_download` smallint(6) NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '-1',
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT 'Url of the remove owncloud instance',
  `remote_id` int(11) NOT NULL DEFAULT '-1',
  `share_token` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Public share token',
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Optional password for the public share',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Original name on the remote server',
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'User that owns the public share on the remote server',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Local user which added the external share',
  `mountpoint` varchar(4000) COLLATE utf8mb4_bin NOT NULL COMMENT 'Full path where the share is mounted',
  `mountpoint_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'md5 hash of the mountpoint',
  `accepted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`),
  KEY `sh_external_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::{{ ADMIN_USER }}',1,NULL),(2,'local::/var/www/owncloud/data/',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT '1',
  `editable` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `gid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `objecttype` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `mapping` (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT 'Url of trusted server',
  `url_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'sha1 hash of the url without the protocol',
  `token` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'token used to exchange the shared secret',
  `shared_secret` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'shared secret used to authenticate',
  `status` int(11) NOT NULL DEFAULT '2' COMMENT 'current status of the connection',
  `sync_token` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'cardDav sync token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','nextcloud_adm',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_lower` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('{{ ADMIN_USER }}',NULL,'1|{{ ADMIN_PWD }}','{{ ADMIN_USER }}');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `objid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '11',
  `etag` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_333A1DC2BF1CD3C3` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-17 10:04:36
