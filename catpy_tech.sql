-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2021 a las 23:49:15
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catpy_tech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbodega`
--

CREATE TABLE `tbodega` (
  `nIdBodega` int(11) NOT NULL,
  `nIdProducto` int(11) NOT NULL,
  `nIdProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcliente`
--

CREATE TABLE `tcliente` (
  `nIdCliente` int(11) NOT NULL,
  `nDocumento` int(13) NOT NULL,
  `cNombre` varchar(20) NOT NULL,
  `cSegundoNombre` varchar(20) DEFAULT NULL,
  `cApellido` varchar(20) NOT NULL,
  `cSegundoApellido` varchar(20) NOT NULL,
  `cDireccion` varchar(20) NOT NULL,
  `nTelefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcliente`
--

INSERT INTO `tcliente` (`nIdCliente`, `nDocumento`, `cNombre`, `cSegundoNombre`, `cApellido`, `cSegundoApellido`, `cDireccion`, `nTelefono`) VALUES
(1, 100000, 'diego', 'andres', 'fernandez', 'arteaga', '10-52', 365412);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproducto`
--

CREATE TABLE `tproducto` (
  `nIdProducto` int(11) NOT NULL,
  `cNombreProducto` varchar(20) NOT NULL,
  `cNombreProveedor` varchar(20) NOT NULL,
  `nPrecio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tproducto`
--

INSERT INTO `tproducto` (`nIdProducto`, `cNombreProducto`, `cNombreProveedor`, `nPrecio`) VALUES
(5, 'Teclado', 'Genius', 30000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproveedor`
--

CREATE TABLE `tproveedor` (
  `nIdProveedor` int(11) NOT NULL,
  `cNombreProveedor` varchar(20) NOT NULL,
  `cDireccion` varchar(20) NOT NULL,
  `nTelefono` int(10) NOT NULL,
  `cPaginaWeb` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tproveedor`
--

INSERT INTO `tproveedor` (`nIdProveedor`, `cNombreProveedor`, `cDireccion`, `nTelefono`, `cPaginaWeb`) VALUES
(1, 'Genius', 'Soledad', 145236, 'genius.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE `tusuario` (
  `nIdUsuario` int(11) NOT NULL,
  `cUsuario` varchar(10) NOT NULL,
  `cPass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`nIdUsuario`, `cUsuario`, `cPass`) VALUES
(1, 'diego', '12345'),
(2, 'john', '12345'),
(3, 'javier', '12345'),
(4, 'jeremy', '12345'),
(5, 'fernando', '12345'),
(6, 'ghgh', '12345'),
(7, 'luis', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tventa`
--

CREATE TABLE `tventa` (
  `nIdVenta` int(11) NOT NULL,
  `nDocumento` int(13) NOT NULL,
  `nIdProducto` int(11) NOT NULL,
  `nValorFinal` int(10) NOT NULL,
  `cDescuento` int(80) DEFAULT NULL,
  `dFecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tventa`
--

INSERT INTO `tventa` (`nIdVenta`, `nDocumento`, `nIdProducto`, `nValorFinal`, `cDescuento`, `dFecha`) VALUES
(1, 100000, 5, 20000, 10, '2021-10-18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbodega`
--
ALTER TABLE `tbodega`
  ADD PRIMARY KEY (`nIdBodega`),
  ADD UNIQUE KEY `nIdProducto` (`nIdProducto`,`nIdProveedor`),
  ADD KEY `nIdProveedor` (`nIdProveedor`);

--
-- Indices de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  ADD PRIMARY KEY (`nIdCliente`),
  ADD UNIQUE KEY `nDocumento` (`nDocumento`);

--
-- Indices de la tabla `tproducto`
--
ALTER TABLE `tproducto`
  ADD PRIMARY KEY (`nIdProducto`);

--
-- Indices de la tabla `tproveedor`
--
ALTER TABLE `tproveedor`
  ADD PRIMARY KEY (`nIdProveedor`),
  ADD UNIQUE KEY `cNombreProveedor` (`cNombreProveedor`);

--
-- Indices de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  ADD PRIMARY KEY (`nIdUsuario`),
  ADD UNIQUE KEY `cUsuario` (`cUsuario`);

--
-- Indices de la tabla `tventa`
--
ALTER TABLE `tventa`
  ADD PRIMARY KEY (`nIdVenta`),
  ADD UNIQUE KEY `nIdCliente` (`nDocumento`,`nIdProducto`),
  ADD KEY `nIdProducto` (`nIdProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbodega`
--
ALTER TABLE `tbodega`
  MODIFY `nIdBodega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  MODIFY `nIdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tproducto`
--
ALTER TABLE `tproducto`
  MODIFY `nIdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tproveedor`
--
ALTER TABLE `tproveedor`
  MODIFY `nIdProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  MODIFY `nIdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tventa`
--
ALTER TABLE `tventa`
  MODIFY `nIdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbodega`
--
ALTER TABLE `tbodega`
  ADD CONSTRAINT `tbodega_ibfk_1` FOREIGN KEY (`nIdProveedor`) REFERENCES `tproveedor` (`nIdProveedor`),
  ADD CONSTRAINT `tbodega_ibfk_2` FOREIGN KEY (`nIdProducto`) REFERENCES `tproducto` (`nIdProducto`);

--
-- Filtros para la tabla `tproducto`
--
ALTER TABLE `tproducto`
  ADD CONSTRAINT `tproducto_ibfk_1` FOREIGN KEY (`cNombreProveedor`) REFERENCES `tproveedor` (`cNombreProveedor`);

--
-- Filtros para la tabla `tventa`
--
ALTER TABLE `tventa`
  ADD CONSTRAINT `tventa_ibfk_2` FOREIGN KEY (`nIdProducto`) REFERENCES `tproducto` (`nIdProducto`),
  ADD CONSTRAINT `tventa_ibfk_3` FOREIGN KEY (`nDocumento`) REFERENCES `tcliente` (`nDocumento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
