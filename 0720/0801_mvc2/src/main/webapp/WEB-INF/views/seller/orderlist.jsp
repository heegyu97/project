<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 주문 조회 - seller </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		div.pname{
			width: 150px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 주문조회 </h3>
		<hr>
<%-- 		<form action="${pageContext.request.contextPath}/seller/orderlist" method="get"> --%>
<!-- 			<div class="input-group"> -->
<!-- 				<div class="input-group-prepend"> -->
<!-- 					<select class="form-control" id="searchOption" name="searchOption"> -->
<!-- 						<option value="prdt_name" -->
<%-- 							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if> --%>
<!-- 						> 상 품 이 름 </option> -->
<!-- 						<option value="mid" -->
<%-- 							<c:if test="${search_dto.searchOption == 'm_id'}">selected="selected"</c:if> --%>
<!-- 						> 주 문 자 </option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<input type="text" class="form-control" id="searchWord" name="searchWord" -->
<%-- 						value="${search_dto.searchWord}"> --%>
<!-- 				<div class="input-group-append"> -->
<!-- 					<button type="submit" class="btn btn-primary"> 검 색 </button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</form> -->
		<table class="table table-info">
			<tbody>
			<tr>
			<c:set var="sum_product_class_qty" value="0" />
			<c:set var="m_product_class_qty" value="${sum_product_class_qty}" />
			<th> 배송완료 </th>
			<td> <span id="span_sum_product_class_qty"> ${sum_product_class_qty}</span> </td>
			<th> 배송중 </th>
			<td> <span id="span_m_product_class_qty"> ${m_product_class_qty}</span> </td>
			<td>
				<a href="${pageContext.request.contextPath}/seller/orderForm">
					<button class="basket_delete_btn btn btn-success btn-sm float-right mg-2" > 등록 </button>
				</a>
				<button id="delivery_btn" class="delivery_btn btn btn-danger btn-sm float-right"> 배송 </button>
			</td>
			</tr>
			</tbody>
		</table>
		
						
		<table class="table table-hover">
			<col class="col-2">
			<col class="col-2">
			<col class="col-4">
			<col class="col-2">
			<col class="col-2">
			<thead>
				<tr>
					<th> 주 문 </th>
					<th> 상품  </th> <th></th>	
					<th> 가격 수량 </th>
					<th> 배송여부 </th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:forEach var="dto" items="${list}"> list = HistoryDTO--%>
				
				<c:forEach begin="1" end="3" varStatus="status">
					<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
					<c:set var="m_product_class_qty" value="${m_product_class_qty + 1}" />
					<tr style="border-bottom: 1px solid black">
						<td><!-- 주문 -->
<%-- 							주문 번호 : ${dto.detail_no} --%>
							주문 번호 : ${798465}
							<hr>
							<div class="pname">
<%-- 						<td>판매자:${dto.seller_mid}</td> --%>
							주문자:${"상남자fsdfdsfdsfdsds"}
							</div>
							<hr>
<%-- 						결제일	${dto.order_date} --%>
								주문일자 :${"2022-08-20 11:11:11"}
						</td>
						<td>
							<div class="pname">
							<!-- 상품  -->
							상품번호 : ${456 }
							<hr>
								<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}" >
	<%-- 								${dto.prdt_name} --%>
									상품명 : ${"testdddddddd"}
								</a>
							</div>
							<hr>
							<button type="button" class="pay_detail_btn btn btn-link btn-sm" value="${dto.order_no}">
								결제 상세 보기
							</button>
						</td>
						<td><!-- 이미지 -->
						
							<img src="${pageContext.request.contextPath}/resources/img/75700215_p0_master1200.jpg"  class="img-thumbnail">
<%-- 							<img src="${dto.thumbnail_path}" class="img-thumbnail"> --%>
						</td>
						<td>
<%-- 							결제금액 : <b>${dto.detail_pay_amt}</b> 원 --%>
							<!-- 결제금액 -->
							 <b>${1000}</b> 원
							<hr>
<%-- 							수량 : ${dto.detail_qty} --%>
							<!-- 수량 -->
							${5} 개
							<hr>
							
						</td>
