<%@ page import="com.mytask.TaskReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taskReport.label', default: 'TaskReport')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-taskReport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listTaskReport"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
			<div class="myform">
		<div id="create-taskReport" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${taskReportInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${taskReportInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
	<dl>
 <g:uploadForm action="submitReport" method="post"  id="${taskInstance?.id }"  class="inputform">
 <fieldset  class="form">

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'shortReport', 'error')} required">
	<label for="shortReport">
		<g:message code="comment.shortReport.label" default="short Report" />
		<span class="required-indicator">*</span>
	</label>
	<%--value="${taskInstance?.comments?.employeeComment}"--%>
	<g:textArea name="shortReport" cols="40" rows="5" maxlength="1000" required=""    />
</div>

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'dataReport', 'error')} required">
	<label for="dataReport">
		<g:message code="taskReport.dataReport.label" default="dataReport" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="dataReport" name="dataReport" />
</div>

</fieldset>
<fieldset  class="buttons">
<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

	<g:link class="cancel" controller="task"action="taskDetails">cancel</g:link>

 
 </fieldset>
</g:uploadForm>
</dl>
		</div>
		</div>
	</body>
</html>
