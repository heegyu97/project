<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 상품 등록 - 판매자 </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 판매자 상품 등록 </h3>
		<hr>
		<form id="write_form">
<!-- 			<table class="table table-borderless"> -->
			<table class="table table-borderled table-info">
				<tbody>
					<tr>
					<th colspan="3"> 상 품 항 목  </th>
					</tr>
					<tr>
						<td>
							<div class="input-group">
								<div class="input-group-prepend">
									<select class="form-control" id="pro_big" name="pro_big" 
											style="width: 170px" >
										<option value="big_none"> 대분류 선택하세요. </option>
										<option value="feed" > 사료 </option>
										<option value="snack" > 간식 </option>
										<option value="store1" > 용품1 </option>
										<option value="store2" > 용품2 </option>
										
									</select>
								</div>
							</div>
						</td>
						<td>
							
							<select class="form-control" id="pro_mid" name="pro_mid" 
									style="width: 170px">
									
							</select>
							
						</td>
						<td>
							<div class="input-group">
								<div class="input-group-prepend">
									<select class="form-control" id="pro_age" name="pro_age" 
											style="width: 170px">
										<option value="age_none"> 연령 선택하세요. </option>
										<option value="all"> 전연령 </option>
										<option value="senior"> 시니어(7세이상) </option>
										<option value="adult"> 어덜트(1~6세) </option>
										<option value="kitten">키튼(1세미만)</option>
										
									</select>
								</div>
							</div>
						</td>

					</tr>
					<tr>
						<th colspan="3"> 상 품 명 </th>
					</tr>
					<tr>
						<td colspan="3">
							<input type="text" id="pro_name" name="pro_name" maxlength="20"
									class="form-control">
							<label for="pro_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
				
					<tr>
						<th style="text-align: center;"> 재 고 수 량 </th><th style="text-align: center;"> 배 송 가 격 </th><th style="text-align: center;"> 배송무료가격 </th>
					</tr>
					<tr>
						<td>
							<input type="text" id="pro_stock" name="pro_stock" class="form-control">
							<label for="pro_stock" id="qty_label" class="write_label"></label>
						</td>
						
						<td >
							<input type="text" id="pro_ship" name="pro_ship" class="form-control" >
							<label for="pro_ship" id="delivery_fee_label" class="write_label"></label>
						</td>
					
						<td>
							<input type="text" id="pro_ship_free" name="pro_ship_free" class="form-control"  
									placeholder="얼마이상시 배송무료">
							<label for="pro_ship_free" id="delivery_free_fee_label" class="write_label"></label>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<th width="130px"> 판매단가  </th>
						<td>
							<input type="text" id="pro_price" name="pro_price" class="form-control">
							<label for="pro_price" id="price_label" class="write_label"></label>
						</td>
						<th width="130px"> 할 인 율 </th>
						<td>
							<input type="text" id="pro_dc" name="pro_dc" class="form-control">
							<label for="pro_dc" id="discount_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 할인시작일 </th>
						<td>
							<input type="date" id="pro_dc_strt" name="pro_dc_strt" class="form-control">
							<label for="pro_dc_strt" id="discount_start_label" class="write_label"></label>
						</td>
						<th> 할인마지막일 </th>
						<td>
							<input type="date" id="pro_dc_end" name="pro_dc_end" class="form-control">
							<label for="pro_dc_end" id="discount_end_label" class="write_label"></label>
						</td>
					</tr>
				
<!-- 					<tr> -->
<!-- 						<th> 판 매 자 </th> -->
<!-- 						<td colspan="3"> -->
<%-- 							${login_info.m_id} --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th> 회사명 </th> -->
<!-- 						<td > -->
<%-- 							${login_info.m_h_name} --%>
<!-- 						</td> -->
<!-- 						<th> 회사전화번호 </th> -->
<!-- 						<td > -->
<%-- 							${login_info.m_h_tel} --%>
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<th> 썸네일이미지  </th>
						<td colspan="3">
							<input type="file" id="thumbnail" name="thumbnail" class="form-control">
							<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품설명이미지 </th>
						<td colspan="3">
							<input type="file" id="prdt_img" name="prdt_img" class="form-control">
						</td>
						
					</tr>
				</table>
				<table class="table table-borderless">
					<tr>
						<th align="center"> 상 품 설 명 </th>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" id="pro_ctnts" name="pro_ctnts" ></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("pro_ctnts");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button id="write_btn" type="button" class="btn btn-primary float-right"> 글 작성 완료 </button>
		
		<a href="${pageContext.request.contextPath}/seller/productList">
			<button type="button" class="btn btn-warning"> 글 작성 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	
	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;
	$(document).ready(function() {//분류
		var proBig = document.querySelector("#pro_big");
		
		var midOptions ={
				feed: ['건식','습식','캔'],
				snack: ['영양제','스틱'],
				store1: ['모래', '장난감','식기'],
				store2:['미용', '의료', '하네스', '하우스']
		};
		
		proBig.onchange = function() {
			var proMid = document.querySelector("#pro_mid");
			var bigOption = proBig.options[proBig.selectedIndex].value;
			
			switch (bigOption){
				case "big_none":
					break;
				case "feed":
					var midOption = midOptions.feed;
					break;
				case "snack":
					var midOption = midOptions.snack;
					break;
				case "store1":
					var midOption = midOptions.store1;
					break;
				case "store2":
					var midOption = midOptions.store2;
					break;
			}
			proMid.options.length = 0;
			
			for( var i = 0; i < midOption.length ; i++){
				var option = document.createElement('option');
				
				option.innerText =  midOption[i];
				proMid.append(option);
			}
		}
		
	});//ready
	$(document).ready(function() {
		
		$("#write_btn").click(function() {

			if( $.trim( $("#pro_name").val() ) == "" ){
				$("#prdt_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#prdt_name_label").text(""); }
			
			if( $("#pro_stock").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //재소수량
				$("#qty_label").text("필수 입력 사항이며, 수량만 허용 됩니다.");
				return;
			} else { $("#qty_label").text(""); }
			
			if( $("#pro_ship").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송가격
				$("#delivery_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_fee_label").text(""); }
			
			if( $("#pro_ship_free").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송무료가격 
				$("#delivery_free_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_free_fee_label").text(""); }

			if( $("#pro_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //판매단가
				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#price_label").text(""); }

			if( $("#pro_dc").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //할인율
				$("#discount_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#discount_label").text(""); }

			
			let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
				$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#thumbnail_label").text(""); }

// 			let tmp3 = $("#prdt_img").val().substring($("#prdt_img").val().length-3);
// 			let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
// 				|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
// 			if( $.trim( $("#prdt_img").val() ) != "" && tmp3_boolean == false ){
// 				$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
// 				return;
// 			} else { $("#desc_img_label").text(""); }

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "pro_ctnts", CKEDITOR.instances.pro_ctnts.getData() );
			
			alert($("#pro_name").val());
			
			
			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/seller/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						
						alert("상품이 등록 되었습니다.");
						location.href = "${pageContext.request.contextPath}/seller/productList";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
			});//ajax

		});//click
	});//ready
	</script>
	</body>
</html>
