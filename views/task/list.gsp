
<%@ page import="com.mytask.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			
			</ul>
		</div>
			<div class="myform">
		<div id="list-task" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
				        <g:sortableColumn property="projectName" title="${message(code: 'task.taskID.label', default: 'project Name')}" />
						<g:sortableColumn property="taskID" title="${message(code: 'task.taskID.label', default: 'Task ID')}" />
					
						<g:sortableColumn property="taskTitle" title="${message(code: 'task.taskTitle.label', default: 'Task Title')}" />
					
						<g:sortableColumn property="taskDescription" title="${message(code: 'task.taskDescription.label', default: 'Task Description')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'task.priority.label', default: 'Priority')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="assigned by" title="${message(code: 'task.status.label', default: 'assigned by')}" />
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
					   <td><g:link controller="project" action="showProject" id="${taskInstance?.project?.id}">${taskInstance?.project?.encodeAsHTML()}</g:link></td>
						<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "taskID")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "taskTitle")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "taskDescription")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "priority")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "status")}</td>
					<td>  ${taskInstance?.project?.projectLeader?.encodeAsHTML()}</td>
					
					
					
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
