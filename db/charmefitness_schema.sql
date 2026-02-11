/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100130
Source Host           : localhost:3306
Source Database       : gilberto

Target Server Type    : MYSQL
Target Server Version : 100130
File Encoding         : 65001

Date: 2020-02-04 20:40:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cities
-- ----------------------------

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14321 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of districts
-- ----------------------------

-- ----------------------------
-- Table structure for freights
-- ----------------------------
DROP TABLE IF EXISTS `freights`;
CREATE TABLE `freights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `days` int(3) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freights
-- ----------------------------

-- ----------------------------
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of states
-- ----------------------------

-- ----------------------------
-- Table structure for workcontrol_api
-- ----------------------------
DROP TABLE IF EXISTS `workcontrol_api`;
CREATE TABLE `workcontrol_api` (
  `api_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_key` varchar(255) DEFAULT '',
  `api_token` varchar(255) DEFAULT '',
  `api_date` timestamp NULL DEFAULT NULL,
  `api_status` int(11) DEFAULT '0',
  `api_loads` int(11) DEFAULT '0',
  `api_lastload` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workcontrol_api
-- ----------------------------

-- ----------------------------
-- Table structure for workcontrol_code
-- ----------------------------
DROP TABLE IF EXISTS `workcontrol_code`;
CREATE TABLE `workcontrol_code` (
  `code_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT '',
  `code_condition` varchar(255) DEFAULT '',
  `code_script` text,
  `code_created` timestamp NULL DEFAULT NULL,
  `code_views` decimal(11,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workcontrol_code
-- ----------------------------

-- ----------------------------
-- Table structure for ws_banners
-- ----------------------------
DROP TABLE IF EXISTS `ws_banners`;
CREATE TABLE `ws_banners` (
  `banner_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_line` int(11) DEFAULT NULL,
  `banner_size` int(11) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `banner_page` varchar(255) DEFAULT NULL,
  `banner_date` timestamp NULL DEFAULT NULL,
  `banner_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_banners
-- ----------------------------

-- ----------------------------
-- Table structure for ws_categories
-- ----------------------------
DROP TABLE IF EXISTS `ws_categories`;
CREATE TABLE `ws_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_parent` int(11) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_content` text,
  `category_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_categories
-- ----------------------------

-- ----------------------------
-- Table structure for ws_comments
-- ----------------------------
DROP TABLE IF EXISTS `ws_comments`;
CREATE TABLE `ws_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `post_id` int(11) unsigned DEFAULT NULL,
  `pdt_id` int(11) unsigned DEFAULT NULL,
  `page_id` int(11) unsigned DEFAULT NULL,
  `alias_id` int(11) unsigned DEFAULT NULL,
  `comment` text,
  `rank` decimal(11,0) DEFAULT '1',
  `created` timestamp NULL DEFAULT NULL,
  `interact` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `likes` decimal(11,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wc_comment_user` (`user_id`),
  KEY `wc_comment_pdt` (`pdt_id`),
  KEY `wc_comment_pages` (`page_id`),
  KEY `wc_comment_response` (`alias_id`),
  KEY `wc_comment_post` (`post_id`),
  CONSTRAINT `wc_comment_pages` FOREIGN KEY (`page_id`) REFERENCES `ws_pages` (`page_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_comment_pdt` FOREIGN KEY (`pdt_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_comment_post` FOREIGN KEY (`post_id`) REFERENCES `ws_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_comment_response` FOREIGN KEY (`alias_id`) REFERENCES `ws_comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_comment_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_comments
-- ----------------------------

-- ----------------------------
-- Table structure for ws_comments_likes
-- ----------------------------
DROP TABLE IF EXISTS `ws_comments_likes`;
CREATE TABLE `ws_comments_likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comm_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_comments` (`comm_id`),
  CONSTRAINT `wc_comments` FOREIGN KEY (`comm_id`) REFERENCES `ws_comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_comments_likes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_config
-- ----------------------------
DROP TABLE IF EXISTS `ws_config`;
CREATE TABLE `ws_config` (
  `conf_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(255) DEFAULT '',
  `conf_value` text,
  `conf_type` varchar(255) DEFAULT '',
  PRIMARY KEY (`conf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8456 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_config
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_classes
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_classes`;
CREATE TABLE `ws_ead_classes` (
  `course_id` int(11) unsigned DEFAULT NULL,
  `module_id` int(11) unsigned DEFAULT NULL,
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_title` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `class_video` varchar(255) DEFAULT NULL,
  `class_time` decimal(10,0) DEFAULT NULL,
  `class_order` int(11) DEFAULT NULL,
  `class_material` varchar(255) DEFAULT NULL,
  `class_desc` text,
  `class_support` int(11) DEFAULT NULL,
  `class_created` timestamp NULL DEFAULT NULL,
  `class_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `wc_class_module` (`module_id`),
  KEY `ws_class_order` (`course_id`),
  CONSTRAINT `wc_class_module` FOREIGN KEY (`module_id`) REFERENCES `ws_ead_modules` (`module_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_class_order` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_classes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_courses
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_courses`;
CREATE TABLE `ws_ead_courses` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_author` int(11) unsigned DEFAULT NULL,
  `course_segment` int(11) unsigned DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `course_headline` varchar(255) DEFAULT NULL,
  `course_desc` text,
  `course_name` varchar(255) DEFAULT NULL,
  `course_cover` varchar(255) DEFAULT NULL,
  `course_created` timestamp NULL DEFAULT NULL,
  `course_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_status` int(11) NOT NULL DEFAULT '0',
  `course_order` int(11) DEFAULT NULL,
  `course_vendor_id` int(11) DEFAULT NULL,
  `course_vendor_access` int(11) DEFAULT NULL,
  `course_vendor_price` decimal(11,2) DEFAULT NULL,
  `course_vendor_page` varchar(255) DEFAULT NULL,
  `course_vendor_checkout` varchar(255) DEFAULT NULL,
  `course_vendor_renew` varchar(255) DEFAULT NULL,
  `course_certification_workload` int(11) DEFAULT NULL,
  `course_certification_request` int(11) DEFAULT NULL,
  `course_certification_mockup` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `wc_course_author` (`course_author`),
  KEY `wc_course_segment` (`course_segment`),
  CONSTRAINT `wc_course_author` FOREIGN KEY (`course_author`) REFERENCES `ws_users` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `wc_course_segment` FOREIGN KEY (`course_segment`) REFERENCES `ws_ead_courses_segments` (`segment_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_courses
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_courses_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_courses_bonus`;
CREATE TABLE `ws_ead_courses_bonus` (
  `course_id` int(11) unsigned DEFAULT NULL,
  `bonus_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_course_id` int(11) unsigned DEFAULT NULL,
  `bonus_ever` int(11) DEFAULT NULL,
  `bonus_ever_date` date DEFAULT NULL,
  `bonus_wait` int(11) DEFAULT NULL,
  PRIMARY KEY (`bonus_id`),
  KEY `wc_ead_course_bonus` (`course_id`),
  KEY `wc_ead_bonus_id` (`bonus_course_id`),
  CONSTRAINT `wc_ead_bonus_id` FOREIGN KEY (`bonus_course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_ead_course_bonus` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_courses_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_courses_segments
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_courses_segments`;
CREATE TABLE `ws_ead_courses_segments` (
  `segment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segment_title` varchar(255) DEFAULT NULL,
  `segment_name` varchar(255) DEFAULT NULL,
  `segment_desc` text,
  `segment_order` int(11) DEFAULT NULL,
  `segment_icon` varchar(255) DEFAULT NULL,
  `segment_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_courses_segments
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_enrollments
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_enrollments`;
CREATE TABLE `ws_ead_enrollments` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `enrollment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enrollment_order` int(11) unsigned DEFAULT NULL,
  `enrollment_bonus` int(11) unsigned DEFAULT NULL,
  `enrollment_start` timestamp NULL DEFAULT NULL,
  `enrollment_access` timestamp NULL DEFAULT NULL,
  `enrollment_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `wc_ead_student_course` (`course_id`),
  KEY `wc_ead_student_user` (`user_id`),
  KEY `wc_entollment_bonus` (`enrollment_bonus`),
  KEY `wc_enrollment_order` (`enrollment_order`),
  CONSTRAINT `wc_ead_student_course` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_ead_student_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_enrollment_order` FOREIGN KEY (`enrollment_order`) REFERENCES `ws_ead_orders` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_entollment_bonus` FOREIGN KEY (`enrollment_bonus`) REFERENCES `ws_ead_enrollments` (`enrollment_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_enrollments
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_modules
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_modules`;
CREATE TABLE `ws_ead_modules` (
  `course_id` int(11) unsigned DEFAULT NULL,
  `module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_title` varchar(255) DEFAULT '',
  `module_desc` text,
  `module_name` varchar(255) DEFAULT NULL,
  `module_order` int(11) NOT NULL DEFAULT '0',
  `module_release` int(11) NOT NULL DEFAULT '0',
  `module_release_date` timestamp NULL DEFAULT NULL,
  `module_required` int(11) DEFAULT '0',
  `module_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `wc_course_module` (`course_id`),
  CONSTRAINT `wc_course_module` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_modules
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_orders
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_orders`;
CREATE TABLE `ws_ead_orders` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) DEFAULT NULL,
  `order_transaction` varchar(255) DEFAULT NULL,
  `order_callback_type` int(11) DEFAULT NULL,
  `order_off` varchar(255) DEFAULT NULL,
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_currency` varchar(255) DEFAULT NULL,
  `order_payment_type` varchar(255) DEFAULT NULL,
  `order_purchase_date` timestamp NULL DEFAULT NULL,
  `order_warranty_date` timestamp NULL DEFAULT NULL,
  `order_confirmation_purchase_date` timestamp NULL DEFAULT NULL,
  `order_sck` varchar(255) DEFAULT NULL,
  `order_src` varchar(255) DEFAULT NULL,
  `order_aff` varchar(255) DEFAULT NULL,
  `order_aff_name` varchar(255) DEFAULT NULL,
  `order_cms_aff` varchar(255) NOT NULL DEFAULT '0.00',
  `order_cms_marketplace` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_cms_vendor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_status` varchar(255) DEFAULT NULL,
  `order_chargeback` timestamp NULL DEFAULT NULL,
  `order_delivered` int(11) DEFAULT NULL,
  `order_signature` varchar(255) DEFAULT NULL,
  `order_signature_plan` varchar(255) DEFAULT NULL,
  `order_signature_recurrency` int(11) DEFAULT NULL,
  `order_signature_period` int(11) DEFAULT NULL,
  `order_signature_status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `wc_ead_order_user` (`user_id`),
  KEY `wc_ead_order_course` (`course_id`),
  CONSTRAINT `wc_ead_order_course` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_ead_order_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_orders
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_students_notes
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_students_notes`;
CREATE TABLE `ws_ead_students_notes` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `admin_id` int(11) unsigned DEFAULT NULL,
  `note_text` varchar(255) DEFAULT NULL,
  `note_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_students_notes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_student_certificates
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_student_certificates`;
CREATE TABLE `ws_ead_student_certificates` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `enrollment_id` int(11) unsigned DEFAULT NULL,
  `certificate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_key` varchar(255) DEFAULT NULL,
  `certificate_issued` date DEFAULT NULL,
  `certificate_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`certificate_id`),
  KEY `wc_certificate_user` (`user_id`),
  KEY `wc_certificate_course` (`course_id`),
  KEY `wc_certificate_enrollment` (`enrollment_id`),
  CONSTRAINT `wc_certificate_course` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_certificate_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `ws_ead_enrollments` (`enrollment_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_certificate_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_student_certificates
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_student_classes
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_student_classes`;
CREATE TABLE `ws_ead_student_classes` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `class_id` int(11) unsigned DEFAULT NULL,
  `enrollment_id` int(11) unsigned DEFAULT NULL,
  `student_class_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_class_views` int(11) DEFAULT NULL,
  `student_class_play` timestamp NULL DEFAULT NULL,
  `student_class_free` int(11) DEFAULT NULL,
  `student_class_seconds` int(11) DEFAULT NULL,
  `student_class_check` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_class_id`),
  KEY `wc_student_class_user` (`user_id`),
  KEY `wc_student_class` (`class_id`),
  KEY `wc_student_class_course` (`course_id`),
  KEY `wc_student_class_enroll` (`enrollment_id`),
  CONSTRAINT `wc_student_class` FOREIGN KEY (`class_id`) REFERENCES `ws_ead_classes` (`class_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_student_class_course` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_student_class_enroll` FOREIGN KEY (`enrollment_id`) REFERENCES `ws_ead_enrollments` (`enrollment_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_student_class_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_student_classes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_student_downloads
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_student_downloads`;
CREATE TABLE `ws_ead_student_downloads` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `course_id` int(11) unsigned DEFAULT NULL,
  `class_id` int(11) unsigned DEFAULT NULL,
  `download_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `download_file` varchar(255) DEFAULT NULL,
  `download_filename` varchar(2555) DEFAULT NULL,
  `download_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`download_id`),
  KEY `ws_download_user` (`user_id`),
  KEY `ws_download_course` (`course_id`),
  KEY `ws_download_class` (`class_id`),
  CONSTRAINT `ws_download_class` FOREIGN KEY (`class_id`) REFERENCES `ws_ead_classes` (`class_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_download_course` FOREIGN KEY (`course_id`) REFERENCES `ws_ead_courses` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_download_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_ead_student_downloads
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_support
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_support`;
CREATE TABLE `ws_ead_support` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `enrollment_id` int(11) unsigned DEFAULT NULL,
  `class_id` int(11) unsigned DEFAULT NULL,
  `support_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `support_content` text,
  `support_status` int(11) DEFAULT NULL,
  `support_open` timestamp NULL DEFAULT NULL,
  `support_reply` timestamp NULL DEFAULT NULL,
  `support_close` timestamp NULL DEFAULT NULL,
  `support_review` int(11) DEFAULT NULL,
  `support_comment` text,
  `support_published` int(11) DEFAULT NULL,
  PRIMARY KEY (`support_id`),
  KEY `wc_ead_support_class` (`class_id`),
  KEY `wc_ead_support_user` (`user_id`),
  KEY `wc_ead_student_class` (`enrollment_id`),
  CONSTRAINT `wc_ead_support_class` FOREIGN KEY (`class_id`) REFERENCES `ws_ead_classes` (`class_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_ead_support_enroll` FOREIGN KEY (`enrollment_id`) REFERENCES `ws_ead_enrollments` (`enrollment_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_ead_support_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Status 1 = Aberto\nStatus 2 = Respondido\nStatus 3 = Completo';

-- ----------------------------
-- Records of ws_ead_support
-- ----------------------------

-- ----------------------------
-- Table structure for ws_ead_support_reply
-- ----------------------------
DROP TABLE IF EXISTS `ws_ead_support_reply`;
CREATE TABLE `ws_ead_support_reply` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `enrollment_id` int(10) unsigned DEFAULT NULL,
  `support_id` int(11) unsigned DEFAULT NULL,
  `response_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `response_content` text,
  `response_open` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  KEY `wc_ead_support_class` (`support_id`),
  KEY `wc_ead_support_user` (`user_id`),
  KEY `wc_ead_support_reply_enroll` (`enrollment_id`),
  CONSTRAINT `wc_ead_support_reply_enroll` FOREIGN KEY (`enrollment_id`) REFERENCES `ws_ead_enrollments` (`enrollment_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `wc_response_support` FOREIGN KEY (`support_id`) REFERENCES `ws_ead_support` (`support_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `wc_response_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Status 1 = Aberto\nStatus 2 = Respondido\nStatus 3 = Completo';

-- ----------------------------
-- Records of ws_ead_support_reply
-- ----------------------------

-- ----------------------------
-- Table structure for ws_orders
-- ----------------------------
DROP TABLE IF EXISTS `ws_orders`;
CREATE TABLE `ws_orders` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_status` int(11) NOT NULL DEFAULT '0',
  `order_payment` int(11) NOT NULL DEFAULT '1',
  `order_price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `order_installments` decimal(10,0) DEFAULT NULL,
  `order_installment` decimal(11,2) DEFAULT NULL,
  `order_coupon` decimal(11,0) DEFAULT NULL,
  `order_free` decimal(11,2) DEFAULT NULL,
  `order_billet` varchar(255) DEFAULT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `order_addr` int(11) DEFAULT NULL,
  `order_shipcode` int(11) DEFAULT NULL,
  `order_shipprice` decimal(11,2) DEFAULT NULL,
  `order_shipment` date DEFAULT NULL,
  `order_tracking` varchar(255) DEFAULT NULL,
  `order_nfepdf` varchar(255) DEFAULT NULL,
  `order_nfexml` varchar(255) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  `order_update` timestamp NULL DEFAULT NULL,
  `order_mail_processing` int(11) DEFAULT NULL,
  `order_mail_completed` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `wc_order_user` (`user_id`),
  CONSTRAINT `wc_order_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_orders
-- ----------------------------

-- ----------------------------
-- Table structure for ws_orders_items
-- ----------------------------
DROP TABLE IF EXISTS `ws_orders_items`;
CREATE TABLE `ws_orders_items` (
  `order_id` int(11) unsigned NOT NULL,
  `pdt_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` decimal(11,2) DEFAULT NULL,
  `item_amount` decimal(11,2) DEFAULT '1.00',
  PRIMARY KEY (`item_id`),
  KEY `wc_order` (`order_id`),
  CONSTRAINT `wc_order` FOREIGN KEY (`order_id`) REFERENCES `ws_orders` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_orders_items
-- ----------------------------

-- ----------------------------
-- Table structure for ws_pages
-- ----------------------------
DROP TABLE IF EXISTS `ws_pages`;
CREATE TABLE `ws_pages` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) DEFAULT NULL,
  `page_subtitle` varchar(255) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `page_content` text,
  `page_date` timestamp NULL DEFAULT NULL,
  `page_revision` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_order` int(11) DEFAULT NULL,
  `page_status` int(11) NOT NULL DEFAULT '0',
  `page_cover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_pages
-- ----------------------------

-- ----------------------------
-- Table structure for ws_pages_images
-- ----------------------------
DROP TABLE IF EXISTS `ws_pages_images`;
CREATE TABLE `ws_pages_images` (
  `page_id` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_pages` (`page_id`),
  CONSTRAINT `wc_pages` FOREIGN KEY (`page_id`) REFERENCES `ws_pages` (`page_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_pages_images
-- ----------------------------

-- ----------------------------
-- Table structure for ws_posts
-- ----------------------------
DROP TABLE IF EXISTS `ws_posts`;
CREATE TABLE `ws_posts` (
  `post_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) NOT NULL DEFAULT '',
  `post_title` varchar(255) DEFAULT NULL,
  `post_subtitle` text,
  `post_content` longtext,
  `post_cover` varchar(255) DEFAULT NULL,
  `post_video` varchar(255) DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT NULL,
  `post_author` int(11) unsigned DEFAULT NULL,
  `post_category` int(11) DEFAULT NULL,
  `post_category_parent` varchar(255) DEFAULT NULL,
  `post_views` decimal(10,0) DEFAULT '0',
  `post_lastview` timestamp NULL DEFAULT NULL,
  `post_status` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(255) DEFAULT NULL,
  `post_instant_article` int(11) DEFAULT NULL,
  `post_amp` int(11) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `wc_posts` (`post_category`),
  KEY `wc_post_author` (`post_author`),
  CONSTRAINT `wc_post_author` FOREIGN KEY (`post_author`) REFERENCES `ws_users` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `wc_posts` FOREIGN KEY (`post_category`) REFERENCES `ws_categories` (`category_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_posts
-- ----------------------------

-- ----------------------------
-- Table structure for ws_posts_images
-- ----------------------------
DROP TABLE IF EXISTS `ws_posts_images`;
CREATE TABLE `ws_posts_images` (
  `post_id` int(11) unsigned DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_posts_images` (`post_id`),
  CONSTRAINT `wc_posts_images` FOREIGN KEY (`post_id`) REFERENCES `ws_posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_posts_images
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products
-- ----------------------------
DROP TABLE IF EXISTS `ws_products`;
CREATE TABLE `ws_products` (
  `pdt_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pdt_code` varchar(255) NOT NULL DEFAULT '',
  `pdt_parent` int(11) unsigned DEFAULT NULL,
  `pdt_title` varchar(255) DEFAULT NULL,
  `pdt_subtitle` varchar(255) DEFAULT NULL,
  `pdt_name` varchar(255) DEFAULT NULL,
  `pdt_hotlink` varchar(255) DEFAULT NULL,
  `pdt_cover` varchar(255) DEFAULT NULL,
  `pdt_content` text,
  `pdt_warranty` text,
  `pdt_price` decimal(11,2) DEFAULT NULL,
  `pdt_step` decimal(11,2) DEFAULT NULL,
  `pdt_unity` varchar(255) DEFAULT NULL,
  `pdt_inventory` decimal(10,0) NOT NULL DEFAULT '0',
  `pdt_delivered` decimal(10,0) NOT NULL DEFAULT '0',
  `pdt_brand` int(11) unsigned DEFAULT NULL,
  `pdt_category` varchar(255) DEFAULT NULL,
  `pdt_subcategory` varchar(255) DEFAULT NULL,
  `pdt_offer_price` decimal(11,2) DEFAULT NULL,
  `pdt_offer_start` timestamp NULL DEFAULT NULL,
  `pdt_offer_end` timestamp NULL DEFAULT NULL,
  `pdt_dimension_heigth` decimal(11,0) NOT NULL DEFAULT '0',
  `pdt_dimension_width` decimal(11,0) NOT NULL DEFAULT '0',
  `pdt_dimension_depth` decimal(11,0) NOT NULL DEFAULT '0',
  `pdt_dimension_weight` decimal(11,0) NOT NULL DEFAULT '0',
  `pdt_type` varchar(255) DEFAULT NULL,
  `pdt_measurement` varchar(255) DEFAULT NULL,
  `pdt_genre` char(1) DEFAULT NULL,
  `pdt_created` timestamp NULL DEFAULT NULL,
  `pdt_views` decimal(10,0) DEFAULT '0',
  `pdt_lastview` timestamp NULL DEFAULT NULL,
  `pdt_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pdt_id`),
  KEY `wc_products_brands` (`pdt_brand`),
  KEY `wc_products_categories` (`pdt_category`),
  KEY `wc_products_subcategory` (`pdt_subcategory`),
  KEY `wc_product_parent` (`pdt_parent`),
  CONSTRAINT `wc_product_parent` FOREIGN KEY (`pdt_parent`) REFERENCES `ws_products` (`pdt_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `wc_products_brands` FOREIGN KEY (`pdt_brand`) REFERENCES `ws_products_brands` (`brand_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_abandoned_cart
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_abandoned_cart`;
CREATE TABLE `ws_products_abandoned_cart` (
  `abandoned_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `stock_id` int(11) NOT NULL,
  `abandoned_amount` int(11) DEFAULT NULL,
  `abandoned_notify` int(11) DEFAULT NULL,
  PRIMARY KEY (`abandoned_id`),
  KEY `ws_abandoned_user` (`user_id`),
  CONSTRAINT `ws_products_abandoned_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_abandoned_cart
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_attributes_colors
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_attributes_colors`;
CREATE TABLE `ws_products_attributes_colors` (
  `attr_color_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT NULL,
  `attr_color_code` varchar(255) DEFAULT '',
  `attr_color_title` varchar(255) DEFAULT '',
  `attr_color_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attr_color_id`),
  KEY `ws_products_attributes_groups` (`group_id`),
  CONSTRAINT `ws_products_attributes_colors_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ws_products_groups_attributes` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_attributes_colors
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_attributes_prints
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_attributes_prints`;
CREATE TABLE `ws_products_attributes_prints` (
  `attr_print_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT NULL,
  `attr_print_code` varchar(255) DEFAULT '',
  `attr_print_title` varchar(255) DEFAULT '',
  `attr_print_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attr_print_id`),
  KEY `ws_products_attributes_groups` (`group_id`),
  CONSTRAINT `ws_products_attributes_prints_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ws_products_groups_attributes` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_attributes_prints
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_attributes_sizes
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_attributes_sizes`;
CREATE TABLE `ws_products_attributes_sizes` (
  `attr_size_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT NULL,
  `attr_size_code` varchar(255) DEFAULT '',
  `attr_size_title` varchar(255) DEFAULT '',
  `attr_size_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`attr_size_id`),
  KEY `ws_products_attributes_groups` (`group_id`),
  CONSTRAINT `ws_products_attributes_sizes_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ws_products_groups_attributes` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_attributes_sizes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_brands
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_brands`;
CREATE TABLE `ws_products_brands` (
  `brand_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_title` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_brands
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_categories
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_categories`;
CREATE TABLE `ws_products_categories` (
  `cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat_parent` int(11) unsigned DEFAULT NULL,
  `cat_tree` varchar(255) DEFAULT NULL,
  `cat_title` varchar(255) DEFAULT NULL,
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_sizes` varchar(255) DEFAULT NULL,
  `cat_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_categories
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_combo
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_combo`;
CREATE TABLE `ws_products_combo` (
  `combo_id` int(11) NOT NULL AUTO_INCREMENT,
  `pdt_id` int(11) unsigned NOT NULL,
  `combo_list` varchar(255) DEFAULT NULL,
  `combo_discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`combo_id`),
  KEY `pdt_id` (`pdt_id`),
  CONSTRAINT `ws_products_combo_ibfk_1` FOREIGN KEY (`pdt_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_combo
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_coupons
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_coupons`;
CREATE TABLE `ws_products_coupons` (
  `cp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cp_title` varchar(255) DEFAULT NULL,
  `cp_coupon` varchar(255) DEFAULT NULL,
  `cp_discount` decimal(11,0) DEFAULT NULL,
  `cp_minimum` decimal(11,0) DEFAULT NULL,
  `cp_hits` decimal(11,0) DEFAULT NULL,
  `cp_start` timestamp NULL DEFAULT NULL,
  `cp_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_coupons
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_gallery
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_gallery`;
CREATE TABLE `ws_products_gallery` (
  `product_id` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_produtcts_gallery` (`product_id`),
  CONSTRAINT `wc_produtcts_gallery` FOREIGN KEY (`product_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_gallery
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_groups_attributes
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_groups_attributes`;
CREATE TABLE `ws_products_groups_attributes` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_title` varchar(255) DEFAULT NULL,
  `group_order` int(11) DEFAULT NULL,
  `group_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_groups_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_images
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_images`;
CREATE TABLE `ws_products_images` (
  `product_id` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_products_images` (`product_id`),
  CONSTRAINT `wc_products_images` FOREIGN KEY (`product_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_images
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_stock
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_stock`;
CREATE TABLE `ws_products_stock` (
  `stock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pdt_id` int(11) unsigned NOT NULL,
  `size_id` int(11) unsigned DEFAULT NULL,
  `color_id` int(11) unsigned DEFAULT NULL,
  `print_id` int(11) unsigned DEFAULT NULL,
  `stock_inventory` decimal(10,0) NOT NULL DEFAULT '0',
  `stock_sold` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`),
  KEY `wc_products_stock` (`pdt_id`),
  KEY `size_id` (`size_id`),
  KEY `color_id` (`color_id`),
  KEY `print_id` (`print_id`),
  CONSTRAINT `ws_products_stock_ibfk_1` FOREIGN KEY (`pdt_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_products_stock_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `ws_products_attributes_sizes` (`attr_size_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_products_stock_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `ws_products_attributes_colors` (`attr_color_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_products_stock_ibfk_4` FOREIGN KEY (`print_id`) REFERENCES `ws_products_attributes_prints` (`attr_print_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_stock
-- ----------------------------

-- ----------------------------
-- Table structure for ws_products_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `ws_products_wishlist`;
CREATE TABLE `ws_products_wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `pdt_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `ws_wishlist_products` (`pdt_id`),
  KEY `ws_wishlist_user` (`user_id`),
  CONSTRAINT `ws_wishlist_products` FOREIGN KEY (`pdt_id`) REFERENCES `ws_products` (`pdt_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ws_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_products_wishlist
-- ----------------------------

-- ----------------------------
-- Table structure for ws_properties
-- ----------------------------
DROP TABLE IF EXISTS `ws_properties`;
CREATE TABLE `ws_properties` (
  `realty_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realty_cover` varchar(255) DEFAULT NULL,
  `realty_title` varchar(255) DEFAULT NULL,
  `realty_name` varchar(255) DEFAULT NULL,
  `realty_ref` varchar(255) DEFAULT NULL,
  `realty_price` decimal(11,2) DEFAULT NULL,
  `realty_desc` text,
  `realty_finality` int(11) DEFAULT NULL,
  `realty_type` int(11) DEFAULT NULL,
  `realty_builtarea` decimal(11,2) DEFAULT NULL,
  `realty_totalarea` decimal(11,2) DEFAULT NULL,
  `realty_bedrooms` decimal(11,0) DEFAULT NULL,
  `realty_apartments` decimal(10,0) DEFAULT NULL,
  `realty_bathrooms` decimal(11,0) DEFAULT NULL,
  `realty_parkings` decimal(10,0) DEFAULT NULL,
  `realty_particulars` text,
  `realty_transaction` int(11) DEFAULT NULL,
  `realty_state` varchar(10) DEFAULT NULL,
  `realty_city` varchar(255) DEFAULT NULL,
  `realty_district` varchar(255) DEFAULT NULL,
  `realty_date` timestamp NULL DEFAULT NULL,
  `realty_observation` int(11) DEFAULT NULL,
  `realty_contact` int(11) unsigned DEFAULT NULL,
  `realty_status` int(11) NOT NULL DEFAULT '0',
  `realty_views` decimal(11,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`realty_id`),
  KEY `wc_propertie_author` (`realty_contact`),
  CONSTRAINT `wc_propertie_author` FOREIGN KEY (`realty_contact`) REFERENCES `ws_users` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_properties
-- ----------------------------

-- ----------------------------
-- Table structure for ws_properties_gallery
-- ----------------------------
DROP TABLE IF EXISTS `ws_properties_gallery`;
CREATE TABLE `ws_properties_gallery` (
  `realty_id` int(11) unsigned DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_properties_gallery` (`realty_id`),
  CONSTRAINT `wc_properties_gallery` FOREIGN KEY (`realty_id`) REFERENCES `ws_properties` (`realty_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_properties_gallery
-- ----------------------------

-- ----------------------------
-- Table structure for ws_search
-- ----------------------------
DROP TABLE IF EXISTS `ws_search`;
CREATE TABLE `ws_search` (
  `search_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `search_key` varchar(255) DEFAULT NULL,
  `search_count` decimal(11,0) DEFAULT NULL,
  `search_date` timestamp NULL DEFAULT NULL,
  `search_commit` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `search_publish` int(11) DEFAULT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_search
-- ----------------------------

-- ----------------------------
-- Table structure for ws_siteviews_online
-- ----------------------------
DROP TABLE IF EXISTS `ws_siteviews_online`;
CREATE TABLE `ws_siteviews_online` (
  `online_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_user` int(11) DEFAULT NULL,
  `online_name` varchar(255) DEFAULT NULL,
  `online_startview` timestamp NULL DEFAULT NULL,
  `online_endview` timestamp NULL DEFAULT NULL,
  `online_ip` varchar(255) DEFAULT NULL,
  `online_url` varchar(255) DEFAULT NULL,
  `online_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`online_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_siteviews_online
-- ----------------------------

-- ----------------------------
-- Table structure for ws_siteviews_views
-- ----------------------------
DROP TABLE IF EXISTS `ws_siteviews_views`;
CREATE TABLE `ws_siteviews_views` (
  `views_id` int(11) NOT NULL AUTO_INCREMENT,
  `views_date` date DEFAULT NULL,
  `views_users` decimal(10,0) DEFAULT NULL,
  `views_views` decimal(10,0) DEFAULT NULL,
  `views_pages` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`views_id`),
  KEY `idx_1` (`views_date`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_siteviews_views
-- ----------------------------

-- ----------------------------
-- Table structure for ws_slides
-- ----------------------------
DROP TABLE IF EXISTS `ws_slides`;
CREATE TABLE `ws_slides` (
  `slide_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slide_status` int(11) NOT NULL DEFAULT '0',
  `slide_image_mobile` varchar(255) DEFAULT NULL,
  `slide_image_tablet` varchar(255) DEFAULT NULL,
  `slide_image_desktop` varchar(255) DEFAULT NULL,
  `slide_title` varchar(255) DEFAULT NULL,
  `slide_desc` text,
  `slide_link` varchar(255) DEFAULT NULL,
  `slide_date` timestamp NULL DEFAULT NULL,
  `slide_start` timestamp NULL DEFAULT NULL,
  `slide_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_slides
-- ----------------------------

-- ----------------------------
-- Table structure for ws_template_colors
-- ----------------------------
DROP TABLE IF EXISTS `ws_template_colors`;
CREATE TABLE `ws_template_colors` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `color_background_one` varchar(255) DEFAULT NULL,
  `color_text_one` varchar(255) DEFAULT NULL,
  `color_background_two` varchar(255) DEFAULT NULL,
  `color_text_two` varchar(255) DEFAULT NULL,
  `color_background_three` varchar(255) DEFAULT NULL,
  `color_text_three` varchar(255) DEFAULT NULL,
  `color_background_four` varchar(255) DEFAULT NULL,
  `color_text_four` varchar(255) DEFAULT NULL,
  `color_type` varchar(255) DEFAULT NULL,
  `color_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_template_colors
-- ----------------------------

-- ----------------------------
-- Table structure for ws_users
-- ----------------------------
DROP TABLE IF EXISTS `ws_users`;
CREATE TABLE `ws_users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_thumb` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_document` varchar(255) DEFAULT NULL,
  `user_genre` int(11) DEFAULT NULL,
  `user_datebirth` date DEFAULT NULL,
  `user_telephone` varchar(255) DEFAULT NULL,
  `user_cell` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_password` varchar(255) NOT NULL DEFAULT '',
  `user_channel` varchar(255) DEFAULT NULL,
  `user_registration` timestamp NULL DEFAULT NULL,
  `user_lastupdate` timestamp NULL DEFAULT NULL,
  `user_lastaccess` timestamp NULL DEFAULT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `user_login_cookie` varchar(255) DEFAULT NULL,
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_facebook` varchar(255) DEFAULT NULL,
  `user_twitter` varchar(255) DEFAULT NULL,
  `user_youtube` varchar(255) DEFAULT NULL,
  `user_google` varchar(255) DEFAULT NULL,
  `user_pagarme` varchar(255) DEFAULT NULL,
  `user_blocking_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_users
-- ----------------------------

-- ----------------------------
-- Table structure for ws_users_address
-- ----------------------------
DROP TABLE IF EXISTS `ws_users_address`;
CREATE TABLE `ws_users_address` (
  `user_id` int(11) unsigned NOT NULL,
  `addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `addr_key` int(11) DEFAULT NULL,
  `addr_name` varchar(255) DEFAULT NULL,
  `addr_zipcode` varchar(255) DEFAULT NULL,
  `addr_street` varchar(255) DEFAULT NULL,
  `addr_number` varchar(255) DEFAULT NULL,
  `addr_complement` varchar(255) DEFAULT NULL,
  `addr_district` varchar(255) DEFAULT NULL,
  `addr_city` varchar(255) DEFAULT NULL,
  `addr_state` varchar(2) DEFAULT NULL,
  `addr_country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `wc_users_address` (`user_id`),
  CONSTRAINT `wc_users_address` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_users_address
-- ----------------------------

-- ----------------------------
-- Table structure for ws_users_cards
-- ----------------------------
DROP TABLE IF EXISTS `ws_users_cards`;
CREATE TABLE `ws_users_cards` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `card_id` varchar(255) DEFAULT NULL,
  `card_brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CardUserId` (`user_id`),
  CONSTRAINT `CardUserId` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_users_cards
-- ----------------------------

-- ----------------------------
-- Table structure for ws_users_notes
-- ----------------------------
DROP TABLE IF EXISTS `ws_users_notes`;
CREATE TABLE `ws_users_notes` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `admin_id` int(11) unsigned DEFAULT NULL,
  `note_text` varchar(255) DEFAULT NULL,
  `note_datetime` timestamp NULL DEFAULT NULL,
  `note_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `note_user_id` (`user_id`),
  KEY `note_admin_id` (`admin_id`),
  CONSTRAINT `note_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `note_user_id` FOREIGN KEY (`user_id`) REFERENCES `ws_users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ws_users_notes
-- ----------------------------
