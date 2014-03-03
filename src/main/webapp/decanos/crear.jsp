<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
    
        $("#formCrearDecano").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=crearDecano2",
                    data: $("#formCrearDecano").serialize(),
                    success: function() {
                        location = "/registrosW/#listarDecanos";
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
                    Decanos <span class="divider"></span>
                </li>
                <li>
                    Crear
                </li>
            </ul>
            <form id="formCrearDecano" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Decano</legend>
                    <div class="form-group">
                        <label for="codigo" class="col-md-2 control-label">C&oacute;digo</label>
                        <div class="col-md-4">
                            <input type="text" name="codigo" id="codigo" class="form-control {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nombres" class="col-md-2 control-label">Nombres</label>
                        <div class="col-md-4">
                            <input type="text" name="nombres" id="nombres" class="form-control {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apellidos" class="col-md-2 control-label">Apellidos</label>
                        <div class="col-md-4">
                            <input type="text" name="apellidos" id="apellidos" class=" form-control {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="clave" class="col-md-2 control-label">Clave</label>
                        <div class="col-md-4">
                            <input type="password" name="clave" id="clave" class="form-control {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="facultad" class="col-md-2 control-label">Facultad</label>
                        <div class="col-md-6">
                            <select id="facultad" name="facultad" class="form-control {required:true}">
                                <option></option>
                                <c:forEach items="${facultades}" var="row" varStatus="iter">
                                    <option value="${row.idfacultad}">${row.nombre}</option>
                                </c:forEach>
                            </select>                
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-8">
                        <button class="btn btn-primary" type="submit">Crear Decano</button>
                        <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>