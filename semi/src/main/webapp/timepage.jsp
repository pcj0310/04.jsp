<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="movie.MovieBean" %>
<%@ page import="movie.MovieMgr" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화상영일</title>
    <link rel="stylesheet" href="timepage.css">
</head>
<body>
<%
	MovieMgr movieMgr = new MovieMgr();
	List<MovieBean> movieList = movieMgr.getAllMovies();
	List<String> movieDates = new ArrayList<>();
	List<String> movieTitles = new ArrayList<>();

%>
<ul>
<% 
	String currentDate = null;
	for (MovieBean movie : movieList) {
    String date = movie.getMovie_date();
    String title = movie.getMovie_title();

    // 날짜가 이전과 다를 경우에만 날짜 출력
    if (!date.equals(currentDate)) {
        %>
        <li><%= date %></li>
        <% 
        currentDate = date;
    }
    %>
    <li><%= title %></li>
<% } %>
</ul>
</body>
</html>