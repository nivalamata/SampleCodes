<%@ page import="com.mytask.TaskReport" %>



<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="taskReport.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" required="" value="${taskReportInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="taskReport.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="size" required="" value="${fieldValue(bean: taskReportInstance, field: 'size')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'extension', 'error')} ">
	<label for="extension">
		<g:message code="taskReport.extension.label" default="Extension" />
		
	</label>
	<g:textField name="extension" value="${taskReportInstance?.extension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'dataReport', 'error')} required">
	<label for="dataReport">
		<g:message code="taskReport.dataReport.label" default="Data Report" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dataReport" name="dataReport.id" from="${com.mytask.DataReport.list()}" optionKey="id" required="" value="${taskReportInstance?.dataReport?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskReportInstance, field: 'shortReport', 'error')} ">
	<label for="shortReport">
		<g:message code="taskReport.shortReport.label" default="Short Report" />
		
	</label>
	<g:textField name="shortReport" value="${taskReportInstance?.shortReport}"/>
</div>

