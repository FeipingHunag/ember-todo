EmberTodo.Router.reopen
  location: 'history'

EmberTodo.Router.map ()->
  @resource 'projects', ->
    @route 'new'
  @resource 'project', path: 'projects/:project_id'

