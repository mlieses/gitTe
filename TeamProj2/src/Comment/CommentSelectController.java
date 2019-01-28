package Comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CommentSelectController")
public class CommentSelectController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int startNo = Integer.parseInt(request.getParameter("startNo"));
		int room_no = Integer.parseInt(request.getParameter("room_no"));
		CommentDao cDao = new CommentDao();
		cDao.getSelectComment(startNo, room_no);
	}

}
