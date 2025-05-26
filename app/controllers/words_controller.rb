class WordsController < ApplicationController

  def index
  end

  def all
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
<<<<<<< HEAD
=======
    @word.user_id = current_user.id
    @word.File_number = 1
>>>>>>> document
    if @word.save
      redirect_to @word, notice: "単語を保存しました！"
    else
      render 'new'
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to @word
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def word_params
    params.require(:word).permit(:english, :japanese,)
  end

end
