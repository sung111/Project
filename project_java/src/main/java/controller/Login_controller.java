package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
        
        // 세션이 없으면 키를 확인한 후, 자동으로 로그인 처리를한다.
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession(false);
        if (cookies != null) {
        	for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    String savedUserId = cookie.getValue();
                    User_DAO userDAO = new User_DAO();
                    User_DTO user = userDAO.getUserById(savedUserId);

                    if (user != null) {
//                    	새로운 세션 생성
                        session = request.getSession();
                        // 자동 로그인 세션 설정
                        session.setAttribute("userId", user.getUserId());
                        session.setAttribute("userName", user.getUserName());
                        session.setAttribute("userPw", user.getUserPw());
                        session.setAttribute("Job", user.getJob());
                        session.setAttribute("Email", user.getEmail());
                        session.setAttribute("CreateDate", user.getCreateDate());
                        session.setAttribute("Field", user.getField());
                        
                        // 자동 로그인 후 index.jsp로 리다이렉트
                        response.sendRedirect("index.jsp");
                        return; // 자동 로그인 후 처리 종료
                    }
                }
            }
        }
        
        // 로그인 입력값을 가져옴.
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        // 로그인 확인
        User_DAO userDAO = new User_DAO();
        User_DTO user = userDAO.getUserById(userId);

        if (user != null && user.getUserPw().equals(userPw)) { // 비밀번호 일치 확인
            // 세션 생성
            session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("userPw", user.getUserPw());
            session.setAttribute("Job", user.getJob()); // 관리자 권한의 정확한 이름
            session.setAttribute("Email", user.getEmail());
            session.setAttribute("CreateDate", user.getCreateDate());
            session.setAttribute("Field", user.getField()); // 실질적인 관리자 권한 (admin, user)
            
            // 쿠키에 저장
            Cookie userCookie = new Cookie("userId", user.getUserId());
            Cookie userIdCookie = new Cookie("userId", user.getUserId());
            Cookie userNameCookie = new Cookie("userName", user.getUserName());
            Cookie jobCookie = new Cookie("job", user.getJob());
            Cookie emailCookie = new Cookie("email", user.getEmail());
            Cookie phoneCookie = new Cookie("phone", user.getPhone());
            Cookie createDateCookie = new Cookie("createDate", user.getCreateDate().toString());
            Cookie fieldCookie = new Cookie("field", user.getField());

            int expiryTime = 60 * 60 * 8; // 60초, 60분, 3시간. 총 8시간동안 유지됨.
            
         // 쿠키 경로를 설정함. (모든 페이지에서 사용이 가능하다!!!!!!!!!!!)
            userIdCookie.setPath("/");
            userNameCookie.setPath("/");
            jobCookie.setPath("/");
            emailCookie.setPath("/");
            phoneCookie.setPath("/");
            createDateCookie.setPath("/");
            fieldCookie.setPath("/");

            // 쿠키 추가
            response.addCookie(userIdCookie);
            response.addCookie(userNameCookie);
            response.addCookie(jobCookie);
            response.addCookie(emailCookie);
            response.addCookie(phoneCookie);
            response.addCookie(createDateCookie);
            response.addCookie(fieldCookie);
             
            userCookie.setPath("/"); // 모든 경로에서 사용 가능함.
            response.addCookie(userCookie);
            
            System.out.println("로그인 성공, 세션 저장됨: userId = " + session.getAttribute("userId"));
            
         // 로그인 성공 시 index.jsp로 이동
            response.sendRedirect("index.jsp"); 
        } else {
            System.out.println("로그인 실패 - 아이디 또는 비밀번호 불일치");
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
