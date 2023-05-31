<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/movieadd.css" />
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
	<!-- 기본상단 디자인 -->
    <section id="movvv">
    <form action="movie" method="post">
    	<h2>영화 등록</h2>
        <div>
            <label for="title">영화 제목:</label>
            <input type="text" name="title" required>
        </div>
        <div>
            <label for="date">상영일:</label>
            <input type="text" name="date" required>
        </div>
        <div>
            <label for="director">감독:</label>
            <input type="text" name="director" required>
        </div>
        <div>
            <label for="image">이미지 URL:</label>
            <input type="text" name="image" required>
        </div>
        <div>
            <label for="info">영화 정보:</label>
            <textarea name="info" rows="4" required></textarea>
        </div>
        <div>
            <input type="submit" value="등록">
        </div>
    </form>
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