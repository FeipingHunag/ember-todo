var serverAttributeName, serverHasManyName;

serverAttributeName = function(attribute) {
  return attribute.underscore();
};

serverHasManyName = function(name) {
  return "" + (serverAttributeName(name.singularize())) + "_ids";
};

EmberTodo.ApplicationSerializer = DS.RESTSerializer.extend({
  normalize: function(type, hash, prop) {
    var key, normalized, normalizedProp, value;
    normalized = {};
    for (key in hash) {
      value = hash[key];
      if (key.substr(-3) === '_id') {
        normalizedProp = key.slice(0, -3);
      } else if (key.substr(-4) === '_ids') {
        normalizedProp = key.slice(0, -4).pluralize();
      } else {
        normalizedProp = key;
      }
      normalized[normalizedProp.camelize()] = value;
    }
    return this._super(type, normalized, prop);
  },
  serialize: function(record, options) {
    var json;
    json = {};
    record.eachAttribute(function(name) {
      return json[serverAttributeName(name)] = record.get(name);
    });
    record.eachRelationship(function(name, relationship) {
      if (relationship.kind === 'hasMany') {
        json[serverHasManyName(name)] = record.get(name).mapBy('id');
      }
      if (relationship.kind === "belongsTo") {
        return json["" + (name.singularize()) + "_id"] = record.get(name).get('id');
      }
    });
    return json;
  }
});


