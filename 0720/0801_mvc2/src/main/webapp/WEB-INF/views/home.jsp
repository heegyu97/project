<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>

<style type="text/css">


.btn-group {
	display: flex;
	
}

.find-btn1, .find-btn2, .find-btn3 {
	margin-right: 5%;
}
.find-btn1, .find-btn2, .find-btn3 , .find-btn4{
	background-color: #FF8863;
}

.card{
	width : 200px;
	height: 220px;
	padding-bottom: 20px;
	
}

.card-body{
	height : 100px;
	padding-bottom : 20px;
}
.card-title{
	overflow: hidden;
}
.card-text{
	background-color : blue;
	height : 40px;
	overflow: hidden;
	
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->

	<!-- MENU -->
	

	<!-- post로 값 보내기 / 리턴 값 of 목록 / 기본선택은 첫번째 -->
	<!-- 버튼 4개 : 사료 .. -->
	<!-- post로 값 보내기 / 값 리턴 -->
	<!-- 라디오 + 버튼 혼합 -->
   <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
   
      <input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="feed" autocomplete="off" ${btnradioValue eq "feed"?'checked="checked"':''}> 
      <label class="btn btn-outline-primary rounded-pill find-btn1" for="btnradio1">
         <img src = "${pageContext.request.contextPath}/resources/img/catsnack.png" style="width:60px; height:60px;" >
      </label> 
      <input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="snack" autocomplete="off" ${btnradioValue eq "snack"?'checked="checked"':''}>
      <label class="btn btn-outline-primary rounded-pill find-btn2" for="btnradio2">
         <img src = "${pageContext.request.contextPath}/resources/img/catfeed.png" style="width:60px; height:60px;" >
      </label>
      <input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="supplies" autocomplete="off" ${btnradioValue eq "supplies"?'checked="checked"':''}>
      <label class="btn btn-outline-primary rounded-pill find-btn3" for="btnradio3">
         <img src = "${pageContext.request.contextPath}/resources/img/catbag.png" style="width:60px; height:60px;" >
      </label> 
      <input type="radio" class="btn-check" name="btnradio" id="btnradio4" value="nutrients" autocomplete="off" ${btnradioValue eq "nutrients"?'checked="checked"':''}>
      <label class="btn btn-outline-primary rounded-pill find-btn4" for="btnradio4">
         <img src = "${pageContext.request.contextPath}/resources/img/catmed.png" style="width:60px; height:60px;" >
      </label>
   </div>


	<hr>
	<!-- post of 대분류 - 중분류 -->
    <c:choose>
    	<c:when test = "${btnradioValue eq 'feed'}">
    		<section class="servics">
            	<div class="icons">
            	<div class="child icon1">
                	<a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=feed&searchOption2=건식">
                    	<img src = "${pageContext.request.contextPath}/resources/img/i_dried.png" style="width:60px; height:60px;" >
                	</a>
               </div>
               <div class="child icon2">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=feed&searchOption2=습식">
                     <img src = "${pageContext.request.contextPath}/resources/img/i_canned.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=feed&searchOption2=캔">
                     <img src = "${pageContext.request.contextPath}/resources/img/i_pouched.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon4">
                  <a class="nav-link"
                     href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=feed&searchOption2="> 
                     <img src = "${pageContext.request.contextPath}/resources/img/i_etc.png" style="width:60px; height:60px;" >
                  </a>
            	</div>
         		</div>
        	</section>
   		</c:when>
    	<c:when test = "${btnradioValue eq 'snack'}">
    		<section class="servics">
            <div class="icons">
               <div class="child icon1">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=snack&searchOption2=스틱">
                     <img src = "${pageContext.request.contextPath}/resources/img/catsnack.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon2">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=snack&searchOption2=소시지">
                     <img src = "${pageContext.request.contextPath}/resources/img/catfeed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=snack&searchOption2=영양제">
                     <img src = "${pageContext.request.contextPath}/resources/img/catbag.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon4">
                  <a class="nav-link"
                     href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=snack&searchOption2="> 
                     <img src = "${pageContext.request.contextPath}/resources/img/catmed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
            </div>
         </section>
   		</c:when>
    	<c:when test = "${btnradioValue eq 'supplies'}">
    		<section class="servics">
            <div class="icons">
               <div class="child icon1">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store1&searchOption2=위생용품">
                     <img src = "${pageContext.request.contextPath}/resources/img/catsnack.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon2">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store1&searchOption2=식기용품">
                     <img src = "${pageContext.request.contextPath}/resources/img/catfeed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store1&searchOption2=가구">
                     <img src = "${pageContext.request.contextPath}/resources/img/catbag.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon4">
                  <a class="nav-link"
                     href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store1&searchOption2=모래"> 
                     <img src = "${pageContext.request.contextPath}/resources/img/catmed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
            </div>
         </section>

   		</c:when>
    	<c:when test = "${btnradioValue eq 'nutrients'}">
   			<section class="servics">
               <div class="icons">
               <div class="child icon1">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store2&searchOption2=장난감">
                     <img src = "${pageContext.request.contextPath}/resources/img/catsnack.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon2">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store2&searchOption2=미용용품">
                     <img src = "${pageContext.request.contextPath}/resources/img/catfeed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon3">
                  <a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store2&searchOption2=의료용품">
                     <img src = "${pageContext.request.contextPath}/resources/img/catbag.png" style="width:60px; height:60px;" >
                  </a>
               </div>
               <div class="child icon4">
                  <a class="nav-link"
                     href="${pageContext.request.contextPath}/guest/KategorieList?searchOption=store2&searchOption2=외출용품"> 
                     <img src = "${pageContext.request.contextPath}/resources/img/catmed.png" style="width:60px; height:60px;" >
                  </a>
               </div>
            </div>
         </section>
   		</c:when>

    </c:choose>
	<hr>
	<!-- top3 -->
	
	
	<!-- 인기순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">인기순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=recency&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "recency" items = "${recencylist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${recency.pro_no}';">
			<img src="${recency.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${recency.pro_name}</h5>
				<p class="card-text">회사명 : ${recency.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 1 끝-->
	<!-- 조회순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">조회순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=look&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "look" items = "${looklist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${look.pro_no}';">
			<img src="${look.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${look.pro_name}</h5>
				<p class="card-text">회사명 : ${look.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 2 끝-->
	<!-- 높은가격순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">높은가격순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=hprice&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "hprice" items = "${hpricelist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${hprice.pro_no}';">
			<img src="${hprice.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${hprice.pro_name}</h5>
				<p class="card-text">회사명 : ${hprice.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 3 끝-->
	<!-- 낮은가격순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">낮은가격순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=lprice&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "lprice" items = "${lpricelist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${lprice.pro_no}';">
			<img src="${lprice.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${lprice.pro_name}</h5>
				<p class="card-text">회사명 : ${lprice.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 4 끝-->
	<!-- 높은할인순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">높은할인순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=hdis&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "hdis" items = "${hdislist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${hdis.pro_no}';">
			<img src="${hdis.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${hdis.pro_name}</h5>
				<p class="card-text">회사명 : ${hdis.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 5 끝-->
	<!-- 낮은할인순 - tag -->
	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
		<ul class="clearfix" >
			<li class="float-left">
				<h3 style="color: white;">낮은할인순</h3>
			</li>
			<li class="float-right">
				<a href="${pageContext.request.contextPath}/guest/productList?searchOption3=ldis&searchWord=">
					<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- 카드 레이아웃  -->
	<div class="row mx-auto" style = "width : 600px;">
		<c:forEach var = "ldis" items = "${ldislist}" varStatus = "status">
		<div class=
			<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
		onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${ldis.pro_no}';">
			<img src="${ldis.pro_thum_path}" class="card-img-top" alt="이미지 오류" style = "height: 120px ">
			<div class="card-body">
				<h5 class="card-title">제품명 : ${ldis.pro_name}</h5>
				<p class="card-text">회사명 : ${ldis.m_h_name}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- top3 : 카드레이아웃 6 끝-->
	</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>

		<script type="text/javascript">
			$(document).ready(function() {
				$(".btn-check").click(function() {
					location.href="${pageContext.request.contextPath}/home?btnradio="+$(this).val();
				});
			});
		</script>		
</body>

</html>






