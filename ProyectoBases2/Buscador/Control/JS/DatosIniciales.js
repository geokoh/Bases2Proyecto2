



//Enseña el buscador, oculta otros modulos
function datosBuscador(){

	document.getElementById('datosBuscador').style.display = 'block';
	document.getElementById('datosContador').style.display = 'none';
	document.getElementById('datosSitio').style.display = 'none';

}

//Enseña el contador general, oculta otros modulos
function datosContador(){

	document.getElementById('datosContador').style.display = 'block';
	document.getElementById('datosBuscador').style.display = 'none';
	document.getElementById('datosSitio').style.display = 'none';

}

//Enseña el contador por sitio, oculta otros modulos
function datosSitio(){

	document.getElementById('datosSitio').style.display = 'block';
	document.getElementById('datosBuscador').style.display = 'none';
	document.getElementById('datosContador').style.display = 'none';
}

// Funcion que realiza la busqueda segun lo digitado
// Si lo digitado no es nulo procede por medio de Ajax a llamar a la funcion de php
// que busca en la base de datos y los resultados los pasa a llenar busqueda para visualizarlos
function busqueda1(){
	var buscar = $('#busquedatext').val();
	if(buscar == ""){
		alert("Favor digitar palabra para buscar");
	}
	else{
		$.ajax({
			type	: 'POST',
			data	: {buscar:buscar},
			url 	: "Control/Consultas/busqueda.php",
			success : function(result) {
				setTimeout(
					function(){ 
						llenarbusqueda(result);
				}, 1000)
			
			}

		})
                
	}

}

// Funcion para visualizar los resultados en la pagina web
// Crea un div por cada resultado de la division del string respuesta
// y va insertando la informacion de este en la pagina
function llenarbusqueda(respuesta){
	$('#resultados1').empty();
	if(respuesta != ''){
		var resultados = respuesta.split('###');
		for (var i = 0; i < resultados.length-1; i++) {
			var datos = resultados[i].split('***');
			var node = document.createElement("div");
			node.setAttribute("class", "CursosGeneral2");
			var link = document.createElement("a");
			var textnodelink = document.createTextNode(datos[2]);
			link.href = datos[2];
			link.appendChild(textnodelink);
			node.appendChild(link);
			linebreak = document.createElement("br");
			link.appendChild(linebreak);
			var palabras = "Total de Palabras: " + datos[0];
			var pnode = document.createElement("p");
			var textnode = document.createTextNode(palabras);
			pnode.appendChild(textnode);
			node.appendChild(pnode);
			$('#resultados1').append(node);
		}
	}
	else{
		alert("No se encontraron resultados");
	}

}
// Funcion que busca el conteo total de palabras
// procede por medio de Ajax a llamar a la funcion de php
// que busca en la base de datos y los resultados los pasa a llamarConteo para visualizarlos
function contador(){
	$.ajax({
		type	: 'POST',
		url 	: "Control/Consultas/contador.php",
		success : function(result) {
			setTimeout(
				function(){ 
					llamarConteo(result);
			}, 1000)
		
		}

	})
}

// Funcion para visualizar los resultados en la pagina web
// Crea un div por cada resultado de la division del string respuesta
// y va insertando la informacion de este en la pagina
function llamarConteo(respuesta){
	$('#resultados2').empty();
	var resultados = respuesta.split('###');
	for (var i = 0; i < resultados.length-1; i++) {
		var datos = resultados[i].split('***');
		var node = document.createElement("div");
		node.setAttribute("class", "CursosGeneral2");
		var palabras = "Palabra: " + datos[0] + " Total: " + datos[1];
		var pnode = document.createElement("p");
		var textnode = document.createTextNode(palabras);
		pnode.appendChild(textnode);
		node.appendChild(pnode);
		$('#resultados2').append(node);
	}
}

// Funcion que busca el conteo total de palabras por sitio
// procede por medio de Ajax a llamar a la funcion de php
// que busca en la base de datos y los resultados los pasa a llamarconteositio para visualizarlos
function conteoporsitio(){

	$.ajax({
		type	: 'POST',
		url 	: "Control/Consultas/contarsitio.php",
		success : function(result) {
			setTimeout(
				function(){ 
					llenarconteositio(result);
			}, 1000)
		
		}

	})

}

// Funcion para visualizar los resultados en la pagina web
// Crea un div por cada resultado de la division del string respuesta
// y va insertando la informacion de este en la pagina
function llenarconteositio(respuesta){
		$('#resultados3').empty();
		var resultados = respuesta.split('###');
		for (var i = 0; i < resultados.length-1; i++) {
			var datos = resultados[i].split('***');
			var node = document.createElement("div");
			node.setAttribute("class", "CursosGeneral2");
			var link = document.createElement("a");
			var textnodelink = document.createTextNode(datos[2]);
			link.href = datos[2];
			link.appendChild(textnodelink);
			node.appendChild(link);
			linebreak = document.createElement("br");
			link.appendChild(linebreak);
			var palabras = "Palabra: " + datos[0] + " Total: " + datos[1];
			var pnode = document.createElement("p");
			var textnode = document.createTextNode(palabras);
			pnode.appendChild(textnode);
			node.appendChild(pnode);
			$('#resultados3').append(node);
		}
}

// Funcion que llama el webcrawler para que se ejecute, si se crea el archivo de json alerta
// un mensaje de good
function Crawler(){
	$.ajax({
		type	: 'POST',
		url 	: "WebCrawler/webcrawler.php",
		success : function(result) {
			setTimeout(
				function(){ 
					alert(result);
			}, 1000)
		
		}

	})

}

