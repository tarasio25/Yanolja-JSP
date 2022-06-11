<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 페이지</title>

<style>
select {
	width: 200px;
	padding: .8em .5em;
	font-family: inherit;
	background: url('이미지 경로') no-repeat 95% 50%;
	border: 1px solid #999;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
	
	window.onload = function(){
	new daum.Postcode({	
	    oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
	
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
       		 }).open();
    	});
	}
	
	function sendIt() {	
		var f = document.myForm;
		if(!f.guestId.value) {
			alert("아이디를 입력하세요!");
			document.myForm.guestId.Focus();
			return;
		}
		if(!f.guestPwd.value) {
			alert("비밀번호를 입력하세요!");
			document.myForm.guestPwd.Focus();
			return;
		}

		if(f.guestPwd.value != f.guestPwd2.value) {
			alert("비밀번호를 똑같이 입력하세요!");
			document.myForm.guestPwd2.Focus();
			return;
		}	
		
		if(!f.guestName.value) {
			alert("이름을 입력하세요!");
			document.myForm.guestName.Focus();
			return;
		}

		if(!f.guestGender.value == "성별") {
			alert("성별을 입력하세요!");
			document.myForm.guesGender.Focus();
			return;
		}

		if(!f.guestEmail.value) {
			alert("이메일을 입력하세요!");
			document.myForm.guestmail.Focus();
			return;
		}
		
		if(!f.guestTel.value) {
			alert("휴대전화를 선택 하세요!");
			document.myForm.guestTel.Focus();
			return;
		}

		if(f.guestTel.value.length != 11) {
			alert("휴대전화를 11자리로 입력 하세요!");
			document.myForm.phone.Focus();
			return;
		}	
		
		if(!f.address.value) {
			alert("주소를 입력하세요!");
			document.myForm.address.Focus();
			return;
		}
				
		if(!f.address_detail.value) {
			alert("상세주소를 입력하세요!");
			document.myForm.address_detail.Focus();
			return;
		}
			
		alert("회원가입이 성공하였습니다.")
		f.action = "<%=cp%>/project/join_ok.do";						
		f.submit();
	}

</script>
</head>
<body>
<center>

<!-- 로고 -->
<header>
<table width="100%">
<tr height="50">
	<td width="20%"></td>
	<td width="60%" align="center"><a href="<%=cp %>/project/main.do">
		<img src="<%=cp%>/css/img/logo.svg">
	</a></td>
	
	<td width="20%" align="right" style="padding-right: 20px">
	
		
	</td>
</tr>
</table>
</header>

<!-- 연관상품(키워드가 같은 것) -->
<br/><br/><br/><br/><br/><br/>

<form action="" method="post" name="myForm">
<table class="section">
<tr height="300" align="left">
	<td>
	<table width="100%">
	<tr><td>아이디</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestId" class="text" placeholder ="아이디 입력" style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr><td>비밀번호</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="password" name="guestPwd" class="text" placeholder ="비밀번호를 입력해주세요" style="width: 100%"/></td>
	</tr>
	
	<tr height="20"><td></td></tr>
	<tr><td>비밀번호 재확인</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="password" name="guestPwd2" class="text" placeholder ="비밀번호를 다시 입력해주세요" style="width: 100%"/></td>
	</tr>
	
	<tr height="20"><td></td></tr>
	
	<tr><td>이름</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestName" class="text" placeholder ="이름을 입력해주세요." style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>성별</td></tr>
	<tr height="10"><td><select name = "guestGender" class="text">
					<option>성별</option>
					<option>남자</option>
					<option>여자</option>
		</select></td></tr>
	<tr>
	<td>
		
	</td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>생년월일</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestBirth" class="text" placeholder ="ex ) 19990909" style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>전화번호</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestTel" class="text" placeholder ="ex ) 01011112222" style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>이메일</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestEmail" class="text" placeholder ="ex ) @email.com" style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>주소</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" id = "address_kakao" name="address" class="text" placeholder ="주소 입력" style="width: 100%" readonly/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	<tr><td>상세 주소</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="address_detail" class="text" placeholder ="상세 주소" style="width: 100%"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" class="pb" name="idpwdSearch_ok" value=" 가입완료 " onclick="sendIt();"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="wb" name="join_ok" value=" 가입취소 " onclick="location.href='<%=cp %>/loginPage/loginPage.jsp';"/>
		</td>
	</tr>
	
	<tr height="20"><td></td></tr>
	</table>
	
	</td>
</table>
</form>
<!-- 회사 사항 + 링크페이지 -->
<br/><br/>
<table width="60%" style="background-color: #eee;">

	<tr> <td> <img src="<%=cp %>/mainPage/img//ico-logo-gray.svg" alt="야놀자"> </td> </tr>
	
	<tr>
		<td>
		<b>(주)야놀자</b> | 대표이사 : 이수진 | 사업자 등록번호 : 220-87-42885 | 통신판매업신고 : 강남-14211호 | 메일 : help@yanolja.com<br>
		관광사업자 등록번호 : 제2016-31호 | 주소 : 서울 강남구 테헤란로 108길 42 | 호스팅서비스 제공자 : 주식회사 야놀자<br>
		고객센터 : 1644-1346 (오전 9시 - 익일 새벽 3시)
		</td>
	</tr>
	<tr>
		<td>
		<a href="https://yanolja.in/ko/companyinfo/" target="_blank">회사소개</a>
		<a href="https://business.yanolja.com/web/kr/index" target="_blank">광고제휴문의</a>
		<a href="https://careers.yanolja.co/" target="_blank">인재채용</a>
		<a href="http://m.policy.yanolja.com/?t=privacy&amp;d=m" target="_blank"><strong>개인정보처리방침</strong></a>
		</td>
	</tr>
	<tr>
		<td><a href="https://policy.yanolja.com/?t=youth" target="_blank">청소년 보호 정책</a>
		<a href="http://m.policy.yanolja.com/?t=service&amp;d=m" target="_blank">서비스 이용약관</a>
		<a href="http://m.policy.yanolja.com/?t=location&amp;d=m" target="_blank">위치정보이용약관</a>
		<a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208742885" target="_blank">사업자 정보확인</a>
		</td>
	</tr>
</table>
<br/><br/>

</center>
</body>
</html>