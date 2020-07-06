<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="classes.Quiz"%>
<%@page import="classes.Question"%>
<%@page import="config.BancoDeDados"%>
<%@page import="java.util.ArrayList"%>


<%

    String name = "";
    int count = 0;
    String usuarioLogado = null;

    if (request.getParameter("btnUsuario") != null) {
        String nomeUsuario = request.getParameter("inputUsuario");
        session.setAttribute("nomeSessao", nomeUsuario);

        name = nomeUsuario;
    }

    if (request.getParameter("logout") != null) {
        session.removeAttribute("nomeSessao");
        response.sendRedirect("index.jsp");
    }
      

    if (session.getAttribute("nomeSessao") != null) {
        usuarioLogado = session.getAttribute("nomeSessao").toString();
    }


    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Conhecimentos de Matemática</title>
        <style>
            body {
                background-color: whitesmoke;
                margin-top: 25px;
            }            
            h1,h2,h3,p,form,table {margin-left: 30px}
            #top10 {float: right}
            main {width: 990px; 
                  margin: -1px auto 25px;
                  border-radius: 40px; 
                  background-color: #87a9bf}
            .espaço{
                width:920px;
                margin:0 auto;
                padding: 15px;
            }
            .btn{
                width: 100px;
                padding:10px;
                background-color: white;
                color:green;
                border-radius: 5px;
            }
            input{
               width: 100px;
               padding:10px; 
               border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <div class="espaço">
            <main>
                <%@include file="WEB-INF/jspf/navbar.jspf" %>


                <h2>Avalie seu conhecimento!</h2>

                <%if (session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {%>
                <form >
                    Entrar:
                    <input type="text" placeholder="Nome" name="inputUsuario" required>
                    <button type="submit" name="btnUsuario" class="btn">Começar</button>
                </form>
                <br>
                <%} else {%>

                <p>Olá <%=name%>. Seja Bem Vindo ao Teste de Matemática!</p>
                <form>
                    <input name="logout" type="submit" value="Sair" class="btn">
                </form>


                 <br><br><br><br>
                <% }%>
            </main>
        </div>
                
    </body>

    <%@include file="WEB-INF/jspf/rodapé.jspf" %>

</html>
