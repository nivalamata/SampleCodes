<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  	<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
  </div>
</body>
</html>