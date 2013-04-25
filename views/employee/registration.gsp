<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
<title>Employee Registration</title>
<style type="text/css">

h1 span{
        border-bottom:thick dotted  #ff0000;
}

</style>
</head>
<body>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="listEmployee">Edit Employee</g:link></li>

				<li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
			</ul>
		</div>
	
<h1>Register New Employee </h1>

  
   <dl>
    <g:uploadForm   action="registration">
    	<div class="myform">
    
<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="employee.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="45" required="" value="${employeeInstance?.username}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" maxlength="100" required="" value="${employeeInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="passwordRepeat">
		<g:message code="employee.password.label" default="Password Repeat" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwordRepeat" maxlength="100" required="" value="passwordRepeat"/>
</div>

--%><div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeID', 'error')} required">
	<label for="employeeID">
		<g:message code="employee.employeeID.label" default="Employee ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="employeeID" maxlength="15" required="" value="${employeeInstance?.employeeID}"/>
</div><%--


         
    <div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="employeeRole.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  name="authority" from="${com.mytask.EmployeeRole.list()}" optionKey="id" required="" value="${authority}" noSelection="['':'-Choose user authority']" />
</div>

--%>


<div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'authority', 'error')}required ">
	<label for="authority">
		<g:message code=" employeeRole.authority.label" default="authority" />
			<span class="required-indicator">*</span>
	</label>
	<g:select name="authority"   from="${['ROLE_HOD','ROLE_USER','ROLE_PM']}" value="authority"   noSelection="['':'- Choosee authority   -']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentName', 'error')}required ">
	<label for="departmentName">
		<g:message code="department.departmentName.label" default="Department Name" />
			<span class="required-indicator">*</span>
	</label>
	<g:select name="departmentName"   from="${['AGRO ECONOMY','QUALITY','MARKETING','HUMAN RESOURCE','WET MILL','FINANCE']}" value="departmentName"   noSelection="['':'- Choose department    -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentID', 'error')} ">
	<label for="departmentID">
		<g:message code="department.departmentID.label" default="Department ID" />
			<span class="required-indicator">*</span>
	</label>
	<g:select name="departmentID"   from="${['AE','QLT','MRT','HR','WM','FIN']}" value="departmentID"   noSelection="['':'-Choose departmentID']"/>
</div>


<%--
           
          <div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'department', 'error')} required">
	<label for="departmentName">
		<g:message code="department.departmentName.label" default="Department Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  name="departmentName" from="${com.mytask.Department.findAllByDepartmentNameIsNotNull()}" optionKey="id" required="" value="${departmentInstance?.departmentName}" noSelection="['':'-Choose department name-']" />
</div>
               
         <div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentID', 'error')} required">
	<label for="departmentID">
		<g:message code="employee.department.label" default="DepartmentID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="departmentID" from="${com.mytask.Department.list()}" optionKey="id"  optionValue="departmentID" required="" value="${departmentID}" />
</div>
           
         
--%><div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" maxlength="45" value="${profileInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" maxlength="45" value="${profileInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'jobTitle', 'error')} ">
	<label for="jobTitle">
		<g:message code="profile.jobTitle.label" default="Job Title" />
		
	</label>
	<g:textField name="jobTitle" maxlength="50" value="${profileInstance?.jobTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${profileInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="profile.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" maxlength="13" value="${profileInstance?.phoneNumber}"/>
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
      
        
   </div>
          <fieldset class="buttons">
					<g:submitButton name="register" class="save" value="register" action="registration" />
					  <g:submitButton name="cancel" class="save" value="cancelRegistration" action="cancelRegistration"/>
				</fieldset>


     
    </g:uploadForm>
   
</dl>
</div>
<%--<g:hasErrors>
            <div class="errors">
               <g:renderErrors bean="${user}" as="list" />
            </div>
   </g:hasErrors>
 
--%></body>
</html>