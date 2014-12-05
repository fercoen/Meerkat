<?php
require_once('validacion.php'); 
require_once("include/header.php");
require_once("menu.php");?>
	<br /> <br /> <br />
	<table id="dg" title="Departamentos" class="easyui-datagrid" style="width:100%;"
			url="modules/categorias/get_categs.php"
			toolbar="#toolbar" pagination="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="desc_categ" width="50">Descripcion</th>
				<th field="desc_tipo" width="50">Tipo de Categoria</th>
				<th field="ptopedido_categ" width="50">Pto. Pedido</th>
				<th field="vidautil_categ" width="50">Vida Util</th>
				<th field="desc_estado" width="50">Estado</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newArea()">Nueva Categoría</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editArea()">Editar/Deshabilitar Categoría</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:320px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">Informacion de la Categría</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem" hidden>
				<label>Codigo:</label>			
				<input name="cod_categ" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Descripcion:</label>
				<input name="desc_categ" class="easyui-textbox" required="true">
			</div>
			
			<div class="fitem">
				<label>Tipo de Categoría:</label>
				<input class="easyui-combobox" name="tipo" id="tipo"
					data-options="
						url:'modules/tipos_categ/get_tipos_categ_hab.php',
						valueField:'cod_tipo',
						textField:'desc_tipo',
						panelHeight:'auto',
						onSelect:function(row){
								habilitar(row)}
				" required="true">
			</div>
						
		<div class="fitem">
				<label>Punto de Pedido:</label>
				<input id="ptopedido_categ" name="ptopedido_categ" class="easyui-textbox" required="true" readonly="true">
			</div>
		
		<div class="fitem">
			<label>Vida útil:</label>
			<input id="vidautil_categ" name="vidautil_categ" class="easyui-textbox" required="true" readonly="true">
		</div>
					
		<div class="fitem">
				<label>Estado:</label>
				<input class="easyui-combobox" name="estado"
					data-options="
						url:'modules/estados/get_estados.php',
						valueField:'cod_estado',
						textField:'desc_estado',
						panelHeight:'auto'
				" required="true">
			</div>	
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveArea();" style="width:90px">Guardar</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancelar</a>
	</div>
	<script type="text/javascript">
		var url;
			
		function newArea(){
			$('#dlg').dialog('open').dialog('setTitle','Nueva Categoría');
			$('#fm').form('clear');
			url = 'modules/categorias/save_categ.php';
		}
		function editArea(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','Editar Categoría');
                row.estado = row.cod_estado;
				row.tipo = row.cod_tipo;
				$('#fm').form('load',row);
				url = 'modules/categorias/update_categ.php';
			}
		}
		
		function habilitar(row){
			if(row.cod_tipo == 2){
				$('#vidautil_categ').textbox('readonly',true);
				$('#vidautil_categ').textbox('setValue','0');
				$('#ptopedido_categ').textbox('readonly',false);
				$('#ptopedido_categ').textbox('clear');
			}else { 
				$('#vidautil_categ').textbox('readonly',false);
				$('#vidautil_categ').textbox('clear');			
				$('#ptopedido_categ').textbox('readonly',true);
				$('#ptopedido_categ').textbox('setValue','0');
			}
		}
		
		function saveArea(){
            try{
			$('#fm').form('submit',{
				url: url,
                onSubmit: function(){
					//return $(this).form('validate');
				},
				success: function(result){
					if (result.errorMsg){
						$.messager.show({
							title: 'Error',
							msg: result.errorMsg
						});
					} else {
						$('#dlg').dialog('close');		// close the dialog
						$('#dg').datagrid('reload');	// reload the user data
					}
				}
            });
            }catch(e){console.log(e.message())}
		}
	
	</script>
	<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
	</style>
<?php
require_once("include/footer.php");
?>
