
<%@ page import="com.mytask.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
	
			</ul>
		</div>
			<div class="myform">
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'employee.username.label', default: 'Username')}" />
					
				
					
						<g:sortableColumn property="employeeID" title="${message(code: 'employee.employeeID.label', default: 'Employee ID')}" />
					
						<th><g:message code="employee.profile.label" default="Profile" /></th>
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'employee.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'employee.accountLocked.label', default: 'Account Locked')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showEmployee" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "username")}</g:link></td>
					
			
					
						<td>${fieldValue(bean: employeeInstance, field: "employeeID")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "profile")}</td>
					
						<td><g:formatBoolean boolean="${employeeInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${employeeInstance.accountLocked}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>
