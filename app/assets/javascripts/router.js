(function() {
  EmberTodo.Router.reopen({
    location: 'history'
  });

  EmberTodo.Router.map(function() {
    this.resource('projects');
    return this.resource('project', {
      path: 'projects/:project_id'
    });
  });

}).call(this);
