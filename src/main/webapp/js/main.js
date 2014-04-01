$(function() {
    //location = "/sap/#inicio";
    $("#formulario_login").validate({
        submitHandler: function() {
            this.timer = setTimeout(function() {
                $.ajax({
                    url: '/registrosW/Login',
                    data: 'un=' + $('#username').val() + '&pw=' + $('#password').val() + '&tp=' + $('#perfilIngreso :selected').val(),
                    type: 'post',
                    success: function(msg) {

                        if (msg == 0)
                        {
                            document.location = '/registrosW/';


                        } else {
                            if (msg == 1) {

                            }

                        }
                    }

                });



            }, 400);

        }
    });
    $('#formulario_login input').each(function() {
        $(this).rules('add', {
            messages: {
                required: '<div class="error"><span>+</span></div>'
            }
        });
    });
    $('#enlaceAcercaDe').click(function() {
        $('#ModalAcercaDe').modal("show");
    });
});