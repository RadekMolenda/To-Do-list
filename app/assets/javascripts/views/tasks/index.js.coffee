class Todo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    @$el.html @template()
    @renderIncompletedTasks()
    @renderCompletedTasks()
    this

  renderIncompletedTasks: ->
    view = new Todo.Views.TasksIncompleted
      el: @$el.find('#incompleted')
      collection: @collection.incompleted()
    view.render()

  renderCompletedTasks: ->
    view = new Todo.Views.TasksCompleted
      el: @$el.find('#completed')
      collection: @collection.completed()
    view.render()
