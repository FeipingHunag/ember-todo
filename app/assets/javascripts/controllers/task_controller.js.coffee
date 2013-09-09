EmberTodo.TaskController = Ember.ObjectController.extend
  completedChanged: (->
    @content.save()
  ).observes('completed')