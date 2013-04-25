
<%@ page import="com.mytask.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<sec:ifAllGranted roles="ROLE_PM">
				<li><g:link class="create" action="create">create Tasks</g:link></li>
				</sec:ifAllGranted>
			</ul>
		</div>
			<div class="myform">
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
	
			
			
			<ol class="property-list task">
			
			
				<g:if test="${taskInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="task.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="showProject" id="${taskInstance?.project?.id}">${taskInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					<g:if test="${taskInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="task.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="showEmployee" id="${taskInstance?.employee?.id}">${taskInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.taskID}">
				<li class="fieldcontain">
					<span id="taskID-label" class="property-label"><g:message code="task.taskID.label" default="Task ID" /></span>
					
						<span class="property-value" aria-labelledby="taskID-label"><g:fieldValue bean="${taskInstance}" field="taskID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.taskTitle}">
				<li class="fieldcontain">
					<span id="taskTitle-label" class="property-label"><g:message code="task.taskTitle.label" default="Task Title" /></span>
					
						<span class="property-value" aria-labelledby="taskTitle-label"><g:fieldValue bean="${taskInstance}" field="taskTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.taskDescription}">
				<li class="fieldcontain">
					<span id="taskDescription-label" class="property-label"><g:message code="task.taskDescription.label" default="Task Description" /></span>
					
						<span class="property-value" aria-labelledby="taskDescription-label"><g:fieldValue bean="${taskInstance}" field="taskDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="task.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${taskInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="task.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${taskInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.attachment}">
				<li class="fieldcontain">
					<span id="attachment-label" class="property-label"><g:message code="task.attachment.label" default="Attachment" /></span>
				 <g:link class="property-value" controller="task" action="displayBlob" id="${taskInstance?.id}">View task attachment ${taskInstance?.fileName } ${taskInstance?.size }KB</g:link>
					
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.assignedDate}">
				<li class="fieldcontain">
					<span id="assignedDate-label" class="property-label"><g:message code="task.assignedDate.label" default="Assigned Date" /></span>
					
						<span class="property-value" aria-labelledby="assignedDate-label"><g:formatDate date="${taskInstance?.assignedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="task.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${taskInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
		
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskInstance?.id}" />
						<sec:ifAllGranted roles="ROLE_HOD,ROLE_PM">
					<g:link class="edit" action="edit" id="${taskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				   </sec:ifAllGranted>
				   <g:link class="attachment"  controller="task" action="download" id="${taskInstance?.id}">download task attachment  ${taskInstance?.fileName } ${taskInstance?.size }KB</g:link>
					
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
