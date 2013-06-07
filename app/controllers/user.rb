get '/user/:user_id' do
  erb :game_page
end

post '/create_user' do
  user = User.new(params[:post])
  if user.save
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
   erb :index
  end
end



post '/login' do
  if User.authenticate(email,password)
   session[:user_id] = user.id
   redirect "/user/#{user.id}"
  else
    erb :index
  end
end

get '/logout' do
  session.clear
  erb :index
end

