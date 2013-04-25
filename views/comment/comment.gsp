<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />

<meta name="layout" content="main"/>
<title>post your comment</title>
</head>
<body>

<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<h1><sec:username/> post your comment</h1>
		
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
						<g:hasErrors bean="${taskInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${taskInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
 <dl>
<g:form action="postComment" method="post"  id="${taskInstance?.id }"  class="inputform">
 <fieldset  class="form">

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'employeeComment', 'error')} required">
	<label for="employeeComment">
		<g:message code="comment.employeeComment.label" default="employee Comment" />
		<span class="required-indicator">*</span>
	</label>
	<%--value="${taskInstance?.comments?.employeeComment}"--%>
	<g:textArea name="employeeComment" cols="40" rows="5" maxlength="1000" required=""    />
</div>

</fieldset>
<fieldset  class="buttons">
<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

	<g:link class="cancel" controller="task"action="taskDetails">cancel</g:link>

 
 </fieldset>
</g:form>
</dl>
</body>
</html>