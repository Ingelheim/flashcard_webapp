post '/answer_card' do 
  #expecting from form: :round_id, :answer, :card_id, :counter
  prior_count = params[:post][:counter].to_i
  prior_card = Card.find_by_id(params[:post][:card_id].to_i)

  @round = Round.find_by_id(params[:post][:round_id].to_i) 
  if prior_count > 0 # set_current_cards.length
    @guess = Guess.check(params[:post][:answer], prior_card, @round)
    num = rand(set_current_cards.size)
    @current_card = set_current_cards[num]
    @answer_array = current_deck.answer_array(@current_card)
    @counter = prior_count - 1
    erb :game_page
  else 
    @guess = Guess.check(params[:post][:answer], prior_card, @round)
    redirect "/stats_page/#{@round.id}"
  end
end


get '/open_deck/:deck_id' do
  deck = Deck.find_by_id(params[:deck_id])
  session[:deck_id] = deck.id
  @round = Round.create(deck_id: deck.id, user_id: current_user.id)
  @current_card = set_current_cards.first  #@game_deck.pop
  @answer_array = current_deck.answer_array(@current_card)
  @counter = set_current_cards.length
  p @counter
  erb :game_page
end

get '/stats_page/:round_id' do
  @round = Round.find_by_id(params[:round_id])
  erb :stats_page
end



