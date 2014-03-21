module.exports = App.ApplicationController = Ember.Controller.extend
  currentPathChanged: (()->
    Ember.run.next(()->
      if _paq?
        page = if window.location.hash.length > 0 then window.location.hash.substring(1) else window.location.pathname
        _paq.push(['trackPageView',page])
    )
  ).observes('currentPath')