EmberTodo.Router.reopen({
  location: 'history'
});

EmberTodo.Router.map(function(){
  this.resource('projects');
  this.resource('project', {
    path: 'projects/:project_id'
  });
});


