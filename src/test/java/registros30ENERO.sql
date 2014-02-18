-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-01-2014 a las 20:21:53
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `registros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
  `idfacultad` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`idfacultad`, `nombre`) VALUES
(1, 'FACULTAD DE CIENCIAS HUMANAS                                          '),
(2, 'FACULTAD DE CIENCIAS SOCIALES Y EDUCACION                             '),
(3, 'FACULTAD DE MEDICINA                                                  '),
(4, 'FACULTAD DE ODONTOLOGÍA                                               '),
(5, 'FACULTAD DE INGENIERÍA                                                '),
(6, 'FACULTAD DE DERECHO Y CIENCIAS POLITICAS                              '),
(7, 'FACULTAD DE CIENCIAS FARMACEUTICAS                                    '),
(8, 'FACULTAD DE ENFERMERIA                                                '),
(9, 'FACULTAD DE CIENCIAS ECONOMICAS                                       '),
(16, 'FACULTAD DE CIENCIAS EXACTAS Y NATURALES                              '),
(25, 'ESCUELA DE EDUCACIÓN PARA EL TRABAJO Y EL DESARROLLO HUMANO           '),
(26, 'VICERRECTORIA DE INVESTIGACIONES                                      '),
(35, 'INSTITUTO DE POLITICAS PUBLICAS REGIONALES Y DE GOBIERNO              '),
(36, 'INSTITUTO DE MATEMATICAS APLICADA                                     '),
(37, 'INSTITUTO DE INVESTIGACIONES INMUNOLOGICAS                            '),
(38, 'FACULTAD DE CIENCIAS FARMACEUTICAS  - INSTITUTO DE INMUNOLOGIA        '),
(59, 'CENTRO DE CAPACITACIÓN Y ASESORIA ACADÉMICA                           '),
(60, 'DOCTORADO EN CIENCIAS DE LA EDUCACIÓN CADE UNIVERSIDAD DE CARTAGENA   '),
(97, 'CENTRO DE INNOVACION Y ESTUDIOS VIRTUALES                             '),
(98, 'CURSOS DE INGLÉS                                                      '),
(99, 'CURSOS VIRTUALES                                                      ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `idprograma` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `modalidad` varchar(255) DEFAULT NULL,
  `tipo_formacion` varchar(255) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`),
  KEY `fk_programa_facultad` (`facultad_idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`idprograma`, `nombre`, `modalidad`, `tipo_formacion`, `facultad_idfacultad`) VALUES
(1, 'Tecnología en Metrología Industrial.', 'Presencial', 'Pregrado', 5),
(2, 'Tecnología en Procesamiento y Conservación de Productos Acuícolas y pesqueras', 'Distancia', 'Pregrado', 16),
(3, 'Tecnología en Supervisión de Procesos Productivos y Acuícolas', 'Distancia', 'Pregrado', 16),
(11, 'Ingeniería de Alimentos', 'Presencial', 'Pregrado', 5),
(12, 'Administración Servicio de Salud', 'Distancia', 'Pregrado', 8),
(19, 'Química', 'Presencial', 'Pregrado', 16),
(20, 'Matemáticas', 'Presencial', 'Pregrado', 16),
(21, 'Ingeniería Civil', 'Presencial', 'Pregrado', 5),
(22, 'Ingeniería de Sistemas', 'Presencial', 'Pregrado', 5),
(23, 'Ingeniería Química', 'Presencial', 'Pregrado', 5),
(39, 'Comunicación Social', 'Presencial', 'Pregrado', 2),
(41, 'Derecho', 'Presencial', 'Pregrado', 6),
(42, 'Trabajo Social', 'Presencial', 'Pregrado', 2),
(43, 'Economía', 'Presencial', 'Pregrado', 9),
(44, 'Administración de Empresas', 'Presencial', 'Pregrado', 9),
(46, 'Filosofía', 'Presencial', 'Pregrado', 1),
(47, 'Lingüística y Literatura', 'Presencial', 'Pregrado', 1),
(48, 'Historia', 'Presencial', 'Pregrado', 1),
(49, 'Administración Industrial', 'Presencial', 'Pregrado', 9),
(50, 'Contaduría Pública', 'Presencial', 'Pregrado', 9),
(51, 'Medicina', 'Presencial', 'Pregrado', 3),
(52, 'Odontologia', 'Presencial', 'Pregrado', 4),
(53, 'Química Farmacéutica', 'Presencial', 'Pregrado', 7),
(54, 'Enfermería', 'Presencial', 'Pregrado', 8),
(109, 'Especialización en Gestión de la Calidad y Auditoria de Salud', 'Presencial', 'Postgrado', 9),
(110, 'Especializacion en Finanzas', 'Presencial', 'Postgrado', 9),
(111, 'Especialización en Gerencia en Salud', 'Presencial', 'Postgrado', 9),
(112, 'Especialización en Gestión Gerencial', 'Presencial', 'Postgrado', 9),
(114, 'Especialización en Revisoría Fiscal', 'Presencial', 'Postgrado', 9),
(120, 'Especialización en Salud Ocupacional', 'Presencial', 'Postgrado', 8),
(121, 'Especialización en Enfermería Familiar y Comunitaria', 'Presencial', 'Postgrado', 8),
(122, 'Doctorado en Ciencias de la Educación', 'Presencial', 'Postgrado', 60),
(123, 'Especialización en Ortodoncia', 'Presencial', 'Postgrado', 4),
(124, 'Especialización en Endodoncia', 'Presencial', 'Postgrado', 4),
(125, 'Especialización en Estomatología y Cirugía Oral', 'Presencial', 'Postgrado', 4),
(127, 'Maestría Química', 'Presencial', 'Postgrado', 16),
(129, 'Maestría en Ciencias Farmacéuticas', 'Presencial', 'Postgrado', 7),
(135, 'Maestría en Ciencias Ambientales', 'Presencial', 'Postgrado', 7),
(136, 'Especialización en Ingeniería de Vías Terrestres', 'Presencial', 'Postgrado', 5),
(138, 'Maestría en Educación', 'Presencial', 'Postgrado', 2),
(140, 'Maestría en Ciencias Físicas', 'Presencial', 'Postgrado', 16),
(145, 'Especialización en Seguridad Social', 'Presencial', 'Postgrado', 6),
(147, 'Especialización en Odontopediatría y Ortopedia Maxilar', 'Presencial', 'Postgrado', 4),
(148, 'Maestría en Ingeniería Ambiental', 'Presencial', 'Postgrado', 5),
(150, 'Especialización en Matemáticas Avanzadas', 'Presencial', 'Postgrado', 16),
(151, 'Especialización en Gineco-Obstetricia', 'Presencial', 'Postgrado', 3),
(152, 'Especialización en Cirugía General', 'Presencial', 'Postgrado', 3),
(153, 'Especialización en Anestesiología y Reanimación', 'Presencial', 'Postgrado', 3),
(154, 'Especialización en Medicina Interna', 'Presencial', 'Postgrado', 3),
(156, 'Especialización en Ortopedia y Traumatología', 'Presencial', 'Postgrado', 3),
(157, 'Especialización en Otorrinolaringología', 'Presencial', 'Postgrado', 3),
(158, 'Especialización en Patología', 'Presencial', 'Postgrado', 3),
(159, 'Especialización en Pediatría', 'Presencial', 'Postgrado', 3),
(160, 'Especialización en Urología', 'Presencial', 'Postgrado', 3),
(161, 'Especialización en Radiología', 'Presencial', 'Postgrado', 3),
(162, 'Especialización en Ciencias Penales y Criminologías', 'Presencial', 'Postgrado', 6),
(165, 'Especialización en Neurocirugía', 'Presencial', 'Postgrado', 3),
(166, 'Especialización en Ingeniería Sanitaria y Ambiental', 'Presencial', 'Postgrado', 5),
(167, 'Especialización en Psiquiatría', 'Presencial', 'Postgrado', 3),
(168, 'Maestría en Farmacología', 'Presencial', 'Postgrado', 3),
(170, 'Maestría en Inmunología', 'Presencial', 'Postgrado', 3),
(171, 'Maestría en Matemáticas', 'Presencial', 'Postgrado', 16),
(174, 'Especialización en Estructuras', 'Presencial', 'Postgrado', 5),
(177, 'Maestría en Microbiología', 'Presencial', 'Postgrado', 3),
(179, 'Doctorado en Medicina Tropical', 'Presencial', 'Postgrado', 3),
(181, 'Técnico Profesional en Operación Turística', 'Distancia', 'Pregrado', 9),
(182, 'Tecnología en Gestión Turística', 'Distancia', 'Pregrado', 9),
(183, 'Especialización en Cuidado al Adulto y Niños en Estado Critico de Salud', 'Presencial', 'Postgrado', 8),
(185, 'Especialización en Conciliación Arbitraje y Resolución de', 'Presencial', 'Postgrado', 6),
(190, 'Maestría en Conflicto Social y Construcción de Paz', 'Presencial', 'Postgrado', 2),
(202, 'Técnico Profesional en Procesos de Gestión Pública', 'Distancia', 'Pregrado', 9),
(203, 'Tecnología en Gestión Pública', 'Distancia', 'Pregrado', 9),
(204, 'Administración Pública', 'Distancia', 'Pregrado', 9),
(205, 'Administración Financiera', 'Distancia', 'Pregrado', 9),
(229, 'Doctorado en Ciencias Biomédicas', 'Presencial', 'Postgrado', 3),
(263, 'Especialización en Gerencia de Proyectos de Construcción', 'Presencial', 'Postgrado', 5),
(414, 'Administración de Empresas', 'Distancia', 'Pregrado', 9),
(415, 'Ingeniería de Sistemas', 'Distancia', 'Pregrado', 5),
(418, 'Tecnología en Gestión de la Producción Agrícola Ecológica', 'Distancia', 'Pregrado', 16),
(662, 'Biología ', 'Presencial', 'Pregrado', 16),
(665, 'Técnico Profesional en Guianza y Servicios Recreativos', 'Distancia', 'Pregrado', 9),
(666, 'Técnico Profesional en Servicios Gastronómico', 'Distancia', 'Pregrado', 9),
(672, 'Maestría en Bioquímica', 'Presencial', 'Postgrado', 3),
(678, 'Tecnología en Servicio a Bordo', 'Distancia', 'Pregrado', 9),
(679, 'Tecnología en Gestión Hotelera', 'Distancia', 'Pregrado', 9),
(684, 'Doctorado en Ciencias Fisicas', 'Presencial', 'Postgrado', 16),
(685, 'Doctorado en Toxicología Ambiental', 'Presencial', 'Postgrado', 3),
(686, 'Doctorado en Ciencias', 'Presencial', 'Postgrado', 16),
(694, 'Técnico Profesional en Procesamiento de Concentrados para peces especiales y menores', 'Distancia', 'Pregrado', 16),
(695, 'Técnico Profesional en Procesamientos de Productos Acuícolas  y pesquera', 'Distancia', 'Pregrado', 16),
(696, 'Técnica Profesional en Producción Acuícola', 'Distancia', 'Pregrado', 9),
(697, 'Técnica Profesional en Procesos Metrólogicos.', 'Presencial', 'Pregrado', 5),
(707, 'Maestría Enfermería con énfasis en cuidado a las personas', 'Distancia', 'Postgrado', 8),
(709, 'Técnica Profesional en Producción Agrícola Ecológica', 'Distancia', 'Pregrado', 16),
(718, 'Administración Turística y Hotelera', 'Distancia', 'Pregrado', 9),
(727, 'Profesional  Universitario en Lenguas Extranjeras ', 'Presencial', 'Pregrado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `resolucion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_registro_programa1` (`programa_idprograma`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`idregistro`, `resolucion`, `fecha_inicio`, `fecha_vencimiento`, `duracion`, `programa_idprograma`) VALUES
(1, '4508 de 10 de agosto de 2006', '2006-08-10', '2013-08-10', 7, 44),
(2, '8934 de 13 octubre de 2011', '2011-10-13', '2018-10-13', 7, 49),
(3, '1849 de 24 febrero de 2012', '2012-02-24', '2019-02-24', 7, 50),
(4, '1721 de 21 de febrero de 2013', '2013-02-21', '2020-02-21', 7, 43),
(5, '4224 de 27 de mayo de 2010', '2010-05-27', '2017-05-27', 7, 662),
(6, '5458 de 18 de mayo de 2012', '2012-05-18', '2019-05-18', 7, 20),
(7, '10985 de 11 septiembre 2012', '2012-09-11', '2019-09-11', 7, 19),
(8, '10995 de 11 de septiembre de 2012', '2012-09-11', '2019-09-11', 7, 53),
(9, '7829 de 4 diciembre 2006', '2006-12-04', '2013-12-04', 7, 46),
(10, '12928 de 10 octubre 2012', '2012-10-10', '2019-10-10', 7, 48),
(11, '10736 de 6 septiembre 2012', '2012-09-06', '2019-09-06', 7, 47),
(12, '17173 de 27 de diciembre de 2012', '2012-12-27', '2019-12-27', 7, 727),
(13, '12793 28 de diciembre de 2010', '2010-12-28', '2017-12-28', 7, 39),
(14, '7064 de 10 de noviembre de 2006', '2006-11-10', '2013-11-10', 7, 42),
(15, '16107 de 14 de noviembre de 2013', '2013-11-14', '2020-11-14', 7, 41),
(16, '7328 de 19 de agosto de 2010', '2010-08-19', '2017-08-19', 7, 54),
(17, '425 de enero de 2013', '2013-01-01', '2020-01-01', 7, 21),
(18, '1264 de 21 de febrero de 2011', '2011-02-21', '2018-02-21', 7, 11),
(19, '9223 de 18 de octubre 2011', '2011-10-18', '2018-10-18', 7, 22),
(20, '12471 de 29 diciembre de 2011', '2011-12-29', '2018-12-29', 7, 23),
(21, '10609 de 23 de diciembre de 2009', '2009-12-23', '2016-12-23', 7, 51),
(22, '14813 de 16 de noviembre de 2012', '2012-11-16', '2019-11-16', 7, 52),
(23, '5470 de 2 de julio de 2010', '2010-07-02', '2017-07-02', 7, 697),
(24, '5469 de 2 de julio de 2010', '2010-07-02', '2017-07-02', 7, 1),
(25, '4244 de 30 de junio de 2009', '2009-07-30', '2009-07-30', 7, 414),
(26, '2379 de 30 de abril de 2009', '2009-04-30', '2009-04-30', 7, 205),
(27, '1367 de 17 de marzo de 2009', '2009-03-17', '2016-03-17', 7, 204),
(28, '8450 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', 7, 718),
(29, '4757 de 15 de julio de 2009', '2009-07-15', '2016-07-15', 7, 415),
(30, '1589 de 17 de abril de 2006', '2006-04-17', '2013-04-17', 7, 12),
(31, '3080 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', 7, 696),
(32, '2714 de 12 de mayo de 2009', '2009-05-12', '2016-05-12', 7, 709),
(33, '8451 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', 7, 665),
(34, '1059 de 3 marzo de 2009', '2009-03-03', '2016-03-03', 7, 181),
(35, '3078 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', 7, 694),
(36, '3077 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', 7, 695),
(37, '1363 de 17 marzo de 2009', '2009-03-17', '2016-03-17', 7, 202),
(38, '8448 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', 7, 666),
(39, '2715 de 12 de mayo de 2009', '2009-05-12', '2016-05-12', 7, 418),
(40, '8449 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', 7, 679),
(41, '1058 de 3 de marzo de 2009', '2009-03-03', '2016-03-03', 7, 182),
(42, '1366 de 17 de marzo de 2009', '2009-03-17', '2016-03-17', 7, 203),
(43, '3079 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', 7, 2),
(44, '8452 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', 7, 678),
(45, '3081 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', 7, 3),
(46, 'Resolución 157 de 15 enero de 2013', '2013-01-15', '2020-01-15', 7, 110),
(47, '3040 de 21 de junio 2007', '2007-06-21', '2014-06-21', 7, 111),
(48, '3385 de 20 de junio de 2007', '2007-06-20', '2014-06-20', 7, 109),
(49, '8954 de 15 de julio 2013', '2013-07-15', '2020-07-15', 7, 112),
(50, '3384 de 20 de junio de 2007', '2014-01-01', '2014-01-23', 7, 114),
(51, '17157 de diciembre de 2012', '2012-12-01', '2019-12-01', 7, 150),
(52, '2474 de 14 de mayo de 2007', '2007-05-14', '2014-05-14', 7, 162),
(53, '7208 de 17 de noviembre de 2006', '2006-11-17', '2013-11-17', 7, 185),
(54, '6932 de 13 de noviembre de 2007', '2007-11-13', '2014-11-13', 7, 145),
(55, '2813 de 14 de mayo de 2009', '2014-01-02', '2014-01-23', 5, 183),
(56, '8457 de 23 julio de 2012', '2012-07-23', '2019-07-23', 7, 121),
(57, '4030 de 27 de junio de 2008', '2008-06-27', '2014-01-22', 7, 120),
(60, '8289 de 28 de junio de 2013', '2013-06-28', '2020-06-28', 7, 136),
(61, '4906 de 24 de agosto de 2006', '2006-08-24', '2013-08-24', 7, 166),
(62, '1392 de 9 marzo de 2010', '2010-03-09', '2015-03-09', 5, 153),
(63, '4058 de 24 de julio de 2006', '2006-07-24', '2013-07-24', 7, 152),
(64, '346 de 31 de enero de 2007', '2007-01-31', '2014-01-31', 7, 151),
(65, '6838 de 3 de noviembre de 2006', '2006-11-03', '2013-11-03', 7, 154),
(66, '347 de 31 de enero de 2007', '2007-01-31', '2014-01-31', 7, 165),
(67, '4070 de 24 de julio de 2006', '2006-07-24', '2013-07-24', 7, 156),
(68, '1357 de 23 de diciembre de 2009', '2009-12-23', '2014-12-23', 5, 157),
(69, '10608 de 23 de diciembre de 2009', '2009-12-23', '2014-12-23', 5, 159),
(70, '4071 de 24 de julio de 2006', '2006-07-24', '2013-07-24', 7, 167),
(71, '6249 de 12 de octubre de 2006', '2006-10-12', '2013-10-12', 7, 161),
(72, '4059 de 24 de julio de 2006', '2006-07-24', '2013-07-24', 7, 160),
(73, '1763 de 10 abril de 2007', '2007-04-10', '2014-04-10', 7, 158),
(74, '6512 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', 7, 124),
(75, '152 de 18 de enero de 2007', '2007-01-18', '2014-01-18', 7, 125),
(76, '6510 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', 7, 147),
(77, '6511 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', 7, 123),
(78, '2374 de 7 de marzo de 2013', '2013-03-07', '2020-03-07', 7, 140),
(79, '2490 de 6 mayo de 2009', '2009-05-06', '2016-05-06', 7, 171),
(80, '9955 de 22 agosto de 2012', '2012-08-22', '2019-08-22', 7, 127),
(81, '2581 de 14 de marzo de 2013', '2013-03-14', '2020-03-14', 7, 135),
(82, '6024 de 20 de mayo de 2013', '2013-05-20', '2020-05-20', 7, 129),
(83, '1301 del 12 de febrero de 2013', '2013-02-12', '2020-02-12', 7, 138),
(84, '4848 de 30 de abril de 2013', '2013-04-30', '2020-04-30', 7, 190),
(85, '10645 de 22 de noviembre 2011', '2011-11-22', '2018-11-22', 7, 707),
(86, '7844 de 26 de octubre de 2009', '2009-10-26', '2016-10-26', 7, 148),
(87, '10191 de 22 de noviembre de 2010', '2010-11-22', '2017-11-22', 7, 672),
(88, '3126 de 16 de junio de 2006', '2006-06-16', '2013-06-16', 7, 168),
(89, '3000 de 22 de mayo de 2008', '2008-05-22', '2015-05-22', 7, 170),
(90, '1555 de 20 marzo de 2009', '2009-03-20', '2016-03-20', 7, 177),
(91, '4950 de 16 de junio 2011', '2011-06-16', '2018-06-16', 7, 686),
(92, '1253 de 21 de febrero de 2011', '2011-02-21', '2018-02-21', 7, 684),
(93, '8293 de 28 de diciembre de 2007', '2007-12-28', '2014-12-28', 7, 229),
(94, '4200 de 30 de junio de 2009', '2009-06-30', '2016-06-30', 7, 179),
(95, '1563 de 28 de febrero de 2011', '2011-02-28', '2018-02-28', 7, 685),
(96, '1566 de 28 de febrero 2011', '2011-02-28', '2018-02-28', 7, 122);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `fk_programa_facultad` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_registro_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