<%-- 						<td>주문상태:${dto.order_status_name}</td> --%>
						<td><!-- 배송여부 -->
							<input id="d_checkbox" name="d_checkbox" type="checkbox" class="order_check_box" size="100" > 
							<label for="d_checkbox" id="d_checkbox_label" class="write_label"> 배송중</label>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/product/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active mx-auto">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/product/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/product/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<!-- pay detail modal start -->
	<div class="modal" id="pay_detail_modal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 결제상세정보 (결제일자 <span id="span_order_date"></span> | 결제번호 <span id="span_order_no"></span>) </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th> 주문번호 </th>	<th> 상품명 </th>	<th> 수량 </th>	<th> 단가 </th>
								<th> 구매금액 </th>	<th> 할인율 </th>	<th> 할인금액 </th>	<th> 결제금액 </th>
								<th> 판매자 </th>	<th> 주문상태 </th>
							</tr>
						</thead>
						<tbody id="tbody_pay_detail_modal">
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-6">
						<table class="table table-hover table-borderless">
							<tbody>
								<tr>
									<td>
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지정보</h5>
												<p class="card-text">받 는 분 : <span id="span_recipient_name"></span></p>
												<p class="card-text">연 락 처 : <span id="span_tel"></span></p>
												<p class="card-text"> 주 소  : <span id="span_addr"></span></p>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-6">
						<table class="table table-hover table-borderless mr-5">
							<tbody>
								<tr>
									<th> 총 상 품 수 </th>
									<td class="text-right"> <span id="span_sum_product_class_qty"></span> 개 </td>
								</tr>
								<tr>
									<th> 총 구 매 금 액 </th>
									<td class="text-right"> <span id="span_sum_buy_amt"></span> 원 </td>
								</tr>
								<tr>
									<th> 총 할 인 금 액 </th>
									<td class="text-right text-danger"> -<span id="span_sum_discount_amt"></span> 원 </td>
								</tr>
								<tr>
									<th> 신 용 카 드 </th>
									<td class="text-right"> <span id="span_credit_card"></span> </td>
								</tr>
								<tr>
									<th> <h3>총 결 제 금 액</h3> </th>
									<td class="text-right"> <h3><span id="span_sum_total_buy_amt"></span> 원</h3> </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 닫 기 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- pay detail modal end -->
	<script type="text/javascript">
	$(document).ready(function() {
		$(".order_check_box").click(function() {
			//alert($(this).val() + " : " + $(this).attr("name") + " : " + $(this).attr("id"));
		
			if( $(this).prop("checked") == true ) {
 				$("#d_checkbox_label").text("배송완료");
				$("#span_sum_product_class_qty").text(
						parseInt($("#span_sum_product_class_qty").text()) + 1
				);
				$("#span_m_product_class_qty").text(
						parseInt($("#span_m_product_class_qty").text()) - 1
				);
				
			} else if( $(this).prop("checked") == false ) {
				$("#d_checkbox_label").text("배송중");
				$("#span_sum_product_class_qty").text(
						parseInt($("#span_sum_product_class_qty").text()) - 1
				);
				$("#span_m_product_class_qty").text(
						parseInt($("#span_m_product_class_qty").text()) + 1
				);
			}//if

		});//click
	});//ready
	</script>
	<script type="text/javascript">
		
	let arr_basket_no = new Array();
	$(document).ready(function() { //배달여부 checkbox => 선생님 basket.jsp 참조하자
		
			$("#order_btn").click(function() {

				let checks = $("input[type=checkbox]");
				for(let i = 0; i < checks.length; i++){

					if( checks[i].checked == true ) {
						//$("#d_checkbox_label").text("배송완료");
						
					}//if
					
				}//for

				if(arr_basket_no.length <= 0){
					alert("선택된 상품이 없습니다.");
					return;
				}

				location.href="${pageContext.request.contextPath}/order/order_list?arr_basket_no="+arr_basket_no;

			});//click
			
		
	});//ready
	
	
	$(document).ready(function() {
// 		$(".pay_detail_btn").click(function() {

// 			$.get(
// 					"${pageContext.request.contextPath}/history/pay_detail"
// 					, {
// 						order_no : $(this).val()
// 					}
// 					, function(data, status) {
// 						if(data.length >= 1){
// 							$("#tbody_pay_detail_modal").empty();
// 							$.each(JSON.parse(data), function(idx, dto) {
// 								$("#tbody_pay_detail_modal").append(
// 										"<tr>"
// 										+ "<td>" + dto.detail_no + "</td>"
// 										+ "<td>" + dto.prdt_name + "</td>"
// 										+ "<td>" + dto.detail_qty + "</td>"
// 										+ "<td>" + dto.detail_price + "</td>"
// 										+ "<td>" + dto.detail_amt + "</td>"
// 										+ "<td>" + dto.detail_discount + "</td>"
// 										+ "<td class='text-danger'>-" + dto.detail_discount_amt + "</td>"
// 										+ "<td>" + dto.detail_pay_amt + "</td>"
// 										+ "<td>" + dto.seller_mid + "</td>"
// 										+ "<td>" + dto.order_status_name + "</td>"
// 										+ "</tr>"
// 								);//append
// 								$("#span_order_no").text(dto.order_no);
// 								$("#span_order_date").text(dto.order_date);
// 								$("#span_recipient_name").text(dto.recipient_name);
// 								$("#span_tel").text(dto.tel);
// 								$("#span_addr").text("(" + dto.post_code + ")" + dto.addr1 + " " + dto.addr2);
// 								$("#span_sum_product_class_qty").text(dto.order_product_cnt);
// 								$("#span_sum_buy_amt").text(dto.order_amt);
// 								$("#span_sum_discount_amt").text(dto.discount_amt);
// 								$("#span_sum_total_buy_amt").text(dto.pay_amt);
// 								$("#span_credit_card").text(dto.card_name + " " + dto.card_number);
// 							});//each
// 							$("#pay_detail_modal").modal("show");
// 						} else {
// 							alert("결제 정보 조회를 실패 하였습니다.");
// 						}
// 					}//call back function
// 			);//get

// 		});//click
	});//ready
	
	</script>

	</body>
</html>
