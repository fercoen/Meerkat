<?php

$desc_depto = htmlspecialchars($_REQUEST['desc_depto']);
$cod_area = htmlspecialchars($_REQUEST['area']);
$cod_estado = htmlspecialchars($_REQUEST['estado']);
$cod_user = htmlspecialchars($_REQUEST['user']);

include '../../include/conectar.php';

$sql = "insert into departamentos(desc_depto,cod_area,cod_estado,cod_user) values('$desc_depto','$cod_area','1','$cod_user')";

$result = @mysql_query($sql);
if ($result){
	echo json_encode(array(
		'id' => mysql_insert_id(),
		'desc_depto' => $desc_depto,
		'cod_area' => $cod_area,
		'cod_estado' => $cod_estado,
		'cod_user' => $cod_user,
	));
} else {
	echo json_encode(array('errorMsg'=>'Fallo al agregar area.'));
}
?>
