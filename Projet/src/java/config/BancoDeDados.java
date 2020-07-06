package config;

import classes.Question;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class BancoDeDados implements ServletContextListener {

    public static final String JDBC_URL = "jdbc:sqlite:C:\\Users\\prisc\\Downloads\\Projeto-de-POO---Quiz-master (7)\\Projeto-de-POO---Quiz-master\\Projet\\banco.db";
    public static final String CLASS_NAME = "org.sqlite.JDBC";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = DriverManager.getConnection(JDBC_URL);
            Statement stmt = con.createStatement();

            String query;

            query = "CREATE TABLE IF NOT EXISTS question("
                    + "pergunta VARCHAR(200) NOT NULL,"
                    + "resposta VARCHAR(50) NOT NULL"
                    + ")";
            stmt.executeUpdate(query);

            if (Question.listaQuestoes().isEmpty()) {
                query = "INSERT INTO question VALUES ('1 - Uma hora possui quantos segundos?', '60')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('2 - Quantas faces tem um cubo?', '6 ')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('3 - No meu jardim existem 3 pés de alface, 1 de pepino e 5 de cenoura. Quantos pés eu tenho no total?', '2')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('4 - Meu avô tem 5 filhos, cada filho tem 3 filhos. Quantos primos eu tenho?', '12')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('5 - Uma mãe tem 30 reais para dividir entre duas filhas. Qual o horário?', '13:45')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('6 - Se 3 gatos matam 3 ratos em 3 minutos, quanto tempo levarão 100 gatos para matar 100 ratos?', '3')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('7 - Em um dado a soma dos lados opostos é sempre o mesmo valor. O número da face oposta à face que contém o 1 é?', '6')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('8 - Assinale o valor de X da seguinte sequência: 0, 1, 3, 6, X, 15, 21, 28:', '10')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('9 - Imagine que em sua frente vão caminhando duas mães, duas filhas, uma avó e uma neta. Quantas pessoas são?', '3')";
                stmt.executeUpdate(query);

                query = "INSERT INTO question VALUES ('10 - Quantos noves existem entre 0 e 100?', '20')";
                stmt.executeUpdate(query);
            }

            query = "CREATE TABLE IF NOT EXISTS quiz("
                    + "nome VARCHAR(200) NOT NULL,"
                    + "resultado INTEGER NOT NULL,"
                    + "data VARCHAR(50) NOT NULL"
                    + ")";
            stmt.executeUpdate(query);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

}
