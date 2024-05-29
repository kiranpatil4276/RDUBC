package constants;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.Database;


public class addItom_Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		System.out.println("request " + request);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int i=0;
		//String id1=request.getParameter("id");
		String officer=request.getParameter("officer");
		String district=request.getParameter("district");
		String item_name=request.getParameter("item_Name");
		String quantity=request.getParameter("quantity");
		String rate=request.getParameter("rate");
		String unit=request.getParameter("unit");
		String date=request.getParameter("date");
		
		
		try{
			
			Connection con=Database.getConnection(); 
			PreparedStatement ps=con.prepareStatement("insert into admin_distribute(officer,district,item_name,quantity,rate,unit,date) values(?,?,?,?,?,?,?)");
			System.out.println("ghhghhj");
			//ps.setString(1,null);
			ps.setString(1, officer);
			ps.setString(2, district);
			ps.setString(3, item_name);
			ps.setInt(4, Integer.parseInt(quantity));
			ps.setString(5,rate);
			ps.setString(6,unit);
			ps.setString(7, date);
			
			i=ps.executeUpdate();


			
			if(i==1){
				System.out.println(i);
				PreparedStatement pss1=con.prepareStatement("select quantity from district_distribution where item_name=?");
				pss1.setString(1,item_name);
				ResultSet rs2=pss1.executeQuery();
				int q3 = 0,q1=0;
				
				while(rs2.next())
				{
					q3=rs2.getInt("quantity");
					q1=q1+q3;
					System.out.println("23");
				}
				System.out.println(q1);
                q1=q1-Integer.parseInt(quantity);
				System.out.println(q1);
				String qq1=String.valueOf(q1);
				PreparedStatement ps2=con.prepareStatement("update admin_distribute set quantity=? where item_name=?");
				
				ps2.setString(1,qq1);
				ps2.setString(2,item_name);
				int r1=ps2.executeUpdate();
				System.out.println(r1);
				out.print("succesfully record");
				
				
				
				
				
				RequestDispatcher rd=request.getRequestDispatcher("view_item_taluka.jsp");
				
				rd.forward(request, response);
				
				
			}
		
	}catch(Exception e){
		System.out.print(e.toString());
	}
		}		
	
}

