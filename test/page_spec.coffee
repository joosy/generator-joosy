Path    = require('path')
helpers = require('yeoman-generator').test

describe 'Layout', ->
  beforeEach (done) ->
    helpers.testDirectory Path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("joosy:page", ["../../page"])
      done()

  describe 'having namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/pages/test.coffee", "app/javascripts/templates/pages/test.jst.hamlc"]
        done()

  describe 'having no namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test/test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/pages/test/test.coffee", "app/javascripts/templates/pages/test/test.jst.hamlc"]
        done()