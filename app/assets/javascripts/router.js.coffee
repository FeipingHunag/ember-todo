EmberTodo.Router.reopen
  location: 'history'

EmberTodo.Router.map ()->
  @resource 'projects'
  @resource 'project', path: 'projects/:project_id'

