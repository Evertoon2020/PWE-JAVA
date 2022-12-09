DROP DATABASE IF EXISTS _loja;
CREATE DATABASE  _loja;
USE _loja;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `quantidade` INT,
  `preco` DOUBLE,
  `onLine` BOOLEAN,
  PRIMARY KEY (`idProduto`)
);

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(64) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`)
);


