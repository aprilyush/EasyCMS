CREATE TABLE `sys_operate` (
  `id` bigint(20) NOT NULL,
  `func_name` varchar(50) DEFAULT NULL,
  `func_cname` varchar(50) DEFAULT NULL,
  `func_icon` varchar(50) DEFAULT NULL,
  `func_sort` int(11) DEFAULT NULL,
  `func_url` varchar(50) DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) NOT NULL,
  `in_table` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;