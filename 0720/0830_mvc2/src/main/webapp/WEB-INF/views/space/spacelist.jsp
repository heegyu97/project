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
					<td>
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
					</td>
				</tr>
				<tr>
				<!-- if문사용해서 버튼 바꿔주기  -->
					<td><button type="button" id="btn1" class="form-control">링크 복사하기</button></td>
					<td><button type="button" id="btn1" class="form-control"> 글 작 성 </button></td>
				</tr>
			</tbody>
		</table>
		
		
		
		
		
		
		
		<!-- test1 background에 이미지하는법-->
<!-- 		<div id="test" class = "carousel slide" data-ride = "carousel" style = "width: 100% ; height: 100% ; margin-top: 0px"> -->
<!-- 							<ul class = "carousel-indicators"> -->
<!-- 								데이터 순서 / 활성처음 -->
<!-- 								for 첫번째 -->
<%-- 								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status"> --%>
<%-- 									<li data-target = "#test" data-slide-to="${status.index}"  --%>
<%-- 									<c:if test = "${status.index==0}"> class = "active"</c:if> --%>
<!-- 									></li> -->
<!-- 								</c:forEach> -->
<!-- 							</ul> -->
<!-- 							이미지 넣기 -->
<!-- 							<div class = "carousel-inner " style = "margin-top : 0px;"> -->
<!-- 								for 2번째 -->
								
<%-- 								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status"> --%>
<!-- 								<div class =  -->
<!-- 									<c:choose> -->
<%-- 										<c:when test = "${status.index==0}"> --%>
<!-- 											<h4>이미지입니다</h4> -->
<!-- 										</c:when> -->
<!-- 										<c:otherwise> -->
<!-- 											"carousel-item" -->
<!-- 										</c:otherwise> -->
<!-- 									</c:choose> -->
<!-- 								> -->
<!-- 									<a href="#" target="_parent" > -->
<%-- 										<img src="${pageContext.request.contextPath}/resources/img/img1.jpg" style="width:370px; height:200px;"> --%>
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 								</c:forEach> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
		<!-- test2 이미지위에 이미지만드는코드 -->
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
		
		<!-- test3 페이지넘기는거랑 합친거-->
		 <!-- carousel를 구성할 영역 설절 -->
			<div style="width: 300px;margin: 100px;">
				
				 <!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->    
				 <!-- carousel는 특이하게 id를 설정해야 한다.-->
				<div id="carousel-example-generic" class="carousel slide" >
					<!-- carousel의 지시자 -->      
					<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
					<ol class="carousel-indicators">
						 <!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->        
						 <!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->        
						 <!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>        
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>        
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>        
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>        
						<li data-target="#carousel-example-generic" data-slide-to="4"></li>      
					</ol>
					<!-- 실제 이미지 아이템 -->      
					<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
					<div class="carousel-inner">        
						<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 
							개수와 item의 개수는 일치해야 한다. -->
						<div class="item active">          
							<!-- 아미지 설정- -->          
							<img style="width:100%">          
							<!-- 캡션 설정 (생략 가능) -->          
							<!-- 글자 색은 검은색 -->          
							<div class="carousel-caption" style="color:black;">           
								1 페이지          
							</div>
						</div>
						<div class="item">          
							<img style="width:100%">          
							<div class="carousel-caption" style="color:black;">          
								2 페이지          
							</div>        
						</div>        
						<div class="item">          
							<img style="width:100%">          
							<div class="carousel-caption" style="color:black;">          
								3 페이지          
							</div>        
						</div>        
						<div class="item">          
							<img style="width:100%">          
							<div class="carousel-caption" style="color:black;">          
								4 페이지          
							</div>        
						</div>        
						<div class="item">          
							<img style="width:100%">          
							<div class="carousel-caption" style="color:black;">          
								5 페이지          
							</div>        
						</div>      
					</div>
					<!-- 왼쪽 화살표 버튼 -->      
					<!-- href는 carousel의 id를 가르킨다. -->      
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">        
						<!-- 왼쪽 화살표 -->        
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true">
						</span>      
					</a>      
					<!-- 오른쪽 화살표 버튼 -->      
					<!-- href는 carousel의 id를 가르킨다. -->      
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">        
						<!-- 오른쪽 화살표 -->        
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
						</span>      
					</a>    
				</div>  
			</div>  
			<!-- 이미지 슬라이드 순환을 개시 -->  
			<button id="carousel_cycle">순환</button>
			<br />  
			<!-- 이미지 슬라이드 순환을 정지 -->  
			<button id="carousel_pause">정지</button>
			<br />  
			<!-- 이미지 슬라이드를 이동할 수 -->  
			<input type="number" id="carousel_number" min=1 max=5 value="1" >  
			<!-- 이미지 슬라이드 이동 -->  <button id="carousel_move">이동</button>
			<br />  
			<!-- 이미지 슬라이드 전 페이지 이동 -->  
			<button id="carousel_prev">전</button>  
			<!-- 이미지 슬라이드 다음 페이지 이동 -->  
			<button id="carousel_next">후</button>
			
			
			<!-- 아래 스크립트 도큐먼트로 바꾸기 -->
<!-- 			<script> -->
// 			$(function(){        
// 				// 이미지 설정        
// 				$("img").attr("src","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAMSURBVBhXY/j//z8ABf4C/qc1gYQAAAAASUVORK5CYII=");        
// 				// 이미지 슬라이드 설정		
// 				$('#carousel-example-generic').carousel({          
// 					// 순환 설정         
// 					interval: 1000          
// 					// 순환을 정지시킨다.        
// 					}).carousel('pause');	
// 				});    
// 			// 이미지 슬라이드 순환을 개시    
// 			$("#carousel_cycle").on("click", function() {       
// 				$('#carousel-example-generic').carousel('cycle');     
// 				});    
// 			// 이미지 슬라이드 순환을 정지   
// 			$("#carousel_pause").on("click", function() {       
// 				$('#carousel-example-generic').carousel('pause');     
// 				});    
// 			// 이미지 슬라이드 이동    
// 			$("#carousel_move").on("click", function() {      
// 				var num = Number($("#carousel_number").val()) - 1;      
// 				$('#carousel-example-generic').carousel(num);     
// 				});    
// 			// 이미지 슬라이드 전 페이지 이동    
// 			$("#carousel_prev").on("click", function() {       
// 				$('#carousel-example-generic').carousel('prev');     
// 				});    
// 			// 이미지 슬라이드 다음 페이지 이동    
// 			$("#carousel_next").on("click", function() {       
// 				$('#carousel-example-generic').carousel('next');     
// 				});    
// 			$('#carousel-example-generic').on('slide.bs.carousel', function () {      
// 				// 슬라이드 인스턴스 메서드가 호출되면 호출된다.    
// 				});    $('#carousel-example-generic').on('slid.bs.carousel', function () {      
// 					// 회전식 슬라이드가 완료되면 호출된다.    
// 					});  
<!-- 			</script> -->
				
		
		
		
	</body>
</html>