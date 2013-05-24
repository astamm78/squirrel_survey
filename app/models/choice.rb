class Choice < ActiveRecord::Base
  
  belongs_to :question
  has_many :answers

  validates :value, :presence => :true

end
