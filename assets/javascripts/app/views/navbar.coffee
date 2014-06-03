module.exports = App.NavbarView = Ember.View.extend
  templateName: 'navbar'
  classNames: ["navigation"]
  actions: 
    collapse: (e)->
      $(e).collapse('toggle')
