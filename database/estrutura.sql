-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Nov-2017 às 17:30
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mylib`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE IF NOT EXISTS `emprestimo` (
  `emp_cod` int(11) NOT NULL,
  `emp_liv_cod` int(11) NOT NULL,
  `emp_fun_cod` int(11) NOT NULL,
  `emp_data_loc` date NOT NULL,
  `emp_data_dev` int(11) NOT NULL,
  `emp_leit_cod` int(11) NOT NULL,
  PRIMARY KEY (`emp_cod`),
  KEY `liv_cod` (`emp_liv_cod`),
  KEY `fun_cod` (`emp_fun_cod`),
  KEY `emp_leit_cod` (`emp_leit_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `fun_cod` int(11) NOT NULL AUTO_INCREMENT,
  `fun_nome_comp` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `fun_cpf` int(11) NOT NULL,
  `fun_data_nasc` date NOT NULL,
  `fun_tel` int(11) NOT NULL,
  `fun_email` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `dat_cadastro` date NOT NULL,
  `fun_ende` int(11) NOT NULL,
  `fun_rg` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `fun_senha` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `fun_responsavel` tinyint(1) NOT NULL,
  PRIMARY KEY (`fun_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `leitor`
--

CREATE TABLE IF NOT EXISTS `leitor` (
  `Lei_cod` int(11) NOT NULL,
  `lei_nome_comp` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `lei_dat_nas` date NOT NULL,
  `lei_dat_cadast` date NOT NULL,
  `lei_ende` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `lei_telefone` int(11) NOT NULL,
  `lei_email` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `lei_rg` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `lei_cpf` varchar(15) CHARACTER SET armscii8 NOT NULL,
  `lei_senha` varchar(100) CHARACTER SET armscii8 NOT NULL,
  PRIMARY KEY (`Lei_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE IF NOT EXISTS `livro` (
  `liv_cod` int(11) NOT NULL,
  `liv_nome` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_autor` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_titulo` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_ano` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_edc` int(11) NOT NULL,
  `liv_editora` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_dat_aqui` date NOT NULL,
  `liv_palav_chav` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_quantidade` int(11) NOT NULL,
  `liv_cam_image` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `liv_listavel` tinyint(1) NOT NULL,
  PRIMARY KEY (`liv_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_3` FOREIGN KEY (`emp_leit_cod`) REFERENCES `leitor` (`Lei_cod`),
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`emp_liv_cod`) REFERENCES `livro` (`liv_cod`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`emp_fun_cod`) REFERENCES `funcionario` (`fun_cod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
