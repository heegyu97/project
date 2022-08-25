<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>eventdetail_sus</title>
	<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div style = "text-align: center; align-content: center;">
		<h3>이벤트</h3>
		<c:if test = "${login_info.m_type == 'manager'}">
		<a href="${pageContext.request.contextPath}/event/event_uform?evnt_no=${evnt.evnt_no}">
			<button id="up_btn" name = "up_btn" type="button" class="btn btn-primary " style = "width : 570px; margin-bottom: 12px" >이벤트 수정</button>
		</a>
			<button id="del_btn" name = "del_btn" type="button" class="btn btn-danger " style = "width : 570px; margin-bottom: 12px" >이벤트 삭제</button>
		</c:if>
		<img src="${pageContext.request.contextPath}/resources/img/d_eventsus.JPG" style="width:370px; margin-top : 10px;">
			
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#del_btn").click(function() {
					var result = confirm("정말로 삭제하실건가요?");
					if(result){
					    $.get(
					    		
					    		"${pageContext.request.contextPath}/event/delete"
								,{
									evnt_no : ${param.evnt_no}
								}
								, function(data, status) {
									if( data >= 1 ){
										alert("게시글이 삭제 되었습니다.");
										location.href="${pageContext.request.contextPath}/event";
									} else if( data <= 0 ) {
										alert("게시글 삭제를 실패 하였습니다.");
									} else {
										alert("잠시 후 다시 시도해 주세요.");
									}
									
								}//call back function
						);//get
					}else{
					    alert("삭제를 취소헀습니다.");
					}
				}); //click
			});//ready
		</script>
</body>

</html>



								