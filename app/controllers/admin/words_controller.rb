class Admin::WordsController < ApplicationController
	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		3.times{@word.word_answers.build}
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.build(word_params)
		if @word.save
			flash[:succees] = "Create Word."
			redirect_to admin_category_words_path
		else
			render "new"
		end
	end
	
	def index
		@categories = Category.find(params[:category_id])
		@words = @categories.words.paginate(page: params[:page])
	end

	def edit
		@category = Category.find(params[:category_id])
		@word =Word.find(params[:id])
	end

	def update
		@category = Category.find(params[:category_id])
		@word =Word.find(params[:id])
		@word.assign_attributes(word_params)
		if @word.save
			flash[:success] = "Updated uccessfully."
			redirect_to admin_category_words_path
		else
			render "edit"
		end
	end

	def destroy
		@word = Word.find(params[:id])
		if @word.destroy
			flash[:info] = "Removing is successfully."
			redirect_to admin_category_words_path
		end
	end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    def word_params
      params.require(:word).permit(:content, word_answers_attributes: [:id, :content, :correct])
    end
end
