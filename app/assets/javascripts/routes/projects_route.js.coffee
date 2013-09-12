EmberTodo.ProjectsIndexRoute = Ember.Route.extend

  actions:
    delete: (project) ->
      project.deleteRecord()

  model: ->
    @store.find 'project'
