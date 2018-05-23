-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 22/05/2018 às 04:37
-- Versão do servidor: 5.5.60
-- Versão do PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `13100192`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Alunos`
--

CREATE TABLE `Alunos` (
  `idAlunos` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `DataNasc` datetime NOT NULL,
  `IDCurso` int(6) DEFAULT NULL,
  `Matricula` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Alunos`
--

INSERT INTO `Alunos` (`idAlunos`, `Nome`, `Email`, `DataNasc`, `IDCurso`, `Matricula`) VALUES
(1, 'Henrique', 'henriquerc2015@gmail.com', '2000-12-04 00:00:00', NULL, 0),
(5, 'Vitor', 'vitor.cazella@gmail.com', '1998-10-21 00:00:00', NULL, 0),
(8, 'Douglas', 'themw63boss@outlook.com', '2000-02-04 00:00:00', NULL, 0),
(13, 'Steff', 'steff@outlook.com', '2003-05-05 00:00:00', NULL, 0),
(14, 'Joice', 'joicepperes@outlook.com', '2000-04-19 00:00:00', NULL, 0),
(15, 'Rafaela', 'pimentel.rafaela@outlook.com', '2002-03-21 00:00:00', NULL, 0),
(16, 'Alexey', 'alexey.ribeiro@hotmail.com', '2000-10-16 00:00:00', NULL, 0),
(17, 'Malu', 'malu.cortez.fernandes@outlook.com', '2002-06-09 00:00:00', NULL, 0),
(18, 'Julia', 'jugrimes14@gmail.com', '2001-01-25 00:00:00', NULL, 0),
(19, 'Samuel', 'samuel.kuhn@hotmail.com', '2001-05-21 00:00:00', NULL, 0),
(20, 'Victoria', 'victoria.letona@gmail.com', '2002-08-14 00:00:00', NULL, 0),
(21, 'Matheus', 'matheusiparaguirre@hotmail.com', '2000-02-29 00:00:00', NULL, 0),
(22, 'Isabel', 'isabelkuhn99@gmail.com', '1999-11-19 00:00:00', NULL, 0),
(23, 'Leo', 'leolima@gmail.com', '2000-10-25 00:00:00', NULL, 0),
(24, 'Amanda', 'amandaclemes@gmail.com', '1998-10-18 00:00:00', NULL, 0),
(25, 'José', 'ze@gmail.com', '2000-10-01 00:00:00', NULL, 0),
(26, 'José', 'ze@gmail.com', '2000-10-01 00:00:00', NULL, 0),
(27, 'José', 'ze@gmail.com', '2000-10-01 00:00:00', 0, 0),
(28, 'Henrique', 'henriquerc2015@gmail.com', '2000-12-04 00:00:00', 0, 0),
(29, 'Vitor', 'vitor.cazella@gmail.com', '1998-10-21 00:00:00', 0, 0),
(30, 'Douglas', 'themw63boss@outlook.com', '2000-02-04 00:00:00', 0, 0),
(31, 'Joice', 'joicepperes@outlook.com', '2000-04-19 00:00:00', 2, 0),
(32, 'Steff', 'steff@outlook.com', '2003-05-05 00:00:00', 2, 0),
(33, 'Malu', 'malu.cortez.fernandes@outlook.com', '2002-06-09 00:00:00', 2, 0),
(34, 'Leo', 'leolima@gmail.com', '2000-10-21 00:00:00', 3, 0),
(35, 'Samuel', 'samuel.kuhn@hotmail.com', '2001-05-21 00:00:00', 3, 0),
(36, 'Matheus', 'matheusiparaguirre@hotmail.com', '2000-02-29 00:00:00', 3, 0),
(37, 'Henrique', 'henriquerc2015@gmail.com', '2000-12-04 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cursos`
--

CREATE TABLE `Cursos` (
  `idCurso` int(6) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Cursos`
--

INSERT INTO `Cursos` (`idCurso`, `Nome`) VALUES
(0, 'Informática'),
(2, 'Administração'),
(3, 'Eletrônica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Disciplina`
--

CREATE TABLE `Disciplina` (
  `idDisciplina` int(6) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `CargaHoraria` int(6) NOT NULL,
  `idCurso` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Disciplina`
--

INSERT INTO `Disciplina` (`idDisciplina`, `Nome`, `CargaHoraria`, `idCurso`) VALUES
(1, 'Banco de Dados', 14, 0),
(2, 'Sistemas Operacionais', 14, 0),
(3, 'Redes de Computadores', 14, 0),
(4, 'Linguagem de Programação', 14, 0),
(5, 'Representação Gráfica', 14, 0),
(6, 'Arquitetura de Computadores', 14, 0),
(7, 'Introdução à Economia I', 60, 2),
(8, 'Teoria Geral da Administração I', 60, 2),
(9, 'Contabilidade Básica I', 60, 2),
(10, 'Estatística I', 60, 2),
(11, 'Matemática I', 60, 2),
(12, 'Seminário Integrador I', 30, 2),
(13, 'Desenho Técnico', 34, 3),
(14, 'Eletricidade', 68, 3),
(15, 'Análise de Circuitos', 68, 3),
(16, 'Eletrônica Digital', 68, 3),
(17, 'Laboratório', 34, 3),
(18, 'Inglês Técnico', 34, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Matricula`
--

CREATE TABLE `Matricula` (
  `idMatricula` int(6) NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `idAlunos` int(6) NOT NULL,
  `idDisciplina` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Alunos`
--
ALTER TABLE `Alunos`
  ADD PRIMARY KEY (`idAlunos`),
  ADD KEY `fk_Aluno_Curso_idx` (`IDCurso`);

--
-- Índices de tabela `Cursos`
--
ALTER TABLE `Cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Índices de tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD PRIMARY KEY (`idDisciplina`),
  ADD KEY `fk_Disciplina_1_idx` (`idCurso`);

--
-- Índices de tabela `Matricula`
--
ALTER TABLE `Matricula`
  ADD PRIMARY KEY (`idMatricula`),
  ADD KEY `fk_Matricula_1_idx` (`idAlunos`),
  ADD KEY `fk_Matricula_2_idx` (`idDisciplina`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `Alunos`
--
ALTER TABLE `Alunos`
  MODIFY `idAlunos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `Cursos`
--
ALTER TABLE `Cursos`
  MODIFY `idCurso` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  MODIFY `idDisciplina` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `Matricula`
--
ALTER TABLE `Matricula`
  MODIFY `idMatricula` int(6) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Alunos`
--
ALTER TABLE `Alunos`
  ADD CONSTRAINT `fk_Aluno_Curso` FOREIGN KEY (`IDCurso`) REFERENCES `Cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD CONSTRAINT `fk_Disciplina_1` FOREIGN KEY (`idCurso`) REFERENCES `Cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `Matricula`
--
ALTER TABLE `Matricula`
  ADD CONSTRAINT `fk_Matricula_1` FOREIGN KEY (`idAlunos`) REFERENCES `Alunos` (`idAlunos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matricula_2` FOREIGN KEY (`idDisciplina`) REFERENCES `Disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
