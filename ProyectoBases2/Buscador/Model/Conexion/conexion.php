<?php
	// Crea la conexion con la base de datos
	function conexion(){
		$server = "localhost";
		$user = "basesUser";
		$password = "1234";
		$dataBase = "bases2";
		$conection = mysqli_connect($server, $user, $password);
		if($conection){
			mysqli_select_db($conection, $dataBase);
			return $conection;
		}
	}

	// Ejecta un query
	function ejecutarQuery($query){
		$conect = conexion();
		return $conect->query($query);
	}

	// Retorna los resultados
	function fetch($result){
		return mysqli_fetch_assoc($result);
	}
?>