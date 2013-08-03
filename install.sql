
-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_author` ***
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (139, 28, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (72, 29, 'yes', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (160, 30, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (159, 31, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (103, 40, 'yes', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (144, 43, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (109, 63, 'yes', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (128, 69, 'no', 'no', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (150, 135, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (92, 115, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (163, 127, 'no', 'yes', 'author,developer');
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (156, 224, 'no', 'yes', 'author,developer');

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_checkbox` ***
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (23, 113, 'off', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (36, 64, 'on', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (31, 105, 'off', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (104, 144, 'off', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (105, 146, 'off', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (103, 231, 'off', NULL);
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (106, 238, 'off', NULL);

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_date` ***

-- *** STRUCTURE:`tbl_fields_datetime` ***
DROP TABLE IF EXISTS`tbl_fields_datetime`;
CREATE TABLE`tbl_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_datetime` ***
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (151, 1, 1, 1, 0, 1);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (85, 12, 1, 1, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (160, 17, 1, 1, 0, 1);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (159, 24, 0, 0, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (153, 32, 0, 0, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (154, 48, 0, 1, 0, 1);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (143, 66, 0, 1, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (144, 121, 1, 1, 0, 1);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (114, 106, 1, 0, 0, 1);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (142, 122, 1, 0, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (155, 134, 0, 0, 0, 0);
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (156, 223, 1, 1, 0, 1);

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_input` ***
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (136, 22, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (250, 26, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (157, 123, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (97, 39, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (154, 55, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (155, 58, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (262, 129, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (156, 65, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (251, 71, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (80, 87, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (107, 112, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (105, 109, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (106, 117, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (263, 130, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (264, 131, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (265, 142, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (266, 233, NULL);

-- *** STRUCTURE:`tbl_fields_maplocation` ***
DROP TABLE IF EXISTS`tbl_fields_maplocation`;
CREATE TABLE`tbl_fields_maplocation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_location` varchar(60) NOT NULL,
  `default_location_coords` varchar(60) NOT NULL,
  `default_zoom` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_fields_maplocation` ***
INSERT INTO`tbl_fields_maplocation` (`id`, `field_id`, `default_location`, `default_location_coords`, `default_zoom`) VALUES (23, 57, 'Milwaukee, WI', '43.0389025, -87.9064736', 10);

-- *** STRUCTURE:`tbl_fields_memberusername` ***
DROP TABLE IF EXISTS`tbl_fields_memberusername`;
CREATE TABLE`tbl_fields_memberusername` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_memberusername` ***
INSERT INTO`tbl_fields_memberusername` (`id`, `field_id`, `validator`) VALUES (1, 132, NULL);

-- *** STRUCTURE:`tbl_fields_number` ***
DROP TABLE IF EXISTS`tbl_fields_number`;
CREATE TABLE`tbl_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_number` ***

-- *** STRUCTURE:`tbl_fields_publish_tabs` ***
DROP TABLE IF EXISTS`tbl_fields_publish_tabs`;
CREATE TABLE`tbl_fields_publish_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_fields_publish_tabs` ***
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (5, 75);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (6, 77);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (37, 226);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (38, 227);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (39, 228);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (46, 136);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (47, 137);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (48, 138);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (49, 139);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (65, 147);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (66, 148);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (67, 163);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (68, 178);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (69, 193);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (70, 208);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (92, 140);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (93, 141);
INSERT INTO`tbl_fields_publish_tabs` (`id`, `field_id`) VALUES (94, 232);

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=543 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_select` ***
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (497, 3, 'no', 'no', 'no', 'Migraine, Neurological, Illness, Other', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (500, 5, 'no', 'no', 'no', 'None, Mild, Severe, Totally disabled', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (501, 6, 'no', 'no', 'no', 'Mild, Moderate, Severe, Very severe', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (219, 13, 'no', 'no', 'no', 'Snack, Beverage, Breakfast, Lunch, Dinner', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (535, 18, 'no', 'no', 'no', 'Very sleepy, Awake but tired, Wide awake', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (506, 126, 'no', 'no', 'no', 'No, Partial, Yes', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (505, 33, 'no', 'no', 'no', 'Work, Off', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (335, 38, 'no', 'no', 'no', 'Head, Body, Neuro', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (218, 41, 'no', 'no', 'no', 'Prepackaged, Home-cooked, Restaurant', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (220, 44, 'no', 'no', 'no', 'Bland, Mild, Salty', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (507, 49, 'no', 'no', 'no', 'Struggle to stay awake, Somewhat tired, Fairly alert, Wide awake', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (511, 50, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (512, 51, 'no', 'no', 'no', 'Struggle to stay awake, Somewhat tired, Fairly alert, Wide awake', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (516, 52, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (517, 53, 'no', 'no', 'no', 'Struggle to stay awake, Somewhat tired, Fairly alert, Wide awake', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (519, 54, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (536, 72, 'no', 'no', 'no', 'Very sleepy, Awake but tired, Wide awake', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (498, 89, 'no', 'no', 'no', NULL, 87);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (452, 78, 'yes', 'no', 'no', 'None, Body part, Medication, Comments,', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (453, 79, 'no', 'no', 'no', 'None, Dosage, Comments,', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (454, 80, 'yes', 'no', 'no', 'None, Time, Foods, Comments', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (455, 81, 'yes', 'no', 'no', 'None, Time, Feeling, Comments,', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (456, 82, 'yes', 'no', 'no', 'None, Work hours, Work duration, Wellness, Activity Tags, Comments', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (457, 83, 'no', 'no', 'no', 'None, Self, Other Doctors', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (508, 92, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (514, 94, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (521, 96, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (499, 98, 'yes', 'no', 'no', 'Twitch, Tremor, Tingle, Numbness, Dizziness, Nausea, Other', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (509, 99, 'no', 'no', 'no', 'Very Low, Low, Moderate, High, Very High', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (515, 100, 'no', 'no', 'no', 'Very Low, Low, Moderate, High, Very High', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (520, 101, 'no', 'no', 'no', 'Very Low, Low, Moderate, High, Very High', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (510, 102, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (513, 103, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (518, 104, 'no', 'no', 'no', 'Terrific, Good, Medium, Poor, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (336, 118, 'no', 'no', 'no', NULL, 22);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (534, 119, 'yes', 'no', 'no', NULL, 118);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (482, 120, 'no', 'no', 'no', 'Great, Good, Medium, Mediocre, Terrible', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (542, 145, 'yes', 'no', 'yes', 'Concentration, Strength, Motor Control, Tremors and Twitches, Pain, Breath, Temperature, Aches and Soreness, Seasonal Allergies', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (541, 245, 'no', 'no', 'no', 'Normal, Protanopia, Deuteranopia, Tritanopia', NULL);

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_selectbox_link` ***
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (72, 133, 'yes', 'yes', 3, 20);
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (69, 45, 'yes', 'yes', 39, 20);
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (64, 67, 'no', 'yes', 55, 50);
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (60, 86, 'no', 'yes', 55, 50);
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (54, 111, 'no', 'yes', 55, 20);
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (68, 230, 'no', 'no', 229, 5);

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_taglist` ***
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (58, 14, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (59, 15, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (60, 16, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (107, 36, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (88, 56, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (105, 90, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (106, 114, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (89, 124, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (132, 235, NULL, 'existing');
INSERT INTO`tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (133, 236, NULL, 'existing');

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textarea` ***
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (254, 143, NULL, 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (206, 10, 'markdown_with_purifier', 5);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (207, 11, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (173, 23, NULL, 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (212, 34, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (246, 35, 'markdown_with_purifier', 5);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (121, 42, 'markdown_with_purifier', 5);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (180, 62, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (195, 68, NULL, 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (247, 84, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (174, 85, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (111, 88, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (160, 110, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (161, 116, 'markdown_with_purifier', 10);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (243, 225, 'markdown_with_purifier', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (255, 234, 'markdown_with_purifier', 10);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (256, 237, 'markdown_with_purifier', 15);

-- *** STRUCTURE:`tbl_fields_time` ***
DROP TABLE IF EXISTS`tbl_fields_time`;
CREATE TABLE`tbl_fields_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_time` ***

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_upload` ***
INSERT INTO`tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (24, 128, '/workspace/uploads/avatar', '/\\.(?:|jpe?g|png)$/i');

-- *** STRUCTURE:`tbl_entries_data_1` ***
DROP TABLE IF EXISTS`tbl_entries_data_1`;
CREATE TABLE`tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_1` ***

-- *** STRUCTURE:`tbl_entries_data_10` ***
DROP TABLE IF EXISTS`tbl_entries_data_10`;
CREATE TABLE`tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_10` ***

-- *** STRUCTURE:`tbl_entries_data_100` ***
DROP TABLE IF EXISTS`tbl_entries_data_100`;
CREATE TABLE`tbl_entries_data_100` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_100` ***

-- *** STRUCTURE:`tbl_entries_data_101` ***
DROP TABLE IF EXISTS`tbl_entries_data_101`;
CREATE TABLE`tbl_entries_data_101` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_101` ***

-- *** STRUCTURE:`tbl_entries_data_102` ***
DROP TABLE IF EXISTS`tbl_entries_data_102`;
CREATE TABLE`tbl_entries_data_102` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_102` ***

-- *** STRUCTURE:`tbl_entries_data_103` ***
DROP TABLE IF EXISTS`tbl_entries_data_103`;
CREATE TABLE`tbl_entries_data_103` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_103` ***

-- *** STRUCTURE:`tbl_entries_data_104` ***
DROP TABLE IF EXISTS`tbl_entries_data_104`;
CREATE TABLE`tbl_entries_data_104` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_104` ***

-- *** STRUCTURE:`tbl_entries_data_105` ***
DROP TABLE IF EXISTS`tbl_entries_data_105`;
CREATE TABLE`tbl_entries_data_105` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_105` ***

-- *** STRUCTURE:`tbl_entries_data_106` ***
DROP TABLE IF EXISTS`tbl_entries_data_106`;
CREATE TABLE`tbl_entries_data_106` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_106` ***

-- *** STRUCTURE:`tbl_entries_data_109` ***
DROP TABLE IF EXISTS`tbl_entries_data_109`;
CREATE TABLE`tbl_entries_data_109` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_109` ***

-- *** STRUCTURE:`tbl_entries_data_11` ***
DROP TABLE IF EXISTS`tbl_entries_data_11`;
CREATE TABLE`tbl_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_11` ***

-- *** STRUCTURE:`tbl_entries_data_110` ***
DROP TABLE IF EXISTS`tbl_entries_data_110`;
CREATE TABLE`tbl_entries_data_110` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_110` ***

-- *** STRUCTURE:`tbl_entries_data_111` ***
DROP TABLE IF EXISTS`tbl_entries_data_111`;
CREATE TABLE`tbl_entries_data_111` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_111` ***

-- *** STRUCTURE:`tbl_entries_data_112` ***
DROP TABLE IF EXISTS`tbl_entries_data_112`;
CREATE TABLE`tbl_entries_data_112` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_112` ***

-- *** STRUCTURE:`tbl_entries_data_113` ***
DROP TABLE IF EXISTS`tbl_entries_data_113`;
CREATE TABLE`tbl_entries_data_113` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_113` ***

-- *** STRUCTURE:`tbl_entries_data_114` ***
DROP TABLE IF EXISTS`tbl_entries_data_114`;
CREATE TABLE`tbl_entries_data_114` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_114` ***

-- *** STRUCTURE:`tbl_entries_data_115` ***
DROP TABLE IF EXISTS`tbl_entries_data_115`;
CREATE TABLE`tbl_entries_data_115` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_115` ***

-- *** STRUCTURE:`tbl_entries_data_116` ***
DROP TABLE IF EXISTS`tbl_entries_data_116`;
CREATE TABLE`tbl_entries_data_116` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_116` ***

-- *** STRUCTURE:`tbl_entries_data_117` ***
DROP TABLE IF EXISTS`tbl_entries_data_117`;
CREATE TABLE`tbl_entries_data_117` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_117` ***

-- *** STRUCTURE:`tbl_entries_data_118` ***
DROP TABLE IF EXISTS`tbl_entries_data_118`;
CREATE TABLE`tbl_entries_data_118` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_118` ***

-- *** STRUCTURE:`tbl_entries_data_119` ***
DROP TABLE IF EXISTS`tbl_entries_data_119`;
CREATE TABLE`tbl_entries_data_119` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_119` ***

-- *** STRUCTURE:`tbl_entries_data_12` ***
DROP TABLE IF EXISTS`tbl_entries_data_12`;
CREATE TABLE`tbl_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_12` ***

-- *** STRUCTURE:`tbl_entries_data_120` ***
DROP TABLE IF EXISTS`tbl_entries_data_120`;
CREATE TABLE`tbl_entries_data_120` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_120` ***

-- *** STRUCTURE:`tbl_entries_data_121` ***
DROP TABLE IF EXISTS`tbl_entries_data_121`;
CREATE TABLE`tbl_entries_data_121` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_121` ***

-- *** STRUCTURE:`tbl_entries_data_122` ***
DROP TABLE IF EXISTS`tbl_entries_data_122`;
CREATE TABLE`tbl_entries_data_122` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_122` ***

-- *** STRUCTURE:`tbl_entries_data_123` ***
DROP TABLE IF EXISTS`tbl_entries_data_123`;
CREATE TABLE`tbl_entries_data_123` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_123` ***

-- *** STRUCTURE:`tbl_entries_data_124` ***
DROP TABLE IF EXISTS`tbl_entries_data_124`;
CREATE TABLE`tbl_entries_data_124` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_124` ***

-- *** STRUCTURE:`tbl_entries_data_126` ***
DROP TABLE IF EXISTS`tbl_entries_data_126`;
CREATE TABLE`tbl_entries_data_126` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_126` ***

-- *** STRUCTURE:`tbl_entries_data_127` ***
DROP TABLE IF EXISTS`tbl_entries_data_127`;
CREATE TABLE`tbl_entries_data_127` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_127` ***
INSERT INTO`tbl_entries_data_127` (`id`, `entry_id`, `author_id`) VALUES (4, 193, 2);
INSERT INTO`tbl_entries_data_127` (`id`, `entry_id`, `author_id`) VALUES (18, 207, 3);

-- *** STRUCTURE:`tbl_entries_data_128` ***
DROP TABLE IF EXISTS`tbl_entries_data_128`;
CREATE TABLE`tbl_entries_data_128` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_128` ***

-- *** STRUCTURE:`tbl_entries_data_129` ***
DROP TABLE IF EXISTS`tbl_entries_data_129`;
CREATE TABLE`tbl_entries_data_129` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_129` ***
INSERT INTO`tbl_entries_data_129` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 193, 2626178808, '262.617.8808');
INSERT INTO`tbl_entries_data_129` (`id`, `entry_id`, `handle`, `value`) VALUES (18, 207, 2025698116, '202.569.8116');

-- *** STRUCTURE:`tbl_entries_data_13` ***
DROP TABLE IF EXISTS`tbl_entries_data_13`;
CREATE TABLE`tbl_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_13` ***

-- *** STRUCTURE:`tbl_entries_data_130` ***
DROP TABLE IF EXISTS`tbl_entries_data_130`;
CREATE TABLE`tbl_entries_data_130` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_130` ***
INSERT INTO`tbl_entries_data_130` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 193, 'jennifergudgeon-gmailcom', 'jennifer.gudgeon@gmail.com');
INSERT INTO`tbl_entries_data_130` (`id`, `entry_id`, `handle`, `value`) VALUES (18, 207, 'hello-enguincom', 'hello@enguin.com');

-- *** STRUCTURE:`tbl_entries_data_131` ***
DROP TABLE IF EXISTS`tbl_entries_data_131`;
CREATE TABLE`tbl_entries_data_131` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_131` ***
INSERT INTO`tbl_entries_data_131` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 193, 'mude33yeph3f3atu', 'muDE33Yeph3f3aTu');
INSERT INTO`tbl_entries_data_131` (`id`, `entry_id`, `handle`, `value`) VALUES (16, 207, 'friekledi3viasouchiadroawi5bl4mi', 'Friekledi3viaSouchiadrOawi5BL4MI');

-- *** STRUCTURE:`tbl_entries_data_132` ***
DROP TABLE IF EXISTS`tbl_entries_data_132`;
CREATE TABLE`tbl_entries_data_132` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`handle`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_132` ***

-- *** STRUCTURE:`tbl_entries_data_133` ***
DROP TABLE IF EXISTS`tbl_entries_data_133`;
CREATE TABLE`tbl_entries_data_133` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_133` ***

-- *** STRUCTURE:`tbl_entries_data_134` ***
DROP TABLE IF EXISTS`tbl_entries_data_134`;
CREATE TABLE`tbl_entries_data_134` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_134` ***

-- *** STRUCTURE:`tbl_entries_data_135` ***
DROP TABLE IF EXISTS`tbl_entries_data_135`;
CREATE TABLE`tbl_entries_data_135` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_135` ***

-- *** STRUCTURE:`tbl_entries_data_136` ***
DROP TABLE IF EXISTS`tbl_entries_data_136`;
CREATE TABLE`tbl_entries_data_136` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_136` ***

-- *** STRUCTURE:`tbl_entries_data_137` ***
DROP TABLE IF EXISTS`tbl_entries_data_137`;
CREATE TABLE`tbl_entries_data_137` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_137` ***

-- *** STRUCTURE:`tbl_entries_data_138` ***
DROP TABLE IF EXISTS`tbl_entries_data_138`;
CREATE TABLE`tbl_entries_data_138` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_138` ***

-- *** STRUCTURE:`tbl_entries_data_139` ***
DROP TABLE IF EXISTS`tbl_entries_data_139`;
CREATE TABLE`tbl_entries_data_139` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_139` ***

-- *** STRUCTURE:`tbl_entries_data_14` ***
DROP TABLE IF EXISTS`tbl_entries_data_14`;
CREATE TABLE`tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_14` ***

-- *** STRUCTURE:`tbl_entries_data_140` ***
DROP TABLE IF EXISTS`tbl_entries_data_140`;
CREATE TABLE`tbl_entries_data_140` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_140` ***
INSERT INTO`tbl_entries_data_140` (`id`, `entry_id`, `value`) VALUES (12, 207, NULL);

-- *** STRUCTURE:`tbl_entries_data_141` ***
DROP TABLE IF EXISTS`tbl_entries_data_141`;
CREATE TABLE`tbl_entries_data_141` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_141` ***
INSERT INTO`tbl_entries_data_141` (`id`, `entry_id`, `value`) VALUES (12, 207, NULL);

-- *** STRUCTURE:`tbl_entries_data_142` ***
DROP TABLE IF EXISTS`tbl_entries_data_142`;
CREATE TABLE`tbl_entries_data_142` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_142` ***
INSERT INTO`tbl_entries_data_142` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 207, 'everything', 'EVERYTHING');

-- *** STRUCTURE:`tbl_entries_data_143` ***
DROP TABLE IF EXISTS`tbl_entries_data_143`;
CREATE TABLE`tbl_entries_data_143` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_143` ***
INSERT INTO`tbl_entries_data_143` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (12, 207, NULL, NULL);

-- *** STRUCTURE:`tbl_entries_data_144` ***
DROP TABLE IF EXISTS`tbl_entries_data_144`;
CREATE TABLE`tbl_entries_data_144` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_144` ***
INSERT INTO`tbl_entries_data_144` (`id`, `entry_id`, `value`) VALUES (12, 207, 'yes');

-- *** STRUCTURE:`tbl_entries_data_145` ***
DROP TABLE IF EXISTS`tbl_entries_data_145`;
CREATE TABLE`tbl_entries_data_145` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_145` ***
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (56, 207, 'tremors-and-twitches', 'Tremors and Twitches');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (55, 207, 'temperature', 'Temperature');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (54, 207, 'strength', 'Strength');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (53, 207, 'seasonal-allergies', 'Seasonal Allergies');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 207, 'motor-control', 'Motor Control');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (52, 207, 'pain', 'Pain');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (50, 207, 'concentration', 'Concentration');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (49, 207, 'breath', 'Breath');
INSERT INTO`tbl_entries_data_145` (`id`, `entry_id`, `handle`, `value`) VALUES (48, 207, 'aches-and-soreness', 'Aches and Soreness');

-- *** STRUCTURE:`tbl_entries_data_146` ***
DROP TABLE IF EXISTS`tbl_entries_data_146`;
CREATE TABLE`tbl_entries_data_146` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_146` ***
INSERT INTO`tbl_entries_data_146` (`id`, `entry_id`, `value`) VALUES (12, 207, 'yes');

-- *** STRUCTURE:`tbl_entries_data_147` ***
DROP TABLE IF EXISTS`tbl_entries_data_147`;
CREATE TABLE`tbl_entries_data_147` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_147` ***

-- *** STRUCTURE:`tbl_entries_data_148` ***
DROP TABLE IF EXISTS`tbl_entries_data_148`;
CREATE TABLE`tbl_entries_data_148` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_148` ***

-- *** STRUCTURE:`tbl_entries_data_149` ***
DROP TABLE IF EXISTS`tbl_entries_data_149`;
CREATE TABLE`tbl_entries_data_149` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_149` ***

-- *** STRUCTURE:`tbl_entries_data_15` ***
DROP TABLE IF EXISTS`tbl_entries_data_15`;
CREATE TABLE`tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_15` ***

-- *** STRUCTURE:`tbl_entries_data_150` ***
DROP TABLE IF EXISTS`tbl_entries_data_150`;
CREATE TABLE`tbl_entries_data_150` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_150` ***

-- *** STRUCTURE:`tbl_entries_data_151` ***
DROP TABLE IF EXISTS`tbl_entries_data_151`;
CREATE TABLE`tbl_entries_data_151` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_151` ***

-- *** STRUCTURE:`tbl_entries_data_152` ***
DROP TABLE IF EXISTS`tbl_entries_data_152`;
CREATE TABLE`tbl_entries_data_152` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_152` ***

-- *** STRUCTURE:`tbl_entries_data_153` ***
DROP TABLE IF EXISTS`tbl_entries_data_153`;
CREATE TABLE`tbl_entries_data_153` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_153` ***

-- *** STRUCTURE:`tbl_entries_data_154` ***
DROP TABLE IF EXISTS`tbl_entries_data_154`;
CREATE TABLE`tbl_entries_data_154` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_154` ***

-- *** STRUCTURE:`tbl_entries_data_155` ***
DROP TABLE IF EXISTS`tbl_entries_data_155`;
CREATE TABLE`tbl_entries_data_155` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_155` ***

-- *** STRUCTURE:`tbl_entries_data_156` ***
DROP TABLE IF EXISTS`tbl_entries_data_156`;
CREATE TABLE`tbl_entries_data_156` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_156` ***

-- *** STRUCTURE:`tbl_entries_data_157` ***
DROP TABLE IF EXISTS`tbl_entries_data_157`;
CREATE TABLE`tbl_entries_data_157` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_157` ***

-- *** STRUCTURE:`tbl_entries_data_158` ***
DROP TABLE IF EXISTS`tbl_entries_data_158`;
CREATE TABLE`tbl_entries_data_158` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_158` ***

-- *** STRUCTURE:`tbl_entries_data_159` ***
DROP TABLE IF EXISTS`tbl_entries_data_159`;
CREATE TABLE`tbl_entries_data_159` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_159` ***

-- *** STRUCTURE:`tbl_entries_data_16` ***
DROP TABLE IF EXISTS`tbl_entries_data_16`;
CREATE TABLE`tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_16` ***

-- *** STRUCTURE:`tbl_entries_data_160` ***
DROP TABLE IF EXISTS`tbl_entries_data_160`;
CREATE TABLE`tbl_entries_data_160` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_160` ***

-- *** STRUCTURE:`tbl_entries_data_161` ***
DROP TABLE IF EXISTS`tbl_entries_data_161`;
CREATE TABLE`tbl_entries_data_161` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_161` ***

-- *** STRUCTURE:`tbl_entries_data_162` ***
DROP TABLE IF EXISTS`tbl_entries_data_162`;
CREATE TABLE`tbl_entries_data_162` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_162` ***

-- *** STRUCTURE:`tbl_entries_data_163` ***
DROP TABLE IF EXISTS`tbl_entries_data_163`;
CREATE TABLE`tbl_entries_data_163` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_163` ***

-- *** STRUCTURE:`tbl_entries_data_164` ***
DROP TABLE IF EXISTS`tbl_entries_data_164`;
CREATE TABLE`tbl_entries_data_164` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_164` ***

-- *** STRUCTURE:`tbl_entries_data_165` ***
DROP TABLE IF EXISTS`tbl_entries_data_165`;
CREATE TABLE`tbl_entries_data_165` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_165` ***

-- *** STRUCTURE:`tbl_entries_data_166` ***
DROP TABLE IF EXISTS`tbl_entries_data_166`;
CREATE TABLE`tbl_entries_data_166` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_166` ***

-- *** STRUCTURE:`tbl_entries_data_167` ***
DROP TABLE IF EXISTS`tbl_entries_data_167`;
CREATE TABLE`tbl_entries_data_167` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_167` ***

-- *** STRUCTURE:`tbl_entries_data_168` ***
DROP TABLE IF EXISTS`tbl_entries_data_168`;
CREATE TABLE`tbl_entries_data_168` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_168` ***

-- *** STRUCTURE:`tbl_entries_data_169` ***
DROP TABLE IF EXISTS`tbl_entries_data_169`;
CREATE TABLE`tbl_entries_data_169` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_169` ***

-- *** STRUCTURE:`tbl_entries_data_17` ***
DROP TABLE IF EXISTS`tbl_entries_data_17`;
CREATE TABLE`tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_17` ***

-- *** STRUCTURE:`tbl_entries_data_170` ***
DROP TABLE IF EXISTS`tbl_entries_data_170`;
CREATE TABLE`tbl_entries_data_170` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_170` ***

-- *** STRUCTURE:`tbl_entries_data_171` ***
DROP TABLE IF EXISTS`tbl_entries_data_171`;
CREATE TABLE`tbl_entries_data_171` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_171` ***

-- *** STRUCTURE:`tbl_entries_data_172` ***
DROP TABLE IF EXISTS`tbl_entries_data_172`;
CREATE TABLE`tbl_entries_data_172` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_172` ***

-- *** STRUCTURE:`tbl_entries_data_173` ***
DROP TABLE IF EXISTS`tbl_entries_data_173`;
CREATE TABLE`tbl_entries_data_173` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_173` ***

-- *** STRUCTURE:`tbl_entries_data_174` ***
DROP TABLE IF EXISTS`tbl_entries_data_174`;
CREATE TABLE`tbl_entries_data_174` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_174` ***

-- *** STRUCTURE:`tbl_entries_data_175` ***
DROP TABLE IF EXISTS`tbl_entries_data_175`;
CREATE TABLE`tbl_entries_data_175` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_175` ***

-- *** STRUCTURE:`tbl_entries_data_176` ***
DROP TABLE IF EXISTS`tbl_entries_data_176`;
CREATE TABLE`tbl_entries_data_176` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_176` ***

-- *** STRUCTURE:`tbl_entries_data_177` ***
DROP TABLE IF EXISTS`tbl_entries_data_177`;
CREATE TABLE`tbl_entries_data_177` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_177` ***

-- *** STRUCTURE:`tbl_entries_data_178` ***
DROP TABLE IF EXISTS`tbl_entries_data_178`;
CREATE TABLE`tbl_entries_data_178` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_178` ***

-- *** STRUCTURE:`tbl_entries_data_179` ***
DROP TABLE IF EXISTS`tbl_entries_data_179`;
CREATE TABLE`tbl_entries_data_179` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_179` ***

-- *** STRUCTURE:`tbl_entries_data_18` ***
DROP TABLE IF EXISTS`tbl_entries_data_18`;
CREATE TABLE`tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_18` ***

-- *** STRUCTURE:`tbl_entries_data_180` ***
DROP TABLE IF EXISTS`tbl_entries_data_180`;
CREATE TABLE`tbl_entries_data_180` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_180` ***

-- *** STRUCTURE:`tbl_entries_data_181` ***
DROP TABLE IF EXISTS`tbl_entries_data_181`;
CREATE TABLE`tbl_entries_data_181` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_181` ***

-- *** STRUCTURE:`tbl_entries_data_182` ***
DROP TABLE IF EXISTS`tbl_entries_data_182`;
CREATE TABLE`tbl_entries_data_182` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_182` ***

-- *** STRUCTURE:`tbl_entries_data_183` ***
DROP TABLE IF EXISTS`tbl_entries_data_183`;
CREATE TABLE`tbl_entries_data_183` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_183` ***

-- *** STRUCTURE:`tbl_entries_data_184` ***
DROP TABLE IF EXISTS`tbl_entries_data_184`;
CREATE TABLE`tbl_entries_data_184` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_184` ***

-- *** STRUCTURE:`tbl_entries_data_185` ***
DROP TABLE IF EXISTS`tbl_entries_data_185`;
CREATE TABLE`tbl_entries_data_185` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_185` ***

-- *** STRUCTURE:`tbl_entries_data_186` ***
DROP TABLE IF EXISTS`tbl_entries_data_186`;
CREATE TABLE`tbl_entries_data_186` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_186` ***

-- *** STRUCTURE:`tbl_entries_data_187` ***
DROP TABLE IF EXISTS`tbl_entries_data_187`;
CREATE TABLE`tbl_entries_data_187` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_187` ***

-- *** STRUCTURE:`tbl_entries_data_188` ***
DROP TABLE IF EXISTS`tbl_entries_data_188`;
CREATE TABLE`tbl_entries_data_188` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_188` ***

-- *** STRUCTURE:`tbl_entries_data_189` ***
DROP TABLE IF EXISTS`tbl_entries_data_189`;
CREATE TABLE`tbl_entries_data_189` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_189` ***

-- *** STRUCTURE:`tbl_entries_data_19` ***
DROP TABLE IF EXISTS`tbl_entries_data_19`;
CREATE TABLE`tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_19` ***

-- *** STRUCTURE:`tbl_entries_data_190` ***
DROP TABLE IF EXISTS`tbl_entries_data_190`;
CREATE TABLE`tbl_entries_data_190` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_190` ***

-- *** STRUCTURE:`tbl_entries_data_191` ***
DROP TABLE IF EXISTS`tbl_entries_data_191`;
CREATE TABLE`tbl_entries_data_191` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_191` ***

-- *** STRUCTURE:`tbl_entries_data_192` ***
DROP TABLE IF EXISTS`tbl_entries_data_192`;
CREATE TABLE`tbl_entries_data_192` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_192` ***

-- *** STRUCTURE:`tbl_entries_data_193` ***
DROP TABLE IF EXISTS`tbl_entries_data_193`;
CREATE TABLE`tbl_entries_data_193` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_193` ***

-- *** STRUCTURE:`tbl_entries_data_194` ***
DROP TABLE IF EXISTS`tbl_entries_data_194`;
CREATE TABLE`tbl_entries_data_194` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_194` ***

-- *** STRUCTURE:`tbl_entries_data_195` ***
DROP TABLE IF EXISTS`tbl_entries_data_195`;
CREATE TABLE`tbl_entries_data_195` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_195` ***

-- *** STRUCTURE:`tbl_entries_data_196` ***
DROP TABLE IF EXISTS`tbl_entries_data_196`;
CREATE TABLE`tbl_entries_data_196` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_196` ***

-- *** STRUCTURE:`tbl_entries_data_197` ***
DROP TABLE IF EXISTS`tbl_entries_data_197`;
CREATE TABLE`tbl_entries_data_197` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_197` ***

-- *** STRUCTURE:`tbl_entries_data_198` ***
DROP TABLE IF EXISTS`tbl_entries_data_198`;
CREATE TABLE`tbl_entries_data_198` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_198` ***

-- *** STRUCTURE:`tbl_entries_data_199` ***
DROP TABLE IF EXISTS`tbl_entries_data_199`;
CREATE TABLE`tbl_entries_data_199` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_199` ***

-- *** STRUCTURE:`tbl_entries_data_200` ***
DROP TABLE IF EXISTS`tbl_entries_data_200`;
CREATE TABLE`tbl_entries_data_200` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_200` ***

-- *** STRUCTURE:`tbl_entries_data_201` ***
DROP TABLE IF EXISTS`tbl_entries_data_201`;
CREATE TABLE`tbl_entries_data_201` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_201` ***

-- *** STRUCTURE:`tbl_entries_data_202` ***
DROP TABLE IF EXISTS`tbl_entries_data_202`;
CREATE TABLE`tbl_entries_data_202` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_202` ***

-- *** STRUCTURE:`tbl_entries_data_203` ***
DROP TABLE IF EXISTS`tbl_entries_data_203`;
CREATE TABLE`tbl_entries_data_203` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_203` ***

-- *** STRUCTURE:`tbl_entries_data_204` ***
DROP TABLE IF EXISTS`tbl_entries_data_204`;
CREATE TABLE`tbl_entries_data_204` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_204` ***

-- *** STRUCTURE:`tbl_entries_data_205` ***
DROP TABLE IF EXISTS`tbl_entries_data_205`;
CREATE TABLE`tbl_entries_data_205` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_205` ***

-- *** STRUCTURE:`tbl_entries_data_206` ***
DROP TABLE IF EXISTS`tbl_entries_data_206`;
CREATE TABLE`tbl_entries_data_206` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_206` ***

-- *** STRUCTURE:`tbl_entries_data_207` ***
DROP TABLE IF EXISTS`tbl_entries_data_207`;
CREATE TABLE`tbl_entries_data_207` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_207` ***

-- *** STRUCTURE:`tbl_entries_data_208` ***
DROP TABLE IF EXISTS`tbl_entries_data_208`;
CREATE TABLE`tbl_entries_data_208` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_208` ***

-- *** STRUCTURE:`tbl_entries_data_209` ***
DROP TABLE IF EXISTS`tbl_entries_data_209`;
CREATE TABLE`tbl_entries_data_209` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_209` ***

-- *** STRUCTURE:`tbl_entries_data_210` ***
DROP TABLE IF EXISTS`tbl_entries_data_210`;
CREATE TABLE`tbl_entries_data_210` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_210` ***

-- *** STRUCTURE:`tbl_entries_data_211` ***
DROP TABLE IF EXISTS`tbl_entries_data_211`;
CREATE TABLE`tbl_entries_data_211` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_211` ***

-- *** STRUCTURE:`tbl_entries_data_212` ***
DROP TABLE IF EXISTS`tbl_entries_data_212`;
CREATE TABLE`tbl_entries_data_212` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_212` ***

-- *** STRUCTURE:`tbl_entries_data_213` ***
DROP TABLE IF EXISTS`tbl_entries_data_213`;
CREATE TABLE`tbl_entries_data_213` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_213` ***

-- *** STRUCTURE:`tbl_entries_data_214` ***
DROP TABLE IF EXISTS`tbl_entries_data_214`;
CREATE TABLE`tbl_entries_data_214` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_214` ***

-- *** STRUCTURE:`tbl_entries_data_215` ***
DROP TABLE IF EXISTS`tbl_entries_data_215`;
CREATE TABLE`tbl_entries_data_215` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_215` ***

-- *** STRUCTURE:`tbl_entries_data_216` ***
DROP TABLE IF EXISTS`tbl_entries_data_216`;
CREATE TABLE`tbl_entries_data_216` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_216` ***

-- *** STRUCTURE:`tbl_entries_data_217` ***
DROP TABLE IF EXISTS`tbl_entries_data_217`;
CREATE TABLE`tbl_entries_data_217` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_217` ***

-- *** STRUCTURE:`tbl_entries_data_218` ***
DROP TABLE IF EXISTS`tbl_entries_data_218`;
CREATE TABLE`tbl_entries_data_218` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_218` ***

-- *** STRUCTURE:`tbl_entries_data_219` ***
DROP TABLE IF EXISTS`tbl_entries_data_219`;
CREATE TABLE`tbl_entries_data_219` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_219` ***

-- *** STRUCTURE:`tbl_entries_data_22` ***
DROP TABLE IF EXISTS`tbl_entries_data_22`;
CREATE TABLE`tbl_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_22` ***

-- *** STRUCTURE:`tbl_entries_data_220` ***
DROP TABLE IF EXISTS`tbl_entries_data_220`;
CREATE TABLE`tbl_entries_data_220` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_220` ***

-- *** STRUCTURE:`tbl_entries_data_221` ***
DROP TABLE IF EXISTS`tbl_entries_data_221`;
CREATE TABLE`tbl_entries_data_221` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_221` ***

-- *** STRUCTURE:`tbl_entries_data_222` ***
DROP TABLE IF EXISTS`tbl_entries_data_222`;
CREATE TABLE`tbl_entries_data_222` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_222` ***

-- *** STRUCTURE:`tbl_entries_data_223` ***
DROP TABLE IF EXISTS`tbl_entries_data_223`;
CREATE TABLE`tbl_entries_data_223` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_223` ***

-- *** STRUCTURE:`tbl_entries_data_224` ***
DROP TABLE IF EXISTS`tbl_entries_data_224`;
CREATE TABLE`tbl_entries_data_224` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_224` ***

-- *** STRUCTURE:`tbl_entries_data_225` ***
DROP TABLE IF EXISTS`tbl_entries_data_225`;
CREATE TABLE`tbl_entries_data_225` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_225` ***

-- *** STRUCTURE:`tbl_entries_data_226` ***
DROP TABLE IF EXISTS`tbl_entries_data_226`;
CREATE TABLE`tbl_entries_data_226` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_226` ***

-- *** STRUCTURE:`tbl_entries_data_227` ***
DROP TABLE IF EXISTS`tbl_entries_data_227`;
CREATE TABLE`tbl_entries_data_227` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_227` ***

-- *** STRUCTURE:`tbl_entries_data_228` ***
DROP TABLE IF EXISTS`tbl_entries_data_228`;
CREATE TABLE`tbl_entries_data_228` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_228` ***

-- *** STRUCTURE:`tbl_entries_data_229` ***
DROP TABLE IF EXISTS`tbl_entries_data_229`;
CREATE TABLE`tbl_entries_data_229` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_229` ***

-- *** STRUCTURE:`tbl_entries_data_23` ***
DROP TABLE IF EXISTS`tbl_entries_data_23`;
CREATE TABLE`tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_23` ***

-- *** STRUCTURE:`tbl_entries_data_230` ***
DROP TABLE IF EXISTS`tbl_entries_data_230`;
CREATE TABLE`tbl_entries_data_230` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_230` ***

-- *** STRUCTURE:`tbl_entries_data_231` ***
DROP TABLE IF EXISTS`tbl_entries_data_231`;
CREATE TABLE`tbl_entries_data_231` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_231` ***
INSERT INTO`tbl_entries_data_231` (`id`, `entry_id`, `value`) VALUES (11, 207, 'yes');

-- *** STRUCTURE:`tbl_entries_data_232` ***
DROP TABLE IF EXISTS`tbl_entries_data_232`;
CREATE TABLE`tbl_entries_data_232` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_232` ***
INSERT INTO`tbl_entries_data_232` (`id`, `entry_id`, `value`) VALUES (9, 207, NULL);

-- *** STRUCTURE:`tbl_entries_data_233` ***
DROP TABLE IF EXISTS`tbl_entries_data_233`;
CREATE TABLE`tbl_entries_data_233` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_233` ***
INSERT INTO`tbl_entries_data_233` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 207, 'o', 'O-');

-- *** STRUCTURE:`tbl_entries_data_234` ***
DROP TABLE IF EXISTS`tbl_entries_data_234`;
CREATE TABLE`tbl_entries_data_234` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_234` ***
INSERT INTO`tbl_entries_data_234` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (9, 207, NULL, NULL);

-- *** STRUCTURE:`tbl_entries_data_235` ***
DROP TABLE IF EXISTS`tbl_entries_data_235`;
CREATE TABLE`tbl_entries_data_235` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_235` ***
INSERT INTO`tbl_entries_data_235` (`id`, `entry_id`, `handle`, `value`) VALUES (11, 207, 'shellfish', 'shellfish');

-- *** STRUCTURE:`tbl_entries_data_236` ***
DROP TABLE IF EXISTS`tbl_entries_data_236`;
CREATE TABLE`tbl_entries_data_236` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_236` ***
INSERT INTO`tbl_entries_data_236` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 207, 'penicillin', 'Penicillin');

-- *** STRUCTURE:`tbl_entries_data_237` ***
DROP TABLE IF EXISTS`tbl_entries_data_237`;
CREATE TABLE`tbl_entries_data_237` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_237` ***
INSERT INTO`tbl_entries_data_237` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (9, 207, NULL, NULL);

-- *** STRUCTURE:`tbl_entries_data_238` ***
DROP TABLE IF EXISTS`tbl_entries_data_238`;
CREATE TABLE`tbl_entries_data_238` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_238` ***
INSERT INTO`tbl_entries_data_238` (`id`, `entry_id`, `value`) VALUES (8, 207, 'yes');

-- *** STRUCTURE:`tbl_entries_data_24` ***
DROP TABLE IF EXISTS`tbl_entries_data_24`;
CREATE TABLE`tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_24` ***

-- *** STRUCTURE:`tbl_entries_data_240` ***
DROP TABLE IF EXISTS`tbl_entries_data_240`;
CREATE TABLE`tbl_entries_data_240` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_240` ***

-- *** STRUCTURE:`tbl_entries_data_241` ***
DROP TABLE IF EXISTS`tbl_entries_data_241`;
CREATE TABLE`tbl_entries_data_241` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_241` ***

-- *** STRUCTURE:`tbl_entries_data_242` ***
DROP TABLE IF EXISTS`tbl_entries_data_242`;
CREATE TABLE`tbl_entries_data_242` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_242` ***

-- *** STRUCTURE:`tbl_entries_data_243` ***
DROP TABLE IF EXISTS`tbl_entries_data_243`;
CREATE TABLE`tbl_entries_data_243` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_243` ***

-- *** STRUCTURE:`tbl_entries_data_244` ***
DROP TABLE IF EXISTS`tbl_entries_data_244`;
CREATE TABLE`tbl_entries_data_244` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_244` ***

-- *** STRUCTURE:`tbl_entries_data_245` ***
DROP TABLE IF EXISTS`tbl_entries_data_245`;
CREATE TABLE`tbl_entries_data_245` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_245` ***

-- *** STRUCTURE:`tbl_entries_data_26` ***
DROP TABLE IF EXISTS`tbl_entries_data_26`;
CREATE TABLE`tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_26` ***

-- *** STRUCTURE:`tbl_entries_data_28` ***
DROP TABLE IF EXISTS`tbl_entries_data_28`;
CREATE TABLE`tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_28` ***

-- *** STRUCTURE:`tbl_entries_data_29` ***
DROP TABLE IF EXISTS`tbl_entries_data_29`;
CREATE TABLE`tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_29` ***

-- *** STRUCTURE:`tbl_entries_data_3` ***
DROP TABLE IF EXISTS`tbl_entries_data_3`;
CREATE TABLE`tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_3` ***

-- *** STRUCTURE:`tbl_entries_data_30` ***
DROP TABLE IF EXISTS`tbl_entries_data_30`;
CREATE TABLE`tbl_entries_data_30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_30` ***

-- *** STRUCTURE:`tbl_entries_data_31` ***
DROP TABLE IF EXISTS`tbl_entries_data_31`;
CREATE TABLE`tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_31` ***

-- *** STRUCTURE:`tbl_entries_data_32` ***
DROP TABLE IF EXISTS`tbl_entries_data_32`;
CREATE TABLE`tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_32` ***

-- *** STRUCTURE:`tbl_entries_data_33` ***
DROP TABLE IF EXISTS`tbl_entries_data_33`;
CREATE TABLE`tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_33` ***

-- *** STRUCTURE:`tbl_entries_data_34` ***
DROP TABLE IF EXISTS`tbl_entries_data_34`;
CREATE TABLE`tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_34` ***

-- *** STRUCTURE:`tbl_entries_data_35` ***
DROP TABLE IF EXISTS`tbl_entries_data_35`;
CREATE TABLE`tbl_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_35` ***

-- *** STRUCTURE:`tbl_entries_data_36` ***
DROP TABLE IF EXISTS`tbl_entries_data_36`;
CREATE TABLE`tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_36` ***

-- *** STRUCTURE:`tbl_entries_data_38` ***
DROP TABLE IF EXISTS`tbl_entries_data_38`;
CREATE TABLE`tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_38` ***
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (42, 83, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (41, 82, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (31, 30, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (30, 29, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 14, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (6, 15, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (27, 16, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (22, 17, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (20, 18, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (26, 19, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (29, 20, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (24, 21, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (13, 22, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (37, 23, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (15, 24, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (28, 25, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (23, 26, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (21, 27, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (25, 28, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (32, 31, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (33, 32, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (40, 81, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (39, 80, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (38, 74, 'body', 'Body');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (43, 84, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (47, 85, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (48, 86, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (46, 87, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (49, 89, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (50, 90, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 91, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (52, 92, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (53, 93, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (54, 94, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (55, 95, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (56, 96, 'head', 'Head');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (57, 122, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (58, 123, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (59, 124, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (60, 125, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (61, 126, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (62, 127, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (63, 128, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (64, 129, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (65, 130, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (66, 131, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (67, 132, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (68, 133, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (69, 134, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (70, 135, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (71, 136, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (72, 137, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (73, 138, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (74, 139, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (75, 140, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (76, 141, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (77, 142, 'neuro', 'Neuro');
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `handle`, `value`) VALUES (78, 143, 'neuro', 'Neuro');

-- *** STRUCTURE:`tbl_entries_data_39` ***
DROP TABLE IF EXISTS`tbl_entries_data_39`;
CREATE TABLE`tbl_entries_data_39` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_39` ***
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (41, 82, 'front-left', 'Front Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (31, 30, 'lower-back', 'Lower back');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (30, 29, 'upper-back', 'Upper back');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 14, 'head', 'Head');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (6, 15, 'neck', 'Neck');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (27, 16, 'shoulder-left', 'Shoulder Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (22, 17, 'shoulder-right', 'Shoulder Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (20, 18, 'arm-left', 'Arm Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (26, 19, 'arm-right', 'Arm Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (29, 20, 'hand-left', 'Hand Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (24, 21, 'hand-right', 'Hand Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (13, 22, 'chest', 'Chest');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (37, 23, 'abdomen', 'Abdomen');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (15, 24, 'waist', 'Waist');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (28, 25, 'leg-left', 'Leg Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (23, 26, 'leg-right', 'Leg Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (21, 27, 'foot-left', 'Foot Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (25, 28, 'foot-right', 'Foot Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (32, 31, 'groin', 'Groin');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (33, 32, 'butt', 'Butt');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (40, 81, 'front-right', 'Front Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (39, 80, 'sinuses', 'Sinuses');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (38, 74, 'face', 'Face');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (42, 83, 'rear-right', 'Rear Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (43, 84, 'rear-left', 'Rear Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (47, 85, 'occipital-right', 'Occipital Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (48, 86, 'occipital-left', 'Occipital Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (46, 87, 'top', 'Top');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (49, 89, 'temple-right', 'Temple Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (50, 90, 'temple-left', 'Temple Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 91, 'eye-right', 'Eye Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (52, 92, 'eye-left', 'Eye Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (53, 93, 'jaw-right', 'Jaw Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (54, 94, 'jaw-left', 'Jaw Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (55, 95, 'neck-right', 'Neck Right');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (56, 96, 'neck-left', 'Neck Left');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (57, 122, 'r-temple', 'R Temple');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (58, 123, 'l-temple', 'L Temple');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (59, 124, 'r-eyebrow', 'R Eyebrow');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (60, 125, 'l-eyebrow', 'L Eyebrow');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (61, 126, 'r-eye', 'R Eye');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (62, 127, 'l-eye', 'L Eye');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (63, 128, 'r-cheek', 'R Cheek');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (64, 129, 'l-cheek', 'L Cheek');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (65, 130, 'r-jaw', 'R Jaw');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (66, 131, 'l-jaw', 'L Jaw');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (67, 132, 'r-pinky', 'R Pinky');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (68, 133, 'l-pinky', 'L Pinky');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (69, 134, 'r-ring-finter', 'R Ring Finter');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (70, 135, 'l-ring-finger', 'L Ring Finger');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (71, 136, 'r-middle-finger', 'R Middle Finger');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (72, 137, 'l-middle-finger', 'L Middle Finger');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (73, 138, 'l-index-finger', 'L Index Finger');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (74, 139, 'r-index-finger', 'R Index Finger');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (75, 140, 'r-thumb', 'R Thumb');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (76, 141, 'l-thumb', 'L Thumb');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (77, 142, 'r-palm', 'R Palm');
INSERT INTO`tbl_entries_data_39` (`id`, `entry_id`, `handle`, `value`) VALUES (78, 143, 'l-palm', 'L Palm');

-- *** STRUCTURE:`tbl_entries_data_40` ***
DROP TABLE IF EXISTS`tbl_entries_data_40`;
CREATE TABLE`tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_40` ***

-- *** STRUCTURE:`tbl_entries_data_41` ***
DROP TABLE IF EXISTS`tbl_entries_data_41`;
CREATE TABLE`tbl_entries_data_41` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_41` ***

-- *** STRUCTURE:`tbl_entries_data_42` ***
DROP TABLE IF EXISTS`tbl_entries_data_42`;
CREATE TABLE`tbl_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_42` ***

-- *** STRUCTURE:`tbl_entries_data_43` ***
DROP TABLE IF EXISTS`tbl_entries_data_43`;
CREATE TABLE`tbl_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_43` ***

-- *** STRUCTURE:`tbl_entries_data_44` ***
DROP TABLE IF EXISTS`tbl_entries_data_44`;
CREATE TABLE`tbl_entries_data_44` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_44` ***

-- *** STRUCTURE:`tbl_entries_data_45` ***
DROP TABLE IF EXISTS`tbl_entries_data_45`;
CREATE TABLE`tbl_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_45` ***

-- *** STRUCTURE:`tbl_entries_data_48` ***
DROP TABLE IF EXISTS`tbl_entries_data_48`;
CREATE TABLE`tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_48` ***

-- *** STRUCTURE:`tbl_entries_data_49` ***
DROP TABLE IF EXISTS`tbl_entries_data_49`;
CREATE TABLE`tbl_entries_data_49` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_49` ***

-- *** STRUCTURE:`tbl_entries_data_5` ***
DROP TABLE IF EXISTS`tbl_entries_data_5`;
CREATE TABLE`tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_5` ***

-- *** STRUCTURE:`tbl_entries_data_50` ***
DROP TABLE IF EXISTS`tbl_entries_data_50`;
CREATE TABLE`tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_50` ***

-- *** STRUCTURE:`tbl_entries_data_51` ***
DROP TABLE IF EXISTS`tbl_entries_data_51`;
CREATE TABLE`tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_51` ***

-- *** STRUCTURE:`tbl_entries_data_52` ***
DROP TABLE IF EXISTS`tbl_entries_data_52`;
CREATE TABLE`tbl_entries_data_52` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_52` ***

-- *** STRUCTURE:`tbl_entries_data_53` ***
DROP TABLE IF EXISTS`tbl_entries_data_53`;
CREATE TABLE`tbl_entries_data_53` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_53` ***

-- *** STRUCTURE:`tbl_entries_data_54` ***
DROP TABLE IF EXISTS`tbl_entries_data_54`;
CREATE TABLE`tbl_entries_data_54` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_54` ***

-- *** STRUCTURE:`tbl_entries_data_55` ***
DROP TABLE IF EXISTS`tbl_entries_data_55`;
CREATE TABLE`tbl_entries_data_55` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_55` ***

-- *** STRUCTURE:`tbl_entries_data_56` ***
DROP TABLE IF EXISTS`tbl_entries_data_56`;
CREATE TABLE`tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_56` ***

-- *** STRUCTURE:`tbl_entries_data_57` ***
DROP TABLE IF EXISTS`tbl_entries_data_57`;
CREATE TABLE`tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `centre` varchar(255) DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_57` ***

-- *** STRUCTURE:`tbl_entries_data_58` ***
DROP TABLE IF EXISTS`tbl_entries_data_58`;
CREATE TABLE`tbl_entries_data_58` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_58` ***

-- *** STRUCTURE:`tbl_entries_data_6` ***
DROP TABLE IF EXISTS`tbl_entries_data_6`;
CREATE TABLE`tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_6` ***

-- *** STRUCTURE:`tbl_entries_data_62` ***
DROP TABLE IF EXISTS`tbl_entries_data_62`;
CREATE TABLE`tbl_entries_data_62` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_62` ***

-- *** STRUCTURE:`tbl_entries_data_63` ***
DROP TABLE IF EXISTS`tbl_entries_data_63`;
CREATE TABLE`tbl_entries_data_63` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_63` ***

-- *** STRUCTURE:`tbl_entries_data_64` ***
DROP TABLE IF EXISTS`tbl_entries_data_64`;
CREATE TABLE`tbl_entries_data_64` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_64` ***

-- *** STRUCTURE:`tbl_entries_data_65` ***
DROP TABLE IF EXISTS`tbl_entries_data_65`;
CREATE TABLE`tbl_entries_data_65` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_65` ***

-- *** STRUCTURE:`tbl_entries_data_66` ***
DROP TABLE IF EXISTS`tbl_entries_data_66`;
CREATE TABLE`tbl_entries_data_66` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_66` ***

-- *** STRUCTURE:`tbl_entries_data_67` ***
DROP TABLE IF EXISTS`tbl_entries_data_67`;
CREATE TABLE`tbl_entries_data_67` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_67` ***

-- *** STRUCTURE:`tbl_entries_data_68` ***
DROP TABLE IF EXISTS`tbl_entries_data_68`;
CREATE TABLE`tbl_entries_data_68` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_68` ***

-- *** STRUCTURE:`tbl_entries_data_69` ***
DROP TABLE IF EXISTS`tbl_entries_data_69`;
CREATE TABLE`tbl_entries_data_69` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_69` ***

-- *** STRUCTURE:`tbl_entries_data_71` ***
DROP TABLE IF EXISTS`tbl_entries_data_71`;
CREATE TABLE`tbl_entries_data_71` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_71` ***

-- *** STRUCTURE:`tbl_entries_data_72` ***
DROP TABLE IF EXISTS`tbl_entries_data_72`;
CREATE TABLE`tbl_entries_data_72` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_72` ***

-- *** STRUCTURE:`tbl_entries_data_75` ***
DROP TABLE IF EXISTS`tbl_entries_data_75`;
CREATE TABLE`tbl_entries_data_75` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_75` ***

-- *** STRUCTURE:`tbl_entries_data_77` ***
DROP TABLE IF EXISTS`tbl_entries_data_77`;
CREATE TABLE`tbl_entries_data_77` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_77` ***

-- *** STRUCTURE:`tbl_entries_data_78` ***
DROP TABLE IF EXISTS`tbl_entries_data_78`;
CREATE TABLE`tbl_entries_data_78` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_78` ***

-- *** STRUCTURE:`tbl_entries_data_79` ***
DROP TABLE IF EXISTS`tbl_entries_data_79`;
CREATE TABLE`tbl_entries_data_79` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_79` ***

-- *** STRUCTURE:`tbl_entries_data_80` ***
DROP TABLE IF EXISTS`tbl_entries_data_80`;
CREATE TABLE`tbl_entries_data_80` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_80` ***

-- *** STRUCTURE:`tbl_entries_data_81` ***
DROP TABLE IF EXISTS`tbl_entries_data_81`;
CREATE TABLE`tbl_entries_data_81` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_81` ***

-- *** STRUCTURE:`tbl_entries_data_82` ***
DROP TABLE IF EXISTS`tbl_entries_data_82`;
CREATE TABLE`tbl_entries_data_82` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_82` ***

-- *** STRUCTURE:`tbl_entries_data_83` ***
DROP TABLE IF EXISTS`tbl_entries_data_83`;
CREATE TABLE`tbl_entries_data_83` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_83` ***

-- *** STRUCTURE:`tbl_entries_data_84` ***
DROP TABLE IF EXISTS`tbl_entries_data_84`;
CREATE TABLE`tbl_entries_data_84` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_84` ***

-- *** STRUCTURE:`tbl_entries_data_85` ***
DROP TABLE IF EXISTS`tbl_entries_data_85`;
CREATE TABLE`tbl_entries_data_85` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_85` ***

-- *** STRUCTURE:`tbl_entries_data_86` ***
DROP TABLE IF EXISTS`tbl_entries_data_86`;
CREATE TABLE`tbl_entries_data_86` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_86` ***

-- *** STRUCTURE:`tbl_entries_data_87` ***
DROP TABLE IF EXISTS`tbl_entries_data_87`;
CREATE TABLE`tbl_entries_data_87` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_87` ***
INSERT INTO`tbl_entries_data_87` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 76, 'tension-headache', 'Tension Headache');
INSERT INTO`tbl_entries_data_87` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 77, 'cluster-headache', 'Cluster Headache');
INSERT INTO`tbl_entries_data_87` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 78, 'sinus-headache', 'Sinus Headache');
INSERT INTO`tbl_entries_data_87` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 79, 'migraine-headache', 'Migraine Headache');
INSERT INTO`tbl_entries_data_87` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 274, 'don-t-know-other', 'Don’t Know/Other');

-- *** STRUCTURE:`tbl_entries_data_88` ***
DROP TABLE IF EXISTS`tbl_entries_data_88`;
CREATE TABLE`tbl_entries_data_88` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_88` ***
INSERT INTO`tbl_entries_data_88` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (1, 76, 'Tension headaches, the most common type, feel like a constant ache or pressure around the head, especially at the temples or back of the head and neck. Not as severe as migraines, they don\'t usually cause nausea or vomiting, and they rarely halt daily activities.', '<p>Tension headaches, the most common type, feel like a constant ache or pressure around the head, especially at the temples or back of the head and neck. Not as severe as migraines, they don\'t usually cause nausea or vomiting, and they rarely halt daily activities.</p>\n');
INSERT INTO`tbl_entries_data_88` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (2, 77, 'Recurring headaches that occur in groups or cycles. They appear suddenly and are characterized by severe, debilitating pain on one side of the head, and are often accompanied by a watery eye and nasal congestion or a runny nose on the same side of the face.', '<p>Recurring headaches that occur in groups or cycles. They appear suddenly and are characterized by severe, debilitating pain on one side of the head, and are often accompanied by a watery eye and nasal congestion or a runny nose on the same side of the face.</p>\n');
INSERT INTO`tbl_entries_data_88` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (3, 78, 'Often from sinus infections and is accompanied by fevers.', '<p>Often from sinus infections and is accompanied by fevers.</p>\n');
INSERT INTO`tbl_entries_data_88` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 79, 'At least two out of these four: one-sided pain, throbbing pain, moderate-to-severe pain, and pain that interferes with, is worsened by, or prohibits routine activity. At least one associated feature: nausea and/or vomiting, or, if those are not present, then sensitivity to light and sound\r\n\r\nA migraine may be foreshadowed by aura, such as visual distortions or hand numbness.', '<p>At least two out of these four: one-sided pain, throbbing pain, moderate-to-severe pain, and pain that interferes with, is worsened by, or prohibits routine activity. At least one associated feature: nausea and/or vomiting, or, if those are not present, then sensitivity to light and sound</p>\n\n<p>A migraine may be foreshadowed by aura, such as visual distortions or hand numbness.</p>\n');
INSERT INTO`tbl_entries_data_88` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (5, 274, 'Don’t know, or something unlisted.', '<p>Don’t know, or something unlisted.</p>\n');

-- *** STRUCTURE:`tbl_entries_data_89` ***
DROP TABLE IF EXISTS`tbl_entries_data_89`;
CREATE TABLE`tbl_entries_data_89` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_89` ***

-- *** STRUCTURE:`tbl_entries_data_90` ***
DROP TABLE IF EXISTS`tbl_entries_data_90`;
CREATE TABLE`tbl_entries_data_90` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_90` ***

-- *** STRUCTURE:`tbl_entries_data_92` ***
DROP TABLE IF EXISTS`tbl_entries_data_92`;
CREATE TABLE`tbl_entries_data_92` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_92` ***

-- *** STRUCTURE:`tbl_entries_data_94` ***
DROP TABLE IF EXISTS`tbl_entries_data_94`;
CREATE TABLE`tbl_entries_data_94` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_94` ***

-- *** STRUCTURE:`tbl_entries_data_96` ***
DROP TABLE IF EXISTS`tbl_entries_data_96`;
CREATE TABLE`tbl_entries_data_96` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_96` ***

-- *** STRUCTURE:`tbl_entries_data_97` ***
DROP TABLE IF EXISTS`tbl_entries_data_97`;
CREATE TABLE`tbl_entries_data_97` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `seconds` bigint(20) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `seconds` (`seconds`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_97` ***

-- *** STRUCTURE:`tbl_entries_data_98` ***
DROP TABLE IF EXISTS`tbl_entries_data_98`;
CREATE TABLE`tbl_entries_data_98` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_98` ***

-- *** STRUCTURE:`tbl_entries_data_99` ***
DROP TABLE IF EXISTS`tbl_entries_data_99`;
CREATE TABLE`tbl_entries_data_99` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_99` ***

-- *** DATA:`tbl_documentation` ***
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (1, 'User info', '/publish/users/,/publish/users/new/,/publish/users/edit/,/system/authors/,/system/authors/edit/,/system/authors/new/', 'To create new user accounts, you need to add them in both System > Authors and Meta > Users. Adding new users to the former gives them access to this admin panel. The latter sets user preferences to tailor the diary to the specific user.\r\n\r\nInclude a photo and contact information so the physician can remember who you are.\r\n(Let’s be serious, they’ll likely have your file on hand if they are ever here, but putting a face to the file can be helpful.)\r\n\r\nSeparate email addresses are used for logging in and for User metadata in case you want to give the doctor a different email address.', '<p>To create new user accounts, you need to add them in both System &gt; Authors and Meta &gt; Users. Adding new users to the former gives them access to this admin panel. The latter sets user preferences to tailor the diary to the specific user.</p>\n\n<p>Include a photo and contact information so the physician can remember who you are.\n(Let’s be serious, they’ll likely have your file on hand if they are ever here, but putting a face to the file can be helpful.)</p>\n\n<p>Separate email addresses are used for logging in and for User metadata in case you want to give the doctor a different email address.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (2, 'Auth Token', '/publish/users/new/,/publish/users/edit/', 'The authorization token is required if you would like to access the API without logging in (eg for exporting). To use it, append the `auth-token` variable to the end of the url:`?auth-token=[token]`.', 'The authorization token is required if you would like to access the API without logging in (eg for exporting). To use it, append the `auth-token` variable to the end of the url:`?auth-token=[token]`.');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (5, 'Chronic Illness Diary', '/publish/users/new/,/publish/users/edit/', 'Only choose the metrics you wish to track. If you choose too many, using the diary will become tedious and reduce your likelihood of keeping it up to date.', '<p>Only choose the metrics you wish to track. If you choose too many, using the diary will become tedious and reduce your likelihood of keeping it up to date.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (6, 'Emergency Contact', '/publish/users/new/,/publish/users/edit/', 'Since this may be the most accessible health data on your phone, I’ve added a section to allow you to include emergency health information. Maybe EMTs will notice it, maybe not.', '<p>Since this may be the most accessible health data on your phone, I’ve added a section to allow you to include emergency health information. Maybe EMTs will notice it, maybe not.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (4, 'Member permissions', '/extension/members/roles/', 'Since I am allowing users to edit and add to their diary without being logged in and with an authorization token, non-logged-in members must have permission to use events.\r\n\r\nKind of defeats one of the main purposes of the members event, but saving a page to the iphone home page doesn’t seem to save log in cookies across sessions. Tres annoying, but page access is still being handled in the xsl templates, which will be good enough for now.', '<p>Since I am allowing users to edit and add to their diary without being logged in and with an authorization token, non-logged-in members must have permission to use events.</p>\n\n<p>Kind of defeats one of the main purposes of the members event, but saving a page to the iphone home page doesn’t seem to save log in cookies across sessions. Tres annoying, but page access is still being handled in the xsl templates, which will be good enough for now.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (7, 'Long end dates', '/publish/sleep-diary/,/publish/sleep-diary/new/,/publish/sleep-diary/edit/,/publish/ailment-diary/,/publish/ailment-diary/new/,/publish/ailment-diary/edit/,/publish/period-diary/,/publish/period-diary/new/,/publish/period-diary/edit/,/publish/medical-visits/,/publish/medical-visits/new/,/publish/medical-visits/edit/', 'The extension used to record date and time has a known bug where it can not filter for null end dates, so using 9876-05-04T03:21 is a hack to filter for open diary entries. The XSLT used to build the pages and API are already able to accept both empty and hacked datetimes once the extension and datasources filters are patched.', '<p>The extension used to record date and time has a known bug where it can not filter for null end dates, so using 9876-05-04T03:21 is a hack to filter for open diary entries. The XSLT used to build the pages and API are already able to accept both empty and hacked datetimes once the extension and datasources filters are patched.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (8, 'Editing entries', '/publish/activity-diary/,/publish/activity-diary/new/,/publish/activity-diary/edit/,/publish/food-diary/,/publish/food-diary/new/,/publish/food-diary/edit/,/publish/sleep-diary/,/publish/sleep-diary/new/,/publish/sleep-diary/edit/,/publish/ailment-diary/,/publish/ailment-diary/new/,/publish/ailment-diary/edit/,/publish/medication-dairy/,/publish/medication-dairy/new/,/publish/medication-dairy/edit/,/publish/period-diary/,/publish/period-diary/new/,/publish/period-diary/edit/,/publish/chronic-diary/,/publish/chronic-diary/new/,/publish/chronic-diary/edit/,/publish/prescriptions/,/publish/prescriptions/new/,/publish/prescriptions/edit/,/publish/medications/,/publish/medications/new/,/publish/medications/edit/,/publish/medical-visits/,/publish/medical-visits/new/,/publish/medical-visits/edit/,/publish/doctors-and-medical-facilities/,/publish/doctors-and-medical-facilities/new/,/publish/doctors-and-medical-facilities/edit/,/publish/doctor-accounts/,/publish/doctor-accounts/new/,/publish/doctor-accounts/edit/', 'As currently set up, the front-end forms are mostly for creating and adding content, editing must be done through the Symphony admin (because each entry can be very complicated, so it would take a lot of effort to build editing forms for all of them.)', '<p>As currently set up, the front-end forms are mostly for creating and adding content, editing must be done through the Symphony admin (because each entry can be very complicated, so it would take a lot of effort to build editing forms for all of them.)</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (9, 'The difference among the Medication Diary, Prescriptions, and Medications', '/publish/medication-dairy/,/publish/medication-dairy/new/,/publish/medication-dairy/edit/,/publish/prescriptions/,/publish/prescriptions/new/,/publish/prescriptions/edit/,/publish/medications/,/publish/medications/new/,/publish/medications/edit/', '*Medications* are how you list the names of the name of the medication you take. This is to make it easier to enter repeat prescriptions (so you do not have to re-enter the name, descriptions, side-effects, etc.\r\n\r\n*Prescriptions* are the actual prescriptions your doctors provide.\r\n\r\nThe *Medication Diary* is to help you track when you actually take each dose. This can help you see how consistent you are, by tracking how many you have taken and the time.', '<p><em>Medications</em> are how you list the names of the name of the medication you take. This is to make it easier to enter repeat prescriptions (so you do not have to re-enter the name, descriptions, side-effects, etc.</p>\n\n<p><em>Prescriptions</em> are the actual prescriptions your doctors provide.</p>\n\n<p>The <em>Medication Diary</em> is to help you track when you actually take each dose. This can help you see how consistent you are, by tracking how many you have taken and the time.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (10, 'Body Parts', '/publish/body-parts/,/publish/body-parts/new/,/publish/body-parts/edit/', 'This is a centralized list of all the body parts listed in the ailment diary.', '<p>This is a centralized list of all the body parts listed in the ailment diary.</p>\n');
INSERT INTO`tbl_documentation` (`id`, `title`, `pages`, `content`, `content_formatted`) VALUES (11, 'Headache types', '/publish/headache-types/,/publish/headache-types/new/,/publish/headache-types/edit/', 'This list of headache types gets listed when creating a new ailment entry.', '<p>This list of headache types gets listed when creating a new ailment entry.</p>\n');

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (79, 11, 1, '2013-07-02 02:04:16', '2013-07-02 07:04:16', '2013-07-02 02:04:16', '2013-07-02 07:04:16');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (78, 11, 1, '2013-07-02 02:03:22', '2013-07-02 07:03:22', '2013-07-02 02:03:22', '2013-07-02 07:03:22');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (30, 7, 1, '2013-06-28 19:08:09', '2013-06-29 00:08:09', '2013-06-28 19:08:09', '2013-06-29 00:08:09');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (29, 7, 1, '2013-06-28 19:08:00', '2013-06-29 00:08:00', '2013-06-28 19:08:00', '2013-06-29 00:08:00');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (14, 7, 1, '2013-06-28 19:01:22', '2013-06-29 00:01:22', '2013-06-28 19:01:22', '2013-06-29 00:01:22');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (15, 7, 1, '2013-06-28 19:01:29', '2013-06-29 00:01:29', '2013-06-28 19:01:29', '2013-06-29 00:01:29');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (16, 7, 1, '2013-06-28 19:03:09', '2013-06-29 00:03:09', '2013-06-28 19:07:02', '2013-06-29 00:07:02');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (17, 7, 1, '2013-06-28 19:03:18', '2013-06-29 00:03:18', '2013-06-28 19:06:32', '2013-06-29 00:06:32');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (18, 7, 1, '2013-06-28 19:03:26', '2013-06-29 00:03:26', '2013-06-28 19:05:58', '2013-06-29 00:05:58');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (19, 7, 1, '2013-06-28 19:03:35', '2013-06-29 00:03:35', '2013-06-28 19:06:51', '2013-06-29 00:06:51');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (20, 7, 1, '2013-06-28 19:03:42', '2013-06-29 00:03:42', '2013-06-28 19:07:09', '2013-06-29 00:07:09');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (21, 7, 1, '2013-06-28 19:03:49', '2013-06-29 00:03:49', '2013-06-28 19:06:40', '2013-06-29 00:06:40');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (22, 7, 1, '2013-06-28 19:04:01', '2013-06-29 00:04:01', '2013-06-28 19:04:01', '2013-06-29 00:04:01');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (23, 7, 1, '2013-06-28 19:04:10', '2013-06-29 00:04:10', '2013-07-01 23:21:04', '2013-07-02 04:21:04');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (24, 7, 1, '2013-06-28 19:04:19', '2013-06-29 00:04:19', '2013-06-28 19:04:19', '2013-06-29 00:04:19');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (25, 7, 1, '2013-06-28 19:04:26', '2013-06-29 00:04:26', '2013-06-28 19:07:05', '2013-06-29 00:07:05');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (26, 7, 1, '2013-06-28 19:04:32', '2013-06-29 00:04:32', '2013-06-28 19:06:36', '2013-06-29 00:06:36');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (27, 7, 1, '2013-06-28 19:04:42', '2013-06-29 00:04:42', '2013-06-28 19:06:08', '2013-06-29 00:06:08');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (28, 7, 1, '2013-06-28 19:04:53', '2013-06-29 00:04:53', '2013-06-28 19:06:46', '2013-06-29 00:06:46');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (31, 7, 1, '2013-06-28 19:08:19', '2013-06-29 00:08:19', '2013-06-28 19:08:19', '2013-06-29 00:08:19');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (32, 7, 1, '2013-06-28 19:08:28', '2013-06-29 00:08:28', '2013-06-28 19:08:28', '2013-06-29 00:08:28');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (123, 7, 1, '2013-07-06 00:09:07', '2013-07-06 05:09:07', '2013-07-06 00:09:07', '2013-07-06 05:09:07');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (77, 11, 1, '2013-07-02 02:02:16', '2013-07-02 07:02:16', '2013-07-02 02:02:16', '2013-07-02 07:02:16');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (76, 11, 1, '2013-07-02 02:01:24', '2013-07-02 07:01:24', '2013-07-02 02:01:24', '2013-07-02 07:01:24');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (74, 7, 1, '2013-07-02 00:45:54', '2013-07-02 05:45:54', '2013-07-02 00:45:54', '2013-07-02 05:45:54');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (80, 7, 1, '2013-07-02 02:08:05', '2013-07-02 07:08:05', '2013-07-02 02:08:05', '2013-07-02 07:08:05');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (81, 7, 1, '2013-07-02 02:08:25', '2013-07-02 07:08:25', '2013-07-02 02:08:25', '2013-07-02 07:08:25');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (82, 7, 1, '2013-07-02 02:08:34', '2013-07-02 07:08:34', '2013-07-02 02:08:34', '2013-07-02 07:08:34');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (83, 7, 1, '2013-07-02 02:08:50', '2013-07-02 07:08:50', '2013-07-02 02:08:50', '2013-07-02 07:08:50');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (84, 7, 1, '2013-07-02 02:08:58', '2013-07-02 07:08:58', '2013-07-02 02:08:58', '2013-07-02 07:08:58');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (85, 7, 1, '2013-07-02 02:09:09', '2013-07-02 07:09:09', '2013-07-02 13:31:00', '2013-07-02 18:31:00');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (86, 7, 1, '2013-07-02 02:09:18', '2013-07-02 07:09:18', '2013-07-02 13:31:15', '2013-07-02 18:31:15');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (87, 7, 1, '2013-07-02 02:09:27', '2013-07-02 07:09:27', '2013-07-02 02:09:27', '2013-07-02 07:09:27');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (89, 7, 1, '2013-07-02 13:33:32', '2013-07-02 18:33:32', '2013-07-02 13:33:32', '2013-07-02 18:33:32');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (90, 7, 1, '2013-07-02 13:34:18', '2013-07-02 18:34:18', '2013-07-02 13:34:18', '2013-07-02 18:34:18');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (91, 7, 1, '2013-07-02 13:34:34', '2013-07-02 18:34:34', '2013-07-02 13:34:34', '2013-07-02 18:34:34');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (92, 7, 1, '2013-07-02 13:34:48', '2013-07-02 18:34:48', '2013-07-02 13:34:48', '2013-07-02 18:34:48');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (93, 7, 1, '2013-07-02 13:35:27', '2013-07-02 18:35:27', '2013-07-02 13:35:27', '2013-07-02 18:35:27');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (94, 7, 1, '2013-07-02 13:35:41', '2013-07-02 18:35:41', '2013-07-02 13:35:41', '2013-07-02 18:35:41');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (95, 7, 1, '2013-07-02 13:37:06', '2013-07-02 18:37:06', '2013-07-02 13:37:06', '2013-07-02 18:37:06');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (96, 7, 1, '2013-07-02 13:37:22', '2013-07-02 18:37:22', '2013-07-02 13:37:22', '2013-07-02 18:37:22');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (122, 7, 1, '2013-07-06 00:08:58', '2013-07-06 05:08:58', '2013-07-06 00:08:58', '2013-07-06 05:08:58');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (124, 7, 1, '2013-07-06 00:09:20', '2013-07-06 05:09:20', '2013-07-06 00:09:20', '2013-07-06 05:09:20');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (125, 7, 1, '2013-07-06 00:09:29', '2013-07-06 05:09:29', '2013-07-06 00:09:29', '2013-07-06 05:09:29');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (126, 7, 1, '2013-07-06 00:09:39', '2013-07-06 05:09:39', '2013-07-06 00:09:39', '2013-07-06 05:09:39');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (127, 7, 1, '2013-07-06 00:09:48', '2013-07-06 05:09:48', '2013-07-06 00:09:48', '2013-07-06 05:09:48');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (128, 7, 1, '2013-07-06 00:10:11', '2013-07-06 05:10:11', '2013-07-06 00:10:11', '2013-07-06 05:10:11');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (129, 7, 1, '2013-07-06 00:10:18', '2013-07-06 05:10:18', '2013-07-06 00:10:18', '2013-07-06 05:10:18');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (130, 7, 1, '2013-07-06 00:10:31', '2013-07-06 05:10:31', '2013-07-06 00:10:31', '2013-07-06 05:10:31');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (131, 7, 1, '2013-07-06 00:10:37', '2013-07-06 05:10:37', '2013-07-06 00:10:37', '2013-07-06 05:10:37');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (132, 7, 1, '2013-07-06 00:10:50', '2013-07-06 05:10:50', '2013-07-06 00:10:50', '2013-07-06 05:10:50');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (133, 7, 1, '2013-07-06 00:10:56', '2013-07-06 05:10:56', '2013-07-06 00:10:56', '2013-07-06 05:10:56');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (134, 7, 1, '2013-07-06 00:11:08', '2013-07-06 05:11:08', '2013-07-06 00:11:08', '2013-07-06 05:11:08');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (135, 7, 1, '2013-07-06 00:11:18', '2013-07-06 05:11:18', '2013-07-06 00:11:18', '2013-07-06 05:11:18');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (136, 7, 1, '2013-07-06 00:11:36', '2013-07-06 05:11:36', '2013-07-06 00:11:36', '2013-07-06 05:11:36');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (137, 7, 1, '2013-07-06 00:11:44', '2013-07-06 05:11:44', '2013-07-06 00:11:44', '2013-07-06 05:11:44');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (138, 7, 1, '2013-07-06 00:11:56', '2013-07-06 05:11:56', '2013-07-06 00:11:56', '2013-07-06 05:11:56');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (139, 7, 1, '2013-07-06 00:12:04', '2013-07-06 05:12:04', '2013-07-06 00:12:04', '2013-07-06 05:12:04');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (140, 7, 1, '2013-07-06 00:12:16', '2013-07-06 05:12:16', '2013-07-06 00:12:16', '2013-07-06 05:12:16');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (141, 7, 1, '2013-07-06 00:12:24', '2013-07-06 05:12:24', '2013-07-06 00:12:24', '2013-07-06 05:12:24');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (142, 7, 1, '2013-07-06 00:12:33', '2013-07-06 05:12:33', '2013-07-06 00:12:33', '2013-07-06 05:12:33');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (143, 7, 1, '2013-07-06 00:12:39', '2013-07-06 05:12:39', '2013-07-06 00:12:39', '2013-07-06 05:12:39');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (274, 11, 1, '2013-08-01 18:45:03', '2013-08-01 23:45:03', '2013-08-01 18:45:03', '2013-08-01 23:45:03');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (23, 'canofspam', 'enabled', 2.0);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (18, 'useragent_details', 'enabled', 1.2);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'debugdevkit', 'enabled', '1.2.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'markdown', 'enabled', 1.15);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'jit_image_manipulation', 'enabled', 1.18);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'xssfilter', 'enabled', '1.1.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'profiledevkit', 'enabled', 1.2);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'maintenance_mode', 'enabled', 1.6);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'datetime', 'enabled', 3.1);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'url_router', 'enabled', '2.0.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'selectbox_link_field', 'enabled', 1.26);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'export_ensemble', 'enabled', '2.0.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (13, 'timefield', 'enabled', '1.6.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'numberfield', 'enabled', '1.6.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (15, 'globalresourceloader', 'enabled', 1.1);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (17, 'documenter', 'enabled', '2.1.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (19, 'maplocationfield', 'enabled', '3.3.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (20, 'publish_tabs', 'enabled', '1.1.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (21, 'members', 'enabled', 1.2);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (22, 'apipage', 'enabled', '0.1.9');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (84, 23, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (74, 21, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (73, 21, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (72, 21, '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (89, 20, '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (92, 18, '/frontend/', 'FrontendParamsPostResolve', 'addParameters');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (91, 18, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (90, 18, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (88, 3, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (87, 3, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (93, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (100, 6, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (99, 6, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (103, 7, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (102, 7, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (108, 8, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (107, 8, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (106, 8, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (105, 8, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (104, 8, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (111, 9, '/system/preferences/', 'AddCustomPreferenceFieldsets', '__addPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (113, 10, '/frontend/', 'FrontendPrePageResolve', 'frontendPrePageResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (114, 12, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (116, 15, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'preferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (115, 15, '/frontend/', 'FrontendPageResolved', 'manipulatePageData');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (79, 17, '/backend/', 'InitaliseAdminPageHead', 'loadAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (78, 17, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (77, 17, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (71, 21, '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (70, 21, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (69, 21, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (68, 21, '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (67, 21, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (97, 22, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (96, 22, '/frontend/', 'FrontendPreRenderHeaders', 'setOutputTrigger');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (95, 22, '/frontend/', 'FrontendOutputPostGenerate', 'parseXML');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (83, 23, '/blueprints/events/new/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (82, 23, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (81, 23, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (75, 21, '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (76, 21, '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (80, 17, '/backend/', 'InitaliseAdminPageHead', 'appendDocs');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (85, 23, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (86, 23, '/frontend/', 'EventPostSaveFilter', 'eventPostSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (94, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (98, 22, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (101, 6, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (109, 8, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (110, 8, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (112, 9, '/system/preferences/', 'Save', '__savePreferences');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Time', 'time', 'datetime', 1, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Type', 'type', 'select', 1, 'yes', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Impact', 'impact', 'select', 1, 'yes', 12, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Intensity', 'intensity', 'select', 1, 'yes', 13, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (45, 'Body Parts', 'body-parts', 'selectbox_link', 1, 'no', 9, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (134, 'Date', 'date', 'datetime', 14, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'Type', 'type', 'select', 7, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Triggers', 'triggers', 'textarea', 1, 'no', 14, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Comment', 'comment', 'textarea', 1, 'no', 15, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Time', 'time', 'datetime', 2, 'yes', 0, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Meal', 'meal', 'select', 2, 'yes', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Proteins', 'proteins', 'taglist', 2, 'no', 5, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Spices and Flavorings', 'spices', 'taglist', 2, 'no', 6, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Ingredients', 'ingredients', 'taglist', 2, 'no', 7, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Sleep time', 'sleep-time', 'datetime', 3, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Wake feeling', 'wake-feeling', 'select', 3, 'no', 3, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Waking up', 'waking-up', 'number', 3, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (71, 'Spent awake', 'spent-awake', 'input', 3, 'no', 6, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (55, 'Name', 'name', 'input', 8, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Name', 'name', 'input', 4, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'Description', 'description', 'textarea', 4, 'no', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'Date', 'date', 'datetime', 5, 'yes', 0, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (119, 'Medication', 'medication', 'select', 5, 'no', 3, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'Dosage', 'dosage', 'input', 5, 'no', 4, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'Author', 'author', 'author', 1, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'Eaters', 'eaters', 'author', 2, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (30, 'Author', 'author', 'author', 3, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'Author', 'author', 'author', 5, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'Day', 'day', 'datetime', 6, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'Day Type', 'type', 'select', 6, 'yes', 3, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'Comment', 'description', 'textarea', 6, 'no', 6, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (35, 'Comment', 'comment', 'textarea', 5, 'no', 5, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'Tags', 'tags', 'taglist', 6, 'no', 7, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (44, 'Saltiness', 'salt', 'select', 2, 'yes', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (39, 'Part', 'part', 'input', 7, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'User', 'user', 'author', 4, 'yes', 5, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (41, 'Type', 'type', 'select', 2, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (42, 'Comment', 'comment', 'textarea', 2, 'no', 8, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (43, 'Author', 'author', 'author', 6, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (133, 'Ailment', 'ailment', 'selectbox_link', 5, 'no', 1, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (106, 'Prescription Time', 'time', 'datetime', 12, 'yes', 0, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'Work time', 'work-time', 'datetime', 6, 'no', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (49, 'Morning Wakefulness', 'morning-wakefulness', 'select', 6, 'no', 9, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (50, 'Morning Wellness', 'morning-wellness', 'select', 6, 'no', 13, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Afternoon Wakefulness', 'afternoon-wakefulness', 'select', 6, 'no', 15, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (52, 'Afternoon Wellness', 'afternoon-wellness', 'select', 6, 'no', 19, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (53, 'Evening Wakefulness', 'evening-wakefulness', 'select', 6, 'no', 21, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (54, 'Evening Wellness', 'evening-wellness', 'select', 6, 'no', 23, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Specialty', 'specialty', 'taglist', 8, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Location', 'location', 'maplocation', 8, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (58, 'Phone number', 'phone', 'input', 8, 'yes', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (63, 'Patient', 'patient', 'author', 8, 'yes', 7, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (124, 'Affiliation', 'affiliation', 'taglist', 8, 'no', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (123, 'Suite', 'suite', 'input', 8, 'no', 6, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (62, 'Comment', 'comment', 'textarea', 8, 'no', 8, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (64, 'Current', 'current', 'checkbox', 8, 'no', 9, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (65, 'Fax', 'fax', 'input', 8, 'no', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (66, 'Scheduled Time', 'time', 'datetime', 9, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (67, 'Doctor', 'doctor', 'selectbox_link', 9, 'yes', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (68, 'Comment', 'comment', 'textarea', 9, 'no', 5, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (69, 'Patient', 'patient', 'author', 9, 'yes', 6, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (122, 'Day Scheduled', 'day-scheduled', 'datetime', 9, 'no', 0, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (72, 'Sleep Feeling', 'sleep-feeling', 'select', 3, 'no', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (120, 'Rating', 'rating', 'select', 9, 'no', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (75, 'Basic', 'basic', 'publish_tabs', 10, 'no', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (86, 'Name', 'name', 'selectbox_link', 10, 'yes', 1, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (132, 'User', 'user', 'memberusername', 10, 'yes', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (77, 'Permissions', 'permissions', 'publish_tabs', 10, 'no', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (78, 'Ailment Diary', 'ailment-diary', 'select', 10, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (79, 'Medication Diary', 'medication-diary', 'select', 10, 'no', 6, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (80, 'Food Diary', 'food-diary', 'select', 10, 'no', 7, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (81, 'Sleep Diary', 'sleep-diary', 'select', 10, 'no', 8, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (82, 'Wellness Diary', 'wellness-diary', 'select', 10, 'no', 9, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (83, 'Doctor Visits', 'doctor-visits', 'select', 10, 'no', 10, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (84, 'Comment', 'comment', 'textarea', 3, 'no', 7, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (85, 'Comment', 'comment', 'textarea', 4, 'no', 6, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (87, 'Name', 'name', 'input', 11, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (88, 'Description', 'description', 'textarea', 11, 'no', 1, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (89, 'Headache Type', 'headache-type', 'select', 1, 'no', 6, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (90, 'Illness', 'Illness', 'taglist', 1, 'no', 8, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (101, 'Evening Stress', 'evening-stress', 'select', 6, 'no', 24, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (92, 'Morning Mental State', 'morning-mental-state', 'select', 6, 'no', 10, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (100, 'Afternoon Stress', 'afternoon-stress', 'select', 6, 'no', 18, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (94, 'Afternoon Mental State', 'afternoon-mental-state', 'select', 6, 'no', 17, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (99, 'Morning Stress', 'morning-stress', 'select', 6, 'no', 11, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (96, 'Evening Mental State', 'evening-mental-state', 'select', 6, 'no', 25, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (97, 'Alarm', 'alarm', 'time', 3, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (98, 'Neuro', 'neuro', 'select', 1, 'no', 7, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (102, 'Morning Body State', 'morning-body-state', 'select', 6, 'no', 12, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (103, 'Afternoon Body State', 'afternoon-body-state', 'select', 6, 'no', 16, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (104, 'Evening Body State', 'evening-body-state', 'select', 6, 'no', 22, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (105, 'Prescription?', 'prescription', 'checkbox', 4, 'no', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (118, 'Medication', 'medication', 'select', 12, 'yes', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (110, 'Dose Instructions', 'dose-instructions', 'textarea', 12, 'no', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (109, 'Single Dose', 'single-dose', 'input', 12, 'yes', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (111, 'Doctor', 'doctor', 'selectbox_link', 12, 'yes', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (112, 'Manufacturer', 'manufacturer', 'input', 12, 'no', 7, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (113, 'Recall', 'recall', 'checkbox', 12, 'no', 8, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (114, 'AIlment', 'ailment', 'taglist', 1, 'no', 10, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (115, 'Patient', 'patient', 'author', 12, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (116, 'Notes', 'notes', 'textarea', 12, 'no', 9, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (117, 'Pharmacy', 'pharmacy', 'input', 12, 'no', 6, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (121, 'Visit Time', 'visit-time', 'datetime', 9, 'no', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (126, 'Sick Day', 'sick-day', 'select', 6, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (127, 'User', 'user', 'author', 13, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (128, 'Photo', 'photo', 'upload', 13, 'no', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (129, 'Phone number', 'phone-number', 'input', 13, 'no', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (130, 'Email', 'email', 'input', 13, 'no', 4, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (131, 'Auth Token', 'token', 'input', 13, 'yes', 6, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (135, 'Author', 'author', 'author', 14, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (136, 'Metadata', 'metadata', 'publish_tabs', 6, 'no', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (137, 'Morning', 'morning', 'publish_tabs', 6, 'no', 8, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (138, 'Afternoon', 'afternoon', 'publish_tabs', 6, 'no', 14, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (139, 'Evening', 'evening', 'publish_tabs', 6, 'no', 20, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (140, 'Metadata', 'metadata-tab', 'publish_tabs', 13, 'no', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (141, 'Chronic Illness Diary', 'chronic-tab', 'publish_tabs', 13, 'no', 8, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (142, 'Illnesses', 'illnesses', 'input', 13, 'no', 9, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (143, 'Description', 'description', 'textarea', 13, 'no', 10, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (144, 'Do you wish to use the chronic diary?', 'chronic-diary', 'checkbox', 13, 'no', 11, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (145, 'What metrics do you wish to track?', 'metrics', 'select', 13, 'no', 12, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (146, 'Do you wish to track body parts?', 'body-tracker', 'checkbox', 13, 'no', 13, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (147, 'Metadata', 'metadata-tab', 'publish_tabs', 14, 'no', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (148, 'Morning Tab', 'morning-tab', 'publish_tabs', 14, 'no', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (149, 'Morning Concentration', 'morning-concentration', 'number', 14, 'no', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (150, 'Morning Strength', 'morning-strength', 'number', 14, 'no', 5, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (151, 'Morning  Motor Control', 'morning-motor-control', 'number', 14, 'no', 6, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (152, 'Morning  Tremors', 'morning-tremors', 'number', 14, 'no', 7, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (153, 'Morning Pain', 'morning-pain', 'number', 14, 'no', 8, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (154, 'Morning Breath', 'morning-breath', 'number', 14, 'no', 9, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (155, 'Morning Temperature', 'morning-temperature', 'number', 14, 'no', 10, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (156, 'Morning  Aches', 'morning-aches', 'number', 14, 'no', 11, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (157, 'Morning Head and Neck', 'morning-head', 'number', 14, 'no', 13, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (158, 'Morning Chest', 'morning-chest', 'number', 14, 'no', 14, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (159, 'Morning Upper Right', 'morning-upper-right', 'number', 14, 'no', 15, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (160, 'Morning Upper Left', 'morning-upper-left', 'number', 14, 'no', 16, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (161, 'Morning Lower Right', 'morning-lower-right', 'number', 14, 'no', 17, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (162, 'Morning Lower Left', 'morning-lower-left', 'number', 14, 'no', 18, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (163, 'Afternoon', 'afternoon-tab', 'publish_tabs', 14, 'no', 19, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (164, 'Afternoon Concentration', 'afternoon-concentration', 'number', 14, 'no', 20, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (165, 'Afternoon Strength', 'afternoon-strength', 'number', 14, 'no', 21, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (166, 'Afternoon Motor Control', 'afternoon-motor-control', 'number', 14, 'no', 22, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (167, 'Afternoon Tremors', 'afternoon-tremors', 'number', 14, 'no', 23, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (168, 'Afternoon Pain', 'afternoon-pain', 'number', 14, 'no', 24, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (169, 'Afternoon Breath', 'afternoon-breath', 'number', 14, 'no', 25, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (170, 'Afternoon Temperature', 'afternoon-temperature', 'number', 14, 'no', 26, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (171, 'Afternoon Aches', 'afternoon-aches', 'number', 14, 'no', 27, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (172, 'Afternoon Head and Neck', 'afternoon-head', 'number', 14, 'no', 29, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (173, 'Afternoon Chest', 'afternoon-chest', 'number', 14, 'no', 30, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (174, 'Afternoon Upper Right', 'afternoon-upper-right', 'number', 14, 'no', 31, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (175, 'Afternoon Upper Left', 'afternoon-upper-left', 'number', 14, 'no', 32, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (176, 'Afternoon Lower Left', 'afternoon-lower-left', 'number', 14, 'no', 33, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (177, 'Afternoon Lower RIght', 'afternoon-lower-right', 'number', 14, 'no', 34, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (178, 'Evening', 'evening-tab', 'publish_tabs', 14, 'no', 35, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (179, 'Evening Concentration', 'evening-concentration', 'number', 14, 'no', 36, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (180, 'Evening Strength', 'evening-strength', 'number', 14, 'no', 37, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (181, 'Evening Motor Control', 'evening-motor-control', 'number', 14, 'no', 38, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (182, 'Evening Tremors', 'evening-tremors', 'number', 14, 'no', 39, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (183, 'Evening Pain', 'evening-pain', 'number', 14, 'no', 40, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (184, 'Evening Breath', 'evening-breath', 'number', 14, 'no', 41, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (185, 'Evening Temperature', 'evening-temperature', 'number', 14, 'no', 42, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (186, 'Evening Aches', 'evening-aches', 'number', 14, 'no', 43, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (187, 'Evening Head and Neck', 'evening-head', 'number', 14, 'no', 45, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (188, 'Evening Chest', 'evening-chest', 'number', 14, 'no', 46, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (189, 'Evening Upper Right', 'evening-upper-right', 'number', 14, 'no', 47, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (190, 'Evening Upper Left', 'evening-upper-left', 'number', 14, 'no', 48, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (191, 'Evening Lower Right', 'evening-lower-right', 'number', 14, 'no', 49, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (192, 'Evening Lower Left', 'evening-lower-left', 'number', 14, 'no', 50, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (193, 'Wake', 'wake-tab', 'publish_tabs', 14, 'no', 51, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (194, 'Wake Concentration', 'wake-concentration', 'number', 14, 'no', 52, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (195, 'Wake Strength', 'wake-strength', 'number', 14, 'no', 53, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (196, 'Wake Motor Control', 'wake-motor-control', 'number', 14, 'no', 54, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (197, 'Wake Tremors', 'wake-tremors', 'number', 14, 'no', 55, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (198, 'Wake Pain', 'wake-pain', 'number', 14, 'no', 56, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (199, 'Wake Breath', 'wake-breath', 'number', 14, 'no', 57, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (200, 'Wake Temperature', 'wake-temperature', 'number', 14, 'no', 58, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (201, 'Wake Aches', 'wake-aches', 'number', 14, 'no', 59, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (202, 'Wake Head and Neck', 'wake-head', 'number', 14, 'no', 61, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (203, 'Wake Chest', 'wake-chest', 'number', 14, 'no', 62, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (204, 'Wake Upper Right', 'wake-upper-right', 'number', 14, 'no', 63, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (205, 'Wake Upper Left', 'wake-upper-left', 'number', 14, 'no', 64, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (206, 'Wake Lower Right', 'wake-lower-right', 'number', 14, 'no', 65, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (207, 'Wake Lower Left', 'wake-lower-left', 'number', 14, 'no', 66, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (208, 'Sleep', 'sleep-tab', 'publish_tabs', 14, 'no', 67, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (209, 'Sleep Concentration', 'sleep-concentration', 'number', 14, 'no', 68, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (210, 'Sleep Strength', 'sleep-strength', 'number', 14, 'no', 69, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (211, 'Sleep Motor Control', 'sleep-motor-control', 'number', 14, 'no', 70, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (212, 'Sleep Tremors', 'sleep-tremors', 'number', 14, 'no', 71, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (213, 'Sleep Pain', 'sleep-pain', 'number', 14, 'no', 72, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (214, 'Sleep Breath', 'sleep-breath', 'number', 14, 'no', 73, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (215, 'Sleep Temperature', 'sleep-temperature', 'number', 14, 'no', 74, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (216, 'Sleep Aches', 'sleep-aches', 'number', 14, 'no', 75, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (217, 'Sleep Head and Neck', 'sleep-head', 'number', 14, 'no', 77, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (218, 'Sleep Chest', 'sleep-chest', 'number', 14, 'no', 78, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (219, 'Sleep Upper Right', 'sleep-upper-right', 'number', 14, 'no', 79, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (220, 'Sleep Upper Left', 'sleep-upper-left', 'number', 14, 'no', 80, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (221, 'Sleep Lower Right', 'sleep-lower-right', 'number', 14, 'no', 81, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (222, 'Sleep Lower Left', 'sleep-lower-left', 'number', 14, 'no', 82, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (223, 'Dates', 'dates', 'datetime', 15, 'yes', 0, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (224, 'Author', 'author', 'author', 15, 'yes', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (225, 'Comment', 'comment', 'textarea', 15, 'no', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (226, 'Metadata', 'metadata-tab', 'publish_tabs', 1, 'no', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (227, 'Data Tab', 'data-tab', 'publish_tabs', 1, 'no', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (228, 'Impact', 'impact-tab', 'publish_tabs', 1, 'no', 11, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (229, 'Type', 'type', 'number', 15, 'no', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (230, 'Associated Period', 'period', 'selectbox_link', 1, 'no', 4, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (231, 'Do you wish to use the period diary?', 'period-diary', 'checkbox', 13, 'no', 7, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (232, 'Emergency Info', 'emergency-tab', 'publish_tabs', 13, 'no', 14, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (233, 'Blood Type', 'blood-type', 'input', 13, 'no', 16, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (234, 'Contacts', 'contacts', 'textarea', 13, 'no', 17, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (235, 'Allergies', 'allergies', 'taglist', 13, 'no', 18, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (236, 'Medicine Allergies', 'medicine-allergy', 'taglist', 13, 'no', 19, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (237, 'Address', 'address', 'textarea', 13, 'no', 20, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (238, 'Show ICE?', 'show-ice', 'checkbox', 13, 'no', 15, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (245, 'Color Blindness', 'colorblind-mode', 'select', 13, 'yes', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (240, 'Morning Allergies', 'morning-allergies', 'number', 14, 'no', 12, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (241, 'Afternoon Allergies', 'afternoon-allergies', 'number', 14, 'no', 28, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (242, 'Evening Allergies', 'evening-allergies', 'number', 14, 'no', 44, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (243, 'Wake Allergies', 'wake-allergies', 'number', 14, 'no', 60, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (244, 'Sleep Allergies', 'sleep-allergies', 'number', 14, 'no', 76, 'main', 'yes');

-- *** DATA:`tbl_members_roles` ***
INSERT INTO`tbl_members_roles` (`id`, `name`, `handle`) VALUES (1, 'Public', 'public');
INSERT INTO`tbl_members_roles` (`id`, `name`, `handle`) VALUES (2, 'Doctor', 'doctor');

-- *** DATA:`tbl_members_roles_event_permissions` ***
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (74, 2, 'rest_api_entries', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (73, 2, 'prescriptions', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (72, 2, 'prescriptions', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (71, 2, 'medicine', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (70, 2, 'medicine', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (69, 2, 'medication', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (68, 2, 'medication', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (67, 2, 'medical_visit', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (66, 2, 'medical_visit', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (65, 2, 'login', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (64, 2, 'login', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (63, 2, 'food', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (62, 2, 'food', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (61, 2, 'doctors', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (60, 2, 'doctors', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (59, 2, 'ailment', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (58, 2, 'ailment', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (57, 2, 'activity', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (56, 2, 'activity', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (117, 1, 'neuro', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (116, 1, 'neuro', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (115, 1, 'medicine', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (114, 1, 'medicine', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (113, 1, 'medication', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (112, 1, 'medication', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (111, 1, 'medical_visit', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (110, 1, 'medical_visit', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (109, 1, 'login', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (108, 1, 'login', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (107, 1, 'food', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (106, 1, 'food', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (105, 1, 'doctors', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (104, 1, 'doctors', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (103, 1, 'ailment', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (102, 1, 'ailment', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (75, 2, 'rest_api_entries', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (76, 2, 'sleep', 'create', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (77, 2, 'sleep', 'edit', 0);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (118, 1, 'prescriptions', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (101, 1, 'activity', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (100, 1, 'activity', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (119, 1, 'prescriptions', 'edit', 2);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (120, 1, 'sleep', 'create', 1);
INSERT INTO`tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (121, 1, 'sleep', 'edit', 2);

-- *** DATA:`tbl_members_roles_forbidden_pages` ***
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (61, 2, 12);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (62, 2, 13);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (63, 2, 2);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (64, 2, 3);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (65, 2, 4);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (66, 2, 5);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (67, 2, 6);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (68, 2, 7);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (69, 2, 21);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (70, 2, 19);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (71, 2, 24);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (72, 2, 40);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (73, 2, 8);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (74, 2, 10);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (75, 2, 14);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (76, 2, 9);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (77, 2, 11);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (78, 2, 16);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (79, 2, 17);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (80, 2, 18);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (81, 2, 20);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (82, 2, 23);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (83, 2, 22);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (84, 2, 33);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (85, 2, 38);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (86, 2, 34);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (87, 2, 37);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (88, 2, 35);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (89, 2, 36);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (90, 2, 39);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (91, 2, 25);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (92, 2, 26);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (93, 2, 27);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (94, 2, 28);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (95, 2, 29);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (96, 2, 30);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (97, 2, 31);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (98, 2, 32);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (99, 2, 41);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (100, 2, 44);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (101, 2, 54);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (102, 2, 55);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (103, 2, 56);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (104, 2, 57);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (105, 2, 58);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (106, 2, 59);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (107, 2, 60);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (108, 2, 61);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (109, 2, 62);
INSERT INTO`tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (110, 2, 63);

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, 'home_current_prescriptions,home_open_period,home_scheduled_appointments,now_activity,now_appointments,now_expiring_prescriptions,now_open_ailments,now_wake_time,yesterday_activity', NULL, 1);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Create', 'create', NULL, NULL, NULL, NULL, 4);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, 2, 'Ailment Entry', 'ailment', 'create', NULL, 'body_parts', 'ailment,canofspam', 5);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, 2, 'Day Entry', 'day', 'create', NULL, NULL, 'activity,canofspam', 6);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, 2, 'Sleep Entry', 'sleep', 'create', NULL, NULL, 'canofspam,sleep', 7);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, 2, 'Medication Entry', 'medication', 'create', NULL, 'medications,open_ailments', 'canofspam,medication', 8);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, 2, 'Food Entry', 'food', 'create', NULL, 'users', 'canofspam,food', 9);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Update', 'update', NULL, NULL, NULL, NULL, 16);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, 8, 'Ailment TTR', 'ailment-ttr', 'update', 'id', 'update_ailment_diary', 'ailment,canofspam', 19);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 8, 'Waking', 'wake', 'update', 'id', 'update_sleep_diary', 'canofspam,sleep', 17);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (11, 8, 'Day', 'day', 'update', 'id', 'update_activity', 'activity,canofspam', 20);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (13, NULL, 'Medications', 'medication', NULL, NULL, NULL, NULL, 2);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (14, 8, 'Ailment', 'ailment', 'update', 'id', 'open_ailments', 'ailment,canofspam', 18);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (16, 11, 'Morning', 'morning', 'update/day', 'date', 'update_today_activity', 'activity,canofspam', 21);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (17, 11, 'Afternoon', 'afternoon', 'update/day', 'date', 'update_today_activity', 'activity,canofspam', 22);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (18, 11, 'Evening', 'evening', 'update/day', 'date', 'update_today_activity', 'activity,canofspam', 23);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (19, 2, 'Medical Visit', 'visit', 'create', NULL, 'current_doctors', 'canofspam,medical_visit', 10);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (20, 8, 'Open Visits', 'visits', 'update', 'id', 'open_visits', 'canofspam', 24);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (21, 2, 'Prescription', 'prescription', 'create', NULL, 'current_doctors,medications,prescription_medication', 'canofspam,prescriptions', 11);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (24, 2, 'New Doctor', 'doctor', 'create', NULL, NULL, 'canofspam,doctors', 12);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (22, 8, 'Visit End', 'visit-end', 'update', 'id', 'current_visit', 'canofspam,medical_visit', 26);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (23, 8, 'Visit Start', 'visit-start', 'update', 'id', 'current_visit', 'canofspam,medical_visit', 25);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (25, NULL, 'api', 'api', NULL, NULL, NULL, NULL, 41);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (26, 25, 'Ailments', 'ailments', 'api', 'start/end', 'api_ailments', NULL, 42);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (27, 25, 'Medication Taken', 'meds-taken', 'api', 'start/end', 'api_medications', NULL, 43);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (28, 25, 'Activities', 'activities', 'api', 'start/end', 'api_activities', NULL, 44);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (29, 25, 'Sleep', 'sleep', 'api', 'start/end', 'api_sleep', NULL, 45);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (30, 25, 'Food', 'food', 'api', 'start/end', 'api_foods', NULL, 46);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (31, 25, 'Prescriptions', 'prescriptions', 'api', 'start/end', 'api_prescriptions', NULL, 47);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (32, 25, 'Visits', 'visits', 'api', 'start/end', 'api_med_visits', NULL, 48);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (33, NULL, 'View', 'view', NULL, NULL, NULL, NULL, 33);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (34, 33, 'Visits', 'visits', 'view', 'id', 'current_visit,med_visits', NULL, 35);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (35, 33, 'Prescriptions', 'prescriptions', 'view', 'id', NULL, NULL, 37);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (36, 35, 'Expiring Prescriptions', 'expiring', 'view/prescriptions', NULL, 'view_prescriptions_expiring', NULL, 38);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (37, 34, 'Upcoming Appointments', 'upcoming', 'view/visits', NULL, NULL, NULL, 36);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (38, 33, 'Ailments', 'ailments', 'view', 'id', 'view_ailments_current,view_ailments_recent', NULL, 34);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (39, 33, 'Doctors', 'doctors', 'view', 'id', 'view_your_current_doctor_current_doctor,view_your_current_doctors', NULL, 39);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (40, 2, 'Medicine', 'medicine', 'create', NULL, 'users', 'canofspam,medicine', 13);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (41, 25, 'This Week', 'this-week', 'api', NULL, 'home_this_week_activity,home_this_week_ailment,home_this_week_period,home_this_week_sleep', NULL, 49);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (43, NULL, 'User', 'user', NULL, NULL, NULL, NULL, 3);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (54, NULL, 'Export', 'export', NULL, NULL, NULL, NULL, 62);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (44, NULL, 'back', 'back', NULL, NULL, NULL, NULL, 51);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (45, 44, 'Current User', 'current-user', 'back', 'username', NULL, NULL, 52);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (46, 44, 'Current User: Day', 'day', 'back', 'username/date', NULL, NULL, 53);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (47, 44, 'Current User: Ailments', 'ailments', 'back', 'username', 'api_ailments', NULL, 54);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (48, 44, 'Current User: Activities', 'activities', 'back', 'username', 'api_activities', NULL, 55);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (49, 44, 'Current User: Foods', 'foods', 'back', 'username', 'api_foods', NULL, 56);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (50, 44, 'Current User: Sleep', 'sleep', 'back', 'username', 'api_sleep', NULL, 57);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (51, 44, 'Current User: Medication', 'medication', 'back', 'username', 'api_medications', NULL, 58);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (52, 44, 'Current User: Prescriptions', 'prescriptions', 'back', 'username', 'api_prescriptions', NULL, 59);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (53, 44, 'Current User: Doctors', 'doctors', 'back', 'username', NULL, NULL, 60);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (55, 44, 'export pages', 'export', 'back', NULL, NULL, NULL, 64);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (56, 55, 'Ailments', 'ailments', 'back/export', 'username', 'export_ailments', NULL, 65);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (57, 55, 'Activities', 'activities', 'back/export', 'username', 'export_activities', NULL, 66);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (58, 55, 'foods', 'foods', 'back/export', 'username', 'export_food', NULL, 67);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (59, 55, 'sleep', 'sleep', 'back/export', 'username', 'export_sleep_diary', NULL, 68);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (60, 55, 'Medication Diary', 'doses', 'back/export', 'username', 'export_medication_diary', NULL, 69);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (61, 55, 'prescriptions', 'prescriptions', 'back/export', 'username', 'export_prescriptions', NULL, 70);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (62, 55, 'appointments', 'appointments', 'back/export', 'username', 'export_appointments', NULL, 71);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (63, 55, 'doctors', 'doctors', 'back/export', 'username', 'export_doctors', NULL, 72);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (64, 55, 'chronic', 'chronic', 'back/export', 'username', 'export_chronic_diary', NULL, 73);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (65, 44, 'Current User: Chronic', 'chronic', 'back', 'username', NULL, NULL, 61);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (66, 55, 'Period Diary', 'period', 'back/export', 'username', 'export_periods', NULL, 74);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (67, 44, 'Period Diary', 'period', 'back', 'username', NULL, NULL, 63);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (68, 2, 'Chronic Entry', 'chronic', 'create', NULL, 'current_user_chronic_entry_types', 'canofspam,chronic', 14);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (69, 8, 'Chronic', 'chronic', 'update', 'date', 'current_user_chronic_entry_types', 'canofspam,chronic', 27);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (70, 69, 'Morning', 'morning', 'update/chronic', 'date', 'current_user_chronic_entry_types,update_today_chronic_diary', 'canofspam,chronic', 28);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (71, 69, 'Afternoon', 'afternoon', 'update/chronic', 'date', 'current_user_chronic_entry_types,update_today_chronic_diary', 'canofspam,chronic', 29);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (72, 69, 'Evening', 'evening', 'update/chronic', 'date', 'current_user_chronic_entry_types,update_today_chronic_diary', 'canofspam,chronic', 30);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (73, 69, 'Sleep', 'sleep', 'update/chronic', 'date', 'current_user_chronic_entry_types,update_today_chronic_diary', 'canofspam,chronic', 31);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (74, 2, 'Period Diary', 'period', 'create', NULL, NULL, 'canofspam,period', 15);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (75, 8, 'Period', 'period', 'update', NULL, 'update_period_diary', 'canofspam,period', 32);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (76, 33, 'In Case of Emergency', 'emergency', 'view', NULL, 'ice_doctors,ice_user_data,medications', NULL, 40);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (77, 55, 'Medications', 'medications', 'back/export', 'username', 'export_medications', NULL, 75);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (78, 55, 'Doctor Accounts', 'doctor-accounts', 'back/export', 'username', 'export_doctor_accounts', NULL, 76);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (79, 55, 'Headache types', 'headaches', 'back/export', NULL, 'export_headache_types', NULL, 77);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (80, 25, 'Focus Day', 'focus-day', 'api', 'date', 'api_focus_day_activity,api_focus_day_ailment,api_focus_day_period,api_focus_day_sleep', NULL, 50);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (81, 25, 'Just day', 'just-day', 'api', 'date', 'current_day_activities,current_day_ailment,current_day_appointments,current_day_chronic,current_day_foods,current_day_medication_diary,current_day_period_diary,current_day_prescriptions,current_day_sleep_diary', NULL, 78);

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (98, 1, 'index');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (3, 8, 'admin');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (4, 2, 'admin');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (25, 26, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (27, 27, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (130, 28, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (31, 29, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (33, 30, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (35, 31, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (37, 32, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (26, 26, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (28, 27, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (129, 28, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (32, 29, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (34, 30, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (36, 31, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (38, 32, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (144, 41, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (47, 44, 'admin');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (101, 56, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (132, 57, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (105, 58, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (107, 59, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (112, 60, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (115, 61, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (117, 62, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (119, 63, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (102, 56, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (106, 58, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (108, 59, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (116, 61, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (118, 62, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (120, 63, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (143, 41, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (131, 57, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (111, 60, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (126, 77, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (121, 78, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (122, 78, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (125, 77, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (127, 79, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (128, 79, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (133, 64, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (134, 64, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (135, 66, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (136, 66, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (137, 67, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (138, 67, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (147, 80, 'API');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (148, 80, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (149, 81, 'XML');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (150, 81, 'API');

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (1, 'Ailment Diary', 'ailment-diary', 4, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (2, 'Food Diary', 'food-diary', 2, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (3, 'Sleep Diary', 'sleep-diary', 3, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (4, 'Medications', 'medications', 9, 'no', 'Medication');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (5, 'Medication Dairy', 'medication-dairy', 5, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (6, 'Activity Diary', 'activity-diary', 1, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (7, 'Body Parts', 'body-parts', 13, 'no', 'Meta');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (8, 'Doctors and Medical Facilities', 'doctors-and-medical-facilities', 11, 'no', 'Doctors');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (9, 'Medical Visits', 'medical-visits', 10, 'no', 'Doctors');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (10, 'Doctor Accounts', 'doctor-accounts', 12, 'no', 'Doctors');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (11, 'Headache Types', 'headache-types', 14, 'no', 'Meta');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (12, 'Prescriptions', 'prescriptions', 8, 'no', 'Medication');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (13, 'Users', 'users', 15, 'no', 'Meta');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (14, 'Chronic Diary', 'chronic-diary', 7, 'no', 'Diary');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (15, 'Period Diary', 'period-diary', 6, 'no', 'Diary');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (110, 12, 118, 5, 119, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (109, 1, 3, 5, 133, 'no');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (104, 7, 39, 1, 45, 'no');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (102, 15, 229, 1, 230, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (96, 8, 55, 9, 67, 'no');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (89, 8, 55, 10, 86, 'no');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (103, 11, 87, 1, 89, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (77, 4, 22, 12, 118, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (78, 8, 55, 12, 111, 'no');

-- *** DATA:`tbl_url_router` ***
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (436, 'user/:username/ailments', 'back/ailments/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (437, 'user/:username/food', 'back/food/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (438, 'user/:username/activities', 'back/activities/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (439, 'user/:username/sleep', 'back/sleep/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (440, 'user/:username/medication', 'back/medication/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (441, 'user/:username/prescriptions', 'back/prescriptions/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (442, 'user/:username/doctors', 'back/doctors/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (443, 'user/:username/chronic', 'back/chronic/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (444, 'user/:username/period', 'back/period/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (445, 'user/:username/:day', 'back/day/:username/:day', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (446, 'user/:username', 'back/current-user/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (447, 'export/:username/ailments', 'back/export/ailments/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (448, 'export/:username/appointments', 'back/export/appointments/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (449, 'export/:username/activities', 'back/export/activities/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (450, 'export/:username/foods', 'back/export/foods/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (451, 'export/:username/sleep', 'back/export/sleep/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (452, 'export/:username/medication-diary', 'back/export/doses/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (453, 'export/:username/prescriptions', 'back/export/prescriptions/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (454, 'export/:username/appointments', 'back/export/appointments/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (455, 'export/:username/doctors', 'back/export/doctors/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (456, 'export/:username/chronic-diary', 'back/export/chronic/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (457, 'export/:username/period-diary', 'back/export/period/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (458, 'export/:username/medications', 'back/export/medications/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (459, 'export/:username/doctor-accounts', 'back/export/doctor-accounts/:username', 'route', 'no');
INSERT INTO`tbl_url_router` (`id`, `from`, `to`, `type`, `http301`) VALUES (460, 'export/:username/headache-types', 'back/export/headaches', 'route', 'no');
