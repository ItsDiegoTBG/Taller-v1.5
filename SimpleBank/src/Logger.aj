import java.io.File;
import java.io.FileWriter;
import java.util.*;




public aspect Logger {
	
    pointcut succesTransaccion() : call(* moneyMakeTransaction(..));
    after() : succesTransaccion() {
   
    	File file = new File("log.txt");
        Calendar cal = Calendar.getInstance();
        
    	String lineaMensaje = "*** Transaccion exitosa *** -"+cal.getTime();
    	System.out.println(lineaMensaje);
    	///writeLog(lineaMensaje,file);
    	
    }
    
	
}



