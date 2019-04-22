package attainrvtwo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def list = userService.list(params)
        respond list, model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def lostPassword() {
    }

    def changePassword() {
    }

    def newPurchase() {
        redirect(controller: 'purchase', action: 'create')
    }

    def statusDisplay() {
        if(session.permission == "נמוך") {
            redirect(controller: 'volunteer', action: 'index')
        } else if(session.permission == "בינוני") {
            redirect(controller: 'committeeManager', action: 'index')
        } else {
            redirect(controller: 'management', action: 'index')
        }
//        redirect(controller: 'purchase', action: 'index')
    }

    def login() {
        def userFound = false
        User.list().each {
            if(params.username == "${it.name}" && params.password == "${it.password}") {
                session.user = "${it.name}"
                session.committee = it.committee
                session.committeeName = "${it.committee.name}"
                session.permission = "${it.permission}"
                userFound = true
            }
        }
        flash.message = userFound ? "הכניסה אושרה" : "הפרטים שהוכנסו שגויים"

        redirect(action: 'index')
    }

    def logout() {
        session.user = null
        session.invalidate()
        redirect(action: 'index')
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}