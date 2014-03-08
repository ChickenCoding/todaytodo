define [
  "jquery"
  "knockout"
  "moment"
  "store"
], ( ($, ko, Moment, Store) ->
  member = (id, name) ->
    m = @
    m.id = id
    m.name = name
    window.member = m
    null

  memberList = ->
    ml = @
    ml.id = 0
    ml.name = "my group"
    ml.mId = 0
    ml.list = ko.observableArray([
      new member(ml.mId, "John")
    ,
      new member(ml.mId + 1, "Johny")
    ])
    window.memberList = ml
    null
)
