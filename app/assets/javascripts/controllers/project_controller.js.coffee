EmberTodo.ProjectController = Ember.ObjectController.extend
  newTask: ''
  actions:
    createNewTask: ->
      task = @store.createRecord('task',{name: @get('newTask'), project: @content })
      task.save().then (model)=>
        @content.get('tasks').pushObject model
        @set 'newTask', ''