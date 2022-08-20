<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>event_form</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
		
		</style>
		
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 이벤트 제목 </th>
						<td colspan="3">
							<input type="text" id="evnt_title" name="evnt_title" maxlength="20"
									class="form-control">
							<label for="evnt_title" id="evnt_title_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 이벤트 시작일 </th>
						<td colspan="3">
							<input type="date" id="event_strt" name="event_strt" class="form-control">
							<label for="event_strt" id="event_strt_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 이벤트 종료일 </th>
						<td colspan="3">
							<input type="date" id="evnt_end" name="evnt_end" class="form-control">
							<label for="evnt_end" id="evnt_end_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 판매자 </th>
						<td colspan="3">
							<input type="text" id="m_id" name="m_id" maxlength="20"
									class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 회사명 </th>
						<td>
							<input type="text" id="m_h_name" name="m_h_name" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 회사전화번호 </th>
						<td>
							<input type="text" id="m_h_tel" name="m_h_tel" class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<th> 설명이미지 </th>
						<td colspan="3">
							<input type="file" id="evnt_pic" name="evnt_pic" class="form-control">
							<label for="evnt_pic" id="evnt_pic_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상세설명 </th>
						<td colspan="3">
							<textarea class="form-contol" id="evnt_ctnts" name="evnt_ctnts"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("evnt_ctnts");
							</script>
						</td>
					</tr>
					<tr>
						<th> 썸네일이미지 </th>
						<td colspan="3">
							<input type="file" id="evnt_thum_name" name="evnt_thum_name" class="form-control">
							<label for="evnt_thum_name" id="evnt_thum_name_label" class="write_label"></label>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<a href="${pageContext.request.contextPath}/event/event_manager">
			<button class="btn btn-warning float-right mr-4"> 상품 등록 취소 </button>
		</a>
		
		<button id="write_btn" class="btn btn-primary float-right mr-4"> 상품 등록 완료 </button>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	<script type="text/javascript">
		let onlyNum = /^[0-9]+$/;

		$(document).ready(function() {
			
			
			
			$("#write_btn").click(function() {
				
				//evnt_title
				if( $.trim( $("#evnt_title").val() ) == "" ){
					$("#evnt_title_label").text("상품명을 입력 하세요.");
					return;
				} else { $("#evnt_title_label").text(""); }
				
				//시작일 필수 + 종료일 필수
				//event_strt
				if( $("#event_strt").val() == null || $("#event_strt").val() == ""){//허용되지 않은 글자는 null.
					$("#event_strt_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
					return;
				} else { $("#event_strt_label").text(""); }
				
				
				//evnt_end
				var startDate = $( "input[name='event_strt']" ).val(); //2017-12-10
		        var startDateArr = startDate.split('-');
		         
		        var endDate = $( "input[name='evnt_end']" ).val(); //2017-12-09
		        var endDateArr = endDate.split('-');
		                 
		        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
		        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		         
		        if( $("#evnt_end").val() == null || $("#evnt_end").val() == ""){//허용되지 않은 글자는 null.
					$("#evnt_end_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
					return;
				
				}else if(startDateCompare.getTime() > endDateCompare.getTime()) {
					$("#evnt_end_label").text("시작일과 종료일을 확인해 주세요");
		            return;
		        }
				else { $("#evnt_end_label").text(""); }
				
				
				//evnt_thum_name - 필수
				let tmp21 = $("#evnt_thum_name").val().substring($("#evnt_thum_name").val().length-3);
				let tmp21_boolean = (tmp21 == "jpg"  || tmp21 == "gif" || tmp21 == "png"
									|| tmp21 == "JPG" || tmp21 == "GIF" || tmp21 == "PNG");
				let tmp22 = $("#evnt_thum_name").val().substring($("#evnt_thum_name").val().length-4);
				let tmp22_boolean = (tmp22 == "jpeg" || tmp22 == "JPEG");
				
				if(   $.trim( $("#evnt_thum_name").val() ) == ""  || ($.trim( $("#evnt_thum_name").val() ) == null) ){
					$("#evnt_thum_name_label").text("필수 입력 사항입니다.");
					return;
					
				}else if( !(tmp21_boolean == true || tmp22_boolean == true) ){
					$("#evnt_thum_name_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				}
				else { $("#evnt_thum_name_label").text(""); }
				
				
				//evnt_pic - 선택
				let tmp11 = $("#evnt_pic").val().substring($("#evnt_pic").val().length-3);
				let tmp11_boolean = (tmp11 == "jpg"  || tmp11 == "gif" || tmp11 == "png"
									|| tmp11 == "JPG" || tmp11 == "GIF" || tmp11 == "PNG");
				let tmp12 = $("#evnt_pic").val().substring($("#evnt_pic").val().length-4);
				let tmp12_boolean = (tmp12 == "jpeg" || tmp12 == "JPEG");
				
				
				if( !($.trim( $("#evnt_pic").val() ) == "")  && !($.trim( $("#evnt_pic").val() ) == null) && !(tmp11_boolean == true || tmp12_boolean == true) ){
					$("#evnt_pic_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				}
				else { $("#evnt_pic_label").text(""); }
				
				
				//evnt_ctnts
				let form = new FormData( document.getElementById( "write_form" ) );
				form.append( "description", CKEDITOR.instances.evnt_ctnts.getData() );
				
				let keys = form.keys();
				for(key of keys) console.log(key);
	
				let values = form.values();
				for(value of values) console.log(value);
				
				/*
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
				*/
				
			});//click
		});//ready
	</script>
	</body>
</html>