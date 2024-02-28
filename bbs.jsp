<%@page import="jdbc.BbsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<%
   UserService service = UserService.getInstance();
   ArrayList<BbsVO> arr = service.bbsList();
   System.out.println(arr);
   pageContext.setAttribute("arr", arr);
   
%>
</head>
<body>
   <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
   <script>
      $(document).ready(function(){
         //list.js이용한 페이징처리 
         let options = { valueNames : ["nm", "title", "readCount", "updateDt"]
                        ,page:10
                        ,pagination : true
         };
         let userList = new List("bbs", options);
      });
   </script>
   <!-- content 영역 -->
   <main class="container-fluid p-3">
      <div class="row d-flex align-items-center"  style="height: 600px;">
         <div class="col-lg-1"></div>
         <div class="col-lg-10" id="bbs">
            <h3 style="text-align:center">게시판</h3>
            <div class="input-group">
               <input type="text" placeholder="search.." class="search form-control">
               <button class="sort btn input-group-text" data-sort="nm">종목명</button>
            </div> 
            <table class="table table-striped" style="text-align:center;" >
               <thead>
                  <tr>
                     <th style="background-color: #eeeeee; text-align:center">종목명</th>
                     <th style="background-color: #eeeeee; text-align:center">제목</th>
                     <th style="background-color: #eeeeee; text-align:center">조회수</th>
                     <th style="background-color: #eeeeee; text-align:center">수정일</th>
                  </tr>
               </thead>
               <tbody class="list">
                  <c:forEach var="item" items="${arr}">
                     <tr>
                        <td class="nm" >${item.nm}</td>
                        <td class="title">${item.title }</td>
                        <td class="readCount">${item.readCount }</td>
                        <td class="updateDt">${item.updateDt }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <div class="d-flex justify-content-center">
               <ul class="pagination"></ul>
            </div>
         </div>
         <div class="col-lg-1">
         </div>
      </div>
   </main>
    <!-- content 영역 끝 -->
   <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>