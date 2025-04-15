-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.4.22-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных task_sequencer
DROP DATABASE IF EXISTS `task_sequencer`;
CREATE DATABASE IF NOT EXISTS `task_sequencer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `task_sequencer`;

-- Дамп структуры для таблица task_sequencer.application
DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `application_type` int(11) DEFAULT NULL,
  `relevance` int(11) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `declined` tinyint(4) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `worked_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `cabinet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_type` (`application_type`),
  KEY `device_type` (`device_type`),
  KEY `worked_by` (`worked_by`),
  KEY `created_by` (`created_by`),
  KEY `cabinet` (`cabinet`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`application_type`) REFERENCES `applicationtype` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`device_type`) REFERENCES `devicetype` (`id`),
  CONSTRAINT `application_ibfk_3` FOREIGN KEY (`worked_by`) REFERENCES `employe` (`id`),
  CONSTRAINT `application_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `employe` (`id`),
  CONSTRAINT `application_ibfk_5` FOREIGN KEY (`cabinet`) REFERENCES `cabinet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.application: ~2 rows (приблизительно)
DELETE FROM `application`;
INSERT INTO `application` (`id`, `name`, `description`, `application_type`, `relevance`, `device_type`, `creation_date`, `declined`, `reason`, `apply_date`, `completed_date`, `worked_by`, `created_by`, `cabinet`) VALUES
	(13, 'Сломался принтер', 'не печатает, вообще', 1, 5, 2, '2025-04-15', 1, 'Перезагрузил. помогло', NULL, NULL, NULL, 7, 8),
	(14, 'Мышь не работает', 'почему то на экране нет мышки', 1, 5, 4, '2025-04-15', NULL, NULL, '2025-04-15', NULL, 7, 5, 9);

-- Дамп структуры для таблица task_sequencer.applicationtype
DROP TABLE IF EXISTS `applicationtype`;
CREATE TABLE IF NOT EXISTS `applicationtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.applicationtype: ~4 rows (приблизительно)
DELETE FROM `applicationtype`;
INSERT INTO `applicationtype` (`id`, `name`) VALUES
	(1, 'Поломка оборудования'),
	(2, 'IT-помошь'),
	(3, 'Интернет поломка'),
	(4, 'Что то не понятное');

-- Дамп структуры для таблица task_sequencer.cabinet
DROP TABLE IF EXISTS `cabinet`;
CREATE TABLE IF NOT EXISTS `cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.cabinet: ~11 rows (приблизительно)
DELETE FROM `cabinet`;
INSERT INTO `cabinet` (`id`, `name`) VALUES
	(8, 'Кабинет Руководителя (В101)'),
	(9, 'Кабинет методистов 1 (В303)'),
	(10, 'Кабинет методистов 2 (В304)'),
	(11, 'Лекторий'),
	(12, 'Конферент зал'),
	(13, 'Медиазона'),
	(14, 'Трансфомер 1'),
	(15, 'Трансфомер 2'),
	(16, 'Трансфомер 3'),
	(17, 'Администратор (ХОЛЛ)'),
	(18, 'Коворкинг');

-- Дамп структуры для таблица task_sequencer.devicetype
DROP TABLE IF EXISTS `devicetype`;
CREATE TABLE IF NOT EXISTS `devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.devicetype: ~41 rows (приблизительно)
DELETE FROM `devicetype`;
INSERT INTO `devicetype` (`id`, `name`) VALUES
	(2, 'МФУ Pantum PJ823'),
	(3, 'МФУ Kyocera FS1125'),
	(4, 'Мышка Logitech'),
	(5, 'Принтер HP LaserJet P1102'),
	(6, 'Монитор Samsung Odyssey G7'),
	(7, 'Клавиатура Corsair K95'),
	(8, 'Наушники Sony WH-1000XM4'),
	(9, 'Флешка Kingston DataTraveler'),
	(10, 'Сканер Epson Perfection V600'),
	(11, 'Веб-камера Logitech C920'),
	(12, 'Куллер Noctua NH-D15'),
	(13, 'Сетевой фильтр APC P11VNT3'),
	(14, 'Микрофон Blue Yeti'),
	(15, 'Роутер TP-Link Archer C7'),
	(16, 'Проектор Epson EH-TW7100'),
	(17, 'Графический планшет Wacom Intuos Pro'),
	(18, 'Носимая камера GoPro Hero9'),
	(19, 'Электрический чайник Philips HD9334'),
	(20, 'Смарт-часы Apple Watch Series 6'),
	(21, 'Смартфон Samsung Galaxy S21'),
	(22, 'Игровая консоль PlayStation 5'),
	(23, 'Сетевой накопитель Synology DS220+'),
	(24, 'Телевизор LG OLED55CX'),
	(25, 'Микроволновая печь Panasonic NN-GD371'),
	(26, 'Джойстик Xbox Series X'),
	(27, 'Принтер Canon PIXMA TS5050'),
	(28, 'Беспроводная колонка JBL Flip 5'),
	(29, 'Смартфон Xiaomi Redmi Note 10'),
	(30, 'Планшет Apple iPad Pro 12.9'),
	(31, 'Система умного дома Google Nest Hub'),
	(32, 'Компьютерный стол IKEA Micke'),
	(33, 'Фотоаппарат Nikon D7500'),
	(34, 'Чистящий робот iRobot Roomba 981'),
	(35, 'Газовая плита Gorenje EC5351'),
	(36, 'Портативная зарядка Anker PowerCore'),
	(37, 'Процессор Intel Core i9-11900K'),
	(38, 'Игровая мышь Razer DeathAdder V2'),
	(39, 'Монитор Dell UltraSharp U2720Q'),
	(40, 'Портативный жесткий диск Seagate Backup Plus'),
	(41, 'Фотоаппарат Canon EOS 90D'),
	(42, 'Робот-пылесос Xiaomi Mi Roborock S5');

-- Дамп структуры для таблица task_sequencer.employe
DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employe_type` int(11) DEFAULT NULL,
  `cabinet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employe_type` (`employe_type`),
  KEY `cabinet` (`cabinet`),
  CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`employe_type`) REFERENCES `employetype` (`id`),
  CONSTRAINT `employe_ibfk_2` FOREIGN KEY (`cabinet`) REFERENCES `cabinet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.employe: ~3 rows (приблизительно)
DELETE FROM `employe`;
INSERT INTO `employe` (`id`, `firstname`, `lastname`, `surname`, `password`, `email`, `employe_type`, `cabinet`) VALUES
	(4, 'Павел', 'Ремнев', 'Павлович', '123123123', 'me@xenix19.ru', 2, 18),
	(5, 'Кристина', 'Примакова', 'Викторовна', '123123123', 'kris@mail.ru', 3, 10),
	(7, 'Надежда', 'Дьянченко', 'Сергеевна', '123123123', 'dyanchenko@mail.ru', 1, 8);

-- Дамп структуры для таблица task_sequencer.employetype
DROP TABLE IF EXISTS `employetype`;
CREATE TABLE IF NOT EXISTS `employetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы task_sequencer.employetype: ~3 rows (приблизительно)
DELETE FROM `employetype`;
INSERT INTO `employetype` (`id`, `name`, `access`) VALUES
	(1, 'Руководитель', 1000),
	(2, 'Системный администратор', 100),
	(3, 'Сотрудник', 10);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
