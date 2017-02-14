<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script language="javascript">
	
		function Category(value) {
			this.value = value;
			this.length = 0;
		}

		function addCategory(category, value) {
			category[category.length] = new Category(value);
			category.length++;
		}

		var category = new Category();
	
		addCategory(category, "서울");
	
		addCategory(category[0], "강남구");
		addCategory(category[0], "강북구");
		addCategory(category[0], "강동구");
		addCategory(category[0], "강성구");
		addCategory(category[0][0], "4");
		addCategory(category[0][0], "5");
		addCategory(category[0][0], "7");
		addCategory(category[0][0], "6");
		addCategory(category[0][0], "8");
		
		addCategory(category, "인천/경기");
		addCategory(category[1], "고양");
		addCategory(category[1], "과천");
		addCategory(category[1], "광명");
		addCategory(category[1], "구리");
		addCategory(category[1][0], "pusher cleaner and knife");
		addCategory(category[1][0], "trimmer");
		addCategory(category[1][0], "nail clipper");
		addCategory(category[1][0], "nail nipper");
		addCategory(category[1][0], "emery boards");
		addCategory(category[1][0], "buffer");
		addCategory(category[1][0], "ear pick");
		addCategory(category[1][0], "multi useful kits");
		addCategory(category[1], "artificial nail");
		
		addCategory(category, "대전/세종/춘천/강원");
		addCategory(category[2], "강릉");
		addCategory(category[2], "계릉");
		addCategory(category[2], "공주");
		addCategory(category[2], "논산");
		addCategory(category[2][0], "sponge");
	
		addCategory(category[2][1], "emery");
		addCategory(category[2][1], "metalic");
		addCategory(category[2][1], "laser");
		addCategory(category[2][1], "ceramic");
		
		addCategory(category, "광주/전라");
		addCategory(category[3], "광주");
		addCategory(category[3], "군산");
		addCategory(category[3], "목포");
		addCategory(category[3], "무안");
		addCategory(category[3], "순천");
		addCategory(category[3], "여수");
		
		addCategory(category, "부산");
		addCategory(category[4], "남구");
		addCategory(category[4], "동래");
		addCategory(category[4][1], "set");
		addCategory(category[4][1], "facial");
		addCategory(category[4][1], "lip");
		addCategory(category[4][1], "eyeshadow applicator");
		
		addCategory(category, "대구/경상/제주");
		addCategory(category[5], "거제");
		addCategory(category[5], "경상");
		addCategory(category[5][1], "hair pin");
		addCategory(category[5][1], "scrunchy");
		addCategory(category[5][1], "head band");
		

		function initForm(form) {
			form.subject.length = category.length;
			for (i = 0; i < category.length; i++)
				form.subject[i].text = category[i].value;
			form.subject.selectedIndex = 0;
			form.contents.selectedIndex = 0;
			change_subject(form);
		}

		function change_subject(form) {
			alert(form)
			var i = form.subject.selectedIndex;
			form.contents.length = category[i].length;
			for (j = 0; j < form.contents.length; j++)
				form.contents[j].text = category[i][j].value;
			form.contents.selectedIndex = 0;
		
		/* 	change_contents(form);
			 */
		}
 
		function change_contents(form) {
			
			var i = form.subject.selectedIndex
			var j = form.contents.selectedIndex;
			
			form.components.length = category[i][j].length;
			for (k = 0; k < form.components.length; k++)
				form.components[k].text = category[i][j][k].value;
			form.components.selectedIndex = 0;
			 $("#f").submit(); 
			
		}
	
	</script>
</head>


	


	<body onLoad="initForm(document.form)">



		< h1>3단 동적 셀렉트 박스 예제< /h1>

		<form id="f" name="form" method="post" action="<c:url value='/aa.lib' />">
			<select name="subject" onchange="change_subject(this.form)"></select>
			<!-- <select name="contents" onchange="change_contents(this.form)"></select> -->
				<select name="contents" onchange="change_contents(this.form)"></select>
		
		
		
			<select name="components"></select>
		</form>



	</body>

</html>