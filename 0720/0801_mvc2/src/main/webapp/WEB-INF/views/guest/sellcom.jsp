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
		td.pname{
			width: 300px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
	
	</style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3 class="text-center">${login_info.m_id} 님 결제 내역</h3>
		
		<table class="table table-hover">
			<col class="col-1">
			<col class="col-2">
			<col class="col-5">
			<col class="col-2">
			<col class="col-2">
			<thead>
				<tr>
					<th> 결제일 </th>
					<th> 상품 이미지 </th>	<th> 주문번호 / 상품명 / 주문옵션 </th>
					<th> 판매자 </th>	<th> 주문상태 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="op" items="${list}">
					<tr style="border-bottom: 1px solid black">
						
						<td class="pname">
							${op.ord_date}
							<hr>
							결제금액 : <b>${op.ordpro_pay}</b> 원
							<hr>
							<button type="button" class="pay_detail_btn btn btn-link btn-sm" value="${op.ord_no}">
								결제 상세 보기
							</button>
							
						</td>
						<td >
							<img src="${op.pro_thum_path}" style = "width :100px; max-height : 100px"  >
						</td>
						<td class="pname">
								${op.pro_name}
							<hr>
							수량 : ${op.ordpro_stock}
							<hr>
							주문 번호 : ${op.ordpro_no}
						</td>
						<td class="pname">${op.m_id}</td>
						<td class="pname">${op.code_name}</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
<!-- 		<table> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th width="120px">결제정보 </th> -->
<!-- 					<th width="180px">상품이미지</th> -->
<!-- 					<th width="100px">상품정보</th> -->
<!-- 					<th width="100px">판매자</th> -->
<!-- 					<th width="100px">주문상태</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
		
<%-- 				
<%-- 				op.ordpro_no, op.ord_no , o.ord_date , --%>
<%-- 				p.pro_name, op.ordpro_stock, op.ordpro_pay , p.pro_thum_pic , p.pro_thum_path --%>
<%-- 				o.ord_status , p.m_no --%>
<%-- 				 --%> 
				 
<%-- 				<c:forEach var="op" items="${list}"> --%>
<%-- 					<div onclick="location.href='${pageContext.request.contextPath}/guest/sellcom_detail?ord_no=${op.ord_no}'" style="cursor: pointer"> --%>
<!-- 						<tr> -->
<!-- 							일자 -->
<%-- 							<td width="120px"> ${op.ord_date} </td>	 --%>
<!-- 							이미지  -->
<!-- 							<td  width="180px" rowspan="3"> -->
<%-- 								<img src="${op.pro_thum_path}" width="180px"  class="img-thumbnail "> --%>
<!-- 							</td> -->
<!-- 							상품명 -->
<%-- 							<td width="100px" style="text-align: center">${op.pro_name}</td> --%>
<!-- 							판매자 -->
<%-- 							<td width="100px" rowspan="3"  style="text-align: center">${op.m_id}</td> --%>
<!-- 							주문상태 -->
<%-- 							<td width="100px" rowspan="3" style="text-align: center">${ord_status}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
							
<!-- 							<td> -->
<!-- 								결재금액 -->
<!-- 								<h4> -->
<%-- 									결제금액 : ${op.ordpro_pay}	 --%>
<!-- 								</h4> -->
<!-- 							</td>			 -->
<!-- 							수량 -->
<!-- 							<td style="text-align: center">  -->
<%-- 								수량 : ${op.ordpro_stock} --%>
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr style="border-bottom: 1px solid black;">	 -->
<!-- 							상세보기버튼(라밸) -->
<%-- 							<td>주문통합번호 : ${op.ord_no}</td> --%>
<!-- 							주문번호 : -->
<%-- 							<td>주문 번호 : ${op.ordpro_no} </td> --%>
<!-- 						</tr> -->
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
		
		
		<hr>
		<%-- 페이징 --%>
		<div>
		<ul class="pagination pagination-sm justify-content-center" >
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/sellcom?userWantPage=${startPageNum-1}">
						Prev
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/guest/sellcom?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/sellcom?userWantPage=${endPageNum+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</div>
		<hr>
		
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	
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
		$(".pay_detail_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/guest/sellcom_detail"
					, {
						ord_no : $(this).val()
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
										+ "<td>" + dto.ordpro_stock + "</td>"
										+ "<td>" + dto.ordpro_dc + "</td>"
										+ "<td class='text-danger'>-" + dto.ordpro_dc_pay + "</td>"
										+ "<td>" + dto.ordpro_pay + "</td>"
										+ "<td>" + dto.seller_mid + "</td>"
										+ "<td>" + dto.code_name + "</td>"
										+ "</tr>"
								);//append
								$("#span_order_no").text(dto.ord_no);
								$("#span_order_date").text(dto.ord_date);
								$("#span_recipient_name").text(dto.addr_name);
								$("#span_tel").text(dto.tel);
								$("#span_addr").text("(" + dto.post_code + ")" + dto.addr1 + " " + dto.addr2);
								$("#span_sum_product_class_qty").text(dto.ord_stock);
								$("#span_sum_buy_amt").text(dto.ord_sum);
								$("#span_sum_discount_amt").text(dto.ord_dc_pay);
								$("#span_sum_total_buy_amt").text(dto.ord_pay);
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