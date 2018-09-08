class WordAnswer < ApplicationRecord
  belongs_to :word
  # has_many :lesson_words

  validates :content, {presence: true, uniqueness: true, length: {maximum: 30 }}
  
end
