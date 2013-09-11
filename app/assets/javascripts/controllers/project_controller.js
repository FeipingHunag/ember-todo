EmberTodo.ProjectController = Ember.ObjectController.extend({
  newTask: '',
  actions: {
    createNewTask: function() {
      var task,
        _this = this;
      task = this.store.createRecord('task', {
        name: this.get('newTask'),
        project: this.content
      });
      return task.save().then(function(model) {
        _this.content.get('tasks').pushObject(model);
        return _this.set('newTask', '');
      });
    }
  }
});


