<?php 
include_once 'bootstrap.css.php';

require('include/class_pdo_amis.php');
$db = new PdoGsb;

$cotisation = $db->query('SELECT * FROM parametre WHERE NUMPARAMETRE = ?', [1])->fetch();


if($_POST) {
    if($_POST['cot'] AND !empty($_POST['cot'])) {

        $cot = htmlspecialchars($_POST['cot']);

        $req = $db->query('UPDATE parametre SET MONTANTCOTISATIONANUELLE = ? WHERE NUMPARAMETRE = ?', [$cot, 1]);
        header('Location: ?page=cotisation_annuelle');

    }
}


?>

<div class="container" style="padding-top: 2rem;">

<h1>Saisie contrôlée de la cotisation annuelle</h1>
<p>Prévoir un formulaire permettant la saisie contrôlée de la cotisation annuelle</p>
<hr>

<form method="post">
    <div class="form-group">
        <input name="cot" class="form-control form-control-lg" type="text" placeholder="Saisis cotisation annuelle" value="<?= $cotisation->MONTANTCOTISATIONANUELLE ?>" required>
        <br>
        <button type="submit" class="btn btn-primary">Modifier la cotisation annuelle</button>
    </div>  
</form>

</div>
