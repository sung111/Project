package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Inventorycheck_DAO;
import dto.Inventorycheck_DTO;

/**
 * 재고현황조회
 */
@WebServlet("/Inventorycheck")
public class Inventorycheck_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Inventorycheck_DAO checkDAO = new Inventorycheck_DAO();
		List resultList = checkDAO.selectcheck();
		List resultList2 = checkDAO.selectcheck2();

		request.setAttribute("resultList", resultList);
		request.setAttribute("resultList2", resultList2);
		System.out.println("resultList : " + resultList);
		System.out.println("resultList2 : " + resultList2);

		String url = "/WEB-INF/Inventorycheck.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("command :" + command);

		if ("modify1".equals(command)) {
			String maQuantity = request.getParameter("maQuantity");
			String receiptDate = request.getParameter("receiptDate");
			String inventoryId = request.getParameter("inventoryId");
			System.out.println("입력된 receiptDate 값: " + receiptDate);
			java.sql.Date receiptDate1 = java.sql.Date.valueOf(receiptDate);
			int maQuantity1 = Integer.parseInt(maQuantity);
			int inventoryId1 = Integer.parseInt(inventoryId);

			Inventorycheck_DTO inventoryDTO = new Inventorycheck_DTO();
			inventoryDTO.setMaQuantity(maQuantity1);
			inventoryDTO.setReceiptDate(receiptDate1);
			inventoryDTO.setInventoryId(inventoryId1);

			Inventorycheck_DAO inventoryDAO = new Inventorycheck_DAO();
			int result = inventoryDAO.updateInventory1(inventoryDTO);

			System.out.println("modify1 result :" + result);

			String url = "Inventorycheck";
			response.sendRedirect(url);

		} else if ("modify2".equals(command)) {
			String prQuantity = request.getParameter("prQuantity");
			String makeDate = request.getParameter("makeDate");
			String productinvenid = request.getParameter("productinvenid");

			java.sql.Date makeDate1 = java.sql.Date.valueOf(makeDate);
			int prQuantity1 = Integer.parseInt(prQuantity);
			int productinvenid1 = Integer.parseInt(productinvenid);

			Inventorycheck_DTO inventoryDTO = new Inventorycheck_DTO();
			inventoryDTO.setMakeDate(makeDate1);
			inventoryDTO.setPrQuantity(prQuantity1);
			inventoryDTO.setProductinvenId(productinvenid1);

			Inventorycheck_DAO inventoryDAO = new Inventorycheck_DAO();
			int result = inventoryDAO.updateInventory2(inventoryDTO);

			System.out.println("modify2 result :" + result);

			String url = "Inventorycheck";
			response.sendRedirect(url);
			
		} else if ( "delete1".equals(command) ) {
			
			String inventoryId = request.getParameter("inventoryId");
			int inventoryId1 = Integer.parseInt(inventoryId);
			
			Inventorycheck_DTO inventoryDTO = new Inventorycheck_DTO();
			inventoryDTO.setInventoryId(inventoryId1);
			
			Inventorycheck_DAO inventoryDAO = new Inventorycheck_DAO();
			int result = inventoryDAO.deleteInventory1(inventoryDTO);
			
			System.out.println("delete1 result :" + result);
			
			String url = "Inventorycheck";
			response.sendRedirect(url);
			
		} else if ( "delete2".equals(command) ) {
			
			String productinvenid = request.getParameter("productinvenid");
			int productinvenid1 = Integer.parseInt(productinvenid);
			
			Inventorycheck_DTO inventoryDTO = new Inventorycheck_DTO();
			inventoryDTO.setInventoryId(productinvenid1);
			
			Inventorycheck_DAO inventoryDAO = new Inventorycheck_DAO();
			int result = inventoryDAO.deleteInventory2(inventoryDTO);
			
			System.out.println("delete2 result :" + result);
			
			String url = "Inventorycheck";
			response.sendRedirect(url);
			
		} else if ( "inputForm".equals(command) ) {
			
			String ea = request.getParameter("ea");
			String type = request.getParameter("type");
			String indate = request.getParameter("indate");
			int ea1 = Integer.parseInt(ea);
			java.sql.Date date = java.sql.Date.valueOf(indate);

			Inventorycheck_DTO inventoryDTO = new Inventorycheck_DTO();
			Inventorycheck_DAO inventoryDAO = new Inventorycheck_DAO();
			if( "완제품".equals(type) ) {
				String productinvenid = request.getParameter("productinvenid");
				int productinvenid1 = Integer.parseInt(productinvenid);
				inventoryDTO.setProductinvenId(productinvenid1);
				inventoryDTO.setPrQuantity(ea1);
				inventoryDTO.setMakeDate(date);
				int result = inventoryDAO.insertInventory2(inventoryDTO);
				System.out.println("완제품 result :" + result);
			} else {
				String inventoryId = request.getParameter("inventoryId");
				int inventoryId1 = Integer.parseInt(inventoryId);
				inventoryDTO.setMaterialId(inventoryId1);
				inventoryDTO.setMaQuantity(ea1);
				inventoryDTO.setReceiptDate(date);
				int result = inventoryDAO.insertInventory1(inventoryDTO);
				System.out.println("자재 result :" + result);
			}
			String url = "Inventorycheck";
			response.sendRedirect(url);
		}
		
		
		

	}

}
