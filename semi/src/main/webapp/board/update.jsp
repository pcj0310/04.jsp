<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	
	BoardBean bean = (BoardBean)session.getAttribute("bean");
/* 	String name = bean.getName();
	String subject = bean.getSubject();
	String content = bean.getContent(); */
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/updatepage.css" />
<style>
	th{padding:5px; color:white;}
</style>
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
							<li><a href="#">카페메뉴</a></li>
							<li><a href="list.jsp">게시판</a></li>
							<%
							String id = (String)session.getAttribute("idKey");
							
							if (id == null) {
							%>
							<li><a href="../member/login.jsp">로그인</a></li>
							<%
							} else {
							%>
							<li><a href="../member/logout.jsp">로그아웃</a></li>
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
                            <li class="purple"><a href="#">고객센터</a></li>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
	</section>
	<!-- 기본상단 디자인 -->
	<section id="upboard">
	<div>
	<form method="post"  name="updateFrm" action="boardUpdate">
		<table align="center">
			<tr>
				<th colspan="2" bgcolor="#813477">수정하기</th>
			</tr>
			<tr>
				<td width="20%">성 명</td> 
				<td width="80%"><input name="name" value="<%=bean.getName() %>" class="upinput"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="<%=bean.getSubject() %>" class="upinput"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"" class="upinput"><%=bean.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="upinput" required></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정완료">&emsp;
					<input type="reset" value="다시수정">&emsp;
					<input type="button" value="뒤로" onclick="history.go(-1)">
				</th>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
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