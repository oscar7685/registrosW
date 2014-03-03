$(function() {
    var urlx;


    location = "/registrosW/#inicio";
    $(document).ajaxStart(function() {
        $("div.ui-layout-center").append("<div id='contenido'></div>");
        $(".spinner").show();
        //http://tobiasahlin.com/spinkit/
        //var lodedSize = 0;
        //var number_of_media = $("body img").length;
        // function for the progress bar



    });
    $(document).ajaxComplete(function() {
        //$("#dancing-dots-text").remove();
        setTimeout(function() {
            $(".spinner").hide();
        }, 500);



    });




    var myLayout;
    myLayout = $('body').layout({
        //	enable showOverflow on west-pane so CSS popups will overlap north pane
        west__size: 270
        , center__paneSelector: ".ui-layout-center"
        , north__paneClass: "ui-layout-pane2"
                //	reference only - these options are NOT required because 'true' is the default
        , closable: true	// pane can open & close
        , resizable: false	// when open, pane can be resized 
        , slidable: false	// when closed, pane can 'slide' open over other panes - closes on mouse-out
        , north__size: 1
        , north__closable: false
        , north__maxSize: 1
        , north__slidable: false	// OVERRIDE the pane-default of 'slidable=true'
        , north__spacing_open: 0		// no resizer-bar when open (zero height)
        , south__resizable: false	// OVERRIDE the pane-default of 'resizable=true'
        , south__closable: false
        , south__spacing_open: 0		// no resizer-bar when open (zero height)
        , west__spacing_open: 0
        , west__spacing_closed: 20
        , west__togglerLength_closed: 35
        , west__togglerAlign_closed: "top"
        , west__togglerContent_closed: "<button id='west-open' class='close' style='float:left;margin-left:4px;opacity:1;margin-top:-10px;'>&raquo;</button>"
        , west__togglerTip_closed: "Mostrar menú"
        , west__togglerTip_open: "Ocultar menú"
        , west__enableCursorHotkey: false
        , west__onclose_end: function() {
            $("#conte").removeClass("span10").addClass("span12");
        }
        , west__onopen_end: function() {
            $("#conte").removeClass("span12").addClass("span10");
        }
        , south__paneClass: "ui-layout-pane"
        , west__togglerContent_open: ""
        , west__minSize: 200
        , west__maxSize: 350


    });
    myLayout.allowOverflow('north');
    // setTimeout( myLayout.resizeAll, 1000 ); /* allow time for browser to re-render with new theme */
    // save selector strings to vars so we don't have to repeat it
    // must prefix paneClass with "body > " to target ONLY the outerLayout panes
    // myLayout.addCloseBtn("#west-closer", "west");




    var actualizaEnlaces = function(hash) {
        $(".nav li > a").removeClass("active");
        $("a[href='" + hash + "']").addClass("active");
    };


    var hash;
    $(window).hashchange(function() {
        hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('/registrosW/Login?action=CerrarSesion', function() {
                location = "/registrosW";

            });//fin post

        } else {
            if (hash === "#inicio" || hash === "#listarFacultades" || hash === "#listarProgramas" || hash === "#listarDecanos"
                    || hash === "#listarRegistros" || hash === "#crearFacultad"
                    || hash === "#crearPrograma" || hash === "#crearRegistro" || hash === "#crearDecano") {
                var url3 = "/registrosW/" + hash;
                url3 = url3.replace('#', "Controlador?action=") + "";
                setTimeout(function() {
                    $("#progressBar").css("opacity", "1");
                    $({property: 0}).animate({property: 100}, {
                        duration: 1000,
                        step: function() {
                            var newWidth = Math.round(this.property);
                            $("#progressBar").width(newWidth + '%');
                        }
                    });
                }, 500);

                $("div.ui-layout-center").empty();
                $.ajax({
                    type: "POST",
                    url: url3,
                    success: function(data)
                    {
                        $("#contenido").append(data);
                        $("#contenido").show(500, function() {
                            actualizaEnlaces(hash);

                        });
                        setTimeout(function() {
                            $("#progressBar").css("opacity", "0");
                        }, 1000);
                        setTimeout(function() {
                            $("#progressBar").css("width", "0%");
                        }, 2000);

                    } //fin success

                }); //fin del $.ajax
            } else {
                if (hash.indexOf("#editarFacultad") !== -1 || hash.indexOf("#editarPrograma") !== -1
                        || hash.indexOf("#editarRegistro") !== -1 || hash.indexOf("#editarDecano") !== -1) {
                    var cual = hash.split("&");
                    hash = cual[0];
                    var url3 = "/registrosW/Controlador?action=";
                    url3 = url3.concat(cual[0].substring(1), "&id=", cual[1]);
                    $("div.ui-layout-center").empty();
                    $.ajax({
                        type: "POST",
                        url: url3,
                        success: function(data)
                        {
                            $("#contenido").append(data);
                            actualizaEnlaces();
                            $("#contenido").show(200, function() {
                            });
                        } //fin success
                    }); //fin del $.ajax
                }

            }


        }


    });
});
