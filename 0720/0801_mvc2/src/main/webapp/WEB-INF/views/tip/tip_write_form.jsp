<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프</title>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- CKEDITOR -->
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		
		<!-- bootstrap to icon -->
		<script defer
			src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
			integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
			crossorigin="anonymous"></script>
		<script defer
			src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
			integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
			crossorigin="anonymous"></script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous">
		<style type="text/css">
		<%@ include  file ="/WEB-INF/views/style_share.jsp" %> 
		<%@ include  file ="/WEB-INF/views/style_hf.jsp" %> 
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