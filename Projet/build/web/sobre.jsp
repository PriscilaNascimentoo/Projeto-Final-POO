<%-- 
    Document   : Informação
    Created on : 23/06/2020, 12:16:53
    Author     : Priscila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações do Grupo</title>
        <style>
            main{width: 1000px;
                 margin: -1px auto 25px;
                 border-radius: 40px; 
                 background-color: #87a9bf}
            body {background-color: whitesmoke;}
             .espaço{
                width:920px;
                margin:0 auto;
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <div class="espaço">
            <main>
                <%@include file="WEB-INF/jspf/navbar.jspf" %>
                <center><h1> POO - Projeto Quiz</h1></center>

                <center>
                    
                </center>
                <center>
                    

                    <h1> Sobre a Aplicação</h1>
                    <p> Criamos este Quiz de teste Geografico para avaliar seus conhecimentos nessa matéria, e o quanto você está por dentro do assunto, quando falamos de Geografia. <br><br><br><br>
                    <h2> &nbsp O Grupo 08 é formado pelos seguintes integrantes:</h2>
                    <h2> <p>  Lucas Pereira dos Sant  -  Priscila Do Nascimento Silvaos </p>
                         </h2><br><br>
                </center>    
            </main>
        </div>
    </body>
      <%@include file="WEB-INF/jspf/rodapé.jspf" %>
</html>

