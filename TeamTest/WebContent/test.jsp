<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>


	<!-- 고사장 리스트 -->
	<table style="margin-top: 25px">


<script>
   
</script>

<script>

function GoPage(value) {
	
	/* if ( area2init ) document.goForm.area2.value = ""; */
	if(value == 'a'){
		alert("에이선택~");
		$("#select1").attr({style:"display:"});
		$("#select2").attr({style:"display:none"});
		alert("성공");
	}
	else if(value == 'b'){
		alert("비선택");
		$("#select2").attr({style:"display:"});
		
		alert("성공");
	}
	
	
/* 	document.goForm.submit(); */
}
</script>
		<!-- 고사장 리스트 -->
		<table style="margin-top: 25px">
			<tr>
				<td style="font-size: 14px; color: #595959; letter-spacing: -1px"><span
					style="color: #196fc6"><strong>&lt;제328회 2017.03.26
							TOEIC 정기접수&gt;</strong></span><strong> 현재 접수중인 고사장 리스트 보기</strong></td>
			</tr>
			<tr>
				<td style="color: #a3a3a3">해당 회차에 개설되지 않은 고사장은 아래의 리스트에 노출되지
					않습니다.</td>
			</tr>
			<form name="goForm" method="post" action="<c:url value="/aaaa/NewFile1.lib" />">
				<tr>
					<td style="padding: 5px 0 8px 0" align="right">
					
					<select name="area1" class="select_m" onChange="GoPage(this.value)">
							<option value='a' ${fn:indexOf(param.area1,"a")!= -1 ? 'selected="selected"': "" }>서울</option>
							<option value='b' ${fn:indexOf(param.area1,"b")!= -1 ? 'selected="selected"': "" }>인천/경기</option>
							<option value='c' ${fn:indexOf(param.area1,"c")!= -1 ? 'selected="selected"': "" }>대전/세종/충청/강원</option>
							<option value='d' ${fn:indexOf(param.area1,"d")!= -1 ? 'selected="selected"': "" }>광주/전라</option>
							<option value='e' ${fn:indexOf(param.area1,"e")!= -1 ? 'selected="selected"': "" }>부산</option>
							<option value='f' ${fn:indexOf(param.area1,"f")!= -1 ? 'selected="selected"': "" }>대구/경상/제주</option>
					</select> 
					
					<select name="area2" class="select_m" onChange="GoPage()" id="select1" >
							<option value='q' ${fn:indexOf(param.area2,"q")!= -1 ? 'selected="selected"': "" }>고양</option>
							<option value='w' ${fn:indexOf(param.area2,"w")!= -1 ? 'selected="selected"': "" }>광명</option>
							<option value='e' ${fn:indexOf(param.area2,"e")!= -1 ? 'selected="selected"': "" }>구리</option>
						
					</select>
					
					<select name="area2" class="select_m" onChange="GoPage()" style="display: none"  id="select2">
							<option value='q' ${fn:indexOf(param.area2,"q")!= -1 ? 'selected="selected"': "" }>제발</option>
							<option value='w' ${fn:indexOf(param.area2,"e")!= -1 ? 'selected="selected"': "" }>되게</option>
							<option value='e' ${fn:indexOf(param.area2,"r")!= -1 ? 'selected="selected"': "" }>해줘</option>
						
					</select>
					
					</td>
				</tr>
			</form>
</body>
</html>