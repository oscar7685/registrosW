<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li>
                    Decanos <span class="divider"></span>
                </li>
                <li>
                    Listado
                </li>
            </ul>
            <h3 style="margin: 0;">Listado de  Decanos</h3>
            <c:choose>
                <c:when test="${fn:length(listaD)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span1">C&oacute;digo</th>    
                        <th class="span4">Nombre</th>
                        <th class="span4">Apellidos</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaD}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.cedula}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.nombres}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.apellidos}"/>
                                    </td>
                                    <td class="span2">
                                        <a href="#editarDecano&${row.cedula}" title="Editar"><i class="glyphicon glyphicon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen decanos registrados en el sistema.
                </c:otherwise>
            </c:choose>

            <a href="#crearDecano" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear decano</a>

        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>