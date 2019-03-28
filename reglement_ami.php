<?php
require('include/class_pdo_amis.php');
$db = new PdoGsb;

include_once 'bootstrap.css.php';

if ($_POST) {
    if ($_POST['amis'] and !empty($_POST['amis'])) {
        if ($_POST['montant'] and !empty($_POST['montant'])) {

            $montant = explode("-", $_POST['amis']);
            var_dump($montant[1]);
            if ($montant[1] == $_POST['montant']) {
                // script de règlement
                header('Location: ?page=reglement_amis&r=1');

            } else {
                var_dump('err');
                header('Location: ?page=reglement_amis&r=2');
            }

        } else {
            header('Location: ?page=reglement_amis&r=2');
        }
    } else {
        header('Location: ?page=reglement_amis&r=2');
    }
}



?>


<div class="container" style="padding-top: 2rem;">

<?php

if (isset($_GET['r']) and !empty($_GET["r"])) {

    if ($_GET["r"] == 1) {
        ?>
        <div class="alert alert-success" role="alert">
        L'ami a réglé son dû
        </div>
        <?php

    } else if ($_GET["r"] == 2) {
        ?>
        <div class="alert alert-danger" role="alert">
        Une erreur est survenue lors de la validation du formulaire
        </div>
        <?php

    }

}

?>

<h1>Saisie du règlement d’un AMIS</h1>
<p> Cette tâche doit permettre la saisie du montant que doit régler un AMIS. Il fait prévoir la saisie de l’AMIS grâce à une liste avec autocomplétion, puis la saisie contrôlée du montant lui-même. On pourrait prévoir si le montant n’est pas conforme d’envoyer un mail à l’AMIS pour le prévenir de sa distraction.</p>
<hr>

<form method="post">
  <div class="form-group">
    <label for="exampleFormControlSelect2">Sélectionner un ami</label>
    <select name="amis" multiple class="form-control" id="exampleFormControlSelect2" required>
    <?php

    $amis = $db->query('SELECT NUMAMIS, NOMAMIS, PRENOMAMIS FROM amis')->fetchAll();
    $cotisation = $db->query('SELECT * FROM parametre WHERE NUMPARAMETRE = ?', [1])->fetch();
    $somme_total = $cotisation->MONTANTCOTISATIONANUELLE;
    foreach ($amis as $ami) {

        $diners = $db->query('SELECT * FROM manger m INNER JOIN diner d ON d.DATEDINER = m.DATEDINER WHERE m.NUMAMIS = ?', [$ami->NUMAMIS])->fetchAll();
        foreach ($diners as $diner) {
            $somme_total += $diner->PRIXDINER;
        }
        ?>
        <option value="<?= $ami->NUMAMIS ?>-<?= $somme_total ?>"><?= $ami->NOMAMIS . ' ' . $ami->PRENOMAMIS ?> - Doit régler <b><?= $somme_total ?>€</b></option>
    <?php
    $somme_total = $cotisation->MONTANTCOTISATIONANUELLE;
}

?>
    </select>
  </div>

<div class="form-group">
    <label for="exampleFormControlInput1">Montant que doit régler l'ami</label>
    <input name="montant" type="number" class="form-control" id="exampleFormControlInput1" required>
  </div>

  <button type="submit" class="btn btn-primary">Faire régler le montant</button>

</form>


</div>


