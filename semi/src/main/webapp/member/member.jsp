<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resource/css/memstyle.css" />
<script src="../resource/js/script.js" type="text/javascript" charset="UTF-8"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				let roadAddr = data.roadAddress
				let jibunAddr = data.jibunAddress
				let extraAddr = '';
				document.getElementById("postcode").value = data.zonecode;
				if (data.userSelectedType == 'R') {
					if (roadAddr != '') {
						if (data.bname != '') {
							extraAddr += data.bname;
						}
						if (data.buildingName != '') {
							extraAddr += extraAddr != '' ? ', '
									+ data.buildingName : data.buildingName;
						}
						roadAddr += extraAddr != '' ? '(' + extraAddr + ')'
								: '';
						document.getElementById("addr").value = roadAddr;
					}
				} else if (data.userSelectedType == 'J') {
					document.getElementById("addr").value = jibunAddr;
				}
				document.getElementById("detailAddr").focus();
			}
		}).open();
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
	<!-- 기본 상단 디자인 -->
	<form name="regFrm" id="logmem" method="post" action="memberProc.jsp">
		<table border="0" align="center"
			style="border-collapse: separate">
			<tr><!-- 회원가입 제목 칸 -->
				<th colspan="3" align="center">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input name="id" placeholder="아이디 입력(6~20자)" onkeydown="inputIdChk();" type="text"> 
					<input type="button" id="idch" value="중복확인" onclick="idCheck(this.form.id.value);">
					<input type="hidden" id="idchhd"name="idbtncheck" value="idUncheck">
				</td>
				<td>영문과 숫자로만 입력하세요</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>비밀번호를 적어주세요(문자,숫자,특수기호중 반드시 1개이상 넣으세요)</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>위에넣은 비밀번호와 동일한 비밀번호를 넣으세요</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>이름을 넣으세요</td>
			</tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="1" id="rm">남
				<input type="radio" name="gender" value="2" id="rf">여</td>
			<td>성별을 선택해주세요</td>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birthday"></td>
				<td>6글자로 입력.ex) 190315</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="email" name="email"></td>
				<td>ex)email@naver.com</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
				<input name="zipcode" id="postcode" readonly>
				<input type="button" id="postbtn" value="우편번호 찾기" onclick="findAddr();"></td>
				<td>우편번호를 검색하세요</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="addr" size="60" readonly><br />
					<input type="text" name="detailAddress" id="detailAddr"></td>
				<td>상세주소가 있으면 입력해주세요</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" class="btmbtn" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset" class="btmbtn" value="다시쓰기">&emsp;
					<input type="button" class="btmbtn" value="로그인" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
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