package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board_DAO;
import dto.Board_DTO;


@WebServlet("/Update")
public class Update_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// *요청 내용 한글깨짐 방지
		request.setCharacterEncoding("utf-8");

		// *응답 내용의 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8");
		
		int up = Integer.parseInt(request.getParameter("update"));
		String up2 = request.getParameter("uptitle");	
		String up3 = request.getParameter("upcontent");
		
		System.out.println("업데이트 : " + up);
		System.out.println("업데이트제목 : " + up2);
		System.out.println("업데이트내용 : " + up3);
		
		Board_DTO dtup = new Board_DTO();
		dtup.setPostid(up);
		dtup.setTitle(up2);
		dtup.setContent(up3);
		
		Board_DAO daup = new Board_DAO();
		int uplist = daup.UpdateList(dtup);
		request.setAttribute("uplist",uplist);
		
		
		
		// 브라우저로 요청 (주소를 바꿈) // GET
		String url = "board";
	    response.sendRedirect(url);
	}

	
	
	
}
