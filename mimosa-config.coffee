exports.config =
  modules: [
    "server"
    "browserify"
    "csslint"
    "jshint"
    "live-reload"
    "bower"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "sass"
    "combine"]
  template:
    nameTransform: (path) ->
      m = path.match /templates?\/(.*)$/
      if m?.length and m.length == 2
        return m[1]
      path = path.split '/'
      return path[path.length - 1]
    wrapType: 'common'
    commonLibPath: 'ember'
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery/jquery'
        exports: '$'
      handlebars:
        path: 'javascripts/vendor/handlebars/handlebars'
        exports: 'Handlebars'
      ember:
        path: 'javascripts/vendor/ember/ember'
        exports: 'Ember'
        depends:
          handlebars: 'Handlebars'
          jquery: '$'
      emberdata:
        path: 'javascripts/vendor/ember-data/ember-data'
        exports: 'DS'
        depends:
          ember: 'Ember'
      bootstrap: 
        path: 'javascripts/vendor/bootstrap/bootstrap'
        exports: 'bootstrap'
        depends:
          jquery: '$'
      lodash:
        path: 'javascripts/vendor/lodash/lodash.compat'
        exports: '_'
        depends:
          jquery: '$'
      serializeJSON:
        exports: null
        path: 'javascripts/vendor/jquery.serializeJSON/jquery.serializeJSON'
        depends:
          jquery: '$'

    noParse:
      [
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
        'javascripts/vendor/ember-data/ember-data'
        'javascripts/vendor/bootstrap/bootstrap'
      ]
  bower:
    copy:
      mainOverrides:
        'bootstrap': [
           "assets/css/bootstrap.sass"
           {'fonts': '../../fonts'}
        ]
  combine:
    folders: [
      {
        folder:'stylesheets'
        output:'stylesheets/style.css'
        order: [
          'vendor/bootstrap/bootstrap.css'
          'app.css'
        ]
      }
    ]