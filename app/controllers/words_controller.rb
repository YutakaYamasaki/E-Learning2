class WordsController < ApplicationController
  def index
	@user = current_user
  	@lesson_words = current_user.lesson_words.paginate(page: params[:page])
  end

end
