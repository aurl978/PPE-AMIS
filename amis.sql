-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  jeu. 28 mars 2019 à 09:12
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `amis`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `NUMACTION` int(2) NOT NULL,
  `NUMAMIS` bigint(4) NOT NULL,
  `NUMCOMISSION` int(2) DEFAULT NULL,
  `NOMACTION` char(32) DEFAULT NULL,
  `DATEDEBUTACTION` date DEFAULT NULL,
  `DUREEACTION` smallint(1) DEFAULT NULL,
  `MONTANTTOTALEACTION` bigint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`NUMACTION`, `NUMAMIS`, `NUMCOMISSION`, `NOMACTION`, `DATEDEBUTACTION`, `DUREEACTION`, `MONTANTTOTALEACTION`) VALUES
(1, 3, 2, 'Aide aux bébés chats', '2018-10-11', 15, 200),
(2, 1, 1, 'Faire le ménage', '2018-11-07', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `amis`
--

CREATE TABLE `amis` (
  `NUMAMIS` bigint(4) NOT NULL,
  `NUMFONCTION` int(2) DEFAULT NULL,
  `NOMAMIS` char(32) DEFAULT NULL,
  `mdp` varchar(32) NOT NULL,
  `PRENOMAMIS` char(32) DEFAULT NULL,
  `TELEPHONEFIXEAMIS` char(10) DEFAULT NULL,
  `TELEPHONEPORTABLEAMIS` char(10) DEFAULT NULL,
  `EMAILAMIS` char(32) DEFAULT NULL,
  `NUMEROADRESSEAMIS` char(10) DEFAULT NULL,
  `ADRESSERUEAMIS` char(32) DEFAULT NULL,
  `ADRESSEVILLEAMIS` char(32) DEFAULT NULL,
  `DATEENTREEAMIS` date DEFAULT NULL,
  `NUM_PARRAIN1` bigint(4) DEFAULT NULL,
  `NUM_PARRAIN2` bigint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `amis`
--

INSERT INTO `amis` (`NUMAMIS`, `NUMFONCTION`, `NOMAMIS`, `mdp`, `PRENOMAMIS`, `TELEPHONEFIXEAMIS`, `TELEPHONEPORTABLEAMIS`, `EMAILAMIS`, `NUMEROADRESSEAMIS`, `ADRESSERUEAMIS`, `ADRESSEVILLEAMIS`, `DATEENTREEAMIS`, `NUM_PARRAIN1`, `NUM_PARRAIN2`) VALUES
(1, 1, 'Dupont', 'dupont', 'Albert', '0555675864', '0646758943', 'albert.dupont@gmail.com', '32', 'rue du petit', 'Limoges', '2018-03-14', NULL, NULL),
(2, 3, 'Lacourt', 'lacourt', 'Mélanie', '0555987865', '0687346512', 'lacourt.melanie@hotmail.fr', '65', 'avenue de corgnac', 'Brive', '2010-01-21', NULL, NULL),
(3, NULL, 'Chevry', '', 'Bernard', '0565342487', '0698765400', 'chevry.bernard@gmail.com', '54', 'rue des leopards', 'Périgueux', '1994-07-13', NULL, NULL),
(4, 5, 'Petit', 'petit', 'Jean', '0565456587', '0657643698', 'jean.petit@gmail.com', '54', 'rue de la seine', 'Paris', '2017-01-17', NULL, NULL),
(5, 2, 'Pasqualini', 'pasqualini', 'Claude', '0765987644', '0645327699', 'claude.pasqualini@gmail.com', '43', 'avenue de la liberté', 'St Junien', '2015-05-19', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comission`
--

CREATE TABLE `comission` (
  `NUMCOMISSION` int(2) NOT NULL,
  `NOMCOMISSION` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comission`
--

INSERT INTO `comission` (`NUMCOMISSION`, `NOMCOMISSION`) VALUES
(1, 'COMM1'),
(2, 'COMM2');

-- --------------------------------------------------------

--
-- Structure de la table `diner`
--

CREATE TABLE `diner` (
  `DATEDINER` date NOT NULL,
  `LIEUDINER` char(32) DEFAULT NULL,
  `PRIXDINER` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diner`
--

INSERT INTO `diner` (`DATEDINER`, `LIEUDINER`, `PRIXDINER`) VALUES
('2018-11-22', 'St Junien', 25),
('2018-12-22', 'chez Julie', 65);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `NUMFONCTION` int(2) NOT NULL,
  `NUMAMIS` bigint(4) DEFAULT NULL,
  `NOMFONCTION` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`NUMFONCTION`, `NUMAMIS`, `NOMFONCTION`) VALUES
(1, NULL, 'président'),
(2, NULL, 'vice-président'),
(3, NULL, 'secrétaire'),
(4, NULL, 'secrétaire-adjoint'),
(5, NULL, 'trésorier'),
(6, NULL, 'trésorier-adjoint'),
(7, NULL, 'coordinateur');

-- --------------------------------------------------------

--
-- Structure de la table `manger`
--

CREATE TABLE `manger` (
  `NUMAMIS` bigint(4) NOT NULL,
  `DATEDINER` date NOT NULL,
  `NOMBREINVITEE` smallint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `manger`
--

INSERT INTO `manger` (`NUMAMIS`, `DATEDINER`, `NOMBREINVITEE`) VALUES
(2, '2018-11-22', 8);

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE `parametre` (
  `NUMPARAMETRE` int(2) NOT NULL,
  `MONTANTCOTISATIONANUELLE` smallint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parametre`
--

INSERT INTO `parametre` (`NUMPARAMETRE`, `MONTANTCOTISATIONANUELLE`) VALUES
(1, 45);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `NUMAMIS` bigint(4) NOT NULL,
  `NUMACTION` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`NUMAMIS`, `NUMACTION`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `repartir`
--

CREATE TABLE `repartir` (
  `NUMAMIS` bigint(4) NOT NULL,
  `NUMCOMISSION` int(2) NOT NULL,
  `NUMFONCTION` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repartir`
--

INSERT INTO `repartir` (`NUMAMIS`, `NUMCOMISSION`, `NUMFONCTION`) VALUES
(3, 2, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`NUMACTION`),
  ADD KEY `I_FK_ACTION_AMIS` (`NUMAMIS`),
  ADD KEY `I_FK_ACTION_COMISSION` (`NUMCOMISSION`);

--
-- Index pour la table `amis`
--
ALTER TABLE `amis`
  ADD PRIMARY KEY (`NUMAMIS`),
  ADD UNIQUE KEY `I_FK_AMIS_FONCTION` (`NUMFONCTION`);

--
-- Index pour la table `comission`
--
ALTER TABLE `comission`
  ADD PRIMARY KEY (`NUMCOMISSION`);

--
-- Index pour la table `diner`
--
ALTER TABLE `diner`
  ADD PRIMARY KEY (`DATEDINER`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`NUMFONCTION`),
  ADD UNIQUE KEY `I_FK_FONCTION_AMIS` (`NUMAMIS`);

--
-- Index pour la table `manger`
--
ALTER TABLE `manger`
  ADD PRIMARY KEY (`NUMAMIS`,`DATEDINER`),
  ADD KEY `I_FK_MANGER_AMIS` (`NUMAMIS`),
  ADD KEY `I_FK_MANGER_DINER` (`DATEDINER`);

--
-- Index pour la table `parametre`
--
ALTER TABLE `parametre`
  ADD PRIMARY KEY (`NUMPARAMETRE`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`NUMAMIS`,`NUMACTION`),
  ADD KEY `I_FK_PARTICIPER_AMIS` (`NUMAMIS`),
  ADD KEY `I_FK_PARTICIPER_ACTION` (`NUMACTION`);

--
-- Index pour la table `repartir`
--
ALTER TABLE `repartir`
  ADD PRIMARY KEY (`NUMAMIS`,`NUMCOMISSION`),
  ADD KEY `I_FK_REPARTIR_AMIS` (`NUMAMIS`),
  ADD KEY `I_FK_REPARTIR_COMISSION` (`NUMCOMISSION`),
  ADD KEY `I_FK_REPARTIR_FONCTION` (`NUMFONCTION`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `amis`
--
ALTER TABLE `amis`
  MODIFY `NUMAMIS` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
