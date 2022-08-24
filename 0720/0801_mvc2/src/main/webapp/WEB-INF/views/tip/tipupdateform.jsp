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
	<form id="write_form">
		<table class="table table-borderless">
			<col class="w-25">
			<tbody>
		
				<tr >
					<td> 제 목 </td>
					<td  class="text-center">
						<input type="text" id="tip_title" name="tip_title" maxlength="50"
							class="form-control" value="${detail.tip_title}">
						<label id="title_label" for="tip_title" class="write_label"></label>
					</td>
				</tr>
			
				<tr>
					<td> 작성자 </td>
					<td>
						<input type="text" id="tip_writer" name="tip_writer" maxlength="20"
							class="form-control" value="${login_info.m_id}" readonly="readonly">
						<label id="writer_label" for="tip_writer" class="writer_label"></label>
					</td>
				</tr>
				<tr>
					<td>
						${detail.tip_date}
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
						<textarea cols="70" id="tip_ctnts" name="tip_ctnts" 
							class="form-control">${detail.tip_ctnts}</textarea><%-- CKEDITOR에 textarea태그 안에 ${}형식으로 값을 넣으면 ajax로 넘기면 넣었던 값이랑 수정한값이 합쳐져서 컨트롤러로 넘어감 --%>
						<script type="text/javascript">
							CKEDITOR.replace("tip_ctnts");
						</script>
						<label id="ctnts_label" for="tip_ctnts" class="write_label"></label>
					</td>
				</tr>
				<tr>
					<th> 썸 네 일 이 미 지 (*) </th>
							<td class="text-center">
								<c:choose>
									<c:when test="${detail.tip_prdt_path != null && detail.tip_prdt_path != ''}">
										<img src="${detail.tip_prdt_path}">
										<button id="thumbnail_btn" type="button" class="btn btn-danger delete_btn" value="${detail.tip_prdt_path}">
											이미지 삭제
										</button>
									</c:when>
									<c:otherwise>
										<input type="file" id="upload_file" name="upload_file" class="form-control">
										<label for="upload_file" id="thumbnail_label" class="write_label"></label>
									</c:otherwise>
								</c:choose>
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
		
		<%--파일 삭제--%>
		$(document).ready(function() {
			$(".delete_btn").click(function() {
				$.get(
						"${pageContext.request.contextPath}/tip/filedelete"
						, {
							id : $(this).attr("id")
							, path : $(this).val()
							, tip_no : ${detail.tip_no}
						}
						, function(data, status) {
							if(data >= 1){
								alert("파일을 삭제 하였습니다.");
								location.href="${pageContext.request.contextPath}/tip/tipupdateform?tip_no=${detail.tip_no}";
							} else {
								alert("파일 삭제를 실패 하였습니다.");
							}
						}//call back function
				);//get
			});//click
		});//ready
		
		
		$(document).ready(function() {
			$("#write_btn").click(function() {

				if($.trim($("#tip_title").val())==""){
					$("#title_label").text("제목을 입력해 주세요.");
					return;
				} else{$("#title_label").text("");}
				

				if(CKEDITOR.instances.tip_ctnts.getData()==""){
					$("#ctnts_label").text("내용을 입력해주세요");
					return;
				} else{$("#ctnts_label").text("");}
				
				if( "${detail.tip_prdt_path}" == "" || $.trim($("#upload_file").val()) != "" ){
					let tmp1 = $("#upload_file").val().substring($("#upload_file").val().length-3);
					let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
										|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
					if( $.trim( $("#upload_file").val() ) == "" || tmp1_boolean == false ){
						$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
						return;
					} else { $("#thumbnail_label").text(""); }
				}
				
				
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
				let form = new FormData( document.getElementById( "write_form" ) );
				form.append( "tip_ctnts", CKEDITOR.instances.tip_ctnts.getData() );
				form.append( "tip_no", ${detail.tip_no} );
				
				
				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/tip/tipupdate"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 수정 되었습니다.");
						location.href="${pageContext.request.contextPath}/tip/tipdetail?tip_no=${detail.tip_no}";
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