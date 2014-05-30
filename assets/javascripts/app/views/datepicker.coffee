module.exports =  App.DatePickerView = Ember.TextField.extend({
  classNames: ['date-picker', 'form-control'],
  returnDates: ((key, value) ->
      this.set('date', value)
      dates = this.get('date')
  ).property(),
  format: "dd-mm-yyyy",
  placeholder: Ember.computed.alias('format'),
  valueBinding: "returnDates",
  didInsertElement: () ->
    options = {
      format: @.get('format'),
      todayHighlight: true,
      keyboardNavigation: false,
      multidate: true
      
    }

    return @.$().datepicker(options).on('changeDate', (ev) =>
      @.set('chosen_days', ev.dates)
      return @.$().datepicker('setValue', ev.dates);
    );

  close: () ->
    return @.$().datepicker('hide');
});
