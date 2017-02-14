<%@page import="model.Place.PlaceDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.Place.PlaceDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!doctype html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/Team/common/layout.css" type="text/css">
<link rel="shortcut icon" href="http://www.ybmnet.co.kr/favicon.ico">
<script type="text/javascript">
</script>
</head>
<body>
<div id="wrap"> 
  <!-- header -->

<section>
  <header id="header">
    <nav>
      <h1><a href="#"><img src="/Team/images/bono.png" alt="보노보노"></a><a href="/center_2014/myMain.asp" class="logo_my"><img src="" alt=""></a></h1>
      <!-- 비로그인 -->

	  <!-- 로그인 -->
      <ul class="u_menu">
        <li class="id"><a href="admin.jsp">관리자 페이지</a></li>

      </ul>
      <!-- //로그인 --> 
	  <!-- 레이어 -->
      <div class="id_ly" style="display:none">
        <ul>
          <li><a href="javascript:openWin('https://certify.ybmsisa.com/newJoin/my_info_chkID.asp', 'myinfoWin','scrollbars=yes,width=1024,height=768')">내정보</a></li>
          <li><a href="javascript:goToLogout();">로그아웃</a></li>
        </ul>
      </div>
      <!-- //레이어 --> 

<script type="text/javascript" src="/center_2014/js/jquery-1.8.1.js"></script>
<form name="frm" method="POST" target="_parent">
<input type="hidden" name="what" value="www.ybmsisa.com">
<input type="hidden" name="url" value="/center_2014/myMain.asp">
</form>
<script language="javascript">


</script> 
    </nav>
  </header>
</section>
<!-- //header -->  
  <!-- container -->
  <section id="container"> 
   <!-- menu -->
    <aside class="l_menu">
      <nav>
        <dl>
          <dt>시험 정보</dt>
          <dd><a href="<%=request.getContextPath() %>/PlaceMain.do" >- 시험장</a></dd>
          <dd><a href="" >- 시험일</a></dd>
        </dl>
        <dl class="last">
          <dt>회원정보 관리</dt>
          <dd><a href="" >- 회원</a></dd>
		  
          <dd><a href="" >- 회원탈퇴</a></dd>
          <dd><a href="" >- </a></dd>
        </dl>
        <dl class="last">
          <dt>시험 취소</dt>
          <dd><a href="" >- 시험 취소</a></dd>
          <dd><a href="" >- </a></dd>
          <dd><a href="" >- </a></dd>
        </dl>
        
        
      </nav>
    </aside>
    <!-- //menu --> 
     <!-- contents -->
    <section class="contents"> 
      <!-- 시험 접수 내역 -->
      <div class="my_test_list">
        <h3> <strong>뿌려줄곳</strong></h3>
        
      </div>
      <!-- //시험 접수 내역 --> 
      
      <!-- 온라인 강의 수강 -->
      <div class="benefit">
       			
       			
      </div>
      
      <br/>
      
      <div class="benefit">
       			
       			
      </div>
      
      </br>
      
      <div class="benefit">
       			
      </div>
      
      
      <div class="my_test_list mt35">
        		
        		
      </div>
      <!-- //온라인 강의 수강 -->
      
      
      
      
    </section>
    <!-- //contents --> 
  </section>
  <!-- container --> 
  <form NAME="frmCertifyResult" method="post">
	<input type="hidden" name="Ukey" value="">
	<input type="hidden" name="Uname" value="">
  </form>
  <!-- foot -->
<footer id="footer">
  <div class="footer_in">
   <style type="text/css">
/*회원간소화 푸터 추가 */
.footer_txt{font-size:13px; text-align:center}
.footer_txt{padding:0; text-align:center; color:#666 }
.footer_txt a{display:inline-block; padding:0 15px}
.footer_txt a strong,.footer_txt a span{color:#666}
.footer_txt a img{vertical-align:middle}
</style>
<!-- 푸터 공통 -->
<p class="footer_txt"><a href=""><span><img src="" alt="">11111</span></a>
<a href="#" onclick=""><span>11111</span></a>
<a href="#" onclick="" ><strong>1111111</strong></a>
</p>
<!-- 푸터 공통 //-->


</footer>
<!-- //foot --> 
 
</div>
</body>
</html>
