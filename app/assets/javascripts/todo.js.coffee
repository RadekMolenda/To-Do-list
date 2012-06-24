window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Todo.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  Todo.init()
