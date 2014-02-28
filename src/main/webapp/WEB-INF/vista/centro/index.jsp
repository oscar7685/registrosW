<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link href="css/layout-sitenav.css" type="text/css" rel="stylesheet" media="screen">
        <title></title>
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout2.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cover.css">
        <!--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">-->
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/otro.css">-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css">-->
        <style type="text/css">
            .table-condensed th,
            .table-condensed td {
                padding: 1px 5px;
            }
        </style>
        <script src="<%=request.getContextPath()%>/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    <body>
        <div class="ui-layout-north ui-widget-content">
            <div class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Registros</a>
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
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;${usuario.nombres} ${usuario.apellidos}<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Perfil</a></li>
                                    <li><a href="#">Cambiar Contrase&ntilde;a</a></li>
                                    <li class="divider"></li>
                                    <li><a href="<%=request.getContextPath()%>/#CerrarSesion">Cerrar Sesion</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>  
        </div><!--North-->

        <div class="ui-layout-south ui-widget-content"> 
            <footer id="footer" class="contenedor_footer fondo_footer">
                <div class="links">
                    <a style="font-weight: normal;-moz-text-decoration-line: none;"><span class="muted">&copy; Universidad de Cartagena 2014</span></a>

                    <a class="about" href="#"><span>Acerca de</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Contacto</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Ayuda</span></a>
                </div>
            </footer>
        </div><!--South-->

        <div class="ui-layout-center">
            <div class="cover-container">
                <div class="inner cover" style="margin-left: -150px;">
                    <h1 class="cover-heading">Registros Calificados UdeC.</h1>
                    <p class="lead">Esta es una página web donde se puede llevar un control acerca de los registros calificados de los diferentes programas de la Universidad de Cartagena de una forma Agil y sencilla.</p>
                    <p class="lead">
                        <a class="btn btn-lg btn-primary" href="#">Ver más</a>

                    </p>
                </div>

            </div>
        </div><!--/Center-->

        <div id="ui-layout-west" class="ui-layout-west">
            <ul class="breadcrumb">
                <li>Menú</li>
            </ul>
            <div class="span3 product_list">
                <ul class="nav">
                    <li>
                        <a href="#listarFacultades">Facultades</a>
                    </li>
                    <li>
                        <a href="#listarProgramas">Programas</a>
                    </li>
                    <li>
                        <a href="#listarRegistros">Registros</a>
                    </li>
                    <li><a href="#">Acreditaciones</a></li>


                </ul>
            </div>

        </div><!--/West-->
    </body>
</html>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
<script type='text/javascript'>
//<![CDATA[
    $({property: 0}).animate({property: 105}, {
        duration: 4000,
        step: function() {
            var _percent = Math.round(this.property);
            $('#progress').css('width', _percent + "%");
            if (_percent == 105) {
                $("#progress").addClass("done");
            }
        },
    });
//]]>
</script>
<script src="<%=request.getContextPath()%>/js/jquery.layout-latest.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.metadata.js"></script>
<script src="<%=request.getContextPath()%>/js/vendor/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ba-hashchange.min.js"></script>
<script src="<%=request.getContextPath()%>/js/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highcharts-more.js"></script>
<script src="<%=request.getContextPath()%>/js/exporting.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.PrintArea.js"></script>
<script src="<%=request.getContextPath()%>/js/main2.js"></script>