<%@page import="model.Place.PlaceDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.Place.PlaceDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
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
					<h1>
						<a href="#"><img src="/Team/images/bono.png" alt="보노보노"></a><a
							href="/center_2014/myMain.asp" class="logo_my"><img src=""
							alt=""></a>
					</h1>
					<!-- 비로그인 -->

					<!-- 로그인 -->
					<ul class="u_menu">
						<li class="id"><a href="admin.jsp">관리자 페이지</a></li>

					</ul>
					<!-- //로그인 -->
					<!-- 레이어 -->
					<div class="id_ly" style="display: none">
						<ul>
							<li><a
								href="javascript:openWin('https://certify.ybmsisa.com/newJoin/my_info_chkID.asp', 'myinfoWin','scrollbars=yes,width=1024,height=768')">내정보</a></li>
							<li><a href="javascript:goToLogout();">로그아웃</a></li>
						</ul>
					</div>
					<!-- //레이어 -->

					<script type="text/javascript"
						src="/center_2014/js/jquery-1.8.1.js"></script>
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
						<dd>
							<a href="<%=request.getContextPath() %>/PlaceMain.do">- 시험장</a>
							<a href="<%=request.getContextPath() %>/PlaceMain.do">*고사장정보</a>
							<a href="<%=request.getContextPath() %>/TestInformation/Post.do">*지역정보</a>
							<a href="<%=request.getContextPath() %>/TestInformation/District.do">*구역정보</a>
							
						</dd>
						<dd>
							<a href="">- 시험일</a>
						</dd>
					</dl>
					<dl class="last">
						<dt>회원정보 관리</dt>
						<dd>
							<a href="">- 회원</a>
						</dd>

						<dd>
							<a href="">- 회원탈퇴</a>
						</dd>
						<dd>
							<a href="">- </a>
						</dd>
					</dl>
					<dl class="last">
						<dt>시험 취소</dt>
						<dd>
							<a href="">- 시험 취소</a>
						</dd>
						<dd>
							<a href="">- </a>
						</dd>
						<dd>
							<a href="">- </a>
						</dd>
					</dl>
				</nav>
			</aside>
			<!-- //menu -->
			<!-- contents -->
			<section class="contents">
				<!-- 시험 접수 내역 -->
				<div class="my_test_list">
					<h3>
						<strong>고사장정보</strong>
					</h3>
					
				</div>
				<!-- //시험 접수 내역 -->
				<!-- 온라인 강의 수강 -->
				<div class="benefit">
					
					<div>
						<fieldset>
							<legend>지역코드 보기</legend>
							<!-- 	서울 : 1 , 경기 : 2 , 부산 : 3 , 대전 : 4 , 광주 : 5 <br/>
								전라 : 6 , 강원 : 7 , 인천 : 8 , 대구 : 9 , 세종 : 10 <br/>
								경상/울산 : 11 ,	      충청 : 12, 제주 : 13 -->
							
								<ul>		
									<c:forEach items="${postList}" var="post" varStatus="loop">
										<li>${post.postCode}.${post.postName }</li>	
									
									</c:forEach>
								</ul>	
								
								
														
						</fieldset>
					</div>
						<h2>고사장 등록하기</h2>
						<form action="<c:url value='/Place/Registration.do'/>" method="post">
							지역코드:<input type="text" name="postCode" style="width: 50px" maxlength="2">
						        구:<input type="text" name="district" style="width: 50px">
						        장소:<input type="text" name="mihi" style="width: 50px">
						        주소:<input type="text" name="addr" style="width: 150px">
						  	위도:<input type="text" name="latitude" style="width: 100px">
						        경도:<input type="text" name="longitude" style="width: 100px">
							  	<input type="submit" value="등록">
						</form>
				</div>
				<br/>
				<div>
					<h3>키값으로 수정</h3>
						<form action="<c:url value='/Place/Edit.do'/>" method="post">
							번호(키값):<input type="text" name="key" style="width: 50px" maxlength="2" id="key">
							지역코드:<input type="text" name="postCode" style="width: 50px" maxlength="2" id="ep">
						        구:<input type="text" name="district" style="width: 50px" id="ed">
						        장소:<input type="text" name="mihi" style="width: 50px" id="emh">
						        주소:<input type="text" name="addr" style="width: 150px" id="ea">
						  	위도:<input type="text" name="latitude" style="width: 100px" id="ela">
						        경도:<input type="text" name="longitude" style="width: 100px" id="elo">
							  	<input type="submit" value="키값으로 수정">
						</form>
				</div>
				<br />
				<div class="benefit">
					<form action="<c:url value='/Place/Delete.do'/>" method="post">
						<input type="text" name="delete" style="width: 50px" id="keydelete">
						<input type="submit" value="키값으로로 삭제" >
					</form>
				</div>
				</br>
				<script>
					$(function() {
						$("table tr:gt(0)").toggle(function(){
							$(this).attr({style:"background-color:red"});
						},function(){
							$(this).attr({style:"background-color:white"});
						});
						
				        $("#select").change(function(){
				        	$("#form").submit();
				        });
				 	
				        $("table tr td").click(function(){
				        	if($(this).index()==1){
					        	$("#key").val($(this).text());
					        	$("#keydelete").val($(this).text());
				        	}	
				        });
				        
					});//////	
				</script>
			
				
				<div>
					<form action="<c:url value='/Place/List.do'/>">
						<select name="searchColumn">
							<option value="mihi">'고사장명' 으로 찾기</option>
							<option value="postName">'지역명' 으로 찾기</option>
							<option value="district">'구' 로 찾기</option>
						</select>			
						 <input type="text" name="searchWord"/>		
						 <input type="submit" value="확인"/>
					</form>
				</div>
				
				<div>
				<%--  	
					<form action="<c:url value='/Place/List.do' />">
						<input type="text" name="mihi"> 
						<input type="submit" value="고사장명으로 찾기">
						<input type="hidden" name="distinct" value="1">
					</form>
					
					<form action="<c:url value='/Place/List.do' />">
						<input type="text" name="post"> 
						<input type="submit" value="지역으로 찾기">
						<input type="hidden" name="distinct" value="2">
					</form>
				 --%>
				</div>
				
			
				
				<div>
					<h2>페이지 (${map.nowPage }/${map.totalPage})</h2>
					
				 	<form action="<c:url value='/Place/List.do' />" id="form"> 
					
						
						<select name="postcode" id="select">
							  <option>고사장 선택하기</option>	
							 
							  <c:forEach items="${postList}" var="post" varStatus="loop">
							  	<option value="${loop.count }">${post.postName }고사장 정보보기</option>
							  </c:forEach>
							  
						
	                   </select>
	                   
	                   
	                   
	            			<input type="hidden" name="distinct" value="3">
	                </form> 
	              
	            
	              
	                   
				</div>

					<table width="100%" bgcolor="gray" cellspacing="1" >
						<tr bgcolor="white" align="center">

							<th width="10%">번호</th>
							<th width="10%" style="background-color: yellow">키값</th>
							<th width="45%">지역</th>
							<th width="15%">구</th>
							<th width="10%">장소</th>
							<th width="10%">주소</th>
						</tr>



						<!-- 	
	                          <tr bgcolor="white" align="center">
	                           <td colspan="5">등록된 글이 없어요</td>
	                          </tr>
                      	 -->
						<!-- 아래 반복 -->
				
							<c:forEach items="${lists }" var="item" varStatus="loop">
								<tr bgcolor="white" align="center" id="toggle">
									
									
									<td>${map.totalRecordCount - (((map.nowPage - 1) * map.pageSize) + loop.index) }</td>
									<td id="td" style="background-color: yellow; cursor: pointer">${item.no }</td>
									<td>${item.postName }</td>
									<td>${item.district }</td>
									<td>${item.mihi }</td>
									<td>${item.addr }</td>
									
								</tr>
							</c:forEach>		
				
				
					</table>

				</div>
			
				



			</section>
			<!-- //contents -->
		</section>
		<!-- container -->
		<form NAME="frmCertifyResult" method="post">
			<input type="hidden" name="Ukey" value=""> <input
				type="hidden" name="Uname" value="">
		</form>
		<!-- foot -->
		<footer id="footer">
			<div class="footer_in">
				<style type="text/css">
/*회원간소화 푸터 추가 */
.footer_txt {
	font-size: 13px;
	text-align: center
}

.footer_txt {
	padding: 0;
	text-align: center;
	color: #666
}

.footer_txt a {
	display: inline-block;
	padding: 0 15px
}

.footer_txt a strong, .footer_txt a span {
	color: #666
}

.footer_txt a img {
	vertical-align: middle
}
</style>
				<!-- 푸터 공통 -->
				<p class="footer_txt">
					<span><img src="" alt="">페이징:${pagingString }</span>
					 
				</p>
				
				
				<!-- 푸터 공통 //-->
		</footer>
		<!-- //foot -->

	</div>
</body>
</html>
