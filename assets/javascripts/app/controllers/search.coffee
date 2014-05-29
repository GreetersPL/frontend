module.exports = App.SearchController = Ember.Controller.extend(
  isProcessing: false
  success: false
  errors: []
  validateForm: ()->
    values = @.getProperties('name', 'email', 'dates', 'hourFrom', 'hourTo','languages', 'other')
    @.set('errors',  [])
    for input, value of values
      errors_val= {
          key: input
          code: []
        }
      if !(value? && value.length > 0) && input !='other'
        errors_val.code.pushObject 'empty'
      else
        switch input
          when 'name'
            length = value.length < 3
            value = value.match(/\d+/g)
            if value? || length then errors_val.code.pushObject 'format'
          when 'email'
            value = value.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
            if !value then errors_val.code.pushObject 'format'
          when 'dates'
            dates = value.split(',')
            for date in dates
              date = date.match(/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/)
              if !date then errors_val.code.pushObject 'format'
          when 'hourFrom', 'hourTo'
            value = value.match(/([01]?[0-9]|2[0-4]):[0-5][0-9]/)
            if !value then errors_val.code.pushObject 'format'
      @.errors.pushObject(errors_val) if errors_val.code.length > 0
    errors = @.get('errors')
    return if errors.length > 0 then false else true
  actions:
    submitForm: ()->
      @.set('isProcessing', true)
      if @.validateForm() is true
        options = @.getProperties('name', 'email', 'dates','hourFrom', 'hourTo', 'other')
        languages = @.get('languages')
        options.userLang = App.Session.get('lang')
        options.languages = ''
        languages.forEach((lang)->
          options.languages += "#{lang.val},"
        )
        options.languages = options.languages.substring(0, options.languages.length - 1);
        request = $.post("#{App.apiUrl}/walk", options)
        request.then( ((data)=>
            @.set('success',true)
            @.set('isProcessing', false)
          ),(data)=>
          @.errors.pushObject({
              key: 'server'
              code: ['connection']
            })
          @.set('isProcessing', false)
        )
      else
        @.set('isProcessing', false)

  langsAvalaible: [
    {
      val: "pol"
      pol: "Polski"
    }
    {
      val: "eng"
      pol: "Angielski"
    }
    {
      val: "ger"
      pol: "Niemiecki"
    }
    {
      val: "rus"
      pol: "Rosyjski"
    }
  ]
)
