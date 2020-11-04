<?php require 'header/menu.php'; ?>
<br>
<section>

		<div class="content-wrapper">
		<?php
		//$mvc=new MvcController();
		//$mvc->enlacesPaginasController();
	  	print "AQUI MI DASHBOARD";
		?>
	

	</section>


<div class="content-wrapper">

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="panel-body">
					<!-- consulta aquí -->
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
							<div class="<?php echo $colores[array_rand($colores)]; ?> box">
								<div class="box-header with-border">
									<h3 class="box-title"><b><?php echo $nombre; ?></b></h3>
									<div class="box-header" style="">
										<a href="vista_grupo_view.php?idgrupo=<?php echo $idgrupo; ?>" class="btn-default pull-right" >Acceder <i class="fa fa-arrow-circle-right"></i></a>

									<div class="box-tools pull-right">
                					<span data-toggle="tooltip" title="" class="badge" data-original-title="Estudiantes del Ciclo">
                  					<?php 
                    				$rsptag=$consulta->cantidadg($user_id,$idgrupo);
                   						 while ($regrupo=$rsptag->fetch_object()) {
                      					echo $regrupo->total_alumnos;
                   						 }
                  						 ?>
                </span>
                
              </div>


								</div>
							</div>	
						</div>
				<div class="panel-body">
			</div>
		</div>
	</div>
</div>

<?php// require 'header/footer.php'; ?>
