<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maximize Your Potential</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/index.css">
</head>

<body>

    <!-- header -->
    <header class="layout-header">
        <h1>
            <a href="${pageContext.request.contextPath}/view/login.jsp">
                Maximize Your Potential
            </a>
        </h1>
        <div>
            <a href="${pageContext.request.contextPath}/view/profile.jsp">
                프로필
            </a>
            <a href="${pageContext.request.contextPath}/view/login.jsp">
                로그인
            </a>
            <a href="${pageContext.request.contextPath}/view/logout.jsp">
                <button type="button">로그아웃</button>
            </a>
        </div>
    </header>