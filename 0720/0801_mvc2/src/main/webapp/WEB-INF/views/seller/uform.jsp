<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 상품 수정 -seller</title>
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
		<h3> 판매자 상품 수정 </h3>
		<hr>
		<form id="write_form">
<!-- 			<table class="table table-hover"> -->

			<table class="table table-bordered table-info">
				<tbody>
					<tr>
					<th > 상 품 항 목  </th> 
						
					</tr>
						
					<tr>
						<td>
							<select class="form-control" id="pro_big" name="pro_big" style="width: 170px">
								<c:forEach var="code_dto" items="${proBigList}">
									<option value="${code_dto.code_class}"
										<c:if test="${select_pro_big == code_dto.code_class}">selected="selected"</c:if>
									>${code_dto.code_class}</option>
								</c:forEach>
							</select>
						</td>
						<!--대분류 끝 -->
						<td>
							<select class="form-control" id="pro_mid" name="pro_mid" style="width: 170px">
<%-- 								<c:forEach var="code_dto2" items="${proMidList}"> --%>
<%-- 									<option value="${code_dto2.code_name}" --%>
<%-- 										<c:if test="${select_pro_mid == code_dto2.code_name}">selected="selected"</c:if> --%>
<%-- 									>${code_dto2.code_name} </option> --%>
<%-- 								</c:forEach> --%>
							</select>
							

						
						</td>
						<!-- 중분류 끝 -->
						<td>
						<c:if test="${dto.pro_age ne null and dto.pro_age ne ''}">
							<select class="form-control" id="pro_age" name="pro_age"  
									style="width: 170px" >
								<option value="age_none"> 연령 선택하세요. </option>
								<option value="all"
									<c:if test="${dto.pro_age == 'all'}">selected="selected"</c:if>
								> 전연령 </option>
								<option value="senior"
									<c:if test="${dto.pro_age == 'senior'}">selected="selected"</c:if>
								> 시니어(7세이상)  </option>
								<option value="adult"
									<c:if test="${dto.pro_age == 'adult'}">selected="selected"</c:if>
								> 어덜트(1~6세)  </option>
								<option value="kitten"
									<c:if test="${dto.pro_age == 'kitten'}">selected="selected"</c:if>
								> 키튼(1세미만)  </option>
							</select>
						</c:if>
						</td>
						<!-- 연령분류 끝 -->
					</tr>
				
				
					<tr>
						<th colspan="3"> 상 품 명  </th>
					</tr>
					<tr>	
						<td colspan="3">
							<input type="text" id="pro_name" name="pro_name" maxlength="20"
									class="form-control" value="${dto.pro_name}">
							<label for="pro_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;"> 재 고 수 량 </th><th style="text-align: center;"> 배 송 가 격 </th><th style="text-align: center;"> 배송무료가격 </th>
					</tr>
					<tr>	
						<td>
							<input type="text" id="pro_stock" name="pro_stock" class="form-control"
									value="${dto.pro_stock}">
							<label for="pro_stock" id="qty_label" class="write_label"></label>
						</td>
						
						<td >
							<input type="text" id="pro_ship" name="pro_ship" class="form-control" 
									value="${dto.pro_ship}">
							<label for="pro_ship" id="delivery_fee_label" class="write_label"></label>
						</td>
						
						<td>
							<input type="text" id="pro_ship_free" name="pro_ship_free" class="form-control"  
									value="${dto.pro_ship_free}">
							<label for="pro_ship_free" id="delivery_free_fee_label" class="write_label"></label>
						</td>
						
					</tr>
				</table>
			
				<table class="table table-bordered table-info">
