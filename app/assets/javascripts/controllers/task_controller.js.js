(function() {
  EmberTodo.TaskController = Ember.ObjectController.extend({
    completedChanged: (function() {
      return this.content.save();
    }).observes('completed')
  });

}).call(this);
