<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 상품 등록 </title>
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
			<table class="table table-borderless">
				<tbody>
					<tr>
					<th colspan="3"> 상 품 항 목  </th>
					</tr>
					<tr>
						<td >
							<form action="${pageContext.request.contextPath}/board/member/list" method="get">
								<div class="input-group">
									<div class="input-group-prepend">
										<select class="form-control" id="searchOption" name="searchOption" 
												style="width: 170px">
											<option value="big_none"
												<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
											> 대분류 선택하세요. </option>
											<option value="writer"
												<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
											> 사료 </option>
										</select>
									</div>
								</div>
							</form>
						</td>
						<td>
							<form action="${pageContext.request.contextPath}/board/member/list" method="get">
								<div class="input-group">
									<div class="input-group-prepend">
										<select class="form-control" id="searchOption" name="searchOption" 
												style="width: 170px">
											<option value="title"
												<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
											> 중분류 선택하세요 </option>
											<option value="writer"
												<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
											> 습식 </option>
										</select>
									</div>
								</div>
							</form>
						</td>
						<td>
							<form action="${pageContext.request.contextPath}/board/member/list" method="get">
								<div class="input-group">
									<div class="input-group-prepend">
										<select class="form-control" id="searchOption" name="searchOption" 
												style="width: 170px">
											<option value="title"
												<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
											> 연령</option>
											<option value="writer"
												<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
											> 1 ~ 7세 </option>
										</select>
									</div>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<th colspan="3"> 상 품 명 </th>
					</tr>
					<tr>
						<td colspan="3">
							<input type="text" id="prdt_name" name="prdt_name" maxlength="20"
									class="form-control">
							<label for="prdt_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
				
					<tr>
						<th style="text-align: center;"> 재 고 수 량 </th><th style="text-align: center;"> 배 송 가 격 </th><th style="text-align: center;"> 배송무료가격 </th>
					</tr>
					<tr>
						<td>
							<input type="text" id="qty" name="qty" class="form-control">
							<label for="qty" id="qty_label" class="write_label"></label>
						</td>
						
						<td >
							<input type="text" id="delivery_fee" name="delivery_fee" class="form-control" >
							<label for="delivery_fee" id="delivery_fee_label" class="write_label"></label>
						</td>
					
						<td>
							<input type="text" id="delivery_free_fee" name="delivery_free_fee" class="form-control"  
									placeholder="얼마이상시 배송무료">
							<label for="delivery_free_fee" id="delivery_free_fee_label" class="write_label"></label>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<th width="130px"> 판매단가  </th>
						<td>
							<input type="text" id="price" name="price" class="form-control">
							<label for="price" id="price_label" class="write_label"></label>
						</td>
						<th width="130px"> 할 인 율 </th>
						<td>
							<input type="text" id="discount" name="discount" class="form-control">
							<label for="discount" id="discount_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 할인시작일 </th>
						<td>
							<input type="text" id="discount_start" name="discount_start" class="form-control">
							<label for="discount_start" id="discount_start_label" class="write_label"></label>
						</td>
						<th> 할인마지막일 </th>
						<td>
							<input type="text" id="discount_end" name="discount_end" class="form-control">
							<label for="discount_end" id="discount_end_label" class="write_label"></label>
						</td>
					</tr>
				
					<tr>
						<th> 판 매 자 </th>
						<td colspan="3">
							${login_info.mid}
						</td>
					</tr>
					<tr>
						<th> 회사명 </th>
						<td >
							${login_info.mid}
						</td>
						<th> 회사전화번호 </th>
						<td >
							${login_info.mid}
						</td>
					</tr>
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
							<input type="file" id="desc_img" name="desc_img" class="form-control">
						</td>
						
					</tr>
				</table>
				<table class="table table-borderless">
					<tr>
						<th align="center"> 상 품 설 명 </th>
					</tr>
					<tr>
						<td ">
							<textarea class="form-control" id="desc_txt" name="desc_txt" ></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
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
		
	});//ready
	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#prdt_name").val() ) == "" ){
				$("#prdt_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#prdt_name_label").text(""); }
			
			if( $("#qty").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //재소수량
				$("#qty_label").text("필수 입력 사항이며, 수량만 허용 됩니다.");
				return;
			} else { $("#qty_label").text(""); }
			
			if( $("#delivery_fee").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송가격
				$("#delivery_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_fee_label").text(""); }
			
			if( $("#delivery_free_fee").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //배송무료가격 
				$("#delivery_free_fee_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_free_fee_label").text(""); }

			if( $("#price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //판매단가
				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#price_label").text(""); }

			if( $("#discount").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //할인율
				$("#discount_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#discount_label").text(""); }

			if( $("#discount_start").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //할인 시작
				$("#discount_start_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#discount_start_label").text(""); }
			
			if( $("#discount_end").val().match(onlyNum) == null ){//허용되지 않은 글자는 null. //할인 마지막
				$("#discount_end_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#discount_end_label").text(""); }
			
			
			
			let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
				$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#thumbnail_label").text(""); }

			let tmp3 = $("#desc_img").val().substring($("#desc_img").val().length-3);
			let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
				|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
			if( $.trim( $("#desc_img").val() ) != "" && tmp3_boolean == false ){
				$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#desc_img_label").text(""); }

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );

			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/product/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 등록 되었습니다.");
						location.href = "${pageContext.request.contextPath}/product/list";
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
