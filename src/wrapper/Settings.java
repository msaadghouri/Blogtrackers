
package wrapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import authentication.DBConnector;
import java.io.File;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Login
 * @author mukti
 */
@SuppressWarnings("unused")
@WebServlet("/profile")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Settings() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {           
            response.setContentType("text/html");
            response.sendRedirect("profile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
                String submitted = request.getParameter("update");
				PrintWriter pww = response.getWriter();
				HttpSession session = request.getSession();
                //pww.write(email+":"+username+":"+pass+":"+submitted);
                    if(submitted!=null && submitted.equals("yes")){	
                        String email = request.getParameter("email");
                        String username = request.getParameter("username");
                        //String pass = request.getParameter("password");
                        //String type = request.getParameter("user_type");
                        String phone_number = request.getParameter("phone_number");
                        String first_name = request.getParameter("first_name");
                        String last_name = request.getParameter("last_name");
                        String address = request.getParameter("address");

                        String query_string ="UPDATE usercredentials SET Email = '"+email+"', first_name = '"+first_name+"', last_name = '"+last_name+"', phone_number = '"+phone_number+"', address = '"+address+"' WHERE UserName = '"+username+"'";
                        boolean inserted = new DBConnector().updateTable(query_string); 

                        response.setContentType("text/html");
                        response.sendRedirect("profile.jsp");
                    }else if(submitted!=null && submitted.equals("change_passord")){
						String password = request.getParameter("password");
						String username = (String)session.getAttribute("username");
						
						ArrayList<?> login = new DBConnector().login(username,password);
						//if(s.verified)
						if(login.size()>0)
						{
							String query_string ="UPDATE usercredentials SET Password = '"+password+"' WHERE UserName = '"+username+"'";
	                        boolean inserted = new DBConnector().updateTable(query_string); 
						
			                
						}else {
							session.setAttribute("error_message","Old password in not correct");
	                        
						
						}
						
						
						response.setContentType("text/html");
                        response.sendRedirect("change_password.jsp");
                        
					}
               
                 
                
	}
}
