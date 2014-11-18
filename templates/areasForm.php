<h2><?php echo $view->label ?></h2>
<form name ="area" id="area" method="POST" action="abm_areas.php">
    <input type="hidden" name="cod" id="cod" value="<?php print $view->areas->getCod() ?>">
    <div>
        <label>Descripción</label>
        <input type="text" name="desc" id="desc" value = "<?php print $view->areas->getDesc() ?>">
    </div>
    <div>
        <label>Responsable</label>
        <input type="text" name="responsable" id="responsable" value = "<?php print $view->areas->getResponsable() ?>">
    </div>
    <div>
        <label>Estado</label>
        <input type="text" name="estado" id="estado" value = "<?php print $view->areas->getEstado() ?>">
    </div>
    <div class="buttonsBar">
        <input id="cancel" type="button" value ="Cancelar" />
        <input id="submit" type="submit" name="submit" value ="Guardar" />
    </div>
</form>
