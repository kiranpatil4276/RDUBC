package pack;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.TooManyListenersException;

import javax.comm.CommPortIdentifier;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.SerialPortEvent;
import javax.comm.SerialPortEventListener;
import javax.comm.UnsupportedCommOperationException;



public class ListPorts implements Runnable, SerialPortEventListener {
	 InputStream inputStream;
	 SerialPort serialPort;
	 Thread readThread;
	static CommPortIdentifier port;
	
	public static void main() {
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
				 
				 ListPorts reader = new ListPorts();
		                
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
	
	
	  public ListPorts()
	  {
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
		  
	  }
	  public void run() {
	        try {
	            Thread.sleep(20000);
	        } catch (InterruptedException e) {System.out.println(e);}
	    }
	  public void serialEvent(SerialPortEvent event) {
		 // System.out.println("serieal event method");
		  String fs="";
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
	               // System.out.print(fs); // I Have to get this data to my Jtextfield
	                
	               
	                try
	                {
	                	Class.forName("com.mysql.jdbc.Driver");
	                	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/smartrationcard","root","root");
	                	Statement st=con.createStatement();
	                	st.executeUpdate("insert into demo(name) values('"+fs+"')");
	                	
	                }
	                catch(Exception e)
	                {
	                	System.out.println(e);
	                }

	                
	                
	           	 
	                
	            } catch (IOException e) {System.out.println(e);}
	            break;
	        }
		
	}
	  }

