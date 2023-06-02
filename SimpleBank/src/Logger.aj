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
    	
    pointcut successTransaction() : call (*moneyMakeTransaction*(..));
    after() successTransaction() {
    	
    	String mensaje = "*** Transaccion exitosa - ***"+ cal.getTime();
    	System.out.println(mensaje);
    	///wrtieLog(mensaje,file)
    	
    	
    	
    }
    }
}
    



