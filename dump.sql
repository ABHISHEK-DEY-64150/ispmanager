PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20230525054218');
INSERT INTO schema_migrations VALUES('20230525072755');
INSERT INTO schema_migrations VALUES('20230529074057');
INSERT INTO schema_migrations VALUES('20230529114823');
INSERT INTO schema_migrations VALUES('20230530112122');
INSERT INTO schema_migrations VALUES('20230604074522');
INSERT INTO schema_migrations VALUES('20230604121237');
INSERT INTO schema_migrations VALUES('20230604122118');
INSERT INTO schema_migrations VALUES('20230604125826');
INSERT INTO schema_migrations VALUES('20230606124505');
INSERT INTO schema_migrations VALUES('20230606124920');
INSERT INTO schema_migrations VALUES('20230606132027');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2023-05-25 05:44:22.987830','2023-05-25 05:44:22.987830');
CREATE TABLE IF NOT EXISTS "providers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "password_digest" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO providers VALUES(1,'admin1@gmail.com','$2a$12$RWDbodq.GMkqMhscyUSCK.rQa9rpkinHGMTiGeoNOLOyeGMspx.EC','2023-05-25 06:01:21.322011','2023-05-25 06:01:21.322011');
INSERT INTO providers VALUES(2,'admin2@gmail.com','$2a$12$yz5G5wzSkbEnK888z1SFb.kAJ2UX478pdkU98EzTNecXvW/Z9NIAC','2023-05-30 06:50:40.129492','2023-05-30 06:50:40.129492');
CREATE TABLE IF NOT EXISTS "customers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password_digest" varchar, "paymentDues" integer, "provider_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_df07dd855a"
FOREIGN KEY ("provider_id")
  REFERENCES "providers" ("id")
);
INSERT INTO customers VALUES(1,'aa','aa@gmail.com','$2a$12$ksuyv76AYinZlMagmaMFJ.YjhtYN8tDSYeGNBlwukGWxiqB2NRzoO',0,1,'2023-05-25 13:03:06.235228','2023-05-25 13:03:06.235228');
INSERT INTO customers VALUES(2,'bb','bb@gmail.com','$2a$12$oq4khncBCDOjn20etTJxw.7oviEBj6CLavfqfm3DDt6HRFy0xeMcy',0,1,'2023-05-25 13:04:22.052239','2023-05-25 13:04:22.052239');
INSERT INTO customers VALUES(3,'cc','cc@gmail.com','$2a$12$NJ3HOfuNamD0sawRnQ4vOOjLtkwXAITgg07U4CD/dKfNJvwD17fV2',0,1,'2023-05-28 05:50:20.607787','2023-05-28 05:50:20.607787');
INSERT INTO customers VALUES(4,'cc','cc@gmail.com','$2a$12$uvj6JCcGgQ71FIlMARBtNeN587p2FEb9Vv2sLkhaqYSUPGsIUtgGK',0,1,'2023-05-30 09:20:00.794973','2023-05-30 09:20:00.794973');
INSERT INTO customers VALUES(5,'cus','cus@gmail.com','$2a$12$iWhpVmVXy9vfcTEmZYBfNegedagib3bI6/lr1Qm4R4vUomOrJCkJy',0,1,'2023-05-31 07:09:04.199508','2023-05-31 07:09:04.199508');
INSERT INTO customers VALUES(6,'customer222','customer122@gmail.com','$2a$12$k2/H1MNwHJyRLK5IuYgTxutGK.HCacjm567TFr4Wi4nQ7srsPu0/u',0,1,'2023-06-12 09:59:01.716694','2023-06-12 09:59:01.716694');
INSERT INTO customers VALUES(7,'cus2','cus2@gmail.com','$2a$12$4qou5LcPfbOMDZ97vJa/9enoWtJAy55NqthBzdICyhhiWxYuNTtlm',0,1,'2023-06-13 07:01:06.902125','2023-06-13 07:01:06.902125');
INSERT INTO customers VALUES(8,'cs3','cs@gmail.com','$2a$12$w.HxC2L5bCvBkWMQ63hZL.yR4hQvNpyvmOGa96gbCKHKxKHZ6buty',0,1,'2023-06-13 08:44:21.043432','2023-06-13 08:44:21.043432');
CREATE TABLE IF NOT EXISTS "packages" ("id" integer NOT NULL PRIMARY KEY, "servicetype" varchar DEFAULT NULL, "description" text DEFAULT NULL, "price" integer DEFAULT NULL, "provider_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_972c627fbb"
FOREIGN KEY ("provider_id")
  REFERENCES "providers" ("id")
);
INSERT INTO packages VALUES(1,'Internet','p1',20,1,'2023-05-29 11:21:28.875495','2023-05-29 11:21:28.875495');
INSERT INTO packages VALUES(2,'Cable','dzfkjh',50,1,'2023-05-29 11:22:18.919661','2023-05-29 11:22:18.919661');
INSERT INTO packages VALUES(3,'Cable','p2',50,1,'2023-05-29 11:23:41.609875','2023-05-29 11:23:41.609875');
INSERT INTO packages VALUES(4,'Cable','pp3',100,1,'2023-05-29 11:56:26.440717','2023-05-29 11:56:26.440717');
INSERT INTO packages VALUES(5,'Paper','qqqqqq',500,1,'2023-05-29 11:59:12.546552','2023-05-29 11:59:12.546552');
INSERT INTO packages VALUES(6,'Cable','arpita',1000,1,'2023-05-29 12:01:29.004719','2023-05-29 12:01:29.004719');
INSERT INTO packages VALUES(7,'Paper','new',200,1,'2023-05-30 05:15:37.086373','2023-05-30 05:15:37.086373');
INSERT INTO packages VALUES(8,'Internet','grfdsh',20,1,'2023-06-12 10:03:52.482334','2023-06-12 10:03:52.482334');
INSERT INTO packages VALUES(9,'Internet','exp',123,1,'2023-06-13 06:34:27.213982','2023-06-13 06:34:27.213982');
INSERT INTO packages VALUES(10,'Internet','',NULL,1,'2023-06-13 09:51:41.825412','2023-06-13 09:51:41.825412');
CREATE TABLE IF NOT EXISTS "customer_subscriptions" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "servicetype" varchar, "packagedescription" varchar, "price" integer, "package_id" integer, "provider_id" integer, "customer_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "dues" integer, CONSTRAINT "fk_rails_808aa5d713"
FOREIGN KEY ("customer_id")
  REFERENCES "customers" ("id")
);
INSERT INTO customer_subscriptions VALUES(5,'Internet','p1',20,1,1,3,'2023-05-31 05:39:25.495157','2023-05-31 05:39:25.495157',NULL);
INSERT INTO customer_subscriptions VALUES(6,'Internet','p1',20,1,1,3,'2023-05-31 05:55:38.521969','2023-05-31 05:55:38.521969',NULL);
INSERT INTO customer_subscriptions VALUES(110,'Cable','dzfkjh',50,2,1,5,'2023-06-08 09:44:15.028027','2023-06-12 08:50:48.991059',20);
INSERT INTO customer_subscriptions VALUES(111,'Internet','p1',20,1,1,5,'2023-06-12 08:30:12.685875','2023-06-12 08:50:49.002846',21);
INSERT INTO customer_subscriptions VALUES(112,'Cable','p2',50,3,1,5,'2023-06-12 08:30:29.974865','2023-06-12 08:50:49.010513',21);
INSERT INTO customer_subscriptions VALUES(113,'Internet','exp',123,9,1,5,'2023-06-13 06:34:54.803074','2023-06-13 06:34:54.803074',1);
CREATE TABLE IF NOT EXISTS "payments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "provider_id" integer, "customer_id" integer, "subscription_id" integer, "amount" integer, "timestamp" date, "txid" text, "dues" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "card" integer, "package_id" integer, "servicetype" varchar, "packagedescription" varchar, "price" integer);
INSERT INTO payments VALUES(1,1,5,105,1940,'2023-06-06','606cb9b889',97,'2023-06-06 13:52:32.885977','2023-06-06 13:52:32.885977',1234,1,'Internet','p1',20);
INSERT INTO payments VALUES(2,1,5,105,20,'2023-06-06','e01107b7c2',1,'2023-06-06 13:54:01.446663','2023-06-06 13:54:01.446663',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(3,1,5,106,7450,'2023-06-06','606cb9b889',149,'2023-06-06 13:54:07.312654','2023-06-06 13:54:07.312654',1234,3,'Cable','p2',50);
INSERT INTO payments VALUES(4,1,5,105,260,'2023-06-06','606cb9b889',13,'2023-06-06 14:07:34.515701','2023-06-06 14:07:34.515701',1234,1,'Internet','p1',20);
INSERT INTO payments VALUES(5,1,5,105,260,'2023-06-06','606cb9b889',13,'2023-06-06 14:08:17.009696','2023-06-06 14:08:17.009696',1234,1,'Internet','p1',20);
INSERT INTO payments VALUES(6,1,5,105,140,'2023-06-06','ccf7180682',7,'2023-06-06 14:15:03.960439','2023-06-06 14:15:03.960439',12,1,'Internet','p1',20);
INSERT INTO payments VALUES(7,1,5,106,1000,'2023-06-06','888155fa4f',20,'2023-06-06 14:15:59.103054','2023-06-06 14:15:59.103054',123,3,'Cable','p2',50);
INSERT INTO payments VALUES(8,1,5,105,200,'2023-06-06','71b26dbbb9',10,'2023-06-06 14:26:05.838248','2023-06-06 14:26:05.838248',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(9,1,5,105,200,'2023-06-06','8a3e1d4cbc',10,'2023-06-06 14:26:10.040855','2023-06-06 14:26:10.040855',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(10,1,5,105,200,'2023-06-06','2087c0e208',10,'2023-06-06 14:30:43.203026','2023-06-06 14:30:43.203026',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(11,1,5,105,80,'2023-06-06','0fd1fe16c7',4,'2023-06-06 14:31:01.799367','2023-06-06 14:31:01.799367',22,1,'Internet','p1',20);
INSERT INTO payments VALUES(12,1,5,106,650,'2023-06-06','8719763d56',13,'2023-06-06 14:31:13.865828','2023-06-06 14:31:13.865828',33,3,'Cable','p2',50);
INSERT INTO payments VALUES(13,1,5,106,0,'2023-06-06','a61b96023f',0,'2023-06-06 14:31:26.891674','2023-06-06 14:31:26.891674',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(14,1,5,106,0,'2023-06-06','9bd8fe5859',0,'2023-06-06 14:32:07.450420','2023-06-06 14:32:07.450420',NULL,3,'Cable','p2',50);
INSERT INTO payments VALUES(15,1,5,105,20,'2023-06-06','c2430d67d7',1,'2023-06-06 14:32:22.819213','2023-06-06 14:32:22.819213',22,1,'Internet','p1',20);
INSERT INTO payments VALUES(16,1,5,106,150,'2023-06-06','202b4a5ed0',3,'2023-06-06 14:35:10.695349','2023-06-06 14:35:10.695349',1234,3,'Cable','p2',50);
INSERT INTO payments VALUES(17,1,5,105,40,'2023-06-06','214a8c054c',2,'2023-06-06 14:35:27.025352','2023-06-06 14:35:27.025352',33,1,'Internet','p1',20);
INSERT INTO payments VALUES(18,1,5,105,740,'2023-06-06','f497532d36',37,'2023-06-06 15:15:24.528473','2023-06-06 15:15:24.528473',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(19,1,5,105,40,'2023-06-06','dac2691b76',2,'2023-06-06 15:18:23.121315','2023-06-06 15:18:23.121315',22,1,'Internet','p1',20);
INSERT INTO payments VALUES(20,1,5,106,2000,'2023-06-06','b12625d174',40,'2023-06-06 15:18:40.778819','2023-06-06 15:18:40.778819',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(21,1,5,108,3000,'2023-06-07','2a8f4306a3',15,'2023-06-07 06:13:02.091883','2023-06-07 06:13:02.091883',123,7,'Paper','new',200);
INSERT INTO payments VALUES(22,1,5,108,0,'2023-06-07','13a85c3180',0,'2023-06-07 06:13:12.264916','2023-06-07 06:13:12.264916',NULL,7,'Paper','new',200);
INSERT INTO payments VALUES(23,1,5,108,200,'2023-06-07','293ded631a',1,'2023-06-07 06:14:28.348383','2023-06-07 06:14:28.348383',11,7,'Paper','new',200);
INSERT INTO payments VALUES(24,1,5,108,1000,'2023-06-07','7898af76cc',5,'2023-06-07 06:19:52.543222','2023-06-07 06:19:52.543222',NULL,7,'Paper','new',200);
INSERT INTO payments VALUES(25,1,5,108,200,'2023-06-07','1f6105f565',1,'2023-06-07 06:21:11.607878','2023-06-07 06:21:11.607878',NULL,7,'Paper','new',200);
INSERT INTO payments VALUES(26,1,5,108,2800,'2023-06-07','e72c978f08',14,'2023-06-07 06:34:57.287372','2023-06-07 06:34:57.287372',11,7,'Paper','new',200);
INSERT INTO payments VALUES(27,1,5,108,2800,'2023-06-07','86dab72588',14,'2023-06-07 06:35:08.178197','2023-06-07 06:35:08.178197',1111111,7,'Paper','new',200);
INSERT INTO payments VALUES(28,1,5,108,2800,'2023-06-07','489439a817',14,'2023-06-07 06:35:35.757882','2023-06-07 06:35:35.757882',111,7,'Paper','new',200);
INSERT INTO payments VALUES(29,1,5,108,0,'2023-06-07','fe2e238544',0,'2023-06-07 06:35:56.903572','2023-06-07 06:35:56.903572',11,7,'Paper','new',200);
INSERT INTO payments VALUES(30,1,5,108,800,'2023-06-07','2362db8e41',4,'2023-06-07 06:40:49.661728','2023-06-07 06:40:49.661728',11,7,'Paper','new',200);
INSERT INTO payments VALUES(31,1,5,108,1800,'2023-06-07','b96f5d5f56',9,'2023-06-07 06:50:22.147213','2023-06-07 06:50:22.147213',1,7,'Paper','new',200);
INSERT INTO payments VALUES(32,1,5,108,1200,'2023-06-07','3fe305bfc5',6,'2023-06-07 06:57:52.557802','2023-06-07 06:57:52.557802',1,7,'Paper','new',200);
INSERT INTO payments VALUES(33,1,5,108,0,'2023-06-07','b7fcabeed9',0,'2023-06-07 06:58:07.151387','2023-06-07 06:58:07.151387',1,7,'Paper','new',200);
INSERT INTO payments VALUES(34,1,5,108,3400,'2023-06-07','a8fd32653f',17,'2023-06-07 07:22:19.073264','2023-06-07 07:22:19.073264',2323,7,'Paper','new',200);
INSERT INTO payments VALUES(35,1,5,108,6200,'2023-06-07','e7e93787e6',31,'2023-06-07 07:56:14.914507','2023-06-07 07:56:14.914507',1234,7,'Paper','new',200);
INSERT INTO payments VALUES(36,1,5,108,0,'2023-06-07','ee061a4939',0,'2023-06-07 07:58:18.201330','2023-06-07 07:58:18.201330',2,7,'Paper','new',200);
INSERT INTO payments VALUES(37,1,5,108,800,'2023-06-07','2cf616d2fe',4,'2023-06-07 08:00:51.335824','2023-06-07 08:00:51.335824',1,7,'Paper','new',200);
INSERT INTO payments VALUES(38,1,5,108,800,'2023-06-07','707dd11aa9',4,'2023-06-07 08:02:46.627266','2023-06-07 08:02:46.627266',33,7,'Paper','new',200);
INSERT INTO payments VALUES(39,1,5,108,2000,'2023-06-07','fa6719d73a',10,'2023-06-07 08:18:02.915828','2023-06-07 08:18:02.915828',11,7,'Paper','new',200);
INSERT INTO payments VALUES(40,1,5,106,61450,'2023-06-07','00e9044aab',1229,'2023-06-07 11:59:58.441368','2023-06-07 11:59:58.441368',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(41,1,5,106,450,'2023-06-07','e3172d0656',9,'2023-06-07 12:11:35.705633','2023-06-07 12:11:35.705633',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(42,1,5,106,2000,'2023-06-07','1f7e43169f',40,'2023-06-07 12:53:49.631479','2023-06-07 12:53:49.631479',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(43,1,5,105,47700,'2023-06-08','bbab56cd5c',2385,'2023-06-08 07:19:30.912991','2023-06-08 07:19:30.912991',NULL,1,'Internet','p1',20);
INSERT INTO payments VALUES(44,1,5,106,55550,'2023-06-08','1cacd36b36',1111,'2023-06-08 07:27:16.695880','2023-06-08 07:27:16.695880',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(45,1,5,106,0,'2023-06-08','5efcdf3762',0,'2023-06-08 07:27:30.261992','2023-06-08 07:27:30.261992',11,3,'Cable','p2',50);
INSERT INTO payments VALUES(46,1,5,105,47860,'2023-06-08','8257d8d051',2393,'2023-06-08 07:27:55.819520','2023-06-08 07:27:55.819520',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(47,1,5,105,0,'2023-06-08','bae61a69ae',0,'2023-06-08 07:28:06.297386','2023-06-08 07:28:06.297386',111111,1,'Internet','p1',20);
INSERT INTO payments VALUES(48,1,5,106,50,'2023-06-08','5c4c7054e9',1,'2023-06-08 07:29:42.819912','2023-06-08 07:29:42.819912',1123,3,'Cable','p2',50);
INSERT INTO payments VALUES(49,1,5,106,0,'2023-06-08','5843cdbfa3',0,'2023-06-08 07:30:55.055623','2023-06-08 07:30:55.055623',123,3,'Cable','p2',50);
INSERT INTO payments VALUES(50,1,5,106,0,'2023-06-08','e7af36ead3',0,'2023-06-08 07:43:19.149790','2023-06-08 07:43:19.149790',112,3,'Cable','p2',50);
INSERT INTO payments VALUES(51,1,5,106,0,'2023-06-08','76b36ef79f',0,'2023-06-08 07:44:25.029513','2023-06-08 07:44:25.029513',1234,3,'Cable','p2',50);
INSERT INTO payments VALUES(52,1,5,105,400,'2023-06-08','5c54f9244f',20,'2023-06-08 07:48:54.610126','2023-06-08 07:48:54.610126',1234567,1,'Internet','p1',20);
INSERT INTO payments VALUES(53,1,5,105,20,'2023-06-08','cf59dbfdfa',1,'2023-06-08 07:50:30.411337','2023-06-08 07:50:30.411337',11,1,'Internet','p1',20);
INSERT INTO payments VALUES(54,1,5,109,240,'2023-06-08','66ea7aedea',12,'2023-06-08 08:15:53.331071','2023-06-08 08:15:53.331071',123,1,'Internet','p1',20);
INSERT INTO payments VALUES(55,1,5,109,20,'2023-06-08','44baad2254',1,'2023-06-08 08:18:03.585189','2023-06-08 08:18:03.585189',1234,1,'Internet','p1',20);
INSERT INTO payments VALUES(56,1,5,109,1280,'2023-06-08','997fa3b66e',64,'2023-06-08 09:25:09.881561','2023-06-08 09:25:09.881561',123,1,'Internet','p1',20);
INSERT INTO payments VALUES(57,1,5,110,50,'2023-06-08','88c2badf64',1,'2023-06-08 09:44:25.626987','2023-06-08 09:44:25.626987',11,2,'Cable','dzfkjh',50);
INSERT INTO payments VALUES(58,1,5,110,284250,'2023-06-12','de112744d3',5685,'2023-06-12 08:29:57.502518','2023-06-12 08:29:57.502518',12345,2,'Cable','dzfkjh',50);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('providers',2);
INSERT INTO sqlite_sequence VALUES('customers',8);
INSERT INTO sqlite_sequence VALUES('customer_subscriptions',113);
INSERT INTO sqlite_sequence VALUES('payments',58);
CREATE INDEX "index_customers_on_provider_id" ON "customers" ("provider_id");
CREATE INDEX "index_packages_on_provider_id" ON "packages" ("provider_id");
CREATE INDEX "index_customer_subscriptions_on_customer_id" ON "customer_subscriptions" ("customer_id");
COMMIT;
