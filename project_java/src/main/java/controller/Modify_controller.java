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


@WebServlet("/Modify")
public class Modify_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// *요청 내용 한글깨짐 방지
		request.setCharacterEncoding("utf-8");

		// *응답 내용의 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8");
		
	// 1차	
	int re = Integer.parseInt(request.getParameter("mod"));	
	System.out.println("수정 : " + re);	
	
	Board_DTO dtmod = new Board_DTO();
	dtmod.setPostid(re);
		
	
	// 3차
	Board_DAO damod = new Board_DAO();
	// DAO아님 (담아서 다른곳에 돌려주는 용도)
	List listmod = damod.ModifyList(dtmod);
	// 수정된 값 돌려줌
	request.setAttribute("modi", listmod);
	
		
		
	String url = "Modify.jsp";
	request.getRequestDispatcher(url).forward(request, response);
		
		
	}

}
