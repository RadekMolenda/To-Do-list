class Todo.Views.TaskCompleted extends Backbone.View
  tagName: "li"
  template: JST['task/completed']

  initialize: ->
    @model.on('change:description', @render, this)
    @model.on('change:completed', @rerender, this)

  render: ->
    @$el.html @template(task: @model)
    this

  events:
    "click .delete"       : "deleteTask"
    "click .not-done"     : "markAsIncompleted"

  deleteTask: (event)->
    @model.destroy()
    @rerender()

  markAsIncompleted: (event)->
    @model.save
      completed: false
      { wait: true }

  rerender: ->
    Todo.TasksIndexView.render()

