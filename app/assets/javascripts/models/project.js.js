(function() {
  EmberTodo.Project = DS.Model.extend({
    name: DS.attr('string'),
    description: DS.attr('string'),
    tasks: DS.hasMany('task', {
      async: true
    })
  });

}).call(this);
