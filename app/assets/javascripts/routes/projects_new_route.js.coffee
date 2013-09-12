EmberTodo.ProjectsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'project'
