<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	    <!-- content 영역 -->
		<div class="container-fluid">
      <div class="row align-items-center" style="height:700px">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
          <form action="joinAction.jsp" method="post" class="needs-validation" novalidate>
            <h3	style="text-align: center; padding-bottom: 5%; padding-top: 15%;">회원가입 화면</h3>
            <div class="form-group">
              <input required type="text" class="form-control" placeholder="아이디" 	name="userId" maxlength="20">
              <div class="invalid-feedbock">아이디는 필수! </div>
            </div>
            <div class="form-group pt-1" style="padding-bottom: 5%;">
              <input required type="password" class="form-control" placeholder="비밀번호" name="userPw" maxlength="20">
              <div class="invalid-feedbock">패스워드는 필수! </div>
            </div>
            <input type="submit" class="btn btn-primary form-control" value="회원가입">
          </form>
        </div>
        <div class="col-lg-4">
        </div>
      </div>
    </div>
    <script>
    	$(document).ready(function(){
    			  const forms = document.querySelectorAll('.needs-validation')

    			  // Loop over them and prevent submission
    			  Array.from(forms).forEach(form => {
    			    form.addEventListener('submit', event => {
    			      if (!form.checkValidity()) {
    			        event.preventDefault()
    			        event.stopPropagation()
    			      }

    			      form.classList.add('was-validated')
    			    }, false)
    	}
    </script>
    <!-- content 영역 끝 -->

	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
</html>