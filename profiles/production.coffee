exports.config =
  browserify:
    shims:
      config:
        exports: 'config'
        path: 'javascripts/config/production'