<?php
class areas {
		 var  $cod_area;
		 var  $des_area;
		 var  $cod_estado;
		 var  $rep_user;
	 
	function getAreas() 
		{
			$obj_area=new sQuery();
			$obj_area->executeQuery("select * from areas"); // ejecuta la consulta para traer las areas

			return $obj_area->fetchAll(); // retorna todos las areas
		}
		
	function Area($cod=0) // declara el constructor, si trae el codigo de area lo busca , si no, trae todos las areas
	{
		if ($cod!=0)
		{
			$obj_cliente=new sQuery();
			$result=$obj_cliente->executeQuery("select * from areas where id = $cod"); // ejecuta la consulta para traer al area 
			$row=mysql_fetch_array($result);
			$this->cod=$row['cod_area'];
			$this->desc=$row['des_area'];
			$this->responsable=$row['cod_user'];
			$this->estado=$row['cod_estado'];
		}
	}
		// metodos que devuelven valores
	function getCod()
	 { return $this->cod;}
	function getDesc()
	 { return $this->desc;}
	function getResponsable()
	 { return $this->responsable;}
	function getEstado()
	 { return $this->estado;}
	 
		// metodos que setean los valores
	function setDesc($val)
	 { $this->desc=$val;}
	function setResponsable($val)
	 {  $this->responsable=$val;}
	function setEstado($val)
	 {  $this->estado=$val;}
	function setCod($val)
	 { $this->cod=$val;}

    function save()
    {
        if($this->id)
        {$this->updateArea();}
        else
        {$this->insertArea();}
    }
	private function updateArea()	// actualiza el area cargada en los atributos
	{
			$obj_area=new sQuery();
			$query="update clientes set des_area='$this->desc', cod_user='$this->responsable',cod_estado='$this->estado' where cod_area = $this->cod";
			$obj_area->executeQuery($query); // ejecuta la consulta para traer al area 
			return $obj_area->getAffect(); // retorna todos los registros afectados
	
	}
	private function insertArea()	// inserta el area cargada en los atributos
	{
			$obj_area=new sQuery();
			$query="insert into areas( des_area, cod_user, cod_estado)values('$this->desc', '$this->responsable','$this->estado')";
			
			$obj_area->executeQuery($query); // ejecuta la consulta para traer al area 
			return $obj_area->getAffect(); // retorna todos los registros afectados
	
	}	
	function delete()	// elimina el cliente
	{
			$obj_area=new sQuery();
			$query="update clientes cod_estado='$this->estado' where cod_area = $this->cod";
			$obj_area->executeQuery($query); // ejecuta la consulta para  borrar el cliente
			return $obj_area->getAffect(); // retorna todos los registros afectados
	
	}	
	

};
?>
