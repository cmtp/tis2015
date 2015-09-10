<?php
session_start();
if (isset($_GET['value']) && $_SESSION['tipo']==$_GET['value']) {
	$quien=$_GET['value'];
}
else{
	header('Location: index.php');
}
$quien_ingresa="";
$pag_ini="";
switch  ($quien){
                case (3) :
                	{$quien_ingresa="Consultor TIS";
                	$pag_ini="home_cosultor.php";
                    break;}
                case (2) :
                	{$quien_ingresa="Jefe Consultor TIS";
                	$pag_ini="home_consultor_jefe.php";
                    break; }                                                            		
 } 
$titulo="Informacion del ".$quien_ingresa; 
include("conexion/verificar_gestion.php");
/*------------------VERIFICAR QUE SEAL EL CONSULTOR------------------------*/
if(isset($_SESSION['nombre_usuario']) && $_SESSION['tipo']!=$quien)
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

include('header.php');
 ?>
<script type="text/javascript">
	function imprimir(){
  var objeto=document.getElementById('print');  //obtenemos el objeto a imprimir
  var ventana=window.open('','_blank');  //abrimos una ventana vacía nueva
  ventana.document.write(objeto.innerHTML);  //imprimimos el HTML del objeto en la nueva ventana
  ventana.document.close();  //cerramos el documento

  	var css = ventana.document.createElement("link");
	css.setAttribute("href", "css/style.css");
	css.setAttribute("rel", "stylesheet");
	css.setAttribute("type", "text/css");
	ventana.document.head.appendChild(css);


  ventana.print();  //imprimimos la ventana
  ventana.close();  //cerramos la ventana
}

</script>


			<div>
				<ul class="breadcrumb">					
					<li>
						<a href="index.php">Inicio</a><span class="divider">/</span>
					</li>
					<li>
						<a href='info_consultor.php?value=<?php echo $quien; ?>'> Informaci&oacute;n del usuario </a>
					</li>				
				</ul>
			</div>
			<center><h3>Informaci&oacute;n Consultor TIS</h3></center>
			<div class="row-fluid">
				<div class="box span12 center" id="print">
						<div class="box-header well">
							<h2><i class="icon-info-sign"></i> Informaci&oacute;n del usuario: <?php echo $nombre_usuario; ?></h2>					
						</div>
						<div class="box-content padding-in" style="text-align:left;" >
							<?php 
								$consulta_usuario = mysql_query("SELECT id_usuario, nombre_usuario,nombre,apellido,telefono,email,habilitado,curriculum
																FROM usuario u, consultor_tis c
																WHERE id_usuario=usuario AND id_usuario=$id_usuario",$conn)
	                          					or die("Could not execute the select query.");

								$resultado = mysql_fetch_assoc($consulta_usuario);
								if(is_array($resultado) && !empty($resultado))
								{	
										$nombre= $resultado['nombre'];
										$apellido= $resultado['apellido'];
										$telefono= $resultado['telefono'];
										$email= $resultado['email'];
										if(!is_null($resultado['curriculum'])){
											$ruta_curriculum= $resultado['curriculum'];
										}
										if($resultado['habilitado']=1){
										$habilitado= "Si";	}
										else{
											$habilitado="No";
										}		
								}
								else{
									echo "<h4>No se Encontro ning&uacute;n registro";
								} ?>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Atributo</th>
											<th>Valor</th>
										</tr>
									</thead>
								  	<tbody>
									<tr>
										<td>Nombre de Usuario: </td>
										<td class="center"><?php echo $nombre_usuario; ?></td>                                      
									</tr>
									<tr>
										<td>Nombre: </td>
										<td class="center"><?php echo $nombre; ?></td>                                       
									</tr>
									<tr>
										<td>Apellido: </td>
										<td class="center"><?php echo $apellido; ?></td>                                      
									</tr>
									<tr>
										<td>Tel&eacute;fono: </td>
										<td class="center"><?php echo $telefono; ?></td>                                     
									</tr>
									<tr>
										<td>Correo electr&oacute;nico: </td>
										<td class="center"><?php echo $email; ?></td>                          
									</tr>
									<tr>
										<td>Curr&iacute;culo:</td>
										<td class="center"><?php if(isset($ruta_curriculum)){
										 echo "<a href=\" ".$ruta_curriculum."\"> <i class=\"icon-download-alt\"></i> Ver Curr&iacute;culo</a>"; }
										 else{
										 	echo "No disponible";
										 } ?></td>                          
									</tr>
									<tr>
										<td>Habilitado: </td>
										<td class="center"><?php echo $habilitado; ?></td>                          
									</tr>
									<tr>
										<td>Tipo de usuario: </td>
										<td class="center"><?php echo $quien_ingresa; ?></td>                          
									</tr>                                    
								  </tbody>
						 </table>
						 <div class="row-fluid">
							 <div class="span12" style="padding:10px;">  
							 	<button type="button" class="btn btn-primary" onclick="imprimir();"><i class="icon-print"></i> Imprimir</button>
								<a href="modificar_registro_consultor.php?value=<?php echo $quien; ?>"	 type="button" class="btn"><i class="icon-edit"></i> Modificar Registro</a>
							</div>
						</div>
		                </div>
				</div>
			</div>
			<!--nos muestra informacion del usuario -->
			<div class="modal fade" id="helpmodals1" role="dialog">
    			<div class="modal-dialog">
    
      			<!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s1">
        <table>
        	<td>
        	<img src="img_help/helps1.png" alt="ayuda 1">
        	</td>
        	<td><span class="">nos muestra la informacion del usuario
        	a!</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps1"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- imrimir y modificar registro -->
			<div class="modal fade" id="helpmodals2" role="dialog">
    			<div class="modal-dialog">
    
      			<!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s2">
        <table>
        	<td>
        	<img src="img_help/helps2.png" alt="ayuda 1">
        	</td>
        	<td><span class="">nos da la opcion de imprimir y modificar registro
        	!</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps2"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- observar el curriculum -->
			<div class="modal fade" id="helpmodals3" role="dialog">
    			<div class="modal-dialog">
    
      			<!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s3">
        <table>
        	<td>
        	<img src="img_help/helps3.png" alt="ayuda 1">
        	</td>
        	<td><span class="">podemos observar el regitro para imprimir
        	!</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps3"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
<?php include('footer.php'); ?>
