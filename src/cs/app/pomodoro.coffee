define [
  "jquery"
  "knockout"
  "moment"
], ( ($, ko, Moment) ->
  pomodoro = (number, idTask) ->
    p = @
    p.id = 0
    p.number = number
    p.taskId = idTask
    hello = ->
      console.log "world"
    window.pomodoro = p
    null
)
