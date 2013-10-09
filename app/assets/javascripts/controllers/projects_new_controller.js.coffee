EmberTodo.ProjectsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      #https://github.com/emberjs/data/issues/1275
      @get('content').save().then(@onDidCreate.bind(@))

    cancel: ->
      @transitionTo 'projects'
      @get('content').rollback()

  onDidCreate: (project)->
    #fix DS.PromiseArray should be set before modifying it
    @store.push 'project', project.get('data')

    @transitionToRoute 'project', project
