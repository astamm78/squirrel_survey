class Answer < ActiveRecord::Base
  
  belongs_to :session
  belongs_to :choice

end
