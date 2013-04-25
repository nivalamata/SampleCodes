package com.mytask

class HeadOfDepartmentController {
	
	def springSecurityService

	def scaffold=HeadOfDepartment
	
    //def index() { }
	
	
	def changePassword={ChangePasswordCommand cpc->
		if(cpc.hasErrors()){  //uses hasErrors to check validation
			
			return [user:cpc]
		}
		if(!cpc.hasErrors()){
			
			
			def user = springSecurityService.getCurrentUser()
			// employeeInstance=Employee.findAllByUsername(user.username)
			def employeeInstance=Employee.get(user.id)
			def myPass=employeeInstance.password
			

		   def encodedPassword= encodePass(cpc.oldPassword)
		   if(myPass==encodedPassword){
			   employeeInstance.password=cpc.newPassword
			   employeeInstance.save(flush:true)
			   
			   flash.message="password changed"
			redirect(controller:"headOfDepartment",action: "showProfile", id: user.id)
			   
			   
		   }
		}
		
	}
	
	
	def encodePass(String pass){
		
		springSecurityService.encodePassword(pass)
		
	}
	
	def showProfile() {
		def employeeInstance = Employee.get(params.id)
		if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
			redirect(action: "listEmployee")
			return
		}

		[employeeInstance: employeeInstance]
	}

	
	def findEmployee={
		//def found=Employee.get(user.id)
		def user = springSecurityService.getCurrentUser()
		redirect(controller:"headOfDepartment",action: "showProfile", id: user.id)
	}
	
	
	
	class ChangePasswordCommand {
		
			String oldPassword
			String newPassword
			String confirmPassword
			
		
			
		
			static constraints = {
			
		
				// Ensure oldpassword does not match new Password
			newPassword(size: 6..8, blank: false,
						 validator: { passwd,cpc ->
							return passwd != cpc.oldPassword
						})
			
			// Ensure newpassword is equal to the confiremed password
				confirmPassword(size: 6..8,blank: false,
						validator: { passwd2, cpc ->
							return passwd2 == cpc.newPassword
						})
			
			}
		
		}
}
