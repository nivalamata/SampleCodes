
<%@ page import="com.mytask.Comment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
			<div class="myform">
		<div id="list-comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="employeeComment" title="${message(code: 'comment.employeeComment.label', default: 'Employee Comment')}" />
						<g:sortableColumn property="taskID" title="${message(code: 'task.taskID.label', default: 'Task ID')}" />
						
				
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comment.dateCreated.label', default: 'Date Created')}" />
						<g:sortableColumn property="username" title="posted by" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentInstanceList}" status="i" var="commentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean: commentInstance, field: "employeeComment")}</g:link></td>
						<td><g:link controller="task"action="show" id="${commentInstance?.task?.id}">${commentInstance?.task?.taskID?.encodeAsHTML()}</g:link></td>
					
						<td><g:formatDate date="${commentInstance.dateCreated}" /></td>
					  <td>   <g:link controller="employee" action="showEmployee" id="${commentInstance?.task?.employee?.id}">${commentInstance?.task?.employee?.encodeAsHTML()}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>
