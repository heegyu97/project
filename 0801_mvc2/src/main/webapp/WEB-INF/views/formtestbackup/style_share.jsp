<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

.servics{
   width: 100%;
   text-align: center;
}
.icons{
	display: flex;
	justify-content: center;
}
.child{
	text-align: center;
}

main{
	width : 600px;
}
.nav{
		display : inline-block;
		width : 600px;
		height : 50px;
		z-index: 2;
		background-color: B1997D;
		position: fixed;
		
}
main{
	width : 600px;
}

body{
	background-image: url('${pageContext.request.contextPath}/resources/img/bg.jpeg');
	background-repeat: no-repeat;
 	background-position: center;
	background-size: cover;
}


#adver-frame {width : 100%;height : 100%}
	@media only screen and (max-width : 1400px ){
	#aaa{
		display: none;
	}
				
}	


#ccc{
	display : inline-block;
  	height: 100vh;
  	background-color : E8E0D6;
}

::-webkit-scrollbar {
	display: none;
}


#bbb,#ccc {
	
  	padding: 0px;
  	margin: 0px;
 	overflow: auto;
	width: 600px;
	min-width: 600px;
}
#bbb {
	list-style-type: none;
  	height: 100%;
 	position: fixed;
}