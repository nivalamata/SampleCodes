
<%@ page import="com.mytask.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			
			</ul>
		</div>
			<div class="myform">
		<div id="list-project" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="projectID" title="${message(code: 'project.projectID.label', default: 'Project ID')}" />
					
						<g:sortableColumn property="projectName" title="${message(code: 'project.projectName.label', default: 'Project Name')}" />
					
						<g:sortableColumn property="projectLeader" title="${message(code: 'project.projectLeader.label', default: 'Project Leader')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'project.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="beginDate" title="${message(code: 'project.beginDate.label', default: 'Begin Date')}" />
					
						<g:sortableColumn property="finalDate" title="${message(code: 'project.finalDate.label', default: 'Final Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showProject" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "projectID")}</g:link></td>
					
						<td>${fieldValue(bean: projectInstance, field: "projectName")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "projectLeader")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "status")}</td>
					
						<td><g:formatDate date="${projectInstance.beginDate}" /></td>
					
						<td><g:formatDate date="${projectInstance.finalDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>
