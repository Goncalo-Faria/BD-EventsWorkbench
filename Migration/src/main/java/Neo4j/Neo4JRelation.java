package Neo4j;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Classe Generica para criar script de criaçao de arcos no Neo4j
 * */
public class Neo4JRelation {
    private String reltype;
    private Map<String,String> relatributes = new HashMap();
    private String originNodeType;
    private String idOri;
    private String destNodeType;
    private String idDest;

    public Neo4JRelation(String reltype, String originNodeType, String idOri, String destNodeType, String idDest) {
        this.reltype = reltype;
        this.originNodeType = originNodeType;
        this.idOri = idOri;
        this.destNodeType = destNodeType;
        this.idDest = idDest;
    }

    public void addRelationAtribute(String type, String attribute){
        relatributes.put(type,attribute);
    }

    public String createLigacaoString(){
        StringBuilder sb = new StringBuilder();
        sb.append("MATCH (ori:" +originNodeType+ " {id:"+idOri+"})\n");
        sb.append("MATCH (dest:" +destNodeType+ " {id:"+idDest+"})\n");
        sb.append("Create (ori) -[:" +reltype +"");
        if (relatributes.size() > 0){
            sb.append(" {") ;
            boolean comma = false;
            for (Entry<String,String> e: relatributes.entrySet()) {
                if(!comma)
                    comma = true;
                else
                    sb.append(",");
                sb.append(e.getKey());
                sb.append(":");
                sb.append(e.getValue());

            }
            sb.append("}");
        }
        sb.append("]-> (dest)");
        return sb.toString();
    }

}
