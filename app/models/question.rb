class Question < ActiveRecord::Base
  
  belongs_to :survey
  has_many :choices

  validates :question, :presence => :true

end
