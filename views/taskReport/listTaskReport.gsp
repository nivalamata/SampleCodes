
<%@ page import="com.mytask.TaskReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taskReport.label', default: 'TaskReport')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-taskReport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		
			</ul>
		</div>
			<div class="myform">
		<div id="list-taskReport" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:pdfLink url="/taskReport/listTaskReport">PDF View</g:pdfLink>
			<table>
				<thead>
					<tr>
					
					       <g:sortableColumn property="projectName" title="${message(code: 'task.taskID.label', default: 'Project Name')}" />
						<g:sortableColumn property="taskID" title="${message(code: 'task.taskID.label', default: 'Task ID')}" />
					
						<g:sortableColumn property="taskTitle" title="${message(code: 'task.taskTitle.label', default: 'Task Title')}" />
					
					<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'status')}" />
					
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'taskReport.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dueDate" title="${message(code: 'taskReport.lastUpdated.label', default: 'due Date')}" />
						
					<g:sortableColumn property="assigned to" title="${message(code: 'task.tasks.label', default: 'assigned To')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
						
						 <td>   <g:link controller="project" action="showProject" id="${taskInstance?.project?.id}">${taskInstance?.project?.encodeAsHTML()}</g:link></td>
						<td><g:link  controller="taskReport" action="show" id="${taskInstance?.id}">${fieldValue(bean: taskInstance, field: "taskID")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "taskTitle")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "status")}</td>
					
						<td><g:formatDate date="${taskInstance?.taskReport?.dateCreated}" /></td>
					
						<td><g:formatDate date="${taskInstance?.dueDate}" /></td>
						<td>  <g:link controller="employee" action="showEmployee" id="${taskInstance?.employee?.id}">${taskInstance?.employee?.encodeAsHTML()}</g:link></td>
		
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskInstanceTotal}" />
			</div>
		</div>
			</div>
	</body>
</html>
