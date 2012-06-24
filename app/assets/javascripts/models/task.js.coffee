class Todo.Models.Task extends Backbone.Model
  initialize: ->
    @on 'error', (model, error)->
      alert error

  validate: (attrs)->
    if attrs.description.length <= 0
      return "Please fill in a description"
