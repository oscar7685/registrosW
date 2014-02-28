$(function() {
    //location = "/sap/#inicio";
    
    $("#formulario_login").validate({
        errorLabelContainer: ".alert-error",
        submitHandler: function() {
            console.log("esta bn");
        
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
                                alert("error de ingreso!!!");
                            }

                        }
                    }

                });



            }, 400);

        }
    });
    });