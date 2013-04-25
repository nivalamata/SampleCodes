<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
<title>Create Task</title>
</head>
<body>

<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="task" action="list">List tasks</g:link></li>
				<%--<li><g:link class="create" action="createTask"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				--%><li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
			</ul>
		</div>
		
		<h1>Create New Task</h1>
		<g:hasErrors>
            <div class="errors">
               <g:renderErrors bean="${tasks}" as="list" />
            </div>
   </g:hasErrors>
		<div  class="fieldcontain">
   <dl>
    <g:uploadForm   action="createTask">
    	<div class="myform">
    
    <div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectName', 'error')} ">
	<label for="projectName">
		<g:message code="department.departmentID.label" default="Project Name" />
			<span class="required-indicator">*</span>
	</label>
	<g:select name="projectName"   from="${['ASSESMENT OF COFEE QUALITY','MBEYA COFEE PROCESSESING','PH SCALE MEASUREMENT IN JUNE','MARKETING IN JUNE','WET MILL INSTALLATION','FERTILIZER DISTRIBUTING','soil']}" value="projectName"   noSelection="['':'-Choose projectName']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="department.departmentID.label" default="username" />
			<span class="required-indicator">*</span>
	</label>
	<g:select name="username"   from="${['abc','goodluck','jestina','joel','yuda','julia','bright','prosper','aaa']}" value="username"   noSelection="['':'-Choose employee']"/>
</div>
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

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedDate', 'error')} required">
	<label for="assignedDate">
		<g:message code="task.assignedDate.label" default="Assigned Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="assignedDate" precision="day"  value="${taskInstance?.assignedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'attachment', 'error')} required">
	<label for="attachment">
		<g:message code="task.attachment.label" default="Attachment" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="attachment" name="attachment" />
</div>
<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="task.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${taskInstance?.dueDate}"  />
</div>




<%--<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'employees', 'error')} required">
	<label for="employees">
		<g:message code="task.employees.label" default="Employees" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employees" name="employees.id" from="${com.mytask.Employee.list()}" optionKey="id" required="" value="${taskInstance?.employees?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="task.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.mytask.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>
   
</div>




--%>

<%--<fieldset class="buttons">
					<g:actionSubmit  class="save" value="createTask" />
					<g:actionSubmit  class="save" value="cancel" action="cancelTask" />
	</fieldset>
         
    --%>
    </div>
    
     <fieldset class="buttons">
					<g:submitButton name="addTask" class="save" value="addTask" action="createTask" />
					  <g:submitButton name="cancel" class="save" value="cancelTask" action="cancelTask"/>
				</fieldset>
    
    
    </g:uploadForm>
    </dl>
         
    </div>
    
</body>
</html>