import java.util.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.*;

public aspect Logger {
	
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	protected FileWriter escritura;
	
	
    pointcut creacionUsuario() : call(* create*(..) );
    after() : creacionUsuario() {
    	String lineaMensaje  = "** User created **   -" + cal.getTime();
    	System.out.println(lineaMensaje );
    	writeLog(lineaMensaje ,file);
    	
    	
    }
    
    pointcut sucessTransaction() : call(* moneyMakeTransaction*(..) );
    after() : sucessTransaction() { 
    	String mensaje = "*** Transaccion exitosa - ***" + cal.getTime();
    	System.out.println(mensaje);
    	writeLog(mensaje,file);
    }
    
    pointcut successWithdraw() : call(* moneyWithdrawal*(..) );
    after() : successWithdraw() { 
    	String lineaMensaje  = "**** Retiro exitoso ****   -" + cal.getTime();
    	System.out.println(lineaMensaje);
    	writeLog(lineaMensaje,file);
    }
    
	protected void writeLog(String mensaje, File file) {
		// TODO Auto-generated method stub
		try {
    		escritura = new FileWriter(file,true);
    		escritura.write(mensaje+"\n");
    		escritura.close();
    	}catch(IOException exception) {
    		exception.printStackTrace();
    	}
		
	}
}
    



