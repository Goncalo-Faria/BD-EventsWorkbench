import Neo4j.Neo4JNode;
import Neo4j.Neo4JRelation;
import Neo4j.Neo4JWriter;
import RelationalDB.EventsWorkbenchGetter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Migrator {

    private static Neo4JNode fillnode(List<String> atributes, ResultSet table, String node) throws SQLException{
        Neo4JNode neo = new Neo4JNode(node);
        int col = table.getMetaData().getColumnCount();

        for (int i = 1; i <= col; i++)
            if(atributes.get(i - 1).equals("id") || atributes.get(i - 1).equals("preco"))
                neo.addAtribute(atributes.get(i - 1), table.getString(i));
            else
                neo.addAtribute(atributes.get(i - 1), " '" + table.getString(i) + "' ");


        return neo;
    }

    private static Neo4JRelation fillrelationship(List<String> atributes, ResultSet table, String reltype, String originNodeType,String destNodeType) throws SQLException{

        Neo4JRelation rel = new Neo4JRelation(reltype,
                originNodeType, table.getString(1) ,
                destNodeType, table.getString(2));

        int col = table.getMetaData().getColumnCount();

        for (int i = 3; i <= col; i++)
            rel.addRelationAtribute(atributes.get(i - 3), table.getString(i));

        return rel;
    }


    public static void main(String[] args){

        try {
            EventsWorkbenchGetter wb = new EventsWorkbenchGetter("graf","sqluserpw");
            ResultSet table;
            Neo4JWriter nw = new Neo4JWriter("graf","sqluserpw");
            Neo4JNode[] an = new Neo4JNode[1];
            Neo4JRelation[] bn = new Neo4JRelation[1];

            //evento
            List<String> eventlist = new ArrayList<>();
            eventlist.add("id");eventlist.add("nome");//eventlist.add("preco");
            table = wb.evento();

            while(table.next()) {
                an[0] = fillnode(eventlist, table, "Evento");
                nw.createEntradas(an);
            }
            //<<<<
            //organizacao
            List<String> orglist = new ArrayList<>();
            orglist.add("id");orglist.add("nome");orglist.add("email");
            table = wb.organizador();

            while(table.next()) {
                an[0] = fillnode(orglist, table, "Organizador");
                nw.createEntradas(an);
            }
            //<<<<
            //divulgacao
            List<String> divlist = new ArrayList<>();
            divlist.add("id");divlist.add("tipo");divlist.add("preco");
            table = wb.divulgacao();

            while(table.next()) {
                an[0] = fillnode(divlist, table, "Divulgacao");
                nw.createEntradas(an);
            }
            //<<<<
            //<<<<
            //participacao
            List<String> partlist = new ArrayList<>();
            partlist.add("id");partlist.add("nome");partlist.add("email");partlist.add("telemovel");partlist.add("genero");partlist.add("nif");
            table = wb.participante();

            while(table.next()) {
                an[0] = fillnode(partlist, table, "Participante");
                nw.createEntradas(an);
            }
            //<<<<
            //<<<<
            //participa
            List<String> participalist = new ArrayList<>();
            participalist.add("preco");
            table = wb.participa();

            while(table.next()){
                bn[0] = fillrelationship(participalist,table,"Participa","Participante","Evento");
                nw.createLigacoes(bn);
            }
            //<<<<
            //organiza
            table = wb.organiza();

            while(table.next()){
                bn[0] = fillrelationship(new ArrayList<>(),table,"Organiza","Organizador","Evento");
                nw.createLigacoes(bn);
            }
            //<<<<
            //<<<<
            //divulga
            table = wb.divulga();

            while(table.next()){
                bn[0] = fillrelationship(new ArrayList<>(), table,"Divulga","Divulgacao","Evento");
                nw.createLigacoes(bn);
            }
            //<<<<
            //<<<<
            //influencia
            table = wb.influencia();

            while(table.next()){
                bn[0] = fillrelationship(new ArrayList<>(), table,"Influencia","Divulgacao","Participante");
                nw.createLigacoes(bn);
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
