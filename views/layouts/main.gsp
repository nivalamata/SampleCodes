<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<%--import pictures,css files--%>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'flag.gif')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'flag.gif')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'flag.gif')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'screen.css')}" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'print.css')}" type="text/css"  media="print">
		<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'ie.css')}" type="text/css">
        <r:layoutResources />
	</head>
	<body>
	
           
	
	<div id="content-wrapper"   class="container">
	  <div id="header" class="span-24 last">
	  
	  <div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'flag.gif')}" alt="Grails"/></a></div>
               
           </div><%--
           <sec:ifLoggedIn>
Welcome Back!
</sec:ifLoggedIn>
       --%><hr/>
       <sec:ifLoggedIn>
        <div id="left-sidebar" class="span-4 colborder">
        <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li>
				<sec:ifAllGranted roles="ROLE_HOD">
				<g:link class="create" controller="employee" action="registration">Register employee<g:message  args="[newEmployee]" /></g:link>
			
				</sec:ifAllGranted>
				</li>
			
				<sec:ifAllGranted roles="ROLE_HOD">
		
				<li><g:link class="list"controller="employee" action="listEmployee">List of Employees<g:message  args="[listEmployee]" /></g:link></li>
				
				</sec:ifAllGranted>
				
				
					
				<sec:ifAllGranted roles="ROLE_PM">
				<li><g:link class="create" controller="project" action="createProject">Create Project<g:message  args="[newEmployee]" /></g:link></li>
				<li><g:link class="create"  controller="task" action="createTask">Create Tasks</g:link></li>
				</sec:ifAllGranted>
			
				
				<sec:ifAllGranted roles="ROLE_PM">
				<li><g:link class="list"controller="project" action="listProject">List of Projects<g:message  args="[listProject]" /></g:link></li>
				<li><g:link class="list"controller="task" action="list">List of Tasks<g:message  args="[listTask]" /></g:link></li>				
				</sec:ifAllGranted>
				
				   <li><g:link class="list"  controller="task" action="viewTask">view Task<g:message  args="[entityName]" /></g:link></li>
				   
				   	<li><g:link class="list"  controller="comment" action="list">view Comments<g:message  args="[entityName]" /></g:link></li>
				   	
				    	<li><g:link class="list"  controller="headOfDepartment" action="changePassword">change Password<g:message  args="[entityName]" /></g:link></li>
				   	<li><g:link class="list"  controller="headOfDepartment" action="findEmployee" >View Profile<g:message  args="[entityName]" /></g:link></li>
				   
				   <sec:ifAllGranted roles="ROLE_PM">
				<li><g:link class="list"  controller="taskReport" action="listTaskReport">View Task Report<g:message  args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>
				
					<sec:ifAllGranted roles="ROLE_HOD">
				<li><g:link class="list"  controller="taskReport" action="listTaskReport">View Task Report<g:message  args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>
					<li><g:link class="out" controller="logout"> <sec:username /> signOut</g:link></li>
				</ul>
				</div>
      
              
           </div>
         
           
           <div id="content" class="span-19 last">
               <g:layoutBody />
           </div>
		  </sec:ifLoggedIn>
		  
		  <sec:ifNotLoggedIn>
		  	  <g:layoutBody />
		    </sec:ifNotLoggedIn>
		<g:javascript library="application"/>
        <r:layoutResources />
        
      
        <div id="footer-push"></div>
        </div>
       
       <div class=container>
        <div id="footer" class="span-24 last ">
        <hr>
        <g:render template="/common/footer"/>
              
           </div>
           
           </div>
        
	</body>
</html>