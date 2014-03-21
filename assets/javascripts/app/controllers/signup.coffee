require 'serializeJSON'
module.exports = App.SignupController = Ember.Controller.extend
  langs: []
  errors: []
  success: false

  addErrors: (errors)->
    if errors.code is "ER_DUP_ENTRY"
      $("#email").parents('div.form-group').addClass('has-error')
      @.errors.pushObject('Podany adres email już istnieje w naszej bazie!')
      return
    for input, error of errors
      $("##{input}").parents('div.form-group').addClass('has-error')
      inputHuman = switch input
        when 'name' then "Imię"
        when 'age' then "Wiek"
        when 'email' then "Email"
        when 'languages' then "Języki"
        when 'why' then "Czemu zainteresowałeś się projektem?"
        when 'places' then "3 ciekawe miejsca"
      for type in error
        type = type.split(':')[0]
        switch type
          when 'String is empty' then @.errors.pushObject("Pole '#{inputHuman}' nie może być puste!")
          when 'Invalid number' then @.errors.pushObject("Pole '#{inputHuman}' musi zawierać liczbę!")
          when 'Invalid characters' then @.errors.pushObject("Pole '#{inputHuman}' musi zawierać litery!")
          when 'Invalid email' then @.errors.pushObject("Pole '#{inputHuman}' musi zawierać email w formacie: 'login@serwer.domena'!")

    if errors.languages? then
  actions:
    addLang: ()->

      langName = $('#langName').val()
      if langName isnt ''
        newLang = {
          name: langName
          attr: "[languages][#{langName}]"
        }
        @.langs.pushObject(newLang)
      else
        $('#langName').attr('placeholder', "Pole nie może być puste!")
        $("#languages").parents('div.form-group').addClass('has-error')  

      
      $('#langName').val('')
    delLang: (lang)->
      index = _.indexOf(@.langs, lang)
      @.set('langs', @.langs.removeAt(index))

    signup: ()->
      $('div.form-group').removeClass('has-error')
      @.set('errors', [])
      apiURL = App.apiUrl
      form = $('form').serializeJSON()
      post = $.post(apiURL+'/signup', form)
      post.then( (()=>
          @.set('success', true)
        ), ((data)=>
          @.addErrors(data.responseJSON.errors )
      ))
