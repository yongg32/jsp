<%@page import="jdbc.UserVO"%>
<%@page import="jdbc.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<%
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
	}else{
		// 사용자 정보 없을때 
		// redirect client에게 다시 해당 페이지로 요청하게 지시 
		response.sendRedirect("login.jsp");
	}
	UserService service = UserService.getInstance();
	UserVO vo = service.userInfo(userId);
	pageContext.setAttribute("user", vo);
%>
<body>
   <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<div class="container-fluid">
      <div class="row align-items-center" style="height:700px">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
          <form action="mypageAction.jsp" method="post">
            <h3	style="text-align: center; padding-bottom: 5%; padding-top: 15%;">
            마이페이지</h3>
            <div class="form-group">
              <input type="text" class="form-control" maxlength="20" disabled value="${user.userId}">
              <input type="hidden" name="userId" value="<%=vo.getUserId() %>">
            </div>
            <div class="form-group pt-1">
              <input type="password" class="form-control" maxlength="20" disabled value="<%=vo.getUserPw() %>">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" maxlength="20" name="userNm" value="<%=vo.getUserNm()%>">
            </div>
            <input type="submit" class="btn btn-dark form-control" value="수정하기">
          </form>
        </div>
        <div class="col-lg-4"></div>
      </div>
    </div>
   <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>