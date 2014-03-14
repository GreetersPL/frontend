Handlebars.registerHelper('is_odd', (conditional, options) ->
   console.log(conditional, options)
   if ((conditional % 2) == 0) then return true else false
);