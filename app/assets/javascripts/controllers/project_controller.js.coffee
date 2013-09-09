EmberTodo.ProjectController = Ember.ObjectController.extend
  newTask: ''
  actions:
    createNewTask: ->
      task = @store.createRecord('task',{name: @get('newTask'), project: @content })
      task.save().then =>
        @content.get('tasks').pushObject task
        @set 'newTask', ''