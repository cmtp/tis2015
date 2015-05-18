
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividad_grupo_empresa
-- ----------------------------
DROP TABLE IF EXISTS `actividad_grupo_empresa`;
CREATE TABLE `actividad_grupo_empresa` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `porcentaje_completado` decimal(6,2) DEFAULT '0.00',
  `modificado` int(11) DEFAULT '0',
  `entrega_producto` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `fk_actividad_grupo_empresa_entrega_producto1_idx` (`entrega_producto`),
  KEY `id_responsable` (`id_responsable`),
  KEY `id_responsable_2` (`id_responsable`),
  CONSTRAINT `fk_actividad_grupo_empresa_entrega_producto1` FOREIGN KEY (`entrega_producto`) REFERENCES `entrega_producto` (`id_entrega_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividad_grupo_empresa
-- ----------------------------

-- ----------------------------
-- Table structure for anuncio
-- ----------------------------
DROP TABLE IF EXISTS `anuncio`;
CREATE TABLE `anuncio` (
  `id_anuncio` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(64) NOT NULL,
  `contenido` text,
  `adjunto` varchar(128) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_anuncio`),
  KEY `fk_anuncio_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_anuncio_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anuncio
-- ----------------------------

-- ----------------------------
-- Table structure for avance_semanal
-- ----------------------------
DROP TABLE IF EXISTS `avance_semanal`;
CREATE TABLE `avance_semanal` (
  `id_avance_semanal` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_revision` date NOT NULL,
  `desc_avance` varchar(128) NOT NULL,
  `enlace_entregable` varchar(128) DEFAULT NULL,
  `observacion` varchar(128) DEFAULT NULL,
  `presentado` int(1) NOT NULL,
  `grupo_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_avance_semanal`),
  KEY `fk_avance_semanal_grupo_empresa1_idx` (`grupo_empresa`),
  CONSTRAINT `fk_avance_semanal_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of avance_semanal
-- ----------------------------

-- ----------------------------
-- Table structure for backup_log
-- ----------------------------
DROP TABLE IF EXISTS `backup_log`;
CREATE TABLE `backup_log` (
  `id_backup` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_backup` varchar(32) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `observacion` varchar(128) NOT NULL,
  PRIMARY KEY (`id_backup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backup_log
-- ----------------------------

-- ----------------------------
-- Table structure for bitacora_bd
-- ----------------------------
DROP TABLE IF EXISTS `bitacora_bd`;
CREATE TABLE `bitacora_bd` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `tabla` varchar(64) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `viejo` text,
  `nuevo` text,
  PRIMARY KEY (`id_bitacora`),
  KEY `fk_bitacora_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_bitacora_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bitacora_bd
-- ----------------------------
INSERT INTO `bitacora_bd` VALUES ('253', '1', 'usuario', '2014-06-23 09:07:57', null, '0,admin,admin,Boris Marcelo,Calancha Navia,4436755,boris@yahoo.com,,1,1,1');

-- ----------------------------
-- Table structure for bitacora_sesion
-- ----------------------------
DROP TABLE IF EXISTS `bitacora_sesion`;
CREATE TABLE `bitacora_sesion` (
  `id_bitacora_sesion` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `operacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_bitacora_sesion`),
  KEY `fk_bitacora_sesion_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_bitacora_sesion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bitacora_sesion
-- ----------------------------

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO `carrera` VALUES ('1', 'Licenciatura en Informática');
INSERT INTO `carrera` VALUES ('2', 'Ingeniería de Sistemas');

-- ----------------------------
-- Table structure for consultor_tis
-- ----------------------------
DROP TABLE IF EXISTS `consultor_tis`;
CREATE TABLE `consultor_tis` (
  `usuario` int(11) NOT NULL,
  `curriculum` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  CONSTRAINT `fk_consultor_tis_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultor_tis
-- ----------------------------

-- ----------------------------
-- Table structure for documento_consultor
-- ----------------------------
DROP TABLE IF EXISTS `documento_consultor`;
CREATE TABLE `documento_consultor` (
  `id_documento_consultor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(64) NOT NULL,
  `descripsion_documento` varchar(128) DEFAULT NULL,
  `ruta_documento` varchar(128) DEFAULT NULL,
  `fecha_documento` datetime NOT NULL,
  `documento_jefe` tinyint(1) NOT NULL,
  `consultor_tis` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_documento_consultor`),
  KEY `fk_documento_consultor_consultor_tis1_idx` (`consultor_tis`),
  KEY `fk_documento_consultor_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_documento_consultor_consultor_tis1` FOREIGN KEY (`consultor_tis`) REFERENCES `consultor_tis` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_consultor_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documento_consultor
-- ----------------------------

-- ----------------------------
-- Table structure for entrega_producto
-- ----------------------------
DROP TABLE IF EXISTS `entrega_producto`;
CREATE TABLE `entrega_producto` (
  `id_entrega_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_real_entrega` date DEFAULT NULL,
  `pago_establecido` decimal(6,2) DEFAULT '0.00',
  `pago_recibido` decimal(6,2) DEFAULT '0.00',
  `observacion` text,
  `enlace_producto` text,
  `grupo_empresa` int(11) NOT NULL,
  `id_responsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entrega_producto`),
  KEY `fk_entrega_producto_grupo_empresa1_idx` (`grupo_empresa`),
  KEY `id_responsable` (`id_responsable`),
  CONSTRAINT `entrega_producto_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_entrega_producto_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrega_producto
-- ----------------------------

-- ----------------------------
-- Table structure for fase_convocatoria
-- ----------------------------
DROP TABLE IF EXISTS `fase_convocatoria`;
CREATE TABLE `fase_convocatoria` (
  `id_fase_convocatoria` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_fase_convocatoria` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  PRIMARY KEY (`id_fase_convocatoria`),
  KEY `fk_actividad_tipo_actividad1_idx` (`tipo_fase_convocatoria`),
  KEY `fk_fase_convocatoria_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_actividad_tipo_actividad1` FOREIGN KEY (`tipo_fase_convocatoria`) REFERENCES `tipo_fase_convocatoria` (`id_tipo_fase_convocatoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fase_convocatoria_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fase_convocatoria
-- ----------------------------
INSERT INTO `fase_convocatoria` VALUES ('13', null, null, null, '0', '1', '1');
INSERT INTO `fase_convocatoria` VALUES ('14', null, null, null, '0', '2', '1');
INSERT INTO `fase_convocatoria` VALUES ('15', null, null, null, '0', '3', '1');
INSERT INTO `fase_convocatoria` VALUES ('16', null, null, null, '0', '4', '1');
INSERT INTO `fase_convocatoria` VALUES ('17', null, null, null, '0', '5', '1');
INSERT INTO `fase_convocatoria` VALUES ('18', null, null, null, '0', '6', '1');
INSERT INTO `fase_convocatoria` VALUES ('19', null, null, null, '0', '7', '1');

-- ----------------------------
-- Table structure for gestion_empresa_tis
-- ----------------------------
DROP TABLE IF EXISTS `gestion_empresa_tis`;
CREATE TABLE `gestion_empresa_tis` (
  `id_gestion` int(11) NOT NULL AUTO_INCREMENT,
  `gestion` varchar(20) NOT NULL,
  `descripcion_gestion` varchar(64) DEFAULT NULL,
  `fecha_ini_gestion` date NOT NULL,
  `fecha_fin_gestion` date DEFAULT NULL,
  `gestion_activa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gestion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gestion_empresa_tis
-- ----------------------------
INSERT INTO `gestion_empresa_tis` VALUES ('1', 'Permanente', 'Gestion Permanente para Administrador Y Consultor TIS', '2014-01-01', null, '0');

-- ----------------------------
-- Table structure for grupo_empresa
-- ----------------------------
DROP TABLE IF EXISTS `grupo_empresa`;
CREATE TABLE `grupo_empresa` (
  `id_grupo_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_largo` varchar(64) NOT NULL,
  `nombre_corto` varchar(20) NOT NULL,
  `fecha_sobre_a` date DEFAULT NULL,
  `sobre_a` varchar(128) DEFAULT NULL,
  `fecha_sobre_b` date DEFAULT NULL,
  `sobre_b` varchar(128) DEFAULT NULL,
  `sociedad` int(11) DEFAULT NULL,
  `consultor_tis` int(11) NOT NULL,
  `observacion` varchar(64) DEFAULT NULL,
  `habilitado` int(1) DEFAULT '0',
  PRIMARY KEY (`id_grupo_empresa`),
  KEY `fk_grupo_empresa_sociedad` (`sociedad`),
  KEY `fk_grupo_empresa_consultor_tis1_idx` (`consultor_tis`),
  CONSTRAINT `fk_grupo_empresa_consultor_tis1` FOREIGN KEY (`consultor_tis`) REFERENCES `consultor_tis` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_empresa_sociedad` FOREIGN KEY (`sociedad`) REFERENCES `sociedad` (`id_sociedad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grupo_empresa
-- ----------------------------

-- ----------------------------
-- Table structure for integrante
-- ----------------------------
DROP TABLE IF EXISTS `integrante`;
CREATE TABLE `integrante` (
  `usuario` int(11) NOT NULL,
  `codigo_sis` varchar(9) NOT NULL,
  `carrera` int(11) NOT NULL,
  `grupo_empresa` int(11) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_integrante_carrera1_idx` (`carrera`),
  KEY `fk_integrante_grupo_empresa1_idx` (`grupo_empresa`),
  CONSTRAINT `fk_integrante_carrera1` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_integrante_grupo_empresa1` FOREIGN KEY (`grupo_empresa`) REFERENCES `grupo_empresa` (`id_grupo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_integrante_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of integrante
-- ----------------------------

-- ----------------------------
-- Table structure for mensaje
-- ----------------------------
DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `contenido` text NOT NULL,
  `leido` tinyint(1) NOT NULL,
  `de_usuario` int(11) NOT NULL,
  `asunto` varchar(32) NOT NULL,
  `visible` int(1) NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `fk_mensaje_usuario1_idx` (`de_usuario`),
  CONSTRAINT `fk_mensaje_usuario1` FOREIGN KEY (`de_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mensaje
-- ----------------------------

-- ----------------------------
-- Table structure for metodologia
-- ----------------------------
DROP TABLE IF EXISTS `metodologia`;
CREATE TABLE `metodologia` (
  `id_metodologia` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_metodologia` varchar(50) NOT NULL,
  `descripcion_metodologia` varchar(300) NOT NULL,
  PRIMARY KEY (`id_metodologia`),
  UNIQUE KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of metodologia
-- ----------------------------
INSERT INTO `metodologia` VALUES ('1', 'scrum', 'metodologia scrum');
INSERT INTO `metodologia` VALUES ('2', 'eXtreme Programming', 'metodologia xp');

-- ----------------------------
-- Table structure for metodologia_grupo_empresa
-- ----------------------------
DROP TABLE IF EXISTS `metodologia_grupo_empresa`;
CREATE TABLE `metodologia_grupo_empresa` (
  `id_grupo_empresa` int(11) NOT NULL,
  `id_metodologia` int(11) NOT NULL,
  UNIQUE KEY `id_grupo_empresa` (`id_metodologia`),
  KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of metodologia_grupo_empresa
-- ----------------------------

-- ----------------------------
-- Table structure for notificacion
-- ----------------------------
DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `leido` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL,
  `tipo_notificacion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `usuario_destino` int(11) NOT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `fk_notificacion_tipo_notificacion1_idx` (`tipo_notificacion`),
  KEY `fk_notificacion_usuario1_idx` (`usuario`),
  KEY `fk_notificacion_usuario2_idx` (`usuario_destino`),
  CONSTRAINT `fk_notificacion_tipo_notificacion1` FOREIGN KEY (`tipo_notificacion`) REFERENCES `tipo_notificacion` (`id_tipo_notificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificacion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificacion_usuario2` FOREIGN KEY (`usuario_destino`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notificacion
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `rol_unico` varchar(2) NOT NULL DEFAULT 'no',
  `id_metodologia` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_metodologia` (`id_metodologia`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Representante Legal', 'El Representante Legal contacta con la Empresa TIS para todo efecto legal.', 'si', '0');
INSERT INTO `rol` VALUES ('2', 'Product Owner', 'En Scrum, el Product Owner estudia los requerimientos del cliente y los comunica al Equipo.', 'si', '1');
INSERT INTO `rol` VALUES ('3', 'Scrum Master', 'En Scrum, el Scrum Master dirige el proceso de desarrollo.', 'si', '1');
INSERT INTO `rol` VALUES ('4', 'Desarrollador', 'El Desarrollador es \"el pan y la mantequilla\" de todo proceso de desarrollo de software.', 'no', '0');
INSERT INTO `rol` VALUES ('5', 'Tester', 'El Tester se encarga de probar la funcionalidad de los producto de los desarrolladores.', 'no', '0');
INSERT INTO `rol` VALUES ('6', 'Encargado Base de Datos', 'El Encargado de la Base de Datos está continuamente trabajando con la reingeniería de la base de datos.', 'no', '0');
INSERT INTO `rol` VALUES ('7', 'Documentador', 'El Documentador redacta los documentos necesarios para controlar, verificar y avalar el proceso.', 'no', '0');
INSERT INTO `rol` VALUES ('8', 'Tracker', 'Proporciona retroalimentacion al equipo en el proceso xp', 'si', '2');
INSERT INTO `rol` VALUES ('9', 'Big boss', 'Es el vinculo entre clientes y programadores', 'si', '2');

-- ----------------------------
-- Table structure for rol_integrante
-- ----------------------------
DROP TABLE IF EXISTS `rol_integrante`;
CREATE TABLE `rol_integrante` (
  `integrante` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  KEY `fk_rol_integrante_rol1_idx` (`rol`),
  KEY `fk_rol_integrante_integrante1_idx` (`integrante`),
  CONSTRAINT `fk_rol_integrante_integrante1` FOREIGN KEY (`integrante`) REFERENCES `integrante` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_integrante_rol1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol_integrante
-- ----------------------------

-- ----------------------------
-- Table structure for sesion
-- ----------------------------
DROP TABLE IF EXISTS `sesion`;
CREATE TABLE `sesion` (
  `id_proceso` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_proceso`),
  KEY `fk_sesion_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_sesion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sesion
-- ----------------------------

-- ----------------------------
-- Table structure for sociedad
-- ----------------------------
DROP TABLE IF EXISTS `sociedad`;
CREATE TABLE `sociedad` (
  `id_sociedad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) NOT NULL,
  `abreviatura` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_sociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sociedad
-- ----------------------------
INSERT INTO `sociedad` VALUES ('1', 'Sociedad Anónima', 'S.A.');
INSERT INTO `sociedad` VALUES ('2', 'Sociedad de Responsabilidad Limitada', 'S.R.L.');
INSERT INTO `sociedad` VALUES ('3', 'Empresa Individual de Responsabilidad Limitada', 'E.I.R.L.');
INSERT INTO `sociedad` VALUES ('4', 'Sociedad en Comandita', 'S.Co.');
INSERT INTO `sociedad` VALUES ('5', 'Sociedad Colectiva', 'S.C.');
INSERT INTO `sociedad` VALUES ('6', 'Sociedad de Hecho', 'S.H.');

-- ----------------------------
-- Table structure for tarea
-- ----------------------------
DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `resultado_esperado` varchar(128) NOT NULL,
  `resultado_obtenido` varchar(128) DEFAULT NULL,
  `porcentaje_completado` int(11) NOT NULL DEFAULT '0',
  `color_tarea` varchar(20) DEFAULT NULL,
  `color_texto` varchar(20) DEFAULT NULL,
  `modificado` int(11) DEFAULT '0',
  `actividad` int(11) NOT NULL,
  `responsable` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`),
  KEY `fk_tarea_actividad_grupo_empresa1_idx` (`actividad`),
  KEY `fk_tarea_integrante1_idx` (`responsable`),
  CONSTRAINT `fk_tarea_actividad_grupo_empresa1` FOREIGN KEY (`actividad`) REFERENCES `actividad_grupo_empresa` (`id_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarea_integrante1` FOREIGN KEY (`responsable`) REFERENCES `integrante` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tarea
-- ----------------------------

-- ----------------------------
-- Table structure for TBL_DUMMY
-- ----------------------------
DROP TABLE IF EXISTS `TBL_DUMMY`;
CREATE TABLE `TBL_DUMMY` (
    `error` VARCHAR(256)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TBL_DUMMY
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_fase_convocatoria
-- ----------------------------
DROP TABLE IF EXISTS `tipo_fase_convocatoria`;
CREATE TABLE `tipo_fase_convocatoria` (
  `id_tipo_fase_convocatoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(64) NOT NULL,
  PRIMARY KEY (`id_tipo_fase_convocatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_fase_convocatoria
-- ----------------------------
INSERT INTO `tipo_fase_convocatoria` VALUES ('1', 'Lanzamiento de la Convocatoria Pública');
INSERT INTO `tipo_fase_convocatoria` VALUES ('2', 'Registro de Grupo Empresas');
INSERT INTO `tipo_fase_convocatoria` VALUES ('3', 'Envio de Documentos');
INSERT INTO `tipo_fase_convocatoria` VALUES ('4', 'Firma de Contratos');
INSERT INTO `tipo_fase_convocatoria` VALUES ('5', 'Proceso de Desarollo');
INSERT INTO `tipo_fase_convocatoria` VALUES ('6', 'Entrega de Producto Final');
INSERT INTO `tipo_fase_convocatoria` VALUES ('7', 'Cierre de la Convocatoria');

-- ----------------------------
-- Table structure for tipo_notificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_notificacion`;
CREATE TABLE `tipo_notificacion` (
  `id_tipo_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `enlace` varchar(128) DEFAULT NULL,
  `contenido` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_notificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_notificacion
-- ----------------------------
INSERT INTO `tipo_notificacion` VALUES ('1', 'Consultor(es) TIS esperando validación', '', '');
INSERT INTO `tipo_notificacion` VALUES ('2', 'Integrante(s) esperando validación', '', '');
INSERT INTO `tipo_notificacion` VALUES ('3', 'Comentario(s) nuevo(s)', '', '');
INSERT INTO `tipo_notificacion` VALUES ('4', 'Documento(s) nuevo(s)', '', '');
INSERT INTO `tipo_notificacion` VALUES ('5', 'Plazo(s) cumplido(s)', '', '');
INSERT INTO `tipo_notificacion` VALUES ('6', 'Nuevo avance semanal', '', '');
INSERT INTO `tipo_notificacion` VALUES ('7', 'Usuario habilitado', '', '');
INSERT INTO `tipo_notificacion` VALUES ('8', 'Usuario deshabilitado', '', '');
INSERT INTO `tipo_notificacion` VALUES ('9', 'Fase habilitada', '', '');
INSERT INTO `tipo_notificacion` VALUES ('10', 'Fase deshabilitada', '', '');
INSERT INTO `tipo_notificacion` VALUES ('11', 'Enlace producto actualizado', '', '');
INSERT INTO `tipo_notificacion` VALUES ('12', 'Consultor TIS rechazo sobres A-B', '', '');
INSERT INTO `tipo_notificacion` VALUES ('13', 'Documento recibido', '', '');
INSERT INTO `tipo_notificacion` VALUES ('14', 'Fase modificada', '', '');
INSERT INTO `tipo_notificacion` VALUES ('15', 'Consultor TIS acepta sobres A-B', '', '');
INSERT INTO `tipo_notificacion` VALUES ('16', 'Grupo Empresa envio sobres A-B', '', '');
INSERT INTO `tipo_notificacion` VALUES ('17', 'Tiene observacion(es) en la entrega de un subsistema', '', '');

-- ----------------------------
-- Table structure for tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_usuario
-- ----------------------------
INSERT INTO `tipo_usuario` VALUES ('1', 'Administrador');
INSERT INTO `tipo_usuario` VALUES ('2', 'Jefe Consultor TIS');
INSERT INTO `tipo_usuario` VALUES ('3', 'Consultor TIS');
INSERT INTO `tipo_usuario` VALUES ('4', 'Jefe de Grupo Empresa');
INSERT INTO `tipo_usuario` VALUES ('5', 'Integrante');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(48) NOT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `gestion` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario`),
  KEY `fk_usuario_gestion_empresa_tis1_idx` (`gestion`),
  CONSTRAINT `fk_usuario_gestion_empresa_tis1` FOREIGN KEY (`gestion`) REFERENCES `gestion_empresa_tis` (`id_gestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'admin', 'admin', 'Boris Marcelo', 'Calancha Navia', '4436755', 'boris@yahoo.com', '', '1', '1', '1');

-- ----------------------------
-- Procedure structure for get_fases_convocatoria
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_fases_convocatoria`;
DELIMITER ;;
CREATE PROCEDURE `get_fases_convocatoria`(IN gestion INT)
BEGIN
	SELECT * FROM fases_convocatoria f WHERE f.gestion = gestion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_grupo_empresas
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_grupo_empresas`;
DELIMITER ;;
CREATE PROCEDURE `get_grupo_empresas`()
BEGIN
	SELECT* FROM grupo_empresa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_id`;
DELIMITER ;;
CREATE PROCEDURE `get_id`(IN nomb CHAR(20), IN gest INT)
BEGIN
	SELECT id_usuario FROM usuario WHERE nombre_usuario = nomb AND gestion = gest;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_usuarios
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_usuarios`;
DELIMITER ;;
CREATE PROCEDURE `get_usuarios`()
BEGIN
	SELECT * FROM `usuario`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for iniciar_sesion
-- ----------------------------
DROP PROCEDURE IF EXISTS `iniciar_sesion`;
DELIMITER ;;
CREATE PROCEDURE `iniciar_sesion`(IN id INT)
BEGIN
	IF NOT EXISTS (SELECT id_proceso FROM sesion WHERE id_proceso = connection_id() )
	THEN INSERT INTO sesion(id_proceso,usuario) VALUES (connection_id(), id);
	ELSE UPDATE sesion SET usuario = id WHERE id_proceso = connection_id();
	END IF;
	-- INSERT INTO bitacora_sesion(usuario,fecha_hora) VALUES(id,CURRENT_TIMESTAMP);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for new_consultor
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_consultor`;
DELIMITER ;;
CREATE PROCEDURE `new_consultor`(IN nombre_usuario CHAR(20), IN clave CHAR(20), IN nombre CHAR(45), IN apellido CHAR(45), IN telefono CHAR(12), IN email CHAR(48), IN foto CHAR(128), IN habilitado TINYINT(1), IN tipo_usuario INT, IN curriculum CHAR(128))
BEGIN
	INSERT INTO `usuario` (`nombre_usuario`, `clave`, `nombre`, `apellido`, `telefono`, `email`, `foto`, `habilitado`, `tipo_usuario`, `gestion`) VALUES (nombre_usuario, clave, nombre, apellido, telefono, email, foto, habilitado, tipo_usuario, get_gestion_actual());
	INSERT INTO `consultor_tis` (`usuario`,`curriculum`) VALUES (LAST_INSERT_ID(), curriculum);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for new_grupo_empresa
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_grupo_empresa`;
DELIMITER ;;
CREATE PROCEDURE `new_grupo_empresa`(IN nombre_largo CHAR(64), IN nombre_corto CHAR(20), IN sociedad INT, IN consultor_tis INT)
BEGIN
	INSERT INTO `grupo_empresa` (`id_grupo_empresa`, `nombre_largo`, `nombre_corto`, `fecha_sobre_a`, `sobre_a`, `fecha_sobre_b`, `sobre_b`, `sociedad`, `consultor_tis`) VALUES (nombre_largo, nombre_corto, NULL, NULL, NULL, NULL, sociedad, consultor_tis);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for new_integrante
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_integrante`;
DELIMITER ;;
CREATE PROCEDURE `new_integrante`(IN nombre_usuario CHAR(20), IN clave CHAR(20), IN nombre CHAR(45), IN apellido CHAR(45), IN telefono CHAR(12), IN email CHAR(48), IN foto CHAR(128), IN habilitado TINYINT(1), IN tipo_usuario INT, IN codigo_sis CHAR(9), IN carrera INT, IN grupo_empresa INT)
BEGIN
	INSERT INTO `usuario` (`nombre_usuario`, `clave`, `nombre`, `apellido`, `telefono`, `email`, `foto`, `habilitado`, `tipo_usuario`, `gestion`) VALUES (nombre_usuario, clave, nombre, apellido, telefono, email, foto, habilitado, tipo_usuario, get_gestion_actual());
	INSERT INTO `integrante` (`usuario`,`codigo_sis`,`carrera`,`grupo_empresa`) VALUES (LAST_INSERT_ID(), codigo_sis, carrera, grupo_empresa);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_RAISE_ERROR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_RAISE_ERROR`;
DELIMITER ;;
CREATE PROCEDURE `SP_RAISE_ERROR` (IN P_ERROR VARCHAR(256))
BEGIN
    DECLARE V_ERROR VARCHAR(300);
    SET V_ERROR := CONCAT('[ERROR: ', P_ERROR, ']');
    INSERT INTO `TBL_DUMMY` VALUES (V_ERROR);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_consultor_empresa
-- ----------------------------
DROP FUNCTION IF EXISTS `get_consultor_empresa`;
DELIMITER ;;
CREATE FUNCTION `get_consultor_empresa`(emp INT) RETURNS int(11)
BEGIN
	DECLARE con INT;
	SELECT consultor_tis INTO con FROM grupo_empresa WHERE id_grupo_empresa = emp;
	RETURN con;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_gestion_actual
-- ----------------------------
DROP FUNCTION IF EXISTS `get_gestion_actual`;
DELIMITER ;;
CREATE FUNCTION `get_gestion_actual`() RETURNS int(11)
BEGIN
	DECLARE g INT(11);
	SELECT id_gestion INTO g FROM gestion_empresa_tis WHERE gestion_activa = 1 AND gestion != '0';
	RETURN g;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_jefe_grupo
-- ----------------------------
DROP FUNCTION IF EXISTS `get_jefe_grupo`;
DELIMITER ;;
CREATE FUNCTION `get_jefe_grupo`(`grupo` int) RETURNS int(11)
BEGIN
	DECLARE jefe INT;
	SELECT usuario INTO jefe FROM integrante WHERE grupo_empresa = grupo AND usuario IN (SELECT id_usuario FROM usuario WHERE tipo_usuario = 4);
	RETURN jefe;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_pago_real
-- ----------------------------
DROP FUNCTION IF EXISTS `get_pago_real`;
DELIMITER ;;
CREATE FUNCTION `get_pago_real`(entrega INT) RETURNS decimal(6,2)
BEGIN
	DECLARE d DECIMAL(6,2);
	SELECT pago_establecido * get_porcentaje_entrega(entrega) / 100 INTO d FROM entrega_producto where id_entrega_producto = entrega;
	RETURN d;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_porcentaje_actividad
-- ----------------------------
DROP FUNCTION IF EXISTS `get_porcentaje_actividad`;
DELIMITER ;;
CREATE FUNCTION `get_porcentaje_actividad`(activ INT) RETURNS decimal(6,2)
BEGIN
	DECLARE d DECIMAL(6,2);
	SELECT sum(porcentaje_completado) / count(*) INTO d FROM tarea where actividad = activ;
	RETURN d;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_porcentaje_entrega
-- ----------------------------
DROP FUNCTION IF EXISTS `get_porcentaje_entrega`;
DELIMITER ;;
CREATE FUNCTION `get_porcentaje_entrega`(entrega INT) RETURNS decimal(6,2)
BEGIN
	DECLARE d DECIMAL(6,2);
	SELECT sum(porcentaje_completado) / count(*) INTO d FROM actividad_grupo_empresa WHERE entrega_producto = entrega;
	RETURN d;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for id_jefe_consultor
-- ----------------------------
DROP FUNCTION IF EXISTS `id_jefe_consultor`;
DELIMITER ;;
CREATE FUNCTION `id_jefe_consultor`(jefe INT) RETURNS int(11)
BEGIN
	DECLARE id INT;
	SELECT id_usuario INTO id FROM usuario WHERE tipo_usuario = 2;
	RETURN id;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for id_usuario
-- ----------------------------
DROP FUNCTION IF EXISTS `id_usuario`;
DELIMITER ;;
CREATE FUNCTION `id_usuario`(conn INT) RETURNS int(11)
BEGIN
	DECLARE u INT;
	SELECT usuario INTO u FROM sesion WHERE id_proceso = conn;
	IF(u <=> NULL) THEN SET u = 1;
	END IF;
	RETURN u;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `actividad_grupo_empresa_AINS`;
DELIMITER ;;
CREATE TRIGGER `actividad_grupo_empresa_AINS` AFTER INSERT ON `actividad_grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,nuevo) VALUES (id_usuario(connection_id()),'actividad_grupo_empresa',CURRENT_TIMESTAMP,CONCAT_WS(',',NEW.id_actividad,NEW.fecha_inicio,NEW.fecha_fin,NEW.descripcion,NEW.porcentaje_completado,NEW.modificado,NEW.entrega_producto));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `actividad_grupo_empresa_BUPD`;
DELIMITER ;;
CREATE TRIGGER `actividad_grupo_empresa_BUPD` BEFORE UPDATE ON `actividad_grupo_empresa` FOR EACH ROW BEGIN
	DECLARE old_date CONDITION FOR SQLSTATE '99991';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		CALL `SP_RAISE_ERROR` ('La fecha de inicio de la actividad ya ha vencido.');
	  END;
	IF(OLD.fecha_inicio <= CURDATE() AND (OLD.descripcion != NEW.descripcion OR OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)) THEN
		CALL ghost_procedure();
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `actividad_grupo_empresa_AUPD`;
DELIMITER ;;
CREATE TRIGGER `actividad_grupo_empresa_AUPD` AFTER UPDATE ON `actividad_grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo,nuevo) VALUES (id_usuario(connection_id()),'actividad_grupo_empresa',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_actividad,OLD.fecha_inicio,OLD.fecha_fin,OLD.descripcion,OLD.porcentaje_completado,OLD.modificado,OLD.entrega_producto),CONCAT_WS(',',NEW.id_actividad,NEW.fecha_inicio,NEW.fecha_fin,NEW.descripcion,NEW.porcentaje_completado,NEW.modificado,NEW.entrega_producto));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `actividad_grupo_empresa_ADEL`;
DELIMITER ;;
CREATE TRIGGER `actividad_grupo_empresa_ADEL` AFTER DELETE ON `actividad_grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo) VALUES (id_usuario(connection_id()),'actividad_grupo_empresa',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_actividad,OLD.fecha_inicio,OLD.fecha_fin,OLD.descripcion,OLD.porcentaje_completado,OLD.modificado,OLD.entrega_producto));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `avance_semanal_BINS`;
DELIMITER ;;
CREATE TRIGGER `avance_semanal_BINS` BEFORE INSERT ON `avance_semanal` FOR EACH ROW BEGIN
	INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,6,NEW.grupo_empresa,get_consultor_empresa(NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `consultor_tis_BINS`;
DELIMITER ;;
CREATE TRIGGER `consultor_tis_BINS` BEFORE INSERT ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO notificacion (fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,1,NEW.usuario,1);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `consultor_tis_AINS`;
DELIMITER ;;
CREATE TRIGGER `consultor_tis_AINS` AFTER INSERT ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',' , NEW.usuario, NEW.curriculum));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `consultor_tis_AUPD`;
DELIMITER ;;
CREATE TRIGGER `consultor_tis_AUPD` AFTER UPDATE ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',', OLD.usuario, OLD.curriculum), CONCAT_WS(',' , NEW.usuario, NEW.curriculum));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `consultor_tis_ADEL`;
DELIMITER ;;
CREATE TRIGGER `consultor_tis_ADEL` AFTER DELETE ON `consultor_tis` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'consultor_tis', CONCAT_WS(',', OLD.usuario, OLD.curriculum));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `documento_consultor_AINS`;
DELIMITER ;;
CREATE TRIGGER `documento_consultor_AINS` AFTER INSERT ON `documento_consultor` FOR EACH ROW BEGIN
	INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,4,NEW.consultor_tis,1);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `entrega_producto_AINS`;
