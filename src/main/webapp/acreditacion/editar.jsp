<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap styles -->
<!--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">-->
<!-- Generic page styles -->
<link rel="stylesheet" href="css/style.css">
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">
<link rel="stylesheet" href="css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="css/jquery.fileupload-ui-noscript.css"></noscript>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('#inicio').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#inicioUno').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#inicioDos').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#finaUno').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#finaDos').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#presentacionAuto').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#radicacion').datepicker({
            format: 'dd/mm/yyyy'
        });
        $("#formEditarAcreditacion").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=editarAcreditacion2",
                    data: $("#formEditarAcreditacion").serialize(),
                    success: function() {
                        location = "/registrosW/#listarAcreditaciones";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li>
                    Acreditaci&oacute;n <span class="divider"></span>
                </li>
                <li>
                    Editar
                </li>
            </ul>

            <form id="formEditarAcreditacion" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Acreditaci&oacute;n</legend>
                    <div class="col-xs-4">
                        <div class="form-group">
                            <label for="resolucion" class="col-xs-4 control-label">Resolucion</label>
                            <div class="col-xs-8">
                                <textarea name="resolucion" class="form-control {required:true}" id="resolucion" rows="2">${acreditacion.resolucion}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inicio" class="col-xs-4 control-label">Fecha Inicio</label>
                            <div class="col-xs-8">
                                <input type="text" name="inicio" id="inicio" class="input-xlarge {required:true}" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.fechaInicio}' />" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="duracion" class="col-xs-4 control-label">Duracion (A&nacute;os)</label>
                            <div class="col-xs-8">
                                <input type="text" name="duracion" id="duracion" class="input-xlarge {required:true}" value="${acreditacion.duracion}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="programa" class="col-xs-4 control-label">Programa</label>
                            <div class="col-xs-8">
                                <select id="programa" name="programa" class="{required:true}">
                                    <option value=""></option>    
                                    <c:forEach items="${listaP}" var="row" varStatus="iter">
                                        <c:choose>
                                            <c:when test="${row != acreditacion.programaIdprograma}">
                                                <option value="${row.idprograma}">${row.nombre}</option>    
                                            </c:when>
                                            <c:otherwise>
                                                <option selected="selected" value="${row.idprograma}">${row.nombre}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>                
                            </div>
                        </div>    
                    </div>
                    <div class="col-xs-8">
                        <fieldset><legend style="text-align: center;">Fechas para seguimiento de renovaci&oacute;n de la acreditaci&oacute;n</legend></fieldset>

                        <div class="col-xs-4 bordeado">
                            <div class="form-group">
                                <label for="inicioUno" class="col-xs-6 control-label">Inicio 1ra Autoevaluaci&oacute;n</label>
                                <div class="col-xs-6">
                                    <input type="text" name="inicioUno" id="inicioUno" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.inicioUno}' />" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="finaUno" class="col-xs-6 control-label">Final 1ra Autoevaluaci&oacute;n</label>
                                <div class="col-xs-6">
                                    <input type="text" name="finaUno" id="finaUno" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.finaUno}' />" >
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4 bordeado">
                            <div class="form-group">
                                <label for="inicioDos" class="col-xs-6 control-label">Inicio 2da Autoevaluaci&oacute;n</label>
                                <div class="col-xs-6">
                                    <input type="text" name="inicioDos" id="inicioDos" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.inicioDos}' />" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="finaDos" class="col-xs-6 control-label">Final 2da Autoevaluaci&oacute;n</label>
                                <div class="col-xs-6">
                                    <input type="text" name="finaDos" id="finaDos" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.finaDos}' />" >
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4 bordeado">
                            <div class="form-group">
                                <label for="presentacionAuto" class="col-xs-6 control-label">Presentación Centro Autoevaluaci&oacute;n</label>
                                <div class="col-xs-6">
                                    <input type="text" name="presentacionAuto" id="presentacionAuto" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.presentacionAuto}' />" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="radicacion" class="col-xs-6 control-label">Radicación</label>
                                <div class="col-xs-6">
                                    <input type="text" name="radicacion" id="radicacion" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${acreditacion.radicacion}' />" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${usuario.tipo=='Centro Autoevaluación'}">
                            <div class="col-xs-10 form-actions">
                                <button class="btn btn-primary" type="submit">Guardar cambios</button>
                                <button class="btn" type="reset">Cancelar</button>
                            </div>
                        </c:when>
                    </c:choose>           

                </fieldset>
            </form>


            <br/>           
            <form id="fileupload" action="Subir?tipo=acreditacion" method="POST" enctype="multipart/form-data">
                <fieldset>
                    <legend>Anexos</legend>
                    <!-- Redirect browsers with JavaScript disabled to the origin page -->
                    <noscript><input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/"></noscript>
                    <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                    <c:choose>
                        <c:when test="${usuario.tipo=='Centro Autoevaluación'}">
                            <div class="row fileupload-buttonbar">

                                <div class="col-lg-7">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <span class="btn btn-success fileinput-button">
                                        <i class="glyphicon glyphicon-plus"></i>
                                        <span>Agregar anexos...</span>
                                        <input type="file" name="files[]" multiple>
                                    </span>
                                    <button type="submit" class="btn btn-primary start">
                                        <i class="glyphicon glyphicon-upload"></i>
                                        <span>Subir anexos</span>
                                    </button>
                                    <button type="reset" class="btn btn-warning cancel">
                                        <i class="glyphicon glyphicon-ban-circle"></i>
                                        <span>Cancelar</span>
                                    </button>
                                    <button type="button" class="btn btn-danger delete">
                                        <i class="glyphicon glyphicon-trash"></i>
                                        <span>Borrar anexos</span>
                                    </button>
                                    <input type="checkbox" class="toggle">
                                    <!-- The global file processing state -->
                                    <span class="fileupload-process"></span>
                                </div>

                                <!-- The global progress state -->
                                <div class="col-lg-5 fileupload-progress fade">
                                    <!-- The global progress bar -->
                                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                    </div>
                                    <!-- The extended global progress state -->
                                    <div class="progress-extended">&nbsp;</div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                    <!-- The table listing the files available for upload/download -->
                    <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                </fieldset> 
            </form>            
        </div><!--/span-->        
    </div><!--/row-->    
