package classes;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class Quiz {

    private String usuario;
    private int resultado;
    private String data;

    public Quiz(String usuario, int result, String date) {
        this.usuario = usuario;
        this.resultado = result;
        this.data = date;
    }

    public static void adicionaResultado(String usuario, int resultado) throws Exception {
        Class.forName(config.BancoDeDados.CLASS_NAME);

        Connection con = DriverManager.getConnection(config.BancoDeDados.JDBC_URL);
        String SQL = "INSERT INTO quiz VALUES(?,?,?)";

        PreparedStatement stmt = con.prepareStatement(SQL);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        String data = formatter.format(date);

        stmt.setString(1, usuario);
        stmt.setInt(2, resultado);
        stmt.setString(3, data);

        stmt.execute();

        stmt.close();
        con.close();
    }

    public String getUser() {
        return usuario;
    }

    public void setUser(String user) {
        this.usuario = user;
    }

    public int getResult() {
        return resultado;
    }

    public void setResult(int result) {
        this.resultado = result;
    }

    public String getDate() {
        return data;
    }

    public void setDate(String date) {
        this.data = date;
    }

}
