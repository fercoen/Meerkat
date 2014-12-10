<?php
	$page = isset($_POST['page']) ? intval($_POST['page']) : 1;
	$rows = isset($_POST['rows']) ? intval($_POST['rows']) : 10;
	$offset = ($page-1)*$rows;
	$result = array();

	include '../../include/conectar.php';
	
	$rs = mysql_query("select count(*) from activos_fijos");
	$row = mysql_fetch_row($rs);
	$result["total"] = $row[0];
	$rs = mysql_query("SELECT af.cod_af, Nombre_af, af.fechacompra_af, af.cod_estado, e.desc_estado, af.costo_af, af.garantia_af, af.nroserie_af, af.hardware_af, af.cod_categ, c.desc_categ, af.cod_prov, p.nombre_prov FROM activos_fijos af INNER JOIN estados e ON af.cod_estado = e.cod_estado INNER JOIN categorias c ON af.cod_categ = c.cod_categ INNER JOIN proveedores p ON af.cod_prov = p.cod_prov ORDER BY 4, 2, 1 LIMIT $offset,$rows");
	
	$items = array();
	while($row = mysql_fetch_object($rs)){
		array_push($items, $row);
	}
	$result["rows"] = $items;

	echo json_encode($result);

?>
