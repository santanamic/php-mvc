-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 02-Jun-2022 às 22:11
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `anyjobs.com.br`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_avaliacao`
--

DROP TABLE IF EXISTS `tb_avaliacao`;
CREATE TABLE IF NOT EXISTS `tb_avaliacao` (
  `ID_Avaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_Comentario` varchar(100) NOT NULL,
  `Nr_Nota` int(2) NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  `ID_Empresa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Avaliacao`),
  KEY `ID_Profissional` (`ID_Profissional`),
  KEY `ID_Empresa` (`ID_Empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_candidatura`
--

DROP TABLE IF EXISTS `tb_candidatura`;
CREATE TABLE IF NOT EXISTS `tb_candidatura` (
  `ID_Profissional` int(11) NOT NULL,
  `ID_Vaga` int(11) NOT NULL,
  `Ds_StatusCandidatura` varchar(2) NOT NULL,
  KEY `ID_Profissional` (`ID_Profissional`),
  KEY `ID_Vaga` (`ID_Vaga`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cursosextracurriculares`
--

DROP TABLE IF EXISTS `tb_cursosextracurriculares`;
CREATE TABLE IF NOT EXISTS `tb_cursosextracurriculares` (
  `ID_Curso` int(11) NOT NULL AUTO_INCREMENT,
  `Nm_Curso` varchar(50) NOT NULL,
  `Dt_Conclusao` date DEFAULT NULL,
  `Nm_InstituicaoCurso` varchar(50) NOT NULL,
  `Nr_CargaHoraria` int(11) NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  PRIMARY KEY (`ID_Curso`),
  KEY `ID_Profissional` (`ID_Profissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_empresa`
--

DROP TABLE IF EXISTS `tb_empresa`;
CREATE TABLE IF NOT EXISTS `tb_empresa` (
  `ID_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_Nome` varchar(50) NOT NULL,
  `Nr_CNPJ` bigint(14) NOT NULL,
  `Ds_Empresa` text NOT NULL,
  `Ds_Setor` varchar(50) NOT NULL,
  `Nr_Telefone` int(15) NOT NULL,
  `Ds_Senha` varchar(15) NOT NULL,
  `Ds_Pais` varchar(50) NOT NULL,
  `Ds_Rua` varchar(50) NOT NULL,
  `Ds_Estado` varchar(2) NOT NULL,
  `Ds_Cidade` varchar(50) NOT NULL,
  `Ds_Complemento` varchar(10) NOT NULL,
  `Ds_Bairro` varchar(50) NOT NULL,
  `Nr_CEP` int(8) NOT NULL,
  PRIMARY KEY (`ID_Empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_empresa`
--

INSERT INTO `tb_empresa` (`ID_Empresa`, `Ds_Nome`, `Nr_CNPJ`, `Ds_Empresa`, `Ds_Setor`, `Nr_Telefone`, `Ds_Senha`, `Ds_Pais`, `Ds_Rua`, `Ds_Estado`, `Ds_Cidade`, `Ds_Complemento`, `Ds_Bairro`, `Nr_CEP`) VALUES
(1, 'Lojas Renner', 100, 'A Renner é a maior varejista de moda do Brasil. A companhia, constituída em 1965, foi a primeira corporação brasileira com 100% das ações negociadas em bolsa e está listada no Novo Mercado, grau mais elevado dentre os níveis diferenciados de governança corporativa da B3.\r\n\r\nA Renner conta com uma cultura corporativa sólida que se reflete nas lojas espalhadas por todos os estados brasileiros. Os princípios e valores da empresa norteiam a incessante busca por melhores práticas, encantamento de todos os seus públicos e maior rentabilidade. A Renner oferece um ambiente corporativo para “todos os estilos de carreira”.', 'Varejo', 41215501, '123', 'BR', 'Dom Pedro', 'SP', 'São Paulo', 'N/D', 'Morumbi', 6550000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `ID_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_Pais` varchar(50) NOT NULL,
  `Ds_Rua` varchar(50) NOT NULL,
  `Ds_Estado` varchar(2) NOT NULL,
  `Ds_Cidade` varchar(50) NOT NULL,
  `Ds_Complemento` varchar(10) DEFAULT NULL,
  `Ds_Bairro` varchar(50) NOT NULL,
  `Nr_CEP` int(8) NOT NULL,
  PRIMARY KEY (`ID_Endereco`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_experiencia`
--

DROP TABLE IF EXISTS `tb_experiencia`;
CREATE TABLE IF NOT EXISTS `tb_experiencia` (
  `ID_Experiencia` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_Cargo` varchar(50) NOT NULL,
  `Ds_TipoEmprego` varchar(15) NOT NULL,
  `Ds_Cidade` varchar(50) NOT NULL,
  `Ds_Estado` varchar(2) NOT NULL,
  `Ds_Atividades` varchar(100) NOT NULL,
  `Nm_Empregador` varchar(50) NOT NULL,
  `Dt_Entrada` date NOT NULL,
  `Dt_Saída` date NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  PRIMARY KEY (`ID_Experiencia`),
  KEY `ID_Profissional` (`ID_Profissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_formacao`
--

DROP TABLE IF EXISTS `tb_formacao`;
CREATE TABLE IF NOT EXISTS `tb_formacao` (
  `ID_Formacao` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_Formacao` varchar(100) DEFAULT NULL,
  `Ds_AreaEstudo` varchar(15) NOT NULL,
  `Ds_Escolaridade` varchar(15) NOT NULL,
  `Nm_InstituicaoEnsino` varchar(15) NOT NULL,
  `Dt_Inicio` date NOT NULL,
  `Dt_Termino` date NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  PRIMARY KEY (`ID_Formacao`),
  KEY `ID_Profissional` (`ID_Profissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_idiomas`
--

DROP TABLE IF EXISTS `tb_idiomas`;
CREATE TABLE IF NOT EXISTS `tb_idiomas` (
  `ID_Idiomas` int(11) NOT NULL AUTO_INCREMENT,
  `Nm_Idioma` varchar(15) NOT NULL,
  `Ds_Nivel` varchar(15) NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  PRIMARY KEY (`ID_Idiomas`),
  KEY `ID_Profissional` (`ID_Profissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_objetivos`
--

DROP TABLE IF EXISTS `tb_objetivos`;
CREATE TABLE IF NOT EXISTS `tb_objetivos` (
  `ID_Objetivos` int(11) NOT NULL AUTO_INCREMENT,
  `Ds_PretensaoCargo` varchar(50) NOT NULL,
  `Ds_CidadesAceitas` varchar(50) NOT NULL,
  `Ds_PretensaoTurno` varchar(15) NOT NULL,
  `Ds_TipoTrabalhoPretendido` varchar(15) NOT NULL,
  `ID_Profissional` int(11) NOT NULL,
  PRIMARY KEY (`ID_Objetivos`),
  KEY `ID_Profissional` (`ID_Profissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_profissional`
--

DROP TABLE IF EXISTS `tb_profissional`;
CREATE TABLE IF NOT EXISTS `tb_profissional` (
  `ID_Profissional` int(11) NOT NULL AUTO_INCREMENT,
  `Vr_PretensaoSalarial` decimal(8,2) NOT NULL,
  `St_Perfil` varchar(15) NOT NULL,
  `Ds_Email` varchar(50) NOT NULL,
  `Nr_Telefone` int(10) NOT NULL,
  `Nr_Celular` int(11) NOT NULL,
  `Ds_Sexo` varchar(2) NOT NULL,
  `Ds_Habilitacao` varchar(10) NOT NULL,
  `Ds_Senha` varchar(15) NOT NULL,
  `Nr_CPF` bigint(11) NOT NULL,
  `Dt_Nascimento` date DEFAULT NULL,
  `ID_Endereco` int(11) NOT NULL,
  PRIMARY KEY (`ID_Profissional`),
  KEY `ID_Endereco` (`ID_Endereco`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_profissional`
--

INSERT INTO `tb_profissional` (`ID_Profissional`, `Vr_PretensaoSalarial`, `St_Perfil`, `Ds_Email`, `Nr_Telefone`, `Nr_Celular`, `Ds_Sexo`, `Ds_Habilitacao`, `Ds_Senha`, `Nr_CPF`, `Dt_Nascimento`, `ID_Endereco`) VALUES
(1, '0.00', '', 'profissional@teste.com', 41312233, 99655443, 'M', 'B', '1234', 12345678911, '2012-12-12', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vagas`
--

DROP TABLE IF EXISTS `tb_vagas`;
CREATE TABLE IF NOT EXISTS `tb_vagas` (
  `ID_Vaga` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Criacao` date NOT NULL,
  `Ds_Funcao` varchar(50) NOT NULL,
  `Ds_RegimeContratacao` varchar(15) NOT NULL,
  `Ds_Local` varchar(50) NOT NULL,
  `Ds_Beneficios` varchar(50) NOT NULL,
  `Qt_Candidatos` int(11) NOT NULL,
  `Qt_Visualizacoes` int(11) NOT NULL,
  `Qt_Vagas` int(11) NOT NULL,
  `Ds_Jornada` varchar(15) NOT NULL,
  `Ds_Requisitos` varchar(100) NOT NULL,
  `Ds_Vaga` text NOT NULL,
  `Ds_Status` varchar(2) NOT NULL,
  `Qt_LimiteCandidaturas` int(11) NOT NULL,
  `Vl_Salario` decimal(8,2) NOT NULL,
  `Ds_HorarioTrabalho` varchar(15) NOT NULL,
  `ID_Empresa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Vaga`),
  KEY `ID_Empresa` (`ID_Empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_vagas`
--

INSERT INTO `tb_vagas` (`ID_Vaga`, `Dt_Criacao`, `Ds_Funcao`, `Ds_RegimeContratacao`, `Ds_Local`, `Ds_Beneficios`, `Qt_Candidatos`, `Qt_Visualizacoes`, `Qt_Vagas`, `Ds_Jornada`, `Ds_Requisitos`, `Ds_Vaga`, `Ds_Status`, `Qt_LimiteCandidaturas`, `Vl_Salario`, `Ds_HorarioTrabalho`, `ID_Empresa`) VALUES
(1, '2012-12-12', 'Repositor', 'CLT', 'São Paulo - SP', 'N/D', 0, 0, 0, 'Tempo Integral', '', 'O Funcionário repõe e arruma as mercadorias em uma prateleira, sendo a pessoa responsável por organizar e abastecer as gôndolas de produtos. Também atende os clientes, indicando a posição de uma mercadoria.', '', 0, '0.00', '', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
