<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 장바구니 목록 </title>
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
		<h3 class="text-center"> 장바구니  </h3>
		<hr>
		
		
		
		
		
		
		<%--배송지 start--%>
		<div class="row">
				<table class="table table-hover table-borderless">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/delivery/deliveryform">
								<button type="button" class="btn btn-primary btn-sm mb-3 form-control">
									배 송 지 추 가
								</button>
							</a>
							<button id="delivery_btn" type="button" class="btn btn-primary btn-sm form-control"
							 		data-toggle="modal" data-target="#delivery_choice_modal">
								배 송 지 선 택
							</button>
						</td>
					</tr>
					<tr>
						<td id="td_delivery">
							<c:choose>
								<c:when test="${deliverylist != null && deliverylist[0] != null}">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">배송지 : ${deliverylist[0].addr_name}</h5>
											<p class="card-text">받는 분 : ${deliverylist[0].recipient_name} ( 연락처 : ${deliverylist[0].tel} )</p>
											<p class="card-text">( ${deliverylist[0].post_code} ) ${deliverylist[0].addr1} ${deliverylist[0].addr2}</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<h5> 등록된 배송지가 없습니다. </h5>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<input type="hidden" id="addr_no" name="addr_no"
					<c:if test="${deliverylist != null && deliverylist[0] != null}">
						value="${deliverylist[0].addr_no}"
					</c:if>
				>
		</div>
		<%--배송지 end--%>
