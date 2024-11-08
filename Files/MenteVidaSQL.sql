-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 12:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mentevida`
--
CREATE DATABASE IF NOT EXISTS `mentevida` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mentevida`;

-- --------------------------------------------------------

--
-- Table structure for table `agendamento`
--

CREATE TABLE `agendamento` (
  `id_agendamento` int(11) NOT NULL,
  `data_agendamento` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `paciente_id_paciente` int(11) NOT NULL,
  `medico_id_medico` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agendamento`
--

INSERT INTO `agendamento` (`id_agendamento`, `data_agendamento`, `status`, `paciente_id_paciente`, `medico_id_medico`, `funcionario_id_funcionario`) VALUES
(2, '2024-05-12', 0, 2, 1, 1),
(3, '2021-07-22', 0, 5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `duracao` int(11) NOT NULL,
  `valor` double DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `duracao`, `valor`, `id_paciente`, `id_medico`) VALUES
(2, 40, 225, 5, 2),
(3, 60, 275, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `telefone`, `email`, `cargo`, `idUsuario`) VALUES
(1, 'Bianca Almeida', '8521597531', 'biancaal@hotmail.com', 'Recepcionista', 6),
(2, 'Mariana Almeida', '12345678995', 'mariana@email.com', 'Gerente', 7);

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `nome`, `especialidade`, `telefone`, `email`, `idUsuario`) VALUES
(1, 'DADADADA', 'Psicologia', '521465215', 'dadada@email', 4),
(2, 'Rafael Mendes', 'Psiquiatria', '1546582145', 'faelmendes@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `historico_medico` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nome`, `data_nascimento`, `telefone`, `email`, `historico_medico`) VALUES
(2, 'Evil Neuro', '2020-01-01', '999999999', 'vedal987@email', 'swarmadjskajdk'),
(5, 'vedal', '1998-01-12', '9854123541', 'vedal@email', 'C:\\historico\\historico2.pdf'),
(6, 'lucas', '2008-05-21', '8541254615', 'lucas@email', 'C:\\historico\\historico2.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `prescricao`
--

CREATE TABLE `prescricao` (
  `id_prescricao` int(11) NOT NULL,
  `data_prescricao` date NOT NULL,
  `medicamentos` text DEFAULT NULL,
  `dosagem` varchar(100) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `id_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescricao`
--

INSERT INTO `prescricao` (`id_prescricao`, `data_prescricao`, `medicamentos`, `dosagem`, `comentario`, `id_consulta`) VALUES
(2, '2024-12-11', 'medicamento 2, medicamento 3, medicamento 4', 'dosagem A e B', 'Isto é um outro comentário', 3),
(3, '2024-12-20', 'medicamento 4, medicamento 6, medicamento 4', 'dosagem F e D', 'Isto é mais um comentário', 2);

-- --------------------------------------------------------

--
-- Table structure for table `relatorio`
--

CREATE TABLE `relatorio` (
  `id_relatorio` int(11) NOT NULL,
  `data_relatorio` date NOT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `consulta_id_consulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relatorio`
--

INSERT INTO `relatorio` (`id_relatorio`, `data_relatorio`, `endereco`, `consulta_id_consulta`) VALUES
(2, '2022-09-15', 'C\\Relatorios\\relatorio2.pdf', 3);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `username`, `senha`, `admin`) VALUES
(2, 'admin', '3hzi4r81f30g81bo5orq5ddbh3uuqoo28158si9djbh20p0sgo', 1),
(3, 'user', '4gkmw3ki6ko6ovge1xyyi37vdki9qnxh57lqfbcjyf64sx98b', 0),
(4, 'dada_user', '4ai62shviykclpd4zadmjhgdc6it8y6lqz2jfnj10di35visru', 0),
(5, 'rafaelmen', '4gkmw3ki6ko6ovge1xyyi37vdki9qnxh57lqfbcjyf64sx98b', 0),
(6, 'bianca_', '4gkmw3ki6ko6ovge1xyyi37vdki9qnxh57lqfbcjyf64sx98b', 0),
(7, 'mariana1212', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `fk_agendamento_paciente1_idx` (`paciente_id_paciente`),
  ADD KEY `fk_agendamento_medico1_idx` (`medico_id_medico`),
  ADD KEY `fk_agendamento_atendente1_idx` (`funcionario_id_funcionario`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `medico_ibfk_1` (`idUsuario`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `prescricao`
--
ALTER TABLE `prescricao`
  ADD PRIMARY KEY (`id_prescricao`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Indexes for table `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`id_relatorio`),
  ADD KEY `fk_relatorio_consulta1_idx` (`consulta_id_consulta`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescricao`
--
ALTER TABLE `prescricao`
  MODIFY `id_prescricao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `id_relatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk_agendamento_atendente1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agendamento_medico1` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agendamento_paciente1` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON UPDATE CASCADE;

--
-- Constraints for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescricao`
--
ALTER TABLE `prescricao`
  ADD CONSTRAINT `prescricao_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`) ON UPDATE CASCADE;

--
-- Constraints for table `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_relatorio_consulta1` FOREIGN KEY (`consulta_id_consulta`) REFERENCES `consulta` (`id_consulta`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
