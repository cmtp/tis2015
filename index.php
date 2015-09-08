<?php
$titulo="Sistema de Apoyo a la Empresa TIS";
include('conexion/verificar_gestion.php');
session_start();
include('header.php');
 ?>
			<div>
				<ul class="breadcrumb">

					<li>
						<a href="index.php">Inicio</a>
					</li>
				</ul>
			</div>
			<center><h3>Bienvenidos al Sistema de Apoyo a la Empresa TIS</h3></center>

			<div class="row-fluid">
			<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-bullhorn"></i> Avisos: Gesti&oacute;n <?php echo $nombre_gestion; ?></h2>
					</div>
					<div class="box-content alerts">
					<?php
						if ($gestion_valida) {
							 include('conexion/noticias.php');

                       }
                         else{
                         	echo "<div align=\"center\">
	                        <h4><i class=\"icon-info-sign\"></i>
	                        No existe ning&uacute;n aviso para esta gesti&oacute;n.</h4>
	                      	</div>";
                         }
                      ?>

					</div>
				</div><!--/span-->
			</div><!-- fin row -->
			<!--AYUDA DEL SISTEMA -->
			<div class="modal fade" id="helpmodal1" role="dialog">
    	<div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-1">
        <table>
        	<td>
        	<img src="img_help/help1.png" alt="ayuda 1">
        	</td>
        	<td><span class="">Ingrese en este enlace para entrar como administrador del sitio</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="help1"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- Ayuda dos-->
  <div class="modal fade" id="helpmodal2" role="dialog">
    	<div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-2">
        <table>
        	<td>
        	<img src="img_help/help2.png" alt="ayuda 1">
        	</td>
        	<td><span class="">Registre su grupo empresa o ingrese si ya posee una cuenta</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="help2"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- Ayuda tres-->
  <div class="modal fade" id="helpmodal3" role="dialog">
    	<div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-3">
        <table>
        	<td>
        	<img src="img_help/help3.png" alt="ayuda 1">
        	</td>
        	<td><span class="">Registrese como consultor tis para usar el sistema o ingrese si ya posee una cuenta</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="help3"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- Ayuda cuatro-->
  <div class="modal fade" id="helpmodal4" role="dialog">
    	<div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-4">
        <table>
        	<td>
        	<img src="img_help/help4.png" alt="ayuda 1">
        	</td>
        	<td><span class="">Si desea obtener informacion del administrador ingrese a este enlace</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="help4"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
<?php include('footer.php'); ?>
