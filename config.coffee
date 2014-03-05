exports.config =
  server:
    port: 3000
  files:
    javascripts:
      joinTo:
        'js/app.js': /^(app)/
        'js/vendor.js' :  /^(vendor|bower_components)/

    stylesheets:
      joinTo: 'css/app.css'

    templates: 
      precompile: true
      root: 'templates'
      joinTo: 
        'js/app.js': /^app/
  plugins:
    autoReload:
      enabled:
        js: on
        css: on
        assets: off

    imageoptimizer:
      path: 'images'
      smushit: no

    coffeelint:
      pattern: /^app\/.*\.coffee$/
      options:
        indentation:
          value: 4
          level: "error"
        max_line_length:
          value: 80
          level: "error"

  conventions:
    assets: /(assets|font)/