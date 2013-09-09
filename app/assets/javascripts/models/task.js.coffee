# for more details see: http://emberjs.com/guides/models/defining-models/

EmberTodo.Task = DS.Model.extend
  name: DS.attr 'string'
  completed: DS.attr 'boolean'
  project: DS.belongsTo('project')