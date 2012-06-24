class Todo.Views.TasksIncompleted extends Backbone.View
  template: JST['tasks/incompleted']

  render: ->
    element = @$el
    _.each @collection, (model) ->
      view = new Todo.Views.TaskIncompleted
        model: model
      element.append view.render().el
    this
