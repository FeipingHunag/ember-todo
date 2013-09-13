EmberTodo.ProjectsIndexRoute = Ember.Route.extend

  actions:
    delete: (project) ->
      project.deleteRecord()
      project.save()

  model: ->
    @store.find 'project'
