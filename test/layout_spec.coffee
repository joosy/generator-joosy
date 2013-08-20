Path    = require('path')
helpers = require('yeoman-generator').test

describe 'Layout', ->
  beforeEach (done) ->
    helpers.testDirectory Path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("joosy:layout", ["../../layout"])
      done()

  describe 'having namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/layouts/test.coffee", "app/javascripts/templates/layouts/test.jst.hamlc"]
        done()

  describe 'having no namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test/test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/layouts/test/test.coffee", "app/javascripts/templates/layouts/test/test.jst.hamlc"]
        done()