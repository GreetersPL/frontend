exports.config =
  browserify:
    shims:
      config:
        exports: 'config'
        path: 'javascripts/config/production'
  coffeescript:
    options:
      sourceMap: false