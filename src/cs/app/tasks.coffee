define [
  "jquery"
  "knockout"
  "moment"
  "store"
  "pomodoro"
  "members"
], ( ($, ko, Moment, Store, pomodoro, members) ->
  task = (id, name, pom) ->
    t = @
    t.id = id
    t.name = ko.observable name
    t.createdAt = Moment().format("MM-DD-YYYY hh:mm:ss")
    t.updatedAt = ko.observable(Moment().format("MM-DD-YYYY hh:mm:ss"))
    t.pomodoro = ko.observable(new pomodoro(pom, t.id).number)
    t.taskers = ko.observableArray([ new members() ])
    t.onUpdate = ->
      t.updatedAt(Moment().format("MM-DD-YYYY hh:mm:ss"))
    window.task = t
    null

  taskList = ->
    tl = @
    tl.id = 0
    tl.name = "my tasklist"
    tl.totalTaskers = 0
    tl.tId = 0
    tl.list = ko.observableArray([
      new task(tl.tId, "mytask", 3)
    ,
      new task(tl.tId + 1, "mytask2", 4)
    ])

    tl.totalPomodoros = ko.computed 
      read: ->
        totalPomodoros = 0
        for task in tl.list()
          totalPomodoros += parseInt(task.pomodoro())
        return totalPomodoros
      write : ->
        totalPomodoros = 0
        for task in tl.list()
          totalPomodoros += parseInt(task.pomodoro())
        return totalPomodoros
      owner : tl

    # add total taskers
    tl.totalTaskers = ko.computed
      read : ->
        totalTaskers = 0
        for taskers in task.taskers()
          for tasker in  taskers.list()
            totalTaskers +=1
        return totalTaskers
      write : ->
        totalTaskers = 0
        for taskers in task.taskers()
          for tasker in  taskers.list()
            totalTaskers +=1
        return totalTaskers
      owner : tl
    
    
    window.taskList = tl
    null
)
