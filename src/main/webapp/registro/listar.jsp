<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
              <ul class="breadcrumb">
                <li>
                    Registros <span class="divider"></span>
                </li>
                <li>
                    Listado
                </li>
            </ul>
            <h3 style="margin: 0;">Listado de  Registros</h3>
            <c:choose>
                <c:when test="${fn:length(listaR)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span1">Resolucion</th>    
                        <th class="span8">Fecha Vencimiento</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaR}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.resolucion}"/>
                                    </td>
                                    <td>   
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.fechaVencimiento}' />
                                    </td>
                                    <td class="span2">
                                        <a href="#editarRegistro&${row.idregistro}" title="Editar"><i class="glyphicon glyphicon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen registros calificados registrados en el sistema.
                </c:otherwise>
            </c:choose>

            <a href="#crearRegistro" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear registro</a>

        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>