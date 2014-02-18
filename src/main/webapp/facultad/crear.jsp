<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
    
        $("#formCrearFacultad").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=crearFacultad2",
                    data: $("#formCrearFacultad").serialize(),
                    success: function() {
                        location = "/registrosW/#listarFacultades";
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
                    Facultades <span class="divider"></span>
                </li>
                <li>
                    Crear
                </li>
            </ul>
            <form id="formCrearFacultad" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Facultad</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre" class="control-label">Facultad</label>
                        <div class="controls">
                            <textarea rows="3" name="nombre" id="nombre" class="input-xlarge {required:true}"></textarea>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Facultad</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>