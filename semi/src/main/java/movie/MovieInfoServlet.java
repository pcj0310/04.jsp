package movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/movieinfo")
public class MovieInfoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 영화 정보를 가져오기 위해 MovieMgr를 사용
        MovieMgr movieMgr = new MovieMgr();
        List<MovieBean> movieList = movieMgr.getAllMovies();
        
        // 영화 정보를 JSP로 전달하기 위해 request 속성에 저장
        request.setAttribute("movieList", movieList);
        
        // movieinfopage.jsp로 포워딩
        request.getRequestDispatcher("movieinfopage.jsp").forward(request, response);
	}

}
