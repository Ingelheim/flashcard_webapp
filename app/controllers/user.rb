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
  
  if user && request.xhr?
    @decks = Deck.all
    session[:user_id] = user.id
    erb :choose_deck
  elsif request.xhr?
    erb :_index
  elsif user
   session[:user_id] = user.id
   redirect "/user/#{user.id}"
  else
    erb :index
  end
end

get '/logout' do
  session.clear
  if request.xhr?
    erb :_index, :layout => false
  else
    erb :index
  end
end

