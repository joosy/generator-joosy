Path    = require('path')
helpers = require('yeoman-generator').test

describe 'App', ->
  beforeEach (done) ->
    helpers.testDirectory Path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("joosy:app", ["../../app"])
      done()

  it "creates expected files", (done) ->
    helpers.mockPrompt @app,
      subdir: ''
      html5: true

    @app.options["skip-install"] = true

    @app.run {}, ->
      helpers.assertFiles ["Gruntfile.coffee", "app/javascripts/application.coffee"]
      done()