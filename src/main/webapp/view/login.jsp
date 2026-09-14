<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.AuthDao" %>
<%@ page import="model.AuthBean" %>

<%
	// 요청 데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	String error = null;
	if ("POST".equalsIgnoreCase(request.getMethod())){
		// 로그인 정보 받기
		String id = request.getParameter("user-id");
		String password = request.getParameter("user-pw");
		
		// 입력값 검증
		if (id == null || id .trim().isEmpty()
		        || password == null || password.trim().isEmpty()) {
		    error = "아이디와 비밀번호를 모두 입력해주세요.";
		} else {
			// Model 호출
			AuthDao authDao = new AuthDao();
			// 로그인 확인
			AuthBean authBean= authDao.login(id, password);
			
			if (authBean!= null) {
			    // 세션 고정 공격 방지
			    try {
			        request.changeSessionId();
			    } catch (Throwable e) {
			        e.printStackTrace();
			    }
			    session.setAttribute("loginUser", authBean);
			
			    // 로그인 성공 → 프로필 페이지
			    response.sendRedirect(
			            request.getContextPath() + "/view/profile.jsp"
			    );
			    return;
			} else {
			    // 로그인 실패
			   error = "아이디 또는 비밀번호가 올바르지 않습니다.";
			}
		}
	}
	if (error != null) {
		request.setAttribute("error", error);
	}
%>

<%@ include file="header.jsp" %>

<!-- main -->
<main class="login">

    <h2 class="main-title">로그인</h2>

    <p class="main-desc">
        아이디와 비밀번호를 입력하고 로그인하세요
    </p>

    <!-- 로그인 실패 시 에러 메시지 -->
    <p style="color:red;">${error}</p>

    <form class="main-form"
          method="post"
          action="${pageContext.request.contextPath}/view/login.jsp">

        <section class="flex-input">
            <label for="user-id" class="user-id">
                아이디
            </label>
            <input
                id="user-id"
                class="user-id"
                name="user-id"
                type="text"
                required
            />
        </section>
        
        <section class="flex-input">
            <label for="user-pw" class="user-pw">
                비밀번호
            </label>

            <input
                id="user-pw"
                class="user-pw"
                name="user-pw"
                type="password"
                required
            />
        </section>

        <section class="btn-section">
            <button
                id="login-btn"
                class="login-btn"
                type="submit">
                로그인
            </button>
        </section>
    </form>
</main>

<%@ include file="footer.jsp" %>