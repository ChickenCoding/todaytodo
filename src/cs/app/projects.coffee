define [
  "jquery",
  "knockout",
  "moment",
  "store",
  "pomodoro",
  "members",
  "tasks"
], ( ($, ko, Moment, Store, pomodoro, members, tasks) ->
  project = (id, name) ->
    pjc = @
    pjc.id = 0
    pjc.name = ko.observable name
    pjc.createdAt = Moment().format("MM-DD-YYYY hh:mm:ss")
    pjc.updatedAt = ko.observable(Moment().format("MM-DD-YYYY hh:mm:ss"))
    pjc.taskers = ko.observableArray([ new members() ])
    pjc.onUpdate = ->
      pjc.updatedAt(Moment().format("MM-DD-YYYY hh:mm:ss"))
    window.project = pjc
    null

  projects = ->
    window.projects = pjcs
    null
)
