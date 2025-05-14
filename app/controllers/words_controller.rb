class WordsController < ApplicationController
  def index
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to @word, notice: "単語が作成されました！"
    else
      render :new
    end
  end

  private
  def word_params
    params.require(:word).permit(:english, :japanese)
  end
end
