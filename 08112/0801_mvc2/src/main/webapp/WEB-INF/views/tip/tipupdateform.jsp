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
						<input type="text" id="writer" name="writer" maxlength="20"
							class="form-control" value="작성자값">
						<label id="writer_label" for="writer" class="writer_label"></label>
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
			</tbody>
		</table>
		
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
				
				if($.trim($("#writer").val())==""){
					$("#writer_label").text("작성자를 입력해 주세요.");
					return;
				} else{$("#writer_label").text("");}
				
				if(CKEDITOR.instances.ctnts.getData()==""){
					$("#ctnts_label").text("내용을 입력해주세요");
				} else{$("#ctnts_label").text("");}
				
// 			$.post(
// 					"${pageContext.request.contextPath}/tip/tipupdate"
// 					, {
// 						board_no : ${detail_dto.tip_no}
// 						, title : $("#title").val()
// 						, writer : $("#writer").val()
// 						, ctnts : CKEDITOR.instances.ctnts.getData()
// 					}
// 					, function(data, status) {
// 						if(data >=1){
// 							alert("게시글을 수정 하였습니다.");
// 							location.href="${pageContext.request.contextPath}/tip/tip";
// 						} else if(data<=0){
// 							alert("수정 하실 수 없는 게시글 입니다.");
// 						} else {
// 							alert("잠시 후 다시 시도해 주세요.");
							
// 						}
						
// 					}//call back function
			
			
			
			
// 			);//post
				
				
				
				
			});//click
		});//ready
		</script>
	</body>
</html>