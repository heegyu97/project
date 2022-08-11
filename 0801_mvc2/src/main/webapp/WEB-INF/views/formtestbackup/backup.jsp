<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>

<style type="text/css">

/* share all style */
<%@ include  file ="/WEB-INF/views/style_share.jsp" %>

/* guest [ header footer ] style  */ 
<%@ include  file ="/WEB-INF/views/style_hf.jsp" %> 

.btn-group {
	display: flex;
}

.find-btn1, .find-btn2, .find-btn3 {
	margin-right: 5%;
}


</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->
		<!-- menu line start -->
		
		<!-- menu line end -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

		<script type="text/javascript">
			$(document).ready(function() {
				var btnradios = document.getElementsByName('btnradio');
				var value;
				$(".btn-check").click(function() {
					alert($(this).val());
				})
			});
		</script>
</body>

</html>






