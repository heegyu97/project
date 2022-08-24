<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 주문조회 -guest</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
	<style type="text/css">
		td,th {
			text-align: center;
		}
	
	</style>
	</head>
	
	<body>
	<!-- 주문번호 상품명 수량  결제금액 주문상태  -->
	<!-- 배송지정보(받는사람 / 연략처 / 주소 ) / 총 상품수 / 총 구매금액/  총 할인금액 /총 결재 금액 -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%-- 
	<c:forEach var="op" items="${list}" begin = "0" end = "0">
	<h3>결제상세정보 (결제일자  ${op.ord_date} | 결제번호 ${op.ord_no})</h3>
	</c:forEach>
	<table>
		
		<thead>
			<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>수량</th>
			<th>결제금액</th>
			<th>주문상태</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="op" items="${list}">
			<tr>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			<td>${}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	 --%>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>