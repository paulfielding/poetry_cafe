class Poem < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 4000 }
  validates :user_id, presence: true

  default_scope order: 'poems.created_at DESC'
end