DELIMITER ;;
CREATE TRIGGER `entrega_producto_AINS` AFTER INSERT ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,nuevo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',NEW.id_entrega_producto,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.fecha_real_entrega,NEW.pago_establecido,NEW.pago_recibido,NEW.observacion,NEW.enlace_producto,NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `entrega_producto_BUPD`;
DELIMITER ;;
CREATE TRIGGER `entrega_producto_BUPD` BEFORE UPDATE ON `entrega_producto` FOR EACH ROW BEGIN
	DECLARE old_date CONDITION FOR SQLSTATE '99991';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		CALL SP_RAISE_ERROR ('La actividad puede editarse. Verifique lo siguiente:
-La fecha de inicio de la entrega no es hoy ni ha pasado ya.
-La duración máxima de la entrega deber ser de dos semanas.');
	  END;
	IF(OLD.fecha_inicio <= CURDATE() AND (OLD.descripcion != NEW.descripcion OR OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)) THEN
		CALL ghost_procedure();
	END IF;
	IF(OLD.enlace_producto != NEW.enlace_producto)
	THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,11,id_usuario(connection_id()),get_consultor_empresa(NEW.grupo_empresa));
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `entrega_producto_AUPD`;
DELIMITER ;;
CREATE TRIGGER `entrega_producto_AUPD` AFTER UPDATE ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo,nuevo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_entrega_producto,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.fecha_real_entrega,OLD.pago_establecido,OLD.pago_recibido,OLD.observacion,OLD.enlace_producto,OLD.grupo_empresa),CONCAT_WS(',',NEW.id_entrega_producto,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.fecha_real_entrega,NEW.pago_establecido,NEW.pago_recibido,NEW.observacion,NEW.enlace_producto,NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `entrega_producto_ADEL`;
DELIMITER ;;
CREATE TRIGGER `entrega_producto_ADEL` AFTER DELETE ON `entrega_producto` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo) VALUES (id_usuario(connection_id()),'entrega_producto',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_entrega_producto,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.fecha_real_entrega,OLD.pago_establecido,OLD.pago_recibido,OLD.observacion,OLD.enlace_producto,OLD.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fase_convocatoria_BUPD`;
DELIMITER ;;
CREATE TRIGGER `fase_convocatoria_BUPD` BEFORE UPDATE ON `fase_convocatoria` FOR EACH ROW BEGIN
	DECLARE tipo INT;
	IF(OLD.activo != NEW.activo)
	THEN IF(NEW.activo = 1)
			THEN SET tipo = 9;
			ELSE SET tipo = 10;
		END IF;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),1);
	END IF;
	IF(OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)
	THEN SET tipo = 14;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),1);
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fases`;
DELIMITER ;;
CREATE TRIGGER `fases` AFTER INSERT ON `gestion_empresa_tis` FOR EACH ROW BEGIN
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,1,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,2,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,3,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,4,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,5,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,6,NEW.id_gestion);
	INSERT INTO fase_convocatoria(activo,tipo_fase_convocatoria,gestion) VALUES(0,7,NEW.id_gestion);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `grupo_empresa_AINS`;
