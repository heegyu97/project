<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품조회 구매자</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		div.pname{
				width: 150px;
				white-space: nowrap;
			 	overflow: hidden;
	 			text-overflow: ellipsis;
			}
			a{
				text-decoration : none;
				color: black;
				font-size: 25px;
			}
		th{
			width : 115px;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
			<table class="table table-hover">
				<tbody>
					<tr>
						<th colspan = "4"><h3>주문자 정보</h3></th>
					</tr>
					<tr>
						<th> 주문번호 </th>
						<td colspan="3">
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 주문자 </th>
						<td>
							<input type="text" id="m_h_name" name="m_h_name" class="form-control" readonly>
						</td>
						<th> 주문일자 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 전화번호 </th>
						<td>
							<input type="text" id="m_h_name" name="m_h_name" class="form-control" readonly>
						</td>
						<th> 이메일 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					
					<tr>
						<th colspan = "4"><h3>상품정보</h3></th>
					</tr>
					<tr>
						<th>카테고리</th>
						<td colspan = "3">
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 상품명 </th>
						<td colspan="3">
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<input type="text" id="m_h_name" name="m_h_name" class="form-control" readonly>
						</td>
						<th>가격</th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					
					
					
					<tr>
						<th colspan = "4"><h3>판매자 정보</h3></th>
					</tr>
					<tr>
						<th> 판매자 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
						<th> 전화번호 </th>
						<td>
							<input type="text" id="m_h_name" name="m_h_name" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 회사명 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
						<th> 회사전화번호 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
				</tbody>
			</table>

			<a href="${pageContext.request.contextPath}/manager/saleshistory">
			<button class="btn btn-warning float-right mr-4"> 이전 </button>
		</a>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>