class WordsController < ApplicationController

  def index
  end

  def all
    @words = Word.where(user_id: current_user.id)
  end

  def play
    all_words = Word.where(user_id: current_user.id)
    @words = all_words.shuffle
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    @word.File_number = 1
    @word.user_id = current_user.id
    if @word.save
      redirect_to new_word_path, notice: "単語を保存しました！"
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
      redirect_to words_all_path
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_all_path
  end

  # メソッド

  def check
    check_word = Word.find(params[:id])
    correct_answer = check_word.english
    guest_answer = params[:answer]

    # 正誤確認
    if correct_answer == guest_answer
      render json:{ message: "正解！　正解:#{correct_answer}",score: 1,num: 1,total_amount: Word.where(user_id: current_user.id).length}
    else
      render json:{ message: "不正解　正解:#{correct_answer}",score: 0,num: 1,total_amount: Word.where(user_id: current_user.id).length}
    end
  end

  private

  def word_params
    params.require(:word).permit(:english, :japanese,)
  end

end
