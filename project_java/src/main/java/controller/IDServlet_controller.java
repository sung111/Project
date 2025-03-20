package Board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/IDServlet")
public class IDServlet_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int st = Integer.parseInt(request.getParameter("postid"));
		System.out.println("오늘의 점심 : " + st);
		
		
		
		
		// DTO에 세팅
		boardDTO dto = new boardDTO();
		dto.setPostid(st);
		System.out.println(st);
		
		

		// DAO에서 받아서 jsp로 전달
		boardDAO dao = new boardDAO();
		dao.viewcountList(dto); // 먼저 업뎃하고 
		
		List list = dao.newList(dto); // 그 다음 조회
		request.setAttribute("idpost", list);
		
		
		
		String url = "Content.jsp";
	    request.getRequestDispatcher(url).forward(request, response);
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	
	
}


