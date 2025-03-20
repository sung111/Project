package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QualityControl_DAO;
import dto.Performance_DTO;
import dto.QualityControl_DTO;

/**
 * 품질관리 컨트롤러
 */
@WebServlet("/qualityControl")
public class QualityControl_controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        request.setAttribute("userId", userId);
        
		System.out.println("doGet으로 입장(/qualityControl)");

		QualityControl_DAO quality = new QualityControl_DAO();
		List<Performance_DTO> resultList = quality.selectPerform();
		List result = quality.selectQuality();

		request.setAttribute("result", result);
		request.setAttribute("resultList", resultList);

		String url = "/WEB-INF/qualityControl.jsp";
		request.getRequestDispatcher(url).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("command :" + command);

		if ("insert".equals(command)) {
			String userId = request.getParameter("userId");
			String productName = request.getParameter("wpvnaaud");
			String result = request.getParameter("ra");
			String reportTime = request.getParameter("date");
			String passpack = request.getParameter("passPack");
			String failPack = request.getParameter("failPack");
			String comment = request.getParameter("comment");
			String failreason = request.getParameter("failreason");
			String performanceId = request.getParameter("performanceId");

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"); // 저장 방식
			LocalDateTime reportTime1 = LocalDateTime.parse(reportTime, formatter); // 변환
			java.sql.Timestamp time = Timestamp.valueOf(reportTime1); // sql Timestamp 타입 저장

			int passpack1 = Integer.parseInt(passpack);
			int failPack1 = Integer.parseInt(failPack);

			QualityControl_DTO qualityDTO = new QualityControl_DTO();
			int productName1 = Integer.parseInt(productName);
			int performanceId1 = Integer.parseInt(performanceId);

			qualityDTO.setUserId(userId);
			qualityDTO.setPerformanceId(performanceId1);
			qualityDTO.setProductId(productName1);
			qualityDTO.setResult(result);
			qualityDTO.setReportTime(time);
			qualityDTO.setPasspack(passpack1);
			qualityDTO.setFailPack(failPack1);
			qualityDTO.setComments(comment);
			qualityDTO.setFailreason(failreason);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();

			int result1 = qualityDAO.insertQuality(qualityDTO);
			System.out.println("inset result :" + result1);

			String url = "qualityControl";
			response.sendRedirect(url);

		} else if ("update".equals(command)) {

			String qualityControlId = request.getParameter("qualityControlId");
			String date = request.getParameter("date22");
			String qualityResult = request.getParameter("qualityResult22");
			String failreason2 = request.getParameter("failreason22");
			String comment = request.getParameter("comment22");

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"); // 저장 방식
			LocalDateTime date1 = LocalDateTime.parse(date, formatter); // 변환
			java.sql.Timestamp time = Timestamp.valueOf(date1); // sql Timestamp 타입 저장

			QualityControl_DTO qualityDTO = new QualityControl_DTO();
			int qualityControlId1 = Integer.parseInt(qualityControlId);

			qualityDTO.setQualityControlId(qualityControlId1);
			qualityDTO.setReportTime(time);
			qualityDTO.setResult(qualityResult);
			qualityDTO.setFailreason(failreason2);
			qualityDTO.setComments(comment);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();

			int result = qualityDAO.updateQuality(qualityDTO);

			String url = "qualityControl";
			response.sendRedirect(url);

		} else if ("search".equals(command)) {

			String productName = request.getParameter("productName");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String result = request.getParameter("result");
			String failreason = request.getParameter("failreason");

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"); // 저장 방식
			LocalDateTime startDate1 = LocalDateTime.parse(startDate, formatter); // 변환
			LocalDateTime endDate1 = LocalDateTime.parse(endDate, formatter); // 변환
			java.sql.Timestamp startDate2 = Timestamp.valueOf(startDate1); // sql Timestamp 타입 저장
			java.sql.Timestamp endDate2 = Timestamp.valueOf(endDate1); // sql Timestamp 타입 저장

			QualityControl_DTO qualityDTO = new QualityControl_DTO();
			qualityDTO.setProductNameST(productName);
			qualityDTO.setReportTime(startDate2);
			qualityDTO.setReportTime2(endDate2);
			qualityDTO.setResult(result);
			qualityDTO.setFailreason(failreason);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();
			List resultList = qualityDAO.selectPerform();
			List result1 = qualityDAO.searchQuality(qualityDTO);

			request.setAttribute("resultList", resultList);
			request.setAttribute("result", result1);

			System.out.println("resultList : " + resultList);
			System.out.println("result : " + result1);

			String url = "/WEB-INF/qualityControl.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		} else if ("delete".equals(command)) {

			String qualityControlId = request.getParameter("qualityControlId");
			int qcId = Integer.parseInt(qualityControlId);

			QualityControl_DTO qualityDTO = new QualityControl_DTO();
			qualityDTO.setQualityControlId(qcId);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();

			int result = qualityDAO.deletePerform(qualityDTO);
			System.out.println("delete result :" + result);

			String url = "qualityControl";
			response.sendRedirect(url);

		} else if ("search1".equals(command)) {

			String dateStr = request.getParameter("date");
			// 1. 문자열을 LocalDate로 변환
			LocalDate localDate = LocalDate.parse(dateStr);
			// 2. LocalDate를 java.sql.Date로 변환 (DATE 컬럼 저장 시)
			java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

			QualityControl_DTO qualityDTO = new QualityControl_DTO();

			qualityDTO.setDateReportTime(sqlDate);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();
			List resultList = qualityDAO.DailySearch(qualityDTO);
			List result = qualityDAO.selectQuality();

			request.setAttribute("resultList", resultList);
			request.setAttribute("result", result);
			System.out.println("resultList : " + resultList);
			System.out.println("result : " + result);

			String url = "/WEB-INF/qualityControl.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

}