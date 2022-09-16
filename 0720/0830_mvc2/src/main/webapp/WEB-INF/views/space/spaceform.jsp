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
					<td colspan="12">
						<input type="radio" id="op1_p" name="op1" value="personal" class="op-check" hidden="hidden">
						<label for="op1_p" style="border:1px solid;  font-weight: bolder; ">
							축하메세지
						</label>
						<input type="radio" id="op1_r" name="op1" value="rolling" class="op-check" hidden="hidden">
						<label for="op1_r" style="border:1px solid; font-weight: bolder; ">
							롤링페이퍼
						</label>
					</td>
				</tr>
				
				<!-- Option 1  -->
				<!-- check image -->
				<tr style = "height: 270px">
					<td colspan="12" class = "option1" ><!-- 개꺼 -->
						<div id="img_op" >
						</div>
					</td>
					<td colspan="12" class = "option2" ><!-- 롤꺼 -->
						<img style = "height: 250px; margin : auto;" src="${pageContext.request.contextPath}/resources/img/rollingpaper.jpg"></img>
					
					</td>
				</tr>
				
				<tr class = "option1" ><!-- 개꺼 -->
					<td colspan="12">
						<select class="form-control" id="r_op2" name="r_op2" >
								
						</select>
						<label id="option_label" for="r_op2" class="write_label" ></label>
						
					</td>
					
				</tr>
				<!-- Option 2  -->
				<tr class = "option2" ><!-- 롤꺼 -->
					<td colspan="12">
						<input type="text" id="space_pwd" name="space_pwd" class="form-control"
								 placeholder = "비밀번호를 등록해 주세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 등록해 주세요.'">
								 
						<label id="pwd_label" for="space_pwd" class="write_label" ></label>
					</td>
				</tr>
				
				<tr><!-- insert button -->
					<td colspan="12">
						<button type="button" id="pwd_btn"class="btn btn-light form-control" > 생 성 </button>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
		$(document).ready(function() {
			let optype ="";
			$(".option1").hide();
			$(".option2").hide();
			
			$(".op-check").click(function() {
				optype = $(this).val();				
				if(optype == "personal"){
					$(".option1").show();
					$(".option2").hide();
					$("#img_op").empty();
				} else if(optype == "rolling"){
					$(".option2").show();
					$("#space_pwd").val("");
					$(".option1").hide();
				}//if
				$.get(//옵션2 select 
						"${pageContext.request.contextPath}/space/option"
						, {r_op1 :  $(this).val() }
						, function(data, status) {
							$("#r_op2").empty();
							$("#r_op2").append("<option value=''>선택해주세요.</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#r_op2").append("<option value=" + dto.r_op2 + ">" + dto.r_op2 +"</option>" );
							});
						}
				);//get
				
				var op2 = "";
				$("#r_op2").change(function() {//옵션2 변경시 이미지 변경
					op2 = $.trim($("#r_op2").val() );
					//alert(op2);
					$("#img_op").empty();
					if( op2 == "축하"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/congrat.jpg'></img>");
						return;
					}else if( op2 =="명절"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/holiday.jpg'></img>");
						return;
					}else if( op2 =="기념일"){
						$("#img_op").append("<img style = 'height: 250px; margin : auto' src='${pageContext.request.contextPath}/resources/img/eventbg.jpg'></img>");
						return;
					} else{
						return;
					}
				});//change
			});//click
			
			var back_img = "";
				var list_img = "";
			
			$("#pwd_btn").click(function() {
				//타입별 이미지
				
				if( optype == "personal" ){//축하메세지
					
					if($("#r_op2").val() == "축하"){//축하
						back_img = "congrat.jpg";
						list_img = "img1";
					} else if($("#r_op2").val() == "명절") {//명절
						back_img = "holiday.jpg";
						list_img = "img2";
					} else if($("#r_op2").val() == "기념일") {//기념일
						back_img = "eventbg.jpg";
						list_img = "img3";
					}
				}
				else if(optype == "rolling" ){//롤링페이퍼
					
					if($("#space_pwd").val() != ""){
						back_img = "rollingpaper.jpg";
						list_img = "img4";
					}
						
				}
				//alert(optype);
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
				
				$.post(
						"${pageContext.request.contextPath}/space/spaceinsert"
						, {
							r_title : $("#space_title").val() 
							, r_cdate : $("#space_date").val()
							, r_op1 :  optype
							, r_op2 :  $("#r_op2").val()
							, r_op3 :  $("#space_pwd").val()
							, r_back_img : back_img
							, r_list_img : list_img
							
						}
						, function( data, status) {
							if(data >= 1){
								alert("등록완료");

// 								$("#space_title").val("");
// 								$("#space_date").val("");
								location.href="${pageContext.request.contextPath}/main/select";
								return;
							} else {
								alert("등록실패");
								return;
							}
						}
				);//post
	
			});//click
		});//ready
		</script>

	</body>
</html>