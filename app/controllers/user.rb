get '/user/:user_id' do
  @decks = Deck.all
  erb :choose_deck
end

post '/create_user' do
  @user = User.new(params[:post])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
   erb :index
  end
end

post '/login' do
  user = User.authenticate(params[:post][:username],params[:post][:password])
  if user
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

