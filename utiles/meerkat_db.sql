Create database meerkat_db;
use meerkat_db;
-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-08-2012 a las 16:27:49
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `meerkat_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

DROP TABLE IF EXISTS `accesos`;
CREATE TABLE IF NOT EXISTS `accesos` (
  `cod_acceso` int(11) NOT NULL AUTO_INCREMENT,
  `cod_perf` int(11) NOT NULL,
  `cod_OM` int(11) NOT NULL,
  `tipo_acceso` int(11) NOT NULL,
  PRIMARY KEY (`cod_acceso`),
  KEY `cod_perf` (`cod_perf`),
  KEY `cod_OM` (`cod_OM`),
  KEY `tipo_acceso` (`tipo_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos_fijos`
--

DROP TABLE IF EXISTS `activos_fijos`;
CREATE TABLE IF NOT EXISTS `activos_fijos` (
  `cod_af` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_af` int(10) NOT NULL,
  `nombre_af` varchar(30) NOT NULL,
  `fechacompra_af` date NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `costo_af` float NOT NULL,
  `garantia_af` int(11) NOT NULL,
  `nroserie_af` varchar(30) DEFAULT NULL,
  `hardware_af` varchar(255) DEFAULT NULL,
  `cod_categ` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_af`),
  KEY `cod_prov` (`cod_prov`),
  KEY `cod_categ` (`cod_categ`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `cod_area` int(11) NOT NULL AUTO_INCREMENT,
  `des_area` varchar(30) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `cod_user` int(11) NOT NULL,
  PRIMARY KEY (`cod_area`),
  KEY `cod_user` (`cod_user`),
  KEY `cod_estado` (`cod_estado`),
  KEY `cod_user_2` (`cod_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE IF NOT EXISTS `asignaciones` (
  `cod_asig` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_asig` date NOT NULL,
  `cod_user` int(11) DEFAULT NULL,
  `cod_tipo` int(11) NOT NULL,
  `codigo_asig` int(11) NOT NULL COMMENT 'codigo del insumo asignado!! ya sea AF o cons',
  `cod_depto` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_asig`),
  KEY `cod_user` (`cod_user`),
  KEY `cod_tipo` (`cod_tipo`),
  KEY `cod_depto` (`cod_depto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `cod_categ` int(11) NOT NULL AUTO_INCREMENT,
  `desc_categ` varchar(30) NOT NULL,
  `ptopedido_categ` int(11) DEFAULT NULL,
  `cod_estado` int(11) NOT NULL,
  `vidautil_categ` int(11) DEFAULT NULL,
  `cod_tipo` int(11) NOT NULL,
  PRIMARY KEY (`cod_categ`),
  KEY `cod_tipo` (`cod_tipo`),
  KEY `cod_tipo_2` (`cod_tipo`),
  KEY `cod_tipo_3` (`cod_tipo`),
  KEY `cod_tipo_4` (`cod_tipo`),
  KEY `cod_estado` (`cod_estado`),
  KEY `cod_tipo_5` (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_cons`
--

DROP TABLE IF EXISTS `compra_cons`;
CREATE TABLE IF NOT EXISTS `compra_cons` (
  `cod_cpra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_cpra` date NOT NULL,
  `costounit_cpra` float NOT NULL,
  `cantidad_cpra` int(11) NOT NULL,
  `cod_cons` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_cpra`),
  KEY `cod_cons` (`cod_cons`),
  KEY `cod_prov` (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumibles`
--

DROP TABLE IF EXISTS `consumibles`;
CREATE TABLE IF NOT EXISTS `consumibles` (
  `cod_cons` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cons` varchar(10) NOT NULL,
  `desc_cons` varchar(30) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `costo_cons` float DEFAULT NULL,
  `stock_cons` int(11) NOT NULL,
  `nroSerie_cons` varchar(30) DEFAULT NULL,
  `reciclable_cons` int(11) NOT NULL,
  `cod_categ` int(11) NOT NULL,
  PRIMARY KEY (`cod_cons`),
  KEY `cod_categ` (`cod_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `cod_depto` int(11) NOT NULL AUTO_INCREMENT,
  `desc_depto` varchar(30) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `cod_user` int(11) NOT NULL,
  `cod_area` int(11) NOT NULL,
  PRIMARY KEY (`cod_depto`),
  KEY `cod_user` (`cod_user`),
  KEY `cod_area` (`cod_area`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `cod_estado` int(11) NOT NULL AUTO_INCREMENT,
  `desc_estado` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menues`
--

DROP TABLE IF EXISTS `menues`;
CREATE TABLE IF NOT EXISTS `menues` (
  `cod_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_menu` varchar(30) NOT NULL,
  `desc_menu` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_de_menu`
--

DROP TABLE IF EXISTS `opciones_de_menu`;
CREATE TABLE IF NOT EXISTS `opciones_de_menu` (
  `cod_OM` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_OM` varchar(30) NOT NULL,
  `desc_OM` varchar(50) DEFAULT NULL,
  `cod_menu` int(11) NOT NULL,
  PRIMARY KEY (`cod_OM`),
  KEY `cod_menu` (`cod_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE IF NOT EXISTS `perfiles` (
  `cod_perf` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_perf` varchar(30) NOT NULL,
  `desc_perf` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_perf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `cod_prov` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prov` varchar(30) NOT NULL,
  `tel_prov` varchar(30) DEFAULT NULL,
  `mail_prov` varchar(50) DEFAULT NULL,
  `contacto_prov` varchar(50) DEFAULT NULL,
  `cod_estado` int(11) NOT NULL,
  `recicla_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_prov`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

DROP TABLE IF EXISTS `puestos`;
CREATE TABLE IF NOT EXISTS `puestos` (
  `cod_puesto` int(11) NOT NULL AUTO_INCREMENT,
  `desc_puesto` varchar(30) NOT NULL,
  `cod_depto` int(11) NOT NULL,
  PRIMARY KEY (`cod_puesto`),
  KEY `cod_depto` (`cod_depto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos_x_user`
--

DROP TABLE IF EXISTS `puestos_x_user`;
CREATE TABLE IF NOT EXISTS `puestos_x_user` (
  `cod_user` int(11) NOT NULL,
  `cod_puesto` int(11) NOT NULL,
  PRIMARY KEY (`cod_user`,`cod_puesto`),
  KEY `cod_puesto` (`cod_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciclados`
--

DROP TABLE IF EXISTS `reciclados`;
CREATE TABLE IF NOT EXISTS `reciclados` (
  `cod_rec` int(11) NOT NULL DEFAULT '0',
  `fecha_rec` date NOT NULL,
  `costo_rec` float NOT NULL,
  `cod_cons` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_rec`),
  KEY `cod_cons` (`cod_cons`),
  KEY `cod_prov` (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `cod_serv` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_serv` date NOT NULL,
  `costo_serv` float NOT NULL,
  `desc_serv` varchar(255) NOT NULL,
  `cod_af` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  PRIMARY KEY (`cod_serv`),
  KEY `cod_af` (`cod_af`),
  KEY `cod_prov` (`cod_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_acceso`
--

DROP TABLE IF EXISTS `tipos_acceso`;
CREATE TABLE IF NOT EXISTS `tipos_acceso` (
  `cod_TA` int(11) NOT NULL AUTO_INCREMENT,
  `desc_TA` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_TA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_categ`
--

DROP TABLE IF EXISTS `tipos_categ`;
CREATE TABLE IF NOT EXISTS `tipos_categ` (
  `Cod_Tipo` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_Tipo` varchar(30) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tipo`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `cod_user` int(11) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(10) NOT NULL,
  `nombre_user` varchar(30) NOT NULL,
  `tel_user` varchar(30) NOT NULL,
  `mail_user` varchar(50) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  `pass_user` int(50) NOT NULL,
  `cod_puesto` int(11) NOT NULL,
  `cod_perf` int(11) NOT NULL,
  PRIMARY KEY (`cod_user`),
  KEY `cod_puesto` (`cod_puesto`),
  KEY `cod_perf` (`cod_perf`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_3` FOREIGN KEY (`tipo_acceso`) REFERENCES `tipos_acceso` (`cod_TA`),
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`cod_perf`) REFERENCES `perfiles` (`cod_perf`),
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`cod_OM`) REFERENCES `opciones_de_menu` (`cod_OM`);

--
-- Filtros para la tabla `activos_fijos`
--
ALTER TABLE `activos_fijos`
  ADD CONSTRAINT `activos_fijos_ibfk_3` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`),
  ADD CONSTRAINT `activos_fijos_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`),
  ADD CONSTRAINT `activos_fijos_ibfk_2` FOREIGN KEY (`cod_categ`) REFERENCES `categorias` (`cod_categ`);

--
-- Filtros para la tabla `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_ibfk_2` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`),
  ADD CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`);

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`cod_depto`) REFERENCES `departamentos` (`cod_depto`),
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`),
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`cod_tipo`) REFERENCES `tipos_categ` (`Cod_Tipo`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_2` FOREIGN KEY (`cod_tipo`) REFERENCES `tipos_categ` (`Cod_Tipo`),
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`);

--
-- Filtros para la tabla `compra_cons`
--
ALTER TABLE `compra_cons`
  ADD CONSTRAINT `compra_cons_ibfk_2` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`),
  ADD CONSTRAINT `compra_cons_ibfk_1` FOREIGN KEY (`cod_cons`) REFERENCES `consumibles` (`cod_cons`);

--
-- Filtros para la tabla `consumibles`
--
ALTER TABLE `consumibles`
  ADD CONSTRAINT `consumibles_ibfk_1` FOREIGN KEY (`cod_categ`) REFERENCES `categorias` (`cod_categ`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_3` FOREIGN KEY (`cod_area`) REFERENCES `areas` (`cod_area`),
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`),
  ADD CONSTRAINT `departamentos_ibfk_2` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`);

--
-- Filtros para la tabla `opciones_de_menu`
--
ALTER TABLE `opciones_de_menu`
  ADD CONSTRAINT `opciones_de_menu_ibfk_1` FOREIGN KEY (`cod_menu`) REFERENCES `menues` (`cod_menu`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`);

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`cod_depto`) REFERENCES `departamentos` (`cod_depto`);

--
-- Filtros para la tabla `puestos_x_user`
--
ALTER TABLE `puestos_x_user`
  ADD CONSTRAINT `puestos_x_user_ibfk_2` FOREIGN KEY (`cod_puesto`) REFERENCES `puestos` (`cod_puesto`),
  ADD CONSTRAINT `puestos_x_user_ibfk_1` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`);

--
-- Filtros para la tabla `reciclados`
--
ALTER TABLE `reciclados`
  ADD CONSTRAINT `reciclados_ibfk_2` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`),
  ADD CONSTRAINT `reciclados_ibfk_1` FOREIGN KEY (`cod_cons`) REFERENCES `consumibles` (`cod_cons`);

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_2` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`),
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`cod_af`) REFERENCES `activos_fijos` (`cod_af`);

--
-- Filtros para la tabla `tipos_categ`
--
ALTER TABLE `tipos_categ`
  ADD CONSTRAINT `tipos_categ_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`cod_perf`) REFERENCES `perfiles` (`cod_perf`),
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`cod_puesto`) REFERENCES `puestos` (`cod_puesto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
