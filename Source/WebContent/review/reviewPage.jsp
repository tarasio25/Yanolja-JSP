<%@page import="reviewPage.ReviewDAO"%>
<%@page import="reviewPage.ReviewDTO"%>
<%@page import="util.DBConn"%>
<%@page import="java.util.List"%>
<%@page import="util.MyUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	Connection conn = DBConn.getConnection();
	ReviewDAO dao = new ReviewDAO(conn);

	MyUtil myUtil = new MyUtil();

	List<ReviewDTO> list = dao.getList();

	int maxNum = dao.getMaxNum();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 후기</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/main/css/style.css" />

</head>

<style>
div.container {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
	overflow-y: auto;
	border: solid 0px;
	height: 900px;
	width: 100%;
}

body {
	overflow-y: hidden;
	overflow-x: hidden;
}
</style>
<body>


	<center>

		<!-- 로고 -->
		<header>
		<table width="100%">
			<tr height="50">
				<td width="20%" align="left" style="padding-left: 20px"><a
					href="<%=cp%>/building3/building3Page.jsp"
					style="text-decoration: none">◀</a></td>
				<td width="60%" align="center" style="font-size: 20pt"><b>후기(총
						<%=dao.getMaxNum()%>개)
				</b></td>
				<td width="20%" align="right" style="padding-right: 20px">로그인/회원가입</td>
			</tr>
		</table>
		</header>


		<div class="container">

			<!-- 총 별점 -->

			<table width="100%" class="section" style="font-size: 22pt;">
				<tr height="100">

				</tr>


				<tr>
					<td></td>
					<td style="font-size: 40pt">★/5점</td>
				</tr>



				<tr height="1">
					<td width="10px"></td>
					<td colspan="3" bgcolor="#dbdbdb"></td>
					<td width="10px"></td>
				</tr>



				<!-- 최근 작성순 -->

				<tr>
					<td></td>
					<td colspan="4"><select
						style="width: 100px; height: 20px; border-style: none; font-color: blue">
							<option>최근 작성순</option>
							<option>별점 높은순</option>
							<option>별점 낮은순</option>
					</select></td>
				</tr>

				<tr height="1">
					<td width="10px"></td>
					<td colspan="3" bgcolor="#dbdbdb"></td>
					<td width="10px"></td>
				</tr>

			</table>




			<!-- 사용자 별점 -->

			<%
				for (ReviewDTO dto : list) {

					String buildingName = dao.searchBuilding(dto.getBuildingNum());
					String guestId = dao.searchGuest(dto.getGuestNum());
			%>
			<table class="section" style="font-size: 22pt;">


				<tr>
					<td rowspan="2" width="10px"></td>
					<td rowspan="2" width="10%" align="center"><img
						src="<%=cp%>/review/img/ico-emoji-5.svg"></td>
					<td align="left"><%=dto.getReviewStar()%> / 5 점</td>
					<td align="right"><%=dto.getReviewCreated()%></td>
				</tr>

				<tr>
					<td><%=guestId%> / <%=buildingName%></td>
				</tr>

				<tr>
					<td></td>
					<td colspan="2" style="font-size: 16pt;"><%=dto.getReviewComment()%></td>
					<td></td>
				</tr>

				<tr height="1">
					<td width="10px"></td>
					<td colspan="3" bgcolor="#dbdbdb"></td>
					<td width="10px"></td>
				</tr>


			</table>
			<%
				}
			%>

		</div>






		<br /> <br />

	</center>
</body>
</html>