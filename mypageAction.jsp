<%@page import="jdbc.UserService"%>
<%@page import="jdbc.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%	
	UserVO vo = new UserVO();
	vo.setUserId(request.getParameter("userId"));
	vo.setUserNm(request.getParameter("userNm"));
	UserService service = UserService.getInstance();
	int cnt = service.updateUser(vo);
	out.println("<script>");
	out.println("alert('수정되었습니다.');");
	out.println("location.href='mypage.jsp';");
	out.println("</script>");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
