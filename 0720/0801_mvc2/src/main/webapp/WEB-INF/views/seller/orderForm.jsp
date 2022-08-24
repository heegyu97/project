<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 주문 등록 -seller</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 판매자 주문 등록 </h3>
		<hr>
		<form>
			<table class="table table-bordered table-info">
				<tbody>
					<tr>
						<th> 주문자 </th>
						<td colspan="3"><input type="text" id="order_id" class="form-control"></td>
					</tr>
					<tr>
						<th> 전화번호 </th>
						<td><input type="text" id="order_tel" class="form-control"></td>
						<th>이메일</th>
						<td><input type="text" id="order_email" class="form-control"></td>
					
					</tr>
					<tr>
						<th> 주 소 </th>
						<td colspan="3">
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span>
								<input type="text" id="post_code" name="post_code" readonly="readonly"
										class="form-control">
								<button id="addr_btn" class="btn btn-primary"> 주 소 검 색 </button>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span>
								<input type="text" id="addr1" name="addr1" readonly="readonly"
										class="form-control">
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span>
								<input type="text" id="addr2" name="addr2" class="form-control">
							</div>
						</td>
					</tr>
				</tbody>
				</table>
				<table class="table table-bordered table-info">
				<tbody>
				<tr>
					<th colspan="3"> 상 품 항 목  </th> 
					</tr>
					<tr>
						<td>
							<select class="form-control" id="pro_big" name="pro_big"  
									style="width: 170px" >
								<option value="big_none"> 대분류 선택하세요. </option>
								<c:forEach var="code_dto" items="${proBigList}">
									<option value="${code_dto.code_class}"
										<c:if test="${search_dto.searchOption == code_dto.code_class}">selected="selected"</c:if>>
										${code_dto.code_class}
									</option>
								</c:forEach>
							</select>
						</td>
						<!--대분류 끝 -->
						<td>
							<select class="form-control" id="pro_mid" name="pro_mid" style="width: 170px">
								
							</select>
						</td>
						<!-- 중분류 끝 -->
						<td>
<%-- 						<c:if test="${list.pro_age ne null and list.pro_age ne ''}"> --%>
							<select class="form-control" id="pro_age" name="pro_age"  
									style="width: 170px" >
								<option value="age_none"> 연령 선택하세요. </option>
								<option value="all"
								> 전연령 </option>
								<option value="senior"
								> 시니어(7세이상)  </option>
								<option value="adult"
								> 어덜트(1~6세)  </option>
								<option value="kitten"
								> 키튼(1세미만)  </option>
							</select>
