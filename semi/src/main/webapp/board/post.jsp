<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/postpage.css" />
<style>
	th{padding:5px; color:white; }
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
	<section id="boardwrt">
	<form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<th colspan="2" bgcolor="#813477">글 쓰 기</th>
			</tr>
			<tr>
				<td width="20%">성 명</td>
				<td width="80%"><input name="name" class="upinput"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" class="upinput"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50" class="upinput"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="upinput"></td>
			</tr>
			<tr>
				<td>파일찾기</td>
				<td>
					<div class="filebox">
    					<input class="upload-name" value="첨부파일" placeholder="첨부파일">
    					<label for="file">파일찾기</label> 
    					<input type="file" id="file">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="리스트" onclick="location.href='list.jsp'">
				</th>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
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



