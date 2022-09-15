<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- w3c -->
		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
			td{
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
				position: relative; 
				top: 50px; 
				left: 50px;
			
			}
			#page{
				position: relative; 
				right: 50px;
				font-size: 20px;
				font-weight: bold;
				
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
			/*diplay를 사용하면 위치조정필요 , opacity를 사용하면 위치조정 필요없음,누를시 누른효과가 있음*/
			.move_img{
 				
/* 				color: rgba(255, 255, 255, .3);*/ /*투명색*/
/* 				background: rgba(0, 0, 0, 0.6);   *//*투명한어두운색*/
/* 				display:block; */
/*  				opacity:0;*//*버튼 안보이게하기*/  
				transition:0.5s all;/*나오는속도*/
 				display: none; /*버튼 안보이게하기*/

			}

			#chong:hover .move_img{
/*  				opacity:1;  */
 				display: block; /*버튼 보이게하기*/
 				margin-top: 200px; 
								
			}
			.span1{
				color: black;
				
			}
			
			/*작은이미지*/
			
			#back_img{
				width: 48px; 
				height: 45px;
			}
			
			/*그림자효과*/
			.small_img{
				box-shadow: 0 3px 6px rgba(0,0,0,0.2);
			}
			
			/*작은이미지 이벤트*/
			.small_img:hover {
/*   			  transform: scale( 2.0 )*/ /*확대 이벤트*/ 
			}
			
			/*삭제예정 회전이벤트*/
			body {
			  margin: 100px;
			}
			
			.container {
			  position: relative;
			  margin: 10px 0 20px 0;
			  perspective: 1000;
			}
			
			.card {
			  position: relative;
			  transform-style: preserve-3d;
			  transition: 0.5s;
			}
			
			.face {
			  position: absolute;
			  top: 0;
			  left: 0;
			  width: 100%;
			  height: 100%;
			  color: white;
			  line-height: 50px;
			  text-align: center;
			  backface-visibility: hidden;
			}
			
			.front {
			  background: red;
			}
			
			.back {
			  transform: rotateY(180deg);
			  background: green;
			/*   backface-visibility:hidden; */
			}
			
			.card:hover  {
			  -webkit-transform: rotateY(180deg);
			  -moz-transform: rotateY(180deg);
			  -ms-transform: rotateY(180deg);
			  -o-transform: rotateY(180deg);
			  transform: rotateY(180deg);
			}
			
			.container:hover .front {
			/*   z-index: 0; */
			}
			
			
		
			
			
			
			
		</style>
	</head>
	<body>
		
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<table class="mx-auto" >
			<thead>
				<tr>
					<td>TITLE</td>
					<td>
					<input type="text" id="space_title" name="space_title" class="form-control" readonly="readonly" value="${r_dto.r_title}">
					</td>
					<td>DATE</td>
					<td><input type="text" id="space_date" name="space_date" class="form-control" readonly="readonly" value="${r_dto.r_cdate}"></td>
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
												<c:choose><%-- page 확인  --%>
													<c:when test="${status2.index%6==0}">
														<label id = "page">
															<fmt:formatNumber value="${status2.index/6 + 1}" pattern="### page"/>
														</label>
													</c:when>
												</c:choose><!-- 리스트 이미지 위치 -->
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
													<!-- a태그 나중에 사용 -->
		 											<a href="${pageContext.request.contextPath}/cnts/detail?w_no=${dto.w_no}">
		 											
														<img class="small_img" id="back_img" src=
														<c:choose>
															<c:when test="${status2.index%6==0}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
															<c:when test="${status2.index%6==1}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
															<c:when test="${status2.index%6==2}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
															<c:when test="${status2.index%6==3}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
															<c:when test="${status2.index%6==4}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
															<c:when test="${status2.index%6==5}">"${pageContext.request.contextPath}/resources/img/${r_dto.r_list_img}"</c:when>
														
														</c:choose>
														></img>
														
													</a>
												</div>	
												
											</c:forEach>
										</div>
										<!-- 리스트 있을 때 -->
										<img id="back_img" src="${pageContext.request.contextPath}/resources/img/${r_dto.r_back_img}" style = "left:50px; top:50px; width:400px; height:400px; position: absolute; z-index:-6;"></img>
									</div>
									</c:forEach>
									<!-- class를 btn을 사용하면 bootstrap과 충돌이 일어남  -->
									<a class="move_img carousel-control-prev" href="#test" data-slide="prev">
										<span class='span1 far fa-caret-square-left' style='font-size:36px'></span>
									</a>
									<a class="move_img carousel-control-next" href="#test" data-slide="next">
										<span class='span1 far fa-caret-square-right' style='font-size:36px'></span>
									</a>
								</div>
								<!-- 리스트 없을 때 -->
								<img id="back_img1" src="${pageContext.request.contextPath}/resources/img/${r_dto.r_back_img}" style = "left:50px; top:50px; width:400px; height:400px; position: absolute; z-index:-6;"></img>
								
							</div>
						</div>
						
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 이미지 끝 -->
				
		<table  class="mx-auto mt-1">
			<tbody>
				<tr>
					<td colspan="3"><!-- 편지 글 개수 -->
						<h5><fmt:formatNumber pattern="###,###,### list"> ${totalcount}</fmt:formatNumber></h5>
					</td>
				</tr>
				<tr>
					<!-- 뒤로가기 버튼 -->
					<td>
						
							<a href="${pageContext.request.contextPath}/main/select">
								<button type="button" id="btn3" class="form-control float-left"> 뒤로가기 </button>
							</a>
					</td>
					<td>	
							<!-- 글작성, 주소복사 버튼 끝-->
							<c:choose>
								<c:when test="${r_dto.r_op1 == 'rolling'}"><%-- 롤링페이퍼 일 때 글 작성 버튼--%> 
									<button type="button"  class="form-control float-right"
											data-toggle="modal" data-target="#rolling_choice_modal"> 글 작 성 </button>
								</c:when>
								<c:otherwise><%-- 축하메시지 일 때 글 작성 버튼--%> 
									<c:if test="${r_dto.r_op1 == 'personal' && r_dto.m_no != login_info.m_no}">
										<button type="button" id="btn2" class="form-control float-right"> 글 작 성 </button>
									</c:if>
								</c:otherwise>
							</c:choose>
					</td>
					<td>	
						<!-- 글작성, 주소복사 버튼 시작-->
							<a href="#" onclick="clip(); return false;">
								<button type="button" id="btn1" class="form-control float-right">링크 복사하기</button>		
							</a>
					</td>
				</tr>
			</tbody>
		</table>
	
		<%@ include file="/WEB-INF/views/footer.jsp" %>	
			<%--========================================================================= --%>
		<!-- 롤링페이퍼 비번 modal -->
		<div class="modal" id="rolling_choice_modal">
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"> 비밀번호 체크 </h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<table class="table table-hover table-borderless">
							<tbody>
								<tr>
									<td colspan="5">
										<input type="text" id="space_pwd" name="space_pwd" class="form-control" 
									 placeholder = "비밀번호를 입력해 주세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력해 주세요.'">
									</td>
									<td>
										<button type="button" id="btn_check" class="form-control"> 확인 </button>
									</td>
									
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				var today = new Date();
				var c_date = new Date("${r_dto.r_cdate}");
				var roomM = "${r_dto.m_no}";
				var loginM = "${login_info.m_no}";
				var op1type = "${r_dto.r_op1}";
				
				$("#btn2").click(function() {//축하메시지 버튼

					if(today >= c_date){//만료일 글 작성 방지
						alert("만료일이 지나 글작성이 불가합니다.");
						return;
					}else{
						
							alert("글작성이 가능합니다.");
							location.href="${pageContext.request.contextPath}/cnts/write_form?r_no=${r_dto.r_no}";
						
					}
				});
				
				$("#btn_check").click(function() {//롤링페이퍼 비번 modal 버튼 기능
					
					if(today >= c_date){//만료일 글 작성 방지
						alert("만료일이 지나 글작성이 불가합니다.");
						return;
					}else{
						if($("#space_pwd").val()=="${r_dto.r_op3}"){
							alert("통과");
							location.href="${pageContext.request.contextPath}/cnts/write_form?r_no=${r_dto.r_no}";
						} else {
							alert("비밀번호를 확인해주세요");
						}
					}
		
				});//click
			});//ready
		</script>
		<script type="text/javascript">
		function clip(){//현주소 링크 복사
			
			var url = ''; //url변수 생성
			var textarea = document.createElement("textarea");//변수 textarea에 textarea의 요소를 생성
			document.body.appendChild(textarea);//</body> 바로 위에 textarea를 추가
			url = window.document.location.href; //현 주소값 넣기
			textarea.value = url;//textarea 값에 url를 넣기
			textarea.select();
			document.execCommand("copy");//document.execCommand("copy"); 메서드를 사용하면 복사됨
			document.body.removeChild(textarea);//textarea 요소제거
			alert(url+"\nURL이 복사되었습니다.");
			;
		}
		</script>
		<script type="text/javascript">
			//리스트가 없을 때 이미지 효과 
			var count = "${totalcount}";
			if(count > 0 ){
				$("#back_img1").hide();
			}else {
				$("#back_img1").show();
			}

		</script>
	</body>
</html>