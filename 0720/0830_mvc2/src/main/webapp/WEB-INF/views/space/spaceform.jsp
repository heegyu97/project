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
 				margin-top: 3%; 
/* 				background-position: center top; */
		}
		.hover_img {
			transition: all ease 1s;
		
		}
		
		.hover_img:hover {
			transform: rotateX( 180deg );
		}
		.write_label{
			font-size: 0.7em;
			color: red;
		}
		
		</style>
		
		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
<!-- 		<div class="hover_img"> -->
<%-- 			<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/img2.jpg'></img> --%>
<!-- 		</div> -->
	
	
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
					<td colspan="4">
						<input type="text" id="space_title" name="space_title" class="form-control">
						<label id="title_label" for="space_title" class="write_label" ></label>
					</td>
					<td colspan="2">DATE</td>
					<td colspan="4">
						<input type="date" id="space_date" name="space_date" class="form-control">
						<label id="date_label" for="space_date" class="write_label" ></label>
					</td>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td colspan="6" >
						<button style ="width: 250px;height: 100px;margin-top: 20px;" value = "personal"  id="op1" class = "btn2select form-control">축하메세지</button>
					</td>
					<td colspan="6">
						<button style ="width: 250px;height: 100px;margin-top: 20px;" value = "rolling" id="op2" class = "btn2select form-control">롤링페이퍼</button>
					</td>
				</tr>
				<!-- check image -->
				<tr style = "height: 270px">
					<td colspan="12" class = "option1" >
						<div id="img_op" >
						</div>
					</td>
				</tr>
				
				<!-- Option 1  -->
				<tr class = "option1" ><!-- 개꺼 -->
					<td colspan="6">
						<select class="form-control" id="r_op2" name="r_op2" >
								
						</select>
						<label id="option_label" for="r_op2" class="write_label" ></label>
						
					</td>
					<td colspan="6">
						<button type="button" id="op_btn"class="form-control"> 생 성 </button>
					</td>
				</tr>
				
				
				
				<!-- Option 2  -->
				<tr id = "option2" ><!-- 롤꺼 -->
					<td colspan="6">
						<input type="text" id="space_pwd" name="space_pwd" class="form-control"
								 placeholder = "비밀번호를 등록해 주세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 등록해 주세요.'">
								 
						<label id="pwd_label" for="space_pwd" class="write_label" ></label>
					</td>
					<td colspan="6">
						<button type="button" id="pwd_btn"class="form-control" > 입 력 </button>
					</td>
				</tr>
				
			</tbody>
		</table>
		</div>
		
		
	<%@ include file="/WEB-INF/views/footer.jsp"%>
		
		
		
		
		<script type="text/javascript">
		$(document).ready(function() {

			$(".option1").hide();
			$("#option2").hide();
			
			
			$("#op1").click(function() {
				$(".option1").show();
				$("#option2").hide();
				$("#img_op").empty();
				
				$.get(
						"${pageContext.request.contextPath}/space/option"
						, {r_op1 : $("#op1").val() }
						, function(data, status) {
							$("#r_op2").empty();
							$("#r_op2").append("<option value=''>선택해주세요.</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#r_op2").append("<option value=" + dto.r_op2 + ">" + dto.r_op2 +"</option>" );
							});
						}
				);//get
				var op2 = "";
				$("#r_op2").change(function() {
					op2 = $.trim($("#r_op2").val() );
					//alert(op2);
					$("#img_op").empty();
					if( op2 == "축하"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/img2.jpg'></img>");
						return;
					}else if( op2 =="명절"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/img1.jpg'></img>");
						return;
					}else if( op2 =="기념일"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/img3.jpg'></img>");
						return;
					} else{
						return;
					}
				});//change
				
				$("#op_btn").click(function() {
					
					
					
					//타이틀,날짜 입력체크
					if($.trim($("#space_title").val()) =="" ){
						$("#title_label").text("title을 입력해주세요");
						return;
					} else {$("#title_label").text("");}

					if($.trim($("#space_date").val()) ==""){
						$("#date_label").text("날짜를 선택해주세요");
						return;
					} else {$("#date_label").text("");}

					//날짜 체크
					var endDate = new Date($( "input[name='space_date']" ).val());
					var today = new Date();
					//alert(today.getTime());
					//alert(endDate.getTime());
					
					if( today.getTime() > endDate.getTime() ) {
						$("#date_label").text("날짜를 확인해 주세요.");
				        return;
				    }
					
					if( op2 == ""){
						$("#option_label").text("옵션을 선택해주세요.");
						return;
					} else {$("#option_label").text("");}
					
					
					$.post(
							"${pageContext.request.contextPath}/space/spaceinsert"
							, {
								r_title : $("#space_title").val() 
								, r_cdate : $("#space_date").val()
								, r_op1 :  $("#op1").val()
								, r_op2 :  $("#r_op2").val()
								
							}
							, function( data, status) {
								if(data >= 1){
									alert("등록완료");
									location.href="${pageContext.request.contextPath}/main/select";
									$("#space_title").val("");
									$("#space_date").val("");
									return;
								} else {
									alert("등록실패");
									return;
								}
							}
					);//get
					
				});//click// 그냥방만들기
				
				
			});//click //type personal click
				
			$("#op2").click(function() {
				$("#option2").show();
				$("#space_pwd").val("");
				$(".option1").hide();
				
				
				
				
				
				
				
				$("#pwd_btn").click(function() {
					

					//타이틀,날짜 입력체크
					if($.trim($("#space_title").val()) =="" ){
						$("#title_label").text("title을 입력해주세요");
						return;
					} else {$("#title_label").text("");}

					if($.trim($("#space_date").val()) ==""){
						$("#date_label").text("날짜를 선택해주세요");
						return;
					} else {$("#date_label").text("");}
					
					//날짜 체크
					var endDate = new Date($( "input[name='space_date']" ).val());
					var today = new Date();
					//alert(today.getTime());
					//alert(endDate.getTime());
					
					if( today.getTime() > endDate.getTime() ) {
						$("#date_label").text("날짜를 확인해 주세요.");
				        return;
				    }
					
					
					if($.trim($("#space_pwd").val()) =="" ){
						$("#pwd_label").text("비밀번호를 입력해 주세요.");
						return;
					} else {$("#pwd_label").text("");}
					
					
					//여기서부터해야함
					$.post(
							"${pageContext.request.contextPath}/space/spaceinsert"
							, {
								r_title : $("#space_title").val() 
								, r_cdate : $("#space_date").val()
								, r_op1 :  $("#op1").val()
								, r_op3 :  $("#space_pwd").val()
								
							}
							, function( data, status) {
								if(data >= 1){
									alert("등록완료");
									location.href="${pageContext.request.contextPath}/main/select";
									$("#space_title").val("");
									$("#space_date").val("");
									return;
								} else {
									alert("등록실패");
									return;
								}
							}
					);//get
					
					
					
				});//click
				
				
				
			});//click // rolling click
		});//ready
		</script>
	</body>
</html>