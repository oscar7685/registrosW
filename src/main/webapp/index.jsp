<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("tipo");
    if (aux == null || aux.equals("")) {
        session1.invalidate();
    } else {
        if (aux.equals("Decano") || aux.equals("Director postgrado")) {
            RequestDispatcher rd = request.getRequestDispatcher("/Login?accion=redirectDecano");
            rd.forward(request, response);
        } else {
            if (aux.equals("Centro Autoevaluación")) {
                RequestDispatcher rd = request.getRequestDispatcher("/Login?accion=redirectCentro");
                rd.forward(request, response);
            }
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros Calificados</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="ui-layout-north ui-widget-content">
            <div class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#"><img style="margin-top: -10px;" src="css/images/logo3.png"/></a>
                        <button data-target="#navbar-main" data-toggle="collapse" type="button" class="navbar-toggle">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div id="navbar-main" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="#inicio" class="active">Inicio</a>
                            </li>
                            <li>
                                <a target="_blank" href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto">Contacto</a>
                            </li>
                            <li>
                                <a href="#" id="enlaceAcercaDe">Acerca de</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>  
        </div><!--North-->
        <div class="page-container">
            <form name="formulario_login" id="formulario_login" method="post">
                <h1>Ingresar</h1>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="icon-user" style="font-size: 24px;"></i></span>
                    <input type="text" id="username" name="username" class="username form-control col-md-5{required:true}" placeholder="Usuario">
                </div>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="icon-lock" style="font-size: 24px;"></i></span>
                    <input type="password" id="password" name="password" class="password form-control col-md-5{required:true}" placeholder="Contraseña">
                </div>
                <div class="input-group input-group-sm">
                    <span class="input-group-addon"><i class="icon-group" style="font-size: 22px;"></i></span>
                    <select id="perfilIngreso" name="perfilIngreso" class="form-control col-md-5{required:true}">
                        <option selected="selected">Decano</option>
                        <option >Director postgrado</option>
                        <option>Centro Autoevaluaci&oacute;n</option>
                    </select>
                </div>

                <button class="ingresar" type="submit" style="margin-left: 10px;">Iniciar sesi&oacute;n</button>

            </form>
        </div>

        <!-- Javascript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/jquery.metadata.js"></script>
        <script src="js/main.js"></script>

        <div class="modal fade" id="ModalAcercaDe" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding-bottom: 19px; border-bottom:0;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body" align="center">
                        <img src="<%=request.getContextPath()%>/css/images/logo3.png"/>
                        <br>
                        <%--    <div style="background-color: #282728;border-top: 0px;border-radius:0;" class="modal-footer">--%>
                        <%-- <a class="btn btn-primary" data-dismiss="modal" href="#">Cerrar</a>--%>
                        <p style="color: #FFFFFF; text-align: right">Serca-UdeC v1.0</p>
                        <p style="color: #FFFFFF; text-align: justify">El sistema para el seguimiento de registros calificados y acreditación de programas es un apoyo fundamental para la institución y sus programas academicos, puesto que permite conocer los tiempos reglamentarios para realizar los procesos de autoevaluación con fines de renovacion de registros calificados y/o de reacreditación, brindando un sistema de alerta temprana con el fin evitar el vencimiento de los registros calificados y/o acreditación de los programas.</p>
                        <br/>
                        <p style="color: #FFFFFF;  text-align: right">Desarrollado por el Centro de Autoevaluaci&oacute;n</p>
                        <p style="color: #FFFFFF; text-align: right">Edna Margarita Gómez Bustamante, Oscar Javier Ballesteros Pacheco, Merly Li&nacute;an Jaraba.</p>
                        <%--  </div>--%>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>

