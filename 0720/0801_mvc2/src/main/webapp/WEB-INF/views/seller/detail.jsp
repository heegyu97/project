<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품 상세조회 - seller</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3 class="float-left"> 상품 상세 보기 </h3>
<%-- 		<c:if test="${detail_dto.mno == login_info.mno}"> --%>
<!-- 			<div class="text-center float-right"> -->
<!-- 				<button id="delete_btn" class="btn btn-danger"> 상 품 삭 제 </button> -->
<%-- 				<a href="${pageContext.request.contextPath}/product/uform?prdt_no=${detail_dto.pro_no}"> --%>
<!-- 					<button class="btn btn-primary"> 상 품 수 정 </button> -->
<!-- 				</a> -->
<!-- 			</div> -->
<%-- 		</c:if> --%>
			<div class="text-center float-right">
				<button id="delete_btn" class="btn btn-danger"> 상 품 삭 제 </button>
				<a href="${pageContext.request.contextPath}/seller/uform?pro_no=${dto.pro_no}">
					<button class="btn btn-primary"> 상 품 수 정 </button>
				</a>
			</div>
		<hr>
		<table class="table" >
			<col class="w-25">
			<tbody>
				<tr>
					<td rowspan="7" align="center">
						<img src="${dto.pro_thum_path}" width="450px" height="450px">
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-borderless">
			<tbody>
				<tr>
					<td colspan="2	">
						<c:choose>
							<c:when test="${ dto.pro_big == 'feed' }">사료</c:when>
							<c:when test="${ dto.pro_big == 'snack' }">간식</c:when>
							<c:when test="${ dto.pro_big == 'store1' }">용품1</c:when>
							<c:when test="${ dto.pro_big == 'store2' }">용품2</c:when>
							<c:otherwise> 대분류 선택하세요.</c:otherwise>
						</c:choose>
						<em> / </em>
						${dto.pro_mid}
						<em> / </em>
					
						<c:choose>
							<c:when test="${ dto.pro_age == 'all' }">전연령</c:when>
							<c:when test="${ dto.pro_age == 'senior' }">시니어(7세이상)</c:when>
							<c:when test="${ dto.pro_age == 'adult' }">어덜트(1~6세)</c:when>
							<c:when test="${ dto.pro_age == 'kitten' }">키튼(1세미만)</c:when>
							<c:otherwise>  연령 선택하세요.</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td class="text-left" width="400px" height="100px">
						<div style="width: 400px; height: 100px; text-overflow: ellipsis; overflow: hidden">
							<h3>상품이름 : ${dto.pro_name}</h3>
						</div>
					</td>
					<td class="text-right" colspan="3">
						<div class="price">
							<div class="sale_price" style="font-size: 15px">
							<%-- 판매단가  ${dto.pro_price} --%>
								<del> 
									<fmt:formatNumber pattern="###,###,###원" >
									 ${dto.pro_price}
									</fmt:formatNumber> 
								</del>
							</div>
							<div  class="discount_price" style="font-size: 25px">
							<%-- 할인된 가격  ${dto.pro_price - (dto.pro_price *(dto.pro_sale / 100)} --%>
								<span  id="dc_price" class="dicount_price_number">
								</span>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<table class="table table-borderless">	
				<tr>
					<td>
						<%-- 할인율 ${detail_dto.pro_sale / 100} --%>
						<h6> 할인율 :  ${dto.pro_dc} %  </h6>
					</td>
					<td>
						<h6>할인기간 : ${dto.pro_dc_strt} ~ ${dto.pro_dc_end}</h6> 
					</td>
				</tr>
				<tr>
					<td>
						<p>회사명 : (주)ooooooooo</p>
					</td>
					<td>
						<p>회사전화번호 : 000-0000-0000</p>
					</td>
					
				</tr>
			</table>
			<table class="table table-borderless">
				<tr>	
					<td> 재 고 수 량 : </td>
					<td>	
				      ${dto.pro_stock}
				    </td>
					<td> 배송 가격 :</td>
					<td>	
				       ${dto.pro_ship}
				      </td>
					<td> 배송 무료 가격  : </td>
					<td>	
				        ${dto.pro_ship_free}
				    </td>
				</tr>

				
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<td class="text-center"> 상 품 설 명 </td>
				</tr>
				<tr>
					<td>${dto.pro_ctnts}</td>
				</tr>
				<tr>
					<td class="text-center"> 상 품 상 세 이 미 지 </td>
				</tr>
				<tr>
					<td align="center"><img src="${dto.pro_thum_path}" width="550px"></td>
				</tr>
				<tr>
					<td class="text-center"> 상 품 설 명 이 미 지 </td>
				</tr>
				<tr>
					<td align="center">
						<img src="${dto.pro_prdt_path}" width="550px">
					</td>
				</tr>
				
			</tbody>
		</table>
		<a id="top_btn" href="" style="position: fixed; bottom: 50px; display: block; z-index: 999;">
			<button type="button" class="btn btn-primary">TOP</button> 
		</a>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	
	$(document).ready(function() { //수량 증감소 + 총가격
		
		var dd = Number($("#total_buy").val());
		
		var price = ${dto.pro_price};
		var discount = ${dto.pro_dc};
		var dc_fu = price - (price * (discount / 100) );
		
		$("#dc_price").text( dc_fu );//할인된 가격 출력
		$("#total_buy").val( dc_fu);
		
		$("#numBox_p_btn").click(function() {//증가버튼
			var num =  $("#numBox").val(); //주문수량
			var plusNum = Number(num) + 1; 
			
			//alert(dc_fu * plusNum);
				
			$("#numBox").val(plusNum);  
			$("#total_buy").val( dc_fu *  plusNum);
		});//click
		
		$("#numBox_m_btn").click(function() {//감소버튼
			var num =  $("#numBox").val();
			var minusNum = Number(num) - 1;
			
			if(num-1 <= 0) {
				return;
			} else {
 				$("#numBox").val(minusNum);
 				$("#total_buy").val( dc_fu * minusNum );
		   }
		});//click
		
	});//ready
	
	</script>
	
	<script type="text/javascript">
	
	
	$(document).ready(function() {
		
		$("#delete_btn").click(function() { //상품삭제

			$.get(
					"${pageContext.request.contextPath}/seller/delete"
					, {
						pro_no : ${dto.pro_no}
						, pro_thum_path : "${dto.pro_thum_path}"
						, pro_prdt_path : "${dto.pro_prdt_path}"
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("상품이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/seller/productList";
						} else if( data <= 0 ) {
							alert("상품 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	</body>
</html>