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
		<h3> 주문 조회 </h3>
		<hr>
		<!-- 검색 기능 -->
		<form action="${pageContext.request.contextPath}/history/my_sell_list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="prdt_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상 품 이 름 </option>
						<option value="mid"
							<c:if test="${search_dto.searchOption == 'm_id'}">selected="selected"</c:if>
						> 주 문 자 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>

		
		<table class="table table-hover">
			<col class="col-2">
			<col class="col-2">
			<col class="col-5">
			<col class="col-3">
			<thead>
				<tr>
					<th> 주 문 </th>
					<th> 상품  </th>	
					<th> 제품정보 </th>
					<th> 배송여부 </th>
				</tr>
			</thead>
			<tbody>
 				<c:forEach var="dto" items="${list}"><%-- list = HistoryDTO--%>
					
					<tr style="border-bottom: 1px solid black">
						<td><!-- 주문 -->
							주문 번호:${dto.ord_no}
							<hr>
							<div class="pname">
<%-- 						<td>판매자:${dto.seller_mid}</td> --%>
								주문자:${dto.m_id}
							</div>
							<hr>
								주문일자:${dto.ord_date}
						</td>
						<td>
							<div class="pname">
							<!-- 상품  -->
							상품번호 : ${dto.pro_no}
							<hr>
							상품명 :
								<a href="${pageContext.request.contextPath}/seller/detail?pro_no=${dto.pro_no}" >
									${dto.pro_name}
								</a>
							</div>
							<hr>
							<button type="button" class="pay_detail_btn btn btn-link btn-sm" value="${dto.ordpro_no}">
								주문 상세 보기
							</button>
						</td>
						<td style="text-align: right"><!-- 이미지 -->
							<img src="${dto.pro_thum_path}" class="img-thumbnail" style = "width : 150px; max-height : 100px;">

							<!-- 수량 -->
							${dto.ordpro_stock} 개
							<hr>
							<!-- 결제금액 -->
							 <b>${dto.ordpro_pay}</b> 원
							
							
						</td>
<%-- 						<td>주문상태:${dto.order_status_name}</td> --%>
						<td><!-- 배송여부 -->
							 <h6>${dto.order_status_name}</h6>
							<h6>${dto.ord_status== '3'}</h6>
							<h6>${dto.ord_status== '5'}</h6>
							 
							<c:choose>
								<c:when test="${dto.ord_status== '3'}">
									<button type="button" id="delvery_btn" name="${dto.ord_no}" value="5" class="btn btn-primary btn-sm delvery_btn ">확인</button>
								</c:when>
								<c:when test="${dto.ord_status == '5'}">
<!-- 									<input type="text" maxlength="15" placeholder="택배사 이름"> -->
<!-- 									<input type="text" maxlength="15" placeholder="운송장 번호"> -->
									<button type="button" id="delvery_btn" name="${dto.ord_no}" value="7" class="btn btn-primary btn-sm ">송장 입력</button>
								</c:when>
							</c:choose>
												 
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
		$(".delvery_btn").click(function() {
			alert($(this).attr("name") );
			alert($(this).val() );
			 
			$.post(
					"${pageContext.request.contextPath}/seller/update_status"
					, {
						 ord_no : $(this).attr("name")
						, ord_status : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("배송됨");
							window.location.reload();//현화면 으로 이동
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post
			 

		});//click
	});//ready
	</script>
	<script type="text/javascript">
		
	let arr_basket_no = new Array();
	
	
	$(document).ready(function() {
		$(".pay_detail_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/seller/pay_detail"
					, {
						ordpro_no : $(this).val()
					}
					, function(data, status) {
						if(data.length >= 1){
							$("#tbody_pay_detail_modal").empty();
							$.each(JSON.parse(data), function(idx, dto) {
								$("#tbody_pay_detail_modal").append(
										"<tr>"
										+ "<td>" + dto.ordpro_no + "</td>"
										+ "<td>" + dto.pro_name + "</td>"
										+ "<td>" + dto.ordpro_stock + "</td>"
										+ "<td>" + dto.ordpro_price + "</td>"
										+ "<td>" + dto.ordpro_sum + "</td>"
										+ "<td>" + dto.ordpro_dc + "</td>"
										+ "<td class='text-danger'>-" + dto.ordpro_dc_pay + "</td>"
										+ "<td>" + dto.ordpro_pay + "</td>"
										+ "<td>" + dto.seller_mid + "</td>"
										+ "<td>" + dto.order_status_name + "</td>"
										+ "</tr>"
								);//append
								$("#span_order_no").text(dto.order_no);
								$("#span_order_date").text(dto.order_date);
								$("#span_recipient_name").text(dto.recipient_name);
								$("#span_tel").text(dto.tel);
								$("#span_addr").text("(" + dto.post_code + ")" + dto.addr1 + " " + dto.addr2);
								$("#span_sum_product_class_qty").text(dto.ord_stock);
								$("#span_sum_buy_amt").text(dto.ord_sum);
								$("#span_sum_discount_amt").text(dto.ord_dc_pay);
								$("#span_sum_total_buy_amt").text(dto.ord_pay);
								//$("#span_credit_card").text(dto.card_name + " " + dto.card_number);
							});//each
							$("#pay_detail_modal").modal("show");
						} else {
							alert("결제 정보 조회를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	
	</script>


	</body>
</html>