<!-- 				<table class="table table-borderless"> -->
					
					<tr>
						<th> 판 매 단 가 (*) </th>
						<td>
							<input type="text" id="pro_price" name="pro_price" class="form-control"
									value="${dto.pro_price}">
							<label for="pro_price" id="price_label" class="write_label"></label>
						</td>
						<th> 할 인 율 (*) </th>
						<td>
							<input type="text" id="pro_dc" name="pro_dc" class="form-control"
									value="${dto.pro_dc}">
							<label for="pro_dc" id="discount_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 할인시작일 </th>
						<td>
							<input type="date" id="pro_dc_strt" name="pro_dc_strt" class="form-control"
									value="${dto.pro_dc_strt}">
							<label for="pro_dc_strt" id="discount_start_label" class="write_label"></label>
						</td>
						<th> 할인마지막일 </th>
						<td>
							<input type="date" id="pro_dc_end" name="pro_dc_end" class="form-control"
									value="${dto.pro_dc_end}">
							<label for="pro_dc_end" id="discount_end_label" class="write_label"></label>
						</td>
					</tr>
					
					<tr>
						<th colspan="4"> 썸 네 일 이 미 지  </th>
					</tr>
					<tr>
						<td colspan="4" class="text-center">
							<c:choose>
								<c:when test="${dto.pro_thum_path != null && dto.pro_thum_path != ''}">
									<img src="${dto.pro_thum_path}" width="550px">
									<button id="thumbnail_btn" type="button" class="btn btn-danger delete_btn" 
											value="${dto.pro_thum_path}">
										이미지 삭제
									</button>
								</c:when>
								<c:otherwise>
									<input type="file" id="thumbnail" name="thumbnail" class="form-control">
									<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
								</c:otherwise>
							</c:choose>
						</td>
						
					</tr>
					<tr>
						<th colspan="4"> 상 품 설 명 이 미 지 </th>
					</tr>
					
					<tr>
						<td colspan="4" class="text-center">
							<c:choose>
								<c:when test="${dto.pro_prdt_path != null && dto.pro_prdt_path != ''}">
									<img src="${dto.pro_prdt_path}" width="550px">
									<button id="prdt_img_btn" type="button" class="btn btn-danger delete_btn" 
											value="${dto.pro_prdt_path}">
										이미지 삭제
									</button>
								</c:when>
								<c:otherwise>
									<input type="file" id="prdt_img" name="prdt_img" class="form-control">
									<label for="prdt_img" id="prdt_img_label" class="write_label"></label>
								</c:otherwise>
							</c:choose>
						</td>
						
					</tr>
					<tr>
						<th colspan="4"> 상 품 설 명 </th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="form-contol" id="pro_ctnts" name="pro_ctnts">${dto.pro_ctnts}</textarea>
							<script type="text/javascript">
							CKEDITOR.replace("pro_ctnts");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<button id="write_btn" class="btn btn-primary float-right"> 상품 수정 완료 </button>
		<a href="${pageContext.request.contextPath}/seller/productList">
			<button class="btn btn-warning"> 상품 수정 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;
	$(document).ready(function() {
		
		
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
			//alert($("#pro_mid").val() + "");
 		});//change
		
 	});//ready
		
			
	
	$(document).ready(function() {
		$(".delete_btn").click(function() {//이미지 삭제 버튼
			$.get(
					"${pageContext.request.contextPath}/seller/file/delete"
					, {
						id : $(this).attr("id")
						, path : $(this).val()
						, pro_no : ${dto.pro_no}
					}
					, function(data, status) {
						if(data >= 1){
							alert("파일을 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/seller/uform?pro_no=${dto.pro_no}";
						} else {
							alert("파일 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get
		});//click
	});//ready

	$(document).ready(function() {
		$("#write_btn").click(function() {//수정완료 버튼

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
			
			 //pro_dc_strt
		    if( $.trim( $("#pro_dc_strt").val() )  == ""){//허용되지 않은 글자는 null.
		        $("#discount_start_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
		        return;
		    } else { $("#discount_start_label").text(""); }
		
		
		    //pro_dc_end
		    var startDate = $( "input[name='pro_dc_strt']" ).val(); //2017-12-10
		    var startDateArr = startDate.split('-');
		
		    var endDate = $( "input[name='pro_dc_end']" ).val(); //2017-12-09
		    var endDateArr = endDate.split('-');
		
		    var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
		    var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		
		    if( $.trim( $("#pro_dc_end").val() )  == ""){ //허용되지 않은 글자는 null.
		        $("#discount_end_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
		        return;
		
		    }else if(startDateCompare.getTime() > endDateCompare.getTime()) {
		        $("#discount_end_label").text("시작일과 종료일을 확인해 주세요");
		        return;
		    }
		    else { $("#discount_end_label").text(""); }
			
		  	//thumbnail - 필수
			if( "${dto.pro_thum_pic}" == "" || $.trim($("#thumbnail").val()) != "" ){
				let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG"  || tmp1 == "GIF" || tmp1 == "PNG");
				let tmp11 = $("#thumbnail").val().substring($("#thumbnail").val().length-4);
				let tmp11_boolean = (tmp11 == "jpeg" ||  tmp11 == "JPEG" );
				if( $.trim( $("#thumbnail").val() ) == "" &&   tmp1_boolean == false ){
					$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#thumbnail_label").text(""); }
			}
// 				let tmp21 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
// 				let tmp21_boolean = (tmp21 == "jpg"  || tmp21 == "gif" || tmp21 == "png"
// 								|| tmp21 == "JPG" || tmp21 == "GIF" || tmp21 == "PNG");
// 				let tmp22 = $("#thumbnail").val().substring($("#thumbnail").val().length-4);
// 				let tmp22_boolean = (tmp22 == "jpeg" || tmp22 == "JPEG");
				
// 			if(   $.trim( $("#thumbnail").val() ) == ""  || ($.trim( $("#thumbnail").val() ) == null) ){
// 				return;
// 				$("#thumbnail_label").text("필수 입력 사항입니다.");
				
// 			}else	if( !(tmp21_boolean == true || tmp22_boolean == true) ){
// 					$("#thumbnail_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
// 					return;
// 			}
// 			else { $("#thumbnail_label").text(""); }
			
			
			//prdt_img - 선택
			let tmp11 = $("#prdt_img").val().substring($("#prdt_img").val().length-3);
			let tmp11_boolean = (tmp11 == "jpg"  || tmp11 == "gif" || tmp11 == "png"
								|| tmp11 == "JPG" || tmp11 == "GIF" || tmp11 == "PNG");
			let tmp12 = $("#prdt_img").val().substring($("#prdt_img").val().length-4);
			let tmp12_boolean = (tmp12 == "jpeg" || tmp12 == "JPEG");
			
			
			if( !($.trim( $("#prdt_img").val() ) == "")  && !($.trim( $("#prdt_img").val() ) == null) && !(tmp11_boolean == true || tmp12_boolean == true) ){
				$("#prdt_img_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			}
			else { $("#prdt_img_label").text(""); }

			
			//ajax
			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "pro_ctnts", CKEDITOR.instances.pro_ctnts.getData() );
			form.append( "pro_no", ${dto.pro_no} );
			
			alert("${dto.pro_big}");
			
			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/seller/update"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 수정 되었습니다.");
						
						location.href="${pageContext.request.contextPath}/seller/detail?pro_no=${dto.pro_no}";
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
