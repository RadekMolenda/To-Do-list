class Todo.Views.TaskCompleted extends Backbone.View
  tagName: "li"
  template: JST['task/completed']

  initialize: ->
    @model.on('change:description', @render, this)
    @model.on('change:completed', @rerender, this)

  render: ->
    @$el.html @template(task: @model)
    this

  rerender: ->
    ($ "#container").html Todo.TasksIndexView.render().el

