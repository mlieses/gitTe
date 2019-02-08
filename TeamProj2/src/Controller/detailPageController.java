package Controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DAO;
import DB.SelectDTO;


@WebServlet("/detailPageController.do")
public class detailPageController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int a = Integer.parseInt(request.getParameter("a"));
		RequestDispatcher dis = request.getRequestDispatcher("Jong/detail.jsp");
		DAO dao = new DAO();
		String Host_id = request.getParameter("HostId"); //Host_id값 받아오기
		//전체 
		if(a == 1) {
						
			Vector<SelectDTO> vector =	dao.select(1);
			request.setAttribute("vector", vector);
			
			dis.forward(request, response);
		}
		//카페
		else if(a == 2) {
			
			Vector<SelectDTO> vector =	dao.select(2);
			request.setAttribute("vector", vector);
						
			dis.forward(request, response);
			
		}
		//스터디룸
		else if(a == 3) {
			

				
			Vector<SelectDTO> vector =	dao.select(3);
			request.setAttribute("vector", vector);
			dis.forward(request, response);
		}
		//강의실
		else if (a == 4) {
			
			
			Vector<SelectDTO> vector =	dao.select(4);
			request.setAttribute("vector", vector);
			dis.forward(request, response);
		}
		//야외
		else if( a == 10) {
			
			Vector<SelectDTO> vector =	dao.select(10);
			request.setAttribute("vector", vector);
			dis.forward(request, response);}
		
		//detail페이지로 이동
		else if (a == 5) {
			System.out.println("디테일페이지로 이동");
			dis.forward(request, response);
		
		//insertBoard페이지로 이동
		}else if(a== 6){
			System.out.println("공간등록 페이지로 이동");
			dis = request.getRequestDispatcher("Jong/insertBoard.jsp?HostId="+Host_id);
			dis.forward(request, response);
		}
		//MyPageDetail페이지로 이동
		else if(a== 7){
			System.out.println("공간 관리 페이지로 이동");
			dis = request.getRequestDispatcher("/Jong/MyPageDetail.jsp?HostId="+Host_id);
			dis.forward(request, response);			
		}
		//m_detail.jsp로 이동
		else if(a == 8) {
			System.out.println("m_detail페이지로 이동");
			response.sendRedirect("m_detail?num="+request.getParameter("room_no"));	
		}
		
		else {
			System.out.println("잘못된 경로로 들어오셨습니다.");
		}
		
		  
		
	}

}
