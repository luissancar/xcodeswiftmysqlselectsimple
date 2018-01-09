<?php
 
// Create connection
$con=mysqli_connect("localhost","root","clave","xcode");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Error conexión: " . mysqli_connect_error();
}
 
/
$sql = "SELECT * FROM tabla";
 

if ($result = mysqli_query($con, $sql))
{
	// creamos arrays
	$resultArray = array();
	$tempArray = array();
 
	// Recorremos la tbla
	while($row = $result->fetch_object())
	{
		// Añadimos cada fila a la array
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}
 
	//Codificamos la array a JSON 
	echo json_encode($resultArray);
}
 

mysqli_close($con);
?>