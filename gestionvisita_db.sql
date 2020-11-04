
/* INICIO */ 
CREATE TABLE usuarios (
  id_usuario int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombres varchar(150) NOT NULL, 
  apellidos VARCHAR(150) NOT NULL,
  usuario varchar(150) NOT NULL, 
  documento VARCHAR(150) NOT NULL,
  direccion VARCHAR(200) NULL,
  telefono VARCHAR(10) NULL,
  email VARCHAR(30) NULL,
  tipo ENUM('normal','admin') NULL,
  password VARCHAR(150) NOT NULL,
  usuario_creacion INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'FK ID DEL USUARIO QUE INSERTO LA TUPLA',
  fecha_creacion DATETIME NOT NULL COMMENT 'FECHA EN LA QUE SE INSERTO LA TUPLA',
  usuario_modificacion INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'FK ID DEL USUARIO QUE INSERTO LA TUPLA',
  fecha_modificacion DATETIME NULL DEFAULT NULL COMMENT 'FECHA EN LA QUE SE INSERTO LA TUPLA',
  PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO usuarios (id_usuario,nombres,apellidos,usuario,documento,direccion,telefono,email,tipo,password,usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion) 
VALUES
     (1, 'Osbin','Yos','osbin','21175165630101','ZONA 8','40881164','osbinyos@gmail.com','admin','74a86f62d0acd138c70368e4021620b4ff48666865d98580e35c55c3d5e72f8d',1,now(),NULL,NULL);

/*
  PARA FOREING KEY
  nombre tabla actual, primeras letras(3) de la tabla referencia, primeras letras del campo de cada palabra
*/

CREATE TABLE roles (
  id_rol int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL, 
  descripcion TEXT(150) NOT NULL,
  activo boolean DEFAULT 1,
  usuario_creacion INT(11) UNSIGNED  DEFAULT NULL COMMENT 'FK ID DEL USUARIO QUE INSERTO LA TUPLA',
  fecha_creacion DATETIME NOT NULL COMMENT 'FECHA EN LA QUE SE INSERTO LA TUPLA',
  usuario_modificacion INT(11) UNSIGNED NULL DEFAULT NULL COMMENT 'FK ID DEL USUARIO QUE INSERTO LA TUPLA',
  fecha_modificacion DATETIME NULL DEFAULT NULL COMMENT 'FECHA EN LA QUE SE INSERTO LA TUPLA',
  PRIMARY KEY (id_rol),
  CONSTRAINT roles_usu_cre_fk FOREIGN KEY (usuario_creacion) REFERENCES usuarios (id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT roles_usu_mod_fk FOREIGN KEY (usuario_modificacion) REFERENCES usuarios (id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO roles (id_rol,nombre,descripcion,activo,usuario_creacion,fecha_creacion,usuario_modificacion,fecha_modificacion) 
VALUES
		 (1, 'Medico Interno','El médico interno se encarga de velar por los internos',1,1,now(),NULL,NULL),
		 (2, 'Medico Externo','El médico externo encargado de velar por los clientes',1,1,now(),NULL,NULL),
		 (3, 'Encargado Area Interno','El encargado en el área de tomar ordenes de visitas clientes',1,1,now(),NULL,NULL),
		 (4, 'Encargado Area Externa','El encargado de asignar médicos en el área externa',1,1,now(),NULL,NULL),
		 (5, 'CLIENTE','La persona que recibe la visita',1,1,now(),NULL,NULL);



/*OSBIN YOS 27-08-2020 FIN */ 

