<?php
$titulo="Empresas Registradas en TIS";
include('conexion/verificar_gestion.php');
session_start();
/*------------------VERIFICAR QUE SEAL EL ADMINISTRADOR------------------------*/
// if(isset($_SESSION['nombre_usuario']) && ($_SESSION['tipo']!=2 && $_SESSION['tipo']!=3))
// {/*SI EL QUE INGRESO A NUESTRA PAGINA ES CONSULTOR DE CUALQUIER TIPO*/
//     $home="";
//     switch  ($_SESSION['tipo']){
//         case (5) :
//                     $home="home_integrante.php";
//                       break;
//               case (4) :
//                     $home="home_grupo.php";
//                       break;
//               case (2) :
//                     $home="home_consultor_jefe.php";
//                       break;
//               case (3) :
//                     $home="home_consultor.php";
//                       break;
//               case (1) :
//                       $home="home_admin.php";
//                       break;
//             }
//     header("Location: ".$home);
// }
// elseif(!isset($_SESSION['nombre_usuario'])){
//   header("Location: index.php");
// }
/*----------------------FIN VERIFICACION------------------------------------*/
include('header.php');
 ?>
      <!--PARTICIONAR
      <li>
            <a href="#">Inicio</a> <span class="divider">/</span>
      </li>-->
      <div>
        <ul class="breadcrumb">
          <li>
            <a href="index.php">Inicio</a>
            <span class="divider">/</span>
          </li>
          <li>
            <a href="registro_grupo.php">Volver</a>
          </li>
        </ul>
      </div>
      <center><h3>Lista de Grupo Empresas</h3></center>
      <div class="row-fluid">
                <div class="box span12" id="print">
          <div class="box-header well" data-original-title>
            <h2><i class="icon-check"></i> Grupo Empresas registradas en el sistema en diferentes gestiones</h2>

          </div>
          <div class="box-content">
            <?php if($gestion_valida) {
              include('conexion/conexion.php');
              $empresas="SELECT nombre_largo,nombre_corto,YEAR(fecha_ini_gestion) as ges FROM grupo_empresa,usuario,gestion_empresa_tis WHERE grupo_empresa.consultor_tis=usuario.id_usuario and gestion_empresa_tis.id_gestion=usuario.gestion";
              $resultado=mysql_query($empresas);
              $num_res=mysql_num_rows($resultado);
              if($num_res>0) { ?>
                <table class="table table-striped table-bordered  datatable">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Nombre Largo</th>
                      <th>Nombre Corto</th>
                      <th>Gestión</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                      $identi=1;
                      while($row = mysql_fetch_array(($resultado))) {
                        echo "<tr>
                                <td>".$identi."</td>
                                <td>".$row["nombre_largo"]."</td>
                                <td>".$row["nombre_corto"]."</td>
                                <td>".$row["ges"]."</td>
                              </tr>";
                              $identi++;
                      }
                     ?>
                  </tbody>
                </table>
              
              <?php }
                       }
                    ?>
          </div>
        </div><!--/span-->
        </div>

<?php include('footer.php'); ?>