EntityGenerator = require '../entity_generator'

module.exports = class LayoutGenerator extends EntityGenerator
  kind: -> 'page'
  ensureInput: -> super
  generateFiles: -> super