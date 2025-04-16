<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><tiles:insertAttribute name="title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
</head>
<body class="index">

    <div class="header">
        <tiles:insertAttribute name="header" />
    </div>

    <div class="menu">
        <tiles:insertAttribute name="menu" />
    </div>

    <div class="mainframe-container">
        <div class="header">
            <div class="topbar">
                <tiles:insertAttribute name="topbar" />
            </div>
            <div class="localnav">
                <tiles:insertAttribute name="localnav" />
            </div>
        </div>

        <div class="mainframe">
            <tiles:insertAttribute name="body" />
        </div>

        <div class="footer">
            <tiles:insertAttribute name="footer" />
        </div>

        <div class="popup" id="popup">
            <tiles:insertAttribute name="popup" />
        </div>

        <div class="chatbot">
            <tiles:insertAttribute name="chatbot" />
        </div>
    </div>
</body>
</html>
