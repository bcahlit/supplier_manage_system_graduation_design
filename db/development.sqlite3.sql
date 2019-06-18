BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `users_roles` (
	`user_id`	integer,
	`role_id`	integer
);
INSERT INTO `users_roles` (user_id,role_id) VALUES (1,1);
INSERT INTO `users_roles` (user_id,role_id) VALUES (2,1);
CREATE TABLE IF NOT EXISTS `users` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_name`	varchar NOT NULL,
	`qq`	varchar,
	`wechat`	varchar,
	`real_name`	varchar,
	`password_digest`	varchar,
	`title`	varchar,
	`phone`	varchar NOT NULL,
	`level`	integer DEFAULT 0,
	`sex`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `users` (id,user_name,qq,wechat,real_name,password_digest,title,phone,level,sex,created_at,updated_at) VALUES (1,'admin',NULL,'2qeaew',NULL,'$2a$10$tkmzdjdnfxXPJq5DW.PJ8eIjpymynrr0z7o97ahv/zbGB2pvDLDxi',NULL,'18766653491',0,NULL,'2019-05-05 11:39:08.387498','2019-05-13 11:45:48.258422');
INSERT INTO `users` (id,user_name,qq,wechat,real_name,password_digest,title,phone,level,sex,created_at,updated_at) VALUES (2,'vhhis',NULL,NULL,'zhong','$2a$10$8DW7Gj7pYnXyYj2op7SYBe6mkcVOAIE3EcUH6Bvgc23fpPEOwUsO6',NULL,'2435664452',0,NULL,'2019-05-13 13:49:35.535280','2019-05-13 13:49:35.535280');
CREATE TABLE IF NOT EXISTS `suppliers` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`phone`	varchar NOT NULL,
	`name`	varchar,
	`type`	integer,
	`address`	varchar,
	`level`	integer DEFAULT 0,
	`email`	varchar,
	`state`	integer DEFAULT 0,
	`concat`	varchar,
	`zip`	varchar,
	`bank_number`	varchar,
	`reputation`	integer DEFAULT 100,
	`fax`	varchar,
	`remark`	varchar,
	`timely`	integer DEFAULT 100,
	`aftersales`	integer DEFAULT 100,
	`componiship`	integer DEFAULT 100,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (1,'18348959412','托福食品公司',NULL,'惠民县',0,'antoniaullrich@simonis.net',0,'Monte Gaylord',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.085010','2019-05-05 11:39:09.085010');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (2,'18118101739','华晟食品公司',NULL,'邹平县',0,'ninfa@croninschuppe.net',0,'Alden Johns',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.090641','2019-05-05 11:39:09.090641');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (3,'18750205267','小猪果园',NULL,'邹平县',0,'cliftongleichner@heel.com',0,'Ms. Delia Predovic',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.095515','2019-05-05 11:39:09.095515');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (4,'18495289250','春水果购销公司',NULL,'博兴县',0,'pearlywillms@tillmankohler.com',0,'Timothy Hirthe',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.100126','2019-05-05 11:39:09.100126');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (5,'18706558398','信合机械公司',NULL,'博兴县',0,'doris@donnelly.name',0,'Samuel Schroeder',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.104610','2019-05-05 11:39:09.104610');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (6,'18431188321','新光机械有限责任公司',NULL,'邹平县',0,'manualhansen@runte.io',0,'Darin Cormier',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.108072','2019-05-05 11:39:09.108072');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (7,'18979515905','嘉和办公设备有限公司',NULL,'邹平县',0,'patti@weimann.name',0,'Francisco Bogan',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.112091','2019-05-05 11:39:09.112091');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (8,'18169876650','太平洋机械设备有限公司',NULL,'博兴县',0,'nelson@olson.co',0,'Sachiko Fahey PhD',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.115332','2019-05-05 11:39:09.115332');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (9,'18890924512','Oracle公司',NULL,'济南',0,'darryljacobson@wyman.org',0,'Keely Homenick',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.118503','2019-05-05 11:39:09.118503');
INSERT INTO `suppliers` (id,phone,name,type,address,level,email,state,concat,zip,bank_number,reputation,fax,remark,timely,aftersales,componiship,created_at,updated_at) VALUES (10,'18647390890','企安信公司',NULL,'沾化区',0,'paulturner@goodwin.org',0,'Hugh Bode',NULL,NULL,100,NULL,NULL,100,100,100,'2019-05-05 11:39:09.122750','2019-05-05 11:39:09.122750');
CREATE TABLE IF NOT EXISTS `supplier_products` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`supplier_id`	integer,
	`product_id`	integer,
	`commit`	varchar,
	`price`	integer,
	`back_rate`	integer DEFAULT 0,
	`standard`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_8e1c65b71a` FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`id`),
	CONSTRAINT `fk_rails_9a363579c5` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`)
);
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (1,1,3,NULL,56,1,0,'2019-05-05 11:40:11.841041','2019-05-05 11:40:11.841041');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (3,1,7,NULL,45,24,0,'2019-05-05 14:52:35.850306','2019-05-05 14:52:35.850306');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (4,2,2,NULL,3,0,0,'2019-05-06 07:27:06.171037','2019-05-06 07:27:06.171037');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (5,3,3,NULL,2,3,3,'2019-05-11 12:22:49.807312','2019-05-11 12:22:49.807312');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (6,7,4,NULL,450,0,100,'2019-05-11 14:12:10.682937','2019-05-11 14:12:10.682937');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (7,1,5,NULL,457,0,100,'2019-05-20 02:27:10.715641','2019-05-20 02:27:10.715641');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (8,7,9,NULL,200,0,100,'2019-05-31 09:01:20.819559','2019-05-31 09:01:20.819559');
INSERT INTO `supplier_products` (id,supplier_id,product_id,commit,price,back_rate,standard,created_at,updated_at) VALUES (9,8,14,NULL,3000,0,NULL,'2019-06-04 11:44:25.644550','2019-06-04 11:44:25.644550');
CREATE TABLE IF NOT EXISTS `schema_migrations` (
	`version`	varchar NOT NULL,
	PRIMARY KEY(`version`)
);
INSERT INTO `schema_migrations` (version) VALUES ('20190416100413');
INSERT INTO `schema_migrations` (version) VALUES ('20190417143123');
INSERT INTO `schema_migrations` (version) VALUES ('20190420113320');
INSERT INTO `schema_migrations` (version) VALUES ('20190423105848');
INSERT INTO `schema_migrations` (version) VALUES ('20190425033020');
INSERT INTO `schema_migrations` (version) VALUES ('20190425033032');
INSERT INTO `schema_migrations` (version) VALUES ('20190502071837');
INSERT INTO `schema_migrations` (version) VALUES ('20190510020347');
INSERT INTO `schema_migrations` (version) VALUES ('20190512144954');
CREATE TABLE IF NOT EXISTS `schedules` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	integer NOT NULL,
	`detail`	varchar,
	`link`	varchar,
	`degree`	integer DEFAULT 0,
	`user_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_3c900465fa` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
);
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (1,1557750765,'做一个世界的水手，奔赴所有的码头。',NULL,0,1,'2019-05-05 11:39:08.884201','2019-05-05 11:39:08.884201');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (2,1556942177,'深思熟虑的结果往往就是说不清楚。',NULL,2,1,'2019-05-05 11:39:08.890397','2019-05-05 11:39:08.890397');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (3,1558044478,'人真正的完美不在于他拥有什么，而在于他是什么。',NULL,0,1,'2019-05-05 11:39:08.894252','2019-05-05 11:39:08.894252');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (4,1558250660,'一个人总是可以善待他毫不在意的人。',NULL,0,1,'2019-05-05 11:39:08.912640','2019-05-05 11:39:08.912640');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (5,1558898146,'我家门前有两棵树，一棵是枣树，另一棵也是枣树。',NULL,1,1,'2019-05-05 11:39:08.915621','2019-05-05 11:39:08.915621');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (6,1556545541,'一个人只有今生今世是不够的,他还应当有诗意的世界。',NULL,0,1,'2019-05-05 11:39:08.918283','2019-05-05 11:39:08.918283');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (7,1558124103,'总之岁月漫长，然而值得等待',NULL,2,1,'2019-05-05 11:39:08.922267','2019-05-05 11:39:08.922267');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (8,1556570373,'知不知道饮酒和饮水有什么区别？酒越饮越暖，水越喝越寒。',NULL,2,1,'2019-05-05 11:39:08.926253','2019-05-05 11:39:08.926253');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (9,1558074846,'人的一切痛苦，本质上都是对自己的无能的愤怒。',NULL,1,1,'2019-05-05 11:39:08.929920','2019-05-05 11:39:08.929920');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (10,1556701629,'天涯存知己，海内若比邻',NULL,1,1,'2019-05-05 11:39:08.933425','2019-05-05 11:39:08.933425');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (11,1556463319,'当我跨过沉沦的一切，向着永恒开战的时候，你是我的军旗。',NULL,1,1,'2019-05-05 11:39:08.937366','2019-05-05 11:39:08.937366');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (12,1558278367,'人的一切痛苦，本质上都是对自己的无能的愤怒。',NULL,2,1,'2019-05-05 11:39:08.940751','2019-05-05 11:39:08.940751');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (13,1557937260,'人生若无悔，那该多无趣啊！',NULL,0,1,'2019-05-05 11:39:08.944286','2019-05-05 11:39:08.944286');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (14,1556653955,'我们继续奋力向前，逆水行舟，被不断地向后推，直至回到往昔岁月。',NULL,0,1,'2019-05-05 11:39:08.948201','2019-05-05 11:39:08.948201');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (15,1557671850,'我们继续奋力向前，逆水行舟，被不断地向后推，直至回到往昔岁月。',NULL,2,1,'2019-05-05 11:39:08.952469','2019-05-05 11:39:08.952469');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (16,1558534421,'生活就是不断的死亡和复活。',NULL,0,1,'2019-05-05 11:39:08.955550','2019-05-05 11:39:08.955550');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (17,1558888650,'人真正的完美不在于他拥有什么，而在于他是什么。',NULL,1,1,'2019-05-05 11:39:08.958747','2019-05-05 11:39:08.958747');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (18,1557630413,'苟利国家生死以，岂因祸福避趋之。',NULL,2,1,'2019-05-05 11:39:08.961646','2019-05-05 11:39:08.961646');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (19,1556992556,'人生若无悔，那该多无趣啊！',NULL,1,1,'2019-05-05 11:39:08.964302','2019-05-05 11:39:08.964302');
INSERT INTO `schedules` (id,date,detail,link,degree,user_id,created_at,updated_at) VALUES (20,1558607039,'当我跨过沉沦的一切，向着永恒开战的时候，你是我的军旗。',NULL,2,1,'2019-05-05 11:39:08.967002','2019-05-05 11:39:08.967002');
CREATE TABLE IF NOT EXISTS `roles` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`resource_type`	varchar,
	`resource_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `roles` (id,name,resource_type,resource_id,created_at,updated_at) VALUES (1,'admin',NULL,NULL,'2019-05-12 15:01:45.600977','2019-05-12 15:01:45.600977');
