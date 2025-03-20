package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
		
		Performance_DAO performance_DAO = new Performance_DAO();
		List<Performance_DTO> resultList = performance_DAO.selectPerform();
		
		request.setAttribute("resultList", resultList);
//		System.out.println("resultList : " + resultList);			// null 인지 확인함.
		String url = "/WEB-INF/Performance.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		System.out.println("doPost 실행");
		
		String command = request.getParameter("command");
		System.out.println("command :" + command);
		
		if( "insert".equals(command) ) {
			String Productplan = request.getParameter("Productplan");  // 생산계획 시퀀스번호
			String productId = request.getParameter("productId");  // 생산계획 시퀀스번호
			String ea = request.getParameter("ea");					//갯수 입력
			String comment = request.getParameter("comment");		//코멘트 입력
			
//		date타입은 String에서 만 받을수있음
			String ReportTime = request.getParameter("date");		//날짜 입력.
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime reportTime = LocalDateTime.parse(ReportTime, formatter);  // 변환
			
//		String 으로 받은 ea를 int 타입으로 변환호 set(ea1) 전달인자가 int 인것을 변환하기위해 작성
			int ea1 = Integer.parseInt(ea);
			int productId1 = Integer.parseInt(productId);
			
//		Oracle의 DATE 타입은 사실상 TIMESTAMP와 같기 때문에 java.sql.Timestamp 사용
//		DTO 에서 전달인자값도 Timestamp 으로 변경함.
			java.sql.Timestamp sqlTime = Timestamp.valueOf(reportTime);
			int ProductName1 = Integer.parseInt(Productplan);
			
			Performance_DTO performDTO = new Performance_DTO();
			performDTO.setPlanId(ProductName1); 	// 제품명 설정
			performDTO.setProductId(productId1);	// 제품 시퀀스
			performDTO.setProductionCount(ea1); 		// 갯수 설정
			performDTO.setPerformanceComment(comment);  // 코멘트 설정
			performDTO.setReportTime(sqlTime); 			// 날짜 설정
			
			Performance_DAO performDAO = new Performance_DAO();
			int result = performDAO.insertPerform(performDTO);
			System.out.println("inset result :" + result);
			
			String url = "Performance";
			response.sendRedirect(url);
			
		} else if ( "update".equals(command) ) {
			
			Performance_DTO performDTO = new Performance_DTO();
			String performanceId = request.getParameter("performanceId2");
			int performanceId1 = Integer.parseInt(performanceId);
			String date = request.getParameter("date2");
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime reportTime = LocalDateTime.parse(date, formatter);  // 변환
			java.sql.Timestamp date1 = Timestamp.valueOf(reportTime);
			
			String wpvnaaud = request.getParameter("wpvnaaud2");
			String number = request.getParameter("number2");
			int number1 = Integer.parseInt(number);
			String text = request.getParameter("comment2");
			
			performDTO.setPerformanceId(performanceId1);
			performDTO.setReportTime(date1);
			performDTO.setProductName(wpvnaaud);
			performDTO.setProductionCount(number1);
			performDTO.setPerformanceComment(text);
//			System.out.println(text);
			Performance_DAO performDAO = new Performance_DAO();
			int result = performDAO.updatePerform(performDTO);
			System.out.println("update result :" + result);
			
			String url = "Performance";
			response.sendRedirect(url);
			
		} else if ( "delete".equals(command) ) {
			
			Performance_DTO performDTO = new Performance_DTO();
			String performanceId = request.getParameter("performanceId");
			int performanceId1 = Integer.parseInt(performanceId);
			
			performDTO.setPerformanceId(performanceId1);
			
			Performance_DAO performDAO = new Performance_DAO();
			int result = performDAO.deletePerform(performDTO);
			System.out.println("delete result :" + result);
			
			String url = "Performance";
			response.sendRedirect(url);
			
		} else if( "search".equals(command) ) {
			
			Performance_DTO performDTO = new Performance_DTO();
			String performanceName = request.getParameter("searchName");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime startDate1 = LocalDateTime.parse(startDate, formatter);
			LocalDateTime endDate1 = LocalDateTime.parse(endDate, formatter);
			java.sql.Timestamp startDate2 = Timestamp.valueOf(startDate1);
			java.sql.Timestamp endDate2 = Timestamp.valueOf(endDate1);
			
			performDTO.setProductName(performanceName);
			performDTO.setReportTime(startDate2);
			performDTO.setReportTime2(endDate2);
			
			Performance_DAO performDAO = new Performance_DAO();
			List<Performance_DTO> resultList = performDAO.searchPerform(performDTO);
			
			request.setAttribute("resultList", resultList);
			
		    String url = "/WEB-INF/Performance.jsp";
		    request.getRequestDispatcher(url).forward(request, response);
			
			
		} else if( "getProductName".equals(command) ) {
			String productId = request.getParameter("productId");
	        System.out.println("받은 Product ID: " + productId);

	        if (productId != null && !productId.isEmpty()) {
	            response.setContentType("text/plain; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            Performance_DAO performance_DAO = new Performance_DAO();

	            // 데이터베이스에서 해당 productId의 제품명 가져오기
	            String productName = performance_DAO.getProductNameById(Integer.parseInt(productId));

	            if (productName != null) {
	                out.print(productName); // 제품명 반환
	            } else {
	                out.print("데이터 없음"); // 해당 productId가 없을 경우
	            }
	            return;
	        }
		} else {
			response.sendRedirect("Performance");
		}
		
		
		
	}
	
	
	
	
}
