package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import db.DBConnectionMgr;

public class MovieMgr {
	private DBConnectionMgr pool;
	
	public MovieMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean insertMovie(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		
		try {
			con = pool.getConnection();
			String sql = "INSERT INTO movie (movie_id, movie_title, movie_date, movie_dir, movie_img, movie_info) VALUES (SEQ_MOVIE.NEXTVAL,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("title"));
			pstmt.setString(2, request.getParameter("date"));
			pstmt.setString(3, request.getParameter("director"));
			pstmt.setString(4, request.getParameter("image"));
			pstmt.setString(5, request.getParameter("info"));
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				success = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return success;
	}
	
	// 모든 영화 정보를 가져오는 메서드
    public List<MovieBean> getAllMovies() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        List<MovieBean> movieList = new ArrayList<>();
        
        try {
            con = pool.getConnection();
            sql = "SELECT * FROM movie";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                MovieBean movie = new MovieBean();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setMovie_title(rs.getString("movie_title"));
                movie.setMovie_date(rs.getString("movie_date"));
                movie.setMovie_dir(rs.getString("movie_dir"));
                movie.setMovie_img(rs.getString("movie_img"));
                movie.setMovie_info(rs.getString("movie_info"));
                movieList.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return movieList;
    }
    
}
