package Neo4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Neo4JWriter {
    private Connection connection;

    public Neo4JWriter(String user, String password, long port) throws ClassNotFoundException, SQLException{
        Class.forName("org.neo4j.jdbc.bolt.BoltDriver");
        connection = DriverManager.getConnection("jdbc:neo4j:bolt://localhost:"+ port +"?username="+user+",password="+password+",routing:policy=EU");
        connection.setAutoCommit(false);
    }

    public void createEntradas(Neo4JNode n[]){
        try {
            for (int i = 0; i < n.length; i++) {
                Statement st = connection.createStatement();
                st.execute(n[i].createString());
            }
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createLigacoes(Neo4JRelation rels[]){
        try {

            for (int i = 0; i < rels.length; i++) {
                Statement st = connection.createStatement();
                st.execute(rels[i].createLigacaoString());
            }
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
