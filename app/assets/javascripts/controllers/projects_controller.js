(function() {
  EmberTodo.ProjectsController = Ember.ArrayController.extend({
    newProjectName: '',
    newProjectDescription: '',
    isNewing: false,
    actions: {
      showNewForm: function() {
        return this.set('isNewing', true);
      },
      cancel: function() {
        return this.clear();
      },
      createNewProject: function() {
        var project,
          _this = this;
        project = this.store.createRecord('project', {
          name: this.get('newProjectName'),
          description: this.get('newProjectDescription')
        });
        return project.save().then(function(model) {
          _this.clear();
          _this.store.push('project', model.get('data'));
          return _this.transitionToRoute('project', model);
        });
      },
      deleteProject: function(project) {
        project.deleteRecord();
        return project.save();
      }
    },
    clear: function() {
      this.set('isNewing', false);
      this.set('newProjectName', '');
      return this.set('newProjectDescription', '');
    }
  });

}).call(this);
