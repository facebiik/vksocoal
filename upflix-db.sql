
{%begin%}
  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
{%end%}

{%begin%}
  SET time_zone = "+00:00";
{%end%}

{%begin%}
  CREATE TABLE `ufx_configs` (
    `id` int(11) NOT NULL,
    `title` varchar(120) NOT NULL DEFAULT '',
    `name` varchar(120) NOT NULL DEFAULT '',
    `value` varchar(3000) NOT NULL DEFAULT '',
    `regex` varchar(120) NOT NULL DEFAULT ''
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES
  (1, 'Theme', 'theme', 'default', ''),
  (2, 'Description', 'description', 'Upflix - The Ultimate Modern Video Sharing Platform', '/^(.){0,350}$/'),
  (3, 'SEO Keywords', 'keywords', 'video script, video platform, youtube, video sharing script', '/^(.){0,550}$/'),
  (4, 'Site name', 'name', 'Upflix', '/^(.){0,50}$/'),
  (5, 'Site title', 'title', 'Upflix script', '/^(.){0,150}$/'),
  (6, 'E-mail address', 'email', '', ''),
  (7, 'Google analytics', 'google_analytics', '', ''),
  (8, 'SMTP server', 'smtp_or_mail', 'smtp', '/^(smtp|mail)$/'),
  (9, 'SMTP host', 'smtp_host', '', ''),
  (10, 'SMTP password', 'smtp_password', '', '/^(.){0,50}$/'),
  (11, 'SMTP encryption', 'smtp_encryption', 'ssl', '/^(ssl|tls)$/'),
  (12, 'SMTP port', 'smtp_port', '587', '/^[0-9]{1,11}$/'),
  (13, 'SMTP username', 'smtp_username', '', ''),
  (14, 'Video auto approve', 'video_auto_approve', 'Y', '/^(Y|N)$/'),
  (15, 'Default language', 'language', 'russian', ''),
  (16, 'FFMPEG binary file path', 'ffmpeg_binary', 'core/libs/ffmpeg/ffmpeg', ''),
  (17, 'Default video thumbnail', 'default_video_thumb', 'themes/default/statics/img/video-thumb-1280x720.png', ''),
  (18, 'Facebook API ID', 'facebook_api_id', '', '/^(.){0,150}$/'),
  (19, 'Facebook API Key', 'facebook_api_key', '', '/^(.){0,150}$/'),
  (20, 'Twitter API ID', 'twitter_api_id', '', '/^(.){0,150}$/'),
  (21, 'Twitter API Key', 'twitter_api_key', '', '/^(.){0,150}$/'),
  (22, 'Google API ID', 'google_api_id', '', '/^(.){0,150}$/'),
  (23, 'Google API Key', 'google_api_key', '', '/^(.){0,150}$/'),
  (24, 'Last backup', 'last_backup', '1598091141', ''),
  (25, 'Script version', 'version', '1.0.3', ''),
  (26, 'Sitemap last update', 'sitemap_update', '0', ''),
  (27, 'Youtube-Data API Key', 'youtube_api_key', '', '');
{%end%}

{%begin%}
  CREATE TABLE `ufx_history` (
    `id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL DEFAULT '0',
    `video_id` int(11) NOT NULL DEFAULT '0',
    `time` varchar(25) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_likes` (
    `id` int(11) NOT NULL,
    `video_id` int(11) NOT NULL DEFAULT '0',
    `user_id` int(11) NOT NULL DEFAULT '0',
    `type` enum('like','dislike','none') NOT NULL DEFAULT 'none',
    `user_status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
    `time` varchar(20) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_notifications` (
    `id` int(11) NOT NULL,
    `notifier_id` int(11) NOT NULL DEFAULT '0',
    `recipient_id` int(11) NOT NULL DEFAULT '0',
    `status` enum('1','0') NOT NULL DEFAULT '0',
    `subject` varchar(32) NOT NULL DEFAULT 'none',
    `entry_id` int(11) NOT NULL DEFAULT '0',
    `varchar` varchar(1200) NOT NULL DEFAULT '[]',
    `time` varchar(25) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_playlists` (
    `id` int(11) NOT NULL,
    `hash_id` varchar(35) NOT NULL DEFAULT '',
    `user_id` int(11) NOT NULL DEFAULT '0',
    `title` varchar(120) NOT NULL DEFAULT '',
    `videos` int(11) NOT NULL DEFAULT '0',
    `privacy` enum('1','2') NOT NULL DEFAULT '1',
    `type` enum('system','user') NOT NULL DEFAULT 'user',
    `time` varchar(25) NOT NULL DEFAULT ''
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_playlist_videos` (
    `id` int(11) NOT NULL,
    `list_id` int(11) NOT NULL DEFAULT '0',
    `video_id` int(11) NOT NULL DEFAULT '0',
    `time` varchar(25) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_sessions` (
    `id` int(11) NOT NULL,
    `session_id` varchar(120) NOT NULL DEFAULT '',
    `user_id` int(11) NOT NULL DEFAULT '0',
    `platform` varchar(15) NOT NULL DEFAULT '',
    `time` varchar(20) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_subscriptions` (
    `id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL DEFAULT '0',
    `subscriber_id` int(11) NOT NULL DEFAULT '0',
    `time` varchar(25) NOT NULL DEFAULT ''
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_users` (
    `id` int(11) NOT NULL,
    `username` varchar(30) NOT NULL DEFAULT '',
    `fname` varchar(30) NOT NULL DEFAULT '',
    `lname` varchar(30) NOT NULL DEFAULT '',
    `about` varchar(600) NOT NULL DEFAULT '',
    `gender` enum('F','M') NOT NULL DEFAULT 'M',
    `email` varchar(60) NOT NULL DEFAULT '',
    `em_code` varchar(100) NOT NULL DEFAULT '',
    `password` varchar(150) NOT NULL DEFAULT '',
    `joined` varchar(20) NOT NULL DEFAULT '',
    `last_active` varchar(20) NOT NULL DEFAULT '0',
    `ip_address` varchar(150) NOT NULL DEFAULT '',
    `avatar` varchar(300) NOT NULL DEFAULT 'themes/default/statics/img/avatar.png',
    `cover` varchar(300) NOT NULL DEFAULT 'themes/default/statics/img/cover.jpg',
    `cover_orig` varchar(300) NOT NULL DEFAULT 'themes/default/statics/img/cover.jpg',
    `active` enum('0','1','2') NOT NULL DEFAULT '0',
    `verified` enum('0','1','2') NOT NULL DEFAULT '0',
    `admin` enum('0','1') NOT NULL DEFAULT '0',
    `videos` int(11) NOT NULL DEFAULT '0',
    `subscribers` int(11) NOT NULL DEFAULT '0',
    `website` varchar(120) NOT NULL DEFAULT '',
    `facebook` varchar(120) NOT NULL DEFAULT '',
    `twitter` varchar(120) NOT NULL DEFAULT '',
    `instagram` varchar(120) NOT NULL DEFAULT '',
    `youtube` varchar(120) NOT NULL DEFAULT '',
    `country_id` int(3) NOT NULL DEFAULT '1',
    `last_video` int(11) NOT NULL DEFAULT '0',
    `last_import` int(11) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_videos` (
    `id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL DEFAULT '0',
    `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
    `description` text CHARACTER SET utf8mb4,
    `file_name` varchar(300) NOT NULL DEFAULT '',
    `thumbnail` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT '',
    `source` varchar(3000) CHARACTER SET latin1 NOT NULL DEFAULT '',
    `youtube` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
    `vimeo` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
    `daily` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
    `facebook` varchar(100) NOT NULL DEFAULT '',
    `active` enum('0','1','2') NOT NULL DEFAULT '0',
    `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `duration` varchar(33) CHARACTER SET latin1 NOT NULL DEFAULT '00:00',
    `size` int(50) NOT NULL DEFAULT '0',
    `converted` int(5) NOT NULL DEFAULT '1',
    `category_id` varchar(100) NOT NULL DEFAULT '',
    `views` int(11) NOT NULL DEFAULT '0',
    `featured` int(11) NOT NULL DEFAULT '0',
    `age_restriction` int(11) NOT NULL DEFAULT '1',
    `approved` enum('Y','N') NOT NULL DEFAULT 'Y',
    `is_movie` enum('Y','N') NOT NULL DEFAULT 'N',
    `quality` varchar(11) NOT NULL DEFAULT '',
    `time` varchar(25) NOT NULL DEFAULT '0',
    `comments` enum('E','D') NOT NULL DEFAULT 'E',
    `likes` int(11) NOT NULL DEFAULT '0',
    `dislikes` int(11) NOT NULL DEFAULT '0',
    `total_comms` int(11) NOT NULL DEFAULT '0',
    `type` varchar(20) NOT NULL DEFAULT 'original'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
{%end%}

{%begin%}
  CREATE TABLE `ufx_video_comments` (
    `id` int(11) NOT NULL,
    `video_id` int(11) NOT NULL DEFAULT '0',
    `user_id` int(11) NOT NULL DEFAULT '0',
    `comment` varchar(1210) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
    `time` varchar(25) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_video_reports` (
    `id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL DEFAULT '0',
    `video_id` int(11) NOT NULL DEFAULT '0',
    `reason` int(3) NOT NULL DEFAULT '0',
    `seen` enum('1','0') NOT NULL DEFAULT '0',
    `time` varchar(25) NOT NULL DEFAULT '0'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  CREATE TABLE `ufx_views` (
    `id` int(11) NOT NULL,
    `video_id` int(11) NOT NULL DEFAULT '0',
    `uniq_id` varchar(220) NOT NULL DEFAULT '',
    `user_id` int(11) NOT NULL DEFAULT '0',
    `type` varchar(15) NOT NULL DEFAULT '',
    `user_status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
    `time` varchar(25) NOT NULL DEFAULT ''
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  ALTER TABLE `ufx_configs`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_history`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_likes`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_notifications`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_playlists`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_playlist_videos`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_sessions`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_subscriptions`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_users`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_videos`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_comments`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_reports`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_views`
    ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_configs`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_likes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_notifications`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_playlists`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_playlist_videos`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_sessions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_subscriptions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_videos`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_comments`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_reports`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  ALTER TABLE `ufx_views`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES (NULL, 'Account validation', 'acc_validation', 'on', '/^(on|off)$/');
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES (NULL, 'Facebook link', 'facebook', '', ''), (NULL, 'Youtube link', 'youtube', '', '');
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES (NULL, 'Instagram link', 'instagram', '', ''), (NULL, 'Twitter link', 'twitter', '', '');
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES (NULL, 'Google ads (Vert-banner)', 'google_ad_vert', '', ''), (NULL, 'Google ads (Horiz-banner)', 'google_ad_horiz', '', '');
{%end%}

{%begin%}
  INSERT INTO `ufx_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES (NULL, 'PCode', 'pcode', '', '');
{%end%}

{%begin%}
  DROP TABLE `ufx_video_comments`;
{%end%}

{%begin%}
  CREATE TABLE `ufx_video_comments` (`id` int NOT NULL, `video_id` int NOT NULL DEFAULT '0', `user_id` int NOT NULL DEFAULT '0', `comment` varchar(1210) CHARACTER SET utf8mb4 NOT NULL DEFAULT '', `likes_json` text CHARACTER SET utf8mb4, `likes_int` int NOT NULL DEFAULT '0', `parent_id` int NOT NULL DEFAULT '0', `target_uid` int NOT NULL DEFAULT '0', `time` varchar(25) NOT NULL DEFAULT '0') ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_comments` ADD PRIMARY KEY (`id`);
{%end%}

{%begin%}
  ALTER TABLE `ufx_video_comments` MODIFY `id` int NOT NULL AUTO_INCREMENT;
{%end%}

{%begin%}
  CREATE TABLE `ufx_verifications` ( `id` int NOT NULL AUTO_INCREMENT, 
    `user_id` int NOT NULL DEFAULT '0', 
    `full_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '', 
    `text_message` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '', 
    `video_message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '', 
    `time` int NOT NULL DEFAULT '0', 
  PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{%end%}

{%begin%}
  DROP TABLE `ufx_playlists`;
{%end%}

{%begin%}
  DROP TABLE `ufx_playlist_videos`;
{%end%}

{%begin%}
  ALTER TABLE `ufx_users` DROP `cover`;
{%end%}

{%begin%}
  ALTER TABLE `ufx_users` DROP `cover_orig`;
{%end%}