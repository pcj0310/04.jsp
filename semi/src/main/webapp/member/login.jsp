<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/loginpage.css" />
<script src="../resource/js/slideimg.js"></script>
<script src="../resource/js/script.js"></script>
</head>
<body>
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="../mainpage.jsp"> 
						<em><img src="../resource/img/movlogo.png" alt="MOVIE"></em>
						</a>
					</h1>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="../movieinfopage.jsp">영화정보</a></li>
							<li><a href="../board/list.jsp">게시판</a></li>
							<%
							if (id == null) {
							%>
							<li><a href="login.jsp">로그인</a></li>
							<%
							} else {
							%>
							<li><a href="logout.jsp">로그아웃</a></li>
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
	<!-- 기본 상단 디자인 -->
	<section id="login">
		<div class="logsucc">
			<%
				if(id != null) {
			%>
				<h4><%=id %>님 환영합니다</h4>
				<p>즐거운 하루 되세요</p>
				<a href="../mainpage.jsp">홈으로</a>&emsp;
			<%
				} else {
			%>
		</div>
		<div class="logpr">
				<form method="post" name="loginFrm" action="loginProc.jsp">
					<table align="center">
						<tr>
							<th colspan="3" align="center"><h1>LOGIN</h1></th>
						</tr>
						<tr>
							<td name="아이디"><input name="id" placeholder="아이디를 입력하세요" maxlength="20" required></td>
						</tr>
						<tr>
							<td name="비밀번호"><input type="password" name="pwd" placeholder="비밀번호를 입력하세요" maxlength="20" required></td>					
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="submit" value="로그인">
								<input type="button" value="홈으로" onclick="location.href='../mainpage.jsp'">
								<input type="button" value="회원가입" onclick="location.href='member.jsp'">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<% } %>
		
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