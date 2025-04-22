<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혁신적인 밀키트 생산관리, HHMES</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/icon.png" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css" />

<tiles:insertAttribute name="head" ignore="true" />
</head>
<body class="index"
	data-contextPath="${pageContext.request.contextPath}">

	<div class="popup" id="popup">
		<tiles:insertAttribute name="popup" />
	</div>

	<div class="chatbot">
		<tiles:insertAttribute name="chatbot" />
	</div>

	<div class="menu">
		<tiles:insertAttribute name="menu" />
	</div>

	<div class="mainframe-container">
		<div class="topbar">
			<tiles:insertAttribute name="topbar" />
		</div>
		<div class="localnav">
			<tiles:insertAttribute name="localnav" />
		</div>

		<div class="mainframe">
			<tiles:insertAttribute name="body" />
		</div>

		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>
</body>
</html>
