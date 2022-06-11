<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>야놀자 | 여행의 모든 것</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>

<script type="text/javascript">

	function searchpw(){
		
		var f = document.myForm;
		
		if(!f.guestPwd.value){//값이 없으면
			alert("패스워드를  입력하세요!");
			f.guestPwd.focus();
			return;
		}
		
		
		f.action = "<%=cp%>/project/deleted_ok.do";
		f.submit();	
		
	}

</script>


</head>
<body>


<header>
	<table width="100%">
		<tr height="30" >
			<td width="20%" ></td>
			<td width="60%" align="center"><img src="<%=cp%>/css/img/logo.svg"></td>
			<td width="20%" align="right" style="padding-right: 20px">로그인/회원가입</td>
		</tr>
	</table>
</header>
<center>

<form action="" method="post" name="myForm">
<table width="60%" class="section">
<tr height="50"><td></td></tr>
<tr>
<td align="center">회원님의 소중한 개인정보를 안전하게 보호하기 위해 <br/>
비밀번호를 한번 더 입력해주세요.</td>
</tr>
<tr height="2"><td></td></tr>
	<tr><td>비밀번호</td></tr>
	<tr height="1"><td></td></tr>
	<tr>
		<td><input type="password" name="guestPwd" class="text" style="width: 95%;"/></td>
	</tr>
	<tr height="250"><td></td></tr>
	
	<tr><td><input type="button" class="pb" value="확&nbsp;&nbsp;&nbsp;인" onclick="searchpw();"/></td></tr>
</table>
</form>

</center>

</body>
</html>