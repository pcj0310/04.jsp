package movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/movie")
public class MovieServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MovieMgr movieMgr = new MovieMgr();
		boolean success = movieMgr.insertMovie(request);
		if (success) {
			response.sendRedirect("mainpage.jsp");
		} else {
			// 삽입 실패 시 처리할 로직 추가
			response.sendRedirect("error.jsp");
		}
	}
}

