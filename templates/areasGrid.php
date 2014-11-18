<div class="bar">
    <a id="newArea" class="button" href="javascript:void(0);">Nueva Area</a>
</div>
<table>
    <thead>
        <tr>
			<th>Id</th>
            <th>Descripción</th>
            <th>Responsable</th>
			<th>Estado</th>
            <th>Editar</th>
            <th>Borrar</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($view->areas as $area):  // uso la otra sintaxis de php para templates ?>
            <tr>
                <td><?php echo $area['cod_area'];?></td>
                <td><?php echo $area['des_area'];?></td>
                <td><?php echo $area['cod_estado'];?></td>
                <td><?php echo $area['cod_user'];?></td>
                <td><a class="edit" href="javascript:void(0);" data-id="<?php echo $area['cod_area'];?>">Editar</a></td>
                <td><a class="delete" href="javascript:void(0);" data-id="<?php echo $area['cod_area'];?>">Borrar</a></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
