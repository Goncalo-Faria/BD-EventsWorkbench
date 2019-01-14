package Neo4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class Neo4JWriter {

    private final String url;

    public Neo4JWriter(String user, String password, String ip){
        url = "jdbc:neo4j:bolt://" + ip + "?username="+user+",password="+password+",routing:policy=EU";
    }

    public void write(List<Neo4JDataFormat> rels){
        try {
            Class.forName("org.neo4j.jdbc.bolt.BoltDriver");
            Connection connection = DriverManager.getConnection(url);
            connection.setAutoCommit(false);

            for (Neo4JDataFormat i : rels) {
                Statement st = connection.createStatement();
                st.execute(i.createCommand());
            }
            connection.commit();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
