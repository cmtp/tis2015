<?php
$titulo="Publicar Contrato";
include('conexion/verificar_gestion.php');
session_start();
$quien_ingresa="Grupo Empresa";
$pag_ini="home_grupo.php";
if(isset($_SESSION['nombre_usuario']) && ($_SESSION['tipo']!=2 && $_SESSION['tipo']!=3))
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
/*----------------------FIN VERIFICACION------------------------------------*/

if(isset($_POST['enviar'])){
	$descripcionA=$_POST['descripcionA'];
	$tituloD=$_POST['tituloD'];
	$usuario=$_SESSION['id'];
	$nombre_usuario=$_SESSION['nombre_usuario'];
	$errorA=false;
	/*SUBIDA DEL ARCHIVO ADJUNTO SOBRE A*/
	$contrato="";
   	$tiene_doc=0;
    $ext_permitidas = array('.pdf','.doc','.docx','.xls','.xlsx','.ppt','.pptx');
	   if(!empty($_FILES['contrato']['name'])){
	   		$idUnico = time();

            $nombre_archivo = $_FILES['contrato']['name'];
            $nombre_tmp = $_FILES['contrato']['tmp_name'];
            $ext = substr($nombre_archivo, strpos($nombre_archivo, '.'));
            $tamano = $_FILES['contrato']['size'];             
            $limite = 1000 * 1024;
            $idUnico = time();
            if(in_array($ext, $ext_permitidas)){
            	if( $tamano <= $limite ){
                    if( $_FILES['contrato']['error'] <= 0 ){
                    	if( file_exists( 'archivos/'.str_replace(" ", "_", $nombre_usuario).'-'.$tituloD.'-'.$idUnico.$ext)){
                              $error_docA='Usted ya subio el contrato';
                              $errorA=true;
                        }
                        else{ 
                             move_uploaded_file($nombre_tmp, 'archivos/'.str_replace(" ", "_", $nombre_usuario).'-'.$tituloD.'-'.$idUnico.$ext);
                             $contrato='archivos/'.str_replace(" ", "_", $nombre_usuario).'-'.$tituloD.'-'.$idUnico.$ext;
                             $tiene_doc=1;
                        }
                     }
                     else{
                     		$error_docA='Error al subir el archivo';
                      		$errorA=true;
                       }
                    }
                else{  
                      $error_docA='El archivo debe un tama&ntilde;o menor a 1 Mega Byte';
                      $errorA=true;
                    }
            }
            else{
            	$errorA=true;
            	$error_docA='El formato del archivo no esta permitido';
            }

   	}
   	else
   	{
   		$error_docA='Debe seleccionar un archivo';
   		$errorA=true;
   	}


	

		if(!$errorA){
	      
            $sql = "INSERT INTO documento_consultor(nombre_documento, descripsion_documento, ruta_documento, fecha_documento, documento_jefe, consultor_tis, gestion)
	                VALUES ('$tituloD', '$descripcionA', '$contrato', NOW(), 0, '$usuario', '$id_gestion' )";
	        $result = mysql_query($sql,$conn) or die(mysql_error());
	        header("Location: administrar_archivos.php");
		}
	}
	else{
		$descripcionA=NULL;
		$tituloD=NULL;
	}

include('header.php');
 ?>
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="index.php">Inicio</a>
						<span class="divider">/</span>
					</li>
					<li>
						<a href="subir_contrato.php">Publicar Documentos</a>
					</li>				
				</ul>
			</div>
			<center><h3>Publicar Documentos</h3></center>
			<div class="row-fluid">
			<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-edit"></i> Formulario de publicaci&oacute;n de Documento</h2>
					</div>
					<div class="box-content">
						<?php if ($gestion_valida){
						?>
		                  	<form name="form-data" class="form-horizontal cmxform" method="POST" id="signupForm" enctype="multipart/form-data" action="subir_contrato.php" accept-charset="utf-8">
								<fieldset>

								<div class="control-group">
								  <label class="control-label" for="tituloD">T&iacute;tulo </label>
								  <div class="controls">
									<input type="text" placeholder="T&iacute;tulo del Documento" name="tituloD" id="tituloD" value='<?php echo $tituloD; ?>'>
								  </div>
								</div>

								<div class="control-group">
									<label class="control-label" for="descripcion">Descripci&oacute;n:</label>
									<div class="controls">
										<!--<textarea id="descripcionA" placeholder="Descripci&oacute;n del Documento" name="descripcionA" onkeydown="if(this.value.length >= 40){return false;}"><?php echo $descripcionA; ?></textarea>-->
                                        <textarea id="descripcionA" placeholder="Descripci&oacute;n del Documento" name="descripcionA"><?php echo $descripcionA; ?></textarea>
									</div>
								</div>
                                <label class="ayudas"> El archivo a subir debe ser de 1 Mb maximo :</label>
								<div class="control-group">
								  <label class="control-label" for="fileInput">Documento:</label>
								  <div class="controls">
									<input class="input-file uniform_on" name="contrato" id="contrato"  type="file" />
									<label class="error"><?php if(isset($error_docA)){ echo $error_docA; } ?></label>
								  </div>
								</div>
								<div class="control-group">
									<div class="controls">
						         <button name="enviar"type="submit" class="btn btn-primary" id="enviar">Publicar Documento</button>
								 <button type="reset" class="btn">Cancelar</button>
								 </div>
								 </div>
						        </fieldset>
							</form>
							<?php 
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
            <!-- subir contrato-->
  <div class="modal fade" id="helpmodals6" role="dialog">
      <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s6">
        <table>
          <td>
          <img src="img_help/helps6.png" alt="ayuda 1">
          </td>
          <td><span class="">debe subir un documento en formato pdf que sea menor a un mega</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps6"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- subir contrato-->
  <div class="modal fade" id="helpmodals7" role="dialog">
      <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Ayuda del Sistema</h4>
        </div>
        <div class="modal-body">
        <div class="help-s7">
        <table>
          <td>
          <img src="img_help/helps7.png" alt="ayuda 1">
          </td>
          <td><span class="">publicar contrato para mejor administracion de la empresa</span></td>
        </table>
        </div>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block pull-left" data-dismiss="modal" id="helps7"><span class="glyphicon glyphicon-remove"></span> Continuar</button>
        <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" id="help_cancel"><span class="glyphicon glyphicon-remove"></span> Salir de ayuda</button>
        </div>
      </div>
      
    </div>
  </div>
<?php include('footer.php'); ?>