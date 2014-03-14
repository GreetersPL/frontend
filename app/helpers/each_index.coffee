Handlebars.registerHelper 'each_with_index', (items, opts) ->
  console.log items
  _(items).map((item, i, items) =>
        opts.hash.fn.apply opts, [item, i, items]
        opts.fn(item)
    ).join("")