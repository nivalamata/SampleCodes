
<%@ page import="com.mytask.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			
				
			</ul>
		</div>
			<div class="myform">
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<g:if test="${projectInstance?.projectID}">
				<li class="fieldcontain">
					<span id="projectID-label" class="property-label"><g:message code="project.projectID.label" default="Project ID" /></span>
					
						<span class="property-value" aria-labelledby="projectID-label"><g:fieldValue bean="${projectInstance}" field="projectID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="project.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${projectInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.projectLeader}">
				<li class="fieldcontain">
					<span id="projectLeader-label" class="property-label"><g:message code="project.projectLeader.label" default="Project Leader" /></span>
					
						<span class="property-value" aria-labelledby="projectLeader-label"><g:fieldValue bean="${projectInstance}" field="projectLeader"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${projectInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.beginDate}">
				<li class="fieldcontain">
					<span id="beginDate-label" class="property-label"><g:message code="project.beginDate.label" default="Begin Date" /></span>
					
						<span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${projectInstance?.beginDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.employees}">
				<li class="fieldcontain">
					<span id="employees-label" class="property-label"><g:message code="project.employees.label" default="Employees" /></span>
					
						<g:each in="${projectInstance.employees}" var="e">
						<span class="property-value" aria-labelledby="employees-label"><g:link controller="employee" action="showEmployee" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.finalDate}">
				<li class="fieldcontain">
					<span id="finalDate-label" class="property-label"><g:message code="project.finalDate.label" default="Final Date" /></span>
					
						<span class="property-value" aria-labelledby="finalDate-label"><g:formatDate date="${projectInstance?.finalDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.targetEndDate}">
				<li class="fieldcontain">
					<span id="targetEndDate-label" class="property-label"><g:message code="project.targetEndDate.label" default="Target End Date" /></span>
					
						<span class="property-value" aria-labelledby="targetEndDate-label"><g:formatDate date="${projectInstance?.targetEndDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="project.tasks.label" default="Tasks" /></span>
					
						<g:each in="${projectInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
