package com.mytask

import java.util.Date;

class ProjectController {
def springSecurityService
	def scaffold=Project
   // def index() { }
	
	
	
	
	


	
	def createProject={ProjectRegistrationCommand prc->  //binds data from params to command object
		
		
		
		if(!prc.hasErrors()){
			
			def proj = Project.findByProjectID(prc.projectID) ?: new Project(projectID:prc.projectID,projectName:prc.projectName,projectLeader:prc.projectLeader,status:prc.status, beginDate:prc.beginDate,targetEndDate:prc.targetEndDate,finalDate:prc.finalDate)
			/*def hodDept=Department.findByDepartmentID(urc.departmentID) ?: new Department(departmentName: urc.departmentName,departmentID:urc.departmentID).save(flush:true)
			hodDept.addToEmployees(hodUser).save(flush:true)
			def addRole=EmployeeRole.findByAuthority(urc.authority)
			def addUser=Employee.findByUsername(urc.username)*/
		  if(proj.save(flush:true)){
			 flash.message="project created,${prc.projectName} on  ${ prc.beginDate}"
			redirect(uri:'/project/listProject')}
		
		}else{
		//maybe  not unique userID
		return[project:prc]
		}
		
	   if(prc.hasErrors()){  //uses hasErrors to check validation
			
			return [project:prc]
		}
		
		
		
	}
	
	def cancelProject={
		redirect(uri:'/')
		
	}
	
	
	def listProject() {
		params.max = Math.min(params.max ? params.int('max') : 5, 50)
		[projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
	}
	
	
	def showProject() {
		def projectInstance = Project.get(params.id)
		if (!projectInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
			redirect(action: "listProject")
			return
		}

		[projectInstance: projectInstance]
	}
	
	class ProjectRegistrationCommand{
		
		String projectID
		String projectName
		String projectLeader
		String status
		Date beginDate
		Date targetEndDate
		Date finalDate
		
		static constraints = {
			projectID(size:2..15,blank:false,unique:true)
			projectName(size:2..50,blank:false,unique:true)
			projectLeader(size:2..45,blank:false)
			status(size:7..11,nullable:false)
		}
		
		
	}
	
}
