class Todo.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
  initialize: ->
    @collection = new Todo.Collections.Tasks();
    @collection.fetch()
    window.tasks = @collection
  index: ->
    Todo.TasksIndexView = new Todo.Views.TasksIndex
      collection: @collection
    ($ "#container").html Todo.TasksIndexView.render().el
