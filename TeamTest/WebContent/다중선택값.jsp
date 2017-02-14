<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script>



</script>
</head>

<body>


	<form name="idsu_net" method="post" action="<c:url value='/linkRequestStd.jsp' />">
		<SELECT NAME="idsu[]" size="5" multiple="multiple">
			<option value="PHP">PHP</option>
			<option value="Mysql">Mysql</option>
			<option value="idsu.net">idsu.net</option>
			<option value="www.idsu.net">www.idsu.net</option>
			<option value="asp">asp</option>
			<option value="jsp">jsp</option>
		</SELECT> <input type="submit" value="보내기">
	</form>
</body>
</html>