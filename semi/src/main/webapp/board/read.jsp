<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bMgr.upCount(num);
	BoardBean bean = bMgr.getBoard(num);
	session.setAttribute("bean", bean);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/readpage.css" />
<style>
	th{padding: 5px; color:white;}
	.color{background-color: #FFD9FA; width:15%; text-align: center; color: white;}
</style>
<script>
	function download(filename) {
		downFrm.filename.value = filename;
		downFrm.submit();
	}
	function list() {
		listFrm.submit();
	}
</script>
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
	<section id="readboard">
	<div>
	<table width="800px" id="rbtable" >
		<tr>
            <th colspan="4" align="center" bgcolor="#813477">글 읽 기</th>
        </tr>
        <tr>
            <td class="color">이름</td>
            <td><%=bean.getName() %></td>
            <td class="color">등록날짜</td>
            <td><%=bean.getRegdate().substring(0,10) %></td>
        </tr>
        <tr>
            <td class="color">제목</td>
            <td colspan="3"><%=bean.getSubject() %></td>
        </tr>
        <tr>
            <td class="color">첨부파일</td>
            <td colspan="3">
            <%
            if(bean.getFilename() != null && !bean.getFilename().equals("")) {
            %>
            	<a href="javascript:download('<%=bean.getFilename() %>')"><%=bean.getFilename() %></a>&emsp;
            	(<%=bean.getFilesize() %> KByte)
            <%
            } else {
            	out.print("등록된 파일이 없습니다");
            }
            %>
            </td>
        </tr>
        <tr>
            <td colspan="4" height="100px"><pre><%=bean.getContent() %><pre></td>
        </tr>
        <tr>
			<td colspan="4" align="right"><%=bean.getIp() %>로 부터 글을 남기셨습니다 / 조회수 <%=bean.getCount() %></td>
		</tr>
        <tr>
			<td colspan="4" align="center">
				<a href="javascript:list()">리스트</a> 
				<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">수 정</a>
				<a href="reply.jsp?nowPage=<%=nowPage%>" >답 변</a>
				<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a>
			</td>
		</tr>
	</table>
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>
	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<% if(!(keyWord==null || keyWord.equals(""))) {  %>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<% } %>
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




