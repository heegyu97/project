<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		table{
			margin-left: auto;
			margin-right: auto;
			table-layout: fixed;
		}
		div.pname{
			width: 300px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
		a{
			text-decoration : none;
			color: black;
			font-size: 25px;
		}
		.write_label{
			font-size:0.7em;
			color: red;
		
		
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<hr>
		<h3 class="text-center"> tip 게시판 글 등록 </h3>
		<hr>
		<%--처음 --%>
		<form id="form_write">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th class="text-center"> 제목 </th>
						<td colspan="2">
							<input type="text" id="tip_title" name="tip_title" class="form-control">
							<label id="title_label" for="tip_title" class="write_label"></label>
						</td>
						<!--title  -->
						<!--cnts  -->
						<!--upload_file  -->
					</tr>
					<tr>
						<th class="text-center"> 작성자 </th>
						<td colspan="2">${select.m_id}</td>
					</tr>
					<tr>
						<th class="text-center"> 내용 </th>
						<td colspan="2">
							<textarea class="form-control" id="tip_ctnts" name="tip_ctnts"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("tip_ctnts");
							</script>
							<label id="ctnts_label" for="tip_ctnts" class="write_label" ></label>
							
						</td>
					</tr>
					<tr>
						<th class="text-center"> 이미지 </th>
						<td colspan="2">
							<input type="file" id="upload_file" name="upload_file" class="form-control">
							<label for="upload_file" id="thumbnail_label" class="write_label"></label>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div>
			<button type="button" id=write_btn class="btn btn-primary float-right" > 글등록 </button>
		</div>
		<a class="float-right" href="${pageContext.request.contextPath}/tip/tip">
			<button class="form-control"> 취소 </button>
		</a>
		
		
		
		<%--마지막 --%>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#tip_title").val() ) == "" ){
				$("#title_label").text("제목을 입력 하세요.");
				return;
			} else { $("#title_label").text(""); }

			if( CKEDITOR.instances.tip_ctnts.getData() == "" ){
				$("#ctnts_label").text("내용을 입력 하세요.");
				return;
			} else { $("#ctnts_label").text(""); }
			
			if( "${detail.tip_prdt_path}" == "" || $.trim($("#upload_file").val()) != "" ){
				let tmp1 = $("#upload_file").val().substring($("#upload_file").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
				if( $.trim( $("#upload_file").val() ) == "" || tmp1_boolean == false ){
					$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#thumbnail_label").text(""); }
			}
			
			
			
			
			let form = new FormData( document.getElementById("form_write"));
			form.append("tip_ctnts",CKEDITOR.instances.tip_ctnts.getData());
			<%--$.post start --%>
			<%--
			alert( $("#tip_title").val() );//
			alert( CKEDITOR.instances.tip_ctnts.getData());//
			--%>
			$.ajax({
				type : "POST"
				, encType : "multipart/form-data"
				, url : "${pageContext.request.contextPath}/tip/tipwrite"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("저장 성공");
						location.href = "${pageContext.request.contextPath}/tip/tip";
					}//call back function
					, error : function(xhr) {
						alert("통신 실패");
					}//call back function//xhr : xml http request/response
			});//ajax
			
			

			<%--$.post end--%>
		});//click
	});//ready
	</script>

		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>