class EvalController < ApplicationController
  protect_from_forgery with: :null_session

  def index

  	puts ">>>>>>>>>>>> EVALUATING"

  	result = {}

  	begin
  		result['output'] = eval(request.body.read)
  	rescue Exception => e
  		result['error'] = e.to_s
  	end

  	render :json => result  	
  end
end
