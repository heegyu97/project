<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			td{
/* 			foreach(값  50 + 50*(값%3)0 %3 /3) */
				width:150px;
				height: 10px;
				text-align: center
			}
			th{
				width:50px;
				height: 10px;
				text-align: center
			}
			#div1{
				position: relative; top: 50px; left: 50px;
			
			}
			#back_img{
				width:4*100px; height:300px;
			
			}
			.card{
				width: 50px;
				border: 1px solid black;
			}
			table{
				margin-top: 50px;
			}
			
			
			
/* 			마우스오버이벤트 */
			.btn{
 				background: rgba(0, 0, 0, 0.6); 
/* 				background-color: rgba(255, 255, 255, .3); *//*투명색*/
				display:block;
				opacity:0;/*버튼 안보이게하기*/
				transition:0.5s all;/*나오는속도*/
				
				
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</style>
	</head>
	<body>
		<table class="mx-auto" >
			<thead>
				<tr>
					<td>TITLE</td>
					<td><input type="text" id="space_title" name="space_title" class="form-control"></td>
					<td>DATE</td>
					<td><input type="text" id="space_date" name="space_date" class="form-control"></td>
				</tr>
			</thead>
			<tbody>
				<!--이미지 시작   -->
				<tr>
					<td colspan="4" style = "text-align: center; height: 500px;width: 500px" >
						<div id="chong">
							<div id="test" class = "carousel slide" data-ride = "carousel" style = "width: 100% ; height: 100% ;">
								<ul class = "carousel-indicators">
									<!-- 데이터 순서 / 활성처음 -->
									<!-- for 첫번째 -->
									<c:forEach var="dto" items="${list}" varStatus = "status" step="6"> 
										<li data-target = "#test" data-slide-to="${status.index/6}" 
										<c:if test = "${status.index==0}"> class = "active"</c:if>
										></li>
									</c:forEach>
								</ul>
								<!-- 이미지 넣기 -->
								<div class = "carousel-inner " style = "margin-top : 0px;">
									<!-- for 2번째 -->
									
									<!-- 첫페이지 만들기 -->
									<c:forEach items="${list}" varStatus = "status" step = "6">
									<div class = 
										<c:choose>
											<c:when test = "${status.index==0}">
												"carousel-item active"
											</c:when>
											<c:otherwise>
												"carousel-item"
											</c:otherwise>
										</c:choose>
									>
										<%-- 이미지 6개 리스트 + 링크--%>
										<div id="div1" style = "width: 100% ; height: 100% ;">
											<c:forEach items="${list}" var="dto" begin = "${status.index}" end = "${status.index+5}" varStatus = "status2" >
												<div class="card" style=
												<c:choose>
													<c:when test="${status2.index%6==0}">"position: absolute; left: 140px; top:100px; "</c:when>
													<c:when test="${status2.index%6==1}">"position: absolute; left: 220px; top:100px; "</c:when>
													<c:when test="${status2.index%6==2}">"position: absolute; left: 300px; top:100px; "</c:when>
													<c:when test="${status2.index%6==3}">"position: absolute; left: 140px; top:200px; "</c:when>
													<c:when test="${status2.index%6==4}">"position: absolute; left: 220px; top:200px; "</c:when>
													<c:when test="${status2.index%6==5}">"position: absolute; left: 300px; top:200px; "</c:when>
												</c:choose>
												>
	<%-- 											<a href="${dto.w_no}/cnts/detail?w_no=${dto.w_no}"> --%>
													<img id="back_img" src="${pageContext.request.contextPath}/resources/img/img3.jpg" style = "width: 48px; height: 45px;"></img>
	<!-- 											</a> -->
												</div>	
											</c:forEach>
										</div>
										
										<img id="back_img" src="${pageContext.request.contextPath}/resources/img/img3.jpg" style = "left:50px; top:50px; width:400px; height:400px; position: absolute; z-index:-6;"></img>
									</div>
									</c:forEach>
									<!-- 이미지 이동버튼 -->
									<a class="btn carousel-control-prev" href="#test" data-slide="prev" >
										<span class="carousel-control-prev-icon"></span>
									</a>
									<a class="btn carousel-control-next" href="#test" data-slide="next">
										<span class="carousel-control-next-icon" style="top: 200px;" ></span>
									</a>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<!-- 이미지 끝 -->
				<tr>
				<!-- if문사용해서 버튼 바꿔주기  -->
					<!-- 글작성, 주소복사 버튼 시작-->
					<td colspan="4">
<%-- 				<c:if test = "${login_info.m_no == detail.m_no && !( login_info.m_no == '' || login_info.m_no == null ) }" > --%>
						<c:choose>
							<c:when test="${'0' == '1' }">
								<button type="button" id="btn1" class="form-control">링크 복사하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="btn1" class="form-control"> 글 작 성 </button>
							</c:otherwise>
						</c:choose>						
					</td>
					<!-- 글작성, 주소복사 버튼 끝-->
				</tr>
			</tbody>
			
		</table>
			
			<%--========================================================================= --%>
		
	
</html>