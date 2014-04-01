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
            <div data-toggle="buttons-radio" class="btn-group">
                <button class="btn grave" type="button">No ha hecho el proceso</button>
                <button class="btn naranja" type="button">Proceso comenzado y no terminado </button>
                <button class="btn bien" type="button">Proceso realizado</button>
            </div>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#registros" data-toggle="tab">Registros Calificados</a></li>
                <li><a href="#acreditaciones" data-toggle="tab">Acreditaciones</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="registros">
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

                                            <fmt:formatDate value="${row.getUltimoRegistro().fechaVencimiento}" pattern="yyyy/MM/dd" var="vencimiento" />
                                            <!--fecha de vencimiento-->
                                            <c:choose>
                                                <c:when test="${row.comparar(row.getUltimoRegistro().fechaVencimiento,fechaActual)  && row.getUltimoRegistro().radicacion==null}">
                                                    <td class="grave2">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                                    </c:when>
                                                    <c:when test="${row.comparar(row.getUltimoRegistro().fechaVencimiento,fechaActual)  && row.getUltimoRegistro().radicacion!=null}">
                                                    <td class="espera">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                                    </c:when>        
                                                    <c:otherwise>
                                                    <td>
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaVencimiento}' />    
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <!--primera autoevaluacion--->
                                            <fmt:formatDate value="${row.getUltimoRegistro().finaUno}" pattern="yyyy/MM/dd" var="final1" />
                                            <fmt:formatDate value="${row.getUltimoRegistro().inicioUno}" pattern="yyyy/MM/dd" var="inicio1" />
                                            <fmt:formatDate value="${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}" pattern="yyyy/MM/dd" var="fechaLimite1" />

                                            <c:choose>
                                                <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && inicio1==null }">
                                                    <td class="grave">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && final1!=null }">
                                                    <td class="bien">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(row.getUltimoRegistro().fechaPrimeraAutoevaluacion(),fechaActual) && inicio1!=null  && final1==null }">
                                                    <td class="naranja">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                                    </c:when>    
                                                    <c:otherwise>
                                                    <td>
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaPrimeraAutoevaluacion()}' />
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <!--segunda autoevaluacion-->
                                            <fmt:formatDate value="${row.getUltimoRegistro().finaDos}" pattern="yyyy/MM/dd" var="final2" />
                                            <fmt:formatDate value="${row.getUltimoRegistro().inicioDos}" pattern="yyyy/MM/dd" var="inicio2" />
                                            <c:choose>
                                                <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && inicio2==null }">
                                                    <td class="grave">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && final2!=null }">
                                                    <td class="bien">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(row.getUltimoRegistro().fechaSegundaAutoevaluacion(),fechaActual) && inicio2!=null  && final2==null }">
                                                    <td class="naranja">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                                    </c:when>    
                                                    <c:otherwise>
                                                    <td>
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().fechaSegundaAutoevaluacion()}' />
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <!--presentacion en la oficina de autoevaluacion-->
                                            <c:choose>
                                                <c:when test="${row.comparar(row.getUltimoRegistro().unAnioAntes(),fechaActual) && row.getUltimoRegistro().presentacionAuto==null}">
                                                    <td class="grave2">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                                    </c:when>
                                                    <c:when test="${row.getUltimoRegistro().presentacionAuto!=null}">
                                                    <td class="bien">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(fechaActual,row.getUltimoRegistro().unAnioAntes())}">
                                                    <td>
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().unAnioAntes()}' />
                                                    </c:when>    
                                                </c:choose>

                                            </td>
                                            <!--presentacion en la oficina de autoevaluacion-->
                                            <c:choose>
                                                <c:when test="${row.comparar(row.getUltimoRegistro().diezMesesAntes(),fechaActual) && row.getUltimoRegistro().radicacion==null}">
                                                    <td class="grave2">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                                    </c:when>
                                                    <c:when test="${row.getUltimoRegistro().radicacion!=null}">
                                                    <td class="bien">
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().diezMesesAntes()}' />
                                                    </c:when>
                                                    <c:when test="${row.comparar(fechaActual,row.getUltimoRegistro().diezMesesAntes())}">
                                                    <td>
                                                        <fmt:formatDate pattern='yyyy/MM/dd' value='${row.getUltimoRegistro().diezMesesAntes()}' />
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
                <div class="tab-pane" id="acreditaciones">
                    <c:choose>
                        <c:when test="${usuario.tipo=='Decano'}">
                            <h3 style="margin: 0;">Listado de  Programas - ${usuario.facultadIdfacultad.nombre}</h3>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${fn:length(listaP)!= 0}">
                            <table id="tablaX3" class="table table-striped table-bordered table-condensed">
                                <thead>
                                <th>Programa<input type="text" class="col-lg-10" value="" name="search_engine"></th>
                                <th >Resoluci&oacute;n Acreditaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_browser"></th>
                                <th >Fecha de Vencimiento<input type="text" class="col-lg-10" value="" name="search_platform"></th>
                                <th >Limite Autoevaluaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_version"></th>
                                <th >presentación al C. de Autoevaluaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_x1"></th>
                                <th >Fecha de Radicaci&oacute;n<input type="text" class="col-lg-10" value="" name="search_x2"></th>
                                </thead>

                                <tbody>
                                    <c:forEach items="${listaP}" var="row" varStatus="iter">
                                        <c:choose>
                                            <c:when test="${fn:length(row.acreditacionList)!= 0}">
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
                                                        <a href="#editarAcreditacion&${row.acreditacionList.get(0).idacreditacion}" title="Editar Acreditación">${row.acreditacionList.get(0).resolucion}</a>
                                                    </td>

                                                    <fmt:formatDate value="${row.acreditacionList.get(0).fechaVencimiento}" pattern="yyyy/MM/dd" var="vencimiento" />
                                                    <!--fecha de vencimiento-->
                                                    <c:choose>
                                                        <c:when test="${row.comparar(row.acreditacionList.get(0).fechaVencimiento,fechaActual)  && row.acreditacionList.get(0).radicacion==null}">
                                                            <td class="grave2">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaVencimiento}' />    
                                                            </c:when>
                                                            <c:when test="${row.comparar(row.acreditacionList.get(0).fechaVencimiento,fechaActual)  && row.acreditacionList.get(0).radicacion!=null}">
                                                            <td class="espera">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaVencimiento}' />    
                                                            </c:when>        
                                                            <c:otherwise>
                                                            <td>
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaVencimiento}' />    
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <!--primera autoevaluacion--->
                                                    <fmt:formatDate value="${row.acreditacionList.get(0).finaUno}" pattern="yyyy/MM/dd" var="final11" />
                                                    <fmt:formatDate value="${row.acreditacionList.get(0).inicioUno}" pattern="yyyy/MM/dd" var="inicio11" />
                                                    <fmt:formatDate value="${row.acreditacionList.get(0).fechaPrimeraAutoevaluacion()}" pattern="yyyy/MM/dd" var="fechaLimite11" />

                                                    <c:choose>
                                                        <c:when test="${row.comparar(row.acreditacionList.get(0).fechaPrimeraAutoevaluacion(),fechaActual) && inicio11==null }">
                                                            <td class="grave">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaPrimeraAutoevaluacion()}' />
                                                            </c:when>
                                                            <c:when test="${row.comparar(row.acreditacionList.get(0).fechaPrimeraAutoevaluacion(),fechaActual) && final11!=null }">
                                                            <td class="bien">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaPrimeraAutoevaluacion()}' />
                                                            </c:when>
                                                            <c:when test="${row.comparar(row.acreditacionList.get(0).fechaPrimeraAutoevaluacion(),fechaActual) && inicio11!=null  && final1==null }">
                                                            <td class="naranja">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaPrimeraAutoevaluacion()}' />
                                                            </c:when>    
                                                            <c:otherwise>
                                                            <td>
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).fechaPrimeraAutoevaluacion()}' />
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </td>

                                                    <!--presentacion en la oficina de autoevaluacion-->
                                                    <c:choose>
                                                        <c:when test="${row.comparar(row.acreditacionList.get(0).unAnioAntes(),fechaActual) && row.acreditacionList.get(0).presentacionAuto==null}">
                                                            <td class="grave2">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).unAnioAntes()}' />
                                                            </c:when>
                                                            <c:when test="${row.acreditacionList.get(0).presentacionAuto!=null}">
                                                            <td class="bien">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).unAnioAntes()}' />
                                                            </c:when>
                                                            <c:when test="${row.comparar(fechaActual,row.acreditacionList.get(0).unAnioAntes())}">
                                                            <td>
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).unAnioAntes()}' />
                                                            </c:when>    
                                                        </c:choose>

                                                    </td>
                                                    <!--presentacion en la oficina de autoevaluacion-->
                                                    <c:choose>
                                                        <c:when test="${row.comparar(row.acreditacionList.get(0).diezMesesAntes(),fechaActual) && row.acreditacionList.get(0).radicacion==null}">
                                                            <td class="grave2">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).diezMesesAntes()}' />
                                                            </c:when>
                                                            <c:when test="${row.acreditacionList.get(0).radicacion!=null}">
                                                            <td class="bien">
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).diezMesesAntes()}' />
                                                            </c:when>
                                                            <c:when test="${row.comparar(fechaActual,row.acreditacionList.get(0).diezMesesAntes())}">
                                                            <td>
                                                                <fmt:formatDate pattern='yyyy/MM/dd' value='${row.acreditacionList.get(0).diezMesesAntes()}' />
                                                            </c:when>    
                                                        </c:choose>

                                                    </td>
                                                </tr>
                                            </c:when>
                                        </c:choose>

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
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable3.js"></script>