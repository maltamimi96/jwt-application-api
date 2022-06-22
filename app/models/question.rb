class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def transform_question
    return{
      author: self.user.username,
      category: self.category.name,
      title: self.title,
      body: self.body,
      posted: self.created_at,
      edited: self.updated_at,
      user_id: self.user.id

    }
  end

end
