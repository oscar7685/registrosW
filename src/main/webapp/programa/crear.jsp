<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {

        $("#formCrearPrograma").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=crearPrograma2",
                    data: $("#formCrearPrograma").serialize(),
                    success: function() {
                        location = "/registrosW/#listarProgramas";
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
                    Programas <span class="divider"></span>
                </li>
                <li>
                    Crear
                </li>
            </ul>
            <form id="formCrearPrograma" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Programa</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre" class="control-label">Programa</label>
                        <div class="controls">
                            <textarea rows="3" name="nombre" id="nombre" class="input-xlarge {required:true}"></textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="modalidad" class="control-label">Modalidad</label>
                        <div class="controls">
                            <select id="modalidad" name="modalidad" class="{required:true}">
                                <option></option>
                                    <option value="Presencial">Presencial</option>
                                    <option value="Distancia">Distancia</option>
                            </select>                
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="formacion" class="control-label">Tipo formación</label>
                        <div class="controls">
                            <select id="formacion" name="formacion" class="{required:true}">
                                <option></option>
                                    <option value="Pregrado">Pregrado</option>
                                    <option value="Postgrado">Postgrado</option>
                            </select>                
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="facultad" class="control-label">Facultad</label>
                        <div class="controls">
                            <select id="facultad" name="facultad" class="{required:true}">
                                <option></option>
                                <c:forEach items="${facultades}" var="row" varStatus="iter">
                                    <option value="${row.idfacultad}">${row.nombre}</option>
                                </c:forEach>
                            </select>                
                        </div>
                    </div>
               
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Programa</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>