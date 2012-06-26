class Todo.Collections.Tasks extends Backbone.Collection

  model: Todo.Models.Task
  url: "api/tasks"

  completed: ->
    @select (model) ->
      return model.get('completed')

  incompleted: ->
    @select (model) ->
      return !model.get('completed')
