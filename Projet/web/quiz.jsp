<%@page import="classes.Quiz"%>
<%@page import="classes.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="config.BancoDeDados"%>

<%
    boolean teste_enviado = false;
    int count = 0;
    int media = 0;

    ArrayList<Question> list = new ArrayList<>();
    list = Question.listaQuestoes();

    String name = (String) session.getAttribute("nomeSessao");

    if (session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {
        response.sendRedirect("index.jsp");
    }

    if (request.getParameter("teste_enviado") != null) {
        count = 0;

        for (Question q : list) {
            String resposta = request.getParameter(q.getPergunta());

            if (q.getResposta().equals(resposta)) {
                count++;
                media = (count/list.size())*100;
            }
        }
        
        media = (count/list.size())*100;
        teste_enviado = true;
        Quiz.adicionaResultado(name, count);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz - Teste de Matemática</title>

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
                background-color: white;
            }
            .otimo {
                color: blue;
                text-align: center;}
            .bom{
                color:green;
                text-align: center;}
            .ruim{
                color:red;
                text-align: center;}
            
            .btn{
                width: 100px;
                padding:10px;
                background-color: #90EE90;}

        </style>
    </head>
    <body>
        <div class="espaço">
        <main>
            <%@include file="WEB-INF/jspf/navbar.jspf" %>


            <center>
                <h1>Quiz de Matemática - Teste seu conhecimento</h1><br>
            </center>

             <center>
            <% if (teste_enviado) {%>

            <%if (count == 10) {%> <h2 class="otimo">Parabéns, Você foi Ótimo! Acertou: <%=media%>%</h2><span>&#x1F44F;&#x1F44F;&#x2714;&#x1F44F;&#x1F44F;</span><% }%>

            <%if (count >= 6 && count < 10) {%> <h2 class="bom"> Parabéns, Você foi Bom! acertou: <%=media%>% </h2><span>&#x1F44D;&#x1F44D;&#x1F604</span> <% }%>

            <%if (count < 6) {%> <h2 class="ruim">Infelizmente, acertou <%=count%> questões</h2> <span>&#x1F614;&#x1F614;&#x1F614</span> <% }%>

            <%if (count == 0) {%> <h2 class="ruim">Você foi Ruim! Estude mais!<%=media%>%</h2> <span>&#x274C;&#x1F44E;&#x274C</span> <% }%>

            <% } else {%>
            </center>

            <form>
                <% for (Question q : list) {%>
                <p><%= q.getPergunta()%> </p>

                <input type="radio" name="<%=q.getPergunta()%>" value="<%=q.getResposta()%>"> <%=q.getResposta()%>
                <input type="radio" name="<%=q.getPergunta()%>" value="<%=q.geraNumeroRandom(q.getPergunta())%>"> <%=q.geraNumeroRandom(q.getPergunta())%>
                <input type="radio" name="<%=q.getPergunta()%>" value="<%=q.geraNumeroRandom(q.getPergunta())%>"> <%=q.geraNumeroRandom(q.getPergunta())%>
                <%}%>

                <center>
                    <input type="submit" name="teste_enviado" value="Enviar" class="btn" >
                </center>
            </form>
            <% }%>

        </main>
      </div>
    </body>
    <%@include file="WEB-INF/jspf/rodapé.jspf" %>
</html>
