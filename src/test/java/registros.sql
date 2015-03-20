/*
Navicat MySQL Data Transfer

Source Server         : sapprivada
Source Server Version : 50528
Source Host           : 192.168.8.2:3307
Source Database       : registros

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-03-20 14:16:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acreditacion
-- ----------------------------
DROP TABLE IF EXISTS `acreditacion`;
CREATE TABLE `acreditacion` (
  `idacreditacion` int(11) NOT NULL AUTO_INCREMENT,
  `resolucion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `inicio_uno` date DEFAULT NULL,
  `fina_uno` date DEFAULT NULL,
  `inicio_dos` date DEFAULT NULL,
  `fina_dos` date DEFAULT NULL,
  `presentacion_auto` date DEFAULT NULL,
  `radicacion` date DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idacreditacion`),
  KEY `fk_acreditacion_programa1` (`programa_idprograma`),
  CONSTRAINT `fk_acreditacion_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acreditacion
-- ----------------------------
INSERT INTO `acreditacion` VALUES ('1', '10244 de 22 de Noviembre de 2010', '2010-11-22', '2016-11-22', '6', '2014-02-01', null, null, null, null, null, '54');
INSERT INTO `acreditacion` VALUES ('2', '6812 del 6 de agosto de 2010', '2010-08-06', '2016-08-06', '6', '2013-08-01', null, null, null, null, null, '51');
INSERT INTO `acreditacion` VALUES ('3', '7049 del 29 de septiembre de 2009', '2009-09-29', '2015-09-29', '6', '2014-07-01', '2014-10-24', null, null, null, null, '53');
INSERT INTO `acreditacion` VALUES ('4', '9455 del 30 de noviembre de 2009', '2009-11-30', '2015-11-30', '6', null, null, null, null, null, null, '42');
INSERT INTO `acreditacion` VALUES ('5', '2034 del 24 de marzo de 2010', '2010-03-24', '2014-03-24', '4', '2013-06-24', '2013-09-02', '2014-04-01', null, '2014-03-20', '2014-04-20', '49');
INSERT INTO `acreditacion` VALUES ('6', '4421 del 3 junio de 2010', '2010-06-03', '2014-06-03', '4', '2013-10-23', '2013-12-20', null, null, '2014-01-20', '2014-03-20', '41');
INSERT INTO `acreditacion` VALUES ('7', '7735 del 6 de septiembre de 2010', '2010-09-06', '2014-09-06', '4', '2013-10-22', '2014-05-21', null, null, null, null, '43');
INSERT INTO `acreditacion` VALUES ('8', '2502 del 30 de marzo de 2011', '2011-03-30', '2017-03-30', '6', null, null, null, null, null, null, '21');
INSERT INTO `acreditacion` VALUES ('9', '2503 del 30 de marzo de 2011', '2011-03-30', '2015-03-30', '4', '2013-08-01', '2014-10-01', null, null, null, null, '44');
INSERT INTO `acreditacion` VALUES ('10', '2404 del 30 de Marzo de 2011', '2011-03-30', '2015-03-30', '4', '2013-08-01', null, null, null, null, null, '50');
INSERT INTO `acreditacion` VALUES ('11', '6028 del 1 de junio de 2012', '2012-06-01', '2018-06-01', '6', null, null, null, null, null, null, '47');
INSERT INTO `acreditacion` VALUES ('12', '10754 del 6 de septiembre de 2012', '2012-09-06', '2016-09-06', '4', null, null, null, null, null, null, '48');
INSERT INTO `acreditacion` VALUES ('13', '7450 del 5 de julio de 2012', '2012-07-05', '2018-07-05', '6', null, null, null, null, null, null, '52');
INSERT INTO `acreditacion` VALUES ('14', '00586 de 9 de Enero del 2015', '2015-01-09', '2021-01-09', '6', null, null, null, null, null, null, '49');

-- ----------------------------
-- Table structure for facultad
-- ----------------------------
DROP TABLE IF EXISTS `facultad`;
CREATE TABLE `facultad` (
  `idfacultad` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES ('1', 'FACULTAD DE CIENCIAS HUMANAS');
INSERT INTO `facultad` VALUES ('2', 'FACULTAD DE CIENCIAS SOCIALES Y EDUCACION                             ');
INSERT INTO `facultad` VALUES ('3', 'FACULTAD DE MEDICINA                                                  ');
INSERT INTO `facultad` VALUES ('4', 'FACULTAD DE ODONTOLOGÍA                                               ');
INSERT INTO `facultad` VALUES ('5', 'FACULTAD DE INGENIERÍA                                                ');
INSERT INTO `facultad` VALUES ('6', 'FACULTAD DE DERECHO Y CIENCIAS POLITICAS                              ');
INSERT INTO `facultad` VALUES ('7', 'FACULTAD DE CIENCIAS FARMACEUTICAS                                    ');
INSERT INTO `facultad` VALUES ('8', 'FACULTAD DE ENFERMERIA                                                ');
INSERT INTO `facultad` VALUES ('9', 'FACULTAD DE CIENCIAS ECONOMICAS                                       ');
INSERT INTO `facultad` VALUES ('16', 'FACULTAD DE CIENCIAS EXACTAS Y NATURALES                              ');
INSERT INTO `facultad` VALUES ('25', 'ESCUELA DE EDUCACIÓN PARA EL TRABAJO Y EL DESARROLLO HUMANO           ');
INSERT INTO `facultad` VALUES ('26', 'VICERRECTORIA DE INVESTIGACIONES                                      ');
INSERT INTO `facultad` VALUES ('35', 'INSTITUTO DE POLITICAS PUBLICAS REGIONALES Y DE GOBIERNO              ');
INSERT INTO `facultad` VALUES ('36', 'INSTITUTO DE MATEMATICAS APLICADA                                     ');
INSERT INTO `facultad` VALUES ('37', 'INSTITUTO DE INVESTIGACIONES INMUNOLOGICAS                            ');
INSERT INTO `facultad` VALUES ('38', 'FACULTAD DE CIENCIAS FARMACEUTICAS  - INSTITUTO DE INMUNOLOGIA        ');
INSERT INTO `facultad` VALUES ('59', 'CENTRO DE CAPACITACIÓN Y ASESORIA ACADÉMICA                           ');
INSERT INTO `facultad` VALUES ('60', 'DOCTORADO EN CIENCIAS DE LA EDUCACIÓN CADE UNIVERSIDAD DE CARTAGENA   ');
INSERT INTO `facultad` VALUES ('97', 'CENTRO DE INNOVACION Y ESTUDIOS VIRTUALES                             ');
INSERT INTO `facultad` VALUES ('98', 'CURSOS DE INGLÉS                                                      ');
INSERT INTO `facultad` VALUES ('99', 'CURSOS VIRTUALES                                                      ');
INSERT INTO `facultad` VALUES ('100', 'fac ing 2');
INSERT INTO `facultad` VALUES ('101', 'ing 2');
INSERT INTO `facultad` VALUES ('102', 'fac1');

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `idprograma` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `modalidad` varchar(255) DEFAULT NULL,
  `tipo_formacion` varchar(255) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`),
  KEY `fk_programa_facultad` (`facultad_idfacultad`),
  CONSTRAINT `fk_programa_facultad` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('1', 'Tecnología en Metrología Industrial.', 'Presencial', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('2', 'Tecnología en Procesamiento y Conservación de Productos Acuícolas y pesqueras', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('3', 'Tecnología en Supervisión de Procesos Productivos y Acuícolas', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('11', 'Ingeniería de Alimentos', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('12', 'Administración Servicio de Salud', 'Distancia', 'Pregrado', '8');
INSERT INTO `programa` VALUES ('19', 'Química', 'Presencial', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('20', 'Matemáticas', 'Presencial', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('21', 'Ingeniería Civil', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('22', 'Ingeniería de Sistemas', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('23', 'Ingeniería Química', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('39', 'Comunicación Social', 'Presencial', 'Pregrado', '2');
INSERT INTO `programa` VALUES ('41', 'Derecho', 'Presencial', 'Pregrado', '6');
INSERT INTO `programa` VALUES ('42', 'Trabajo Social', 'Presencial', 'Pregrado', '2');
INSERT INTO `programa` VALUES ('43', 'Economía', 'Presencial', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('44', 'Administración de Empresas', 'Presencial', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('46', 'Filosofía', 'Presencial', 'Pregrado', '1');
INSERT INTO `programa` VALUES ('47', 'Lingüística y Literatura', 'Presencial', 'Pregrado', '1');
INSERT INTO `programa` VALUES ('48', 'Historia', 'Presencial', 'Pregrado', '1');
INSERT INTO `programa` VALUES ('49', 'Administración Industrial', 'Presencial', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('50', 'Contaduría Pública', 'Presencial', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('51', 'Medicina', 'Presencial', 'Pregrado', '3');
INSERT INTO `programa` VALUES ('52', 'Odontologia', 'Presencial', 'Pregrado', '4');
INSERT INTO `programa` VALUES ('53', 'Química Farmacéutica', 'Presencial', 'Pregrado', '7');
INSERT INTO `programa` VALUES ('54', 'Enfermería', 'Presencial', 'Pregrado', '8');
INSERT INTO `programa` VALUES ('109', 'Especialización en Gestión de la Calidad y Auditoria de Salud', 'Presencial', 'Postgrado', '9');
INSERT INTO `programa` VALUES ('110', 'Especializacion en Finanzas', 'Presencial', 'Postgrado', '9');
INSERT INTO `programa` VALUES ('111', 'Especialización en Gerencia en Salud', 'Presencial', 'Postgrado', '9');
INSERT INTO `programa` VALUES ('112', 'Especialización en Gestión Gerencial', 'Presencial', 'Postgrado', '9');
INSERT INTO `programa` VALUES ('114', 'Especialización en Revisoría Fiscal', 'Presencial', 'Postgrado', '9');
INSERT INTO `programa` VALUES ('120', 'Especialización en Salud Ocupacional', 'Presencial', 'Postgrado', '8');
INSERT INTO `programa` VALUES ('121', 'Especialización en Enfermería Familiar y Comunitaria', 'Presencial', 'Postgrado', '8');
INSERT INTO `programa` VALUES ('122', 'Doctorado en Ciencias de la Educación', 'Presencial', 'Postgrado', '60');
INSERT INTO `programa` VALUES ('123', 'Especialización en Ortodoncia', 'Presencial', 'Postgrado', '4');
INSERT INTO `programa` VALUES ('124', 'Especialización en Endodoncia', 'Presencial', 'Postgrado', '4');
INSERT INTO `programa` VALUES ('125', 'Especialización en Estomatología y Cirugía Oral', 'Presencial', 'Postgrado', '4');
INSERT INTO `programa` VALUES ('127', 'Maestría Química', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('129', 'Maestría en Ciencias Farmacéuticas', 'Presencial', 'Postgrado', '7');
INSERT INTO `programa` VALUES ('135', 'Maestría en Ciencias Ambientales', 'Presencial', 'Postgrado', '7');
INSERT INTO `programa` VALUES ('136', 'Especialización en Ingeniería de Vías Terrestres', 'Presencial', 'Postgrado', '5');
INSERT INTO `programa` VALUES ('138', 'Maestría en Educación', 'Presencial', 'Postgrado', '2');
INSERT INTO `programa` VALUES ('140', 'Maestría en Ciencias Físicas', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('145', 'Especialización en Seguridad Social', 'Presencial', 'Postgrado', '6');
INSERT INTO `programa` VALUES ('147', 'Especialización en Odontopediatría y Ortopedia Maxilar', 'Presencial', 'Postgrado', '4');
INSERT INTO `programa` VALUES ('148', 'Maestría en Ingeniería Ambiental', 'Presencial', 'Postgrado', '5');
INSERT INTO `programa` VALUES ('150', 'Especialización en Matemáticas Avanzadas', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('151', 'Especialización en Gineco-Obstetricia', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('152', 'Especialización en Cirugía General', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('153', 'Especialización en Anestesiología y Reanimación', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('154', 'Especialización en Medicina Interna', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('156', 'Especialización en Ortopedia y Traumatología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('157', 'Especialización en Otorrinolaringología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('158', 'Especialización en Patología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('159', 'Especialización en Pediatría', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('160', 'Especialización en Urología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('161', 'Especialización en Radiología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('162', 'Especialización en Ciencias Penales y Criminologías', 'Presencial', 'Postgrado', '6');
INSERT INTO `programa` VALUES ('165', 'Especialización en Neurocirugía', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('166', 'Especialización en Ingenieria de Agua Potable y Saneamiento Basico', 'Presencial', 'Postgrado', '5');
INSERT INTO `programa` VALUES ('167', 'Especialización en Psiquiatría', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('168', 'Maestría en Farmacología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('170', 'Maestría en Inmunología', 'Presencial', 'Postgrado', '37');
INSERT INTO `programa` VALUES ('171', 'Maestría en Matemáticas', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('174', 'Especialización en Estructuras', 'Presencial', 'Postgrado', '5');
INSERT INTO `programa` VALUES ('177', 'Maestría en Microbiología', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('179', 'Doctorado en Medicina Tropical', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('181', 'Técnico Profesional en Operación Turística', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('182', 'Tecnología en Gestión Turística', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('183', 'Especialización en Cuidado al Adulto y Niños en Estado Critico de Salud', 'Presencial', 'Postgrado', '8');
INSERT INTO `programa` VALUES ('185', 'Especialización en Conciliación Arbitraje y Resolución de', 'Presencial', 'Postgrado', '6');
INSERT INTO `programa` VALUES ('190', 'Maestría en Conflicto Social y Construcción de Paz', 'Presencial', 'Postgrado', '2');
INSERT INTO `programa` VALUES ('202', 'Técnico Profesional en Procesos de Gestión Pública', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('203', 'Tecnología en Gestión Pública', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('204', 'Administración Pública', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('205', 'Administración Financiera', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('229', 'Doctorado en Ciencias Biomédicas', 'Presencial', 'Postgrado', '37');
INSERT INTO `programa` VALUES ('263', 'Especialización en Gerencia de Proyectos de Construcción', 'Presencial', 'Postgrado', '5');
INSERT INTO `programa` VALUES ('414', 'Administración de Empresas a Distancia', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('415', 'Ingeniería de Sistemas a Distancia', 'Distancia', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('418', 'Tecnología en Gestión de la Producción Agrícola Ecológica', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('662', 'Biología ', 'Presencial', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('665', 'Técnico Profesional en Guianza y Servicios Recreativos', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('666', 'Técnico Profesional en Servicios Gastronómico', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('672', 'Maestría en Bioquímica', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('678', 'Tecnología en Servicio a Bordo', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('679', 'Tecnología en Gestión Hotelera', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('684', 'Doctorado en Ciencias Fisicas', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('685', 'Doctorado en Toxicología Ambiental', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('686', 'Doctorado en Ciencias', 'Presencial', 'Postgrado', '16');
INSERT INTO `programa` VALUES ('694', 'Técnico Profesional en Procesamiento de Concentrados para peces especiales y menores', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('695', 'Técnico Profesional en Procesamientos de Productos Acuícolas  y pesquera', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('696', 'Técnica Profesional en Producción Acuícola', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('697', 'Técnica Profesional en Procesos Metrólogicos.', 'Presencial', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('707', 'Maestría Enfermería con énfasis en cuidado a las personas', 'Distancia', 'Postgrado', '8');
INSERT INTO `programa` VALUES ('709', 'Técnica Profesional en Producción Agrícola Ecológica', 'Distancia', 'Pregrado', '16');
INSERT INTO `programa` VALUES ('718', 'Administración Turística y Hotelera', 'Distancia', 'Pregrado', '9');
INSERT INTO `programa` VALUES ('727', 'Profesional  Universitario en Lenguas Extranjeras ', 'Presencial', 'Pregrado', '1');
INSERT INTO `programa` VALUES ('750', 'Tecnología en Procesos Industriales', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('751', 'Maestría en derecho', 'Presencial', 'Postgrado', '6');
INSERT INTO `programa` VALUES ('752', 'Técnica Profesional en Operación de Procesos Petroquimicos', 'Presencial', 'Pregrado', '5');
INSERT INTO `programa` VALUES ('753', 'Maestria en Toxicologia', 'Presencial', 'Postgrado', '3');
INSERT INTO `programa` VALUES ('754', 'Doctorado en Ingenieria', 'Presencial', 'Postgrado', '5');

-- ----------------------------
-- Table structure for registro
-- ----------------------------
DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `resolucion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `inicio_uno` date DEFAULT NULL,
  `fina_uno` date DEFAULT NULL,
  `inicio_dos` date DEFAULT NULL,
  `fina_dos` date DEFAULT NULL,
  `presentacion_auto` date DEFAULT NULL,
  `radicacion` date DEFAULT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_registro_programa1` (`programa_idprograma`),
  CONSTRAINT `fk_registro_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registro
-- ----------------------------
INSERT INTO `registro` VALUES ('1', '4508 de 10 de agosto de 2006', '2006-08-10', '2013-08-10', '7', '44', '2008-08-10', '2009-08-10', '2010-08-10', '2011-08-10', '2012-08-10', '2012-10-10');
INSERT INTO `registro` VALUES ('2', '9480 del 19 de junio de 2014 ', '2014-06-19', '2021-06-19', '7', '49', '2013-06-24', '2014-02-09', null, null, null, null);
INSERT INTO `registro` VALUES ('3', '9481 de 19 de junio de 2014', '2014-06-19', '2021-06-19', '7', '50', '2013-09-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('4', '1721 de 21 de febrero de 2013', '2013-02-21', '2020-02-21', '7', '43', '2013-10-22', null, null, null, null, null);
INSERT INTO `registro` VALUES ('5', '4224 de 27 de mayo de 2010', '2010-05-27', '2017-05-27', '7', '662', '2014-03-05', null, null, null, null, null);
INSERT INTO `registro` VALUES ('6', '5458 de 18 de mayo de 2012', '2012-05-18', '2019-05-18', '7', '20', '2013-09-07', '2013-12-20', null, null, null, null);
INSERT INTO `registro` VALUES ('7', '10985 de 11 septiembre 2012', '2012-09-11', '2019-09-11', '7', '19', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('8', '10995 de 11 de septiembre de 2012', '2012-09-11', '2019-09-11', '7', '53', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('9', '7829 de 4 diciembre 2006', '2006-12-04', '2013-12-04', '7', '46', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('10', '12928 de 10 octubre 2012', '2012-10-10', '2019-10-10', '7', '48', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('11', '10736 de 6 septiembre 2012', '2012-09-06', '2019-09-06', '7', '47', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('12', '17173 de 27 de diciembre de 2012', '2012-12-27', '2019-12-27', '7', '727', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('13', '12793 28 de diciembre de 2010', '2010-12-28', '2017-12-28', '7', '39', '2013-09-19', '2013-12-20', null, null, null, null);
INSERT INTO `registro` VALUES ('14', '7064 de 10 de noviembre de 2006', '2006-11-10', '2013-11-10', '7', '42', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('15', '16107 de 14 de noviembre de 2013', '2013-11-14', '2020-11-14', '7', '41', '2013-10-23', '2013-12-20', null, null, null, null);
INSERT INTO `registro` VALUES ('16', '7328 de 19 de agosto de 2010', '2010-08-19', '2017-08-19', '7', '54', '2014-02-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('17', '425 de enero de 2013', '2013-01-23', '2020-01-23', '7', '21', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('18', '1264 de 21 de febrero de 2011', '2011-02-21', '2018-02-21', '7', '11', '2014-03-05', null, null, null, null, null);
INSERT INTO `registro` VALUES ('19', '9223 de 18 de octubre 2011', '2011-10-18', '2018-10-18', '7', '22', '2013-07-22', null, null, null, null, null);
INSERT INTO `registro` VALUES ('20', '12471 de 29 diciembre de 2011', '2011-12-29', '2018-12-29', '7', '23', '2014-01-24', null, null, null, null, null);
INSERT INTO `registro` VALUES ('21', '10609 de 23 de diciembre de 2009', '2009-12-23', '2016-12-23', '7', '51', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('22', '14813 de 16 de noviembre de 2012', '2012-11-16', '2019-11-16', '7', '52', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('23', '5470 de 2 de julio de 2010', '2010-07-02', '2017-07-02', '7', '697', '2014-05-05', null, null, null, null, null);
INSERT INTO `registro` VALUES ('24', '5469 de 2 de julio de 2010', '2010-07-02', '2017-07-02', '7', '1', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('25', '4244 de 30 de junio de 2009', '2009-06-30', '2016-06-30', '7', '414', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('26', '2379 de 30 de abril de 2009', '2009-04-30', '2016-04-30', '7', '205', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('27', '1367 de 17 de marzo de 2009', '2009-03-17', '2016-03-17', '7', '204', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('28', '8450 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', '7', '718', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('29', '4757 de 15 de julio de 2009', '2009-07-15', '2016-07-15', '7', '415', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('30', '1589 de 17 de abril de 2006', '2006-04-17', '2013-04-17', '7', '12', '2008-04-17', '2009-04-17', '2010-04-17', '2011-04-17', '2012-04-17', '2012-06-17');
INSERT INTO `registro` VALUES ('31', '3080 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', '7', '696', '2014-02-03', null, null, null, null, null);
INSERT INTO `registro` VALUES ('32', '2714 de 12 de mayo de 2009', '2009-05-12', '2016-05-12', '7', '709', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('33', '8451 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', '7', '665', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('34', '1059 de 3 marzo de 2009', '2009-03-03', '2016-03-03', '7', '181', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('35', '3078 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', '7', '694', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('36', '3077 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', '7', '695', '2014-02-03', null, null, null, null, null);
INSERT INTO `registro` VALUES ('37', '1363 de 17 marzo de 2009', '2009-03-17', '2016-03-17', '7', '202', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('38', '8448 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', '7', '666', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('39', '2715 de 12 de mayo de 2009', '2009-05-12', '2016-05-12', '7', '418', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('40', '8449 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', '7', '679', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('41', '1058 de 3 de marzo de 2009', '2009-03-03', '2016-03-03', '7', '182', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('42', '1366 de 17 de marzo de 2009', '2009-03-17', '2016-03-17', '7', '203', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('43', '3079 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', '7', '2', '2014-02-03', null, null, null, null, null);
INSERT INTO `registro` VALUES ('44', '8452 de 28 de octubre de 2009', '2009-10-28', '2016-10-28', '7', '678', '2013-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('45', '3081 de 29 de mayo de 2008', '2008-05-29', '2015-05-29', '7', '3', '2014-02-03', null, null, null, null, null);
INSERT INTO `registro` VALUES ('46', '157 de 15 enero de 2013', '2013-01-15', '2020-01-15', '7', '110', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('47', '3040 de 21 de junio 2007', '2007-06-21', '2014-06-21', '7', '111', '2009-06-21', '2010-06-21', '2011-06-21', '2012-06-21', '2013-06-21', '2013-08-21');
INSERT INTO `registro` VALUES ('48', '3385 de 20 de junio de 2007', '2007-06-20', '2014-06-20', '7', '109', '2009-06-20', '2010-06-20', '2011-06-20', '2012-06-20', '2013-06-20', '2013-08-20');
INSERT INTO `registro` VALUES ('49', '8954 de 15 de julio 2013', '2013-07-15', '2020-07-15', '7', '112', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('50', '3384 de 20 de junio de 2007', '2007-06-20', '2014-06-20', '7', '114', '2009-01-23', '2010-01-23', '2011-01-23', '2012-01-23', '2013-01-23', '2013-03-23');
INSERT INTO `registro` VALUES ('51', '17157 de diciembre de 2012', '2012-12-01', '2019-12-01', '7', '150', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('52', '2474 de 14 de mayo de 2007', '2007-05-14', '2014-05-14', '7', '162', '2009-05-14', '2010-05-14', '2011-05-14', '2012-05-14', '2013-05-14', '2013-07-14');
INSERT INTO `registro` VALUES ('53', '7208 de 17 de noviembre de 2006', '2006-11-17', '2013-11-17', '7', '185', '2008-11-17', '2009-11-17', '2010-11-17', '2011-11-17', '2012-11-17', '2013-01-17');
INSERT INTO `registro` VALUES ('54', '6932 de 13 de noviembre de 2007', '2007-11-13', '2014-11-13', '7', '145', '2014-08-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('55', '2813 de 14 de mayo de 2009', '2009-05-14', '2014-05-14', '5', '183', '2009-01-23', '2010-01-23', '2011-01-23', '2012-01-23', '2013-01-23', '2013-03-23');
INSERT INTO `registro` VALUES ('56', '8457 de 23 julio de 2012', '2012-07-23', '2019-07-23', '7', '121', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('57', '4030 de 27 de junio de 2008', '2008-06-27', '2015-06-27', '7', '120', '2014-02-03', '2014-04-22', null, null, null, null);
INSERT INTO `registro` VALUES ('60', '8289 de 28 de junio de 2013', '2013-06-28', '2020-06-28', '7', '136', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('61', '13069 de 13 de Agosto de 2014', '2014-08-13', '2021-08-13', '7', '166', null, '2009-08-04', null, null, null, null);
INSERT INTO `registro` VALUES ('62', '1392 de 9 marzo de 2010', '2010-03-09', '2015-03-09', '5', '153', '2010-03-09', '2011-03-09', '2012-03-09', '2013-03-09', '2014-03-09', '2014-05-09');
INSERT INTO `registro` VALUES ('63', '4058 de 24 de julio de 2006', '2006-07-24', '2013-07-24', '7', '152', '2008-07-24', '2009-07-24', '2010-07-24', '2011-07-24', '2012-07-24', '2012-09-24');
INSERT INTO `registro` VALUES ('64', '346 de 31 de enero de 2007', '2007-01-31', '2014-01-31', '7', '151', '2009-01-31', '2010-01-31', '2011-01-31', '2012-01-31', '2013-01-31', '2013-03-31');
INSERT INTO `registro` VALUES ('65', '6838 de 3 de noviembre de 2006', '2006-11-03', '2013-11-03', '7', '154', '2008-11-03', '2009-11-03', '2010-11-03', '2011-11-03', '2012-11-03', '2013-01-03');
INSERT INTO `registro` VALUES ('66', '347 de 31 de enero de 2007', '2007-01-31', '2014-01-31', '7', '165', '2009-01-31', '2010-01-31', '2011-01-31', '2012-01-31', '2013-01-31', '2013-03-31');
INSERT INTO `registro` VALUES ('67', '4070 de 24 de julio de 2006', '2006-07-24', '2013-07-24', '7', '156', '2008-07-24', '2009-07-24', '2010-07-24', '2011-07-24', '2012-07-24', '2012-09-24');
INSERT INTO `registro` VALUES ('68', '1357 de 23 de diciembre de 2009', '2009-12-23', '2014-12-23', '5', '157', '2009-12-23', '2010-12-23', '2011-12-23', '2012-12-23', '2013-12-23', '2014-02-23');
INSERT INTO `registro` VALUES ('69', '10608 de 23 de diciembre de 2009', '2009-12-23', '2014-12-23', '5', '159', '2009-12-23', '2010-12-23', '2011-12-23', '2012-12-23', '2013-12-23', '2014-02-23');
INSERT INTO `registro` VALUES ('70', '4071 de 24 de julio de 2006', '2006-07-24', '2013-07-24', '7', '167', '2008-07-24', '2009-07-24', '2010-07-24', '2011-07-24', '2012-07-24', '2012-09-24');
INSERT INTO `registro` VALUES ('71', '6249 de 12 de octubre de 2006', '2006-10-12', '2013-10-12', '7', '161', '2008-10-12', '2009-10-12', '2010-10-12', '2011-10-12', '2012-10-12', '2012-12-12');
INSERT INTO `registro` VALUES ('72', '4059 de 24 de julio de 2006', '2006-07-24', '2013-07-24', '7', '160', '2008-07-24', '2009-07-24', '2010-07-24', '2011-07-24', '2012-07-24', '2012-09-24');
INSERT INTO `registro` VALUES ('73', '1763 de 10 abril de 2007', '2007-04-10', '2014-04-10', '7', '158', '2009-04-10', '2010-04-10', '2011-04-10', '2012-04-10', '2013-04-10', '2013-06-10');
INSERT INTO `registro` VALUES ('74', '6512 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', '7', '124', '2009-10-26', '2010-10-26', '2011-10-26', '2012-10-26', '2013-10-26', '2013-12-26');
INSERT INTO `registro` VALUES ('75', '152 de 18 de enero de 2007', '2007-01-18', '2014-01-18', '7', '125', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('76', '6510 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', '7', '147', '2009-10-26', '2010-10-26', '2011-10-26', '2012-10-26', '2013-10-26', '2013-12-26');
INSERT INTO `registro` VALUES ('77', '6511 de 26 de octubre de 2007', '2007-10-26', '2014-10-26', '7', '123', '2009-10-26', '2010-10-26', '2011-10-26', '2012-10-26', '2013-10-26', '2013-12-26');
INSERT INTO `registro` VALUES ('78', '2374 de 7 de marzo de 2013', '2013-03-07', '2020-03-07', '7', '140', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('79', '2490 de 6 mayo de 2009', '2009-05-06', '2016-05-06', '7', '171', '2013-11-25', '2014-10-01', null, null, null, null);
INSERT INTO `registro` VALUES ('80', '9955 de 22 agosto de 2012', '2012-08-22', '2019-08-22', '7', '127', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('81', '2581 de 14 de marzo de 2013', '2013-03-14', '2020-03-14', '7', '135', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('82', '6024 de 20 de mayo de 2013', '2013-05-20', '2020-05-20', '7', '129', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('83', '1301 del 12 de febrero de 2013', '2013-02-12', '2020-02-12', '7', '138', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('84', '4848 de 30 de abril de 2013', '2013-04-30', '2020-04-30', '7', '190', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('85', '10645 de 22 de noviembre 2011', '2011-11-22', '2018-11-22', '7', '707', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('86', '7844 de 26 de octubre de 2009', '2009-10-26', '2016-10-26', '7', '148', '2013-10-01', null, null, null, null, null);
INSERT INTO `registro` VALUES ('87', '10191 de 22 de noviembre de 2010', '2010-11-22', '2017-11-22', '7', '672', '2013-02-12', '2014-09-09', null, null, null, null);
INSERT INTO `registro` VALUES ('88', '3126 de 16 de junio de 2006', '2006-06-16', '2013-06-16', '7', '168', '2008-06-16', '2009-06-16', '2010-06-16', '2011-06-16', null, null);
INSERT INTO `registro` VALUES ('89', '3000 de 22 de mayo de 2008', '2008-05-22', '2015-05-22', '7', '170', '2010-05-22', '2011-05-22', '2012-05-22', '2013-05-22', '2014-05-22', '2014-07-22');
INSERT INTO `registro` VALUES ('90', '1555 de 20 marzo de 2009', '2009-03-20', '2016-03-20', '7', '177', '2013-11-25', null, null, null, null, null);
INSERT INTO `registro` VALUES ('91', '4950 de 16 de junio 2011', '2011-06-16', '2018-06-16', '7', '686', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('92', '1253 de 21 de febrero de 2011', '2011-02-21', '2018-02-21', '7', '684', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('93', '8293 de 28 de diciembre de 2007', '2007-12-28', '2014-12-28', '7', '229', '2009-12-28', '2010-12-28', '2011-12-28', '2012-12-28', '2013-12-28', '2014-02-28');
INSERT INTO `registro` VALUES ('94', '4200 de 30 de junio de 2009', '2009-06-30', '2016-06-30', '7', '179', '2014-02-03', null, null, null, null, null);
INSERT INTO `registro` VALUES ('95', '1563 de 28 de febrero de 2011', '2011-02-28', '2018-02-28', '7', '685', '2014-06-17', null, null, null, null, null);
INSERT INTO `registro` VALUES ('96', '1566 de 28 de febrero 2011', '2011-02-28', '2018-02-28', '7', '122', '2014-08-22', null, null, null, null, null);
INSERT INTO `registro` VALUES ('101', '2222 de 10 de junio de 2005', '2005-06-10', '2012-06-10', '7', '49', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('102', '3149 de 16 de junio de 2006', '2006-06-16', '2013-06-16', '7', '43', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('103', '4175 de 16 de septiembre de 2005', '2005-09-16', '2012-09-16', '7', '50', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('104', '637 de 13 febrero de 2006', '2006-02-16', '2013-02-16', '7', '20', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('105', '3837 de 5 de  septiembre de 2005', '2005-09-05', '2012-09-05', '7', '19', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('106', '6246 de 26 de didiembre de 2005', '2005-12-26', '2012-12-26', '7', '53', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('107', '2077 de 2 de mayo de 2007', '2007-05-02', '2014-05-02', '7', '48', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('108', '5775 de 22 de septiembre de 2006', '2006-09-22', '2013-09-22', '7', '47', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('109', '2205 de 18 de septiembre de 2003', '2003-09-18', '2010-09-18', '7', '39', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('110', '7209 de 17 de noviembre de 2006', '2006-11-17', '2013-11-17', '7', '41', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('111', '815 de 27 de febrero de 2006', '2006-02-27', '2013-02-27', '7', '21', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('112', '157 de 30 de enero de 2004', '2004-01-30', '2011-01-30', '7', '11', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('113', '4474 de 30 de noviembre de 2004', '2004-11-30', '2011-11-30', '7', '22', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('114', '1084 de 1 abril de 2005', '2005-04-01', '2012-04-01', '7', '23', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('115', '781 de 9 de marzo de 2005', '2005-03-09', '2012-03-09', '7', '52', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('116', '6385 de 29 de diciembre de 2005', '2005-12-29', '2012-12-29', '7', '140', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('117', '1326 de 20 de abril de 2005', '2005-04-20', '2012-04-20', '7', '127', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('118', '807 de 27 de febrero de 2006', '2006-02-27', '2013-02-27', '7', '135', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('119', '5686 de 5 de diciembre de 2005', '2005-12-05', '2012-12-05', '7', '129', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('120', '6435 de 29 de diciembre de 2005', '2005-12-29', '2012-12-29', '7', '138', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('121', '1621 de 16 de julio de 2003', '2003-07-16', '2010-07-16', '7', '177', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('122', '1417 de 6 de abril de 2006', '2006-04-06', '2013-04-06', '7', '110', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('123', '3125 de 16 de junio de 2006', '2006-06-16', '2013-06-16', '7', '111', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('125', '688 de 177 de febrero de 2006', '2006-02-17', '2013-02-17', '7', '150', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('126', '4865 28 de agosto de 2007', '2007-08-28', '2012-08-28', '5', '121', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('127', '6271 de 24 de septiembre de 2008', '2008-09-24', '2013-09-24', '5', '174', '2008-09-24', '2009-09-24', '2010-09-24', '2011-09-24', '2012-09-24', '2012-11-24');
INSERT INTO `registro` VALUES ('128', '1245 de 16 de marzo de 2007', '2007-03-16', '2014-03-16', '7', '263', '2013-10-09', '2014-08-29', null, null, null, null);
INSERT INTO `registro` VALUES ('129', '1416 de 6 de abril de 2006', '2006-04-06', '2013-04-06', '7', '136', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('130', '855 de 22 de enero de 2014', '2014-01-22', '2021-01-22', '7', '125', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('131', '956 de 24 de enero de 2014', '2014-01-24', '2021-01-24', '7', '42', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('132', '17667 de 6 de diciembre de 2013', '2013-12-06', '2020-12-06', '7', '750', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('133', '17740 de 6 de diciembre de 2013', '2013-12-06', '2020-12-06', '7', '46', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('134', '5457 del 14 de abril de 2014', '2014-04-14', '2021-04-14', '7', '44', '2013-10-30', null, null, null, null, null);
INSERT INTO `registro` VALUES ('135', '6187 del 5 de Mayo de 2014', '2014-05-05', '2021-05-05', '7', '751', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('136', '6770 de 9 de mayo de 2014', '2014-05-09', '2021-05-09', '7', '752', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('137', '6175 de 5 de mayo de 2014', '2014-05-05', '2021-05-05', '7', '174', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('138', '7787 de 26 de Mayo de 2014', '2014-05-26', '2021-05-26', '7', '162', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('139', '9108 de 11 de Junio de 2014', '2014-06-11', '2021-06-11', '7', '111', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('140', '9480 19 de junio de 2014', '2010-03-24', '2017-03-24', '7', '49', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('141', '9482 de 19 de junio de 2014', '2011-03-30', '2018-03-30', '7', '50', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('142', '10697 de 9 de Julio del 2014', '2014-07-09', '2021-07-09', '7', '159', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('143', '10696 de 9 de Julio del 2014', '2014-07-09', '2021-07-09', '7', '157', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('144', '10713 de 9 de Julio del 2014', '2014-07-09', '2021-07-09', '7', '109', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('145', '10677 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '156', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('146', '10676 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '161', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('147', '10675 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '152', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('148', '10674 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '154', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('149', '10679 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '151', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('150', '10678 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '158', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('151', '10681 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '147', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('152', '10680 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '124', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('153', '10682 de 9 de Julio de 2014', '2014-07-09', '2021-07-09', '7', '123', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('154', '17154 de 17 Octubre de 2014', '2014-10-17', '2021-10-17', '7', '120', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('155', '17191 de 17 de Otubre de 2014', '2014-10-17', '2021-10-17', '7', '12', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('156', '20218 del 27 del Noviembre de 2014', '2014-11-27', '2021-11-27', '7', '165', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('157', '20792 de 03 de diciembre del 2014', '2014-12-03', '2021-12-03', '7', '114', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('158', '22862 del 30 de Diciembre del 2014', '2014-12-30', '2021-12-30', '7', '170', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('159', '22905 del 31 de Diciembre del 2014', '2014-12-31', '2021-12-31', '7', '153', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('160', '22861 del 30 de Diciembre del 2014', '2014-12-30', '2021-12-30', '7', '160', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('161', '01336 del 03 de febrero de 2015', '2015-02-03', '2022-02-03', '7', '753', null, null, null, null, null, null);
INSERT INTO `registro` VALUES ('162', '01661 de 09 de Febreo de 2015', '2015-02-09', '2022-02-09', '7', '754', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cedula` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `clave` varchar(25) NOT NULL,
  `facultad_idfacultad` int(11) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_usuarios_facultad1` (`facultad_idfacultad`),
  CONSTRAINT `fk_usuarios_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('135136', 'decano', 'Decano', 'decano', '135136', '5');
INSERT INTO `usuarios` VALUES ('7445809', 'ARTURO', 'Decano', 'RODRIGUEZ', '7445809', '9');
INSERT INTO `usuarios` VALUES ('7884813', 'RICARDO', 'Decano', 'GAITAN IBARRA', '7884813', '7');
INSERT INTO `usuarios` VALUES ('9073521', 'LUIS', 'Decano', 'CARABALLO', '9073521', '37');
INSERT INTO `usuarios` VALUES ('33101730', 'MERLY LIÑAN', 'Centro Autoevaluación', 'LIÑAN', '33101730', null);
INSERT INTO `usuarios` VALUES ('33155611', 'ROSA ISABEL', 'Decano', 'MILANES', '33155611', '3');
INSERT INTO `usuarios` VALUES ('45423261', 'IVETTE', 'Decano', 'YIDIOS DE RIVEROS', '45423261', '1');
INSERT INTO `usuarios` VALUES ('45438222', 'AMALFI', 'Decano', 'PADILLA', '45438222', '60');
INSERT INTO `usuarios` VALUES ('45470344', 'EDNA', 'Decano', 'GOMEZ', '45470344', '8');
INSERT INTO `usuarios` VALUES ('57426164', 'ROCIO', 'Director postgrado', 'PADILLA PRESTON', '57426164', null);
INSERT INTO `usuarios` VALUES ('70047615', 'CESAR', 'Decano', 'HERAZO HENRIQUEZ', '70047615', '16');
INSERT INTO `usuarios` VALUES ('73079810', 'GUSTAVO', 'Decano', 'VELASCO ZUÑIGA', '73079810', '4');
INSERT INTO `usuarios` VALUES ('73100494', 'JORGE LUIS', 'Decano', 'LLAMAS CHAVEZ', '73100494', '2');
INSERT INTO `usuarios` VALUES ('73125734', 'YEZID', 'Decano', 'CARILLO', '73125734', '6');
INSERT INTO `usuarios` VALUES ('77101577', 'MIGUEL ANGEL', 'Decano', 'GARCIA', '77101577', '5');
