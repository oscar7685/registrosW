<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li>
                    Programas <span class="divider"></span>
                </li>
                <li>
                    Listado
                </li>
            </ul>
            <h3 style="margin: 0;">Listado de  Programas</h3>
            <c:choose>
                <c:when test="${fn:length(listaP)!= 0}">
                    <table id="tablaX2" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Programa<input type="text" class="col-lg-10" value="" name="search_engine"></th>
                        <th >Registro Calificado<input type="text" class="col-lg-10" value="" name="search_browser"></th>
                        <th >Fecha de Vencimiento<input type="text" class="col-lg-10" value="" name="search_platform"></th>
                        <th >1ra Autoevaluaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_version"></th>
                        <th >2da Autoevaluaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_x"></th>
                        <th >presentación al C. de Autoevaluaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_x1"></th>
                        <th >Fecha de Radicaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_x2"></th>
                        </thead>
                        
                        <tbody>
                            <c:forEach items="${listaP}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <a href="#editarPrograma&${row.idprograma}" title="Editar Programa">${row.nombre}</a>
                                    </td>
                                    <td> 
                                        <a href="#editarRegistro&${row.getUltimoRegistro().idregistro}" title="Editar Registro">${row.getUltimoRegistro().resolucion}</a>
                                    </td>
                                    <td> 
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaVencimiento}' />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen programas registrados en el sistema.
                </c:otherwise>
            </c:choose>

            <a href="#crearPrograma" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear programa</a>

        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable2.js"></script>