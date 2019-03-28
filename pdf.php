<?php
require_once 'vendor/dompdf/autoload.inc.php';
use Dompdf\Dompdf;
require('include/class_pdo_amis.php');
$id = $_GET["id"];
$db = new PdoGsb;
$ami = $db->query('SELECT * FROM amis WHERE NUMAMIS = ?', [$id])->fetch();
$fileUrl = "http://localhost/test%20ppe/releve_annuel_ami_pdf.php?id=".$id;

$dompdf = new Dompdf();

$html = file_get_contents($fileUrl);
$dompdf->loadHtml($html);

// Render the HTML as PDF
$dompdf->render();

// Output the generated PDF (1 = download and 0 = preview)
$dompdf->stream("Relevé annuel de " . $ami->NOMAMIS . " " . $ami->PRENOMAMIS,array("Attachment" => 0));