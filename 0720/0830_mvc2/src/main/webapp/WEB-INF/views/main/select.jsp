<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선택화면</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
	
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<hr>
		<input type="text" id="copy_text" style="position:absolute;top:-9999em;"><!-- 안보이는 위치로 설정 -->
		<div class="row">
			<div class="col-3">
				<h2 class="fontall" style="font-style: italic; color : #ff9e00; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;" >선택 화면</h2>
			</div>
			<div class = "col-6 text-center">
				<c:set var="ymd" value="<%=new java.util.Date()%>" />
				<p class="card-text"><h2  style=" color : #61b88e; font-style: italic; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;"
									 id = "dday1">현재시간 : <fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /></h2></p>
			</div>
			<div class="col-3 text-right">
				<a href="${pageContext.request.contextPath}/space/spaceform">
					<button type="button" class="btn float-right mr-4 fontlee" style=" border: 1px solid; padding-top: 10px; background-color : #ff9e00;">
					방만들기</button>
				</a>
				<button type="button" id="del_select" class="btn float-right mr-4 fontlee"  data-target="#list_modal"
				data-toggle="modal" style=" border: 1px solid; padding-top: 10px; background-color : #ff9e00;">
					삭제 목록</button>
			</div>
			</div>
			
		<!-- for each문으로 리스트 나열하기 -->
		<div class="container row fontall" style="float: none; text-align: center; margin: auto; padding: 0px;">
		<c:forEach var="list" items="${list}" varStatus="status">
			<div
				<c:choose>
					<c:when test = "${status.index == 0}" >"card col-sm-4"</c:when>
					<c:otherwise>"card mx-auto col-sm-4"</c:otherwise>
				</c:choose> 
				style = "float: none; margin:0 auto;">
				<div class="card-body fontall" style = "height: 350px; 
					background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),url('http://localhost:8081/ictedu/resources/img/${list.r_back_img}'); 
					background-size : cover;">
					
					<a href = "http://localhost:8081/ictedu/space/spacelist?r_no=${list.r_no}">
						<h1  class="card-title mx-auto" style = "margin-top: 70px; overflow: hidden; color : #ff9e00; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black; width: 90%; height: 50px">${list.r_title}</h1>
					</a>
					
					<p class="card-text fontall"><h3 class="fontlee" style="color : #61b88e; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;">개설일 : ${list.r_sdate}</h3></p>
					<p class="card-text fontall"><h3 class="fontlee" style="color : #61b88e; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;">만료일 : ${list.r_cdate}</h3></p>
					<button class="rounded mx-auto addressBtn" class="fontlee" style=" border: 1px solid; background-color : #ff9e00;" 
						value = "http://localhost:8081/ictedu/space/spacelist?r_no=${list.r_no}"> 주소 복사 </button>
				</div>
			</div>
		</c:forEach>
		</div>
		<br><br>
		<!-- 페이징 -->
		<div class = "w3-center fontall" style = "width:100%">
		<div class= "w3-bar w3-xlarge fontall">
		<ul class="pagination" >
				<c:if test="${startPageNum > 10}">
					<li class="page-item">
						<a class="page-link"
							href="${pageContext.request.contextPath}/main/select?userWantPage=${startPageNum-1}">
							Previous
						</a>
					</li>
				</c:if>
				<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
					<c:choose>
						<c:when test="${page_no == userWantPage}">
							<li class="page-item active">
								<a class="page-link">${page_no}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link"
									href="${pageContext.request.contextPath}/main/select?userWantPage=${page_no}">
									${page_no}
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${lastPageNum > endPageNum}">
					<li class="page-item">
						<a class="page-link"
							href="${pageContext.request.contextPath}/main/select?userWantPage=${endPageNum+1}">
							Next
						</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
		<br><br>
	
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<!-- modal -->
		<div class="modal" id="list_modal" >
		
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header" >
						<h4 class="modal-title fontall"> 삭제된 방 리스트 확인 </h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body /  -->
					<div class="modal-body" style = "overflow: scroll;height: 210px;">
						<table class="table table-hover table-bordered">
							<tbody>
								<tr>
									<th>방번호</th>
									<th>제목</th>
									<th>만료일</th>
									<th>옵션</th>
								</tr>
								<c:forEach items = "${list2}"  var = "list2">
									<tr>
										<td>
											 ${list2.r_no}
										</td>
										<td>
											 ${list2.r_title}
										</td>
										<td>
											 ${list2.r_cdate}
										</td>
										<td>
											 ${list2.r_op1}
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="modal-footer" >
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">

		$(document).ready(function() {

			var copytext = "";
			$(".addressBtn").click(function() {
				 $("#copy_text").val($(this).val());//해당 문구 가져와 텍스트박스에 입력
	              document.getElementById("copy_text").select(); //텍스트 박스 선택
	              document.execCommand("copy");//클립보드 복사
	              alert("COPY 완료");
				
			});//click
			
			
		});//ready
		</script>
	</body>
</html>