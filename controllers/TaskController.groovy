package com.mytask
import org.springframework.web.multipart.MultipartFile
import java.util.Date;

class TaskController {
	def springSecurityService
	def authenticateService

	def scaffold=Task
   // def index() { }
	
	
	
	def taskDetails() {
		def taskInstance = Task.get(params.id)
		if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
			redirect(action: "list")
			return
		}

		[taskInstance: taskInstance]
	}
	
	
	def createFile = {
		
		return [ file: new File() ]
		}
	
		def upload = {
			
			def file = new Task( params )
			//file.user = userService.getAuthenticatedUser()
			MultipartFile f = request.getFile( 'attachment' )
			file.size = f.getSize() / 1024
			file.extension = extractExtension( f )
			file.fileName=f.getOriginalFilename()
			if(file.save()) {
			flash.message = "File [${file.fileName}] has been uploaded."
			redirect(uri: '/task/createTask')
			} else {
			render(view: 'createFile', model: [file: file])
			}
			
				
		}
		
		def extractExtension( MultipartFile file ) {
			String filename = file.getOriginalFilename()
			return filename.substring(filename.lastIndexOf( "." ) + 1 )
			}
		
		
		def displayBlob={
			def myBlob=Task.get(params.id)
			
			if(myBlob.extension=="jpeg"){
			response.contentType="image/jpeg"
			}
			
			if(myBlob.extension=="pdf"){
				response.contentType="Application/pdf"
				}
			if(myBlob.extension=="docx"){
				response.contentType="Application/docx"
				}
			response.contentLength=myBlob?.attachment.length
			response.outputStream.write(myBlob.attachment)
		}
	
	//download file
	def download={
		
		def file = Task.get(params.id)
		response.setContentType( "application-xdownload")
		//response.setHeader("Content-Disposition", "attachment; filename=${file.name+"."+file.extension}  ")
		response.setHeader("Content-Disposition", "attachment; filename=${file.fileName}  ")
	   response.getOutputStream() << new ByteArrayInputStream( file.attachment )
	}
	
	

	def viewTask() {
		def user = springSecurityService.getCurrentUser()
		
		params.max = Math.min(params.max ? params.int('max') : 5, 50)
		
		
		def myTask=Task.createCriteria().list(params){
		and{eq('employee.id',user.id)}
		
		}
		
	
		if (!myTask) {
			/*flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])*/
           
			redirect(action: "noTask")
			return
		}
		
		[taskInstanceList: myTask, taskInstanceTotal: Task.count()]
	}
	
	def noTask={
		
		flash.message="you are not assigned any task "
	}
	
	
	

	
	
	
	def createTask={TaskRegistrationCommand trc->  //binds data from params to command object
		
		
		if(trc.hasErrors()){  //uses hasErrors to check validation
			
			return [tasks:trc]
		}
		
		if(!trc.hasErrors()){
			def tsk = Task.findByTaskID(trc.taskID) ?: new Task(taskID:trc.taskID,taskTitle:trc.taskTitle,taskDescription:trc.taskDescription,attachment:trc.attachment,status:trc.status, priority:trc.priority,assignedDate:trc.assignedDate,dueDate:trc.dueDate)
			def myProject=Project.findByProjectName(trc.projectName)
			def myEmployee=Employee.findByUsername(trc.username)
			
			
			MultipartFile f = request.getFile( 'attachment' )
			tsk.size = f.getSize() / 1024
			tsk.extension = extractExtension( f )
			tsk.fileName=f.getOriginalFilename()
			
			myProject.addToTasks(tsk)
			if(myEmployee.addToTasks(tsk).save(flush:true)){
			
			myEmployee.addToProjects(myProject)
			
		
			
			 flash.message="task created,${trc.taskTitle} on  ${ trc.assignedDate}"
			redirect(uri:'/task/list')
			}
		}else{
		//maybe  not unique userID
		return[tasks:trc]
		}
		

		
		
	}
	
	def cancelTask={
		redirect(uri:'/')
		
	}
	

	
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 5, 50)
		[taskInstanceList: Task.list(params), taskInstanceTotal: Task.count()]
	}
	

	
	
	class TaskRegistrationCommand{
		
	String taskID
	String taskTitle
	String taskDescription
	String priority
	String status
	byte[] attachment
	Date assignedDate
	Date dueDate
	String username
	String projectName
	
		
		static constraints = {
		taskID(size:2..15,blank:false,unique:true)
		taskTitle(size:2..50,blank:false)
		taskDescription(maxSize:1000,blank:false)
		priority(size:3..6,nullable:false)
		status(size:7..11,nullable:false)
		attachment(nullable:true)
		}
		
		
	}
	
	

}


