module.exports = App.ApplicationController = Ember.Controller.extend(
  lang: [
    {val: 'pol', name: "polski"}
    {val: 'eng', name: "english"}
  ]
  actions:
    accept_cookies: ()->
      App.Session.set('cookiesAccept', true)

  cookies: (()->
    return App.Session.get('cookiesAccept')
  ).property()
  cookiesChange: (()->
    @.set('cookies', App.Session.get('cookiesAccept'))
  ).observes('App.Session.cookiesAccept')
  currentPathChanged: (()->
    Ember.run.next(()->
      if _paq?
        page = if window.location.hash.length > 0 then window.location.hash.substring(1) else window.location.pathname
        _paq.push(['trackPageView',page])
    )
  ).observes('currentPath')
)
