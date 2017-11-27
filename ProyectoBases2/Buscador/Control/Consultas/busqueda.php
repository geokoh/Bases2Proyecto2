<?php
	//Funcion para hacer busqueda de palabras
	//recibe lo digitado en el buscador y lo separa si tiene espacios para buscar las diferentes palabras
	//Puede buscar un maximo de 4 palabras
	// las compara con las encontradas en la base de datos
	require_once('../../Model/Conexion/conexion.php');
	$con = conexion();
	$buscar = $_POST['buscar'];
	$resultado = '';
	$palabras = explode(" ", $buscar);
	$query = '';
	if(count($palabras)== 1) {
		$palabra1 = '%'.$palabras[0].'%';
		$query = "SELECT count(*), palabra_contador.Palabra as palabra, palabra_url.Link  as link from palabra_contador inner join palabra_url on (palabra_contador.Palabra LIKE '$palabra1') and palabra_url.PalabraID = palabra_contador.idPalabra_Contador group by palabra_url.Link order by count(*) desc;";
		
	}
	else if(count($palabras)== 2) {
		$palabra1 = '%'.$palabras[0].'%';
		$palabra2 = '%'.$palabras[1].'%';
		$query = "SELECT count(*), palabra_contador.Palabra as palabra, palabra_url.Link  as link from palabra_contador inner join palabra_url on (palabra_contador.Palabra LIKE '$palabra1' or palabra_contador.Palabra LIKE '$palabra2') and palabra_url.PalabraID = palabra_contador.idPalabra_Contador group by palabra_url.Link order by count(*) desc;";		
	}
	else if(count($palabras)== 3) {
		$palabra1 = '%'.$palabras[0].'%';
		$palabra2 = '%'.$palabras[1].'%';
		$palabra3 = '%'.$palabras[2].'%';
		$query = "SELECT count(*), palabra_contador.Palabra as palabra, palabra_url.Link  as link from palabra_contador inner join palabra_url on (palabra_contador.Palabra LIKE '$palabra1' or palabra_contador.Palabra LIKE '$palabra2' or palabra_contador.Palabra LIKE '$palabra3') and palabra_url.PalabraID = palabra_contador.idPalabra_Contador group by palabra_url.Link order by count(*) desc;";
	}
	else if(count($palabras)>= 4) {
		$palabra1 = '%'.$palabras[0].'%';
		$palabra2 = '%'.$palabras[1].'%';
		$palabra3 = '%'.$palabras[2].'%';
		$palabra4 = '%'.$palabras[3].'%';
		$query = "SELECT count(*), palabra_contador.Palabra as palabra, palabra_url.Link  as link from palabra_contador inner join palabra_url on (palabra_contador.Palabra LIKE '$palabra1' or palabra_contador.Palabra LIKE '$palabra2' or palabra_contador.Palabra LIKE '$palabra3' or palabra_contador.Palabra LIKE '$palabra4') and palabra_url.PalabraID = palabra_contador.idPalabra_Contador group by palabra_url.Link order by count(*) desc;";
	}
	//ejecuta el query que saco dependiendo de la cantidad de palabras y genera un string
	// con los resultados encontrados
	$res = ejecutarQuery($query);
	while($data = fetch($res)){
		$resultado .= $data["count(*)"].'***'.$data["palabra"].'***'.$data["link"].'###';
	}
	echo $resultado;
?>