Generator = require './generator'

module.exports = class EntityGenerator extends Generator
  constructor: ->
    super arguments...

    @argument 'name', required: false

  ensureInput: ->
    unless @name = @arguments[0]
      cb = @async()

      prompts = [
        {
          type: 'input'
          name: 'name'
          message: "Name of #{@kind()}"
          default: ''
        }
      ]
      @prompt prompts, (props) =>
        @name = props.name
        
        cb()

  generateFiles: ->
    return if @name.length == 0

    @view = @name.split('/').last()
    @klass = @view.camelize()
    @namespace = @name.split('/').slice(0, -1).map('camelize').join('.') if @name.has('/')

    @directory @kind(), 'app/javascripts'