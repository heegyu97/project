<!doctype html>
<html lang="ko">
	<head>
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	<body>
		<script type="text/javascript">
			var naver_id_login = new naver_id_login("QvRj8WrRD8KDfZX6YYiy", "http://localhost:8081/ictedu/login/callback");
			// 네이버 사용자 프로필 조회
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			function naverSignInCallback() {
				//alert(naver_id_login.getProfileData('email'));
				location.href = "${pageContext.request.contextPath}/login/login_check?m_email="+naver_id_login.getProfileData('email');
				window.close();  
	 		 }
		</script>
	</body>
</html>