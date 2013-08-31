Path   = require 'path'
FS     = require 'fs'
EJS    = require 'ejs'
Color  = require 'cli-color'
Yeoman = require 'yeoman-generator'
S      = require 'string'

module.exports = class Generator extends Yeoman.generators.Base
  constructor: (args, options, config) ->
    Yeoman.generators.Base.apply @, arguments

    templates = Path.join('node_modules', 'joosy', 'templates')
    meta      = Path.join('node_modules', 'joosy', 'package.json')

    try
      FS.lstatSync templates
      @sourceRoot templates
      @meta = require Path.resolve(meta)
    catch
      @sourceRoot Path.join(__dirname, templates)
      @meta = require Path.join(__dirname, meta)

    @desc @banner()

  banner: ->
    result  = "\n"
    color   = Color.xterm(208)
    version = "Version #{@meta.version}"
    version = S(" ").repeat(34-version.length) + color("Version #{Color.bold @meta.version}")

    result += "#{version}\n"
    result += color "        __________________________\n"
    result += color "       /_    ____ ____ ____ __ __/\n"
    result += color "      __/  /    /    / ___/  /  /\n"
    result += color "     / /  / /  /  / /__  /  /  /\n"
    result += color "    /____/____/____/____/__   /\n"
    result += color "   /_________________________/\n"
    result += color "   \n"

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