DELIMITER ;;
CREATE TRIGGER `grupo_empresa_AINS` AFTER INSERT ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',' ,NEW.nombre_largo, NEW.nombre_corto, NEW.fecha_sobre_a, NEW.sobre_a, NEW.fecha_sobre_b, NEW.sobre_b, NEW.sociedad, NEW.consultor_tis));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `grupo_empresa_BUPD`;
DELIMITER ;;
CREATE TRIGGER `grupo_empresa_BUPD` BEFORE UPDATE ON `grupo_empresa` FOR EACH ROW BEGIN
IF((OLD.sobre_a <=> NULL AND !(OLD.sobre_a <=> NEW.sobre_a)) OR(OLD.sobre_b <=> NULL AND !(OLD.sobre_b <=> NEW.sobre_b)))
         THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,16,get_jefe_grupo(OLD.id_grupo_empresa),get_consultor_empresa(OLD.id_grupo_empresa));
ELSE IF((!(OLD.sobre_a <=> NULL) AND (NEW.sobre_a <=> NULL)) OR(!(OLD.sobre_b <=> NULL) AND (NEW.sobre_b <=> NULL)))
         THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,12,get_consultor_empresa(OLD.id_grupo_empresa),get_jefe_grupo(OLD.id_grupo_empresa));
         ELSE IF(OLD.habilitado = '0' AND NEW.habilitado = '1')
                  THEN INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,15,get_consultor_empresa(OLD.id_grupo_empresa),get_jefe_grupo(OLD.id_grupo_empresa));
                  END IF;
         END IF;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `grupo_empresa_AUPD`;
