Session = Ember.Object.extend(
  lang: ''
  cookiesAccept: false
  storage: 'cookies'
  user: null
  init: ()->
    @.set('cookiesAccept', @.checkCookieAccept())
    @.set('storage', @.setStorage())
    @.set('lang', @.getLang())
  getLang: ()->
    lang = @.readFromStorage('lang')
    if lang? then lang else @.setLang()
  setLang: (lang="pol")->
    @.set('lang', lang)
    return window.localStorage.setItem("lang", lang)
  acceptCookie: (()->
    expires = new Date()
    expires.setFullYear(expires.getFullYear()+10)
    cookie = "accepted_cookie=true; expires=#{expires.toGMTString()}"
    document.cookie= cookie
    @.set('cookiesAccept', true)
  ).observes('cookiesAccept')
  checkCookieAccept: ()->
    cookies = {}
    cookies_raw = document.cookie
    return false if !cookies_raw?
    cookies_temp = document.cookie.split(';')
    cookies_temp.forEach((data)->
      data = data.split('=')
      cookies[data[0]] = data[1]
      )
    if cookies.accepted_cookie? && cookies.accepted_cookie is "true" then true else false
  setStorage: ()->
    if !window.localStorage then 'cookies' else 'localstorage'
  readFromStorage: (key)->
    switch @.get('storage')
      when 'localstorage'
        return window.localStorage[key]
      when 'cookie'
        console.log "cookie"
  writeToStorage: (key, value)->
)
module.exports = App.Session = new Session
