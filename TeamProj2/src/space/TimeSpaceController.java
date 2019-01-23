package space;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TimeSpaceController")
public class TimeSpaceController extends HttpServlet {
	       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectDate = request.getParameter("date");
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		System.out.println(selectDate);
		SpaceDao dao = new SpaceDao();
		dao.getTime(selectDate, roomNo);
	}

}
