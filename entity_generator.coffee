S         = require 'string'
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

    @name  = S(@name).underscore().chompLeft('_')

    @view  = @name.split('/').slice(-1)[0]
    @klass = S(@view).camelize().capitalize()

    if S(@name).include('/')
      @namespace = @name.split('/').slice(0, -1).map(
        (x) -> S(x).camelize().capitalize()
      ).join('.')

    @directory @kind(), 'app/javascripts'