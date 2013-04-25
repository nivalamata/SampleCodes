package com.mytask

import org.springframework.dao.DataIntegrityViolationException

class CommentController {
     
	def scaffold=Comment
	def springSecurityService //service object for spring security
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	
	//initialise user comments
	def comment={
		
		def taskInstance=Task.get(params.id)
		return [taskInstance:taskInstance]
	}
	
	//post  user comments
	def postComment={
		
		def myComment= new Comment(params)
		def ta=Task.get(params.id)
		if(ta.addToComments(myComment).save(flush:true)){
			
			flash.message="your comment has successfull added"
			redirect(uri:'/comment/list')
		}
		else{
			flash.message="fail to add your comment"
			redirect(uri:'/task/showDetails')
		}
	}
      

         
    def list() {
		def user = springSecurityService.getCurrentUser()
        params.max = Math.min(params.max ? params.int('max') : 5, 50)
		
		
        [commentInstanceList: Comment.list(params), commentInstanceTotal: Comment.count()]
    }

    def create() {
        [commentInstance: new Comment(params)]
    }

    def save() {
        def commentInstance = new Comment(params)
        if (!commentInstance.save(flush: true)) {
            render(view: "create", model: [commentInstance: commentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(action: "show", id: commentInstance.id)
    }

    def show() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        [commentInstance: commentInstance]
    }

    def edit() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        [commentInstance: commentInstance]
    }

    def update() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (commentInstance.version > version) {
                commentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comment.label', default: 'Comment')] as Object[],
                          "Another user has updated this Comment while you were editing")
                render(view: "edit", model: [commentInstance: commentInstance])
                return
            }
        }

        commentInstance.properties = params

        if (!commentInstance.save(flush: true)) {
            render(view: "edit", model: [commentInstance: commentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(action: "show", id: commentInstance.id)
    }

    def delete() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            commentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
