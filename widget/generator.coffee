EntityGenerator = require '../entity_generator'

module.exports = class LayoutGenerator extends EntityGenerator
  kind: -> 'widget'
  ensureInput: -> super
  generateFiles: -> super