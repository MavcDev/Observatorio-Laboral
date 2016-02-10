# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.0.51b-community-nt-log
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2013-06-03 22:35:06
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for olabing
DROP DATABASE IF EXISTS `olabing`;
CREATE DATABASE IF NOT EXISTS `olabing` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `olabing`;


# Dumping structure for table olabing.chat
DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id_chat` int(10) NOT NULL auto_increment,
  `texto` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cod_emi` varchar(10) NOT NULL,
  `cod_rece` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_chat`),
  KEY `FK_emi` (`cod_emi`),
  KEY `FK_rece` (`cod_rece`),
  CONSTRAINT `FK_emi` FOREIGN KEY (`cod_emi`) REFERENCES `usuario` (`cod`),
  CONSTRAINT `FK_rece` FOREIGN KEY (`cod_rece`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.chat: ~2 rows (approximately)
DELETE FROM `chat`;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`id_chat`, `texto`, `fecha`, `hora`, `cod_emi`, `cod_rece`) VALUES
	(57, 'ola', '2013-05-29', '05:26:25', '172007774', '172007758'),
	(58, 'ola como estas', '2013-05-29', '05:26:34', '172007774', '172007717');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;


# Dumping structure for table olabing.comentario_foro
DROP TABLE IF EXISTS `comentario_foro`;
CREATE TABLE IF NOT EXISTS `comentario_foro` (
  `id_comenta_f` int(10) NOT NULL auto_increment,
  `texto` varchar(1000) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fk_usu3` varchar(10) NOT NULL,
  `fk_foro` int(10) NOT NULL,
  PRIMARY KEY  (`id_comenta_f`),
  KEY `FK_usu3` (`fk_usu3`),
  KEY `FK_foro` (`fk_foro`),
  CONSTRAINT `FK_foro` FOREIGN KEY (`fk_foro`) REFERENCES `foro` (`id_foro`),
  CONSTRAINT `FK_usu3` FOREIGN KEY (`fk_usu3`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.comentario_foro: ~3 rows (approximately)
DELETE FROM `comentario_foro`;
/*!40000 ALTER TABLE `comentario_foro` DISABLE KEYS */;
INSERT INTO `comentario_foro` (`id_comenta_f`, `texto`, `fecha`, `hora`, `fk_usu3`, `fk_foro`) VALUES
	(4, 'Cometario 1', '2013-05-27', '06:52:44', '172007774', 11),
	(12, 'comentario 1', '2013-05-29', '05:25:59', '172007774', 12),
	(13, 'comentario 2', '2013-05-29', '05:27:31', '172007774', 11);
/*!40000 ALTER TABLE `comentario_foro` ENABLE KEYS */;


# Dumping structure for table olabing.detalle_encuesta
DROP TABLE IF EXISTS `detalle_encuesta`;
CREATE TABLE IF NOT EXISTS `detalle_encuesta` (
  `fk_usu5` varchar(10) NOT NULL,
  `fk_encuesta` int(10) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`fk_usu5`,`fk_encuesta`),
  KEY `FK_encuesta1` (`fk_encuesta`),
  CONSTRAINT `FK_encuesta1` FOREIGN KEY (`fk_encuesta`) REFERENCES `encuesta` (`id_encuesta`),
  CONSTRAINT `FK_usuario5` FOREIGN KEY (`fk_usu5`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table olabing.detalle_encuesta: ~1 rows (approximately)
DELETE FROM `detalle_encuesta`;
/*!40000 ALTER TABLE `detalle_encuesta` DISABLE KEYS */;
INSERT INTO `detalle_encuesta` (`fk_usu5`, `fk_encuesta`, `fecha`) VALUES
	('172007758', 1, '2013-05-29');
/*!40000 ALTER TABLE `detalle_encuesta` ENABLE KEYS */;


# Dumping structure for table olabing.detalle_respuesta
DROP TABLE IF EXISTS `detalle_respuesta`;
CREATE TABLE IF NOT EXISTS `detalle_respuesta` (
  `fk_usu` varchar(50) NOT NULL,
  `fk_respuesta` int(10) NOT NULL,
  `justificacion` varchar(200) NOT NULL,
  PRIMARY KEY  (`fk_usu`,`fk_respuesta`),
  KEY `FK_respuesta` (`fk_respuesta`),
  CONSTRAINT `FK_respuesta` FOREIGN KEY (`fk_respuesta`) REFERENCES `respuesta` (`id_respuesta`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`fk_usu`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table olabing.detalle_respuesta: ~25 rows (approximately)
DELETE FROM `detalle_respuesta`;
/*!40000 ALTER TABLE `detalle_respuesta` DISABLE KEYS */;
INSERT INTO `detalle_respuesta` (`fk_usu`, `fk_respuesta`, `justificacion`) VALUES
	('172007758', 1, ' '),
	('172007758', 3, ' '),
	('172007758', 6, ' '),
	('172007758', 19, ' '),
	('172007758', 22, ' '),
	('172007758', 36, ' '),
	('172007758', 40, ' '),
	('172007758', 50, ' '),
	('172007758', 51, ' '),
	('172007758', 68, ' '),
	('172007758', 69, ' '),
	('172007758', 85, ' '),
	('172007758', 86, ' '),
	('172007758', 87, ' '),
	('172007758', 97, ' '),
	('172007758', 98, ' '),
	('172007758', 368, ' '),
	('172007758', 369, ' '),
	('172007758', 404, ' '),
	('172007758', 416, ' '),
	('172007758', 439, ' '),
	('172007758', 467, ' '),
	('172007758', 479, ' '),
	('172007758', 494, ' '),
	('172007758', 502, ' ');
/*!40000 ALTER TABLE `detalle_respuesta` ENABLE KEYS */;


# Dumping structure for table olabing.encuesta
DROP TABLE IF EXISTS `encuesta`;
CREATE TABLE IF NOT EXISTS `encuesta` (
  `id_encuesta` int(10) NOT NULL auto_increment,
  `concepto` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.encuesta: ~3 rows (approximately)
DELETE FROM `encuesta`;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` (`id_encuesta`, `concepto`) VALUES
	(1, 'Momento 0'),
	(2, 'Momento 1'),
	(3, 'Momento 2');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;


# Dumping structure for table olabing.foro
DROP TABLE IF EXISTS `foro`;
CREATE TABLE IF NOT EXISTS `foro` (
  `id_foro` int(10) NOT NULL auto_increment,
  `pregunta` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `fk_usu1` varchar(10) NOT NULL,
  `fk_tipo_foro` int(10) NOT NULL,
  `fk_tema` int(10) NOT NULL,
  PRIMARY KEY  (`id_foro`),
  KEY `FK_usu1` (`fk_usu1`),
  KEY `FK_tipo_foro` (`fk_tipo_foro`),
  KEY `FK_tema` (`fk_tema`),
  CONSTRAINT `FK_tema` FOREIGN KEY (`fk_tema`) REFERENCES `tema` (`id_tema`),
  CONSTRAINT `FK_tipo_foro` FOREIGN KEY (`fk_tipo_foro`) REFERENCES `tipo_foro` (`id_tipo_foro`),
  CONSTRAINT `FK_usu1` FOREIGN KEY (`fk_usu1`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.foro: ~4 rows (approximately)
DELETE FROM `foro`;
/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
INSERT INTO `foro` (`id_foro`, `pregunta`, `fecha`, `fk_usu1`, `fk_tipo_foro`, `fk_tema`) VALUES
	(6, 'Código de la serie fibonacci', '2013-05-21', '172007758', 1, 1),
	(8, 'Formulación de la leyes del péndulo simple', '2013-05-23', '172007758', 2, 3),
	(11, 'Formula de la serie fibonacci', '2013-05-24', '172007758', 1, 2),
	(12, 'Laboratorio ludico de lógica y algoritmo', '2013-05-24', '172007774', 2, 4);
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;


# Dumping structure for table olabing.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `nick` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `cod` varchar(10) NOT NULL,
  PRIMARY KEY  (`nick`),
  KEY `FK_cod` (`cod`),
  CONSTRAINT `FK_cod` FOREIGN KEY (`cod`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table olabing.login: ~2 rows (approximately)
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`nick`, `password`, `cod`) VALUES
	('l.espinosa', '123', '172007774'),
	('m.velasquez', '123', '172007758');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


# Dumping structure for table olabing.oferta
DROP TABLE IF EXISTS `oferta`;
CREATE TABLE IF NOT EXISTS `oferta` (
  `id_oferta` int(10) NOT NULL auto_increment,
  `pre_requisito` varchar(300) NOT NULL,
  `entidad` varchar(100) default NULL,
  `oficio` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telcel1` varchar(10) NOT NULL,
  `telcel2` varchar(10) default NULL,
  `telfijo` varchar(10) default NULL,
  `correo1` varchar(100) NOT NULL,
  `correo2` varchar(100) default NULL,
  `mas_info` varchar(500) default NULL,
  `fecha` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `fk_usu2` varchar(10) NOT NULL,
  `fk_tipo_ofe` int(10) NOT NULL,
  PRIMARY KEY  (`id_oferta`),
  KEY `FK_tipo_ofe` (`fk_tipo_ofe`),
  KEY `FK_usu2` (`fk_usu2`),
  CONSTRAINT `FK_tipo_ofe` FOREIGN KEY (`fk_tipo_ofe`) REFERENCES `tipo_oferta` (`id_tipo_ofe`),
  CONSTRAINT `FK_usu2` FOREIGN KEY (`fk_usu2`) REFERENCES `usuario` (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.oferta: ~1 rows (approximately)
DELETE FROM `oferta`;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` (`id_oferta`, `pre_requisito`, `entidad`, `oficio`, `direccion`, `telcel1`, `telcel2`, `telfijo`, `correo1`, `correo2`, `mas_info`, `fecha`, `fecha_limite`, `fk_usu2`, `fk_tipo_ofe`) VALUES
	(10, 'conocimientos en java ', 'Universidad de la amazonia', 'Desarrollador', 'car 12  n° 45-34  barrio porvenir', '3209876543', '', '', 'correo1@gmail.com', '', '', '2013-05-23', '2013-07-05', '172007758', 2);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;


# Dumping structure for table olabing.pregunta
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `id_pregunta` int(10) NOT NULL auto_increment,
  `concepto` varchar(300) NOT NULL,
  `fk_topico` int(10) NOT NULL,
  `fk_tipo` int(10) NOT NULL,
  PRIMARY KEY  (`id_pregunta`),
  KEY `FK_topico` (`fk_topico`),
  KEY `FK_tipo` (`fk_tipo`),
  CONSTRAINT `FK_tipo` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo_pregunta` (`id_tipo_pregunta`),
  CONSTRAINT `FK_topico` FOREIGN KEY (`fk_topico`) REFERENCES `topico` (`id_topico`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.pregunta: ~140 rows (approximately)
DELETE FROM `pregunta`;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`id_pregunta`, `concepto`, `fk_topico`, `fk_tipo`) VALUES
	(1, 'Estado Civil', 1, 1),
	(2, 'Numeros de hijos', 1, 2),
	(3, 'La vivienda donde vive actualmente es', 1, 1),
	(4, 'Cuál es/era el nivel de educación más alto alcanzado por su padre', 1, 1),
	(5, 'Cuál es/era la principal ocupación de su padre', 1, 1),
	(6, 'Cuál es/era el nivel de educación más alto alcanzado por su madre', 1, 1),
	(7, 'Cuál es/era la principal ocupación de su madre', 1, 1),
	(8, 'De acuerdo con su cultura, pueblo o rasgos físicos, usted es o se reconoce como', 1, 1),
	(9, 'Tiene usted alguna de las siguientes limitaciones permanentes', 1, 3),
	(10, 'De las anteriores limitaciones, ¿cuál es la que más afecta su desempeño diario', 1, 1),
	(11, 'A qué edad concluyó sus estudios de bachillerato', 2, 2),
	(12, 'Desde el momento en que se graduó de bachiller, cuánto tiempo transcurrió antes de matricularse en una Institución de Educación Superior', 2, 1),
	(13, 'Cuál fue la principal razón para no haber ingresado a una Institución de Educación Superior tan pronto se graduó de bachiller', 2, 1),
	(14, 'Al terminar el bachillerato, ¿cuál(es) era(n) la(s) temática(s) académica(s) de su preferencia', 2, 2),
	(15, 'De los siguientes factores, ¿cuál considera que fue el más importante en el momento de seleccionar su carrera', 2, 4),
	(16, 'Cuál o cuáles fue(ron) la(s) principal(es) fuente(s) de recursos para asumir los costos de sus estudios ', 2, 3),
	(17, 'De cuál(es) de estas entidades recibió beca o subsidio en dinero o especie para estudiar, durante algún(os) semestre(s) de su carrera', 2, 3),
	(18, 'De cuál(es) de estas entidades recibió un crédito educativo durante algún(os) semestre(s) de su carrera', 2, 3),
	(19, 'La institución en donde terminó el bachillerato era bilingüe', 3, 1),
	(20, 'La Institución de Educación Superior de la que va a obtener su título influyó en la mejora de sus competencias en idiomas extranjeros', 3, 1),
	(21, 'Cuál(es) idioma(s) ha estudiado', 3, 3),
	(22, 'Cómo califica su nivel de competencia en HABLA en Inglés', 3, 1),
	(23, 'Cómo califica su nivel de competencia en HABLA en Francés', 3, 1),
	(24, 'Cómo califica su nivel de competencia en HABLA en Italiano', 3, 1),
	(25, 'Cómo califica su nivel de competencia en HABLA en Portugués', 3, 1),
	(26, 'Cómo califica su nivel de competencia en HABLA en Mandarín', 3, 1),
	(27, 'Cómo califica su nivel de competencia en HABLA en Alemán', 3, 1),
	(28, 'Cómo califica su nivel de competencia en HABLA en Japonés', 3, 1),
	(29, 'Cómo califica su nivel de competencia en HABLA en Árabe', 3, 1),
	(30, 'Cómo califica su nivel de competencia en ESCUCHA en Inglés', 3, 1),
	(31, 'Cómo califica su nivel de competencia en ESCUCHA en Francés', 3, 1),
	(32, 'Cómo califica su nivel de competencia en ESCUCHA en Italiano', 3, 1),
	(33, 'Cómo califica su nivel de competencia en ESCUCHA en Portugués', 3, 1),
	(34, 'Cómo califica su nivel de competencia en ESCUCHA en Mandarín', 3, 1),
	(35, 'Cómo califica su nivel de competencia en ESCUCHA en Alemán', 3, 1),
	(36, 'Cómo califica su nivel de competencia en ESCUCHA en Japonés', 3, 1),
	(37, 'Cómo califica su nivel de competencia en ESCUCHA en Árabe', 3, 1),
	(38, 'Cómo califica su nivel de competencia en LECTURA en Inglés', 3, 1),
	(39, 'Cómo califica su nivel de competencia en LECTURA en Francés', 3, 1),
	(40, 'Cómo califica su nivel de competencia en LECTURA en Italiano', 3, 1),
	(41, 'Cómo califica su nivel de competencia en LECTURA en Portugués', 3, 1),
	(42, 'Cómo califica su nivel de competencia en LECTURA en Mandarín', 3, 1),
	(43, 'Cómo califica su nivel de competencia en LECTURA en Alemán', 3, 1),
	(44, 'Cómo califica su nivel de competencia en LECTURA en Japonés', 3, 1),
	(45, 'Cómo califica su nivel de competencia en LECTURA en Árabe', 3, 1),
	(46, 'Cómo califica su nivel de competencia en ESCRITURA en Inglés', 3, 1),
	(47, 'Cómo califica su nivel de competencia en ESCRITURA en Francés', 3, 1),
	(48, 'Cómo califica su nivel de competencia en ESCRITURA en Italiano', 3, 1),
	(49, 'Cómo califica su nivel de competencia en ESCRITURA en Portugués', 3, 1),
	(50, 'Cómo califica su nivel de competencia en ESCRITURA en Mandarín', 3, 1),
	(51, 'Cómo califica su nivel de competencia en ESCRITURA en Alemán', 3, 1),
	(52, 'Cómo califica su nivel de competencia en ESCRITURA en Japonés', 3, 1),
	(53, 'Cómo califica su nivel de competencia en ESCRITURA en Árabe', 3, 1),
	(54, 'Exponer las ideas por medios escritos', 3, 1),
	(55, 'Comunicarse oralmente con claridad', 3, 1),
	(56, 'Persuadir y convencer a sus interlocutores', 3, 1),
	(57, 'Identificar y utilizar símbolos para comunicarse (lenguaje icónico, lenguaje no verbal, etc)', 3, 1),
	(58, 'Aceptar las diferencias y trabajar en contexto multiculturales', 3, 1),
	(59, 'Utilizar herramientas informáticas básicas (procesadores de texto, hojas de cálculo, correo electrónico, etc.)', 3, 1),
	(60, 'Aprender y mantenerse actualizado', 3, 1),
	(61, 'Ser creativo e innovador', 3, 1),
	(62, 'Buscar, analizar, administrar y compartir información', 3, 1),
	(63, 'Crear, investigar y adoptar tecnología', 3, 1),
	(64, 'Diseñar e implementar soluciones con el apoyo de tecnología', 3, 1),
	(65, 'Identificar, plantear y resolver problemas', 3, 1),
	(66, 'Capacidad de abstracción análisis y síntesis', 3, 1),
	(67, 'Comprender la realidad que lo rodea', 3, 1),
	(68, 'Asumir una cultura de convivencia', 3, 1),
	(69, 'Asumir responsabilidades y tomar decisiones', 3, 1),
	(70, 'Qué ha pensado hacer en el largo plazo', 4, 3),
	(71, 'En la actualidad, en qué actividad ocupa la mayor parte de su tiempo', 5, 1),
	(72, 'Además de lo anterior, realiza alguna actividad remunerada?', 5, 1),
	(73, 'En el último mes ha hecho alguna diligencia para conseguir un trabajo o instalar un negocio', 5, 1),
	(74, 'Desea conseguir un trabajo o instalar un negocio', 5, 1),
	(75, 'Aunque desea trabajar/instalar negocio por qué motivo no hizo diligencias durante el último mes', 5, 3),
	(76, 'Si le hubiera resultado algún trabajo remunerado, ¿estaba disponible la semana pasada para empezar a trabajar?', 5, 1),
	(77, 'En esa actividad usted es: ', 5, 1),
	(78, 'Es este su primer empleo', 5, 1),
	(79, 'Qué canal de búsqueda le permitió conseguir el empleo actual', 5, 3),
	(80, 'Qué tipo de vinculación tiene con esta empresa/institución', 5, 3),
	(81, 'Su ocupación actual es: ', 5, 1),
	(82, 'Su actividad económica es: ', 5, 1),
	(83, 'Qué tan relacionado está su empleo con la carrera que estudió', 5, 3),
	(84, 'Cuál fue su ingreso laboral en el mes pasado? (Incluya propinas y comisiones. No incluya horas extras, viáticos, ni ayudas en especie)', 5, 2),
	(85, 'En promedio, cuántas horas a la semana le dedica a este empleo', 5, 2),
	(86, 'Cómo clasificaría el ámbito de las actividades de la empresa donde labora', 5, 3),
	(87, 'Existen vínculos entre la Institución donde estudió y la organización en donde labora', 5, 1),
	(88, 'Es este su primer trabajo', 5, 1),
	(89, 'Qué tan relacionadas están las actividades que realiza por cuenta propia con la carrera que estudió', 5, 1),
	(90, 'Cuál de las siguientes formas de trabajo realiza en las actividades que desempeña por su cuenta', 5, 1),
	(91, 'Su actividad económica es', 5, 1),
	(92, 'En promedio, cuál es el ingreso mensual que percibe por las actividades que realiza por cuenta propia', 5, 2),
	(93, 'Tiene interés por crear empresa', 5, 1),
	(94, 'Cuál considera que es la principal dificultad en la creación de una empresa', 5, 4),
	(95, 'Es este su primer trabajo', 5, 1),
	(96, 'Qué tan relacionadas están las actividades que realiza en su empresa con la carrera que estudió', 5, 1),
	(97, 'Cuál es la actividad económica de su empresa', 5, 1),
	(98, 'Cuál es el ingreso promedio mensual que le corresponde por las actividades en su empresa', 5, 2),
	(99, 'Qué tan útiles han sido en su trabajo los conocimientos, habilidades y destrezas aprendidas en su carrera', 5, 1),
	(100, 'Su trabajo actual está contribuyendo a su desarrollo y crecimiento personal', 5, 1),
	(101, 'Cómo calificaría su satisfacción con el trabajo actual', 5, 1),
	(102, 'En su opinión, para el trabajo que está desempeñando, realmente qué nivel de estudios se requiere', 5, 1),
	(103, 'Está interesado en trabajar horas adicionales (Contestar sólo si su jornada laboral principal es inferior a 48 horas, de lo contrario contestar “No aplica”)', 5, 1),
	(104, 'Ud. considera que debería estar en otro trabajo en donde pudiera desarrollar mejor sus competencias profesionales', 5, 1),
	(105, 'Ud. considera que teniendo en cuenta sus competencias debería estar ganando mejores ingresos', 5, 1),
	(106, 'Busca trabajo por primera vez o había trabajado antes por lo menos durante dos semanas consecutivas', 5, 1),
	(107, 'Cuántos meses ha estado buscando trabajo', 5, 2),
	(108, 'Considera que será fácil conseguir el empleo que busca', 5, 1),
	(109, 'Cuál considera la principal dificultad a la hora de conseguir el trabajo que busca', 5, 4),
	(110, 'Cuál es el canal de búsqueda de empleo que considera podría ser el más efectivo', 5, 1),
	(111, 'Si tuviera la oportunidad de cursar de nuevo sus estudios de pregrado ¿volvería nuevamente a estudiar en esta institución', 6, 1),
	(112, 'Cuál sería la principal razón para querer volver a esta Institución', 6, 4),
	(113, 'Cuál sería la principal razón para no querer volver a esta Institución', 6, 4),
	(114, 'En el futuro, le gustaría cursar otros estudios en esta institución', 6, 1),
	(115, 'Principalmente, qué otros estudios le gustaría cursar en esta institución', 6, 1),
	(116, 'Recomendaría a un bachiller seleccionar el programa que estudió en esta Institución', 6, 1),
	(117, 'Relaciones interpersonales', 7, 1),
	(118, 'Formación académica', 7, 1),
	(119, 'Fundamentación teórica', 7, 1),
	(120, 'Disponibilidad de tiempo', 7, 1),
	(121, 'Procesos de aprendizaje (metodología, ayudas utilizadas)', 7, 1),
	(122, 'Trabajo de campo/pruebas experimentales', 7, 1),
	(123, 'Posibilidad de intercambios', 7, 1),
	(124, 'Gestión de prácticas empresariales', 7, 1),
	(125, 'Gestión para identificar oportunidades de empleo', 7, 1),
	(126, 'Apoyo para desarrollar investigaciones', 7, 1),
	(127, 'Apoyo a seminarios de actualización', 7, 1),
	(128, 'Asistencia médica/psicológica', 7, 1),
	(129, 'Asistencia espiritual', 7, 1),
	(130, 'Agilidad trámites administrativos', 7, 1),
	(131, 'Atención del personal administrativo', 7, 1),
	(132, 'Salones de clase', 7, 1),
	(133, 'Laboratorios y talleres', 7, 1),
	(134, 'Espacios para estudiar', 7, 1),
	(135, 'Ayudas audiovisuales', 7, 1),
	(136, 'Aulas de informática', 7, 1),
	(137, 'Espacios práctica deportiva', 7, 1),
	(138, 'Espacios para realizar actividades artísticas/culturales', 7, 1),
	(139, 'Biblioteca', 7, 1),
	(140, 'Medios de comunicación', 7, 1);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


# Dumping structure for table olabing.respuesta
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE IF NOT EXISTS `respuesta` (
  `id_respuesta` int(10) NOT NULL auto_increment,
  `concepto` varchar(200) NOT NULL,
  `fk_pregunta` int(10) NOT NULL,
  `ir` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id_respuesta`),
  KEY `FK_pregunta` (`fk_pregunta`),
  CONSTRAINT `FK_pregunta` FOREIGN KEY (`fk_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.respuesta: ~511 rows (approximately)
DELETE FROM `respuesta`;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` (`id_respuesta`, `concepto`, `fk_pregunta`, `ir`) VALUES
	(1, 'Soltero(a)', 1, ''),
	(2, 'Casado(a)/Union Libre', 1, ''),
	(3, '', 2, ''),
	(4, 'En arriendo', 3, ''),
	(5, 'Propia y la está pagando', 3, ''),
	(6, 'Propia totalmente pagada', 3, ''),
	(7, 'De un familiar sin pagar arriendo', 3, ''),
	(8, 'De un tercero sin pagar arriendo', 3, ''),
	(9, 'Otra', 3, ''),
	(10, 'No sabe', 4, ''),
	(11, 'Nunca estudió', 4, ''),
	(12, 'Primaria incompleta', 4, ''),
	(13, 'Primaria completa', 4, ''),
	(14, 'Secundaria incompleta', 4, ''),
	(15, 'Secundaria completa', 4, ''),
	(16, 'Educación técnica', 4, ''),
	(17, 'Educación tecnológica', 4, ''),
	(18, 'Educación universitaria incompleta', 4, ''),
	(19, 'Educación universitaria completa', 4, ''),
	(20, 'Educación de postgrado', 4, ''),
	(21, 'Empleado de empresa particular', 5, ''),
	(22, 'Empleado del gobierno', 5, ''),
	(23, 'Trabajador independiente o por cuenta propia', 5, ''),
	(24, 'Patrón o empleador', 5, ''),
	(25, 'Trabajador familiar sin remuneración', 5, ''),
	(26, 'Oficios del hogar', 5, ''),
	(27, 'No sabe', 6, ''),
	(28, 'Nunca estudió', 6, ''),
	(29, 'Primaria incompleta', 6, ''),
	(30, 'Primaria completa', 6, ''),
	(31, 'Secundaria incompleta', 6, ''),
	(32, 'Secundaria completa', 6, ''),
	(33, 'Educación técnica', 6, ''),
	(34, 'Educación tecnológica', 6, ''),
	(35, 'Educación universitaria incompleta', 6, ''),
	(36, 'Educación universitaria completa', 6, ''),
	(37, 'Educación de postgrado', 6, ''),
	(38, 'Empleada de empresa particular', 7, ''),
	(39, 'Empleada del gobierno', 7, ''),
	(40, 'Trabajador independiente o por cuenta propia', 7, ''),
	(41, 'Patrón o empleador', 7, ''),
	(42, 'Trabajador familiar sin remuneración', 7, ''),
	(43, 'Oficios del hogar', 7, ''),
	(44, 'Indígena', 8, ''),
	(45, 'Rom', 8, ''),
	(46, 'Raizal del archipiélago de San Andrés y Providencia', 8, ''),
	(47, 'Palenquero de San Basilio', 8, ''),
	(48, 'Negro, mulato, afrocolombiano o afrodescediente', 8, ''),
	(49, 'Mestizo', 8, ''),
	(50, 'Ninguna de las anteriores', 8, ''),
	(51, 'No tengo', 9, '→ Parte B'),
	(52, 'Moverse o caminar', 9, ''),
	(53, 'Usar sus brazos y manos', 9, ''),
	(54, 'Ver, a pesar de usar lentes o gafas', 9, ''),
	(55, 'Oír, aún con aparatos especiales', 9, ''),
	(56, 'Hablar', 9, ''),
	(57, 'Entender o aprender', 9, ''),
	(58, 'Relacionarse con los demás por problemas mentales o emocionales', 9, ''),
	(59, 'Otra limitación permanente', 9, ''),
	(60, 'Moverse o caminar', 10, ''),
	(61, 'Usar sus brazos y manos', 10, ''),
	(62, 'Ver, a pesar de usar lentes o gafas', 10, ''),
	(63, 'Oír, aún con aparatos especiales', 10, ''),
	(64, 'Hablar', 10, ''),
	(65, 'Entender o aprender', 10, ''),
	(66, 'Relacionarse con los demás por problemas mentales o emocionales', 10, ''),
	(67, 'Otra limitación permanente', 10, ''),
	(68, 'Años', 11, ''),
	(69, 'Menos de tres meses', 12, '→ Pase a 4'),
	(70, 'Entre tres y seis meses', 12, ''),
	(71, 'Más de seis y hasta 1 año', 12, ''),
	(72, 'Más de 1 Año', 12, ''),
	(73, 'No recuerda', 12, ''),
	(74, 'Por bajos resultados en el examen del ICFES/admisión', 13, ''),
	(75, 'Por bajos resultados en la entrevista de ingreso', 13, ''),
	(76, 'Falta de recursos', 13, ''),
	(77, 'Para trabajar', 13, ''),
	(78, 'Buscar trabajo', 13, ''),
	(79, 'Estudiar idiomas', 13, ''),
	(80, 'Realizar cursos no formales', 13, ''),
	(81, 'Prestar el servicio militar/servicio social', 13, ''),
	(82, 'Atender problemas de salud', 13, ''),
	(83, 'Viajar al exterior', 13, ''),
	(84, 'Otros motivos', 13, ''),
	(85, '1.', 14, ''),
	(86, '2.', 14, ''),
	(87, 'La familia', 15, ''),
	(88, 'Los amigos', 15, ''),
	(89, 'Sus habilidades y destrezas', 15, ''),
	(90, 'Su vocación', 15, ''),
	(91, 'Los ingresos de los profesionales de esta carrera', 15, ''),
	(92, 'La orientación del colegio', 15, ''),
	(93, 'La asesoría de las instituciones que visitaron el colegio', 15, ''),
	(94, 'Bajo costo de la matrícula', 15, ''),
	(95, 'Ninguno en particular', 15, ''),
	(96, 'Otro', 15, ''),
	(97, 'Cuál', 15, ''),
	(98, 'Recursos propios', 16, ''),
	(99, 'Padres / acudientes', 16, ''),
	(100, 'Otros familiares', 16, ''),
	(101, 'Becas / subsidios', 16, '→ Pase a 7'),
	(102, 'Crédito educativo', 16, '→ Pase a 8'),
	(103, 'Institución donde cursó sus estudios', 17, ''),
	(104, 'ICETEX', 17, ''),
	(105, 'Gobierno Nacional o Departamental', 17, ''),
	(106, 'Gobierno Distrital o Municipal', 17, ''),
	(107, 'Empresa donde Ud. o un familiar trabaja', 17, ''),
	(108, 'Otra', 17, ''),
	(109, 'ICETEX', 18, ''),
	(110, 'Otra entidad pública', 18, ''),
	(111, 'Entidad financiera', 18, ''),
	(112, 'Institución donde cursó su carrera', 18, ''),
	(113, 'Fundación/(ONG)', 18, ''),
	(114, 'Otra entidad', 18, ''),
	(115, 'Si', 19, ''),
	(116, 'No', 19, ''),
	(117, 'Si', 20, ''),
	(118, 'No', 20, ''),
	(119, 'Inglés', 21, ''),
	(120, 'Francés', 21, ''),
	(121, 'Italiano', 21, ''),
	(122, 'Portugués', 21, ''),
	(123, 'Mandarín', 21, ''),
	(124, 'Alemán', 21, ''),
	(125, 'Japonés', 21, ''),
	(126, 'Árabe', 21, ''),
	(127, 'Ninguno', 21, ''),
	(128, 'Bajo', 22, ''),
	(129, 'Medio', 22, ''),
	(130, 'Alto', 22, ''),
	(131, 'Bajo', 23, ''),
	(132, 'Medio', 23, ''),
	(133, 'Alto', 23, ''),
	(134, 'Bajo', 24, ''),
	(135, 'Medio', 24, ''),
	(136, 'Alto', 24, ''),
	(137, 'Bajo', 25, ''),
	(138, 'Medio', 25, ''),
	(139, 'Alto', 25, ''),
	(140, 'Bajo', 26, ''),
	(141, 'Medio', 26, ''),
	(142, 'Alto', 26, ''),
	(143, 'Bajo', 27, ''),
	(144, 'Medio', 27, ''),
	(145, 'Alto', 27, ''),
	(146, 'Bajo', 28, ''),
	(147, 'Medio', 28, ''),
	(148, 'Alto', 28, ''),
	(149, 'Bajo', 29, ''),
	(150, 'Medio', 29, ''),
	(151, 'Alto', 29, ''),
	(152, 'Bajo', 30, ''),
	(153, 'Medio', 30, ''),
	(154, 'Alto', 30, ''),
	(155, 'Bajo', 31, ''),
	(156, 'Medio', 31, ''),
	(157, 'Alto', 31, ''),
	(158, 'Bajo', 32, ''),
	(159, 'Medio', 32, ''),
	(160, 'Alto', 32, ''),
	(161, 'Bajo', 33, ''),
	(162, 'Medio', 33, ''),
	(163, 'Alto', 33, ''),
	(164, 'Bajo', 34, ''),
	(165, 'Medio', 34, ''),
	(166, 'Alto', 34, ''),
	(167, 'Bajo', 35, ''),
	(168, 'Medio', 35, ''),
	(169, 'Alto', 35, ''),
	(170, 'Bajo', 36, ''),
	(171, 'Medio', 36, ''),
	(172, 'Alto', 36, ''),
	(173, 'Bajo', 37, ''),
	(174, 'Medio', 37, ''),
	(175, 'Alto', 37, ''),
	(176, 'Bajo', 38, ''),
	(177, 'Medio', 38, ''),
	(178, 'Alto', 38, ''),
	(179, 'Bajo', 39, ''),
	(180, 'Medio', 39, ''),
	(181, 'Alto', 39, ''),
	(182, 'Bajo', 40, ''),
	(183, 'Medio', 40, ''),
	(184, 'Alto', 40, ''),
	(185, 'Bajo', 41, ''),
	(186, 'Medio', 41, ''),
	(187, 'Alto', 41, ''),
	(188, 'Bajo', 42, ''),
	(189, 'Medio', 42, ''),
	(190, 'Alto', 42, ''),
	(191, 'Bajo', 43, ''),
	(192, 'Medio', 43, ''),
	(193, 'Alto', 43, ''),
	(194, 'Bajo', 44, ''),
	(195, 'Medio', 44, ''),
	(196, 'Alto', 44, ''),
	(197, 'Bajo', 45, ''),
	(198, 'Medio', 45, ''),
	(199, 'Alto', 45, ''),
	(200, 'Bajo', 46, ''),
	(201, 'Medio', 46, ''),
	(202, 'Alto', 46, ''),
	(203, 'Bajo', 47, ''),
	(204, 'Medio', 47, ''),
	(205, 'Alto', 47, ''),
	(206, 'Bajo', 48, ''),
	(207, 'Medio', 48, ''),
	(208, 'Alto', 48, ''),
	(209, 'Bajo', 49, ''),
	(210, 'Medio', 49, ''),
	(211, 'Alto', 49, ''),
	(212, 'Bajo', 50, ''),
	(213, 'Medio', 50, ''),
	(214, 'Alto', 50, ''),
	(215, 'Bajo', 51, ''),
	(216, 'Medio', 51, ''),
	(217, 'Alto', 51, ''),
	(218, 'Bajo', 52, ''),
	(219, 'Medio', 52, ''),
	(220, 'Alto', 52, ''),
	(221, 'Bajo', 53, ''),
	(222, 'Medio', 53, ''),
	(223, 'Alto', 53, ''),
	(224, 'Muy Insatisfecho', 54, ''),
	(225, 'Insatisfecho', 54, ''),
	(226, 'Satisfecho', 54, ''),
	(227, 'Muy Satisfecho', 54, ''),
	(228, 'Muy Satisfecho', 55, ''),
	(229, 'Satisfecho', 55, ''),
	(230, 'Insatisfecho', 55, ''),
	(231, 'Muy Insatisfecho', 55, ''),
	(232, 'Muy Insatisfecho', 56, ''),
	(233, 'Insatisfecho', 56, ''),
	(234, 'Satisfecho', 56, ''),
	(235, 'Muy Satisfecho', 56, ''),
	(236, 'Muy Satisfecho', 57, ''),
	(237, 'Satisfecho', 57, ''),
	(238, 'Insatisfecho', 57, ''),
	(239, 'Muy Insatisfecho', 57, ''),
	(240, 'Muy Insatisfecho', 58, ''),
	(241, 'Insatisfecho', 58, ''),
	(242, 'Satisfecho', 58, ''),
	(243, 'Muy Satisfecho', 58, ''),
	(244, 'Muy Insatisfecho', 59, ''),
	(245, 'Insatisfecho', 59, ''),
	(246, 'Satisfecho', 59, ''),
	(247, 'Muy Satisfecho', 59, ''),
	(248, 'Muy Insatisfecho', 60, ''),
	(249, 'Insatisfecho', 60, ''),
	(250, 'Satisfecho', 60, ''),
	(251, 'Muy Satisfecho', 60, ''),
	(252, 'Muy Insatisfecho', 61, ''),
	(253, 'Insatisfecho', 61, ''),
	(254, 'Satisfecho', 61, ''),
	(255, 'Muy Satisfecho', 61, ''),
	(256, 'Muy Insatisfecho', 62, ''),
	(257, 'Insatisfecho', 62, ''),
	(258, 'Satisfecho', 62, ''),
	(259, 'Muy Satisfecho', 62, ''),
	(260, 'Muy Insatisfecho', 63, ''),
	(261, 'Insatisfecho', 63, ''),
	(262, 'Satisfecho', 63, ''),
	(263, 'Muy Satisfecho', 63, ''),
	(264, 'Muy Insatisfecho', 64, ''),
	(265, 'Insatisfecho', 64, ''),
	(266, 'Satisfecho', 64, ''),
	(267, 'Muy Satisfecho', 64, ''),
	(268, 'Muy Insatisfecho', 65, ''),
	(269, 'Insatisfecho', 65, ''),
	(270, 'Satisfecho', 65, ''),
	(271, 'Muy Satisfecho', 65, ''),
	(272, 'Muy Insatisfecho', 66, ''),
	(273, 'Insatisfecho', 66, ''),
	(274, 'Satisfecho', 66, ''),
	(275, 'Muy Satisfecho', 66, ''),
	(276, 'Muy Insatisfecho', 67, ''),
	(277, 'Insatisfecho', 67, ''),
	(278, 'Satisfecho', 67, ''),
	(279, 'Muy Satisfecho', 67, ''),
	(280, 'Muy Insatisfecho', 68, ''),
	(281, 'Insatisfecho', 68, ''),
	(282, 'Satisfecho', 68, ''),
	(283, 'Muy Satisfecho', 68, ''),
	(284, 'Muy Insatisfecho', 69, ''),
	(285, 'Insatisfecho', 69, ''),
	(286, 'Satisfecho', 69, ''),
	(287, 'Muy Satisfecho', 69, ''),
	(288, 'Iniciar una nueva carrera técnica', 70, ''),
	(289, 'Iniciar una nueva carrera tecnológica', 70, ''),
	(290, 'Iniciar una nueva carrera universitaria', 70, ''),
	(291, 'Estudiar un posgrado en Colombia', 70, ''),
	(292, 'Estudiar un posgrado fuera de Colombia', 70, ''),
	(293, 'Trabajar en Colombia', 70, ''),
	(294, 'Trabajar fuera de Colombia', 70, ''),
	(295, 'Crear una empresa', 70, ''),
	(296, 'Otro', 70, ''),
	(297, 'Trabajando', 71, '→ Pase a 7'),
	(298, 'Buscando trabajo', 71, '→ Pase a 36'),
	(299, 'Estudiando', 71, ''),
	(300, 'Oficios del hogar', 71, ''),
	(301, 'Incapacitado permanente para trabajar', 71, '→Parte F'),
	(302, 'Otra actividad', 71, ''),
	(303, 'Si, tengo una empresa/negocio/finca', 72, '→ Pase a 7'),
	(304, 'Si, trabajo como empleado', 72, '→ Pase a 7'),
	(305, 'Si, trabajo en un negocio familiar sin remuneración', 72, ''),
	(307, 'Si', 73, '→  Pase a 36'),
	(308, 'No', 73, ''),
	(309, 'Si', 74, ''),
	(310, 'No', 74, '→ Parte F'),
	(311, 'Ya encontró trabajo', 75, '→ Parte F'),
	(312, 'No hay trabajo disponible', 75, ''),
	(313, 'Está esperando que lo llamen', 75, ''),
	(314, 'Está cansado de buscar', 75, ''),
	(315, 'No sabe cómo buscarlo', 75, ''),
	(316, 'Los empleadores lo consideran muy joven', 75, ''),
	(317, 'Responsabilidades familiares', 75, '→ Parte F'),
	(318, 'Problemas de salud', 75, '→ Parte F'),
	(319, 'Está estudiando', 75, '→ Parte F'),
	(320, 'Si', 76, '→ Pase a 36'),
	(321, 'No', 76, '→ Parte F'),
	(322, 'Empleado de empresa particular', 77, '→ Pase a 8'),
	(323, 'Empleado del gobierno', 77, '→ Pase a 8'),
	(324, 'Trabajador independiente (sector público o privado)', 77, '→ Pase a 18'),
	(325, 'Empresario/Empleador', 77, '→ Pase a 25'),
	(326, 'Empleado de empresa familiar sin remuneración', 77, '→ Pase a 23'),
	(327, 'Si', 78, ''),
	(328, 'No', 78, ''),
	(329, 'Medios de comunicación', 79, ''),
	(330, 'Bolsa de empleo de la institución donde estudió', 79, ''),
	(331, 'Otras bolsas de empleo (cajas de compensación, internet, head-hunters)', 79, ''),
	(332, 'Redes sociales (familia, amigos, conocidos)', 79, ''),
	(333, 'Servicio Público de Empleo (SPE) SENA', 79, ''),
	(334, 'Contrato a término fijo', 80, ''),
	(335, 'Contrato a término indefinido', 80, ''),
	(336, 'Contrato de prestación de servicios', 80, ''),
	(337, 'Otro tipo de contrato', 80, ''),
	(338, 'Dirección y Gerencia', 81, ''),
	(339, 'Ocupaciones en Finanzas y Administración', 81, ''),
	(340, 'Ocupaciones en Ciencias Naturales, Aplicadas y relacionadas', 81, ''),
	(341, 'Ocupaciones en Salud', 81, ''),
	(342, 'Ocupaciones en Ciencias Sociales, Educación, Servicios Gubernamentales y Religión', 81, ''),
	(343, 'Ocupaciones en Arte, Cultura, Esparcimiento y Deporte', 81, ''),
	(344, 'Ocupaciones en Ventas y Servicios', 81, ''),
	(345, 'Ocupaciones de la Explotación Primaria y Extractiva', 81, ''),
	(346, 'Ocupaciones de la Operación de Equipos, del Transporte y Oficios', 81, ''),
	(347, 'Ocupaciones de Procesamiento, Fabricación y Ensamble', 81, ''),
	(348, 'Agricultura, Ganadería, Caza y Silvicultura', 82, ''),
	(349, 'Pesca', 82, ''),
	(350, 'Explotación de Minas y Canteras', 82, ''),
	(351, 'Industrias Manufactureras', 82, ''),
	(352, 'Suministros de Electricidad, Gas y Agua', 82, ''),
	(353, 'Construcción', 82, ''),
	(354, 'Comercio; Reparación de Automotores, Motocicletas, Efectos Personales y Enseres Domésticos', 82, ''),
	(355, 'Hoteles y Restaurantes', 82, ''),
	(356, 'Transporte, Almacenamiento y Comunicaciones', 82, ''),
	(357, 'Intermediación Financiera', 82, ''),
	(358, 'Actividades Inmobiliarias de Alquiler y Empresariales y de Alquiler', 82, ''),
	(359, 'Administración Pública y Defensa; Seguridad Social de Afiliación Obligatoria', 82, ''),
	(360, 'Educación', 82, ''),
	(361, 'Servicios Sociales y de Salud', 82, ''),
	(362, 'Otras Actividades de Servicios Comunitarios, Sociales y Personales', 82, ''),
	(363, 'Hogares Privados con Servicio Doméstico', 82, ''),
	(364, 'Organizaciones y Órganos Extraterritoriales', 82, ''),
	(365, 'Directamente relacionado', 83, ''),
	(366, 'Indirectamente relacionado', 83, ''),
	(367, 'Nada relacionado', 83, ''),
	(368, '$', 84, ''),
	(369, 'Horas a la semana', 85, ''),
	(370, 'Local (a nivel municipio)', 86, ''),
	(371, 'Regional (a nivel departamento)', 86, ''),
	(372, 'Nacional', 86, ''),
	(373, 'Multinacional', 86, ''),
	(374, 'Si', 87, '→ Pase a 23'),
	(375, 'No', 87, '→ Pase a 23'),
	(376, 'Si', 88, ''),
	(377, 'No', 88, ''),
	(378, 'Directamente relacionado', 89, ''),
	(379, 'Indirectamente relacionado', 89, ''),
	(380, 'Nada relacionado', 89, ''),
	(381, 'Prestación de servicios', 90, ''),
	(382, 'Trabajo por obra', 90, ''),
	(383, 'Trabajo por piezas o a destajo', 90, ''),
	(384, 'Trabajo por comisión', 90, ''),
	(385, 'Venta por catálogo', 90, ''),
	(386, 'Se dedica a un oficio', 90, ''),
	(387, 'Agricultura, Ganadería, Caza y Silvicultura', 91, ''),
	(388, 'Pesca', 91, ''),
	(389, 'Explotación de Minas y Canteras', 91, ''),
	(390, 'Industrias Manufactureras', 91, ''),
	(391, 'Suministros de Electricidad, Gas y Agua', 91, ''),
	(392, 'Construcción', 91, ''),
	(393, 'Comercio; Reparación de Automotores, Motocicletas, Efectos Personales y Enseres Domésticos', 91, ''),
	(394, 'Hoteles y Restaurantes', 91, ''),
	(395, 'Transporte, Almacenamiento y Comunicaciones', 91, ''),
	(396, 'Intermediación Financiera', 91, ''),
	(397, 'Actividades Inmobiliarias de Alquiler y Empresariales y de Alquiler', 91, ''),
	(398, 'Administración Pública y Defensa; Seguridad Social de Afiliación Obligatoria', 91, ''),
	(399, 'Educación', 91, ''),
	(400, 'Servicios Sociales y de Salud', 91, ''),
	(401, 'Otras Actividades de Servicios Comunitarios, Sociales y Personales', 91, ''),
	(402, 'Hogares Privados con Servicio Doméstico', 91, ''),
	(403, 'Organizaciones y Órganos Extraterritoriales', 91, ''),
	(404, '$', 92, ''),
	(405, 'Si', 93, ''),
	(406, 'No', 93, '→ Pase a 29'),
	(407, 'No estar seguro si la idea pueda convertirse en un negocio exitoso', 94, ''),
	(408, 'Falta de recursos económicos propios', 94, ''),
	(409, 'No poder encontrar socios de confianza', 94, ''),
	(410, 'No tener conocimientos para la creación de una empresa', 94, ''),
	(411, 'Difícil acceso a las entidades financieras', 94, ''),
	(412, 'Falta de apoyo del gobierno', 94, ''),
	(413, 'La costumbre de tener un salario fijo', 94, ''),
	(414, 'Miedo para asumir el riesgo', 94, ''),
	(415, 'Otros', 94, ''),
	(416, '¿Cuáles?', 94, '→ Pase a 29'),
	(417, 'Si', 95, ''),
	(418, 'No', 95, ''),
	(419, 'Directamente relacionado', 96, ''),
	(420, 'Indirectamente relacionado', 96, ''),
	(421, 'Nada relacionado', 96, ''),
	(422, 'Agricultura, Ganadería, Caza y Silvicultura', 97, ''),
	(423, 'Pesca', 97, ''),
	(424, 'Explotación de Minas y Canteras', 97, ''),
	(425, 'Industrias Manufactureras', 97, ''),
	(426, 'Suministros de Electricidad, Gas y Agua', 97, ''),
	(427, 'Construcción', 97, ''),
	(428, 'Comercio; Reparación de Automotores, Motocicletas, Efectos Personales y Enseres Domésticos', 97, ''),
	(429, 'Hoteles y Restaurantes', 97, ''),
	(430, 'Transporte, Almacenamiento y Comunicaciones', 97, ''),
	(431, 'Intermediación Financiera', 97, ''),
	(432, 'Actividades Inmobiliarias de Alquiler y Empresariales y de Alquiler', 97, ''),
	(433, 'Administración Pública y Defensa; Seguridad Social de Afiliación Obligatoria', 97, ''),
	(434, 'Educación', 97, ''),
	(435, 'Servicios Sociales y de Salud', 97, ''),
	(436, 'Otras Actividades de Servicios Comunitarios, Sociales y Personales', 97, ''),
	(437, 'Hogares Privados con Servicio Doméstico', 97, ''),
	(438, 'Organizaciones y Órganos Extraterritoriales', 97, ''),
	(439, '$', 98, ''),
	(440, 'Muy útiles', 99, ''),
	(441, 'Útiles', 99, ''),
	(442, 'Poco útiles', 99, ''),
	(443, 'Nada útiles', 99, ''),
	(444, 'Si', 100, ''),
	(445, 'No', 100, ''),
	(446, 'Muy Insatisfecho', 101, ''),
	(447, 'Insatisfecho', 101, ''),
	(448, 'Satisfecho', 101, ''),
	(449, 'Muy Satisfecho', 101, ''),
	(450, 'Básico', 102, ''),
	(451, 'Bachiller', 102, ''),
	(452, 'Técnico', 102, ''),
	(453, 'Tecnológico', 102, ''),
	(454, 'Universitario', 102, ''),
	(455, 'Especialización', 102, ''),
	(456, 'Maestría', 102, ''),
	(457, 'Doctorado', 102, ''),
	(458, 'Si', 103, ''),
	(459, 'No', 103, ''),
	(460, 'No aplica', 103, ''),
	(461, 'Si', 104, ''),
	(462, 'No', 104, ''),
	(463, 'Si', 105, '→  Parte F'),
	(464, 'No', 105, '→  Parte F'),
	(465, 'Primera vez', 106, ''),
	(466, 'Trabajó antes', 106, '→ Pase a 38'),
	(467, 'meses', 107, ''),
	(468, 'Si', 108, ''),
	(469, 'No', 108, ''),
	(470, 'No sabe', 108, ''),
	(471, 'No hay trabajo disponible en la ciudad en donde vive', 109, ''),
	(472, 'No sabe cómo buscarlo', 109, ''),
	(473, 'No encuentra el trabajo apropiado en su oficio o profesión', 109, ''),
	(474, 'Carece de la experiencia necesaria', 109, ''),
	(475, 'Los empleadores lo ven muy joven', 109, ''),
	(476, 'Carece de las competencias requeridas', 109, ''),
	(477, 'El salario que le ofrecen es muy bajo', 109, ''),
	(478, 'Otro', 109, ''),
	(479, '¿Cuáles?', 109, ''),
	(480, 'Medios de comunicación', 110, ''),
	(481, 'Bolsa de empleo de la institución donde estudió', 110, ''),
	(482, 'Otras bolsas de empleo (cajas de compensación, internet, head-hunters)', 110, ''),
	(483, 'Redes sociales (familia, amigos, conocidos)', 110, ''),
	(484, 'Servicio Público de Empleo (SPE) SENA', 110, ''),
	(485, 'Si', 111, '→ Pase a 2'),
	(486, 'No', 111, '→ Pase a 3'),
	(487, 'Calidad de la formación', 112, '→ Pase a 4'),
	(488, 'Calidad de los profesores', 112, '→ Pase a 4'),
	(489, 'Reconocimiento de la institución', 112, '→ Pase a 4'),
	(490, 'Fundamentación para crear empresa', 112, '→ Pase a 4'),
	(491, 'Los recursos de apoyo al proceso de formación', 112, '→ Pase a 4'),
	(492, 'Posibilidad de encontrar empleo rápidamente', 112, '→ Pase a 4'),
	(493, 'Otras', 112, '→ Pase a 4'),
	(494, '¿Cuáles?', 112, '→ Pase a 4'),
	(495, 'Baja calidad en la formación', 113, ''),
	(496, 'Los docentes no cuentan con la preparación adecuada', 113, ''),
	(497, 'Poco reconocimiento de la institución', 113, ''),
	(498, 'Poca fundamentación para crear empresa', 113, ''),
	(499, 'La institución no cuenta con los recursos necesarios para apoyar el proceso de formación', 113, ''),
	(500, 'Valor de los programas supera la disponibilidad de recursos', 113, ''),
	(501, 'Otra', 113, ''),
	(502, '¿Cuáles?', 113, ''),
	(503, 'Si', 114, ''),
	(504, 'No', 114, '→ Pase a 6'),
	(505, 'Seminarios/Cursos', 115, ''),
	(506, 'Diplomados', 115, ''),
	(507, 'Técnicos', 115, ''),
	(508, 'Tecnológicos', 115, ''),
	(509, 'Universitarios', 115, ''),
	(510, 'Especialización', 115, ''),
	(511, 'Maestría', 115, ''),
	(512, 'Doctorado', 115, ''),
	(513, 'Si', 116, ''),
	(514, 'No', 116, ''),
	(515, 'Muy Insatisfecho', 117, ''),
	(516, 'Insatisfecho', 117, ''),
	(517, 'Satisfecho', 117, ''),
	(518, 'Muy Satisfecho', 117, ''),
	(519, 'Muy Insatisfecho', 118, ''),
	(520, 'Insatisfecho', 118, ''),
	(521, 'Satisfecho', 118, ''),
	(522, 'Muy Satisfecho', 118, ''),
	(523, 'Muy Insatisfecho', 119, ''),
	(524, 'Insatisfecho', 119, ''),
	(525, 'Satisfecho', 119, ''),
	(526, 'Muy Satisfecho', 119, ''),
	(527, 'Muy Insatisfecho', 120, ''),
	(528, 'Insatisfecho', 120, ''),
	(529, 'Satisfecho', 120, ''),
	(530, 'Muy Satisfecho', 120, ''),
	(531, 'Muy Insatisfecho', 121, ''),
	(532, 'Insatisfecho', 121, ''),
	(533, 'Satisfecho', 121, ''),
	(534, 'Muy Satisfecho', 121, ''),
	(535, 'Muy Insatisfecho', 122, ''),
	(536, 'Insatisfecho', 122, ''),
	(537, 'Satisfecho', 122, ''),
	(538, 'Muy Satisfecho', 122, ''),
	(539, 'Muy Insatisfecho', 123, ''),
	(540, 'Insatisfecho', 123, ''),
	(541, 'Satisfecho', 123, ''),
	(542, 'Muy Satisfecho', 123, ''),
	(543, 'Muy Insatisfecho', 124, ''),
	(544, 'Insatisfecho', 124, ''),
	(545, 'Satisfecho', 124, ''),
	(546, 'Muy Satisfecho', 124, ''),
	(547, 'Muy Insatisfecho', 125, ''),
	(548, 'Insatisfecho', 125, ''),
	(549, 'Satisfecho', 125, ''),
	(550, 'Muy Satisfecho', 125, ''),
	(551, 'Muy Insatisfecho', 126, ''),
	(552, 'Insatisfecho', 126, ''),
	(553, 'Satisfecho', 126, ''),
	(554, 'Muy Satisfecho', 126, ''),
	(555, 'Muy Insatisfecho', 127, ''),
	(556, 'Insatisfecho', 127, ''),
	(557, 'Satisfecho', 127, ''),
	(558, 'Muy Satisfecho', 127, ''),
	(559, 'Muy Insatisfecho', 128, ''),
	(560, 'Insatisfecho', 128, ''),
	(561, 'Satisfecho', 128, ''),
	(562, 'Muy Satisfecho', 128, ''),
	(563, 'Muy Insatisfecho', 129, ''),
	(564, 'Insatisfecho', 129, ''),
	(565, 'Satisfecho', 129, ''),
	(566, 'Muy Satisfecho', 129, ''),
	(567, 'Muy Insatisfecho', 130, ''),
	(568, 'Insatisfecho', 130, ''),
	(569, 'Satisfecho', 130, ''),
	(570, 'Muy Satisfecho', 130, ''),
	(571, 'Muy Insatisfecho', 131, ''),
	(572, 'Insatisfecho', 131, ''),
	(573, 'Satisfecho', 131, ''),
	(574, 'Muy Satisfecho', 131, ''),
	(575, 'Muy Insatisfecho', 132, ''),
	(576, 'Insatisfecho', 132, ''),
	(577, 'Satisfecho', 132, ''),
	(578, 'Muy Satisfecho', 132, ''),
	(579, 'Muy Insatisfecho', 133, ''),
	(580, 'Insatisfecho', 133, ''),
	(581, 'Satisfecho', 133, ''),
	(582, 'Muy Satisfecho', 133, ''),
	(583, 'Muy Insatisfecho', 134, ''),
	(584, 'Insatisfecho', 134, ''),
	(585, 'Satisfecho', 134, ''),
	(586, 'Muy Satisfecho', 134, ''),
	(587, 'Muy Insatisfecho', 135, ''),
	(588, 'Insatisfecho', 135, ''),
	(589, 'Satisfecho', 135, ''),
	(590, 'Muy Satisfecho', 135, ''),
	(591, 'Muy Insatisfecho', 136, ''),
	(592, 'Insatisfecho', 136, ''),
	(593, 'Satisfecho', 136, ''),
	(594, 'Muy Satisfecho', 136, ''),
	(595, 'Muy Insatisfecho', 137, ''),
	(596, 'Insatisfecho', 137, ''),
	(597, 'Satisfecho', 137, ''),
	(598, 'Muy Satisfecho', 137, ''),
	(599, 'Muy Insatisfecho', 138, ''),
	(600, 'Insatisfecho', 138, ''),
	(601, 'Satisfecho', 138, ''),
	(602, 'Muy Satisfecho', 138, ''),
	(603, 'Muy Insatisfecho', 139, ''),
	(604, 'Insatisfecho', 139, ''),
	(605, 'Satisfecho', 139, ''),
	(606, 'Muy Satisfecho', 139, ''),
	(607, 'Muy Insatisfecho', 140, ''),
	(608, 'Insatisfecho', 140, ''),
	(609, 'Satisfecho', 140, ''),
	(610, 'Muy Satisfecho', 140, '');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;


# Dumping structure for table olabing.tema
DROP TABLE IF EXISTS `tema`;
CREATE TABLE IF NOT EXISTS `tema` (
  `id_tema` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_tema`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.tema: ~4 rows (approximately)
DELETE FROM `tema`;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` (`id_tema`, `nombre`) VALUES
	(1, 'Programación'),
	(2, 'Matemática'),
	(3, 'Física'),
	(4, 'Lógica');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;


# Dumping structure for table olabing.tipo_foro
DROP TABLE IF EXISTS `tipo_foro`;
CREATE TABLE IF NOT EXISTS `tipo_foro` (
  `id_tipo_foro` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_tipo_foro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.tipo_foro: ~2 rows (approximately)
DELETE FROM `tipo_foro`;
/*!40000 ALTER TABLE `tipo_foro` DISABLE KEYS */;
INSERT INTO `tipo_foro` (`id_tipo_foro`, `nombre`) VALUES
	(1, 'Academico'),
	(2, 'Investigación');
/*!40000 ALTER TABLE `tipo_foro` ENABLE KEYS */;


# Dumping structure for table olabing.tipo_oferta
DROP TABLE IF EXISTS `tipo_oferta`;
CREATE TABLE IF NOT EXISTS `tipo_oferta` (
  `id_tipo_ofe` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_tipo_ofe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.tipo_oferta: ~2 rows (approximately)
DELETE FROM `tipo_oferta`;
/*!40000 ALTER TABLE `tipo_oferta` DISABLE KEYS */;
INSERT INTO `tipo_oferta` (`id_tipo_ofe`, `nombre`) VALUES
	(1, 'Academica'),
	(2, 'Empleo');
/*!40000 ALTER TABLE `tipo_oferta` ENABLE KEYS */;


# Dumping structure for table olabing.tipo_pregunta
DROP TABLE IF EXISTS `tipo_pregunta`;
CREATE TABLE IF NOT EXISTS `tipo_pregunta` (
  `id_tipo_pregunta` int(10) NOT NULL auto_increment,
  `concepto` varchar(100) NOT NULL,
  PRIMARY KEY  (`id_tipo_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.tipo_pregunta: ~4 rows (approximately)
DELETE FROM `tipo_pregunta`;
/*!40000 ALTER TABLE `tipo_pregunta` DISABLE KEYS */;
INSERT INTO `tipo_pregunta` (`id_tipo_pregunta`, `concepto`) VALUES
	(1, 'seleccion multiple - unica respuesta'),
	(2, 'justificacion'),
	(3, 'seleccion multiple - multiple respuesta'),
	(4, 'seleccion multiple - unica respuesta - otra');
/*!40000 ALTER TABLE `tipo_pregunta` ENABLE KEYS */;


# Dumping structure for table olabing.tipo_usuario
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipo_usu` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_tipo_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.tipo_usuario: ~2 rows (approximately)
DELETE FROM `tipo_usuario`;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` (`id_tipo_usu`, `nombre`) VALUES
	(1, 'Estudiante pregrado'),
	(2, 'Egresado');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;


# Dumping structure for table olabing.topico
DROP TABLE IF EXISTS `topico`;
CREATE TABLE IF NOT EXISTS `topico` (
  `id_topico` int(10) NOT NULL auto_increment,
  `concepto` varchar(300) NOT NULL,
  `fk_encuesta` int(10) NOT NULL,
  PRIMARY KEY  (`id_topico`),
  KEY `FK_encuesta` (`fk_encuesta`),
  CONSTRAINT `FK_encuesta` FOREIGN KEY (`fk_encuesta`) REFERENCES `encuesta` (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

# Dumping data for table olabing.topico: ~7 rows (approximately)
DELETE FROM `topico`;
/*!40000 ALTER TABLE `topico` DISABLE KEYS */;
INSERT INTO `topico` (`id_topico`, `concepto`, `fk_encuesta`) VALUES
	(1, 'ParteA. Información personal y familiar', 1),
	(2, 'Parte B. Historia Académica y Financiación', 1),
	(3, 'Parte C. Competencias', 1),
	(4, 'Parte D. Plan de vida', 1),
	(5, 'Parte E. Situación laboral', 1),
	(6, 'Parte F. Nivel de Identidad con la Institución de Educación Superior', 1),
	(7, 'Parte G. Satisfacción con los recursos ofrecidos por la Institución', 1);
/*!40000 ALTER TABLE `topico` ENABLE KEYS */;


# Dumping structure for table olabing.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cod` varchar(10) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `nombre1` varchar(50) NOT NULL,
  `nombre2` varchar(50) default NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) default NULL,
  `correo_base` varchar(200) NOT NULL,
  `correo_insti` varchar(200) default NULL,
  `fk_tipo_usu` int(10) NOT NULL,
  `foto` varchar(300) default NULL,
  `año_grado` year(4) default NULL,
  `telcele1` varchar(13) default NULL,
  `telcele2` varchar(13) default NULL,
  `telefijo` varchar(10) default NULL,
  PRIMARY KEY  (`cod`),
  KEY `FK_tipo_usu` (`fk_tipo_usu`),
  CONSTRAINT `FK_tipo_usu` FOREIGN KEY (`fk_tipo_usu`) REFERENCES `tipo_usuario` (`id_tipo_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table olabing.usuario: ~20 rows (approximately)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`cod`, `cedula`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `correo_base`, `correo_insti`, `fk_tipo_usu`, `foto`, `año_grado`, `telcele1`, `telcele2`, `telefijo`) VALUES
	('172007758', '1117', 'Manuel', 'Alberto', 'Velasquez', 'Castaño', 'muser@hotmail.com', 'm.user@udla.edu.co', 2, 'http://192.168.1.50:8091/imagenes/manuel.jpg', '2012', '3105647755', NULL, NULL),
	('172007774', '1030', 'Leidy', 'Viviana', 'Espinosa', 'Sarmiento', 'luser@hotmail.com', 'l.user@udla.edu.co', 1, 'http://192.168.1.50:8091/imagenes/leidy.jpg', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
