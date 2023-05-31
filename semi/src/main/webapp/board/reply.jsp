<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	String nowPage = request.getParameter("nowPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/replypage.css" />
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
	<section id="replyboard">
	<div>
	<form method="post" name="boardReply" action="boardReply">
		<table align="center">
			<tr>
				<th colspan="2" bgcolor="#813477">답변하기</th>
			</tr>
			<tr>
				<td width="20%">성명</td> 
				<td width="80%"><input name="name" class="upinput"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="답변 : <%=bean.getSubject() %>" class="upinput"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50" class="upinput">
					<%=bean.getContent() %>
				</textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required class="upinput"></td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onclick="history.back()">
				</th>
			</tr>
		</table>
		
		<!--나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		
		<!--앞에서 넘어온 값 -->
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<!--부모글의 정보 -->
		<input type="hidden" name="ref" value="<%=bean.getRef() %>">
		<input type="hidden" name="pos" value="<%=bean.getPos() %>">
		<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
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