<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(result) {
		out.print(id + "는 이미 존재하는 ID입니다");
	} else {
		out.print(id + "는 사용가능 합니다");
	}
%>
<a href="#" onclick="self.close();">닫기</a>
</body>
</html>