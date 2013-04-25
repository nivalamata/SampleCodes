<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
<title>Change Password</title>
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

				<li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
			</ul>
		</div>
	<div class="myform">	
<h1>change password </h1>

  
   <dl>
    <g:uploadForm   action="changePassword">
    
    <div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="oldPassword">
		<g:message code="employee.oldPassword.label" default=" Old Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="oldPassword" maxlength="100" required="" value="${employeeInstance?.password}"/>
</div>
    

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="newPassword">
		<g:message code="employee.newPassword.label" default="NewPassword" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="newPassword" maxlength="100" required="" value="${employeeInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="confirmPassword">
		<g:message code="employee.confirmPassword.label" default="Confirm password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confirmPassword" maxlength="100" required="" value="confirmPassword"/>
</div>
      
          <fieldset class="buttons">
					<g:submitButton name="save" class="save" value="save" action="changePassword" />
					  <g:submitButton name="cancel" class="save" value="cancelEdition" action="/"/>
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