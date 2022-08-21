<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		table{
			margin-left: auto;
			margin-right: auto;
			table-layout: fixed;
		}
		div.pname{
			width: 300px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
		a{
			text-decoration : none;
			color: black;
			font-size: 25px;
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	
	<hr>
		
<!-- 		<table class="table table-bordered"> -->
		<table class="table table-borderless">
			<col class="w-25">
			
			<thead>
				<tr >
					<th colspan="2" class="text-center">
						<h3>${detail.tip_title}</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h5>작성자 : ${login_info.m_id}</h5></td>
				</tr>
				<tr>
					<td>
						${detail.tip_date}
					</td>
					<td>
						<h5 class="float-right">조회수 : ${detail.tip_view_cnt}</h5>
					</td>
				</tr>
			</tbody>
		</table>
		
		<hr>
		
		<table>
			<tbody>
				<tr>
					<td><!-- 여기 안됨!!경로를 못찾음 -->
						<img src= "${detail.tip_prdt_path}" alt="no search img" width="395" height="200">
					</td>
				</tr>
				<tr>
					<td>
					
						<textarea rows="10" cols="50" readonly="readonly" >
							${detail.tip_ctnts}
						</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<%-- 버튼 --%>
		
			<button id="btn_delete"class="btn btn-danger mr-2">글삭제</button>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tipupdateform?tip_no=${detail.tip_no}">
				<button class="btn btn-success mr-2">글수정</button>
			</a>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tip">
				<button type="button" class="btn btn-secondary mr-2">이전</button>
			</a>
		
		

		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#btn_delete").click(function() {
				
				
				$.get(
						"${pageContext.request.contextPath}/tip/tipdelete"
						, { 
							tip_no : ${detail.tip_no}  
						}
						, function(data, status) {
							if(data>=1){
								alert("게시글을 삭제하였습니다.");
								location.href="${pageContext.request.contextPath}/tip/tip";
							} else if( data<=0){
								alert("게시글 삭제를 실패하였습니다.");
								
							} else{
								alert("잠시 후 다시 시도해 주세요.");
								
							}
						}//call back function
				
				);//get
				
				
				
			});//click
		})//ready

		</script>
	</body>
</html>