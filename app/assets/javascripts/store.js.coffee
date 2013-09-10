serverAttributeName = (attribute) ->
  attribute.underscore()
serverHasManyName = (name) ->
  "#{serverAttributeName(name.singularize())}_ids"

EmberTodo.ApplicationSerializer = DS.RESTSerializer.extend
  normalize: (type, hash, prop) ->
    normalized = {}
    for key, value of hash
      if key.substr(-3) is '_id'
        normalizedProp = key.slice(0, -3)
      else if key.substr(-4) is '_ids'
         normalizedProp = key.slice(0, -4).pluralize()
      else
        normalizedProp = key
      normalized[normalizedProp.camelize()] = value
    @_super(type, normalized, prop)

  serialize: (record, options) ->
    json = {}
    record.eachAttribute (name) ->
      json[serverAttributeName(name)] = record.get(name)
    record.eachRelationship (name, relationship) ->
      if relationship.kind is 'hasMany'
        json[serverHasManyName(name)] = record.get(name).mapBy('id')
      if relationship.kind is "belongsTo"
        json["#{name.singularize()}_id"] = record.get(name).get('id')
    json
