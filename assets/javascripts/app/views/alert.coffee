module.exports =  App.Alert = Ember.View.extend({
    templateName: 'alert'
    classNames: ['alert', 'alert-dismissable']
    classNameBindings: ['error:alert-danger', 'success:alert-success']
    text: (()->
      return if @.get('type') is "error"
        @.set('error', true)
        switch @.get('code')
            when 'empty'
                switch @.get('key')
                    when 'name' then "Pole imię nie może być puste!"
                    when 'email' then "Pole email nie może być puste!"
                    when 'dates' then "Pole z datami nie może być puste!"
                    when 'hourFrom' then "Pole z godziną początkową nie może być puste!"
                    when 'hourTo' then "Pole z godziną końcową nie może być puste!"
                    when 'languages' then "Musisz zaznaczyć choć jeden język!"
            when 'format'
                 switch @.get('key')
                    when 'name' then "Pole imię nie może zawierać liczb!"
                    when 'email' then "Pole email musi zawierać email!"
                    when 'dates' then "Pole z datami może zawierać daty tylko w formacie DD-MM-YYYY!"
                    when 'hourFrom', 'hourTo' then "Pole z godzinami musi mieć format HH:MM!"
            when 'connection'
                 switch @.get('key')
                    when 'server' then "Przykro nam ale nastąpił problem z połączniem z serwerem, spróbuj jeszcze raz, jeśli problem będzie się powtarzał to prosimy o zgłoszenie do naszego <a href='mailto:it@greeters.pl'>działu it</a>."
      if @.get('type') is "success"
        @.set('success', true)

        switch @.get('code')
          when 'success'
            switch @.get('key')
              when 'walk' then "Zgłoszenie zostało wysłane, niedługo ktoś się skontaktuje!"
    ).property()

    })
