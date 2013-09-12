EmberTodo.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('projects')
