<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fcbklistselection.css">
<script src="<%=request.getContextPath()%>/js/fcbklistselection.js" type="text/javascript"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        //id(ul id),width,height(element height),row(elements in row)        
        var $fcbklist = $('#fcbklist');
        var $listItems = $fcbklist.find('li');
        $.fcbkListSelection("#fcbklist", "600", "50", "3");
        $(".clearer").before('<input type="text" id="filter" class="input-medium search-query" placeholder="Buscar" style="padding-top: 0px; padding-bottom: 0px; float: right; border-right-width: 1px; padding-right: 14px; margin-right: 35px;">');
        $('#filter').keyup(function() {
            var $this = $(this);
            var val = $this.val();
            if (!val) {
                $this.data('lastVal', val);
                var $tabItems2;
                switch ($(".view_on").attr("id").replace("view_", "")) {
                    case "all":
                        $tabItems2 = $listItems;
                        break;
                    case "selected":
                        $tabItems2 = $listItems.filter('[addedid]');
                        break;
                    case "unselected":
                        $tabItems2 = $listItems.filter(':not([addedid])');
                        break;
                }
                $tabItems2.show();
                return;
            }

            var lastVal = $this.data('lastVal');
            $this.data('lastVal', val);
            /*** If the filter hasn't changed, do nothing ***/
            if (val === lastVal) {
                return;
            }

            /*** Hide the results of the previous filter ***/
            $listItems.filter(':visible').hide();
            /*** 
             Show only the items of the current tab that match 
             the filter. 
             ***/
            var $tabItems;
            switch ($(".view_on").attr("id").replace("view_", "")) {
                case "all":
                    $tabItems = $listItems;
                    break;
                case "selected":
                    $tabItems = $listItems.filter('[addedid]');
                    break;
                case "unselected":
                    $tabItems = $listItems.filter(':not([addedid])');
                    break;
            }
            $tabItems.filter(':icontains(' + val + ')').show();
        });
        /*** 
         This is a custom pseudo-selector that selects 
         elements whose text contains the specified substring. 
         It is case-insensitive, unlike the built-in :contains selector. 
         ***/
        $.extend($.expr[':'], {
            icontains: function(elem, i, match) {
                return (new RegExp(match[3], 'im')).test($(elem).text());
            }
        });
        var removeValue = function(obj) {
            var randid = obj.find("[type=hidden]").attr("randid");
            var inputid = elem.attr('id') + "_values";
            if ($("#" + inputid).length != 0) {
                try {
                    eval("json = " + $("#" + inputid).val() + ";");
                    var string = "{";
                    $.each(json, function(i, item) {
                        if (i && item && i != randid) {
                            string += "\"" + i + "\":\"" + item + "\",";
                        }
                    });
                    //remove last ,
                    if (string.length > 2) {
                        string = string.substr(0, (string.length - 1));
                        string += "}"
                    }
                    else {
                        string = "";
                    }
                    $("#" + inputid).val(string);
                }
                catch (e) {
                }
            }
        }
        var seleccionados = [];
        elem = $("#fcbklist");
        $.each(elem.children("li").children(".fcbklist_item"), function(i, obj) {
            obj = $(obj);
            if (obj.hasClass("itemselected")) {
                seleccionados.push(obj.find("[type=hidden]").attr("randid"));
            }

        })


        $("button[type='reset']").click(function() {

            elem = $("#fcbklist");
            $.each(elem.children("li").children(".fcbklist_item"), function(i, obj) {
                obj = $(obj);
                var encontrado = false;
                for (var i = 0; i < seleccionados.length && !encontrado; i++)
                {
                    if (obj.find("[type=hidden]").attr("randid") == seleccionados[i]) {
                        encontrado = true;
                    }

                }
                if (!encontrado) {
                    if (obj.hasClass("itemselected")) {
                        obj.find("input:hidden").val("0");
                        $("#view_selected_count").text(parseInt($("#view_selected_count").text(), 10) - 1);
                        obj.parents("li").removeAttr("addedid");
                        //removeValue(obj);
                        obj.removeClass("itemselected");
                        obj.parents("li").removeClass("liselected");
                    }

                } else {
                    if (!obj.hasClass("itemselected")) {
                        obj.find("input:hidden").val("1");
                        $("#view_selected_count").text(parseInt($("#view_selected_count").text(), 10) + 1);
                        obj.parents("li").attr("addedid", "tester");
                        obj.addClass("itemselected");
                        obj.parents("li").addClass("liselected");
                    }

                }
            });
        });
        $("#formEditarPrograma").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/registrosW/Controlador?action=editarPrograma2",
                    data: $("#formEditarPrograma").serialize(),
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
                    Editar
                </li>
            </ul>
            <form id="formEditarPrograma" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Programa</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value="${programa.idprograma}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre" class="control-label">Programa</label>
                        <div class="controls">
                            <textarea rows="3" name="nombre" id="nombre" class="input-xlarge {required:true}">${programa.nombre}</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="modalidad" class="control-label">Modalidad</label>
                        <div class="controls">
                            <select id="modalidad" name="modalidad" class="{required:true}">
                                <option value=""></option>    
                                <c:choose>
                                    <c:when test="${'Presencial' == programa.modalidad}">
                                        <option selected="selected" value="Presencial">Presencial</option>    
                                        <option value="Distancia">Distancia</option>    
                                    </c:when>
                                    <c:when test="${'Distancia' == programa.modalidad}">
                                        <option selected="selected" value="Distancia">Distancia</option>    
                                        <option value="Presencial">Presencial</option>    
                                    </c:when>
                                </c:choose>
                            </select>                
                        </div>
                    </div>    
                    <div class="control-group">
                        <label for="formacion" class="control-label">Tipo formacion</label>
                        <div class="controls">
                            <select id="formacion" name="formacion" class="{required:true}">
                                <option value=""></option>    
                                <c:choose>
                                    <c:when test="${'Postgrado' == programa.tipoFormacion}">
                                        <option selected="selected" value="Postgrado">Postgrado</option>    
                                        <option value="Pregrado">Pregrado</option>
                                    </c:when>
                                    <c:when test="${'Pregrado' == programa.tipoFormacion}">
                                        <option selected="selected" value="Pregrado">Pregrado</option>    
                                        <option  value="Postgrado">Postgrado</option>    
                                    </c:when>
                                </c:choose>
                            </select>                
                        </div>
                    </div>    
                    <div class="control-group">
                        <label for="facultad" class="control-label">Facultad</label>
                        <div class="controls">
                            <select id="facultad" name="facultad" class="{required:true}">
                                <option value=""></option>    
                                <c:forEach items="${listaF}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${row != programa.facultadIdfacultad}">
                                            <option value="${row.idfacultad}">${row.nombre}</option>    
                                        </c:when>
                                        <c:otherwise>
                                            <option selected="selected" value="${row.idfacultad}">${row.nombre}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>                
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label">Asignar Registros Calificados</label>
                        <div class="controls">
                            <ul id="fcbklist">
                                <c:forEach items="${listaR}" var="item" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${item.programaIdprograma != programa}">
                                            <li>
                                                <strong>${item.resolucion}</strong><br/> 
                                                <span class="fcbkitem_text">
                                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item.fechaInicio}' />
                                                </span>
                                                <input name="R${item.idregistro}" type="hidden" value="0"/>
                                            </li>

                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <strong>${item.resolucion}</strong><br/> 
                                                <span class="fcbkitem_text">
                                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item.fechaInicio}' />
                                                </span>
                                                <input name="R${item.idregistro}" type="hidden" checked="checked" value="0"/>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>     
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Guardar cambios</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>