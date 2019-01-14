import Neo4j.Neo4JDataFormat;
import Neo4j.Neo4JNode;
import Neo4j.Neo4JRelation;
import Neo4j.Neo4JWriter;
import RelationalDB.EventsWorkbenchGetter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Migrator {


    public static void main(String[] args){

        try {
            EventsWorkbenchGetter wb = new EventsWorkbenchGetter(args[0],args[1],args[2]);
            Neo4JDataFormat.setInsertSize(10);
            Neo4JDataFormat.setConnection(args[3],args[4],args[5]);

            List<String> eventlist = new ArrayList<>();
            eventlist.add("id");eventlist.add("nome");//eventlist.add("preco");
            transfer_table(eventlist, wb.evento(),"Evento");

            List<String> orglist = new ArrayList<>();
            orglist.add("id");orglist.add("nome");orglist.add("email");
            transfer_table(orglist, wb.organizador(),"Organizador");

            List<String> divlist = new ArrayList<>();
            divlist.add("id");divlist.add("tipo");divlist.add("preco");
            transfer_table(divlist, wb.divulgacao(),"Divulgacao");

            List<String> partlist = new ArrayList<>();
            partlist.add("id");partlist.add("nome");partlist.add("email");partlist.add("telemovel");
            partlist.add("genero");partlist.add("nif");partlist.add("DataDeNascimento");
            transfer_table(partlist,wb.participante(),"Participante");

            List<String> participalist = new ArrayList<>();
            participalist.add("preco");
            transfer_relationship(participalist, wb.participa(),
                    "Participa", "Participante",
                    "Evento");

            transfer_relationship(new ArrayList<>(), wb.organiza(),
                    "Organiza", "Organizador",
                    "Evento");

            transfer_relationship(new ArrayList<>(), wb.divulga(),
                    "Divulga", "Divulgacao",
                    "Evento");

            transfer_relationship(new ArrayList<>(), wb.influencia(),
                    "Influencia", "Divulgacao",
                    "Participante");

            wb.termina();
            Neo4JDataFormat.closeConnection();


        }catch(SQLException|InterruptedException a ){
            System.out.println(a.getMessage());

        }catch(ClassNotFoundException b){
            System.out.println(" Driver error ");
        }
    }

    private static void transfer_relationship(List<String> atributes, ResultSet table,
                                              String relationship, String from ,
                                              String to) throws SQLException{
        while(table.next())
            Neo4JDataFormat.queue(fillrelationship(atributes ,table ,relationship ,
                    from ,to ));
    }

    private static void transfer_table(List<String> atributes, ResultSet table,
                                       String nodetype) throws SQLException{
        while(table.next())
            Neo4JDataFormat.queue(fillnode(atributes, table, nodetype));
    }

    private static Neo4JRelation fillrelationship(List<String> atributes,
                                                  ResultSet table, String relationship, String from,
                                                  String to) throws SQLException{

        Neo4JRelation rel = new Neo4JRelation(relationship,
                from, table.getString(1) ,
                to, table.getString(2));

        int col = table.getMetaData().getColumnCount();

        for (int i = 3; i <= col; i++)
            rel.addAtribute(atributes.get(i - 3), table.getString(i));

        return rel;
    }

    private static Neo4JNode fillnode(List<String> atributes,
                                      ResultSet table, String node) throws SQLException{
        Neo4JNode neo = new Neo4JNode(node);
        int col = table.getMetaData().getColumnCount();

        for (int i = 1; i <= col; i++)
            if(atributes.get(i - 1).equals("id") || atributes.get(i - 1).equals("preco"))
                neo.addAtribute(atributes.get(i - 1), table.getString(i));
            else
                neo.addAtribute(atributes.get(i - 1), " '" + table.getString(i) + "' ");


        return neo;
    }
}
