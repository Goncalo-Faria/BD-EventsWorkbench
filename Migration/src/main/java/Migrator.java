import Neo4j.Neo4JNode;
import Neo4j.Neo4JWriter;
import RelationalDB.EventsWorkbenchGetter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Migrator {

    private static Neo4JNode fillnode(List<String> atributes, ResultSet table, String node) throws SQLException{
        Neo4JNode neo = new Neo4JNode("node");
        int col = table.getMetaData().getColumnCount();

        while(table.next())
            for( int i = 1; i<=col ; i++ )
                neo.addAtribute( atributes.get(i-1) ,table.getString(i) );


            return neo;
    }


    public static void main(String[] args){

        try {
            EventsWorkbenchGetter wb = new EventsWorkbenchGetter("graf","sqluserpw");
            ResultSet table;
            Neo4JWriter nw = new Neo4JWriter("graf","sqluserpw");
            Neo4JNode[] an = new Neo4JNode[1];

            //
            List<String> eventlist = new ArrayList<>();
            eventlist.add("id");eventlist.add("nome");eventlist.add("preco");
            table = wb.evento();

            while(table.next()) {
                an[0] = fillnode(eventlist, table, "Evento");
                nw.createEntradas(an);
            }
            //<<<<
            //
            List<String> divlist = new ArrayList<>();
            divlist.add("id");divlist.add("tipo");divlist.add("custo");
            table = wb.divulgacao();

            while(table.next()) {
                an[0] = fillnode(divlist, table, "Divulgacao");
                nw.createEntradas(an);
            }
            //<<<<

            wb.termina();

        }catch(SQLException a ){
            System.out.println(a.getMessage());

        }catch(ClassNotFoundException b){
            System.out.println(" Driver error ");
        }
    }
}
