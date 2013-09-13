EmberTodo.ProjectsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'project'

  actions:
    save: ->
      @currentModel.save().then (project)=>
        #fix DS.PromiseArray should be set before modifying it
        @store.push 'project', project.get('data')

        @transitionTo 'project', project
      , (resp)=>
        @currentModel.set 'errors', resp.responseJSON.errors

    cancel: ->
      @transitionTo 'projects'

  deactivate: ->
    unless @currentModel.get('isSaving')
      @currentModel.rollback()