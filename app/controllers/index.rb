get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end
