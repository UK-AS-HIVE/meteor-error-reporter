onerror = window.onerror;
exports = this
exports.errorDetails = ''
Session.setDefault("disconnected", false)

if Meteor.isClient
    Meteor.startup ->
      console.log("error handling initiated")
      window.onerror = (errorMsg, url, lineNumber, column, errorObj) ->
        error = new ErrorObject(errorMsg, errorObj)
        error.getErrorMsg()
        error.getErrorObj()
        error.getUserAgent()
        error.getNavigator()
        error.getCurrentUser()
        errorDetails += 'Error Message: '+ errorMsg + '<br> URL: ' + url + '\nLine: ' + lineNumber + '\nColumn: ' + column + '\nStackTrace: ' +  errorObj
        errorReportHTML = UI.render(Template.errorReport)
        errorModal = bootbox.confirm(message : " ", -> console.log("confirmed"))
        UI.insert(UI.render(Template.errorReport), $(errorModal).find('.modal-body')[0])

Template.errorReport.helpers
  errorDetails: ->
    return errorDetails
Template.sendFeedback.events
  'click #sendFeedback': (e) ->
    feedbackHTML = '<h4>Please enter your feedback below. We will get back to you as soon as possible.</h4>'
    bootbox.prompt(feedbackHTML,
      -> console.log "confirmed")

Template.errorReport.events
  'click #seeDetails' : ->
    console.log("clicked")
    $('#errorDetails').toggle()

Template.errorTest.events
  'click #error-btn' : ->
    lakjsdlkaj


class ErrorObject
  constructor: (@errorMsg , @errorObj) ->
    @userAgent = window.navigator.userAgent
    @navigator = window.navigator
    @currentUser = if Meteor.userId()? then Meteor.userId() else null

  getErrorMsg : ->
    console.log @errorMsg

  getErrorObj : ->
    console.log @errorObj

  getUserAgent : ->
    console.log @userAgent

  getNavigator : ->
    console.log @navigator

  getCurrentUser : ->
    console.log @currentUser


Deps.autorun ->
  status = Meteor.status()
  Meteor.reconnect()
  if status.status !="connecting"
    Session.set("disconnected", !(status.connected))

Template.connectionMonitor.helpers
  disconnected: ->
    return Session.get("disconnected")

  showDisconnectMessage: ->
    bootbox.dialog
      message: "This message will disappear as soon as you are reconnected. Please do not close the page until this message disappears"
      title: "You are currently disconnect!"


  hideModal: ->
    if !Session.get("disconnected")
      bootbox.hideAll()
