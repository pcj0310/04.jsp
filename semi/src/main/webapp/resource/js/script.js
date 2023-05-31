function inputIdChk(){
	regFrm.idbtncheck.value = "idUncheck";
}
function idCheck(id) {
	regFrm.idbtncheck.value = "idCheck";
	if(id== "") {
		alert("아이디를 입력해 주세요");
		regFrm.id.focus();
		return;
	}
	url = "idCheck.jsp?id=" + id;	/* 파일명?넘겨줄파라미터이름=파라미터값 */
	window.open(url, "IDChek", "width=300, height=150");
}

function inputCheck() {
	if(regFrm.id.value == "") {
		alert("아이디를 입력해 주세요");
		regFrm.id.focus();
		return;
	}
	if(regFrm.idbtncheck.value != "idCheck") {
		alert("아이디 중복체크를 해주세요");
		return;
	}
	if(regFrm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요");
		regFrm.pwd.focus();
		return;
	}
	if(regFrm.repwd.value == "") {
		alert("비밀번호를 다시한번 입력해 주세요");
		regFrm.repwd.focus();
		return;
	}
	if(regFrm.pwd.value != regFrm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		regFrm.repwd.value="";
		regFrm.repwd.focus();
		return;
	}
	if(regFrm.name.value == "") {
		alert("이름을 입력해 주세요");
		regFrm.name.focus();
		return;
	}
	regFrm.submit();
}