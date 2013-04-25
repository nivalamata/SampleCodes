<%@ page import="com.mytask.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'employeeComment', 'error')} ">
	<label for="employeeComment">
		<g:message code="comment.employeeComment.label" default="Employee Comment" />
		
	</label>
	<g:textArea name="employeeComment" cols="40" rows="5" maxlength="1000" value="${commentInstance?.employeeComment}"/>
</div>

