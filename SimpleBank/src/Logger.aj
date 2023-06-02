import java.util.*;
import java.io.File;
import java.io.FileWriter;
import java.nio.file.*;


public aspect Logger {
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	protected FileWriter escritura;
	
	
    pointcut creacionUsuario() : call(* create*(..) );
    after() : creacionUsuario() {
    	String lineaMensaje  = "** User created **   -" + cal.getTime();
    	System.out.println(lineaMensaje );
    	//writeLog(lineaMensaje ,file);
    	//System.out.println("** User created **");
    }
}
    



