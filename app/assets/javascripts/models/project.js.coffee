# for more details see: http://emberjs.com/guides/models/defining-models/

EmberTodo.Project = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  tasks: DS.hasMany('task', async: true)
