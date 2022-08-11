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
			color:red;
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	
	<hr>
		
<!-- 		<table class="table table-bordered"> -->
		<form id="form_write">
		<table class="table table-borderless">
			<col class="w-25">
			<tbody>
		
				<tr >
					<td> 제목 </td>
					<td  class="text-center">
						<input type="text" id="title" name="title" maxlength="50"
							class="form-control" value="제목값">
						<label id="title_label" for="title" class="write_label"></label>
					</td>
				</tr>
			
				<tr>
					<td> 작성자 </td>
					<td>
						${m_no}
					</td>
				</tr>
				<tr>
					<td>
						날짜
					</td>
					<td class="float-right">
						추천 조회수
					</td>
				</tr>
			</tbody>
		</table>
		
		<hr>
		
		<table>
			<tbody>
				<tr>
					<td> 내용 </td>
					<td>
						<textarea cols="70" id="ctnts" name="ctnts"
							class="form-control">내용</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('ctnts');
						</script>
						<label id="ctnts_label" for="ctnts" class="write_label"></label>
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
		
		<%-- 버튼 --%>
			
			
			<button id="write_btn" class="btn btn-primary float-right"> 수정완료 </button>
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tip">
				<button class="btn btn-success float-right mr-2"> 수정취소 </button>
			</a>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$("#write_btn").click(function() {

				if($.trim($("#title").val())==""){
					$("#title_label").text("제목을 입력해 주세요.");
					return;
				} else{$("#title_label").text("");}
				
				
				
				
				if(CKEDITOR.instances.ctnts.getData()==""){
					$("#ctnts_label").text("내용을 입력해주세요");
					return;
				} else{$("#ctnts_label").text("");}
				
				
				
				let form = new FormData( document.getElementById("form_write"));
				form.append("ctnts",CKEDITOR.instances.ctnts.getData());
				
				
				
				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/tip/tipupdate"
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
				
				
				
				
			});//click
		});//ready
		</script>
	</body>
</html>