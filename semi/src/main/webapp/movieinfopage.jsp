<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="movie.MovieBean" %>
<%@ page import="movie.MovieMgr" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Information</title>
<link rel="stylesheet" href="resource/css/infopage.css" />
</head>
<body>
<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="mainpage.jsp"> 
						<em><img src="resource/img/movlogo.png" alt="MOVIE"></em>
						</a>
					</h1>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="movieinfopage.jsp">영화정보</a></li>
							<li><a href="list.jsp">게시판</a></li>
							<%
							String id = (String) session.getAttribute("id");
							
							if (id == null) {
							%>
							<li><a href="member/login.jsp">로그인</a></li>
							<%
							} else {
							%>
							<li><a href="member/logout.jsp">로그아웃</a></li>
							<%
							}
							%>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<section id="banner">
		<div class="banner_menu">
			<div class="container">
				<div class="row">
					<div class="bm_right">
                        <ul>
                            <%if (id != null) {%>
                       		<%if (id.equals("user01")) { %>
                       		<li class="white"><a href="movie_form.jsp">영화추가</a></li>
                       		<% }%>
                            <li class="purple"><a href="#">고객센터</a></li>
                            <% } else { %>
                            <li class="purple"><a href="#">고객센터</a></li>
                            <% } %>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
	</section>
    <%-- 영화 정보를 가져오기 위해 MovieMgr를 사용 --%>
    <% 
        MovieMgr movieMgr = new MovieMgr();
        List<MovieBean> movieList = movieMgr.getAllMovies();
        for (MovieBean movie : movieList) {
    %>
    <section id="movv">
    <div id="movinfo">
        <h2><%= movie.getMovie_title() %></h2>
        <p>Date: <%= movie.getMovie_date() %></p>
        <p>Director: <%= movie.getMovie_dir() %></p>
        <img src="<%= movie.getMovie_img() %>" alt="<%= movie.getMovie_title() %> Poster">
        <p class="inf"><%= movie.getMovie_info() %></p>
    </div>
    </section>
    <% } %>
</body>
</html>