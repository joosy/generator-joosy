EntityGenerator = require '../entity_generator'

module.exports = class ResourceGenerator extends EntityGenerator
  kind: -> 'resource'
  ensureInput: -> super
  generateFiles: -> super