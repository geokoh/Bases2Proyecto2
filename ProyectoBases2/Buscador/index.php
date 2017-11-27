<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link   rel="stylesheet"       href="View/CSS/Estilos.css"/>
	<script type="text/javascript" src="Control/JS/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="Control/JS/DatosIniciales.js"></script>
	<title>Buscador</title>
</head>
<body>
	<!-- Define el cuerpo total de la página -->
	<div id="cuerpoDePagina">
		


		<!-- Botones iniciales las categorias -->
		<div id="botoneraInicial">
			<input type="button" value="Crawler"                  onclick="Crawler()"></input>
			<input type="button" value="Correr Jobs"                  onclick="jobs()"></input>
			<input type="button" value="Buscador"                  onclick="datosBuscador()"></input>
			<input type="button" value="Contador de Palabras General"                    onclick="datosContador()"></input>
			<input type="button" value="Contador de Palabras por Sitio"  onclick="datosSitio()"></input>	
		
		</div>

		<!-- Seccion del Buscador -->
		<div id="datosBuscador" class="CursosGeneral">
			<p id="titulo">Buscador</p>
			<div id="cuadroDatosBuscador">
				<input type="text" name="busquedatext" id="busquedatext" class="busqueda"><br>
				<input type="button" value="Realizar Busqueda" id="botonbusqueda" onclick= "busqueda1()"></input>
			</div>
			<div id="resultados1">
			</div> 
		</div>

		<!-- Seccion de busqueda de Palabras totales -->
		<div id="datosContador" class="CursosGeneral">
			<p id="titulo">Conteo de Palabras General</p>
			<div id="cuadroDatosContador">
				<input type="button" value="Realizar Conteo General" id="botoncontador" onclick= "contador()"></input>
			</div>
			<div id="resultados2">
			</div> 
		</div>

		<!-- Seccion de busqueda de Palabras por sitio -->
		<div id="datosSitio" class="CursosGeneral">
			<p id="titulo">Contador de Palabras por Sitio</p>
			<div id="cuadroDatosSitio">
				<input type="button" value="Realizar Conteo por sitio" id="botonbusqueda3" onclick= "conteoporsitio()"></input>
			</div>
			<div id="resultados3">
			</div> 
		</div>

		

		
	</div>

</body>
</html>