DELIMITER ;;
CREATE TRIGGER `grupo_empresa_AUPD` AFTER UPDATE ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',', OLD.nombre_largo, OLD.nombre_corto, OLD.fecha_sobre_a, OLD.sobre_a, OLD.fecha_sobre_b, OLD.sobre_b, OLD.sociedad, OLD.consultor_tis, OLD.observacion, OLD.habilitado), CONCAT_WS(',' ,NEW.nombre_largo, NEW.nombre_corto, NEW.fecha_sobre_a, NEW.sobre_a, NEW.fecha_sobre_b, NEW.sobre_b, NEW.sociedad, NEW.consultor_tis, NEW.observacion, NEW.habilitado));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `grupo_empresa_ADEL`;
DELIMITER ;;
CREATE TRIGGER `grupo_empresa_ADEL` AFTER DELETE ON `grupo_empresa` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'grupo_empresa', CONCAT_WS(',', OLD.nombre_largo, OLD.nombre_corto, OLD.fecha_sobre_a, OLD.sobre_a, OLD.fecha_sobre_b, OLD.sobre_b, OLD.sociedad, OLD.consultor_tis));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `integrante_BINS`;
DELIMITER ;;
CREATE TRIGGER `integrante_BINS` BEFORE INSERT ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO notificacion (fecha, tipo_notificacion, usuario, usuario_destino) VALUES (CURRENT_TIMESTAMP,2,NEW.usuario,get_consultor_empresa(NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `integrante_AINS`;
DELIMITER ;;
CREATE TRIGGER `integrante_AINS` AFTER INSERT ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',' , NEW.usuario, NEW.codigo_sis, NEW.carrera, NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `integrante_AUPD`;
DELIMITER ;;
CREATE TRIGGER `integrante_AUPD` AFTER UPDATE ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',', OLD.usuario, OLD.codigo_sis, OLD.carrera, OLD.grupo_empresa), CONCAT_WS(',' , NEW.usuario, NEW.codigo_sis, NEW.carrera, NEW.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `integrante_ADEL`;
DELIMITER ;;
CREATE TRIGGER `integrante_ADEL` AFTER DELETE ON `integrante` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'integrante', CONCAT_WS(',', OLD.usuario, OLD.codigo_sis, OLD.carrera, OLD.grupo_empresa));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tarea_AINS`;
DELIMITER ;;
CREATE TRIGGER `tarea_AINS` AFTER INSERT ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,nuevo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',NEW.id_tarea,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.resultado_esperado,NEW.resultado_obtenido,NEW.porcentaje_completado,NEW.color_tarea,NEW.color_texto,NEW.modificado));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tarea_BUPD`;
DELIMITER ;;
CREATE TRIGGER `tarea_BUPD` BEFORE UPDATE ON `tarea` FOR EACH ROW BEGIN
	DECLARE old_date CONDITION FOR SQLSTATE '99991';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		CALL SP_RAISE_ERROR ('La fecha de inicio de la tarea ya ha vencido.');
	  END;
	IF(OLD.fecha_inicio <= CURDATE() AND (OLD.descripcion != NEW.descripcion OR OLD.fecha_inicio != NEW.fecha_inicio OR OLD.fecha_fin != NEW.fecha_fin)) THEN
		CALL ghost_procedure();
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tarea_AUPD`;
DELIMITER ;;
CREATE TRIGGER `tarea_AUPD` AFTER UPDATE ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo,nuevo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_tarea,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.resultado_esperado,OLD.resultado_obtenido,OLD.porcentaje_completado,OLD.color_tarea,OLD.color_texto,OLD.modificado),CONCAT_WS(',',NEW.id_tarea,NEW.descripcion,NEW.fecha_inicio,NEW.fecha_fin,NEW.resultado_esperado,NEW.resultado_obtenido,NEW.porcentaje_completado,NEW.color_tarea,NEW.color_texto,NEW.modificado));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tarea_ADEL`;
DELIMITER ;;
CREATE TRIGGER `tarea_ADEL` AFTER DELETE ON `tarea` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,tabla,fecha_hora,viejo) VALUES (id_usuario(connection_id()),'tarea',CURRENT_TIMESTAMP,CONCAT_WS(',',OLD.id_tarea,OLD.descripcion,OLD.fecha_inicio,OLD.fecha_fin,OLD.resultado_esperado,OLD.resultado_obtenido,OLD.porcentaje_completado,OLD.color_tarea,OLD.color_texto,OLD.modificado));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TRIG_BI_DUMMY`;
DELIMITER ;;
CREATE TRIGGER `TRIG_BI_DUMMY` BEFORE INSERT ON `TBL_DUMMY`
    FOR EACH ROW
BEGIN
    SET NEW.`error` = NEW.`error`;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_AINS`;
