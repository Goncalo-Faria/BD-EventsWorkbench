package RelationalDB;

import java.sql.SQLException;

public class Test{
    public static void main(String[] args){

        try {
            EventsWorkbenchGetter wb = new EventsWorkbenchGetter("root","catarina");
            wb.termina();
        } catch (SQLException a) {
            System.out.println(a.getMessage());
        } catch (ClassNotFoundException b) {
            System.out.println("Driver error");
        }
    }
}