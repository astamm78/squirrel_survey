get '/' do
  @surveys = Survey.all
  erb :index
end

get '/survey/new' do
  erb :new_survey
end

post '/survey/new' do
  p params.inspect

  @survey = Survey.new(:author_id => current_user.id, :title => params[:title])
  # if params[:image] != nil
    @survey.image = params[:image]
  # end
  @survey.save
  redirect to "/survey/#{@survey.id}/new_question"
end

get '/survey/:survey_id/new_question' do
  @survey = Survey.find(params[:survey_id])
  erb :new_question
end

post '/survey/:survey_id/new_question' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.create(:question => params[:question], :survey_id => @survey.id)
  params[:choice].each do |k , v|
    Choice.create(:value => v, :question_id => @question.id)
  end
  erb :new_question
end

post '/survey/response' do
  @session = Session.new(:user_id => current_user.id, :survey_id => params[:survey_id])
  @session.save
  params[:question].each do |choice|
    Answer.create(:session_id => @session.id, :choice_id => choice[1]["choice"])
  end
  @answer = Answer.new(:choice_id => params[:choice_id], :session_id => @session.id)
  @answer.save
  redirect to '/'
end

get '/survey/:id' do
  @survey = Survey.find_by_id(params[:id])
  erb :survey
end

get '/survey/:id/summary' do
  @survey = Survey.find_by_id(params[:id])
  erb :survey_summary
end
