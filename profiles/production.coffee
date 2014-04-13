exports.config =
  modules: [
    "server-template-compile"
    "server"
    "browserify"
    "bower"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "sass"
    "combine"
    "minify-js"
    "minify-css"
    "live-reload"
    "import-source"
  ]

  coffeescript:
      sourceMap: false
      sourceMapDynamic: false
      options:
        sourceMap:false
  importSource:
    copy: [
      from: "config/production.coffee"
      to: "assets/javascripts/config.coffee"
    ]
  
  
  bower:
    copy:
      mainOverrides:
          "ember": [
            {'./ember.prod.js': './ember/ember.js'}
          ]
          "ember-data": [
            {'./ember-data.prod.js': './ember-data/ember-data.js'}
          ]
      
  serverTemplate:
    views:[{
      path: "index.jade"
      locals:
        facebook: true
        piwik: true
      }]