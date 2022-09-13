<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>임명편지</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<style type="text/css">
			body{/* 화면배경 */
				background-image: url(${pageContext.request.contextPath}/resources/img/leave.jpg); 
 				background-size: cover; 
				background-repeat: no-repeat;
				background-attachment: fixed;
			}
			.card{ /* 카드 외형 */
				width: 566px;
				border: 3px solid  #8a2be2;
				background: linear-gradient(-135deg, blue, pink);
			}
			.card-title{
				 text-transform: capitalize;
				 font-size: 2.6rem;
				 text-shadow: -1px -1px 1px #aaa,
				             0px 4px 1px rgba(0,0,0,0.5),
				             4px 4px 5px rgba(0,0,0,0.7),
				             0px 0px 7px rgba(0,0,0,0.4);
			}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<div class="card mr-1 mt-2  mx-auto ">
			<c:choose>
				<c:when test="${dto.w_link == '1'}">
				 	<img width="560" height="315" src="${pageContext.request.contextPath}/resources/img/gg.jpg">
				</c:when>
				<c:when test="${dto.w_link == '2'}">
					<img width="560" height="315" src="${pageContext.request.contextPath}/resources/img/leave.jpg">
				</c:when>
				<c:otherwise> <!-- 유튜브 영상 -->
					<iframe width="560" height="315" src="${dto.w_link}?autoplay=1" 
						title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen>
					</iframe>
					
				</c:otherwise>
			</c:choose>
			
			<div id="c_b" class="card-body">
				<h5 class="card-title">${dto.w_title}</h5>
				<h6 class="card-text">${dto.w_cnt}</h6>
			</div>
			<div class="card-footer"> 
				
				<a href="javascript:history.back(-1)" 
					class="card-link btn btn-warning float-left">이전</a>
				<c:if test="${dto.m_no == login_info.m_no}">
					<button type="button" id="delete_btn" class="btn btn-danger float-right"> 삭제 </button>
				</c:if>	
				
			</div>
		</div>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {
			$.get(
				"${pageContext.request.contextPath}/cnts/delete"
				, {	w_no : ${dto.w_no}	}
				, function(data, status) {
					if( data >= 1 ){
						alert("상품이 삭제 되었습니다.");
						location.href="${pageContext.request.contextPath}/cnts/testlist";
					} else if( data <= 0 ) {
						alert("상품 삭제를 실패 하였습니다.");
					} else {
						alert("잠시 후 다시 시도해 주세요.");
					}
				}
			);//get
		});//click
	});//ready
	</script>
	</body>
</html>