# ========= GET ================================

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

get '/user/:user_id' do
  @current_user = User.find(session[:user_id])
  erb :user_page
end

get '/logout' do
  session.clear
  redirect to '/'
end

# ==========  POST ==================================

post '/login' do
  user = User.find_by_email(params[:email])

  if user
    user.authenticate(params[:password])
    if user
      session[:user_id] = user.id
      redirect "/user/#{user.id}"
    else
      @error = "Password incorrect"
      erb :index
    end
  else
    @error = "Email not found"
    erb :index
  end
end

post '/create_user' do
  user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], password: params[:password])
  if user.id
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    @error = "Fail"
    redirect '/'
  end
end

post '/create_event' do
  current_user = User.find(session[:user_id])
  event = Event.create(creator_id: current_user.id, name: params[:name], location: params[:location], starts_at: params[:starts_at], ends_at: params[:ends_at])
  redirect "/user/#{current_user.id}"
end





