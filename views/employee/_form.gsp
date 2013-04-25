<%@ page import="com.mytask.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="employee.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${employeeInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${employeeInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeID', 'error')} required">
	<label for="employeeID">
		<g:message code="employee.employeeID.label" default="Employee ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="employeeID" maxlength="15" required="" value="${employeeInstance?.employeeID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="employee.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${com.mytask.Profile.list()}" optionKey="id" value="${employeeInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="employee.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${employeeInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="employee.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${employeeInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="employee.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${com.mytask.Department.list()}" optionKey="id" required="" value="${employeeInstance?.department?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="employee.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${employeeInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="employee.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${employeeInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'projects', 'error')} ">
	<label for="projects">
		<g:message code="employee.projects.label" default="Projects" />
		
	</label>
	<g:select name="projects" from="${com.mytask.Project.list()}" multiple="multiple" optionKey="id" size="5" value="${employeeInstance?.projects*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="employee.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

