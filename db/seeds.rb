Project.create [
  {name: 'Project one', description: 'description one'},
  {name: 'Project two', description: 'description two'},
  {name: 'Project three', description: 'description three'}
]

project = Project.first

project.tasks.create [
  {name: 'task one', completed: false},
  {name: 'task two', completed: true},
  {name: 'task three', completed: false}
]