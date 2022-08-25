<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 주 문 서 </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
		table{
			margin-left: auto;
			margin-right: auto;
			table-layout: fixed;
		}
		div.pname{
			width: 300px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
		a{
			text-decoration : none;
			color: black;
			font-size: 25px;
		}
		.pagination{
			justify-content : center;
		}
		.pagination a {
		  color: black;
		  float: left;
		  text-decoration: none;
/*  	  background-color: #DACCBF;  *//*살짝진한갈색*/
/* 		  background-color: #e8e0d6; *//*배경색이랑 같음,연한갈색*/
		  background-color: none;
		}
		.pagination a.active {
		  background-color: #B1997D;
		  color: white;
		  border-radius: 5px;
		}
		
		.pagination a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}
		.order_check_box{
			width: 35px;
			height: 35px;
			
		}
		
		
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3 class="text-center"> 주 문 서 </h3>
		
		
		
		<hr>
		<table class="table table-hover">
			<col class="col-1">
			<thead>
				<tr>
					<th> 썸네일 </th>	<th> 상품명 </th>
					<th> 단가 </th>	<th> 구매 수량 </th>	<th> 구매 금액 </th>
					<th> 할인 금액 </th>	<th> 실 구매 금액 </th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum_product_class_qty" value="0" />
				<c:set var="sum_buy_amt" value="0" />
				<c:set var="sum_discount_amt" value="0" />
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
					<c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.pro_price * dto.b_stock)}" />
					<c:set var="sum_discount_amt" value="${sum_discount_amt + ( (dto.pro_price - dto.total_dc) * dto.b_stock )}" />
					<tr>
						<td width="10%">
							<img src="${dto.pro_thum_path}" class="img-thumbnail">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/detail?pro_no=${dto.pro_no}">
								${dto.pro_name}
							</a>
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###원">
								${dto.pro_price}
							</fmt:formatNumber>
						</td>
						<td> ${dto.b_stock} 개 </td>
						<td>
							<fmt:formatNumber pattern="###,###,###원">
						 		${dto.pro_price * dto.b_stock}
						 	</fmt:formatNumber>
						 </td>
						<td class="text-danger">
							<fmt:formatNumber pattern="###,###,###원">
						 		-${ (dto.pro_price - dto.total_dc) * dto.b_stock}
						 	</fmt:formatNumber>
						 </td>
						<td> 
							<fmt:formatNumber pattern="###,###,###원">
								${dto.pro_price * dto.b_stock - ( (dto.pro_price - dto.total_dc) * dto.b_stock )}
							</fmt:formatNumber>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		
		<table class="table">
			<col class="col-2">
			<col class="col-6">
			<tbody>
				<tr>
					<th style="text-align: center;">
						배송 메모
					</th>
					<td>
						<select id="memo" name="memo" style="width: 400px">
							<option value="0">배송 메모를 선택하세요.</option>
							<option value="문앞에 놓아주세요.">문앞에 놓아주세요.</option>
							<option value="경비실에 놓아주세요.">경비실에 놓아주세요.</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="col-6 float-left">
				<table class="table">
					<tr>
						<th> 배송지 : </th>
						<td class="text-right"> <h5> ${deliverylist[0].addr_name}</h5> </td>
					</tr>
					<tr>
						<th> 받는 분 : </th>
						<td class="text-right"> ${deliverylist[0].recipient_name} </td>
					</tr>
					<tr>
						<th> 연락처 : </th>
						<td class="text-right"> ${deliverylist[0].tel} </td>
					</tr>
					<tr>
						<th> 주소 :  </th>
						<td class="text-right">
							${deliverylist[0].post_code},${deliverylist[0].addr1} ${deliverylist[0].addr2}
						</td>
					</tr>
					
				</table>
			</div>
			
			<div class="col-6 float-right">
				<table class="table">
					<tr>
						<th> 총 상 품 수 </th>
						<td class="text-right">
							<span id="span_sum_product_class_qty">
								<fmt:formatNumber pattern="###,###,###원">
									${sum_product_class_qty}
								</fmt:formatNumber>
							</span>
						</td>
					</tr>
					<tr>
						<th> 총 구 매 금 액 </th>
						<td class="text-right">
							<span id="span_sum_buy_amt">
								<fmt:formatNumber pattern="###,###,###원">
									${sum_buy_amt}
								</fmt:formatNumber>
							</span> 
						</td>
					</tr>
					<tr>
						<th> 총 할 인 금 액 </th>
						<td class="text-right text-danger">
							-<span id="span_sum_discount_amt">
								<fmt:formatNumber pattern="###,###,###원">
									${sum_discount_amt}
								</fmt:formatNumber>
							</span> 
						</td>
					</tr>
					<tr>
						<th> <h3>총 결 제 금 액</h3> </th>
						<td class="text-right">
							<h3>
								<span id="span_sum_total_buy_amt">
									<fmt:formatNumber pattern="###,###,###원">
										${sum_buy_amt - sum_discount_amt}
									</fmt:formatNumber>
								</span>
							</h3> 
						</td>
					</tr>
					
				</table>
			</div>
			
			
			<button id="order_btn" class="btn btn-danger btn-block"> 결 제 하 기 </button>
			
			
			<%--배송지 정보 불러오기 --%>
			
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	

	<script type="text/javascript">
	
	let arr_basket_no = ${arr_basket_no};
	let str_basket_no = "";
	$.each( ${arr_basket_no}, function(idx, str) {
		//alert(idx + " : " + str);
		if(idx == 0){
			str_basket_no = str_basket_no + str;
		} else {
			str_basket_no = str_basket_no + "," + str;
		}
	});//each
	
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_choice_btn").click(function() {

			$("#td_delivery").html( $("#td_delivery" + $(this).attr("name") ).html() );
			$("#addr_no").val( $(this).val() );
			$("#delivery_choice_modal").modal("hide");

		});//click
	});//ready
	</script>

	

	

	

	<script type="text/javascript">
	$(document).ready(function() {
		$("#order_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/order/insert"
					, {
						ord_addr_no : ${deliverylist[0].addr_no}
						, ord_stock : $("#span_sum_product_class_qty").text()
						, ord_sum : $("#span_sum_buy_amt").text()
						, ord_dc_pay : $("#span_sum_discount_amt").text()
						, ord_pay : $("#span_sum_total_buy_amt").text()
						, str_basket_no : str_basket_no
							
					}
					, function(data, status) {
						if(data >= 1){
							alert("주문을 성공적으로 등록 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/basketlist";
						} else if(data <= 0){
							alert("주문 등록을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	</body>
</html>