CREATE TABLE IF NOT EXISTS `products` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`number`	varchar NOT NULL,
	`type`	varchar,
	`remark`	varchar,
	`color`	varchar,
	`classify`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (1,'面包','888915',NULL,NULL,NULL,'食品','2019-05-05 11:39:08.988404','2019-05-05 11:39:08.988404');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (2,'饮料','517214',NULL,NULL,NULL,'食品','2019-05-05 11:39:08.991510','2019-05-05 11:39:08.991510');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (3,'米饭','953052',NULL,NULL,NULL,'食品','2019-05-05 11:39:08.993889','2019-05-05 11:39:08.993889');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (4,'空乘服饰','383236',NULL,NULL,NULL,'服饰','2019-05-05 11:39:08.996077','2019-05-05 11:39:08.996077');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (5,'环卫服饰','718500',NULL,NULL,NULL,'服饰','2019-05-05 11:39:08.998343','2019-05-05 11:39:08.998343');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (6,'安保服饰','567659',NULL,NULL,NULL,'服饰','2019-05-05 11:39:09.000939','2019-05-05 11:39:09.000939');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (7,'销售服饰','770119',NULL,NULL,NULL,'服饰','2019-05-05 11:39:09.003230','2019-05-05 11:39:09.003230');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (8,'键盘','130791',NULL,NULL,NULL,'办公设备','2019-05-05 11:39:09.005509','2019-05-05 11:39:09.005509');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (9,'打印机','993240',NULL,NULL,NULL,'办公设备','2019-05-05 11:39:09.007976','2019-05-05 11:39:09.007976');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (10,'打印纸','128448',NULL,NULL,NULL,'办公设备','2019-05-05 11:39:09.010636','2019-05-05 11:39:09.010636');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (11,'金属探测仪','441599',NULL,NULL,NULL,'机械设备','2019-05-05 11:39:09.013164','2019-05-05 11:39:09.013164');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (12,'小推车','112602',NULL,NULL,NULL,'机械设备','2019-05-05 11:39:09.015489','2019-05-05 11:39:09.015489');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (13,'安检扫描仪','181406',NULL,NULL,NULL,'基础设备','2019-05-05 11:39:09.017881','2019-05-05 11:39:09.017881');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (14,'空调','472674',NULL,NULL,NULL,'基础设备','2019-05-05 11:39:09.020633','2019-05-05 11:39:09.020633');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (15,'服务器','201910',NULL,NULL,NULL,'基础设备','2019-05-05 11:39:09.024573','2019-05-05 11:39:09.024573');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (16,'插座','320811',NULL,NULL,NULL,'建筑设备','2019-05-05 11:39:09.027761','2019-05-05 11:39:09.027761');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (17,'风扇','385088',NULL,NULL,NULL,'建筑设备','2019-05-05 11:39:09.031205','2019-05-05 11:39:09.031205');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (18,'照明灯具','797686',NULL,NULL,NULL,'建筑设备','2019-05-05 11:39:09.034866','2019-05-05 11:39:09.034866');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (19,'苹果','536587',NULL,NULL,NULL,'水果','2019-05-05 11:39:09.038146','2019-05-05 11:39:09.038146');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (20,'橘子','443937',NULL,NULL,NULL,'水果','2019-05-05 11:39:09.041325','2019-05-05 11:39:09.041325');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (21,'李子','779459',NULL,NULL,NULL,'水果','2019-05-05 11:39:09.044285','2019-05-05 11:39:09.044285');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (22,'火龙果','531240',NULL,NULL,NULL,'水果','2019-05-05 11:39:09.048239','2019-05-05 11:39:09.048239');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (23,'芒果','427154',NULL,NULL,NULL,'水果','2019-05-05 11:39:09.051309','2019-05-05 11:39:09.051309');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (24,'系统维护服务','469177',NULL,NULL,NULL,'服务','2019-05-05 11:39:09.054442','2019-05-05 11:39:09.054442');
