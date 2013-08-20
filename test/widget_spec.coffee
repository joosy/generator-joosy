Path    = require('path')
helpers = require('yeoman-generator').test

describe 'Layout', ->
  beforeEach (done) ->
    helpers.testDirectory Path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("joosy:widget", ["../../widget"])
      done()

  describe 'having namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/widgets/test.coffee", "app/javascripts/templates/widgets/test.jst.hamlc"]
        done()

  describe 'having no namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test/test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/widgets/test/test.coffee", "app/javascripts/templates/widgets/test/test.jst.hamlc"]
        done()