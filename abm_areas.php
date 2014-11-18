<?php
require_once('validacion.php'); 
require_once("include/header.php");
require_once("modules/areas.php");
require_once("modules/conexion.php");
require_once("modules/squery.php");
require_once("modules/funciones.php");

// si no tiene ninguna action por post que abra el listado
if(!isset($_POST['action'])){
    $action = 'index';
    require_once("menu.php");
}else{
    $action = $_POST['action'];
}

$view= new stdClass(); 			// creo una clase standard para contener la vista
$view->disableLayout=false;		// marca si usa o no el layout , si no lo usa imprime directamente el template

switch ($action)
{
    case 'index':
        $view->areas=areas::getAreas(); // tree todos las areas
        $view->contentTemplate="templates/areasGrid.php"; // seteo el template que se va a mostrar
        break;
    case 'saveArea':
        // limpio todos los valores antes de guardarlos
        // por ls dudas venga algo raro
		$cod=cleanString($_POST['cod']);
        $desc=cleanString($_POST['desc']);
        $responsable=cleanString($_POST['responsable']);
        $estado=cleanString($_POST['estado']);
        $area=new areas($id);
        $area->setCod($cod);
		$area->setDesc($desc);
        $area->setEstado($estado);
		$area->setResponsable($responsable);
        $cliente->save();
        break;
    case 'newArea':
        $view->area=new areas();
        $view->label='Nueva Area';
        $view->disableLayout=true;
        $view->contentTemplate="templates/areasForm.php"; // seteo el template que se va a mostrar
        break;
    case 'editArea':
        $editId=intval($_POST['cod']);
        $view->label='Editar Area';
        $view->client=new areas($editId);
        $view->disableLayout=true;
        $view->contentTemplate="templates/areasForm.php"; // seteo el template que se va a mostrar
        break;
    case 'deleteArea':
        $id=intval($_POST['cod']);
        $client=new areas($cod);
        $client->delete();
        die; // no quiero mostrar nada cuando borra , solo devuelve el control.
        break;
    default :
}

// si esta deshabilitado el layout solo imprime el template
if ($view->disableLayout==true)
{include_once($view->contentTemplate);}
else
{include_once('templates/layout.php');} // el layout incluye el template adentro


?>
          
<?php
require_once("include/footer.php");
?>
