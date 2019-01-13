package Neo4j;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
/**
 * Classe Generica para criar script de criaçao de nó no Neo4j
 * */
public class Neo4JNode {
    private String type;
    private Map<String,String> atributes = new HashMap();

    public Neo4JNode(String type) {
        this.type = type;
    }

    public void addAtribute(String type,String attribute){
        atributes.put(type,attribute);
    }

    public String createString(){
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE (:");
        sb.append(type);
        sb.append(" {");
        boolean comma = false;
        for (Entry<String,String> e: atributes.entrySet()) {
            if(!comma)
                comma = true;
            else
                sb.append(",");
            sb.append(e.getKey());
            sb.append(":");
            sb.append(e.getValue());
        }
        sb.append("})");
        return sb.toString();
    }

}
