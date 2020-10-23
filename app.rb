require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    # text_from_user = params[:user_text]
    # @analyzed_text = TextAnalyzer.new(text_from_user)
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @counter = @analyzed_text.count_of_words
    @vowels =  @analyzed_text.count_of_vowels.to_s
    @consonants = @analyzed_text.count_of_consonants
    erb :results
  end
end
