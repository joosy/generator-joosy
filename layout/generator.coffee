EntityGenerator = require '../entity_generator'

module.exports = class LayoutGenerator extends EntityGenerator
  kind: -> 'layout'
  ensureInput: -> super
  generateFiles: -> super