<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<c:if test="${ flag == 1 }">
			<script>
				alert("${msg1}");
				location.href='<%=cp%>/project/login.do'
			</script>
		</c:if>
		<c:if test="${ flag == 0 }">
			<script>
				alert("${msg2}");	
				location.href='<%=cp%>/project/idpwdSearch.do'
			</script>
		</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
</html>