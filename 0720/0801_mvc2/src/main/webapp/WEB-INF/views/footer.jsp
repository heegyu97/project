<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<h3 style="margin-top: 120px"></h3>
</main>
<div class="nav" style="bottom: -1px;">
	<!-- MENU -->
	<section class="servics">
		<div class="icons">
			<c:choose>
				<c:when test="${login_info.m_type eq 'manager'}">
					<div class="child icon4">
						<!-- 경로만 변경 - 판매자 home/main -->
						<a class="nav-link" href="${pageContext.request.contextPath}/manager/managerMain">
							<img src = "${pageContext.request.contextPath}/resources/img/i_cart.png" style="width:50px; height:50px;" >
						</a>
					</div>
				</c:when>
					
				<c:when test="${login_info.m_type eq 'seller' }">
					<div class="child icon4">
						<!-- 경로만 변경 - 판매자 home/main -->
						<a class="nav-link" href="${pageContext.request.contextPath}/seller/sellerMain">
							<img src = "${pageContext.request.contextPath}/resources/img/i_cart.png" style="width:50px; height:50px;" >
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="child icon1">
							<a class="nav-link" href="${pageContext.request.contextPath}/home">
								<img src = "${pageContext.request.contextPath}/resources/img/i_home.png" style="width:50px; height:50px;" >
							</a>
						</div>
						<div class="child icon2">
							<a class="nav-link" href="${pageContext.request.contextPath}/guest/KategorieList">
								<img src = "${pageContext.request.contextPath}/resources/img/i_list.png" style="width:50px; height:50px;" >
							</a>
						</div>
						<div class="child icon3">
							<a class="nav-link" href="${pageContext.request.contextPath}/guest/productList">
								<img src = "${pageContext.request.contextPath}/resources/img/i_search.png" style="width:50px; height:50px;" >
							</a>
						</div>
						<div class="child icon4">
						<c:choose>
							<c:when test="${login_info.m_type eq 'guest'}">
							<a class="nav-link" href="${pageContext.request.contextPath}/basket/basketlist">
							</c:when>
							<c:otherwise>
							<a class="nav-link" href="${pageContext.request.contextPath}/home">
							</c:otherwise>
						</c:choose>
								<img src = "${pageContext.request.contextPath}/resources/img/i_cart.png" style="width:50px; height:50px;" >
							</a>
						</div>
				</c:otherwise>
			</c:choose>	
		</div>
	</section>

</div>
</div>
<!-- col6 -->
</div>
<!-- row  -->
</div>
<!-- contain  -->