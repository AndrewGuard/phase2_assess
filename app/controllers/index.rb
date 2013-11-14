get '/' do
  erb :index
end

get '/things' do

end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end

post '/validate_user' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])

  if user
    session[:id] = @user.id
    redirect '/'
  else
    erb :index
  end
end

post '/create_user' do
  @user = User.create params[:create_user]

  if @user.valid?
    session[:id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end
end

# (first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], password_digest: params[:password_digest])





