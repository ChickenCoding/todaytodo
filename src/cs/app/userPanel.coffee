define [
  "jquery"
  "knockout"
  "store"
  "moment"
], ( ($, ko, Store, Moment) ->
  currentUser = ->
    if not Store.get("user")
      Store.set "user", name : "guest"
    cU = @
    cU.name = ko.observable(Store.get("user").name or name)
    cU.createdAt = Moment().format("MM DD YYYY hh:mm:ss")
    cU.updatedAt = ko.observable(
      Store.get("user").updatedAt or
      Moment().format("MM DD YYYY hh:mm:ss")
    )

    cU.onChangeName = ->
      cU.updatedAt(Moment().format("MM DD YYYY hh:mm:ss"))
      Store.set("user",{ name : cU.name(), updatedAt : cU.updatedAt() })

    window.currentUser = cU
    null
)
