<?php
include('conexion/verificar_gestion.php');
session_start();
if(isset($_SESSION['nombre_usuario']) && ($_SESSION['tipo']!=4 && $_SESSION['tipo']!=3 && $_SESSION['tipo']!=2))
{/*SI EL QUE INGRESO A NUESTRA PAGINA ES CONSULTOR DE CUALQUIER TIPO*/
		$home="";
		switch  ($_SESSION['tipo']){
				case (5) :
	                	$home="home_integrante.php";
	                    break;
	            case (4) :
	                	$home="home_grupo.php";
	                    break;
	            case (2) :
	                	$home="home_consultor_jefe.php";
	                    break;
	            case (3) :
	                	$home="home_consultor.php";
	                    break;
	            case (1) :
	                    $home="home_admin.php";
	                    break;
	          }
		header("Location: ".$home);
}
elseif(!isset($_SESSION['nombre_usuario'])){
	header("Location: index.php");
}
/*----------------------FIN VERIFICACION------------------------------------*/
$titulo="Notificaciones Grupo Empresa";
include('header.php');
 ?>
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="index.php">Inicio</a>
						<span class="divider">/</span>
					</li>
					<li>
						<a href="notificaciones.php">Notificaciones</a>
					</li>
				</ul>
			</div>
			<center><h3>Notificaciones</h3></center>
			<div class="row-fluid">
			<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-check"></i> Notificaciones de la Gesti&oacute;n : <?php echo $nombre_gestion; ?></h2>
					</div>
					<div class="box-content alerts">
					<?php
						if ($gestion_valida) {
						$usuario=$_SESSION['id'];
					 $c = "SELECT COUNT(*) as numer
                     FROM notificacion
                     WHERE usuario_destino = '$usuario' AND fecha <= '$fin_gestion 23:59:59' AND fecha>='$ini_gestion 00:00:01' AND leido=0";
	               $r = mysql_query($c);
	               $res = mysql_fetch_array( $r);
	               $num=  $res['numer'];
					
							if($num>0){
								$usuario=$_SESSION['id'];
               					$consulta = "SELECT  id_notificacion,usuario, descripcion, enlace, fecha, leido
	                            FROM notificacion, tipo_notificacion
	                            WHERE (tipo_notificacion = id_tipo_notificacion
	                            AND usuario_destino = $usuario) AND fecha <= '$fin_gestion 23:59:59' AND fecha>='$ini_gestion 00:00:01' AND leido=0
	                            ORDER BY fecha DESC";
				                $resultado = mysql_query($consulta);
				                ?>
                 				
            <form method="post" action="conexion/admin_notificacion.php" accept-charset="utf-8">
            <input type="hidden" name="id_usuario" value=<?php echo $usuario?> />
            <input type="hidden" name="numero" value=<?php echo $num?> />
            <table class="table table-striped table-bordered  datatable">
              <thead>
              	<tr><th><center>Notificaciones no le&iacute;das de la gesti&oacute;n actual</center></th></tr>
              </thead> 
             
              <tbody>
              <?php
                              $identi=0;
                              while($row = mysql_fetch_array($resultado))
                                {
                                  $x = $row['usuario'];
                                  $ci = "SELECT nombre, apellido
                                        FROM usuario
                                        WHERE id_usuario = '$x'";
                                  $ri = mysql_query($ci);
                                  $resi = mysql_fetch_array($ri);
                                  $de = $resi['nombre']." ". $resi['apellido'];

                                  $ci = "SELECT i.descripcion
                                        FROM usuario u, tipo_usuario i
                                        WHERE u.id_usuario = '$x'
                                        AND u.tipo_usuario = i.id_tipo_usuario";
                                  $ri = mysql_query($ci);
                                  $resi = mysql_fetch_array($ri);
                                  $u = $resi['descripcion'];

                         echo "  <tr>
                                     <td>
                                          <div class=\"alert alert-info\"><span style=\"float: right;\" >Leido: ";
                                                  echo "<input type=\"hidden\" id=a".$identi." name=a".$identi." value=".$row['id_notificacion'].">";
                                                 $aux= $row["leido"];
                                                  if($aux=="1"){
                                                     echo "<input type=\"checkbox\" id=c".$identi." name=c".$identi." checked>";
                                                   }
                                                   else{
                                                      echo "<input type=\"checkbox\" id=c".$identi." name=c".$identi.">";
                                                  }
                                                  echo "</span>
                                                  
                                                  <h4>Por : ".$de." </h4>
                                                  <div class=\"letra_aviso\">".$row["descripcion"]." <br></div>
                                                  <div class=\"pie_aviso\">
                                                  <span style=\" text-align:left;\">".$u."</span>";
                                                  echo "<span style=\"float:right;\">Fecha ".$row["fecha"]."</span> </div>

                                            </div>
                                                  
                                          </div>
                                          
                                      </td>
                                    </tr>
                                    ";
                                    $identi++;
                               }
                             ?>

              		</tbody>
            		</table>
            		
                      <button name="enviar"type="submit" class="btn btn-primary" id="enviar"><i class="icon-ok"></i> Guardar cambios</button>
                      
                    </form>
                    <?php
							}else{
							 	echo "<div align=\"center\">
	                        	<h4><i class=\"icon-info-sign\"></i>
	                        	Usted no tiene ninguna notificaci&oacute;n.</h4>
	                      		</div>";
							}
						}

                         else{
                         	echo "<div align=\"center\">
				                        <h4><i class=\"icon-info-sign\"></i>
				                        La gesti&oacute;n no est&aacute; disponible, contacte con el administrador del sistema.</h4>
				                      	</div>";
                         }
                      ?>

					</div>
				</div><!--/span-->
			</div><!-- fin row -->
      <!-- notificaciones-->
  <div class="modal fade" id="helpmodals13" role="dialog">
      <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s13">
        <table>
          <td>
          <img src="img_help/helps13.png" alt="ayuda 1">
          </td>
          <td><span class="">puede marcar como leido</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps13"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- notificaciones-->
  <div class="modal fade" id="helpmodals14" role="dialog">
      <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s14">
        <table>
          <td>
          <img src="img_help/helps14.png" alt="ayuda 1">
          </td>
          <td><span class="">pel link te lleva a ver las notificaciones que tiene pendiente</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps14"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
<?php include('footer.php'); ?>
