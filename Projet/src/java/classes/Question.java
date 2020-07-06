package classes;

import config.BancoDeDados;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

public class Question {

    private String pergunta;
    private String resposta;

    public Question(String pergunta, String resposta) {
        this.pergunta = pergunta;
        this.resposta = resposta;
    }

    public static ArrayList<Question> listaQuestoes() throws ClassNotFoundException, SQLException {
        ArrayList<Question> list = new ArrayList<>();

        Class.forName(BancoDeDados.CLASS_NAME);

        Connection con = DriverManager.getConnection(BancoDeDados.JDBC_URL);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from question");

        while (rs.next()) {
            list.add(new Question(rs.getString("pergunta"), rs.getString("resposta")));
        }

        rs.close();
        stmt.close();
        con.close();

        return list;
    }

    public static String geraNumeroRandom(String questao) {
        Random random = new Random();

        int num1 = random.nextInt(100) + 1;
        int num2 = random.nextInt(59) + 1;

        if (questao.contains("5 -")) {
            return num1 + ":" + num2;
        }

        return String.valueOf(num1);
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

}
