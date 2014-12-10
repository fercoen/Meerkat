<?php
$link = mysql_connect('localhost', 'meerkat', 'm33rk4t');
if (!$link) {
    die('No se puede conectar a la base de datos: ' . mysql_error());
}
mysql_select_db("meerkat_db",$link);
?>

