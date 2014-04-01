<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('#inicio').datepicker({
            format: 'dd/mm/yyyy'
        });
        $("#formCrearAcreditacion").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=crearAcreditacion2",
                    data: $("#formCrearAcreditacion").serialize(),
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
                    Acreditaciones <span class="divider"></span>
                </li>
                <li>
                    Crear
                </li>
            </ul>
            <form id="formCrearAcreditacion" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Acreditaci&oacute;n</legend>
                    <div class="control-group">
                        <label for="resolucion" class="control-label">Resolucion</label>
                        <div class="controls">
                            <input type="text" name="resolucion" id="resolucion" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="inicio" class="control-label">Fecha inicio</label>
                        <div class="controls">
                            <input type="text" name="inicio" id="inicio" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="duracion" class="control-label">Duracion (A&nacute;os)</label>
                        <div class="controls">
                            <input type="text" name="duracion" id="duracion" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="programa" class="control-label">Programa</label>
                        <div class="controls">
                            <select id="programa" name="programa" class="{required:true}">
                                <option></option>
                                <c:forEach items="${listaP}" var="row" varStatus="iter">
                                    <option value="${row.idprograma}">${row.nombre}</option>
                                </c:forEach>
                            </select>                
                        </div>
                    </div>


                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Acreditaci&oacute;n</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
           
        </div><!--/span-->        
    </div><!--/row-->    
</div>