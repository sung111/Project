package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("doGet으로 입장(/qualityControl)");

		QualityControl_DAO quality = new QualityControl_DAO();
		List<Performance_DTO> resultList = quality.selectPerform();

		request.setAttribute("resultList", resultList);
		System.out.println("resultList : " + resultList); // null 인지 확인함.

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

			qualityDTO.setPerformanceId(performanceId1);
			qualityDTO.setProductName(productName1);
			qualityDTO.setResult(result);
			qualityDTO.setReportTime(time);
			qualityDTO.setPasspack(passpack1);
			qualityDTO.setFailPack(failPack1);
			qualityDTO.setComments(comment);
			qualityDTO.setFailreason(failreason);

			QualityControl_DAO qualityDAO = new QualityControl_DAO();

			int result1 = qualityDAO.insertQuality(qualityDTO);
			System.out.println("inset result :" + result1);
			
		}

		String url = "Performance";
		response.sendRedirect(url);

		
	}

	
}