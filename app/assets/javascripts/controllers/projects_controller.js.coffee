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
      project.save().then (model)=>
        @clear()
        @store.push 'project', model.get('data')
        @transitionToRoute 'project', model

    deleteProject: (project) ->
      project.deleteRecord()
      project.save()
  clear: ->
    @set 'isNewing', false
    @set 'newProjectName', ''
    @set 'newProjectDescription', ''

