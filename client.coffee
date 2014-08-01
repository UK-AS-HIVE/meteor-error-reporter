onerror = window.onerror;
exports = this
exports.errorDetails = ''

if Meteor.isClient
    Meteor.startup ->
      console.log("error handling initiated")
      window.onerror = (errorMsg, url, lineNumber, column, errorObj) ->
        errorDetails += 'Error Message: '+ errorMsg + '\nURL: ' + url + '\nLine: ' + lineNumber + '\nColumn: ' + column + '\nStackTrace: ' +  errorObj
        errorReportHTML = UI.render(Template.errorReport)
      # bootbox.confirm Meteor.render(-> Template[templateName]()), -> 
      #   console.log 'confirmed'
        errorModal = bootbox.confirm(message : " ", -> console.log("confirmed"))
        console.log(errorModal)
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