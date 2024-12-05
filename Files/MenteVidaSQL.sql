-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 09:54 PM
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
  `data_agendamento` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `paciente_id_paciente` int(11) DEFAULT NULL,
  `medico_id_medico` int(11) DEFAULT NULL,
  `funcionario_id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agendamento`
--

INSERT INTO `agendamento` (`id_agendamento`, `data_agendamento`, `status`, `paciente_id_paciente`, `medico_id_medico`, `funcionario_id_funcionario`) VALUES
(1, '2003-01-01 00:00:00', 1, 1, 1, 1),
(2, '2010-10-10 10:00:00', 1, 2, 3, 3),
(3, '2011-11-11 11:00:00', 1, 4, 4, 4),
(4, '2012-12-12 12:00:00', 1, 5, 5, 5);

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
(1, 120, 200, 1, 1),
(2, 120, 200, 2, 3),
(3, 150, 200, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `telefone`, `cpf`, `email`, `cargo`, `idUsuario`) VALUES
(1, 'Usuário Comum', '22222222222', '00000000001', 'email@email', 'Atendente', 3),
(2, 'Funcionário Miguel', '6122551166', '00000000002', 'funcionario@exemplo', 'Atendente', 4),
(3, 'Murilo Johan', '6155221144', '00000000003', 'murilojo@murilojo', 'Atendente', 9),
(4, 'Felix Almeida', '6111225522', '00000000004', 'felix@felix', 'Estagiário', 10),
(5, 'Lucas Teixeira', '6122552255', '00000000005', 'lucas@lucas', 'Atendente', 11),
(6, 'Novo Funcionario', '6199223322', '00000000006', 'email@gmail', 'Atendente', 12);

--
-- Triggers `funcionario`
--
DELIMITER $$
CREATE TRIGGER `after_funcionario_delete` AFTER DELETE ON `funcionario` FOR EACH ROW BEGIN
    DELETE FROM UsuarioAssociacao WHERE idUsuario = OLD.idUsuario AND Cargo = 'Funcionario';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_funcionario_insert` BEFORE INSERT ON `funcionario` FOR EACH ROW BEGIN
    IF NEW.idUsuario IS NOT NULL THEN
        INSERT INTO UsuarioAssociacao (idUsuario, Cargo)
        VALUES (NEW.idUsuario, 'Funcionario')
        ON DUPLICATE KEY UPDATE Cargo = 'Funcionario';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_funcionario_update` BEFORE UPDATE ON `funcionario` FOR EACH ROW BEGIN
    IF NEW.idUsuario IS NOT NULL THEN
        INSERT INTO UsuarioAssociacao (idUsuario, Cargo)
        VALUES (NEW.idUsuario, 'Funcionario')
        ON DUPLICATE KEY UPDATE Cargo = 'Funcionario';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `nome`, `especialidade`, `telefone`, `cpf`, `email`, `idUsuario`) VALUES
(1, 'Administrador', 'Administrador', '1111111111', '00000000001', 'email@email', 1),
(2, 'Médico Exemplo', 'Psiquiatria', '6199225544', '00000000002', 'medicoexemplo@medicoexemplo', 5),
(3, 'Ana Maria', 'Psicologia', '6111221122', '00000000003', 'anamaria@anamaria', 6),
(4, 'José Alencar', 'Psiquiatria', '6155221122', '00000000004', 'josealen@josealen', 7),
(5, 'Roberto Nunes', 'Psicologia', '1125252525', '00000000005', 'robertonunes@robertonunes', 8);

