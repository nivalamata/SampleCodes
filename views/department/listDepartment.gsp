
<%@ page import="com.mytask.Department" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
			<div class="myform">
		<div id="list-department" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="departmentID" title="${message(code: 'department.departmentID.label', default: 'Department ID')}" />
					
						<g:sortableColumn property="departmentName" title="${message(code: 'department.departmentName.label', default: 'Department Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${departmentInstanceList}" status="i" var="departmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showDepartment" id="${departmentInstance.id}">${fieldValue(bean: departmentInstance, field: "departmentID")}</g:link></td>
					
						<td>${fieldValue(bean: departmentInstance, field: "departmentName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${departmentInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>
