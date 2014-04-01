<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li>
                    Acreditaciones <span class="divider"></span>
                </li>
                <li>
                    Listado
                </li>
            </ul>
            <h3 style="margin: 0;">Listado de  Acreditaciones</h3>
            <c:choose>
                <c:when test="${fn:length(listaA)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span1">Resolucion</th>    
                        <th class="span8">Fecha Vencimiento</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaA}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.resolucion}"/>
                                    </td>
                                    <td>   
                                        <fmt:formatDate pattern='dd/MM/yyyy' value='${row.fechaVencimiento}' />
                                    </td>
                                    <td class="span2">
                                        <a href="#editarAcreditacion&${row.idacreditacion}" title="Editar"><i class="glyphicon glyphicon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen acreditaciones registradas en el sistema para esta facultad.
                </c:otherwise>
            </c:choose>

            <a href="#crearAcreditacion" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear acreditaci&oacute;n</a>

        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>