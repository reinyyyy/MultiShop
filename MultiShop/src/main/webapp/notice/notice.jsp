<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "../css/categoryItemList.css" rel = "stylesheet">
</head>
<body>
   <div id="jb-container">
      <!-- 상단 히스토리 바 -->
      <div id="jb-header">
         <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb">
               <!-- 사용자 클릭히스토리로 동적 처리필요 -->
               <li class="breadcrumb-item"><a href="../main/index.do">HOME</a></li>
               <li class="breadcrumb-item"><a onclick="goPage('${cateNum}')" href = "javascript:void(0)">${pageName }</a></li>
            </ol>
         </nav>
      </div>
      <div class="container" style="margin: 20px auto;">
         <div class="row">
            <table class="table">
               <colgroup>
                  <col width="20%;" />
                  <col width="*;" />
                  <col width="20%;" />
               </colgroup>
               <thead class="thead-dark">
                  <tr>
                     <th scope="col" class="text-center">번호</th>
                     <th scope="col" class="text-center">글제목</th>
                     <th scope="col" class="text-center">작성일</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="text-center">1</td>
                     <td>
                        <a href="#">Otto</a>
                     </td>
                     <td class="text-center">2018-11-23</td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div align="center">
            <button type="button" class="btn btn-secondary" onclick="alert();">1</button>
            <button type="button" class="btn btn-secondary">2</button>
            <button type="button" class="btn btn-secondary">3</button>
            <button type="button" class="btn btn-secondary">다음</button>
         </div>
      </div>
   </div>
</body>
</html>