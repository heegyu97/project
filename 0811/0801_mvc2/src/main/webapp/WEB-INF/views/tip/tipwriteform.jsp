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
							<input type="text" id="title" name="title" class="form-control">
						</td>
					</tr>
					<tr>
						<th class="text-center"> 작성자 </th>
						<td colspan="2">${m_no}</td>
					</tr>
					<tr>
						<th class="text-center"> 내용 </th>
						<td colspan="2">
							<textarea class="form-control" id="ctnts" name="ctnts"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("ctnts");
							</script>
						</td>
					</tr>
					<tr>
						<th class="text-center"> 설명 이미지 </th>
						<td colspan="2">
							<input type="file" id="upload_file" name="upload_file" class="form-control">
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

			if( $.trim( $("#title").val() ) == "" ){
				$("#title_label").text("제목을 입력 하세요.");
				return;
			} else { $("#title_label").text(""); }

			if( CKEDITOR.instances.ctnts.getData() == "" ){
				$("#ctnts_label").text("내용을 입력 하세요.");
				return;
			} else { $("#ctnts_label").text(""); }

			let form = new FormData( document.getElementById("form_write"));
			form.append("ctnts",CKEDITOR.instances.ctnts.getData());
			<%--$.post start --%>
			
			$.ajax({
				type : "POST"
				, encType : "multipart/form-data"
				, url : "${pageContext.request.contextPath}/tip/ajax_upload"
				, data : form
				, processData : false
				, ctntsType : false
				, cache : false
				, success : function(result) {
					alert("저장 성공");
					location.href="${pageContext.request.contextPath}/"
				}//call back function
				, error : function(xhr) {
					alert("통신 실패")
					
				}//call back function
				
				
			});//ajax
			
			

			<%--$.post end--%>
		});//click
	});//ready
	</script>

		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>