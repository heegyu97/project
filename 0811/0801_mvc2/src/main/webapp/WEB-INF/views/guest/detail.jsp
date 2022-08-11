<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품 상세조회</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3 class="float-left"> 상품 상세 보기 </h3>
		<c:if test="${detail_dto.mno == login_info.mno}">
			<div class="text-center float-right">
				<button id="delete_btn" class="btn btn-danger"> 상 품 삭 제 </button>
				<a href="${pageContext.request.contextPath}/product/uform?prdt_no=${detail_dto.prdt_no}">
					<button class="btn btn-primary"> 상 품 수 정 </button>
				</a>
			</div>
		</c:if>
		<hr>
		<table class="table" >
			<col class="w-25">
			<tbody>
				<tr>
					<td rowspan="7" align="center">
						<img src="${pageContext.request.contextPath}/resources/img/bg.jpeg" 
							width="450px" height="450px">
					</td>
				</tr>
			</tbody>
		</table>
<!-- 		<table class="table table-bordered"> -->
		<table class="table table-borderless">
			<tbody >
				<tr>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/guest/productList"
						 	style="text-decoration : none; color: black"  class="float-left">
							상품항목
						</a>
						<a href="#" style="text-decoration : none; color: black"  class="float-right">후기</a>
					</td>
					
				</tr>
				<tr>
					<td class="text-left" width="400px" height="100px">
						<div style=" width: 400px; height: 100px; text-overflow: ellipsis; overflow: hidden">
							<h3><em>상품이름 : ${detail_dto.prdt_name}ㅇㅇㅇㅇ  6666666ㅇㅇㅇ  6666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  6666666ㅇㅇㅇㅇ</em></h3>
						</div>
					</td>
					<td class="text-right" colspan="3">
						<del><em> ${10000} 원</em></del>
						<h5><em>${10000 -(10000 / 10)} 원</em></h5>
						<h6><em>( ${10} % 판매자 할인! )</em></h6>
					</td>
				</tr>
				
				<tr >
					<td colspan="2">
						<p class="float-left">회사명 : (주)ooooooooo</p>
						<p class="float-right">회사전화번호 : 000-0000-0000</p>
					</td>
					
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>	
					<td class="text-left" width="250px" height="10px">
						<div style=" width: 250px; height: 20px; text-overflow: ellipsis; overflow: hidden">
							<h6><em>상품이름 : ${detail_dto.prdt_name}ㅇㅇㅇㅇ  6666666ㅇㅇㅇ  6666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  66666666666666ㅇㅇㅇ  6666666ㅇㅇㅇㅇ</em></h6>
						</div>
					</td>
					<td>
						<input type="text" id="total_price" name="total_price" readonly="readonly" value="${10000}" size="8" class="text-center">
					</td>
					<td> 수 량 </td>
					<td>
				        <input type="text" id="numBox" name="numBox" min="1" value="1" readonly="readonly" size="2"class="text-center">
				        <button id="numBox_p_btn" type="button" class="btn">+</button>
				        <button id="numBox_m_btn" type="button" class="btn">-</button>
				    </td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<button type="button" id="jang_btn" class="btn btn-primary btn-block"> 장 바구니 담기 </button>
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
					<td>${detail_dto.description}</td>
				</tr>
				<tr>
					<td class="text-center"> 상 품 상 세 이 미 지 </td>
				</tr>
				<tr>
					<td align="center"><img src="${pageContext.request.contextPath}/resources/img/bg.jpeg" width="550px"></td>
<%-- 					<td align="center"><img src="${detail_dto.prdt_img_path}" width="550px"></td> --%>
				</tr>
				<tr>
					<td class="text-center"> 상 품 설 명 이 미 지 </td>
				</tr>
				<tr>
					<td align="center">
						<img src="${pageContext.request.contextPath}/resources/img/detailpage.jpeg" width="550px">
					</td>
				</tr>
				
			</tbody>
		</table>
		<hr>
		<a id="top_btn" href="" style="position: fixed; bottom: 50px; display: block; z-index: 999;">
			<button type="button" class="btn">TOP</button> 
		</a>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {// 총 가격
		
		
	});//ready
	$(document).ready(function() { //수량 증감소
			
		$("#numBox_p_btn").click(function() {//증가
			var num =  $("#numBox").val();
			var plusNum = Number(num) + 1;
			
			 $("#numBox").val(plusNum);  
		});//click
		
		$("#numBox_m_btn").click(function() {//감소
			var num =  $("#numBox").val();
			var minusNum = Number(num) - 1;
			
			if(minusNum <= 0) {
			    $("#numBox").val(num);
		   } else {
 			 $("#numBox").val(minusNum);
		   }
		});//click
		
	});//ready
	
	$(document).ready(function() {
		$("#jang_btn").click(function() { //장바구니 담기
			$.post(
					"${pageContext.request.contextPath}/guest/"
					, {}
					, function(data, status) {
						if( data >= 1 ){
							alert("상품을  장바구니에  담았습니다.");
// 							location.href="${pageContext.request.contextPath}/product/list";
						} else if( data <= 0 ) {
							alert("실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post			
		});				
		
		
		
		$("#delete_btn").click(function() { //상품삭제

			$.get(
					"${pageContext.request.contextPath}/seller/delete"
					, {
// 						prdt_no : ${detail_dto.prdt_no}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("상품이 삭제 되었습니다.");
// 							location.href="${pageContext.request.contextPath}/product/list";
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