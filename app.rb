require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/fav_things')

get('/') do
  @list = Item.order()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"]
  item = Item.new(name, rank)

  if (item.validate?)
    item.save()
  end
  if (item.update?)
    item.update()
  end
  @list = Item.order()
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
