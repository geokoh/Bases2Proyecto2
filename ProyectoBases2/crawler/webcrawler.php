<?php


// punto de inicio del crawler
$start = "test.html";


//variables globales, arreglos para las paginas que se recorren y el data donde se guarda la informacion
$already_crawled = array();
$data = array();
$crawling = array();

//funcion para sacar el texto de la pagina  web
function getWebsiteText($dom) {
	$text= '';
	$prev= '';
	// recorre los elementos HTML del sitio
	foreach ($dom->getElementsByTagName("*") as $node){		
		//ignora los tags de estilo
		if($node->tagName === 'style'){
			continue;
		}	
		//otros tags que ignorar a menos que tengan solo un hijo y no esten vacios
		else if(($node->tagName === 'html')||($node->tagName === 'head')||($node->tagName === 'body')||($node->tagName === 'script')||($node->tagName === 'div')||($node->tagName === 'form')||($node->tagName === 'ul')||($node->tagName === 'nav')||($node->tagName === 'center')||($node->tagName === 'ol')) {
			$child = $dom->childNodes->item(0);
			$length= $dom->childNodes->length;
			if(($length == 1)&&(!($node->textContent === ''))){
				if($prev === $node->textContent) {
					continue;
				}
				else{
					//agrega al texto de resultado el Tag y Texto del sitio
					$text .= '{"Tag": ';
					$text .= '"'.$node->tagName.'"';			
					$text .= ',"Text": ';
					$text .= '"'.$node->textContent.'"';
					$text .= '},';
					$prev = '';
					$prev .= $node->textContent;

				}
			}
		}
		// Si no esta vacio el nodo actual
		else if(!($node->textContent === '')){
			if($prev === $node->textContent) {
				continue;
			}
			else{
				//agrega al texto de resultado el Tag y Texto del sitio
				$text .= '{"Tag": ';
				$text .= '"'.$node->tagName.'"';			
				$text .= ',"Text": ';
				$text .= '"'.$node->textContent.'"';
				$text .= '},';
				$prev = '';
				$prev .= $node->textContent;

			}
			
		}

	}
	//remueve la ultima coma del string para que sea valido y regresa el resultado
	$result = substr($text , 0, -1);
	return $result;

}

// Funcion para obtener los datos de cada sitio web
function get_details($url) {
	// opciones para modificar el User Agent que se usa
	$options = array('http'=>array('method'=>"GET", 'headers'=>"User-Agent: howBot/0.1\n"));
	$context = stream_context_create($options);
	$doc = new DOMDocument();
	// Se carga los contenidos del HTML a la variable $dom
	@$doc->loadHTML(@file_get_contents($url, false, $context));

	// Busca elemento con el nombre de Titulo y lo guarda en una variable
	$title = $doc->getElementsByTagName("title");
	$title = $title->item(0)->nodeValue;
	
	//llama a la funcion getWebsiteText para sacar el contenido del sitio web
	$innerHTML = getWebsiteText($doc);
	


	// Retorna en formato de Json el titulo, contenido y URL del sitio web
	return '{ "Title": "'.str_replace("\n", "", $title).'", "Content": ['.str_replace("\n", "", $innerHTML).'], "URL": "'.$url.'"},';
}

// Funcion para recorrer las paginas, recibe una url inicial y un numero que es la profundidad
function follow_links($url, $depth) {
	// Variables Globales
	global $already_crawled;
	global $crawling;
	global $data;

	// Si la profundidad es 0 regresa
	if($depth == 0) {
		return;
	}
	// opciones para modificar el User Agent que se usa
	$options = array('http'=>array('method'=>"GET", 'headers'=>"User-Agent: howBot/0.1\n"));
	$context = stream_context_create($options);
	$doc = new DOMDocument();

	// Se carga los contenidos del HTML a la variable $dom
	@$doc->loadHTML(@file_get_contents($url, false, $context));
	// Consigue todos los links que hay en la pagina
	$linklist = $doc->getElementsByTagName("a");
	
	//Ciclo para revisar si se tienen urls relativas para poder recorrerlas
	foreach ($linklist as $link) {
		$l =  $link->getAttribute("href");
		if (substr($l, 0, 1) == "/" && substr($l, 0, 2) != "//") {
			$l = parse_url($url)["scheme"]."://".parse_url($url)["host"].$l;
		} else if (substr($l, 0, 2) == "//") {
			$l = parse_url($url)["scheme"].":".$l;
		} else if (substr($l, 0, 2) == "./") {
			$l = parse_url($url)["scheme"]."://".parse_url($url)["host"].dirname(parse_url($url)["path"]).substr($l, 1);
		} else if (substr($l, 0, 1) == "#") {
			$l = parse_url($url)["scheme"]."://".parse_url($url)["host"].parse_url($url)["path"].$l;
		} else if (substr($l, 0, 3) == "../") {
			$l = parse_url($url)["scheme"]."://".parse_url($url)["host"]."/".$l;
		} else if (substr($l, 0, 11) == "javascript:") {
			continue;
		} else if (substr($l, 0, 5) != "https" && substr($l, 0, 4) != "http") {
			$l = parse_url($url)["scheme"]."://".parse_url($url)["host"]."/".$l;
		}
		
		// si no se ha recorrido se procede a recorrerlo
		if (!in_array($l, $already_crawled)) {
			// se agrega a los arrays de recorrido
				$already_crawled[] = $l;
				$crawling[] = $l;
				// se sacan los datos de la pagina con la funcion get details
				$text = get_details($l)."\n";
				// se agregan los datos el arreglo global
				$data[] = $text;
		}
	}
	
	// se elimina el primer arreglo de la lista para evitar recorrer infinitamente el mismo arreglo
	array_shift($crawling);
	// se le resta uno a la profundidad
	$depth -= 1;
	
	// luego se llama recursivamente con todos los links encontrados
	foreach ($crawling as $site) {
		follow_links($site, $depth);
	}
}

//funcion principal que recibe un URL y una profundidad
function mainFunction($start, $depth){
	//varial global donde se guardan los resultados
	global $data;
	// se llama a follow links para recorrer los links
	follow_links($start, $depth);
	// se codifica el arreglo como Json
	$print = json_encode($data);	
	// se salva a un archivo
	$myfile = fopen("newfile.json", "w") or die("Unable to open file!");
	fwrite($myfile, $print);
}

// se inicia el recorrido
mainFunction($start, 2);