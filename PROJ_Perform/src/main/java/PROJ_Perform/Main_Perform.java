package PROJ_Perform;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Main_Perform")
public class Main_Perform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		Perform_DAO dao = new Perform_DAO();
	    List performlist = dao.selectPerform ();
	    request.setAttribute("performList", performlist);
		
		String url = "perform_0203.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	
	

}
