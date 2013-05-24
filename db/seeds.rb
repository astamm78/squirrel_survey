10.times do |id|
  User.create(:username => Faker::Name.name, :password => "password")
  Survey.create(:author_id => id + 1, :title => Faker::Lorem.words(num = 2, supplemental = false).join(" "))
  Question.create(:survey_id => id + 1, :question => Faker::Lorem.words(num = 5, supplemental = false).join(" ") + "?")
  Choice.create(:question_id => id + 1, :value => Faker::Lorem.word)
  Choice.create(:question_id => id + 1, :value => Faker::Lorem.word)
  Session.create(:user_id => (1..10).to_a.sample, :survey_id => (1..10).to_a.sample)
  Answer.create(:choice_id => id + 1, :session_id => (1..10).to_a.sample)
end
