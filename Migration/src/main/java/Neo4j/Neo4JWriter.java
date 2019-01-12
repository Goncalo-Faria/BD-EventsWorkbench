package Neo4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Neo4JWriter {
    String url;

    public Neo4JWriter(String user, String password) {
        url = "jdbc:neo4j:bolt://localhost:11001?username="+user+",password="+password+",routing:policy=EU";
    }

    public void createEntradas(Neo4JNode n[]){
        try {
            Class.forName("org.neo4j.jdbc.bolt.BoltDriver");
            Connection c = DriverManager.getConnection(url);
            c.setAutoCommit(false);
            for (int i = 0; i < n.length; i++) {
                Statement st = c.createStatement();
                st.execute(n[i].createString());
            }
            c.commit();
            c.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void createLigacoes(Neo4JRelation rels[]){
        try {
            Class.forName("org.neo4j.jdbc.bolt.BoltDriver");
            Connection c = DriverManager.getConnection(url);
            c.setAutoCommit(false);
            for (int i = 0; i < rels.length; i++) {
                Statement st = c.createStatement();
                st.execute(rels[i].createLigacaoString());
            }
            c.commit();
            c.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
