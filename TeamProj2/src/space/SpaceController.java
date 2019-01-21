package space;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDB.UserDAO;

@WebServlet("/m_detail")
public class SpaceController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num =Integer.parseInt(request.getParameter("num"));
		SpaceDao dao = new SpaceDao();
		List list = dao.getSpace(num);
//		dao.getSpace(num);
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("m_detail.jsp");
		dis.forward(request, response);
	}
}