INSERT INTO `products` (id,name,number,type,remark,color,classify,created_at,updated_at) VALUES (25,'测试产品2','2345678','','fafwe','','建筑','2019-05-08 07:38:36.605276','2019-05-08 07:38:36.605276');
CREATE TABLE IF NOT EXISTS `order_forms` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`supplier_id`	integer,
	`product_id`	integer,
	`user_id`	integer,
	`reviewer_id`	integer,
	`time`	integer NOT NULL,
	`number`	integer NOT NULL,
	`total_price`	integer,
	`remark`	varchar,
	`priority`	integer NOT NULL DEFAULT 0,
	`state`	integer DEFAULT 0,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_40b6e9b1fb` FOREIGN KEY(`reviewer_id`) REFERENCES `users`(`id`),
	CONSTRAINT `fk_rails_d049b5c53e` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
);
INSERT INTO `order_forms` (id,supplier_id,product_id,user_id,reviewer_id,time,number,total_price,remark,priority,state,created_at,updated_at) VALUES (2,8,14,1,1,1557303096000,32,96000,'asdgawergf',0,4,'2019-05-08 08:11:36.825102','2019-06-04 11:45:53.160647');
INSERT INTO `order_forms` (id,supplier_id,product_id,user_id,reviewer_id,time,number,total_price,remark,priority,state,created_at,updated_at) VALUES (4,NULL,6,1,1,1557305382000,123,NULL,'afawe',0,1,'2019-05-08 08:49:42.972039','2019-05-09 14:35:08.736169');
INSERT INTO `order_forms` (id,supplier_id,product_id,user_id,reviewer_id,time,number,total_price,remark,priority,state,created_at,updated_at) VALUES (7,3,3,1,1,1557305589000,12,540,'afawe',0,5,'2019-05-08 08:53:09.841522','2019-05-11 14:09:55.528180');
INSERT INTO `order_forms` (id,supplier_id,product_id,user_id,reviewer_id,time,number,total_price,remark,priority,state,created_at,updated_at) VALUES (9,7,4,1,1,1557585894000,34,15300,NULL,0,4,'2019-05-11 14:44:54.501075','2019-05-20 02:31:19.811458');
INSERT INTO `order_forms` (id,supplier_id,product_id,user_id,reviewer_id,time,number,total_price,remark,priority,state,created_at,updated_at) VALUES (10,7,9,1,1,1558319311000,34,6800,'6789',0,4,'2019-05-20 02:28:31.125007','2019-05-31 09:19:31.307546');
CREATE TABLE IF NOT EXISTS `notes` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`	varchar,
	`context`	varchar,
	`user_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (1,'ullam','总之岁月漫长，然而值得等待',1,'2019-05-05 11:39:08.608046','2019-05-05 11:39:08.608046');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (2,'adipisci','苟利国家生死以，岂因祸福避趋之。',1,'2019-05-05 11:39:08.612083','2019-05-05 11:39:08.612083');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (3,'dolorem','一个人总是可以善待他毫不在意的人。',1,'2019-05-05 11:39:08.615288','2019-05-05 11:39:08.615288');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (4,'amet','深思熟虑的结果往往就是说不清楚。',1,'2019-05-05 11:39:08.618348','2019-05-05 11:39:08.618348');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (5,'repellendus','我家门前有两棵树，一棵是枣树，另一棵也是枣树。',1,'2019-05-05 11:39:08.623380','2019-05-05 11:39:08.623380');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (6,'illo','人真正的完美不在于他拥有什么，而在于他是什么。',1,'2019-05-05 11:39:08.627774','2019-05-05 11:39:08.627774');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (7,'expedita','深思熟虑的结果往往就是说不清楚。',1,'2019-05-05 11:39:08.632414','2019-05-05 11:39:08.632414');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (8,'ab','总之岁月漫长，然而值得等待',1,'2019-05-05 11:39:08.637064','2019-05-05 11:39:08.637064');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (9,'illum','知不知道饮酒和饮水有什么区别？酒越饮越暖，水越喝越寒。',1,'2019-05-05 11:39:08.652151','2019-05-05 11:39:08.652151');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (10,'optio','人的烦恼就是记性太好，如果可以把所有事都忘掉，以后每一日都是个新开始，你说多好。',1,'2019-05-05 11:39:08.655447','2019-05-05 11:39:08.655447');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (11,'ipsam','不要同情自己，同情自己是卑劣懦夫干的勾当。',1,'2019-05-05 11:39:08.658771','2019-05-05 11:39:08.658771');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (12,'nemo','一个人总是可以善待他毫不在意的人。',1,'2019-05-05 11:39:08.661682','2019-05-05 11:39:08.661682');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (13,'vitae','人真正的完美不在于他拥有什么，而在于他是什么。',1,'2019-05-05 11:39:08.665100','2019-05-05 11:39:08.665100');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (14,'sed','人的一切痛苦，本质上都是对自己的无能的愤怒。',1,'2019-05-05 11:39:08.668187','2019-05-05 11:39:08.668187');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (15,'omnis','人生有两个悲剧，第一是想得到的得不到，第二是想得到的得到了。',1,'2019-05-05 11:39:08.671260','2019-05-05 11:39:08.671260');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (16,'repudiandae','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.674424','2019-05-05 11:39:08.674424');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (17,'incidunt','人生有两个悲剧，第一是想得到的得不到，第二是想得到的得到了。',1,'2019-05-05 11:39:08.677920','2019-05-05 11:39:08.677920');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (18,'fuga','一个人总是可以善待他毫不在意的人。',1,'2019-05-05 11:39:08.680992','2019-05-05 11:39:08.680992');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (19,'aut','人生若无悔，那该多无趣啊！',1,'2019-05-05 11:39:08.683930','2019-05-05 11:39:08.683930');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (20,'consequuntur','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.687271','2019-05-05 11:39:08.687271');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (21,'consequatur','我家门前有两棵树，一棵是枣树，另一棵也是枣树。',1,'2019-05-05 11:39:08.690635','2019-05-05 11:39:08.690635');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (22,'vel','深思熟虑的结果往往就是说不清楚。',1,'2019-05-05 11:39:08.693949','2019-05-05 11:39:08.693949');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (23,'quia','天涯存知己，海内若比邻',1,'2019-05-05 11:39:08.696975','2019-05-05 11:39:08.696975');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (24,'aut','我家门前有两棵树，一棵是枣树，另一棵也是枣树。',1,'2019-05-05 11:39:08.700144','2019-05-05 11:39:08.700144');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (25,'ducimus','做一个世界的水手，奔赴所有的码头。',1,'2019-05-05 11:39:08.703644','2019-05-05 11:39:08.703644');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (26,'sint','做你自己，因为别人都有人做了。',1,'2019-05-05 11:39:08.707179','2019-05-05 11:39:08.707179');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (27,'voluptas','人真正的完美不在于他拥有什么，而在于他是什么。',1,'2019-05-05 11:39:08.710752','2019-05-05 11:39:08.710752');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (28,'molestiae','人生有两个悲剧，第一是想得到的得不到，第二是想得到的得到了。',1,'2019-05-05 11:39:08.713871','2019-05-05 11:39:08.713871');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (29,'commodi','从小我就懂得保护自己，我知道要想不被人拒绝，最好的办法就是先拒绝别人。',1,'2019-05-05 11:39:08.716766','2019-05-05 11:39:08.716766');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (30,'minima','做你自己，因为别人都有人做了。',1,'2019-05-05 11:39:08.720240','2019-05-05 11:39:08.720240');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (31,'et','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.723639','2019-05-05 11:39:08.723639');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (32,'tenetur','人生若无悔，那该多无趣啊！',1,'2019-05-05 11:39:08.727267','2019-05-05 11:39:08.727267');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (33,'non','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.730428','2019-05-05 11:39:08.730428');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (34,'porro','从小我就懂得保护自己，我知道要想不被人拒绝，最好的办法就是先拒绝别人。',1,'2019-05-05 11:39:08.733859','2019-05-05 11:39:08.733859');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (35,'deleniti','人的一切痛苦，本质上都是对自己的无能的愤怒。',1,'2019-05-05 11:39:08.736847','2019-05-05 11:39:08.736847');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (36,'et','人生若无悔，那该多无趣啊！',1,'2019-05-05 11:39:08.739817','2019-05-05 11:39:08.739817');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (37,'eaque','天涯存知己，海内若比邻',1,'2019-05-05 11:39:08.743696','2019-05-05 11:39:08.743696');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (38,'soluta','深思熟虑的结果往往就是说不清楚。',1,'2019-05-05 11:39:08.747628','2019-05-05 11:39:08.747628');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (39,'eum','天涯存知己，海内若比邻',1,'2019-05-05 11:39:08.751659','2019-05-05 11:39:08.751659');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (40,'sed','我们继续奋力向前，逆水行舟，被不断地向后推，直至回到往昔岁月。',1,'2019-05-05 11:39:08.755613','2019-05-05 11:39:08.755613');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (41,'maiores','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.816720','2019-05-05 11:39:08.816720');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (42,'autem','做一个世界的水手，奔赴所有的码头。',1,'2019-05-05 11:39:08.824766','2019-05-05 11:39:08.824766');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (43,'distinctio','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.829439','2019-05-05 11:39:08.829439');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (44,'adipisci','知不知道饮酒和饮水有什么区别？酒越饮越暖，水越喝越寒。',1,'2019-05-05 11:39:08.832845','2019-05-05 11:39:08.832845');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (45,'fugiat','天涯存知己，海内若比邻',1,'2019-05-05 11:39:08.844022','2019-05-05 11:39:08.844022');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (46,'aliquid','一个人只有今生今世是不够的,他还应当有诗意的世界。',1,'2019-05-05 11:39:08.847242','2019-05-05 11:39:08.847242');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (47,'nihil','人生有两个悲剧，第一是想得到的得不到，第二是想得到的得到了。',1,'2019-05-05 11:39:08.850418','2019-05-05 11:39:08.850418');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (48,'incidunt','哪里会有人喜欢孤独，不过是不喜欢失望罢了。',1,'2019-05-05 11:39:08.853967','2019-05-05 11:39:08.853967');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (49,'cupiditate','总之岁月漫长，然而值得等待',1,'2019-05-05 11:39:08.857118','2019-05-05 11:39:08.857118');
INSERT INTO `notes` (id,title,context,user_id,created_at,updated_at) VALUES (50,'sequi','一个人总是可以善待他毫不在意的人。',1,'2019-05-05 11:39:08.860706','2019-05-05 11:39:08.860706');
CREATE TABLE IF NOT EXISTS `comments` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`supplier_product_id`	integer,
	`order_form_id`	integer,
	`detail`	varchar,
	`satisfaction`	integer,
	`before_sale`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	CONSTRAINT `fk_rails_32dbd2ceae` FOREIGN KEY(`supplier_product_id`) REFERENCES `supplier_products`(`id`),
	CONSTRAINT `fk_rails_e276aa973b` FOREIGN KEY(`order_form_id`) REFERENCES `order_forms`(`id`)
);
INSERT INTO `comments` (id,supplier_product_id,order_form_id,detail,satisfaction,before_sale,created_at,updated_at) VALUES (1,5,7,'test',95,NULL,'2019-05-11 14:07:40.462032','2019-05-11 14:07:40.462032');
INSERT INTO `comments` (id,supplier_product_id,order_form_id,detail,satisfaction,before_sale,created_at,updated_at) VALUES (2,5,7,'tgwwt',97,0,'2019-05-11 14:09:04.326534','2019-05-11 14:09:04.326534');
INSERT INTO `comments` (id,supplier_product_id,order_form_id,detail,satisfaction,before_sale,created_at,updated_at) VALUES (3,5,7,'gsdtb',34,NULL,'2019-05-11 14:09:55.461376','2019-05-11 14:09:55.461376');
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
	`key`	varchar NOT NULL,
	`value`	varchar,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL,
	PRIMARY KEY(`key`)
);
INSERT INTO `ar_internal_metadata` (key,value,created_at,updated_at) VALUES ('environment','development','2019-05-05 11:22:34.512409','2019-05-05 11:22:34.512409');
CREATE INDEX IF NOT EXISTS `index_users_roles_on_user_id_and_role_id` ON `users_roles` (
	`user_id`,
	`role_id`
);
CREATE INDEX IF NOT EXISTS `index_users_roles_on_user_id` ON `users_roles` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `index_users_roles_on_role_id` ON `users_roles` (
	`role_id`
);
CREATE INDEX IF NOT EXISTS `index_supplier_products_on_supplier_id` ON `supplier_products` (
	`supplier_id`
);
CREATE INDEX IF NOT EXISTS `index_supplier_products_on_product_id` ON `supplier_products` (
	`product_id`
);
CREATE INDEX IF NOT EXISTS `index_schedules_on_user_id` ON `schedules` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `index_roles_on_resource_type_and_resource_id` ON `roles` (
	`resource_type`,
	`resource_id`
);
CREATE INDEX IF NOT EXISTS `index_roles_on_name_and_resource_type_and_resource_id` ON `roles` (
	`name`,
	`resource_type`,
	`resource_id`
);
CREATE INDEX IF NOT EXISTS `index_roles_on_name` ON `roles` (
	`name`
);
CREATE INDEX IF NOT EXISTS `index_order_forms_on_user_id` ON `order_forms` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `index_order_forms_on_supplier_id` ON `order_forms` (
	`supplier_id`
);
CREATE INDEX IF NOT EXISTS `index_order_forms_on_reviewer_id` ON `order_forms` (
	`reviewer_id`
);
CREATE INDEX IF NOT EXISTS `index_order_forms_on_product_id` ON `order_forms` (
	`product_id`
);
CREATE INDEX IF NOT EXISTS `index_notes_on_user_id` ON `notes` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `index_comments_on_supplier_product_id` ON `comments` (
	`supplier_product_id`
);
CREATE INDEX IF NOT EXISTS `index_comments_on_order_form_id` ON `comments` (
	`order_form_id`
);
COMMIT;