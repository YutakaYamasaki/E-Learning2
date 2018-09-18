class LessonsController < ApplicationController
	def create
		@category = Category.find(params[:category_id])
		@lesson = current_user.lessons.build(category: @category)
		if @lesson.save
			redirect_to new_lesson_lesson_word_path(@lesson)
		else
			render root_path
		end
	end
	def index
		
	end
	def show
		@lessons = Lesson.find(params[:id])
		@word = @lessons.lesson_words
		@true = @lessons.word_answers.where(correct: "○")
		@words = @lessons.words
	end
end
