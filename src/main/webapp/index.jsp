<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("tipo");
    if (aux == null || aux.equals("")) {
        session1.invalidate();
    } else {
        if (aux.equals("Decano")) {
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
                                <a href="#">Contacto</a>
                            </li>
                            <li>
                                <a href="#">Acerca de</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>  
        </div><!--North-->
        <div class="page-container">
            <h1>Ingresar</h1>
            <form name="formulario_login" id="formulario_login" method="post">
                <input type="text" id="username" name="username" class="username {required:true}" placeholder="Usuario">
                <input type="password" id="password" name="password" class="password {required:true}" placeholder="Contraseña">
                <select id="perfilIngreso" name="perfilIngreso" class="{required:true}">
                    <option selected="selected">Decano</option>
                    <option>Centro Autoevaluaci&oacute;n</option>
                </select>
                <button type="submit">Iniciar sesi&oacute;n</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>

        <!-- Javascript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/jquery.metadata.js"></script>
        <script src="js/main.js"></script>
        

    </body>
</html>
