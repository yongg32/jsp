<%@page import="jdbc.UserService"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.UserVO" %>
<%-- <% request.setCharacterEncoding("UTF-8"); %> --%>
<!-- 요청되어진 name과 useBean의 class가 변수명이 매핑되면 사용가능 -->
<jsp:useBean id="user" class="jdbc.UserVO" scope="page"></jsp:useBean>
<jsp:setProperty property="userId" name="user" />
<jsp:setProperty property="userPw" name="user" />
<%
     PrintWriter script = response.getWriter();
   //값출력 테스트
    script.println(user.getUserId());
   UserService service = UserService.getInstance();
   UserVO vo = service.loginUser(user.getUserId(), user.getUserPw());
   script.println("<script>");
   if(vo != null){
      // 세션 등록
      session.setAttribute("userId", vo.getUserId());
      session.setMaxInactiveInterval(5*60); // 5분
      script.println("alert(' "+ vo.getUserNm() +" 님 환영!');");
      script.println("location.href='main.jsp';");
   }else{
      script.println("alert('아이디/비번을 확인하세요');");
      script.println("history.back();");
   }
   script.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
</body>
</html>