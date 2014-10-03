### July 1 2014

ALTER TABLE `ekart`.`user` 
ADD COLUMN `operating_currency` VARCHAR(45) NOT NULL DEFAULT '&#8377;'  AFTER `object_version_number` , 
ADD COLUMN `timezone` VARCHAR(45) NOT NULL DEFAULT 'UTC+5:30'  AFTER `object_version_number` ;

ALTER TABLE `ekart`.`orders` 
ADD COLUMN `is_new` tinyint(1) NOT NULL DEFAULT '1'  AFTER `order_number` , 
ADD COLUMN `priority` int(2) NOT NULL DEFAULT '3'  AFTER `order_number` ;