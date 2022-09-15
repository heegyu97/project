<%@page import="org.springframework.boot.web.error.ErrorAttributeOptions.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cnts write form</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<form id="write_form">
	<table class="table table-hover">
		<tbody>
			<tr>
				<th> 방 번호</th>
				<td>${dto.r_no} </td>
			</tr>
			<tr>
				<th> 제 목 </th>
				<td><input type="text" class="form-control" id="w_title" name="w_title"></td>
			</tr>
			<tr>
				<th> 내 용 </th>
				<td><textarea  class="form-contol" id="w_cnt" name="w_cnt"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace("w_cnt");
				</script>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<ul class="nav nav-tabs">
						    <li class="nav-item">
						      <a class="nav-link active" data-toggle="tab" href="#youtube">youtube</a>
						    </li>
						    <li class="nav-item">
						      <a class="nav-link" data-toggle="tab" href="#picture">picture</a>
						    </li>
						   
						  </ul>
						<div class="tab-content">
						    <div id="youtube" class="container tab-pane active"><br>
						     	<div class="input-group">
									<input type="text" class="form-control" id="w_link" name="w_link">
									<a href="https://www.youtube.com/" target="_blank">
										<button type="button" class="btn btn-light">
											<img src="${pageContext.request.contextPath}/resources/img/youtube.png" width="66px" height="24px">
										</button>
									</a>
								</div>
						    </div>
						    <div id="picture" class="container tab-pane fade"><br>
						    	<h6>원하시는 이미지를 선택해주세요.</h6>
							  	<input type="radio" id="pic_sel_1" name="pic_sel"  value="1" hidden="hidden">
								<input type="radio" id="pic_sel_2" name="pic_sel"  value="2" hidden="hidden">
								<section class="buttons">
									<label  for="pic_sel_1" style="margin-right: 20px">
										<img id="img1" name="img_sel" src="${pageContext.request.contextPath}/resources/img/gg.jpg"  
												width="112px" height="63px" style="border:1px solid;">
									</label>
									<label for="pic_sel_2" >
										<img id="img2" name="img_sel" src="${pageContext.request.contextPath}/resources/img/leave.jpg"
												width="112px" height="63px" style="border:1px solid;">									
									</label>
								</section>
							</div>
						   
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	
	<button class="btn btn-primary float-right btn-block" id="insert_btn" name="insert_btn"> 등 록  </button>
	<a href="${pageContext.request.contextPath}/space/spacelist?r_no=${dto.r_no}">
		<button class="btn btn-warning btn-block"> 이 전 </button>
	</a>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	<script type="text/javascript">
	$(document).ready(function() {//이미지 선택확인
		$("#pic_sel_1").click(function() {
			let ck1 = $("#pic_sel_1").prop('checked');
			
			if(ck1){
				$("#img1").attr("style", "border: 2px solid blue;"); 
				$("#img2").attr("style", "border: 1px solid;");
				$("#pic_sel_2").prop('checked', false);
			}
			
		});//click-ck1
		$("#pic_sel_2").click(function() {
			let ck2 = $("#pic_sel_2").prop('checked');
			
			if(ck2){
				$("#img2").attr("style", "border: 2px solid blue;"); 
				$("#img1").attr("style", "border: 1px solid;");
				$("#pic_sel_1").prop('checked', false);
			}
		});//click-ck2
		
	});//ready
	
	$(document).ready(function() {
		var ytTmp = "";
		var addTmp = "https://www.youtube.com/embed/"
		var resultLink = "";
		
		$("#insert_btn").click(function() {
			
			//유튜브 링크 수정
			if( $("#w_link").val() != ''){
	 			ytTmp = $("#w_link").val().substring($("#w_link").val().length-11);
				resultLink = addTmp.concat(ytTmp);
				$("#w_link").val( resultLink );
// 				alert( resultLink );//링크 추소 확인
				
				if( $("input[name=pic_sel]:checked").is(":checked") ){
					resultLink = "";
					$("input[name=pic_sel]").prop('checked', false);
					$("#img2").attr("style", "border: 1px solid;"); 
					$("#img1").attr("style", "border: 1px solid;");
					$("#w_link").val( resultLink );

					alert( "영상  또는  사진 하나만 선택해주세요" );
					return;
				}
					
			} else if($("#w_link").val() == '') {
				
				if( $("input[name=pic_sel]:checked").is(":checked") ){
					resultLink = $("input[name=pic_sel]:checked").val();
					$("#w_link").val( resultLink );
// 					alert( resultLink + "1" );//선택한 이미지 확인
				} else {

					alert("링크 혹은 사진을 입력헤주세요.");
					return;
				}	
			}
			
			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "w_cnt", CKEDITOR.instances.w_cnt.getData() );
			form.append("r_no", ${dto.r_no});
			
			$.ajax({
				type : "POST"
				, encType : "multipart/form-data"
				, url : "${pageContext.request.contextPath}/cnts/insert"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("상품이 등록 되었습니다.");
					location.href = "${pageContext.request.contextPath}/space/spacelist?r_no=${dto.r_no}";
// 					location.href = "javascript:history.back(-1)";
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