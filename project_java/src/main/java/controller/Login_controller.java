package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User_DAO;
import dto.User_DTO;

@WebServlet("/Login_controller")
public class Login_controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//    	로그인 입력값을 가져옴.
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        //로그인 확인
        User_DAO userDAO = new User_DAO();
        User_DTO user = userDAO.getUserById(userId);

        if (user != null && user.getUserPw().equals(userPw)) { // 비밀번호 일치 확인
            // 세션 생성
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());

            response.sendRedirect("index.jsp"); // 로그인 성공 시 index.jsp로 이동
        } else {
            // 로그인 실패 시 다시 login.jsp로 이동
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
