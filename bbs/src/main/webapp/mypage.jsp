<%@page import="jdbc.UserVO"%>
<%@page import="jdbc.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String userId = null;
if (session.getAttribute("userId") != null) {
	userId = (String) session.getAttribute("userId");
	// 사용자 정보 없을떄
} else {
	response.sendRedirect("index.jsp");
}
UserService service = UserService.getInstance();
UserVO vo = service.userInfo(userId);
pageContext.setAttribute("vo", vo);
%>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- content 영역 -->
	<div class="container-fluid">
		<div class="row align-items-center" style="height: 600px">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<form action="#" method="post">
					<h3
						style="text-align: center; padding-bottom: 5%; padding-top: 15%;">마이페이지
						화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							maxlength="20" value=<%=vo.getUserId()%> disabled> <input
							type="hidden" name="userId" value=<%=vo.getUserId()%>>
					</div>
					<div class="form-group pt-1">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPw" maxlength="20" value="<%=vo.getUserPw()%>" disabled>
					</div>
					<div class="form-group pt-1">
						<input type="text" class="form-control"
							placeholder="이름" name="userNm" maxlength="20"
							required value="<%=vo.getUserNm()%>">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="수정하기">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<!-- content 영역 끝 -->
</body>
</html>