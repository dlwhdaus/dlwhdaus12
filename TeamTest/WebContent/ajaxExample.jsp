<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<%
	String snum = request.getParameter("num");
	String result = "";

	JSONObject jsonobj = new JSONObject();

	if (snum == null) {
		snum = "0";
	} else {
		int num = Integer.parseInt(snum);

		if (num % 2 == 0) {
			result = "\"짝수\"";
		} else {
			result = "\"홀수\"";
		}

		PrintWriter pw = response.getWriter();
		/* jsonobj.put("num", result);
		String json = jsonobj.toJSONString(); */
		String json = "{\"num\" :" + num + ",\"msg\" :" + result + "}";
		out.print(json);
		return;// 태그 자체가 jspService()에 들어가서 사용되기 때문에 return을 하게 되면 함수 실행을 중단한다
// 이후 작성된 로직들은 실행되지 않는다. 즉, json문자열만 보내진다.
		// out.close();
	}
%>
// JSP 스크립트릿 태그에서 request, response를 사용할 수 있는 이유는 JSP파일을 실행하기 되면 
톰켓은 JSP파일을 자바로 변환한다 그 과정에서 스크립트릿 태그 안에 있는 로직들은 jspService()함수에 추가되여 사용된다
jspService()함수는 request, reponse를 파라미터로 받기 때문에 스크립트릿태그에서도 사용할 수 있다

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script type="text/javascript" src="../js/jquery-2.2.2.min.js"></script> -->

<!-- <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.0.min.js"></script> -->

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script> 


<script type="text/javascript">
	 $(function() {
		$("select").on("change", function() {
			location.href = "?num=" + $(this).val();
			//document.numForm.submit();
		});
	}); 
	function myFunction() {
		var num = $("select").val();
		location.href = "?num=" + num;
	}

	function ajaxGo() {
		jQuery.ajax({
			type : "GET",
			/* url : "linkRequestStd.jsp", */
			data : {
				num : $("select[name=num]").val()
			},
			datatype : "JSON",
			success : function(obj) {
				var data = JSON.parse(obj);
				console.log(data);
				$("div #num").text(data.num);
				$("div #msg").text(data.msg);
			},
			complete : function(data) {// 응답이 종료되면 실행, 잘 사용하지않는다
				console.log(data);
			},
			error : function(xhr, status, error) {
				alert("ERROR!!!");
			}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- <a href="?num=3">3</a> -->
	<form name="numForm">
		<select name="num" onchange="ajaxGo()">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
		</select>
	</form>
	<div>
		숫자 <span id="num"></span> -> <span id="msg"></span>
	</div>
</body>
</html>
