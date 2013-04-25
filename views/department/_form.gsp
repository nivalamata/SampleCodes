<%@ page import="com.mytask.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentID', 'error')} required">
	<label for="departmentID">
		<g:message code="department.departmentID.label" default="Department ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="departmentID" maxlength="15" required="" value="${departmentInstance?.departmentID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentName', 'error')} required">
	<label for="departmentName">
		<g:message code="department.departmentName.label" default="Department Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="departmentName" maxlength="50" required="" value="${departmentInstance?.departmentName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'employees', 'error')} ">
	<label for="employees">
		<g:message code="department.employees.label" default="Employees" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departmentInstance?.employees?}" var="e">
    <li><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="employee" action="create" params="['department.id': departmentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'employee.label', default: 'Employee')])}</g:link>
</li>
</ul>

</div>