--
-- Triggers `medico`
--
DELIMITER $$
CREATE TRIGGER `after_medico_delete` AFTER DELETE ON `medico` FOR EACH ROW BEGIN
    DELETE FROM UsuarioAssociacao WHERE idUsuario = OLD.idUsuario AND Cargo = 'Medico';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_medico_insert` BEFORE INSERT ON `medico` FOR EACH ROW BEGIN
    IF NEW.idUsuario IS NOT NULL THEN
        INSERT INTO UsuarioAssociacao (idUsuario, Cargo)
        VALUES (NEW.idUsuario, 'Medico')
        ON DUPLICATE KEY UPDATE Cargo = 'Medico';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_medico_update` BEFORE UPDATE ON `medico` FOR EACH ROW BEGIN
    IF NEW.idUsuario IS NOT NULL THEN
        INSERT INTO UsuarioAssociacao (idUsuario, Cargo)
        VALUES (NEW.idUsuario, 'Medico')
        ON DUPLICATE KEY UPDATE Cargo = 'Medico';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `historico_medico` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nome`, `data_nascimento`, `telefone`, `cpf`, `email`, `historico_medico`) VALUES
(1, 'Primeiro Paciente', '2000-01-01', '1111552212', '00000000001', 'paciente@email', '$Pacientes$PrimeiroPaciente'),
(2, 'Isabel Melissa', '2000-01-22', '6122112211', '00000000002', 'isabel@isabel', '$Pacientes$historico2IsabelMelissa.pdf'),
(3, 'Gabriel André dos Santos', '2000-10-12', '6199885522', '00000000003', 'gabriel@gabriel', '$Pacientes$historico3GabrielAndrédosSantos.pdf'),
(4, 'Guilherme Cordeiro', '2001-12-12', '6188552211', '00000000004', 'guilherme@guilherme', '$Pacientes$historico4GuilhermeCordeiro.pdf'),
(5, 'Danilo Cordeiro', '2002-11-20', '6188552211', '00000000005', 'danilo@danilo', '$Pacientes$historico5DaniloCordeiro.pdf'),
(6, 'Teste Paciente', '2012-12-12', '61 99223399', '00000000006', 'emal@gmail.com', '$Pacientes$historico6TestePaciente.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `prescricao`
--

CREATE TABLE `prescricao` (
  `id_prescricao` int(11) NOT NULL,
  `data_prescricao` date NOT NULL,
  `medicamentos` varchar(200) DEFAULT NULL,
  `dosagem` varchar(200) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `id_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescricao`
--

INSERT INTO `prescricao` (`id_prescricao`, `data_prescricao`, `medicamentos`, `dosagem`, `comentario`, `id_consulta`) VALUES
(1, '2003-01-01', 'Medicamento 01, Medicamento 02', 'XX a cada XX horas.', 'Caso XX, fazer YY.', 1),
(2, '2010-10-10', 'Paracetamol', 'Uma pílula por dia.', 'Parar depois que os sintomas desaparecerem', 2),
(3, '2011-11-11', 'Dorflex', 'Uma pílula.', 'Só tomar quando os sintomas aparecerem.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `relatorio`
--

CREATE TABLE `relatorio` (
  `id_relatorio` int(11) NOT NULL,
  `data_relatorio` date NOT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `consulta_id_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relatorio`
--

INSERT INTO `relatorio` (`id_relatorio`, `data_relatorio`, `endereco`, `consulta_id_consulta`) VALUES
(1, '2003-01-01', '$Relatorios$relatorio1consulta1', 1),
(2, '2010-10-10', '$Relatorios$relatorio2consulta2.pdf', 2),
(3, '2011-11-11', '$Relatorios$relatorio3consulta3.pdf', 3),
(5, '2005-05-05', '$Relatorios$relatorio5consulta3.pdf', 3);

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
(1, 'admin', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 1),
(3, 'user', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(4, 'funcionario', '4gkmw3ki6ko6ovge1xyyi37vdki9qnxh57lqfbcjyf64sx98b', 1),
(5, 'medico', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 1),
(6, 'anamaria', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(7, 'josealencar', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(8, 'robertonunes', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(9, 'murilojohan', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(10, 'felixalmeida', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 0),
(11, 'lucasteixeira', '28dj8alll8duem6u7rp5pw0vb3c69fyn887cbrgcld6nqr1qkl', 0),
(12, 'novousuario1', '45auvrm8e57zm8y2dyh0s3ows1n3bit9vrxsqcaikpyj7j7izn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarioassociacao`
--

CREATE TABLE `usuarioassociacao` (
  `idUsuario` int(11) NOT NULL,
  `Cargo` enum('Funcionario','Medico') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarioassociacao`
--

INSERT INTO `usuarioassociacao` (`idUsuario`, `Cargo`) VALUES
(1, 'Medico'),
(3, 'Funcionario'),
(4, 'Funcionario'),
(5, 'Medico'),
(6, 'Medico'),
(7, 'Medico'),
(8, 'Medico'),
(9, 'Funcionario'),
(10, 'Funcionario'),
(11, 'Funcionario'),
(12, 'Funcionario');

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
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `idUsuario_2` (`idUsuario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `cpf` (`cpf`),
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
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usuarioassociacao`
--
ALTER TABLE `usuarioassociacao`
  ADD PRIMARY KEY (`idUsuario`,`Cargo`),
  ADD UNIQUE KEY `idUsuario` (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescricao`
--
ALTER TABLE `prescricao`
  MODIFY `id_prescricao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `id_relatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `FK_Funcionario_Agendamento` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Medico_Agendamento` FOREIGN KEY (`medico_id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Paciente_Agendamento` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FK_Funcionario_UsuarioAssoc` FOREIGN KEY (`idUsuario`) REFERENCES `usuarioassociacao` (`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_Medico_UsuarioAssoc` FOREIGN KEY (`idUsuario`) REFERENCES `usuarioassociacao` (`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `prescricao`
--
ALTER TABLE `prescricao`
  ADD CONSTRAINT `prescricao_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_relatorio_consulta1` FOREIGN KEY (`consulta_id_consulta`) REFERENCES `consulta` (`id_consulta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarioassociacao`
--
ALTER TABLE `usuarioassociacao`
  ADD CONSTRAINT `UsuarioAssociacao_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
