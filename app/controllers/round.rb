post '/answer_card' do 
  #expecting from form: :round_id, :answer, :card_id

  @round = Round.find_by_id(params[:round_id])

  if current_deck.cards.count > 0
    prior_card = Card.find_by_id(params[:card_id])
    @guess = Guess.check(params[:answer], prior_card, @round)
    @current_card = Deck.cards.shuffle.shift 
    erb :game_page

  else 
    @guess = Guess.check(params[:answer], prior_card, @round)
    redirect "/stats_page/#{@round.id}"
  end
  
end


get '/open_deck/:deck_id' do
  deck = Deck.find_by_id(params[:deck_id])
  session[:deck_id] = deck.id
  @round = Round.create(deck_id: deck.id, user_id: current_user.id)
  @current_card = current_deck.cards.shuffle.shift 

  erb :game_page
end


get '/stats_page/:round_id' do
  @round = Round.find_by_id(params[:round_id])
  erb :stats_page
end



