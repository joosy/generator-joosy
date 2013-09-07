Generator = require '../generator'
Path      = require 'path'

module.exports = class BaseGenerator extends Generator
  constructor: (args, options, config) ->
    super arguments...

    @joosy        = "latest"
    @dependencies = """
                    #= require jquery/jquery.js
                    #= require joosy
                    #= require joosy/resources
                    #= require sugar/release/sugar.min.js
                    """

    @on 'end', => @installDependencies(skipInstall: options['skip-install'])

  configure: ->
    cb = @async()
    
    console.log @banner()

    prompts = [
      {
        type: "input"
        name: "subdir"
        message: "Create subdirectory (leave empty to generate in #{process.cwd()})"
        default: ""
      },
      {
        type: "confirm"
        name: "html5"
        message: "Enable HTML5 routing?"
        default: true
      }
    ]
    @prompt prompts, (props) =>
      @subdir = props.subdir
      @html5  = props.html5
      
      cb()

  generateFiles: ->
    @directory "environment", @subdir
    @directory "application", Path.join(@subdir, "app/javascripts")