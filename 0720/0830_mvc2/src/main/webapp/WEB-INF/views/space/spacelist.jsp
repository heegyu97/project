<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			#img-div{
				background-image: url('http://localhost:8081/ictedu/resources/img/img2.jpg');
				width:  400px;
				height: 300px;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</style>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th>TITLE</th>
					<td><input type="text" id="space_title" name="space_title" class="form-control"></td>
					<th>DATE</th>
					<td><input type="text" id="space_date" name="space_date" class="form-control"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
				<!-- if문사용해서 버튼 바꿔주기  -->
					<td><button type="button" id="btn1" class="form-control">링크 복사하기</button></td>
					<td><button type="button" id="btn1" class="form-control"> 글 작 성 </button></td>
				</tr>
			</tbody>
		</table>
		
		<!-- test1 -->
		<div id="test" class = "carousel slide" data-ride = "carousel" style = "width: 100% ; height: 100% ; margin-top: 0px">
							<ul class = "carousel-indicators">
								<!-- 데이터 순서 / 활성처음 -->
								<!-- for 첫번째 -->
								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status">
									<li data-target = "#test" data-slide-to="${status.index}" 
									<c:if test = "${status.index==0}"> class = "active"</c:if>
									></li>
								</c:forEach>
							</ul>
							<!-- 이미지 넣기 -->
							<div class = "carousel-inner " style = "margin-top : 0px;">
								<!-- for 2번째 -->
								
								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status">
								<div class = 
									<c:choose>
										<c:when test = "${status.index==0}">
											<h4>이미지입니다</h4>
										</c:when>
										<c:otherwise>
											"carousel-item"
										</c:otherwise>
									</c:choose>
								>
									<a href="#" target="_parent" >
										<img src="${pageContext.request.contextPath}/resources/img/img1.jpg" style="width:370px; height:200px;">
									</a>
								</div>
								</c:forEach>
							</div>
						</div>
						
						<!-- test2 -->
						<div>
							<div style="position: absolute;">
								<div style="position: relative; top: 50px; left: 50px;">
									<img src="${pageContext.request.contextPath}/resources/img/img1.jpg" style="width:70px; height:70px;"></img>
								</div>
							</div>
							<div style="position: absolute;">
								<div style="position: relative; top: 100px; left: 100px;">
									<img src="${pageContext.request.contextPath}/resources/img/img2.jpg" style="width:70px; height:70px;"></img>
								</div>
							</div>
								<img src="${pageContext.request.contextPath}/resources/img/img3.jpg" style="width:300px; height:300px;"></img>
							</div>
		
		
		
		
	</body>
</html>