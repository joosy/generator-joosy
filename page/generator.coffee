Generator = require '../generator'
Path      = require 'path'

module.exports = class BaseGenerator extends Generator
  constructor: (args, options, config) ->
    super arguments...
    @name = args[0]

  askFor: ->
    unless @name
      cb = @async()

      prompts = [
        {
          type: 'input'
          name: 'name'
          message: 'Name of page'
          default: ''
        }
      ]
      @prompt prompts, (props) =>
        @name = props.name
        
        cb()

  app: ->
    return if @name.length == 0

    @view = @name.split('/').last()
    @klass = @view.camelize()
    @namespace = @name.split('/').slice(0, -1).map('camelize').join('.') if @name.has('/')

    @directory 'page', 'app/javascripts'