DELIMITER ;;
CREATE TRIGGER `usuario_AINS` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario',CONCAT_WS(',', LAST_INSERT_ID(), NEW.nombre_usuario, NEW.clave, NEW.nombre, NEW.apellido, NEW.telefono, NEW.email, NEW.foto, NEW.habilitado, NEW.tipo_usuario, NEW.gestion));
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_BUPD`;
DELIMITER ;;
CREATE TRIGGER `usuario_BUPD` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
	DECLARE tipo INT;
	IF(OLD.habilitado != NEW.habilitado)
	THEN IF(NEW.habilitado = 1)
			THEN SET tipo = 7;
			ELSE SET tipo = 8;
		END IF;
		INSERT INTO notificacion(fecha,tipo_notificacion,usuario,usuario_destino) VALUES (CURRENT_TIMESTAMP,tipo,id_usuario(connection_id()),NEW.id_usuario);
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_AUPD`;
DELIMITER ;;
CREATE TRIGGER `usuario_AUPD` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
	IF(OLD.habilitado != NEW.habilitado) THEN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo,nuevo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario', CONCAT_WS(',', OLD.nombre_usuario, OLD.clave, OLD.nombre, OLD.apellido, OLD.telefono, OLD.email, OLD.foto, OLD.habilitado, OLD.tipo_usuario, OLD.gestion), CONCAT_WS(',' ,NEW.nombre_usuario, NEW.clave, NEW.nombre, NEW.apellido, NEW.telefono, NEW.email, NEW.foto, NEW.habilitado, NEW.tipo_usuario, NEW.gestion));
	END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_ADEL`;
DELIMITER ;;
CREATE TRIGGER `usuario_ADEL` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO bitacora_bd(usuario,fecha_hora,tabla,viejo) VALUES (id_usuario(connection_id()),CURRENT_TIMESTAMP,'usuario', CONCAT_WS(',', OLD.nombre_usuario, OLD.clave, OLD.nombre, OLD.apellido, OLD.telefono, OLD.email, OLD.foto, OLD.habilitado, OLD.tipo_usuario, OLD.gestion));
END
;;
DELIMITER ;
