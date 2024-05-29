package constants;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.TooManyListenersException;

import javax.comm.CommPortIdentifier;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.SerialPortEvent;
import javax.comm.SerialPortEventListener;
import javax.comm.UnsupportedCommOperationException;

/**
 * Servlet implementation class distribute
 */
@WebServlet("/distribute")
public class distribute extends HttpServlet implements Runnable, SerialPortEventListener {
	private static final long serialVersionUID = 1L;
	InputStream inputStream;
	 SerialPort serialPort;
	 Thread readThread;
	 String fs="";
	static CommPortIdentifier port;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public distribute() {
        super();
        System.out.println("listport constructure");
		  
		  
		  try {
            // serialPort = (SerialPort) port.open("SimpleReadApp", 2000);
			  serialPort=(SerialPort) port.open("SimpleReadApp", 2000);
             System.out.println("serial port is"+serialPort);
    } catch (PortInUseException e) 
    {
  	  System.out.println(e);
    }
    try {
        inputStream = serialPort.getInputStream();
        System.out.println(inputStream);
    } catch (IOException e) {System.out.println(e);}
try {
        serialPort.addEventListener((SerialPortEventListener) this);
	     // serialPort.addEventListener(this);
} catch (TooManyListenersException e) {System.out.println(e);}
    serialPort.notifyOnDataAvailable(true);
    try {
        serialPort.setSerialPortParams(9600,
            SerialPort.DATABITS_8,
            SerialPort.STOPBITS_1,
            SerialPort.PARITY_NONE);
    } catch (UnsupportedCommOperationException e) {System.out.println(e);}
    readThread = new Thread(this);
    readThread.start();
		
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Enumeration ports = CommPortIdentifier.getPortIdentifiers();
		while (ports.hasMoreElements()) {
		 port = (CommPortIdentifier)ports.nextElement();
		//System.out.println("my port is"+port);
		 if (port.getPortType() == CommPortIdentifier.PORT_SERIAL)
		 {
			 if (port.getName().equals("COM3")) {
		            //                if (portId.getName().equals("/dev/term/a")) {
		         System.out.println("123456");  
		         System.out.println(port.getName());
				 
		         distribute reader = new distribute();
		                System.out.println(fs);
		                }
		            } 
		 }
		String type;
		switch (port.getPortType()) {
		case CommPortIdentifier.PORT_PARALLEL:
		type = "Parallel"; 
		break;
		case CommPortIdentifier.PORT_SERIAL:
		type = "Serial"; 
		break;
		default: /// Shouldn't happen
		type = "Unknown"; 
		break;
		}
		System.out.println(port.getName() + ": " + type);
	
		
		
	}

	public void run() {
        try {
            Thread.sleep(20000);
        } catch (InterruptedException e) {System.out.println(e);}
    }
  public void serialEvent(SerialPortEvent event) {
	 // System.out.println("serieal event method");
	  
        switch(event.getEventType()) {
        case SerialPortEvent.BI:
        case SerialPortEvent.OE:
        case SerialPortEvent.FE:
        case SerialPortEvent.PE:
        case SerialPortEvent.CD:
        case SerialPortEvent.CTS:
        case SerialPortEvent.DSR:
        case SerialPortEvent.RI:
        case SerialPortEvent.OUTPUT_BUFFER_EMPTY:
            break;
        case SerialPortEvent.DATA_AVAILABLE:
            byte[] readBuffer = new byte[20];
    
            try { 
            	
                while (inputStream.available() > 0) {
                	//System.out.println("Data in inputstream");
                    int numBytes = inputStream.read(readBuffer);
                    //System.out.println(numBytes);
                    Object input=new String(readBuffer);
	            	 fs=(String)input;
	            	
                }
                System.out.print(fs); // I Have to get this data to my Jtextfield
                
            } catch (IOException e) {System.out.println(e);}
            break;
        }
	
}

}