<%-- 						</c:if> --%>
						</td>
						<!-- 연령분류 끝 -->
					</tr>
				
				
					<tr>
						<th colspan="3"> 상 품 명  </th>
					</tr>
					<tr>	
						<td colspan = "3">
							<select class="form-control" id="pro_name" name="pro_name" style="width: 170px">
								<option value="">선택하시오</option>
								<c:forEach var="pro_dto" items="${proList}">
									<option value="${pro_dto.pro_name}"
									<c:if test="${select_pro_name == pro_dto.pro_name}">selected="selected"</c:if>>
									${pro_dto.pro_name}
								</option>
							</c:forEach>
							</select>
						</td>
						
					</tr>
					<tr>
						<th style="text-align: center;">수 량 </th>
						<th style="text-align: center;">단가 또는 할인된 가격</th>
						<th style="text-align: center;"> 총 가 격</th>
					</tr>
					<tr>	
					
						<td>
							<input type="text" id="pro_stock" name="pro_stock" class="form-control">
						</td>
						<%-- 할인된 가격  ${dto.pro_price - (dto.pro_price *(dto.pro_sale / 100)} --%>
						<td>
							<input type="text" id="dc_price" name="dc_price" readonly="readonly"  class="form-control" >
						</td>
																	
						 
						
						<td><!-- 총가격 -->
							<input type="text" id="total_buy" name="total_buy"  readonly="readonly" class="form-control">
						</td>
						
					</tr>
					<tr>
						<th colspan="4"> 상 품 설 명 </th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="form-contol" id="pro_ctnts" name="pro_ctnts"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace("pro_ctnts");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button id="write_btn" class="btn btn-primary float-right"> 주문 등록 완료 </button>
		<a href="${pageContext.request.contextPath}/seller/orderlist">
			<button class="btn btn-warning"> 주문 등록 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$("#pro_price").text(${dto.pro_price});
		});
	</script>
 -->	
	<!-- 주소  -->
	<script type="text/javascript">
		
	
		$(document).ready(function() {
			
			$("#addr_btn").click(function() {
				
				 new daum.Postcode({
				 	oncomplete: function(data) {//data : 카카오에서 주는 결과 값
				        $("#post_code").val(data.zonecode);
				 		$("#addr1").val(data.address);
				 	}//call back function
				 }).open();
			});//click
		
			$("#pro_name").change(function() {
	 			$.get(
						"${pageContext.request.contextPath}/seller/pro"
						, {
							select_pro_name : $("#pro_name").val()
						}
						, function(data, status) {
							let obj = (JSON.parse(data));
								$("#dc_price").val(obj.pro_price * obj.pro_dc / 100);
	//							alert(obj.pro_price * obj.pro_dc / 100);
	// 						$.each( function(idx, dto) {
	// 							alert("꾸루룪");
	// 						});
							
						}//call back function
				);//get
			});//change
 		
 		//대분류 dropdown - 중분류 dropdown 생성
		 $("#pro_big").change(function() {
			$.get(
					"${pageContext.request.contextPath}/seller/big"
					, {
						select_pro_big : $("#pro_big").val()
					}
					, function(data, status) {
						$("#pro_mid").empty();//이전 정보 지우기 : 초기화
						
						$.each(JSON.parse(data), function(idx, dto) {
							$("#pro_mid").append("<option value='" + dto.code_name +"'>"+ dto.code_name +"</option>");
						});
						
					}//call back function
			);//get
		 });//change
 		
		 
		 $("#pro_stock").keyup( function(){
			 let a = $("#pro_stock").val();
			 let b = $("#dc_price").val();
			 $("#total_buy").val(  a * b  ); 
		 }); // key up dc_price pro_stock
				 
				 
				 
		});//ready
		
	</script>
	
	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;
	$(document).ready(function() {
 	
 	
			
	$(document).ready(function() {
 		$("#write_btn").click(function() {//등록 버튼

// 			if( $.trim( $("#pro_name").val() ) == "" ){
// 				$("#prdt_name_label").text("상품명을 입력 하세요.");
// 				return;
// 			} else { $("#prdt_name_label").text(""); }
			
// 			if( $("#pro_stock").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //재소수량
// 				$("#qty_label").text("필수 입력 사항이며, 수량만 허용 됩니다.");
// 				return;
// 			} else { $("#qty_label").text(""); }
			
// 			if( $("#pro_ship").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송가격
// 				$("#delivery_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
// 				return;
// 			} else { $("#delivery_fee_label").text(""); }
			
// 			if( $("#pro_ship_free").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송무료가격 
// 				$("#delivery_free_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
// 				return;
// 			} else { $("#delivery_free_fee_label").text(""); }

// 			if( $("#pro_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //판매단가
// 				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
// 				return;
// 			} else { $("#price_label").text(""); }

// 			if( $("#pro_dc").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //할인율
// 				$("#discount_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
// 				return;
// 			} else { $("#discount_label").text(""); }
			
// 			 //pro_dc_strt
// 		    if( $.trim( $("#pro_dc_strt").val() )  == ""){//허용되지 않은 글자는 null.
// 		        $("#discount_start_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
// 		        return;
// 		    } else { $("#discount_start_label").text(""); }
		
		
			/*
			//ajax
			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "pro_ctnts", CKEDITOR.instances.pro_ctnts.getData() );
			
			
			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/seller/orderinsert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 수정 되었습니다.");
						
						location.href="${pageContext.request.contextPath}/seller/orderlist";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
			});//ajax

			*/
		});//click
	}); 
	//ready
	</script>
	</body>
</html>
