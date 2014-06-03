exports.config =
  modules: [
    "server-template-compile"
    "server"
    "browserify"
    "csslint"
    "jshint"
    "live-reload"
    "sprite"
    "bower"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "sass"
    "combine"
    "minify-js"
    "minify-css"
    "import-source"
    
  ]
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
        path: 'javascripts/vendor/bootstrap-sass-official/bootstrap'
        exports: 'bootstrap'
        depends:
          jquery: '$'
      lodash:
        path: 'javascripts/vendor/lodash/lodash.compat'
        exports: '_'
        depends:
          jquery: '$'
      datepicker:
        path: 'javascripts/vendor/bootstrap-sass-datepicker/bootstrap-sass-datepicker'
        exports: null
        depends:
          jquery: '$'
      serializeJSON:
        exports: null
        path: 'javascripts/vendor/jquery.serializeJSON/jquery.serializejson'
        depends:
          jquery: '$'
      config:
        exports: 'config'
        path: 'javascripts/config'

    noParse:
      [
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
        'javascripts/vendor/ember-data/ember-data'
        'javascripts/vendor/bootstrap-sass-official/bootstrap'
      ]
  importSource:
    copy: [
      from: "config/development.coffee"
      to: "assets/javascripts/config.coffee"
    ]
  combine:
    folders: [
        folder: 'javascripts/vendor/bootstrap-sass-official'
        output: 'javascripts/vendor/bootstrap-sass-official/bootstrap.js'
        order: [
          'affix.js',
          'alert.js',
          'button.js',
          'carousel.js',
          'collapse.js',
          'dropdown.js',
          'tab.js',
          'transition.js',
          'scrollspy.js',
          'modal.js',
          'tooltip.js',
          'popover.js'
        ]
      ]
  bower:
    copy:
      mainOverrides:
        'bootstrap-sass-official': [
           {'vendor/assets/stylesheets/bootstrap': './bootstrap-sass-official'}
           {'vendor/assets/javascripts/bootstrap': './bootstrap-sass-official'}
           {'vendor/assets/fonts': '../../fonts'}
        ],
  csslint:
    compiled: false
  sass:
    includePaths: [
      'assets/images/'
    ]
      
