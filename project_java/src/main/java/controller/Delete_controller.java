package Board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Delete")
public class Delete_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");	
		
		int del = Integer.parseInt(request.getParameter("del"));
		System.out.println("삭제 :" + del);
		
		// "DTO"에 값을 담음
		boardDTO bd = new boardDTO();
		bd.setPostid(del);
		
		boardDAO ba = new boardDAO();
		               // DTO의 값을 DAO 메소드에 담음
		// "DAO"와 연결(타입 동일시).
		int count = ba.DeleteList(bd);
		
		//  
//		request.setAttribute("del", count);
		
		
//		 String url = "board.jsp";
//		 request.getRequestDispatcher(url).forward(request, response);
		
		String url = "board";
		response.sendRedirect(url);
	}
	
	
	

}
