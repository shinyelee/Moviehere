<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>메일 확인 요청</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	// 로그인 여부 확인
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정회원만 접근 가능한 게시판 입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 이메일 확인 요청 문구 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="alert alert-danger mt-4" role="alert">
				메일 인증 후 정회원으로 자동 등업됩니다. 아직 인증 메일을 받지 못하셨나요?
				<a href="emailSendAction.jsp" class="btn btn-danger">재요청</a>
			</div>
		</div>
	</div>	
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>