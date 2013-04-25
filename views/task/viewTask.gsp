<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
<meta name="layout" content="main"/>
<title>view Assigned task</title>
</head>
<body>

		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link  controller="task" class="list" action="viewTask">view Task<g:message  args="[entityName]" /></g:link></li>
				
			</ul>
		</div>
			<div class="myform">
			<h1><sec:username/> view your assigned Tasks</h1>
			<div id="list-task" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
	
			<table>
				<thead>
					<tr>
					
					     <g:sortableColumn property="projectName" title="${message(code: 'task.taskID.label', default: 'Project Name')}" />
						<g:sortableColumn property="taskID" title="${message(code: 'task.taskID.label', default: 'Task ID')}" />
					
						<g:sortableColumn property="taskTitle" title="${message(code: 'task.taskTitle.label', default: 'Task Title')}" />
					
					
					
						<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="assignedDate" title="${message(code: 'task.assignedDate.label', default: 'Assigned Date')}" />
					<g:sortableColumn property="dueDate" title="${message(code: 'task.assignedDate.label', default: 'Due date')}" />
						
						<g:sortableColumn property="assigned by" title="${message(code: 'task.status.label', default: 'assigned by')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					  <td>   <g:link controller="project" action="showProject" id="${taskInstance?.project?.id}">${taskInstance?.project?.encodeAsHTML()}</g:link></td>
						<td><g:link action="taskDetails" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "taskID")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "taskTitle")}</td>
					
					
					
						<td>${fieldValue(bean: taskInstance, field: "status")}</td>
					
						<td><g:formatDate date="${taskInstance.assignedDate}" /></td>
						<td><g:formatDate date="${taskInstance.dueDate}" /></td>
						
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