</div>

<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
    <td>
    <span class="preview"></span>
    </td>
    <td>
    <p class="name">{%=file.name%}</p>
    <strong class="error text-danger"></strong>
    </td>
    <td>
    <p class="size">Processing...</p>
    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
    </td>
    <td>
    {% if (!i && !o.options.autoUpload) { %}
    <button class="btn btn-primary start" disabled>
    <i class="glyphicon glyphicon-upload"></i>
    <span>Subir</span>
    </button>
    {% } %}
    {% if (!i) { %}
    <button class="btn btn-warning cancel">
    <i class="glyphicon glyphicon-ban-circle"></i>
    <span>Cancelar</span>
    </button>
    {% } %}
    </td>
    </tr>
    {% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
    <td>
    <span class="preview">
    {% if (file.thumbnailUrl) { %}
    <a href="{%=file.url%}" target="_blank" title="{%=file.name%}" download="{%=file.name%}" ><img src="{%=file.thumbnailUrl%}"></a>
    {% } %}
    </span>
    </td>
    <td>
    <p class="name">
    {% if (file.url) { %}
    <a href="{%=file.url%}" target="_blank" title="{%=file.name%}" download="{%=file.name%}" >{%=file.name%}</a>
    {% } else { %}
    <span>{%=file.name%}</span>
    {% } %}
    </p>
    {% if (file.error) { %}
    <div><span class="label label-danger">Error</span> {%=file.error%}</div>
    {% } %}
    </td>
    <td>
    <span class="size">{%=o.formatFileSize(file.size)%}</span>
    </td>
    <td>
    <c:choose>
        <c:when test="${usuario.tipo=='Centro Autoevaluación'}">
            {% if (file.deleteUrl) { %}
    <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
    <i class="glyphicon glyphicon-trash"></i>
    <span>Borrar</span>
    </button>
    <input type="checkbox" name="delete" value="1" class="toggle">
    {% } else { %}
    <button class="btn btn-warning cancel">
    <i class="glyphicon glyphicon-ban-circle"></i>
    <span>Cancel</span>
    </button>
    {% } %}
    </td>
        </c:when>
    </c:choose>
    
    </tr>
    {% } %}
</script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- blueimp Gallery script -->
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="js/main12.js"></script>