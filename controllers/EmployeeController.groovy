package com.mytask

import org.springframework.dao.DataIntegrityViolationException

class EmployeeController {
	def scaffold=Employee
	def springSecurityService
	
	
	 static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	 
	
	 
	 
	 def registration={UserRegistrationCommand urc->  //binds data from params to command object
		 
		 if(urc.hasErrors()){  //uses hasErrors to check validation
			 
			 return [user:urc]
		 }
		 
		 if(!urc.hasErrors()){
			 
			 def hodUser = Employee.findByUsername(urc.username) ?: new Employee(username: urc.username,password:urc.employeeID,employeeID:urc.employeeID,enabled: urc.enabled, accountExpired:urc.accountExpired, accountLocked:urc.accountLocked, passwordExpired: urc.passwordExpired,profile:new Profile(firstName:urc.firstName,lastName:urc.lastName,jobTitle:urc.jobTitle,email:urc.email,phoneNumber:urc.phoneNumber))
			 def hodDept=Department.findByDepartmentID(urc.departmentID) ?: new Department(departmentName: urc.departmentName,departmentID:urc.departmentID).save(flush:true)
			 hodDept.addToEmployees(hodUser).save(flush:true)
			 def hodRole = EmployeeRole.findByAuthority(urc.authority) ?: new EmployeeRole(authority: urc.authority).save(flush: true)
		 
			 if (!com.mytask.EmployeeEmployeeRole.findByEmployeeAndEmployeeRole(hodUser, hodRole)) {
				 EmployeeEmployeeRole.create hodUser, hodRole,true}
			 
			  flash.message="welcome aboard,${urc.firstName}  ${ urc.lastName} "
			 redirect(uri:'/employee/listEmployee')
		 
		 }else{
		 //maybe  not unique userID
		 return[user:urc]
		 }
	}
		 
		 def cancelRegistration={
			 redirect(uri:'/employee/list')
		 }
		 
		 
	 
	 
	 
	   /*def index() {
        redirect(action: "listEmployee", params: params)
    }*/

    def listEmployee() {
        params.max = Math.min(params.max ? params.int('max') : 5, 50)
        [employeeInstanceList: Employee.list(params), employeeInstanceTotal: Employee.count()]
    }

    def create() {
        [employeeInstance: new Employee(params)]
    }

    def save() {
        def employeeInstance = new Employee(params)
        if (!employeeInstance.save(flush: true)) {
            render(view: "create", model: [employeeInstance: employeeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
        redirect(action: "showEmployee", id: employeeInstance.id)
    }

    def showEmployee() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "listEmployee")
            return
        }

        [employeeInstance: employeeInstance]
    }

    def edit() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "listEmployee")
            return
        }

        [employeeInstance: employeeInstance]
    }

    def update() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "listEmployee")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (employeeInstance.version > version) {
                employeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employee.label', default: 'Employee')] as Object[],
                          "Another user has updated this Employee while you were editing")
                render(view: "edit", model: [employeeInstance: employeeInstance])
                return
            }
        }

        employeeInstance.properties = params

        if (!employeeInstance.save(flush: true)) {
            render(view: "edit", model: [employeeInstance: employeeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
        redirect(action: "showEmployee", id: employeeInstance.id)
    }

    def delete() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "listEmployee")
            return
        }

        try {
            employeeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "listEmployee")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect(action: "showEmployee", id: params.id)
        }
    }
	
	
	
	class UserRegistrationCommand {
		
			String username
			/*String password
			String passwordRepeat*/
			String employeeID
			String authority
			
			String departmentID
			String departmentName
		
			boolean enabled
			boolean accountExpired
			boolean accountLocked
			boolean passwordExpired
			String firstName
			String lastName
			String jobTitle
			String email
			String phoneNumber
		
			static constraints = {
				username(blank: false, size: 3..20)
		
				// Ensure password does not match username
		/*		password(size: 6..8, blank: false,
						 validator: { passwd, urc ->
							return passwd != urc.username
						})
				passwordRepeat(nullable: false,
						validator: { passwd2, urc ->
							return passwd2 == urc.password
						})*/
				authority(nullable:false)
				
				departmentID(blank:false,unique:true,size:2..15)
				departmentName(blank:false,size:2..50)
				
				firstName(nullable:true,size:2..45)
				lastName(nullable:true,size:2..45)
				jobTitle(nullable:true,size:2..50)
				email(email:true,nullable:true)
				phoneNumber(nullable:true,size:10..13)
			}
		
		}
	

}
