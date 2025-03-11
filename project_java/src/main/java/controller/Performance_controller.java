package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Performance_DAO;
import dto.Performance_DTO;

/**
 * 실적등록 컨트롤러
 */
@WebServlet("/Performance")
public class Performance_controller extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet으로 입장(/Performance)");
		String url = "/WEB-INF/Performance.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		System.out.println("doPost 실행");
		
		String ProductName = request.getParameter("wpvnaaud");  // 제품명
		String ea = request.getParameter("ea");					//갯수 입력
		String comment = request.getParameter("comment");		//코멘트 입력

//		date타입은 String에서 만 받을수있음
		String ReportTime = request.getParameter("date");		//날짜 입력.
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime reportTime = LocalDateTime.parse(ReportTime, formatter);  // 변환
		
//		String 으로 받은 ea를 int 타입으로 변환호 set(ea1) 전달인자가 int 인것을 변환하기위해 작성
		int ea1 = Integer.parseInt(ea);
		
//		Oracle의 DATE 타입은 사실상 TIMESTAMP와 같기 때문에 java.sql.Timestamp 사용
//		DTO 에서 전달인자값도 Timestamp 으로 변경함.
		java.sql.Timestamp sqlTime = Timestamp.valueOf(reportTime);
		
		Performance_DTO performDTO = new Performance_DTO();
		performDTO.setProductName(ProductName); // 제품명 설정
		performDTO.setProductionCount(ea1); // 갯수 설정
		performDTO.setPerformanceComment(comment); // 제품명 설정
		performDTO.setReportTime(sqlTime); // 날짜 설정
		
		Performance_DAO performDAO = new Performance_DAO();
		int result = performDAO.insertPerform(performDTO);
		System.out.println("result :" + result);
		
		
	}

}
