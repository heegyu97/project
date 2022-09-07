<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		table{
				margin-top: 10%;
		}
		
		</style>
		
		
	</head>
	<body>
		<div style="width: 600px " class="mx-auto">
		<table class="table table-borderless">
			<thead>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">TITLE</td>
					<td colspan="4"><input type="text" id="space_title" name="space_title" class="form-control"></td>
					<td colspan="2">DATE</td>
					<td colspan="4"><input type="date" id="space_date" name="space_date" class="form-control"></td>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td colspan="6" >
						<button style ="width: 250px;height: 100px;margin-top: 100px; margin-bottom: 100px" value = "personal"  id="op1" class = "btn2select">축하메세지</button>
					</td>
					<td colspan="6">
						<button style ="width: 250px;height: 100px;margin-top: 100px; margin-bottom: 100px" value = "rolling" id="op2" class = "btn2select">롤링페이퍼</button>
					</td>
				</tr>
				<!-- Option 1  -->
				<tr id = "option1" ><!-- 개꺼 -->
					<td colspan="4">
						<button id="b_btn" style ="width: 100px;height: 70px;margin-top: 50px;margin-bottom: 100px" value="1" >p축하</button>
					</td>				
					<td colspan="4">
						<button id="m_btn" style ="width: 100px;height: 70px;margin-top: 50px;margin-bottom: 100px" value="2">명절</button>
					</td>				
					<td colspan="4">
						<button id="d_btn" style ="width: 100px;height: 70px;margin-top: 50px;margin-bottom: 100px" value="3">기념일</button>
					</td>		
				</tr>
				<tr id = "option2" ><!-- 롤꺼 -->
					<td colspan="8">
						<input type="text" id="space_pwd" name="space_pwd" class="form-control"
								style ="margin-top: 50px;margin-bottom: 100px">
					</td>
					<td colspan="8">
						<button type="submit" id="pwd_btn"class="form-control" style ="margin-top: 50px;margin-bottom: 100px"> 생 성 </button>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		
		
		
		
		
		<script type="text/javascript">
		$(document).ready(function() {

			$("#option1").hide();
			$("#option2").hide();
			
			
			$("#op1").click(function() {
				$("#option1").show();
				$("#option2").hide();
				
				$("#m_btn").click(function() {
					
					$.get(
							"${pageContext.request.contextPath}/space/spaceinsert"
							, {
								r_title : $("#space_title").val() 
								, r_cdate : $("#space_date").val()
								, r_op1 :  $("#op1").val()
								, r_op2 :  $("#m_btn").val()
								
							}
							, function( data, status) {
								if(data >= 1){
									alert("등록완료");
									location.href="${pageContext.request.contextPath}/space/spacelist";
									return;
								} else {
									alert("등록실패");
									return;
								}
							}
					);//get
					
				});//click-m_btn //명절
				
				
				$("#b_btn").click(function() {
					alert($("#space_title").val());
					alert($("#space_date").val());
					$.get(
							"${pageContext.request.contextPath}/space/spaceinsert"
							, {
								r_title : $("#space_title").val() 
								, r_cdate : $("#space_date").val()
								, r_op1 : $("#op1").val()
								, r_op2 :  $("#b_btn").val()
								
							}
							, function( data, status) {
								if(data >= 1){
									alert("등록완료");
									location.href="${pageContext.request.contextPath}/space/spacelist";
									return;
								} else {
									alert("등록실패");
									return;
								}
							}
					);//get
					
				});//click-b_btn //생일
				
				
				$("#d_btn").click(function() {
					
					$.get(
							"${pageContext.request.contextPath}/space/spaceinsert"
							, {
								r_title : $("#space_title").val() 
								, r_cdate : $("#space_date").val()
								, r_op1 : $("#op1").val()
								, r_op2 :  $("#d_btn").val()
								
							}
							, function(data, status) {
								if(data >= 1){
									alert("등록완료");
									location.href="${pageContext.request.contextPath}/space/spacelist";
									return;
								} else {
									alert("등록실패");
									return;
								}
							}
					);//get
					
				});//click-d_btn //기념일
				
			});//click //type personal click
				
			$("#op2").click(function() {
				$("#option2").show();
				$("#option1").hide();
			});//click // rolling click
		});//ready
		</script>
	</body>
</html>