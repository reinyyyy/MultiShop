<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko"><!--<![endif]--><head>
    <meta charset="utf-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="../css/admin.css">
    <!-- <link rel="shortcut icon" href="/mysoho_icon.png" type="image/x-icon"> -->
    <link rel="stylesheet" href="../css/calendar.css">
    <!-- <link rel="icon" href="/mysoho_icon.png" type="image/x-icon"> -->
    <link rel="stylesheet" href="../css/admin.css">
    <!-- 달력 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <!-- 데이터테이블 -->
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    	
    <!--jQuery-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 달력 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <!--common-->
    <script src = "../js/manage/product.js"></script>
    <script src="../js/manage/member.js"></script>
    <!-- <script src="../js/manage/calendar.js"></script> -->
    <script>
	$(document).ready(function(){
		
		$('#snb').on('click','li',function(){
			$('#snb li').removeClass('now');
			$('#snb li ul').css('display','none');
			$(this).addClass('now');
			$('#snb .now ul').css('display','block');
		});

	});
	</script>
</head>
<style type="text/css">
#snb:hover {
	color : #00affe;
}
</style>
<body style="">

<div id="aside" tabindex="1" style="overflow: hidden; outline: none;">
    <div class="menu-wrapper">
        <div class="hd ani">
            <div class="hd-profile">
                <div class="inner">
                    <div class="info">
                        <p class="photo">
                        	<a href="../manage/main.do"><i class="fas fa-cog fa-5x"></i></a>
                        </p>
                    </div>
                </div>
            </div>
        </div><!-- // .hd .ani -->
        <ul id="snb">
        	<li>
                <a href="#"  id="productInsertBtn">상품추가</a>
            </li>
        	<li>
                <a href="../manage/productManagePage.do"  id="productManageBtn">상품관리</a>
            </li>
        	<li>
                <a href="../manage/productQnaPage.do"  id="productQnABtn">상품문의</a>
            </li>
        	<li>
                <a href="../manage/memberManagePage.do"  id="memberManageBtn">고객관리</a>
            </li>
        	<li>
                <a href="../manage/orderManagePage.do"  id="orderManageBtn">주문관리</a>
            </li>
        	<li>
                <a href="../manage/inquiryPage.do"  id="inquiryManageBtn">1:1문의관리</a>
            </li>
        	<li>
                <a href="../manage/noticePage.do"  id="noticeManageBtn">공지관리</a>
            </li>
        	<li>
                <a href="../main/index.do"  id="noticeManageBtn">나가기</a>
            </li>
        </ul>
    </div><!-- .menu-wrapper -->
</div>

<div id="container" class="">
    <div class="page-hd">
        <h1><a href="../manage/main.do">관리자 페이지</a></h1>
    </div><!-- .page-hd -->
<style type="text/css">
.period-4x .btn-toggle {
    width:20%;
}
.hide {display:none;}
.tbl-list.tbl-extend table {min-width:1400px;}
</style>
	<jsp:include page="${display }"/>
</div>
</body>
</html>
