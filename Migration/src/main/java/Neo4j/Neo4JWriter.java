package Neo4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class Neo4JWriter {
    private Connection connection;

    public Neo4JWriter(String user, String password, long port) throws ClassNotFoundException, SQLException{
        Class.forName("org.neo4j.jdbc.bolt.BoltDriver");
        connection = DriverManager.getConnection("jdbc:neo4j:bolt://localhost:"+
                port +"?username="+user+",password="+password+",routing:policy=EU");
        connection.setAutoCommit(false);
    }

    public void createEntradas(List<Neo4JNode> n){
        try {
            for (Neo4JNode i : n) {
                Statement st = connection.createStatement();
                st.execute(i.createString());
            }
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createLigacoes(List<Neo4JRelation> rels){
        try {

            for (Neo4JRelation i : rels) {
                Statement st = connection.createStatement();
                st.execute(i.createLigacaoString());
            }
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void termina() throws SQLException{
        this.connection.close();
    }
}
