package Neo4j;


import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;


public abstract class Neo4JDataFormat implements Runnable{
    private static final Queue<Neo4JDataFormat> q = new LinkedList();
    private static int n = 10;
    private static int threadcount = 1;
    private static List<Thread> th = new LinkedList<>();
    private static Neo4JWriter w;
    private static AtomicBoolean operating = new AtomicBoolean(true);

    public static void setInsertSize(int n){
        Neo4JDataFormat.n = n;
    }

    public static void setThreadCount(int n){
        Neo4JDataFormat.threadcount = n;
    }

    public static void setConnection(String user, String password,
                                     String ip) throws InterruptedException {
        closeConnection();

        operating.set(true);

        w = new Neo4JWriter(user,password,ip);

        for(int i=0; i< n; i++) {
            Thread t = new Thread(new Neo4JNode("empty"));
            th.add(t);
            t.start();
        }
    }

    public static void closeConnection() throws InterruptedException{

        operating.set(false);

        synchronized(q) {
            q.notifyAll();
        }

        for(Thread t : th)
            t.join();

        q.clear();
    }

    public static void queue(Neo4JDataFormat a){
        synchronized (q){
            q.add(a);
        }
    }

    private final String name;
    private final Map<String,String> atributes = new HashMap();

    Neo4JDataFormat(String name){
        this.name = name;
    }

    Map<String,String> get_atributes(){
        return new HashMap<>(atributes);
    }

    String getType(){
        return this.name;
    }

    public abstract String createCommand();

    public void addAtribute(String type, String attribute){
        atributes.put(type,attribute);
    }

    public void run(){

        try {
            while(operating.get()){
                List<Neo4JDataFormat> l = new ArrayList<>();
                synchronized (q) {
                    while (q.isEmpty() && operating.get())
                        q.wait();


                    Iterator<Neo4JDataFormat> it = q.iterator();
                    for(int i = 0; i < threadcount; i++){
                        if(it.hasNext()){
                            l.add(it.next());
                            it.remove();
                        }else {
                                break;
                        }
                    }
                }
                w.write(l);
            }

        }catch (InterruptedException e){
            System.out.println(" worker terminated ");
        }

    }
}
