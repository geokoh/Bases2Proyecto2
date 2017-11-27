<?php
	//funcion de conteo total de palabras
	// Saca el total de palabras de la Base de datos
	// convierte los resultados en un string
	require_once('../../Model/Conexion/conexion.php');
	$con = conexion();
	$resultado = '';
	$query = "SELECT Palabra, Cantidad from palabra_contador";
	$res = ejecutarQuery($query);
	while($data = fetch($res)){
		
		$resultado .= $data["Palabra"].'***'.$data["Cantidad"].'###';
	}
	echo $resultado;

?>