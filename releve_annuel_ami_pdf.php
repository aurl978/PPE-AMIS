<?php 
include_once 'bootstrap.css.php';

$id = $_GET["id"];

require('include/class_pdo_amis.php');
$db = new PdoGsb;
$ami = $db->query('SELECT * FROM amis WHERE NUMAMIS = ?', [$id])->fetch();

$cotisation = $db->query('SELECT * FROM parametre WHERE NUMPARAMETRE = ?', [1])->fetch();

?>


<h1>Relevé annuel de <?= $ami->NOMAMIS . ' ' . $ami->PRENOMAMIS ?></h1>
<h6>Montant de la cotisation annuel : <?= $cotisation->MONTANTCOTISATIONANUELLE ?>€</h6>
<hr>
<?php

$diners = $db->query('SELECT * FROM manger m INNER JOIN diner d ON d.DATEDINER = m.DATEDINER WHERE m.NUMAMIS = ?', [$ami->NUMAMIS])->fetchAll();

$somme_total = $cotisation->MONTANTCOTISATIONANUELLE;

foreach ($diners as $diner) {
    echo $ami->PRENOMAMIS . " a fait un dîner le " . $diner->DATEDINER . " à " . $diner->LIEUDINER . " avec " . $diner->NOMBREINVITEE . " invité(s)" . " pour un total de " . $diner->PRIXDINER . "€";
    $somme_total += $diner->PRIXDINER;
}

?>
<hr>
<p>Total net à payer: <b><?= $somme_total ?>€</b></p>
