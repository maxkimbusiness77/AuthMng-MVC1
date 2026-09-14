<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 세션이 존재하면 세션 종료
	if (session != null) {
	    session.invalidate();
	}
	
	// 로그인 페이지로 이동
	response.sendRedirect(
	        request.getContextPath() + "/view/login.jsp"
	);
%>