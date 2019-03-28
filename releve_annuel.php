<?php

include_once 'bootstrap.css.php';

require('include/class_pdo_amis.php');
$db = new PdoGsb;
$amis = $db->query('SELECT * FROM amis')->fetchAll();

?>


<div class="container" style="padding-top: 2rem;">

<h1>Edition du relevé annuel</h1>
<p>Cette tâche doit permettre l’édition en PDF du relevé annuel
de chaque participant. Ce relevé annuel reprend la cotisation annuelle ainsi que le détail des
dîners. Il faut prévoir bien entendu, une page par membre du club.
</p>
<hr>

<?php
foreach ($amis as $ami) {
    ?>
        <div class="card">
            <div class="card-body">
            <?= $ami->NUMAMIS ?> // <b><?= $ami->NOMAMIS . " " . $ami->PRENOMAMIS ?></b> - <?= $ami->EMAILAMIS ?> - <a href="pdf.php?id=<?= $ami->NUMAMIS ?>" target="_blank">Télécharger le relevé annuel de cet ami</a>
            </div>
        </div>
        <br>
<?php

}
?>
</div>

