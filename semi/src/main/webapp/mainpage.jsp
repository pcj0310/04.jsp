<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/mainstyle.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="resource/js/slideimg.js"></script>
<script src="resource/js/script.js"></script>
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
							<li><a href="board/list.jsp">게시판</a></li>
							<%
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
					<div id="loginstatus">
						<%
						if (id != null) {
						%>
						<p>
							<%=id%>님
						</p>
						<%
						}
						%>
					</div>
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
		<section id="imgslide">
			<div id="slider">
				<img src="resource/img/slideex.jpg" alt="카페음료">
				<img src="resource/img/slideex.jpg" alt="카페음료">
			</div>
		</section>
	</section>
	<section id ="movie">
		<div class="movie_chart">
			<div id="slider2">
				<div class="poster">
					<img src="resource/img/mov1.jpg" alt="포스터1">
				</div>
				<div class="infor">
					<div class="infor_btn">
						<a href="timepage.jsp">상영시간표</a>
                        <a href="reservepage.jsp">예매하기</a>
					</div>
				</div>
			</div>
			<div id="slider2">
				<div class="poster">
					<img src="resource/img/mov2.jpg" alt="포스터2">
				</div>
				<div class="infor">
					<div class="infor_btn">
						<a href="timepage.jsp">상영시간표</a>
                        <a href="movieinfopage.jsp">예매하기</a>
					</div>
				</div>
			</div>
			<div id="slider2">
				<div class="poster">
					<img src="resource/img/mov3.jpg" alt="포스터3">
				</div>
				<div class="infor">
					<div class="infor_btn">
						<a href="timepage.jsp">상영시간표</a>
                        <a href="movieinfopage.jsp">예매하기</a>
					</div>
				</div>
			</div>
			<div id="slider2">
				<div class="poster">
					<img src="resource/img/mov4.jpg" alt="포스터4">
				</div>
				<div class="infor">
					<div class="infor_btn">
						<a href="timepage.jsp">상영시간표</a>
                        <a href="movieinfopage.jsp">예매하기</a>
					</div>
				</div>
			</div>
			<div id="slider2">
				<div class="poster">
					<img src="resource/img/mov5.jpg" alt="포스터5">
				</div>
				<div class="infor">
					<div class="infor_btn">
						<a href="timepage.jsp">상영시간표</a>
                        <a href="movieinfopage.jsp">예매하기</a>
					</div>
				</div>
			</div>		
		</div>		
	</section>
	<footer> 
        <ul>
            <li><a href="#">법적고지</a></li>
            <li><a href="#">개인정보취급방침</a></li>
            <li><a href="#">개인정보처리방침</a></li>
        </ul>
        <p>
          상호명:KH정보교육원<br>
          대표자:양진선<br>
          개인정보관리책임자:양진선<br>
          상담전화:1544-9970<br>
          당산지원 : 선유동2로 57 이레빌딩(구관) 19F, 20F<br>
        </p>
      </footer>
</body>
</html>