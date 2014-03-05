module.exports = App.NavbarView = Ember.View.extend
  templateName: 'navbar'
  classNames: ['col-xs-12', 'navbar', 'navbar-default']
  actions: 
    collapse: (e)->
      $(e).collapse('toggle')
