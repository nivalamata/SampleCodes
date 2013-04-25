<%@ page import="com.mytask.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskID', 'error')} required">
	<label for="taskID">
		<g:message code="task.taskID.label" default="Task ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taskID" maxlength="15" required="" value="${taskInstance?.taskID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskTitle', 'error')} required">
	<label for="taskTitle">
		<g:message code="task.taskTitle.label" default="Task Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taskTitle" maxlength="50" required="" value="${taskInstance?.taskTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'taskDescription', 'error')} required">
	<label for="taskDescription">
		<g:message code="task.taskDescription.label" default="Task Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="taskDescription" cols="40" rows="5" maxlength="1000" required="" value="${taskInstance?.taskDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'priority', 'error')} ">
	<label for="priority">
		<g:message code="task.priority.label" default="Priority" />
		
	</label>
	<g:textField name="priority" maxlength="6" value="${taskInstance?.priority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="task.status.label" default="Status" />
		
	</label>
	<g:textField name="status" maxlength="11" value="${taskInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'attachment', 'error')} required">
	<label for="attachment">
		<g:message code="task.attachment.label" default="Attachment" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="attachment" name="attachment" />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedDate', 'error')} required">
	<label for="assignedDate">
		<g:message code="task.assignedDate.label" default="Assigned Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="assignedDate" precision="day"  value="${taskInstance?.assignedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="task.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${taskInstance?.dueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="task.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${com.mytask.Employee.list()}" optionKey="id" required="" value="${taskInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="task.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.mytask.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>
</div>

