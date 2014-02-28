<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    .grave ,.grave2{
        background-color:#FF0000 !important;
    }
    .naranja, .espera{
        background-color: orange !important;
    }
    .bien{
        background-image: url('css/images/checked.png');
        background-color: #D7F8AC !important;
        background-position: right bottom;
        background-repeat: no-repeat;
    }
</style>
<script type="text/javascript">
    $(function() {
        $('.espera').tooltip({
            placement: "top",
            container: "body",
            title: "Vencido, A la espera de renovación del registro calificado"
        });
        $('.naranja').tooltip({
            placement: "top",
            container: 'body',
            title: 'Vencido, comenzó el proceso pero aun no termina'
        });
        $('.grave').tooltip({
            placement: "top",
            container: 'body',
            title: 'Vencido, No ha comenzado el proceso'
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
                    Listado
                </li>
            </ul>
            <c:choose>
                <c:when test="${usuario.tipo=='Decano'}">
                    <h3 style="margin: 0;">Listado de  Programas - ${usuario.facultadIdfacultad.nombre}</h3>
                </c:when>
            </c:choose>
            
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
                                        <c:choose>
                                            <c:when test="${usuario.tipo=='Centro Autoevaluación'}">
                                                <a href="#editarPrograma&${row.idprograma}" title="Editar Programa">${row.nombre}</a>
                                            </c:when>
                                            <c:otherwise>
                                                ${row.nombre}
                                            </c:otherwise>
                                        </c:choose>


                                    </td>
                                    <td> 
                                        <a href="#editarRegistro&${row.getUltimoRegistro().idregistro}" title="Editar Registro">${row.getUltimoRegistro().resolucion}</a>
                                    </td>

                                    <fmt:formatDate value="${row.getUltimoRegistro().fechaVencimiento}" pattern="dd/MM/yyyy" var="vencimiento" />
                                    <!--fecha de vencimiento-->
                                    <c:choose>
                                        <c:when test="${row.comparar(row.getUltimoRegistro().fechaVencimiento,fechaActual)  && row.getUltimoRegistro().radicacion==null}">
                                            <td class="grave2">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                            </c:when>
                                            <c:when test="${row.comparar(row.getUltimoRegistro().fechaVencimiento,fechaActual)  && row.getUltimoRegistro().radicacion!=null}">
                                            <td class="espera">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                            </c:when>        
                                            <c:otherwise>
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <!--primera autoevaluacion--->
                                    <fmt:formatDate value="${row.getUltimoRegistro().inicioDos}" pattern="dd/MM/yyyy" var="final1" />
                                    <fmt:formatDate value="${row.getUltimoRegistro().inicioUno}" pattern="dd/MM/yyyy" var="inicio1" />
                                    <fmt:formatDate value="${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}" pattern="dd/MM/yyyy" var="fechaLimite1" />

                                    <c:choose>
                                        <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && inicio1==null }">
                                            <td class="grave">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && final1!=null }">
                                            <td class="bien">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && inicio1!=null  && final1==null }">
                                            <td class="naranja">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                            </c:when>    
                                            <c:otherwise>
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <!--segunda autoevaluacion-->
                                    <fmt:formatDate value="${row.getUltimoRegistro().finaDos}" pattern="dd/MM/yyyy" var="final2" />
                                    <fmt:formatDate value="${row.getUltimoRegistro().finaUno}" pattern="dd/MM/yyyy" var="inicio2" />
                                    <c:choose>
                                        <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && inicio2==null }">
                                            <td class="grave">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && final2!=null }">
                                            <td class="bien">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && final1!=null  && final2==null }">
                                            <td class="naranja">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                            </c:when>    
                                            <c:otherwise>
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <!--presentacion en la oficina de autoevaluacion-->
                                    <c:choose>
                                        <c:when test="${row.comparar(row.getUltimoRegistro().unAnioAntes(),fechaActual) && row.getUltimoRegistro().presentacionAuto==null}">
                                            <td class="grave2">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                            </c:when>
                                            <c:when test="${row.getUltimoRegistro().presentacionAuto!=null}">
                                            <td class="bien">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(fechaActual,row.getUltimoRegistro().unAnioAntes())}">
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                            </c:when>    
                                        </c:choose>

                                    </td>
                                    <!--presentacion en la oficina de autoevaluacion-->
                                    <c:choose>
                                        <c:when test="${row.comparar(row.getUltimoRegistro().diezMesesAntes(),fechaActual) && row.getUltimoRegistro().radicacion==null}">
                                            <td class="grave2">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                            </c:when>
                                            <c:when test="${row.getUltimoRegistro().radicacion!=null}">
                                            <td class="bien">
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                            </c:when>
                                            <c:when test="${row.comparar(fechaActual,row.getUltimoRegistro().diezMesesAntes())}">
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                            </c:when>    
                                        </c:choose>

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
            <c:choose><c:when test="${usuario.tipo=='Centro Autoevaluación'}">
                    <a href="#crearPrograma" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear programa</a>
                </c:when>
            </c:choose>  


        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable2.js"></script>