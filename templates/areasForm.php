<?php error_reporting(E_ALL); ?>

<h2><?php echo $view->label; ?></h2>
<form name ="area" id="area" method="POST" action="abm_areas.php">
    <input type="hidden" name="cod" id="cod" value="<?php echo $view->area->getCod(); ?>">
    <div>
        <label>Descripción</label>
        <input type="text" name="desc" id="desc" value = "<?php echo $view->area->getDesc(); ?>">
    </div>
    <div>
        <label>Responsable</label>
        <input type="text" name="responsable" id="responsable" value = "<?php echo $view->area->getResponsable(); ?>">
    </div>
    <div>
        <label>Estado</label>
        <input type="text" name="estado" id="estado" value = "<?php echo $view->area->getEstado(); ?>">
    </div>
    <div class="buttonsBar">
        <input id="cancel" type="button" value ="Cancelar" />
        <input id="submit" type="submit" name="submit" value ="Guardar" />
    </div>
</form>
