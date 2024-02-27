<%@page import="jdbc.UserService"%>
<%@page import="jdbc.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPw(request.getParameter("userPw"));
		System.out.println(vo);
		UserService service = UserService.getInstance();
		int cnt = service.insertUser(vo);
		System.out.println(cnt);
	%>
	<%
		out.println("<script>");
		if(cnt > 0 ){
			out.println("alert(' "+vo.getUserId() + "님 환명!');");
			out.println("location.href='main.jsp';");
		}else{
			out.println("alert('동일 아이디가 존재합니다.!')");
			out.println("history.back();");	
		}
		out.println("</script>");
		%>
</body>
</html>