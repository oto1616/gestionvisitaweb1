<?php session_start();
	try {
		$error = '';
		$enviar='';
		$enviado='';

		
		$conexion = new PDO('mysql:host=localhost;dbname=gestionvisita_db', 'root','');
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$nombreusuario = $_POST['usuario'];

			$password = isset($_POST['password']) ? $_POST['password'] : "";
			$clavehash=hash("SHA256", $password);

     $sql = $conexion->prepare('SELECT * FROM usuarios WHERE usuario = "'.$nombreusuario.'" AND password = "'.$clavehash.'"');
		// print_r($sql);
     $sql->execute(array(':usuario'=>$nombreusuario,
     	                  ':password'=>$clavehash));
											//	print_r($sql);
											//	print $clavehash;
     $resultado = $sql->fetch();

//die();
        if ($resultado != false) {
				//	print_r($resultado);
				//	die();
	      $_SESSION['usuario'] = $nombreusuario;
				$_SESSION['id_usuario'] = $resultado['id_usuario'];
				print_r($_SESSION);
				$enviar .=  '<center> Bienvenido <br>'.$resultado['usuario']. '</center> <br>';
	      $enviar .= '<meta http-equiv="refresh" content="4;url=../../index">';
	     

   } else {
   $error .= '<li class="alert alert-danger"> Los Datos ingresados son Incorrecto </li>';

}

		}
	} catch (Exception $e) {
		echo "Error  de conexion ala base de datos.";
	}



require 'login.view.php';
 ?>
