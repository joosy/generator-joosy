Sugar  = require 'sugar'
Path   = require 'path'
EJS    = require 'ejs'
Yeoman = require 'yeoman-generator'

module.exports = class Generator extends Yeoman.generators.Base
  constructor: (args, options, config) ->
    Yeoman.generators.Base.apply @, arguments

    @sourceRoot Path.join(__dirname, 'node_modules', 'joosy', 'templates')

  banner: ->
    result = "\n"

    result += "        __________________________\n"
    result += "       /_    ____ ____ ____ __ __/\n"
    result += "      __/  /    /    / ___/  /  /\n"
    result += "     / /  / /  /  / /__  /  /  /\n"
    result += "    /____/____/____/____/__   /\n"
    result += "   /_________________________/\n"
    result += "   \n"

  engine: (body, data) ->
    EJS.render body, data

  directory: (source, destination=source) ->
    root  = Path.join(@sourceRoot(), source)
    files = @expandFiles '**', dot: true, cwd: root
    
    files.forEach (originalFilename) =>
      resultingFilename = originalFilename.replace /%[^%]+%/g, (match) =>
        @[match.replace(/%/g, '')]

      if Path.extname(resultingFilename) == '.tt'
        resultingFilename = resultingFilename.replace /\.tt$/, ''
        @template Path.join(root, originalFilename), Path.join(destination, resultingFilename)
      else
        @copy Path.join(root, originalFilename), Path.join(destination, resultingFilename)