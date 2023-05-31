<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;		// 전체레코드수
	int numPerPage = 10;		// 1페이지당 레코드 수
	int pagePerBlock = 5;		// 블록당 보여줄 페이지수 [1][2][3][4][5]
			
	int totalPage = 0;			// 전체페이지수  ex) 72개 [1][2][3][4][5][6][7][8]
	int totalBlock = 0;			// 전체블록수	  ex) 2개

	int nowPage = 1;			// 현재 해당하는 페이지
	int nowBlock = 1;			// 현재 해당하는 블록

	int start = 0;				// DB테이블의 select시작번호
	int end = 0;				// 가져온 레코드중에서 10개씩만 가져오기
	int listSize = 0;			// 현재 읽어온 게시물의 수
	
	String keyWord="", keyField="";
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	/* [처음으로]를 누를 때 */
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 

	start = ((nowPage*numPerPage)-numPerPage) + 1;
	end = nowPage*numPerPage;
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);	// 전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 현재블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체블럭 계산
	String id = (String)session.getAttribute("idKey");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/listpage.css" />
<style>
	a:link{text-decoration:none; color:black;}
	a:hover{text-decoration:yes; color: #6e40c4;}
	a:visited{text-decoration:none; color:black;}
</style>
<script>
	function read(num) {
		readFrm.num.value = num;
		readFrm.action = "read.jsp";
		readFrm.submit();
	}
	function list() {
		listFrm.action = "list.jsp";
		listFrm.submit();
	}
	function block(value) {
		readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		readFrm.submit();
	}
	function pageing(page) {
		readFrm.nowPage.value = page;
		readFrm.submit();
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
                            <li class="white"><a href="#">상영시간표</a></li>
                            <li class="purple"><a href="#">고객센터</a></li>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
	</section>
	<!-- 기본상단 디자인 -->
	<section id="mblist">
	<div id="movboard">
	<h2 align="center">영화요청게시판</h2>
	<table align="center" width="700px">
		<tr>
			<td colspan="5" >총 : <%=totalRecord %>게시물 (현재 <%=nowPage %> / 총 <%=totalPage %>)Page</td>
		</tr>		
		<tr id="boardhead">
			<th width="10%">번호</th>
			<th width="40%">제목</th>
			<th width="15%">이름</th>
			<th width="25%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
		<%		
			ArrayList<BoardBean> alist = bMgr.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			
			for(int i=0; i<end; i++) {
				if(i == listSize)
					break;
				BoardBean bean = alist.get(i);
				
				int num = bean.getNum();
				String subject = bean.getSubject();
				String name = bean.getName();
				String regdate = bean.getRegdate().substring(0,10);
				int count = bean.getCount();
				int depth = bean.getDepth();
		%>
		<tr>
			<td><%=totalRecord-(nowPage-1)*numPerPage-i %></td>
			<td>
				<%
					if(depth > 0) {
						for(int j=0; j<depth; j++) {
							out.print("&emsp;");
						}
						out.print("⨽");
					}
				%>
				<a href="javascript:read('<%=num %>')"><%=subject %></a></td>
			<td><%=name %></td>
			<td><%=regdate %></td>
			<td><%=count %></td>
		</tr>
		<%
			}
		 %>
		<tr>
			<td colspan="5"><br/><br/></td>
		</tr>
		<tr>
			<!-- 페이징처리 시작 -->
			<td colspan="3" align="center">
			<%
			// 블럭 1 [1][2][3][4][5]   블록2  [6][7][8][9][10]  블록3  [11]
			int pageStart = (nowBlock-1) * pagePerBlock + 1;  // 블록1 = 1,  블록2 = 6, 블록3 = 11
			int pageEnd = pageStart + pagePerBlock <= totalPage ? pageStart + pagePerBlock : totalPage+1;
			if(totalPage != 0) {
				if(nowBlock > 1) {
			%>
					<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>&nbsp;
			<%
				}
				for(; pageStart<pageEnd; pageStart++) {
			%>
					<a href="javascript:pageing('<%=pageStart%>')">[<%=pageStart%>]</a>&nbsp;
			<%
				}
				if(totalBlock > nowBlock) {
			%>
					<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>
			<%
				}
			}
			%>
			</td>
			<!-- 페이징처리 끝 -->
			<td colspan="2" align="right">
			<%if (id == null) { %>
				<a href = "../member/login.jsp" class="movmove">로그인</a>&nbsp;
				<a href = "../mainpage.jsp" class="movmove">메인으로</a>
			<%
			  } else {
			%>
				<a href = "post.jsp" class="movmove">글쓰기</a>&nbsp;
				<a href = "../mainpage.jsp" class="movmove">메인으로</a>
			<%
			  }
			%>
			</td>
		</tr>
	</table>
	<hr width="700"/>
	<form name="searchFrm" method="get" action="list.jsp">
		<table align="center" width="700">
			<tr>
				<td align="center">
					<select name="keyField">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input name="keyWord" required>
					<input type="submit" value="찾기">
					<input type="hidden" name="nowPage" value="1">
				</td>
			</tr>
		</table>
	</form>
	</div>
	</section>
	<!-- [처음으로] 누르면 화면이 reload -->
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<!-- 제목을 누르면 상세보기 페이지로 갈때 파라미터 값 -->
	<form name="readFrm" method="get">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
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