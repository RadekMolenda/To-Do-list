class Todo.Models.Task extends Backbone.Model
  dateRegex: /^\d{4}-\d{2}-\d{2}[T ]?\d{2}:\d{2}:\d{2}[Z ]?$/
  initialize: ->
    @on 'error', (model, error)->
      alert error

  validate: (attrs)->
    if attrs.description.length <= 0
      return "Please fill in a description"
    else if attrs.deadline and attrs.deadline.length > 0 and !@dateRegex.test(attrs.deadline)
      return "Deadline should be in right format: YYYY-MM-DD hh:mm:ss"
