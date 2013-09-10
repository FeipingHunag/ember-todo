(function() {
  EmberTodo.ProjectsRoute = Ember.Route.extend({
    model: function() {
      return this.store.find('project');
    }
  });

}).call(this);
