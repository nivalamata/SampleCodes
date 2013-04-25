
<%@ page import="com.mytask.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'profile.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'profile.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="jobTitle" title="${message(code: 'profile.jobTitle.label', default: 'Job Title')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'profile.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'profile.phoneNumber.label', default: 'Phone Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profileInstanceList}" status="i" var="profileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showProfile" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: profileInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "jobTitle")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "phoneNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
