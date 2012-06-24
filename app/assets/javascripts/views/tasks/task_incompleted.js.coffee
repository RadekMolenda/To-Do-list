class Todo.Views.TaskIncompleted extends Backbone.View
  template: JST['task/incompleted']

  initialize: ->
    @model.on('change:description', @render, this)
    @model.on('change:completed', @rerender, this)

  render: ->
    @$el.html @template(task: @model)
    this

  rerender: ->
    ($ "#container").html Todo.TasksIndexView.render().el

