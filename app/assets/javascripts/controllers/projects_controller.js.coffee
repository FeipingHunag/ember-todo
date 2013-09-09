EmberTodo.ProjectsController = Ember.ArrayController.extend
  newProjectName: ''
  newProjectDescription: ''
  isNewing: false
  actions:
    showNewForm: ->
      @set 'isNewing', true

    cancel: ->
      @clear()

    createNewProject: ->
      project = @store.createRecord 'project', name: @get('newProjectName'), description: @get('newProjectDescription')
      project.save().then =>
        @clear()
        @content.pushObject project
  clear: ->
    @set 'isNewing', false
    @set 'newProjectName', ''
    @set 'newProjectDescription', ''

