class Todo.Views.TasksCompleted extends Backbone.View
  template: JST['tasks/completed']

  render: ->
    element = @$el
    _.each @collection, (model) ->
      view = new Todo.Views.TaskCompleted
        model: model
      element.append view.render().el
    this
