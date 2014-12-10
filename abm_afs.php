<?php
require_once('validacion.php'); 
require_once("include/header.php");
require_once("menu.php");?>
	<br /> <br /> <br />
	<table id="dg" title="Actvos Fijos" class="easyui-datagrid" style="width:100%;"
			url="modules/afs/get_afs.php"
			toolbar="#toolbar" pagination="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="cod_af" width="50">Código</th>
				<th field="Nombre_af" width="50">Nombre</th>
				<th field="fechacompra_af" width="50">Fecha Compra</th>
				<th field="cod_categ" width="50">Categoría</th>
				<th field="nombre_prov" width="50">Proveedor</th>
				<th field="costo_af" width="50">Costo</th>
				<th field="desc_estado" width="50">Estado</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newArea()">Nuevo Activo Fijo</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editArea()">Editar Activo Fijo</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-man" plain="true" onclick="cambiarPass()">Ver Detalles</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:375;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">Informacion del Usuario</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem" hidden>
				<label>Codigo:</label>			
				<input name="cod_user" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Login:</label>
				<input name="login_user" class="easyui-textbox" required="true">
			</div>
			
			<div class="fitem">
				<label>Nombre:</label>
				<input name="nombre_user" class="easyui-textbox" required="true">
			</div>
		
			<div class="fitem">
				<label>Telefono:</label>
				<input name="tel_user" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>E-mail:</label>
				<input name="mail_user" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Puesto:</label>
				<input class="easyui-combobox" name="puesto"
					data-options="
						url:'modules/puestos/get_puestos_hab.php',
						valueField:'cod_puesto',
						textField:'desc_puesto',
						panelHeight:'auto'
				" required="true">
			</div>
			
		<div class="fitem">
				<label>Perfil:</label>
				<input class="easyui-combobox" name="perfil"
					data-options="
						url:'modules/perfiles/get_perfiles_hab.php',
						valueField:'cod_perf',
						textField:'nombre_perf',
						panelHeight:'auto'
				" required="true">
			</div>		
			
		<div class="fitem">
				<label>Estado:</label>
				<input class="easyui-combobox" name="estado"
					data-options="
						url:'modules/estados/get_estados_af.php',
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
	
	<div id="dlgPass" class="easyui-dialog" style="width:400px;height:200;padding:10px 20px"
			closed="true" buttons="#dlgPass-buttons">
	
	<div class="ftitle">Cambio de Clave</div>
		<form id="fmPass" method="post" novalidate>
			<div class="fitem" hidden>
				<label>Codigo:</label>			
				<input name="cod_user" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Usuario:</label>
				<input name="nombre_user" class="easyui-textbox" editable="false">
			</div>
			<div class="fitem">
				<label>Clave:</label>
				<input name="pass" type="password" class="easyui-textbox" required="true">
			</div>
		</form>
	</div>
	
	<div id="dlgPass-buttons">
		<a href="#" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="savePass();" style="width:90px">Guardar</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgPass').dialog('close')" style="width:90px">Cancelar</a>
	</div>
	
	<script type="text/javascript">
		var url;
		function newArea(){
			$('#dlg').dialog('open').dialog('setTitle','Nuevo Usuario');
			$('#fm').form('clear');
			url = 'modules/users/save_user.php';
		}
		function editArea(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','Editar Usuario');
				row.puesto = row.cod_puesto;
                row.estado = row.cod_estado;
				row.perfil = row.cod_perf;
				$('#fm').form('load',row);
				url = 'modules/users/update_user.php';
			}
		}
		
		function cambiarPass(){
			var row =$('#dg').datagrid('getSelected');
			if (row){
				$('#dlgPass').dialog('open').dialog('setTitle','Cambiar Password');
				$('#fmPass').form('load',row);
				url = 'modules/users/cambiar_pass.php';
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
		
		function savePass(){
            try{
			$('#fmPass').form('submit',{
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
						$('#dlgPass').dialog('close');		// close the dialog
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
