<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="ordSearch" class="page-body">
    <h2>1:1문의관리</h2>
    <div class="pc-switch">
        <div class="sect-hd">
            <h3>1:1문의관리</h3>
        </div><!-- .sect-hd -->
        <div class="sect-cont">
            <div id="inquiry_list" class="tbl-list tbl-extend tbl-horz mt-20">
            	<jsp:include page="../manage/inquiry_table.jsp"></jsp:include>
            </div>
            <div class="paging" id="pagination">
            </div><!-- .paging -->
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
</div>
