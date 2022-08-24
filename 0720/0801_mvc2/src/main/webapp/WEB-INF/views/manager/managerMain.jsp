<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 판매자</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
			
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3>  managerMain </h3>
		<table class="table ">
			<tbody align="center">
				<tr>
					<td>
				<%-- 회원관리 --%>
					<a href="${pageContext.request.contextPath}/manager/membermanagement">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_cart.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">Product Management</h5>
					</td>
					<td>
				<%-- 판매내역관리 --%>
					<a href="${pageContext.request.contextPath}/manager/saleshistory">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_list.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">Order Management</h5>
					</td>
				</tr>
				<tr>
					<td>
				<%-- 노하우 --%>
					<a href="${pageContext.request.contextPath}/tip/tip">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_knowhow.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">Know-How</h5>
					</td>
					<td>
				<%-- 이벤트 --%>
					<a href="${pageContext.request.contextPath}/event">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_event.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">Event</h5>
					</td>
				</tr>
				<tr>
					<td>
				<%-- 공지사항 --%>
					<a href="${pageContext.request.contextPath}/notice/notice">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_noti.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">Notice</h5>
					</td>
					<td>
				<%-- 마이페이지 --%>
					<a href="${pageContext.request.contextPath}/manager/myPage">
                        <img src = "${pageContext.request.contextPath}/resources/img/i_mypage.png" style="width:150px; height:150px;" >   
                     </a>
						<h5 style="font-family: Lucida Console; color: #EE8133">My Page</h5>
					</td>
				</tr>
		
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>