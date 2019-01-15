package userController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import userDB.ArticleDTO;
import userDB.UserDAO;

/**
 * Servlet implementation class detailTestController
 */
@WebServlet("/detailTestController.do")
public class detailTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		
		JSONObject json = udao.getarticles();
		System.out.println(json.toString());
		response.getWriter().print(json);
		
		
	}
	
	
	
}
