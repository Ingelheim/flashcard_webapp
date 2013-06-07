require 'json'
require 'open-uri'
# deck = Deck.create('Urban Dictionary')

# words = %w{hipster vurp smilezoned gloatgram motorpsycho}
dbc_related = { ruby: 1 , hipster: 4, macbook: 0, apple: 2, "steve%20jobs" => 2, bootcamp: 1, rails: 0,  
                javascript: 4, stacks: 0, html: 3, css: 4, sinatra: 1, database: 0, sql: 2,
                "pair%20programming" => 0, aussie: 0}

chicago_related = { "sears%20tower" => 0, cubs: 0, "third%20coast" => 0, awesome: 0, wicked: 2, 
                    tight: 1, chill: 1, sweet: 0, bloke: 2, aussie: 0, "down%20under" => 1,
                    downvote: 0}                

def seed_deck(deck_name)
  deck_name.each do |word, position|
    term = JSON.parse(open("http://api.urbandictionary.com/v0/define?term=#{word}").read)
    word = term["list"].first["word"]
    first_definition = term["list"][position]["definition"]
    redact = "[#{word[0]}#{word[0].upcase}]#{word[1..-1]}" #prepares word for regex in form: [hH]ipster
    redacted_def = first_definition.gsub(/#{redact}/, '**REDACTED**' )

    # Card.create(word: word, definition: redacted_def, deck_id: deck.id)
    puts word
    puts redacted_def
  end
end


