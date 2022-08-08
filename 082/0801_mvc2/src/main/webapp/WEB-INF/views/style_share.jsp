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

.nav{
		display : inline-block;
		width : 600px;
		height : 50px;
		position: fixed;
		z-index: 2;
		background-color: B1997D;
}



body{
	background-image: url('${pageContext.request.contextPath}/resources/img/bg.jpeg');
}


#adver-frame {width : 100%;height : 100%}
	@media only screen and (max-width : 1200px ){
	#aaa{
		display: none;
	}
				
}	





#ccc{
  	height: 100vh;
}

::-webkit-scrollbar {
	display: none;
}


#bbb,#ccc {
  	padding: 0px;
  	margin: 0px;
  	width: 600px;
 	overflow: auto;
}
#bbb {
	list-style-type: none;
  	height: 100%;
 	position: fixed;
}