<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<g:set var="newEmployee" value="Register Employee" />
		<g:set var="listEmployee" value="List of employees" />
		<title>Welcome To TAMSAC</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				
				<li>
				<sec:ifAllGranted roles="ROLE_HOD">
				<g:link class="create" controller="employee" action="registration">Register Employee<g:message  args="[newEmployee]" /></g:link>
				</sec:ifAllGranted>
				</li>
				<li>
				<sec:ifAllGranted roles="ROLE_HOD">
				<g:link class="list"controller="employee" action="listEmployee">List of Employees<g:message  args="[listEmployee]" /></g:link>
				</sec:ifAllGranted>
				</li>
				
				<li>
				<sec:ifAllGranted roles="ROLE_PM">
				<g:link class="create" controller="project" action="createProject">Create Project<g:message  args="[newEmployee]" /></g:link>
				</sec:ifAllGranted>
				</li>
				
				<sec:ifAllGranted roles="ROLE_PM">
			
				<li><g:link class="create"  controller="task" action="createTask">Create Tasks</g:link></li>
				</sec:ifAllGranted>
				
				  <sec:ifLoggedIn>
                <li><g:link class="list"  controller="task" action="viewTask">view Task<g:message  args="[entityName]" /></g:link></li>
				   
				    </sec:ifLoggedIn>
				
				<li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome To Task Assignment and Management System For Agro-Business Companies</h1>
			<p>Task assignment and management system is a web based System which will help 
			business enterprises to assign task under particular project to its employees. 
			Also system will enable employees to upload field report from their respective areas of work. 
		</p>

		</div>
	</body>
</html>
