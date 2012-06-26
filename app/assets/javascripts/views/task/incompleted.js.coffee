class Todo.Views.TaskIncompleted extends Backbone.View
  tagName: "li"
  template: JST['task/incompleted']
  editTemplate: JST['task/edit_incompleted']

  initialize: ->
    @model.on('change:description', @render, this)
    @model.on('change:deadline', @render, this)
    @model.on('change:completed', @rerender, this)

  render: ->
    @$el.html @template(task: @model)
    this

  rerender: ->
    Todo.TasksIndexView.render()

  deleteTask: (event)->
    @model.destroy()
    @rerender()

  editTask: (event)->
    @$el.html @editTemplate(task: @model)
    this

  updateTask: (event)->
    event.preventDefault()
    @model.save
      description: @$el.find('.edit-description').val()
      { wait: true }
    @render()

  cancelUpdate: (event)->
    event.preventDefault()
    @render()

  markAsDone: (event)->
    @model.save
      completed: true
      { wait: true }

  events:
    "click .description": "editTask"
    "click .save"       : "updateTask"
    "click .cancel"     : "cancelUpdate"
    "click .done"       : "markAsDone"
    "click .delete"     : "deleteTask"
