<%@ page import="com.mytask.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} ">
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

