<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
	
<title>Upload file</title>
</head>
<body>
<g:hasErrors bean="${file}">
 <div class="validationerror">
 <g:renderErrors bean="${file}" as="list"/>
 </div>
</g:hasErrors>
	<div class="myform">
<dl>
<g:form action="upload" method="post" enctype="multipart/form-data" 
class="inputform">
 <fieldset>
 
 <div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'attachment', 'error')} required">
	<label for="attachment">
		<g:message code="task.attachment.label" default="Attachment" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="attachment" name="attachment" />
</div>


</fieldset>
 <g:submitButton name="upload" value="upload"/> 
 <g:link controller="task" action="createTask">Cancel</g:link>
</g:form>
</dl>
</div>
</body>
</html>