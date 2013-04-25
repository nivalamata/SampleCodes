
<%@ page import="com.mytask.Department" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_HOD">
				<li><g:link class="list" action="listDepartment"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</sec:ifAllGranted>
			</ul>
		</div>
			<div class="myform">
		<div id="show-department" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list department">
			
				<g:if test="${departmentInstance?.departmentID}">
				<li class="fieldcontain">
					<span id="departmentID-label" class="property-label"><g:message code="department.departmentID.label" default="Department ID" /></span>
					
						<span class="property-value" aria-labelledby="departmentID-label"><g:fieldValue bean="${departmentInstance}" field="departmentID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.departmentName}">
				<li class="fieldcontain">
					<span id="departmentName-label" class="property-label"><g:message code="department.departmentName.label" default="Department Name" /></span>
					
						<span class="property-value" aria-labelledby="departmentName-label"><g:fieldValue bean="${departmentInstance}" field="departmentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.employees}">
				<li class="fieldcontain">
					<span id="employees-label" class="property-label"><g:message code="department.employees.label" default="Employees" /></span>
					
						<g:each in="${departmentInstance.employees}" var="e">
						<span class="property-value" aria-labelledby="employees-label"><g:link controller="employee" action="showEmployee" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${departmentInstance?.id}" />
					<sec:ifAllGranted roles="ROLE_HOD">
					<g:link class="edit" action="edit" id="${departmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAllGranted>
				</fieldset>
			</g:form>
		</div>
			</div>
	</body>
</html>
