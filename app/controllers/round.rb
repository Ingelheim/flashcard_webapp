post '/answer_card' do 
  #expecting from form: :round_id, :answer, :card_id, :counter
  prior_count = params[:post][:counter].to_i
  prior_card = Card.find_by_id(params[:post][:card_id].to_i)

  @round = Round.find_by_id(params[:post][:round_id].to_i) 
  @guess = Guess.check(params[:post][:answer], prior_card, @round)
  @messengerx = "Correct" if @guess.correct
  @messengerx = "Correct...NOT!" if !@guess.correct
  
  if prior_count > 8 # set_current_cards.length
    # num = rand(set_current_cards.size)
    num = prior_count - 1
    @current_card = set_current_cards[num]
    @answer_array = current_deck.answer_array(@current_card)
    @counter = prior_count - 1
    # if request.xhr?
      erb :game_page
    # else
      # erb :game_page
    # end
  else 
    # if request.xhr?
    #   "Hi"
      # erb :stats_page
    # else

      redirect "/stats_page/#{@round.id}"
  
  end
  # redirect "/stats_page/#{@round.id}"
end

get '/open_deck/:deck_id' do
  deck = Deck.find_by_id(params[:deck_id])
  session[:deck_id] = deck.id
  @round = Round.create(deck_id: deck.id, user_id: current_user.id)
  @current_card = set_current_cards.first  #@game_deck.pop
  @answer_array = current_deck.answer_array(@current_card)
  @counter = set_current_cards.length
  # p @counter
  # if request.xhr?
  
    # erb :_game_page
  # else
  
    erb :game_page
  # end
end

get '/stats_page/:round_id' do
  @round = Round.find_by_id(params[:round_id])
  @total_questions =  @round.guesses.map {|guess| guess.correct}.count
   @correct_answers = 0
  @round.guesses.each do |guess|
    @correct_answers += 1 if guess.correct
  end
  p @round.inspect
  p @total_questions.inspect
  p @correct_answers.inspect
  # if request.xhr?
    erb :_stats, :layout => false
  # else
    # erb :stats_page
  # end
end

get '/user_page' do 
  # if request.xhr?
    # erb :_user_page, :layout => false
  # end
  erb :user_page
end


# if request.xhr?
#   erb :_question
# else
#   erb :game_page
# end

