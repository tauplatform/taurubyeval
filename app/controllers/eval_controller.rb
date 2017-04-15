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

    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

  	render :json => result  	
  end
end
