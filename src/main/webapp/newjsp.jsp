<%-- 
    Document   : newjsp
    Created on : 19/02/2014, 11:55:32 AM
    Author     : Ususario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .spinner {
                margin: 100px auto 0;
                width: 70px;
                text-align: center;
            }

            .spinner > div {
                width: 18px;
                height: 18px;
                background-color: #333;

                border-radius: 100%;
                display: inline-block;
                -webkit-animation: bouncedelay 1.4s infinite ease-in-out;
                animation: bouncedelay 1.4s infinite ease-in-out;
                /* Prevent first frame from flickering when animation starts */
                -webkit-animation-fill-mode: both;
                animation-fill-mode: both;
            }

            .spinner .bounce1 {
                -webkit-animation-delay: -0.32s;
                animation-delay: -0.32s;
            }

            .spinner .bounce2 {
                -webkit-animation-delay: -0.16s;
                animation-delay: -0.16s;
            }

            @-webkit-keyframes bouncedelay {
                0%, 80%, 100% { -webkit-transform: scale(0.0) }
                40% { -webkit-transform: scale(1.0) }
            }

            @keyframes bouncedelay {
                0%, 80%, 100% { 
                    transform: scale(0.0);
                    -webkit-transform: scale(0.0);
                } 40% { 
                    transform: scale(1.0);
                    -webkit-transform: scale(1.0);
                }
            }
        </style>
    </head>
    <body>
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </body>
</html>
