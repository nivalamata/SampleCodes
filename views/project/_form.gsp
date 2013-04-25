<%@ page import="com.mytask.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectID', 'error')} required">
	<label for="projectID">
		<g:message code="project.projectID.label" default="Project ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectID" maxlength="15" required="" value="${projectInstance?.projectID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="project.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" maxlength="50" required="" value="${projectInstance?.projectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectLeader', 'error')} required">
	<label for="projectLeader">
		<g:message code="project.projectLeader.label" default="Project Leader" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectLeader" maxlength="45" required="" value="${projectInstance?.projectLeader}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		
	</label>
	<g:textField name="status" maxlength="11" value="${projectInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'beginDate', 'error')} required">
	<label for="beginDate">
		<g:message code="project.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginDate" precision="day"  value="${projectInstance?.beginDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'employees', 'error')} ">
	<label for="employees">
		<g:message code="project.employees.label" default="Employees" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'finalDate', 'error')} required">
	<label for="finalDate">
		<g:message code="project.finalDate.label" default="Final Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finalDate" precision="day"  value="${projectInstance?.finalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'targetEndDate', 'error')} required">
	<label for="targetEndDate">
		<g:message code="project.targetEndDate.label" default="Target End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="targetEndDate" precision="day"  value="${projectInstance?.targetEndDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="project.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

