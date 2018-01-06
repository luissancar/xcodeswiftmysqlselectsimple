<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');
	
	

$servername = "localhost";
$username = "root";
$password = "clave";
$dbname = "xcode";

 $cod=$_POST["a"];
 $cosa = $_POST["b"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql =  "INSERT INTO tabla (`cod`, `cosa`) VALUES ('$cod','$cosa');";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>