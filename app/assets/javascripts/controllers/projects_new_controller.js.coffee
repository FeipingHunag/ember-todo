EmberTodo.ProjectsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      #https://github.com/emberjs/data/issues/1275
      @get('content').save().then(@onDidCreate.bind(@), @onError.bind(@))

    cancel: ->
      @transitionTo 'projects'
      @get('content').rollback()

  onDidCreate: (project)->
    #fix DS.PromiseArray should be set before modifying it
    @store.push 'project', project.get('data')

    @transitionToRoute 'project', project

  onError: (error) ->
    if Ember.isEqual(error.status, 422)
      @get('content').set 'errors', error.responseJSON.errors
    else
      alert("Validation error occured - #{error.responseText}")