<!-- 		<table class="table"> -->
<%-- 			<col class="col-2"> --%>
<%-- 			<col class="col-6"> --%>
<!-- 			<tbody> -->
<!-- 				<tr> -->
<!-- 					<th style="text-align: center;"> -->
<!-- 						배송 메모 -->
<!-- 					</th> -->
<!-- 					<td> -->
<!-- 						<select id="memo" name="memo" style="width: 400px"> -->
<!-- 							<option value="0">배송 메모를 선택하세요.</option> -->
<!-- 							<option value="문앞에 놓아주세요.">문앞에 놓아주세요.</option> -->
<!-- 							<option value="경비실에 놓아주세요.">경비실에 놓아주세요.</option> -->
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
		
		
		
		
		
		
		
		
		
		
		
		<hr>		
		<table class="table table-hover">
			<col class="col-1">
			<thead>
				<tr>
					<th> 선택 </th>	<th> 썸네일 </th>	<th> 상품명 </th>
					<th> 단가 </th>	<th> 구매 수량 </th>	<th> 구매 금액 </th>
					<th> 할인 금액 </th>	<th> 실 구매 금액 </th>	<th> 삭제 </th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum_product_class_qty" value="0" />
				<c:set var="sum_buy_amt" value="0" />
				<c:set var="sum_discount_amt" value="0" />
				
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
					<c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.pro_price * dto.b_stock)}" /><!-- 총구매 금액 :단가 * 주문 수량 -->
					<c:set var="sum_discount_amt" value="${sum_discount_amt + ( (dto.pro_price - dto.total_dc) * dto.b_stock )}" />
					<tr>
						<td>
							<input type="checkbox" class="order_check_box" checked="checked" id="${dto.pro_price}" name="${dto.total_dc}" value="${dto.b_stock}">
							<input type="hidden" id="b_no${status.index}" name="b_no${status.index}" value="${dto.b_no}">
							<%--index는 forEach에 모든 변수값들을 말한다 --%>
						</td>
						<td width="10%">
							<img src="${dto.pro_thum_path}" class="img-thumbnail">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/guest/detail?pro_no=${dto.pro_no}">
								${dto.pro_name}
							</a>
						</td>
						<td> 
							<fmt:formatNumber pattern="###,###,###원">
								${dto.pro_price}
							</fmt:formatNumber> 
						</td>
						<td>
							<select id="b_stock" name="b_stock">
								<c:forEach var="tmp_qty" begin="1" end="10">
									<option value="${tmp_qty}"
										<c:if test="${dto.b_stock == tmp_qty}"> selected="selected"</c:if>
									> ${tmp_qty} </option>
								</c:forEach>
							</select>
							<button type="button"  class="btn btn-sm btn-success qty_chg_btn" value="${dto.b_no}">변경</button>
						</td>
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
						<td>
							<button class="basket_delete_btn btn btn-danger btn-sm" value="${dto.b_no}"> X </button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<table class="table">
			<tr>
				<td rowspan="5"> <h4>전 체 합 계</h4> </td>
				<th> 총 상 품 수 </th>
				<td class="text-right"> <span id="span_sum_product_class_qty"> ${sum_product_class_qty}</span> 개 </td>
			</tr>
			<tr>
				<th> 총 구 매 금 액 </th>
				<td class="text-right"> <span id="span_sum_buy_amt">
				<fmt:formatNumber pattern="###,###,###원">
				 	${sum_buy_amt}
				 </fmt:formatNumber>
				 </span></td>
			</tr>
			<tr>
				<th> 총 할 인 금 액 </th>
				<td class="text-right text-danger"> <span id="span_sum_discount_amt">
					<fmt:formatNumber pattern="###,###,###원">
					 -${sum_discount_amt} 
					</fmt:formatNumber>
					 </span> </td>
			</tr>
			<tr>
				<th> <h1>총 주 문 금 액</h1> </th>
				<td class="text-right"> <h1><span id="span_sum_total_buy_amt"> 
				<fmt:formatNumber pattern="###,###,###원">
				${sum_buy_amt - sum_discount_amt}
				</fmt:formatNumber>
				</span></h1> </td>
			</tr>
		</table>
		
		
		<hr>
		<div class="text-center">
			<button id="order_btn" class="btn btn-danger btn-large"> 주문  </button>
		</div>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	

	<%-- 구매수량 변경 버튼 스크립트  --%>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".qty_chg_btn").click(function() {

			//alert( $(this).val() + " : " + $(this).prev().val() );

			$.get(
					"${pageContext.request.contextPath}/basket/updatebuyqty"
					, {
						b_no : $(this).val()
						, b_stock : $(this).prev().val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("구매 수량을 수정 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/basketlist";
						} else {
							alert("구매 수량 수정을 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
	
	<!-- delivery modal start -->
	<div class="modal" id="delivery_choice_modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 배 송 지 선 택 </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover table-borderless">
						<col class="col-10">
						<tbody>
							<c:forEach var="dto" items="${deliverylist}" varStatus="status">
								<tr>
									<td id="td_delivery${status.index}">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지 : ${dto.addr_name}</h5>
												<p class="card-text">받는 분 : ${dto.recipient_name} ( 연락처 : ${dto.tel} )</p>
												<p class="card-text">( ${dto.post_code} ) ${dto.addr1} ${dto.addr2}</p>
											</div>
										</div>
									</td>
									<td class="text-right">
										<button class="addr_delete_btn btn btn-danger btn-sm mt-1 mb-1" value="${dto.addr_no}"> 삭제 </button>
										<button class="addr_choice_btn btn btn-primary btn-sm" value="${dto.addr_no}" name="${status.index}"> 선택 </button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 취 소 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- delivery modal end -->

	
	<%--배송지 선택 스크립트 --%>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_choice_btn").click(function() {//배송지 선택 버튼

			$("#td_delivery").html( $("#td_delivery" + $(this).attr("name") ).html() );
			$("#addr_no").val( $(this).val() );
			$("#delivery_choice_modal").modal("hide");

		});//click
	});//ready
	</script>

	<%--배송지 삭제버튼 --%>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/delivery/delete"
					, {
						addr_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("배송지 주소를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/basketlist?arr_basket_no="+arr_basket_no;
						} else {
							alert("배송지 주소 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>










	<!-- 아래부분 장바구니에서 주문페이지로 넘어가는 경로 적어줘야함~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<%-- 주문버튼 스크립트 --%>
	<script type="text/javascript">
	let arr_basket_no = new Array();
	$(document).ready(function() {
		$("#order_btn").click(function() {
			
			if($("#memo").val() != '0' || $("#memo").val() != '' ){
				$.get(
						"${pageContext.request.contextPath}/order/orderlist?ord_no"
						,{
							ordpro_memo : $("#memo").val()
						}
						, function( data , status) {
							
						}
				);//get
				
			}

			let checks = $("input[type=checkbox]");
			for(let i = 0; i < checks.length; i++){//for문을 돌리면서 if문조건을 만족할때(체크박스가 체크되있는것) 개수를 센다
				
				if( checks[i].checked == true ) {
					arr_basket_no.push($("#b_no" + i).val());
				}//if
				
			}//for

			if(arr_basket_no.length <= 0){
				alert("선택된 상품이 없습니다.");
				return;
			}

			location.href="${pageContext.request.contextPath}/order/orderlist/?arr_basket_no="+arr_basket_no;
			//""쌍따옴표가 끝나는 부분에서 변수값을 추가할때는 '+변수' 로 표현해서 사용한다!!!
																			
		});//click
	});//ready
	</script>

	
	<%--장바구니 삭제 스크립트 --%>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".basket_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/basket/basketdelete"
					, {
						b_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("장바구니를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/basketlist";
						} else {
							alert("장바구니 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>


	<%--체크박스 스크립트 --%>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".order_check_box").click(function() {
			//alert($(this).val() + " : " + $(this).attr("name") + " : " + $(this).attr("id"));

			if( $(this).prop("checked") == true ) {
				$("#span_sum_product_class_qty").text(
					parseInt($("#span_sum_product_class_qty").text()) + 1
				);
				$("#span_sum_buy_amt").text(
						parseInt($("#span_sum_buy_amt").text()) + ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_discount_amt").text(
						parseInt($("#span_sum_discount_amt").text())
						+ ( ( $(this).attr("id") - $(this).attr("name") ) * $(this).val() )
				);
				$("#span_sum_total_buy_amt").text(
						parseInt($("#span_sum_total_buy_amt").text())
						+ ( $(this).attr("name") * $(this).val() )
				);
			} else if( $(this).prop("checked") == false ) {
				$("#span_sum_product_class_qty").text(
						$("#span_sum_product_class_qty").text() - 1
				);
				$("#span_sum_buy_amt").text(
						$("#span_sum_buy_amt").text() - ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_discount_amt").text(
						parseInt( $("#span_sum_discount_amt").text() )
						+ ( ( $(this).attr("id") - $(this).attr("name") ) * $(this).val() )
				);
				$("#span_sum_total_buy_amt").text(
						$("#span_sum_total_buy_amt").text()
						- ( $(this).attr("name") * $(this).val() )
				);
			}//if

		});//click
	});//ready
	</script>
	
	
	</body>
</html>
