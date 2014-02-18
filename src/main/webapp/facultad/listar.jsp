<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="breadcrumb">
                <li>
                    Facultades <span class="divider"></span>
                </li>
                <li>
                    Listado
                </li>
            </ul>
            <h3 style="margin: 0;">Listado de  Facultades</h3>
            <c:choose>
                <c:when test="${fn:length(listaF)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span1">C&oacute;digo</th>    
                        <th class="span8">Factor</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaF}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.idfacultad}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                    <td class="span2">
                                        <a href="#editarFacultad&${row.idfacultad}" title="Editar"><i class="glyphicon glyphicon-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen facultades registrados en el sistema.
                </c:otherwise>
            </c:choose>

            <a href="#crearFacultad" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear facultad</a>

        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>