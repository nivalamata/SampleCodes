<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<g:set var="entityName" value="${message(code: 'employee.label', default: 'Project')}" />
<title>Create Project</title>
</head>
<body>

<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="project" action="listProject">List Project</g:link></li>
				
				<li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
			</ul>
		</div>
		
		<h1>Create New Project</h1>
<%--<g:hasErrors>
            <div class="errors">
               <g:renderErrors bean="${project}" as="list" />
            </div>
   </g:hasErrors>
--%>
	
<div  class="fieldcontain">
   <dl>
    <g:uploadForm   action="createProject">
    	<div class="myform">
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
		<g:message code="project.status.label" default="Project Status" />
		
	</label>
	<g:select name="status"   from="${['COMPLETED','UNCOMPLETED']}" value="status"   noSelection="['':'-Choose Project status-']"/>
</div>

        

     <div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'beginDate', 'error')} required">
	    <label for="beginDate">
		<g:message code="project.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	     </label>
	     <g:datePicker name="beginDate" precision="day"  value="${projectInstance?.beginDate}"  />
          </div>
              
       <div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'targetEndDate', 'error')} required">
	<label for="targetEndDate">
		<g:message code="project.targetEndDate.label" default="Target End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="targetEndDate" precision="day"  value="${projectInstance?.targetEndDate}"  />
</div>
              
      <div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'finalDate', 'error')} required">
	   <label for="finalDate">
		<g:message code="project.finalDate.label" default="Final Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finalDate" precision="day"  value="${projectInstance?.finalDate}"  />
</div>
      
           </div>
      <fieldset class="buttons">
					<g:actionSubmit  class="save" value="createProject" />
					<g:actionSubmit  class="save" value="cancel" action="cancelProject" />
	</fieldset>
         
    </g:uploadForm>
</dl>
</div>

</body>
</html>