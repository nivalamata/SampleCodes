
<%@ page import="com.mytask.TaskReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taskReport.label', default: 'TaskReport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-taskReport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listTaskReport"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
			<div class="myform">
		<div id="show-taskReport" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list taskReport">
			
			
			
			
			
			
			
				<g:if test="${taskInstance?.project?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="taskReport.fileName.label" default="project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${taskInstance.project}" field="projectName"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${taskInstance?.taskTitle}">
				<li class="fieldcontain">
					<span id="taskTitle-label" class="property-label"><g:message code="task.taskTitle.label" default="task Title" /></span>
					
						<span class="property-value" aria-labelledby="taskTitle-label"><g:fieldValue bean="${taskInstance}" field="taskTitle"/></span>
					
				</li>
				</g:if>
				
					<g:if test="${taskInstance?.taskDescription}">
				<li class="fieldcontain">
					<span id="taskDescription-label" class="property-label"><g:message code="task.taskDescription.label" default="task Description" /></span>
					
						<span class="property-value" aria-labelledby="taskDescription-label"><g:fieldValue bean="${taskInstance}" field="taskDescription"/></span>
					
				</li>
				</g:if>
				
				
				<g:if test="${taskInstance?.taskReport?.shortReport}">
				<li class="fieldcontain">
					<span id="shortReport-label" class="property-label"><g:message code="taskReport.shortReport.label" default="Short Report" /></span>
					
						<span class="property-value" aria-labelledby="shortReport-label"><g:fieldValue bean="${taskInstance?.taskReport}" field="shortReport"/></span>
					
				</li>
				</g:if>
				
			
			<g:if test="${taskInstance?.taskReport?.dataReport}">
				<li class="fieldcontain">
					<span id="dataReport-label" class="property-label"><g:message code="task.dataReport.dataReport.label" default="view File Report" /></span>
				<g:link class="property-value" controller="taskReport" action="displayFileReport" id="${taskInstance?.id}">View File Report ${taskInstance?.taskReport?.fileName } ${taskInstance?.taskReport?.size }KB</g:link>
					
				</li>
				</g:if>
			

				<g:if test="${taskInstance?.taskReport?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="taskReport.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${taskInstance?.taskReport?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.taskReport?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="taskReport.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${taskInstance?.taskReport?.lastUpdated}" /></span>
					
				</li>
				</g:if>
				
			<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="taskReport.fileName.label" default="Assigned To" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label">		 <g:link controller="employee" action="showEmployee" id="${taskInstance?.employee?.id}">${taskInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
	
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskReportInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskReportInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="attachment"  controller="taskReport" action="downloadReport" id="${taskInstance?.id}">download task Report  ${taskInstance?.taskReport?.fileName } ${taskInstance?.taskReport.size }KB</g:link>
				
				</fieldset>
			</g:form>
		</div>
			</div>
	</body>
</html>
