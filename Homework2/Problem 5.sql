DROP DATABASE IF EXISTS `Problem_5`;
CREATE DATABASE `Problem_5`;
USE `Problem_5`;
CREATE TABLE `people` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`born` DATE NOT NULL
);

CREATE TABLE `play` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL,
	`author` INTEGER NOT NULL,
	`publication` DATE NOT NULL,
	`genre` VARCHAR(50) NOT NULL,
	FOREIGN KEY (`author`) REFERENCES `people`(`id`)
);

CREATE TABLE `character` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`play_id` INTEGER NOT NULL,
	`actor` INTEGER NOT NULL,
	FOREIGN KEY (`play_id`) REFERENCES `play`(`id`),
	FOREIGN KEY (`actor`) REFERENCES `people`(`id`)
);

CREATE TABLE `act` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`play_id` INTEGER NOT NULL,
	`act_nr` INTEGER NOT NULL,
	`character` INTEGER NOT NULL,
	`actor` INTEGER NOT NULL,
	FOREIGN KEY (`play_id`) REFERENCES `play`(`id`),
	FOREIGN KEY (`character`) REFERENCES `character`(`id`),
	FOREIGN KEY (`actor`) REFERENCES `people`(`id`)
);

CREATE TABLE `speaking_line` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`play_id` INTEGER NOT NULL,
	`line_nr` INTEGER NOT NULL,
	`speaker` INTEGER NOT NULL,
	`actor` INTEGER NOT NULL,
	FOREIGN KEY (`play_id`) REFERENCES `play`(`id`),
	FOREIGN KEY (`speaker`) REFERENCES `character`(`id`),
	FOREIGN KEY (`actor`) REFERENCES `people`(`id`)
);

